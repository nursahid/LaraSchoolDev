@extends('layouts.admin')

@section('page-title', 'Laporan Absensi')

@section('breadcrumb')
    <li><a href="{{ route('admin.absensi.index') }}" class="text-indigo-300 hover:text-white">Absensi</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Laporan</li>
@endsection

@section('content')
<div class="space-y-5">
    <div class="flex flex-wrap gap-3">
        <form method="GET" class="flex gap-2 flex-wrap">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Kelas</option>
                @foreach($kelasList as $k)
                <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                @endforeach
            </select>
            <select name="bulan" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                @for($m=1; $m<=12; $m++)
                <option value="{{ $m }}" {{ request('bulan', date('n'))==$m?'selected':'' }}>{{ \Carbon\Carbon::create()->month($m)->isoFormat('MMMM') }}</option>
                @endfor
            </select>
            <select name="tahun" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                @for($y=date('Y'); $y>=date('Y')-3; $y--)
                <option value="{{ $y }}" {{ request('tahun', date('Y'))==$y?'selected':'' }}>{{ $y }}</option>
                @endfor
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-filter mr-1"></i>Tampilkan
            </button>
        </form>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3">Kelas</th>
                        <th class="px-4 py-3 text-center">Hadir</th>
                        <th class="px-4 py-3 text-center">Sakit</th>
                        <th class="px-4 py-3 text-center">Izin</th>
                        <th class="px-4 py-3 text-center">Alpha</th>
                        <th class="px-4 py-3 text-center">Total</th>
                        <th class="px-4 py-3 text-center">% Hadir</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($laporan as $i => $l)
                    @php
                        $total = $l->hadir + $l->sakit + $l->izin + $l->alpha;
                        $pct = $total > 0 ? round($l->hadir / $total * 100) : 0;
                    @endphp
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-indigo-300">{{ $i + 1 }}</td>
                        <td class="px-4 py-2.5 text-white">{{ $l->nama_siswa }}</td>
                        <td class="px-4 py-2.5 text-indigo-200">{{ $l->nama_kelas ?? '-' }}</td>
                        <td class="px-4 py-2.5 text-center text-green-300 font-medium">{{ $l->hadir }}</td>
                        <td class="px-4 py-2.5 text-center text-yellow-300">{{ $l->sakit }}</td>
                        <td class="px-4 py-2.5 text-center text-blue-300">{{ $l->izin }}</td>
                        <td class="px-4 py-2.5 text-center text-red-300">{{ $l->alpha }}</td>
                        <td class="px-4 py-2.5 text-center text-indigo-200">{{ $total }}</td>
                        <td class="px-4 py-2.5 text-center">
                            <span class="font-medium {{ $pct >= 80 ? 'text-green-300' : ($pct >= 60 ? 'text-yellow-300' : 'text-red-300') }}">{{ $pct }}%</span>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="9" class="px-4 py-8 text-center text-indigo-400">Tidak ada data</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
