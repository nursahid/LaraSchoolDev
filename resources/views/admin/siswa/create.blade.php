@extends('layouts.admin')

@section('page-title', 'Tambah Siswa')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li><a href="{{ route('admin.siswa.index') }}" class="text-indigo-300 hover:text-white">Siswa</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Tambah</li>
@endsection

@section('content')
<div class="max-w-4xl">
    <form action="{{ route('admin.siswa.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            {{-- Foto Upload --}}
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex flex-col items-center gap-4">
                <div class="text-white font-semibold text-sm mb-2">Foto Siswa</div>
                <div id="foto-preview" class="w-32 h-32 rounded-2xl bg-indigo-800/50 border-2 border-dashed border-indigo-500/50 flex items-center justify-center overflow-hidden">
                    <i class="fas fa-camera text-3xl text-indigo-400"></i>
                </div>
                <label class="cursor-pointer">
                    <span class="bg-indigo-600/50 hover:bg-indigo-600 text-white text-xs rounded-xl px-4 py-2 transition">
                        <i class="fas fa-upload mr-1"></i> Pilih Foto
                    </span>
                    <input type="file" name="foto" id="fotoInput" accept="image/*" class="hidden" onchange="previewFoto(this)">
                </label>
                <p class="text-xs text-indigo-400 text-center">JPG/PNG, maks 2MB</p>
            </div>

            {{-- Data Diri --}}
            <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Diri</h3>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Nama Lengkap <span class="text-red-400">*</span></label>
                        <input type="text" name="nama" value="{{ old('nama') }}" required
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        @error('nama') <p class="text-red-400 text-xs mt-1">{{ $message }}</p> @enderror
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NIS <span class="text-red-400">*</span></label>
                        <input type="text" name="nis" value="{{ old('nis') }}" required
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 font-mono">
                        @error('nis') <p class="text-red-400 text-xs mt-1">{{ $message }}</p> @enderror
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NISN</label>
                        <input type="text" name="nisn" value="{{ old('nisn') }}"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 font-mono">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Jenis Kelamin</label>
                        <select name="kelamin" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            <option value="L" {{ old('kelamin')=='L'?'selected':'' }}>Laki-laki</option>
                            <option value="P" {{ old('kelamin')=='P'?'selected':'' }}>Perempuan</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Tempat Lahir</label>
                        <input type="text" name="tempat_lahir" value="{{ old('tempat_lahir') }}"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Tanggal Lahir</label>
                        <input type="date" name="tgl_lahir" value="{{ old('tgl_lahir') }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Agama</label>
                        <select name="agama" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            @foreach(['Islam','Kristen','Katolik','Hindu','Buddha','Konghucu'] as $a)
                            <option value="{{ $a }}" {{ old('agama')==$a?'selected':'' }}>{{ $a }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Email</label>
                        <input type="email" name="email" value="{{ old('email') }}"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">No. Telepon</label>
                        <input type="text" name="telp" value="{{ old('telp') }}"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Alamat</label>
                        <textarea name="alamat" rows="2"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">{{ old('alamat') }}</textarea>
                    </div>
                </div>
            </div>

            {{-- Kelas & Akun --}}
            <div class="lg:col-span-3 grid grid-cols-1 sm:grid-cols-2 gap-6">
                <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                    <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Kelas</h3>
                    <div class="space-y-3">
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">
                                Kelas
                                @if($tapelAktif)
                                <span class="ml-1 text-xs text-indigo-400 font-normal">
                                    — TA {{ $tapelAktif->tahun_ajaran }}
                                </span>
                                @endif
                            </label>
                            <select name="id_kelas" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                                <option value="">-- Pilih Kelas --</option>
                                @forelse($kelasList as $k)
                                <option value="{{ $k->id_kelas }}" {{ old('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                                @empty
                                <option value="" disabled>Tidak ada kelas aktif pada tahun ajaran ini</option>
                                @endforelse
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">No Absen</label>
                            <input type="number" name="no_absen" value="{{ old('no_absen') }}" min="1"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Tanggal Daftar</label>
                            <input type="date" name="tgl_daftar" value="{{ old('tgl_daftar', date('Y-m-d')) }}"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div class="flex items-center gap-2">
                            <input type="checkbox" name="active" id="active" value="1" checked class="w-4 h-4 rounded accent-indigo-500">
                            <label for="active" class="text-sm text-indigo-200">Status Aktif</label>
                        </div>
                    </div>
                </div>

                <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                    <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Orang Tua</h3>
                    <div class="space-y-3">
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Nama Ayah</label>
                            <input type="text" name="nama_ayah" value="{{ old('nama_ayah') }}"
                                class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Nama Ibu</label>
                            <input type="text" name="nama_ibu" value="{{ old('nama_ibu') }}"
                                class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">No. HP Orang Tua</label>
                            <input type="text" name="hp_ortu" value="{{ old('hp_ortu') }}"
                                class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Pekerjaan Ayah</label>
                            <input type="text" name="pekerjaan_ayah" value="{{ old('pekerjaan_ayah') }}"
                                class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                    </div>
                </div>
            </div>

            {{-- Actions --}}
            <div class="lg:col-span-3 flex gap-3">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Simpan
                </button>
                <a href="{{ route('admin.siswa.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">
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
        reader.onload = e => {
            const prev = document.getElementById('foto-preview');
            prev.innerHTML = `<img src="${e.target.result}" class="w-full h-full object-cover">`;
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
@endpush
