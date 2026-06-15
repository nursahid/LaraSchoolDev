@extends('layouts.admin')

@section('page-title', 'Edit Pegawai')

@section('breadcrumb')
    <li><a href="{{ route('admin.pegawai.index') }}" class="text-indigo-300 hover:text-white">Pegawai</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Edit: {{ $pegawai->nama }}</li>
@endsection

@section('content')
<div class="max-w-4xl">
    <form action="{{ route('admin.pegawai.update', $pegawai->id_pegawai) }}" method="POST" enctype="multipart/form-data">
        @csrf @method('PUT')
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex flex-col items-center gap-4">
                <div class="text-white font-semibold text-sm">Foto</div>
                <div class="w-32 h-32 rounded-2xl overflow-hidden border-2 border-indigo-500/50">
                    <img id="fotoImg"
                        src="{{ $pegawai->foto ? asset('uploads/avatar/'.$pegawai->foto) : 'https://ui-avatars.com/api/?name='.urlencode($pegawai->nama).'&background=6366f1&color=fff&size=128' }}"
                        class="w-full h-full object-cover">
                </div>
                <label class="cursor-pointer">
                    <span class="bg-indigo-600/50 hover:bg-indigo-600 text-white text-xs rounded-xl px-4 py-2 transition">
                        <i class="fas fa-upload mr-1"></i>Ganti Foto
                    </span>
                    <input type="file" name="foto" accept="image/*" class="hidden" onchange="previewFoto(this)">
                </label>
            </div>

            <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Pegawai</h3>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Nama Lengkap <span class="text-red-400">*</span></label>
                        <input type="text" name="nama" value="{{ old('nama', $pegawai->nama) }}" required
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NIP</label>
                        <input type="text" name="nip" value="{{ old('nip', $pegawai->nip) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm font-mono focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Jabatan</label>
                        <select name="jabatan" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            @foreach(['guru','kepala_sekolah','wakasek','tata_usaha','bendahara','bk'] as $j)
                            <option value="{{ $j }}" {{ ($pegawai->jabatan ?? '')==$j?'selected':'' }}>{{ ucfirst(str_replace('_',' ',$j)) }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Email</label>
                        <input type="email" name="email" value="{{ old('email', $pegawai->email) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">No. Telepon</label>
                        <input type="text" name="hp" value="{{ old('hp', $pegawai->hp) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-2">Mata Pelajaran Diampu</label>
                        @php $selectedMapelIds = $pegawai->mapel->pluck('id_mapel')->toArray(); @endphp
                        <div class="grid grid-cols-2 gap-2 max-h-40 overflow-y-auto pr-1">
                            @foreach($mapelList as $m)
                            <label class="flex items-center gap-2 text-sm text-indigo-200 cursor-pointer">
                                <input type="checkbox" name="mapel_ids[]" value="{{ $m->id_mapel }}"
                                    {{ in_array($m->id_mapel, $selectedMapelIds) ? 'checked' : '' }}
                                    class="accent-indigo-500">
                                {{ $m->nama_mapel }}
                            </label>
                            @endforeach
                        </div>
                    </div>
                    <div class="flex items-center gap-2">
                        <input type="checkbox" name="is_active" id="is_active" value="1" {{ $pegawai->is_active ? 'checked' : '' }} class="w-4 h-4 accent-indigo-500">
                        <label for="is_active" class="text-sm text-indigo-200">Status Aktif</label>
                    </div>
                </div>
            </div>

            <div class="lg:col-span-3 flex gap-3">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Update
                </button>
                <a href="{{ route('admin.pegawai.show', $pegawai->id_pegawai) }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
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
