@extends('layouts.admin')

@section('page-title', 'Edit Siswa')

@section('breadcrumb')
    <li><a href="{{ route('admin.siswa.index') }}" class="text-indigo-300 hover:text-white">Siswa</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Edit: {{ $siswa->nama }}</li>
@endsection

@section('content')
<div class="max-w-4xl">
    <form action="{{ route('admin.siswa.update', $siswa->id_siswa) }}" method="POST" enctype="multipart/form-data">
        @csrf @method('PUT')
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            {{-- Foto --}}
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex flex-col items-center gap-4">
                <div class="text-white font-semibold text-sm">Foto Siswa</div>
                <div id="foto-preview" class="w-32 h-32 rounded-2xl overflow-hidden border-2 border-indigo-500/50">
                    <img id="fotoImg"
                        src="{{ $siswa->foto ? asset('uploads/siswa/'.$siswa->foto) : 'https://ui-avatars.com/api/?name='.urlencode($siswa->nama).'&background=6366f1&color=fff&size=128' }}"
                        class="w-full h-full object-cover">
                </div>
                <label class="cursor-pointer">
                    <span class="bg-indigo-600/50 hover:bg-indigo-600 text-white text-xs rounded-xl px-4 py-2 transition">
                        <i class="fas fa-upload mr-1"></i> Ganti Foto
                    </span>
                    <input type="file" name="foto" accept="image/*" class="hidden" onchange="previewFoto(this)">
                </label>
            </div>

            {{-- Data Diri --}}
            <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Diri</h3>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Nama Lengkap <span class="text-red-400">*</span></label>
                        <input type="text" name="nama" value="{{ old('nama', $siswa->nama) }}" required
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NIS</label>
                        <input type="text" name="nis" value="{{ old('nis', $siswa->nis) }}" readonly
                            class="w-full bg-white/5 border border-white/10 text-indigo-300 rounded-xl px-3 py-2 text-sm font-mono cursor-not-allowed">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NISN</label>
                        <input type="text" name="nisn" value="{{ old('nisn', $siswa->nisn) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm font-mono focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Jenis Kelamin</label>
                        <select name="kelamin" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            <option value="L" {{ $siswa->kelamin=='L'?'selected':'' }}>Laki-laki</option>
                            <option value="P" {{ $siswa->kelamin=='P'?'selected':'' }}>Perempuan</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Tempat Lahir</label>
                        <input type="text" name="tempat_lahir" value="{{ old('tempat_lahir', $siswa->tempat_lahir) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Tanggal Lahir</label>
                        <input type="date" name="tgl_lahir" value="{{ old('tgl_lahir', $siswa->tgl_lahir ? \Carbon\Carbon::parse($siswa->tgl_lahir)->format('Y-m-d') : '') }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Agama</label>
                        <select name="agama" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            @foreach(['Islam','Kristen','Katolik','Hindu','Buddha','Konghucu'] as $a)
                            <option value="{{ $a }}" {{ ($siswa->agama ?? '')==$a?'selected':'' }}>{{ $a }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Email</label>
                        <input type="email" name="email" value="{{ old('email', $siswa->email) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">No. Telepon</label>
                        <input type="text" name="telp" value="{{ old('telp', $siswa->telp) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Alamat</label>
                        <textarea name="alamat" rows="2"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">{{ old('alamat', $siswa->alamat) }}</textarea>
                    </div>
                </div>
            </div>

            {{-- Extra Data --}}
            <div class="lg:col-span-3 grid grid-cols-1 sm:grid-cols-2 gap-6">
                <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                    <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Orang Tua</h3>
                    <div class="space-y-3">
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Nama Ayah</label>
                            <input type="text" name="nama_ayah" value="{{ old('nama_ayah', $siswa->nama_ayah) }}"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Nama Ibu</label>
                            <input type="text" name="nama_ibu" value="{{ old('nama_ibu', $siswa->nama_ibu) }}"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">No. HP Orang Tua</label>
                            <input type="text" name="hp_ortu" value="{{ old('hp_ortu', $siswa->hp_ortu) }}"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                    </div>
                </div>
                <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                    <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Status & Keamanan</h3>
                    <div class="space-y-3">
                        <div class="flex items-center gap-2">
                            <input type="checkbox" name="active" id="active" value="1" {{ $siswa->active ? 'checked' : '' }} class="w-4 h-4 rounded accent-indigo-500">
                            <label for="active" class="text-sm text-indigo-200">Status Aktif</label>
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Reset Password (kosongkan jika tidak diubah)</label>
                            <input type="password" name="password"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400" placeholder="Password baru...">
                        </div>
                    </div>
                </div>
            </div>

            {{-- Actions --}}
            <div class="lg:col-span-3 flex gap-3">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Update
                </button>
                <a href="{{ route('admin.siswa.show', $siswa->id_siswa) }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">
                    Batal
                </a>
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
        reader.onload = e => { document.getElementById('fotoImg').src = e.target.result; };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
@endpush
