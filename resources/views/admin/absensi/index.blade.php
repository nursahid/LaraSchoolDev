@extends('layouts.admin')

@section('page-title', 'Absensi Siswa')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Absensi</li>
@endsection

@section('content')
<div class="space-y-5">
    {{-- Rekap Hari Ini --}}
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        @foreach(['hadir'=>['Hadir','green','check-circle'], 'sakit'=>['Sakit','yellow','procedures'], 'izin'=>['Izin','blue','file-alt'], 'alpha'=>['Alpha','red','times-circle']] as $key=>$info)
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="w-10 h-10 bg-{{ $info[1] }}-500/20 rounded-xl flex items-center justify-center mx-auto mb-2">
                <i class="fas fa-{{ $info[2] }} text-{{ $info[1] }}-400"></i>
            </div>
            <div class="text-2xl font-bold text-white">{{ $rekap[$key] ?? 0 }}</div>
            <div class="text-xs text-indigo-300 mt-1">{{ $info[0] }} Hari Ini</div>
        </div>
        @endforeach
    </div>

    {{-- Filter & Link Laporan --}}
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap">
            <input type="date" name="tgl" value="{{ request('tgl', date('Y-m-d')) }}"
                class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Kelas</option>
                @foreach($kelasList as $k)
                <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                @endforeach
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-filter mr-1"></i>Filter
            </button>
        </form>
        <a href="{{ route('admin.absensi.laporan') }}" class="bg-emerald-600/80 hover:bg-emerald-600 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-chart-bar mr-1"></i>Laporan
        </a>
    </div>

    {{-- Table --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3">Kelas</th>
                        <th class="px-4 py-3">Tanggal</th>
                        <th class="px-4 py-3 text-center">Keterangan</th>
                        <th class="px-4 py-3">Ket. Detail</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($absensiList as $i => $a)
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-indigo-300">{{ $absensiList->firstItem() + $i }}</td>
                        <td class="px-4 py-2.5">
                            <div class="text-white">{{ $a->nama_siswa }}</div>
                            <div class="text-indigo-400 text-xs font-mono">{{ $a->nis }}</div>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-200">{{ $a->nama_kelas ?? '-' }}</td>
                        <td class="px-4 py-2.5 text-indigo-200 text-xs">{{ \Carbon\Carbon::parse($a->tgl_absensi)->format('d/m/Y') }}</td>
                        <td class="px-4 py-2.5 text-center">
                            @php
                                $colors = ['hadir'=>'green', 'sakit'=>'yellow', 'izin'=>'blue', 'alpha'=>'red'];
                                $color = $colors[strtolower($a->keterangan)] ?? 'gray';
                            @endphp
                            <span class="px-2 py-0.5 rounded-lg text-xs bg-{{ $color }}-500/20 text-{{ $color }}-300 capitalize">
                                {{ $a->keterangan }}
                            </span>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-300 text-xs">{{ $a->keterangan_detail ?? '-' }}</td>
                    </tr>
                    @empty
                    <tr><td colspan="6" class="px-4 py-8 text-center text-indigo-400">Tidak ada data absensi</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @if($absensiList->hasPages())
        <div class="px-4 py-3 border-t border-white/10">
            {{ $absensiList->appends(request()->query())->links() }}
        </div>
        @endif
    </div>
</div>
@endsection
