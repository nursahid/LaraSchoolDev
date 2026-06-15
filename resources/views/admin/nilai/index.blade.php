@extends('layouts.admin')

@section('page-title', 'Data Nilai')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Nilai</li>
@endsection

@section('content')
<div class="space-y-4">
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Kelas</option>
                @foreach($kelasList as $k)
                <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                @endforeach
            </select>
            <select name="id_mapel" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Mapel</option>
                @foreach($mapelList as $m)
                <option value="{{ $m->id_mapel }}" {{ request('id_mapel')==$m->id_mapel?'selected':'' }}>{{ $m->nama_mapel }}</option>
                @endforeach
            </select>
            <select name="semester" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="1" {{ request('semester',1)==1?'selected':'' }}>Semester 1</option>
                <option value="2" {{ request('semester')==2?'selected':'' }}>Semester 2</option>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-filter mr-1"></i>Filter
            </button>
        </form>
        <a href="{{ route('admin.nilai.input') }}" class="bg-emerald-600/80 hover:bg-emerald-600 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-keyboard mr-1"></i>Input Nilai
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Siswa</th>
                        <th class="px-4 py-3">Kelas</th>
                        <th class="px-4 py-3">Mata Pelajaran</th>
                        <th class="px-4 py-3">Jenis</th>
                        <th class="px-4 py-3 text-center">Nilai</th>
                        <th class="px-4 py-3">Tgl Penilaian</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($nilaiList as $i => $n)
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-3 text-indigo-300">{{ $nilaiList->firstItem() + $i }}</td>
                        <td class="px-4 py-3">
                            <div class="text-white">{{ $n->nama }}</div>
                            <div class="text-indigo-400 text-xs font-mono">{{ $n->nis }}</div>
                        </td>
                        <td class="px-4 py-3 text-indigo-200">{{ $n->nama_kelas }}</td>
                        <td class="px-4 py-3 text-indigo-200">{{ $n->nama_mapel }}</td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded text-xs {{ $n->jenis_ujian=='harian' ? 'bg-blue-500/20 text-blue-300' : ($n->jenis_ujian=='mid' ? 'bg-amber-500/20 text-amber-300' : 'bg-purple-500/20 text-purple-300') }}">
                                {{ ucfirst($n->jenis_ujian) }}
                            </span>
                        </td>
                        <td class="px-4 py-3 text-center font-bold {{ $n->nilai >= 75 ? 'text-green-300' : 'text-red-300' }}">
                            {{ $n->nilai }}
                        </td>
                        <td class="px-4 py-3 text-indigo-300 text-xs">{{ \Carbon\Carbon::parse($n->tgl_penilaian)->format('d/m/Y') }}</td>
                    </tr>
                    @empty
                    <tr><td colspan="7" class="px-4 py-8 text-center text-indigo-400">Belum ada data nilai</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @if($nilaiList->hasPages())
        <div class="px-4 py-3 border-t border-white/10 text-sm text-indigo-300">
            {{ $nilaiList->appends(request()->query())->links() }}
        </div>
        @endif
    </div>
</div>
@endsection
