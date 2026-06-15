@extends('layouts.guru')

@section('page-title', 'Profil Saya')

@section('content')
<div class="max-w-2xl space-y-5">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20 flex items-center gap-5">
        <img src="{{ $pegawai->foto ? asset('uploads/avatar/'.$pegawai->foto) : 'https://ui-avatars.com/api/?name='.urlencode($pegawai->nama ?? auth()->user()->name).'&background=0ea5e9&color=fff&size=100' }}"
             class="w-20 h-20 rounded-2xl object-cover ring-2 ring-sky-400/30">
        <div>
            <h2 class="text-xl font-bold text-white">{{ $pegawai->nama ?? auth()->user()->name }}</h2>
            <p class="text-sky-300 text-sm">{{ ucfirst(str_replace('_',' ',$pegawai->jabatan ?? 'Guru')) }}</p>
            <p class="text-sky-400 text-xs font-mono mt-1">NIP: {{ $pegawai->nip ?? '-' }}</p>
        </div>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <h3 class="text-white font-semibold mb-4">Informasi Akun</h3>
        <form action="{{ route('guru.profile.update') }}" method="POST">
            @csrf @method('PUT')
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-sky-200 mb-1">Nama</label>
                    <input type="text" name="name" value="{{ auth()->user()->name }}"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-sky-400">
                </div>
                <div>
                    <label class="block text-sm text-sky-200 mb-1">Email</label>
                    <input type="email" name="email" value="{{ auth()->user()->email }}"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-sky-400">
                </div>
                <div>
                    <label class="block text-sm text-sky-200 mb-1">Password Baru</label>
                    <input type="password" name="password" placeholder="Kosongkan jika tidak diubah"
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-sky-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-sky-400">
                </div>
                <button type="submit" class="bg-sky-600 hover:bg-sky-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Simpan
                </button>
            </div>
        </form>
    </div>
</div>
@endsection
