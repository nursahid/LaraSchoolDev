@extends('layouts.admin')

@section('page-title', 'Edit Kelas')

@section('breadcrumb')
    <li><a href="{{ route('admin.kelas.index') }}" class="text-indigo-300 hover:text-white">Kelas</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Edit: {{ $kela->nama_kelas }}</li>
@endsection

@section('content')
<div class="max-w-xl">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <form action="{{ route('admin.kelas.update', $kela->id_kelas) }}" method="POST">
            @csrf @method('PUT')
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Nama Kelas <span class="text-red-400">*</span></label>
                    <input type="text" name="nama_kelas" value="{{ old('nama_kelas', $kela->nama_kelas) }}" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Tingkat</label>
                    <select name="id_tingkat" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        @foreach($tingkatList as $t)
                        <option value="{{ $t->id_tingkat }}" {{ $kela->id_tingkat == $t->id_tingkat ? 'selected' : '' }}>{{ $t->nama_tingkat }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Wali Kelas</label>
                    <select name="id_walikelas" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Tidak Ada --</option>
                        @foreach($guruList as $g)
                        <option value="{{ $g->id_pegawai }}" {{ ($kela->id_walikelas ?? '') == $g->id_pegawai ? 'selected' : '' }}>{{ $g->nama }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Kapasitas Siswa</label>
                    <input type="number" name="kapasitas" value="{{ old('kapasitas', $kela->kapasitas ?? 36) }}" min="1" max="50"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Update
                    </button>
                    <a href="{{ route('admin.kelas.show', $kela->id_kelas) }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
