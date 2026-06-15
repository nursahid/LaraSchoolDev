@extends('layouts.admin')

@section('page-title', 'Data Pegawai')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Pegawai</li>
@endsection

@section('content')
<div class="space-y-4">
    <div class="flex flex-col sm:flex-row gap-3 items-start sm:items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari nama / NIP..."
                class="bg-white/10 border border-white/20 text-white placeholder-indigo-300 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 w-48">
            <select name="jabatan" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Jabatan</option>
                <option value="guru" {{ request('jabatan')=='guru'?'selected':'' }}>Guru</option>
                <option value="staf" {{ request('jabatan')=='staf'?'selected':'' }}>Staf TU</option>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-search mr-1"></i>Cari
            </button>
        </form>
        <a href="{{ route('admin.pegawai.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah Pegawai
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3 w-8">#</th>
                        <th class="px-4 py-3">Foto</th>
                        <th class="px-4 py-3">Nama / NIP</th>
                        <th class="px-4 py-3">Jabatan</th>
                        <th class="px-4 py-3">Mata Pelajaran</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($pegawaiList as $i => $p)
                    <tr class="border-t border-white/5 hover:bg-white/5 transition">
                        <td class="px-4 py-3 text-indigo-300">{{ $pegawaiList->firstItem() + $i }}</td>
                        <td class="px-4 py-3">
                            <img src="{{ $p->foto ? asset('uploads/avatar/'.$p->foto) : 'https://ui-avatars.com/api/?name='.urlencode($p->nama).'&background=6366f1&color=fff' }}"
                                 class="w-9 h-9 rounded-full object-cover">
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-white font-medium">{{ $p->nama }}</div>
                            <div class="text-indigo-300 text-xs font-mono">{{ $p->nip ?? '-' }}</div>
                        </td>
                        <td class="px-4 py-3 text-indigo-200">{{ $p->jabatan ?? '-' }}</td>
                        <td class="px-4 py-3 text-indigo-300 text-xs">{{ $p->mapel_list ?? '-' }}</td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded-lg text-xs {{ $p->aktif ? 'bg-green-500/20 text-green-300' : 'bg-red-500/20 text-red-300' }}">
                                {{ $p->aktif ? 'Aktif' : 'Non-aktif' }}
                            </span>
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex items-center justify-center gap-1">
                                <a href="{{ route('admin.pegawai.show', $p->id_pegawai) }}" class="w-7 h-7 rounded-lg bg-blue-500/20 hover:bg-blue-500/40 text-blue-300 flex items-center justify-center transition">
                                    <i class="fas fa-eye text-xs"></i>
                                </a>
                                <a href="{{ route('admin.pegawai.edit', $p->id_pegawai) }}" class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition">
                                    <i class="fas fa-edit text-xs"></i>
                                </a>
                                <form id="del-{{ $p->id_pegawai }}" action="{{ route('admin.pegawai.destroy', $p->id_pegawai) }}" method="POST">
                                    @csrf @method('DELETE')
                                    <button type="button" onclick="confirmDelete('del-{{ $p->id_pegawai }}', '{{ addslashes($p->nama) }}')"
                                        class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition">
                                        <i class="fas fa-trash text-xs"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="7" class="px-4 py-8 text-center text-indigo-400">Tidak ada data pegawai</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @if(method_exists($pegawaiList, 'hasPages') && $pegawaiList->hasPages())
        <div class="px-4 py-3 border-t border-white/10 text-sm text-indigo-300">
            Menampilkan {{ $pegawaiList->firstItem() }}–{{ $pegawaiList->lastItem() }} dari {{ $pegawaiList->total() }} data
        </div>
        @endif
    </div>
</div>
@endsection
