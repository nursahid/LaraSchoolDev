@extends('layouts.admin')

@section('page-title', 'Detail Pegawai')

@section('breadcrumb')
    <li><a href="{{ route('admin.pegawai.index') }}" class="text-indigo-300 hover:text-white">Pegawai</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">{{ $pegawai->nama }}</li>
@endsection

@section('content')
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20 text-center">
        <img src="{{ $pegawai->foto ? asset('uploads/avatar/'.$pegawai->foto) : 'https://ui-avatars.com/api/?name='.urlencode($pegawai->nama).'&background=6366f1&color=fff&size=200' }}"
             class="w-28 h-28 rounded-2xl object-cover mx-auto mb-4 ring-4 ring-indigo-500/30">
        <h2 class="text-xl font-bold text-white">{{ $pegawai->nama }}</h2>
        <p class="text-indigo-300 text-sm mt-1">{{ ucfirst(str_replace('_',' ', $pegawai->jabatan ?? '-')) }}</p>
        <p class="text-indigo-400 text-xs font-mono mt-1">{{ $pegawai->nip ?? 'NIP: -' }}</p>
        <span class="inline-block mt-2 px-3 py-1 rounded-lg text-xs {{ $pegawai->is_active ? 'bg-green-500/20 text-green-300' : 'bg-red-500/20 text-red-300' }}">
            {{ $pegawai->is_active ? 'Aktif' : 'Non-aktif' }}
        </span>

        <div class="mt-4 pt-4 border-t border-white/10 flex gap-2 justify-center">
            <a href="{{ route('admin.pegawai.edit', $pegawai->id_pegawai) }}" class="flex-1 bg-amber-600/50 hover:bg-amber-600 text-white rounded-xl py-2 text-xs transition text-center">
                <i class="fas fa-edit mr-1"></i>Edit
            </a>
            <form id="del-p" action="{{ route('admin.pegawai.destroy', $pegawai->id_pegawai) }}" method="POST">
                @csrf @method('DELETE')
                <button type="button" onclick="confirmDelete('del-p', '{{ addslashes($pegawai->nama) }}')"
                    class="bg-red-600/40 hover:bg-red-600 text-white rounded-xl py-2 px-3 text-xs transition">
                    <i class="fas fa-trash"></i>
                </button>
            </form>
        </div>
    </div>

    <div class="lg:col-span-2 space-y-5">
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Informasi Pegawai</h3>
            <div class="grid grid-cols-2 gap-3 text-sm">
                <div><span class="text-indigo-300 block">NUPTK</span><span class="text-white font-mono">{{ $pegawai->nuptk ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Jenis Kelamin</span><span class="text-white">{{ $pegawai->kelamin == 'L' ? 'Laki-laki' : 'Perempuan' }}</span></div>
                <div><span class="text-indigo-300 block">Email</span><span class="text-white">{{ $pegawai->email ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">No. Telepon</span><span class="text-white">{{ $pegawai->hp ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Tempat Lahir</span><span class="text-white">{{ $pegawai->tempat_lahir ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Tanggal Lahir</span><span class="text-white">{{ $pegawai->tgl_lahir ? \Carbon\Carbon::parse($pegawai->tgl_lahir)->format('d/m/Y') : '-' }}</span></div>
                <div class="col-span-2"><span class="text-indigo-300 block">Alamat</span><span class="text-white">{{ $pegawai->alamat ?? '-' }}</span></div>
            </div>
        </div>

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Mata Pelajaran Diampu</h3>
            @if($pegawai->mapel && $pegawai->mapel->count())
            <div class="flex flex-wrap gap-2">
                @foreach($pegawai->mapel as $m)
                <span class="bg-indigo-600/30 text-indigo-200 rounded-xl px-3 py-1 text-sm">{{ $m->nama_mapel }}</span>
                @endforeach
            </div>
            @else
            <p class="text-indigo-400 text-sm">Belum ada mapel yang diampu.</p>
            @endif
        </div>
    </div>
</div>
@endsection
