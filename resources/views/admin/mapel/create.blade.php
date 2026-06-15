@extends('layouts.admin')

@section('page-title', 'Tambah Mata Pelajaran')

@section('breadcrumb')
    <li><a href="{{ route('admin.mapel.index') }}" class="text-indigo-300 hover:text-white">Mata Pelajaran</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Tambah</li>
@endsection

@section('content')
<div class="max-w-lg">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <form action="{{ route('admin.mapel.store') }}" method="POST">
            @csrf
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Kode Mapel</label>
                    <input type="text" name="kode" value="{{ old('kode') }}" placeholder="Misal: MTK"
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 uppercase font-mono">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Nama Mata Pelajaran <span class="text-red-400">*</span></label>
                    <input type="text" name="nama_mapel" value="{{ old('nama_mapel') }}" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    @error('nama_mapel') <p class="text-red-400 text-xs mt-1">{{ $message }}</p> @enderror
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">KKM</label>
                    <input type="number" name="kkm" value="{{ old('kkm', 75) }}" min="0" max="100"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">No. Urut</label>
                    <input type="number" name="no_urut" value="{{ old('no_urut', 1) }}" min="1"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Simpan
                    </button>
                    <a href="{{ route('admin.mapel.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
