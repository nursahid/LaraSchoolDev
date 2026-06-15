@extends('layouts.admin')

@section('page-title', 'Mata Pelajaran')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Mata Pelajaran</li>
@endsection

@section('content')
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <p class="text-indigo-300 text-sm">Total: <strong class="text-white">{{ $mapelList->total() }}</strong> mata pelajaran</p>
        <a href="{{ route('admin.mapel.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah Mapel
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <table class="w-full text-sm">
            <thead class="bg-indigo-900/50">
                <tr class="text-indigo-200 text-left">
                    <th class="px-4 py-3 w-10">#</th>
                    <th class="px-4 py-3">Kode</th>
                    <th class="px-4 py-3">Nama Mata Pelajaran</th>
                    <th class="px-4 py-3">KKM</th>
                    <th class="px-4 py-3">Jml Guru</th>
                    <th class="px-4 py-3 text-center">Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse($mapelList as $i => $m)
                <tr class="border-t border-white/5 hover:bg-white/5">
                    <td class="px-4 py-3 text-indigo-300">{{ $mapelList->firstItem() + $i }}</td>
                    <td class="px-4 py-3 text-indigo-200 font-mono text-xs">{{ $m->kode ?? '-' }}</td>
                    <td class="px-4 py-3 text-white">{{ $m->nama_mapel }}</td>
                    <td class="px-4 py-3 text-indigo-200">{{ $m->kkm ?? '-' }}</td>
                    <td class="px-4 py-3 text-indigo-200">{{ $m->jml_guru ?? 0 }}</td>
                    <td class="px-4 py-3">
                        <div class="flex items-center justify-center gap-1">
                            <a href="{{ route('admin.mapel.edit', $m->id_mapel) }}" class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition">
                                <i class="fas fa-edit text-xs"></i>
                            </a>
                            <form id="del-m{{ $m->id_mapel }}" action="{{ route('admin.mapel.destroy', $m->id_mapel) }}" method="POST">
                                @csrf @method('DELETE')
                                <button type="button" onclick="confirmDelete('del-m{{ $m->id_mapel }}', '{{ addslashes($m->nama_mapel) }}')"
                                    class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition">
                                    <i class="fas fa-trash text-xs"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                @empty
                <tr><td colspan="6" class="px-4 py-8 text-center text-indigo-400">Belum ada data</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection
