@extends('layouts.guru')

@section('page-title', 'Jadwal Mengajar')

@section('content')
<div class="space-y-4">
    <div class="flex items-center justify-between">
        <p class="text-sky-300 text-sm">{{ now()->locale('id')->isoFormat('dddd, D MMMM Y') }}</p>
    </div>

    @foreach($hariList as $hari)
    @if(isset($jadwal[$hari]) && $jadwal[$hari]->count())
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-4 py-3 bg-sky-900/50 border-b border-white/10 flex items-center justify-between">
            <h3 class="text-white font-semibold">{{ $hari }}</h3>
            @if($hari === now()->locale('id')->isoFormat('dddd'))
            <span class="bg-sky-400/20 text-sky-300 text-xs px-2 py-0.5 rounded-lg">Hari Ini</span>
            @endif
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                    <tr class="text-sky-300 text-left border-b border-white/5">
                        <th class="px-4 py-2">Jam ke</th>
                        <th class="px-4 py-2">Waktu</th>
                        <th class="px-4 py-2">Mata Pelajaran</th>
                        <th class="px-4 py-2">Kelas</th>
                        <th class="px-4 py-2">Ruang</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($jadwal[$hari] as $j)
                    <tr class="border-t border-white/5 {{ $j->is_istirahat ? 'opacity-40' : 'hover:bg-white/5' }}">
                        <td class="px-4 py-2 text-sky-300">{{ $j->jam_ke }}</td>
                        <td class="px-4 py-2 text-white font-mono text-xs">{{ $j->jam_awal }} – {{ $j->jam_akhir }}</td>
                        <td class="px-4 py-2 text-white">{{ $j->is_istirahat ? '— Istirahat —' : $j->nama_mapel }}</td>
                        <td class="px-4 py-2 text-sky-200">{{ $j->nama_kelas ?? '-' }}</td>
                        <td class="px-4 py-2 text-sky-300">{{ $j->ruang ?? '-' }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    @endif
    @endforeach

    @if($jadwal->isEmpty())
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">
        <i class="fas fa-calendar-xmark text-3xl mb-2 block opacity-50"></i>
        Belum ada jadwal mengajar.
    </div>
    @endif
</div>
@endsection
