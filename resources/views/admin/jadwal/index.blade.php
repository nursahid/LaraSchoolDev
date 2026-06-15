@extends('layouts.admin')

@section('page-title', 'Jadwal Pelajaran')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Jadwal</li>
@endsection

@section('content')
<div class="space-y-4">
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                <option value="">Semua Kelas</option>
                @foreach($kelasList as $k)
                <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                @endforeach
            </select>
        </form>
        <a href="{{ route('admin.jadwal.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah Jadwal
        </a>
    </div>

    @foreach($hariList as $hari)
    @if(isset($jadwal[$hari]) && $jadwal[$hari]->count())
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-4 py-3 bg-indigo-900/50 border-b border-white/10">
            <h3 class="text-white font-semibold">{{ $hari }}</h3>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                    <tr class="text-indigo-300 text-left border-b border-white/5">
                        <th class="px-4 py-2">Jam</th>
                        <th class="px-4 py-2">Waktu</th>
                        <th class="px-4 py-2">Mata Pelajaran</th>
                        <th class="px-4 py-2">Guru</th>
                        <th class="px-4 py-2">Kelas</th>
                        <th class="px-4 py-2 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($jadwal[$hari] as $j)
                    <tr class="border-t border-white/5 hover:bg-white/5 {{ $j->is_istirahat ? 'opacity-50' : '' }}">
                        <td class="px-4 py-2 text-indigo-300">{{ $j->jam_ke }}</td>
                        <td class="px-4 py-2 text-white font-mono text-xs">{{ $j->jam_awal }} – {{ $j->jam_akhir }}</td>
                        <td class="px-4 py-2 text-white">{{ $j->is_istirahat ? '— Istirahat —' : $j->nama_mapel }}</td>
                        <td class="px-4 py-2 text-indigo-200">{{ $j->nama_guru ?? '-' }}</td>
                        <td class="px-4 py-2 text-indigo-200">{{ $j->nama_kelas }}</td>
                        <td class="px-4 py-2">
                            @if(!$j->is_istirahat)
                            <div class="flex justify-center gap-1">
                                <a href="{{ route('admin.jadwal.edit', $j->id_jadwal) }}" class="w-6 h-6 rounded bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center text-xs">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form id="del-j{{ $j->id_jadwal }}" action="{{ route('admin.jadwal.destroy', $j->id_jadwal) }}" method="POST">
                                    @csrf @method('DELETE')
                                    <button type="button" onclick="confirmDelete('del-j{{ $j->id_jadwal }}', '{{ $j->nama_mapel }}')"
                                        class="w-6 h-6 rounded bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center text-xs">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    @endif
    @endforeach

    @if(!request('id_kelas'))
    <div class="bg-white/10 rounded-2xl p-8 text-center text-indigo-400 border border-white/20">
        <i class="fas fa-hand-point-up text-3xl mb-2 block opacity-50"></i>
        Pilih kelas di atas untuk menampilkan jadwal pelajaran.
    </div>
    @elseif($jadwal->isEmpty())
    <div class="bg-white/10 rounded-2xl p-8 text-center text-indigo-400 border border-white/20">
        <i class="fas fa-calendar-times text-3xl mb-2 block opacity-50"></i>
        Belum ada jadwal pelajaran untuk kelas ini.
    </div>
    @endif
</div>
@endsection
