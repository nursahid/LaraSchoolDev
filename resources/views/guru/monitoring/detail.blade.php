@extends('layouts.guru')

@section('page-title', 'Detail Monitoring')

@section('content')
<div class="space-y-5">
    {{-- Profile --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex items-center gap-4">
        <img src="{{ $siswa->foto ? asset('uploads/siswa/'.$siswa->foto) : 'https://ui-avatars.com/api/?name='.urlencode($siswa->nama ?? '').'&background=0ea5e9&color=fff&size=80' }}"
             class="w-16 h-16 rounded-2xl object-cover ring-2 ring-sky-400/30">
        <div>
            <h2 class="text-xl font-bold text-white">{{ $siswa->nama }}</h2>
            <p class="text-sky-300 text-sm font-mono">{{ $siswa->nis }}</p>
            <p class="text-sky-400 text-xs mt-1">Kelas: {{ $kelas->nama_kelas ?? '-' }}</p>
        </div>
        <a href="{{ route('guru.monitoring.index', ['id_kelas' => request('id_kelas')]) }}" class="ml-auto text-xs text-sky-300 hover:text-white transition">
            ← Kembali
        </a>
    </div>

    {{-- Rekap --}}
    <div class="grid grid-cols-3 gap-4">
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="text-3xl font-bold {{ $rataRataNilai >= 75 ? 'text-green-300' : 'text-red-300' }}">{{ $rataRataNilai ? number_format($rataRataNilai,1) : '-' }}</div>
            <div class="text-xs text-sky-300 mt-1">Rata-rata Nilai</div>
        </div>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="text-3xl font-bold text-white">{{ $totalHadir }}</div>
            <div class="text-xs text-sky-300 mt-1">Hadir</div>
        </div>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="text-3xl font-bold {{ $totalAlpha > 6 ? 'text-red-300' : 'text-white' }}">{{ $totalAlpha }}</div>
            <div class="text-xs text-sky-300 mt-1">Alpha</div>
        </div>
    </div>

    {{-- Nilai per Mapel --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <h3 class="text-white font-semibold mb-4">Nilai per Mata Pelajaran</h3>
        @if($nilaiPerMapel->count())
        <div class="space-y-2">
            @foreach($nilaiPerMapel as $n)
            @php $pct = min(round($n->rata_rata ?? 0), 100); @endphp
            <div class="flex items-center gap-3">
                <div class="w-36 text-xs text-sky-200 truncate">{{ $n->nama_mapel }}</div>
                <div class="flex-1 bg-white/10 rounded-full h-2">
                    <div class="h-2 rounded-full {{ $pct >= 75 ? 'bg-green-400' : ($pct >= 60 ? 'bg-amber-400' : 'bg-red-400') }}"
                         style="width: {{ $pct }}%"></div>
                </div>
                <div class="w-10 text-xs text-right font-medium text-white">{{ number_format($n->rata_rata ?? 0, 1) }}</div>
            </div>
            @endforeach
        </div>
        @else
        <p class="text-sky-400 text-sm">Belum ada data nilai.</p>
        @endif
    </div>
</div>
@endsection
