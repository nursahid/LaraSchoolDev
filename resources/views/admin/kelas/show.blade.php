@extends('layouts.admin')

@section('page-title', 'Detail Kelas')

@section('breadcrumb')
    <li><a href="{{ route('admin.kelas.index') }}" class="text-indigo-300 hover:text-white">Kelas</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">{{ $kela->nama_kelas }}</li>
@endsection

@section('content')
<div class="space-y-6">
    {{-- Header --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <div class="flex items-center justify-between">
            <div>
                <h2 class="text-2xl font-bold text-white">{{ $kela->nama_kelas }}</h2>
                <div class="flex gap-4 mt-2 text-sm text-indigo-300">
                    <span><i class="fas fa-layer-group mr-1"></i> {{ $kela->tingkat?->nama_tingkat ?? '-' }}</span>
                    <span><i class="fas fa-user-tie mr-1"></i> {{ $kela->waliKelas?->nama ?? 'Wali Kelas: -' }}</span>
                    <span><i class="fas fa-users mr-1"></i> {{ $siswaList->count() }} Siswa</span>
                    <span><i class="fas fa-calendar mr-1"></i> {{ $kela->tapel ?? '-' }}</span>
                </div>
            </div>
            <a href="{{ route('admin.kelas.edit', $kela->id_kelas) }}" class="bg-amber-600/50 hover:bg-amber-600 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-edit mr-1"></i>Edit Kelas
            </a>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {{-- Siswa List --}}
        <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Daftar Siswa</h3>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead>
                        <tr class="text-indigo-300 border-b border-white/10">
                            <th class="text-left pb-2 w-8">No</th>
                            <th class="text-left pb-2">Nama</th>
                            <th class="text-left pb-2">NIS</th>
                            <th class="text-center pb-2">L/P</th>
                            <th class="text-center pb-2">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($siswaList as $s)
                        <tr class="border-b border-white/5 hover:bg-white/5">
                            <td class="py-2 text-indigo-400">{{ $s->nis }}</td>
                            <td class="py-2 text-white">{{ $s->nama }}</td>
                            <td class="py-2 text-indigo-200 font-mono text-xs">{{ $s->nis }}</td>
                            <td class="py-2 text-center">
                                <span class="{{ $s->kelamin=='L' ? 'text-blue-300' : 'text-pink-300' }} text-xs">{{ $s->kelamin }}</span>
                            </td>
                            <td class="py-2 text-center">
                                <a href="{{ route('admin.siswa.show', $s->id_siswa) }}" class="text-indigo-300 hover:text-white text-xs">Detail</a>
                            </td>
                        </tr>
                        @empty
                        <tr><td colspan="5" class="py-4 text-center text-indigo-400">Belum ada siswa</td></tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        {{-- Jadwal --}}
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Jadwal Pelajaran</h3>
            @if($jadwal && $jadwal->count())
            <div class="space-y-3">
                @foreach($jadwal->groupBy('hari') as $hari => $items)
                <div>
                    <div class="text-xs font-semibold text-indigo-300 uppercase mb-1">{{ $hari }}</div>
                    @foreach($items as $j)
                    <div class="bg-white/5 rounded-lg px-3 py-1.5 mb-1">
                        <div class="text-white text-xs font-medium">{{ $j->nama_mapel }}</div>
                        <div class="text-indigo-400 text-xs">{{ $j->jam_awal }} – {{ $j->jam_akhir }}</div>
                    </div>
                    @endforeach
                </div>
                @endforeach
            </div>
            @else
            <p class="text-indigo-400 text-sm">Belum ada jadwal.</p>
            @endif
        </div>
    </div>
</div>
@endsection
