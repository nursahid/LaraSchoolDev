@extends('layouts.admin')

@section('page-title', 'Tambah Jadwal')

@section('breadcrumb')
    <li><a href="{{ route('admin.jadwal.index') }}" class="text-indigo-300 hover:text-white">Jadwal</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Tambah</li>
@endsection

@section('content')
<div class="max-w-lg">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <form action="{{ route('admin.jadwal.store') }}" method="POST">
            @csrf
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Kelas <span class="text-red-400">*</span></label>
                    <select name="id_kelas" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Pilih Kelas --</option>
                        @foreach($kelasList as $k)
                        <option value="{{ $k->id_kelas }}" {{ old('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Mata Pelajaran <span class="text-red-400">*</span></label>
                    <select name="id_mapel" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Pilih Mapel --</option>
                        @foreach($mapelList as $m)
                        <option value="{{ $m->id_mapel }}" {{ old('id_mapel')==$m->id_mapel?'selected':'' }}>{{ $m->nama_mapel }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Guru <span class="text-red-400">*</span></label>
                    <select name="id_pegawai" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Pilih Guru --</option>
                        @foreach($guruList as $g)
                        <option value="{{ $g->id_pegawai }}" {{ old('id_pegawai')==$g->id_pegawai?'selected':'' }}>{{ $g->nama }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Jam Pelajaran <span class="text-red-400">*</span></label>
                    <select name="id_jampel" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Pilih Jam --</option>
                        @foreach($jamList as $j)
                        <option value="{{ $j->id_jampel }}" {{ old('id_jampel')==$j->id_jampel?'selected':'' }}>
                            {{ $j->hari }} — Jam {{ $j->jam_ke }}: {{ $j->jam_awal }}–{{ $j->jam_akhir }}
                        </option>
                        @endforeach
                    </select>
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Simpan
                    </button>
                    <a href="{{ route('admin.jadwal.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
