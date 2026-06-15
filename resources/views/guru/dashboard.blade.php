@extends('layouts.guru')

@section('page-title', 'Dashboard Guru')

@section('content')
<div class="space-y-6">

    {{-- Welcome --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <div class="flex items-center gap-4">
            <img src="{{ $pegawai->foto ? asset('uploads/avatar/'.$pegawai->foto) : 'https://ui-avatars.com/api/?name='.urlencode($pegawai->nama ?? auth()->user()->name).'&background=0ea5e9&color=fff&size=80' }}"
                 class="w-16 h-16 rounded-2xl object-cover ring-2 ring-sky-400/30">
            <div>
                <h2 class="text-xl font-bold text-white">Selamat datang, {{ $pegawai->nama ?? auth()->user()->name }}!</h2>
                <p class="text-sky-300 text-sm">{{ ucfirst(str_replace('_',' ', $pegawai->jabatan ?? 'Guru')) }}</p>
                @if($tapelAktif)
                <p class="text-sky-400 text-xs mt-1">TA: {{ $tapelAktif->nama_tapel }} — Semester {{ $tapelAktif->semester }}</p>
                @endif
            </div>
        </div>
    </div>

    {{-- Stats --}}
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="text-3xl font-bold text-white mb-1">{{ $mapelDiajar->count() }}</div>
            <div class="text-xs text-sky-300">Mata Pelajaran</div>
        </div>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="text-3xl font-bold text-white mb-1">{{ $totalSiswaKelas }}</div>
            <div class="text-xs text-sky-300">Siswa Wali Kelas</div>
        </div>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="text-3xl font-bold text-white mb-1">{{ collect($jadwalHariIni)->count() }}</div>
            <div class="text-xs text-sky-300">Jadwal Hari Ini</div>
        </div>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            @if($absensiStatus)
            <div class="text-3xl font-bold text-green-300 mb-1"><i class="fas fa-check text-2xl"></i></div>
            <div class="text-xs text-sky-300">Absensi Terisi</div>
            @else
            <div class="text-3xl font-bold text-amber-300 mb-1"><i class="fas fa-exclamation text-2xl"></i></div>
            <div class="text-xs text-sky-300">Absensi Kosong</div>
            @endif
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {{-- Jadwal Hari Ini --}}
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-white font-semibold">Jadwal Hari Ini</h3>
                <span class="text-xs text-sky-300">{{ now()->locale('id')->isoFormat('dddd, D MMMM Y') }}</span>
            </div>
            @forelse($jadwalHariIni as $j)
            <div class="flex items-center gap-3 py-2 border-b border-white/5 last:border-0">
                <div class="text-center w-20 shrink-0 bg-sky-900/30 rounded-xl p-2">
                    <div class="text-white text-xs font-mono font-medium">{{ $j->jam_awal }}</div>
                    <div class="text-sky-500 text-xs">—</div>
                    <div class="text-white text-xs font-mono">{{ $j->jam_akhir }}</div>
                </div>
                <div class="flex-1">
                    <div class="text-white font-medium text-sm">{{ $j->nama_mapel }}</div>
                    <div class="text-sky-300 text-xs">Kelas {{ $j->nama_kelas }}</div>
                </div>
            </div>
            @empty
            <div class="text-center py-6 text-sky-400">
                <i class="fas fa-coffee text-2xl mb-2 block opacity-50"></i>
                Tidak ada jadwal mengajar hari ini.
            </div>
            @endforelse
        </div>

        {{-- Wali Kelas / Akses Cepat --}}
        @if($kelasWali)
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-white font-semibold">Kelas Wali</h3>
                <span class="bg-sky-500/20 text-sky-300 text-xs px-2 py-0.5 rounded-lg">Wali Kelas</span>
            </div>
            <div class="text-center mb-4">
                <div class="text-4xl font-bold text-white">{{ $kelasWali->nama_kelas }}</div>
                <div class="text-sky-300 text-sm mt-1">{{ $totalSiswaKelas }} Siswa</div>
            </div>
            <div class="grid grid-cols-2 gap-3">
                <a href="{{ route('guru.absensi.index') }}" class="text-center text-xs bg-sky-600/50 hover:bg-sky-600 text-white rounded-xl py-2.5 transition">
                    <i class="fas fa-clipboard-list mr-1"></i>Isi Absensi
                </a>
                <a href="{{ route('guru.nilai.input') }}" class="text-center text-xs bg-amber-600/50 hover:bg-amber-600 text-white rounded-xl py-2.5 transition">
                    <i class="fas fa-star mr-1"></i>Input Nilai
                </a>
            </div>
        </div>
        @else
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Akses Cepat</h3>
            <div class="grid grid-cols-2 gap-3">
                @foreach([
                    ['route'=>'guru.jadwal.index', 'icon'=>'calendar-week', 'label'=>'Jadwal', 'color'=>'sky'],
                    ['route'=>'guru.nilai.index', 'icon'=>'star', 'label'=>'Input Nilai', 'color'=>'amber'],
                    ['route'=>'guru.absensi.index', 'icon'=>'clipboard-list', 'label'=>'Absensi', 'color'=>'green'],
                    ['route'=>'guru.rapor.index', 'icon'=>'file-pdf', 'label'=>'Rapor', 'color'=>'purple'],
                ] as $link)
                <a href="{{ route($link['route']) }}" class="bg-white/5 hover:bg-{{ $link['color'] }}-500/20 rounded-xl p-4 text-center transition group">
                    <i class="fas fa-{{ $link['icon'] }} text-{{ $link['color'] }}-300 text-xl mb-2 block group-hover:scale-110 transition"></i>
                    <span class="text-white text-sm">{{ $link['label'] }}</span>
                </a>
                @endforeach
            </div>
        </div>
        @endif
    </div>

    {{-- Mapel yang Diajar --}}
    @if($mapelDiajar->count())
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <h3 class="text-white font-semibold mb-3">Mata Pelajaran Diampu</h3>
        <div class="flex flex-wrap gap-2">
            @foreach($mapelDiajar as $m)
            <span class="bg-sky-600/30 text-sky-200 rounded-xl px-3 py-1.5 text-sm">{{ $m->nama_mapel }}</span>
            @endforeach
        </div>
    </div>
    @endif
</div>
@endsection
