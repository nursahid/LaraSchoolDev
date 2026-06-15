@extends('layouts.admin')

@section('page-title', 'Tambah Pegawai')

@section('breadcrumb')
    <li><a href="{{ route('admin.pegawai.index') }}" class="text-indigo-300 hover:text-white">Pegawai</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Tambah</li>
@endsection

@section('content')
<div class="max-w-4xl">
    <form action="{{ route('admin.pegawai.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            {{-- Foto --}}
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex flex-col items-center gap-4">
                <div class="text-white font-semibold text-sm">Foto Pegawai</div>
                <div id="foto-preview" class="w-32 h-32 rounded-2xl bg-indigo-800/50 border-2 border-dashed border-indigo-500/50 flex items-center justify-center overflow-hidden">
                    <i class="fas fa-user text-3xl text-indigo-400"></i>
                </div>
                <label class="cursor-pointer">
                    <span class="bg-indigo-600/50 hover:bg-indigo-600 text-white text-xs rounded-xl px-4 py-2 transition">
                        <i class="fas fa-upload mr-1"></i>Pilih Foto
                    </span>
                    <input type="file" name="foto" accept="image/*" class="hidden" onchange="previewFoto(this)">
                </label>
            </div>

            {{-- Data Diri --}}
            <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Pegawai</h3>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Nama Lengkap <span class="text-red-400">*</span></label>
                        <input type="text" name="nama" value="{{ old('nama') }}" required
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NIP</label>
                        <input type="text" name="nip" value="{{ old('nip') }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm font-mono focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NUPTK</label>
                        <input type="text" name="nuptk" value="{{ old('nuptk') }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm font-mono focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Jabatan</label>
                        <select name="jabatan" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            <option value="">-- Pilih --</option>
                            <option value="guru">Guru</option>
                            <option value="kepala_sekolah">Kepala Sekolah</option>
                            <option value="wakasek">Wakasek</option>
                            <option value="tata_usaha">Tata Usaha</option>
                            <option value="bendahara">Bendahara</option>
                            <option value="bk">BK</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Jenis Kelamin</label>
                        <select name="kelamin" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            <option value="L">Laki-laki</option>
                            <option value="P">Perempuan</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Email</label>
                        <input type="email" name="email" value="{{ old('email') }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">No. Telepon</label>
                        <input type="text" name="hp" value="{{ old('hp') }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Mata Pelajaran Diampu</label>
                        <div class="grid grid-cols-2 gap-2">
                            @foreach($mapelList as $m)
                            <label class="flex items-center gap-2 text-sm text-indigo-200 cursor-pointer">
                                <input type="checkbox" name="mapel_ids[]" value="{{ $m->id_mapel }}" class="accent-indigo-500">
                                {{ $m->nama_mapel }}
                            </label>
                            @endforeach
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Status Aktif</label>
                        <div class="flex items-center gap-2 mt-2">
                            <input type="checkbox" name="aktif" id="aktif" value="1" checked class="w-4 h-4 accent-indigo-500">
                            <label for="aktif" class="text-sm text-indigo-200">Aktif</label>
                        </div>
                    </div>
                </div>
            </div>

            {{-- Actions --}}
            <div class="lg:col-span-3 flex gap-3">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Simpan
                </button>
                <a href="{{ route('admin.pegawai.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
            </div>
        </div>
    </form>
</div>
@endsection

@push('scripts')
<script>
function previewFoto(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = e => {
            const prev = document.getElementById('foto-preview');
            prev.innerHTML = `<img src="${e.target.result}" class="w-full h-full object-cover">`;
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
@endpush
