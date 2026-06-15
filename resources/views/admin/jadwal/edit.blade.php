@extends('layouts.admin')

@section('page-title', 'Edit Jadwal')

@section('breadcrumb')
    <li><a href="{{ route('admin.jadwal.index') }}" class="text-indigo-300 hover:text-white">Jadwal</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Edit</li>
@endsection

@section('content')
<div class="max-w-lg">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <form action="{{ route('admin.jadwal.update', $jadwal->id_jadwal) }}" method="POST">
            @csrf @method('PUT')
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Kelas</label>
                    <select name="id_kelas" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        @foreach($kelasList as $k)
                        <option value="{{ $k->id_kelas }}" {{ $jadwal->id_kelas == $k->id_kelas ? 'selected' : '' }}>{{ $k->nama_kelas }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Mata Pelajaran</label>
                    <select name="id_mapel" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        @foreach($mapelList as $m)
                        <option value="{{ $m->id_mapel }}" {{ $jadwal->id_mapel == $m->id_mapel ? 'selected' : '' }}>{{ $m->nama_mapel }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Guru</label>
                    <select name="id_pegawai" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        @foreach($pegawaiList as $g)
                        <option value="{{ $g->id_pegawai }}" {{ $jadwal->id_pegawai == $g->id_pegawai ? 'selected' : '' }}>{{ $g->nama }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Jam Pelajaran</label>
                    <select name="id_jampel" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        @foreach($jampelList as $hari => $jams)
                        <optgroup label="{{ $hari }}">
                            @foreach($jams as $j)
                            <option value="{{ $j->id_jampel }}" {{ $jadwal->id_jampel == $j->id_jampel ? 'selected' : '' }}>
                                Jam {{ $j->jam_ke }}: {{ $j->jam_awal }}–{{ $j->jam_akhir }}
                            </option>
                            @endforeach
                        </optgroup>
                        @endforeach
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Keterangan (opsional)</label>
                    <input type="text" name="keterangan" value="{{ old('keterangan', $jadwal->keterangan ?? '') }}"
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Update
                    </button>
                    <a href="{{ route('admin.jadwal.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
