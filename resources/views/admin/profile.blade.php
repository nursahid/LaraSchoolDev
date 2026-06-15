@extends('layouts.admin')

@section('page-title', 'Profil Saya')

@section('content')
<div class="max-w-2xl">
    <div class="grid gap-6">
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20 flex items-center gap-5">
            <img src="https://ui-avatars.com/api/?name={{ urlencode(auth()->user()->name) }}&background=6366f1&color=fff&size=100"
                 class="w-20 h-20 rounded-2xl ring-2 ring-indigo-400/30">
            <div>
                <h2 class="text-xl font-bold text-white">{{ auth()->user()->name }}</h2>
                <p class="text-indigo-300 text-sm">{{ auth()->user()->email }}</p>
                <div class="flex flex-wrap gap-1 mt-2">
                    @foreach(auth()->user()->roles as $role)
                    <span class="bg-indigo-600/30 text-indigo-200 rounded px-2 py-0.5 text-xs">{{ $role->name }}</span>
                    @endforeach
                </div>
            </div>
        </div>

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Update Profil</h3>
            <form action="{{ route('admin.profile.update') }}" method="POST">
                @csrf @method('PUT')
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Nama</label>
                        <input type="text" name="name" value="{{ old('name', auth()->user()->name) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Email</label>
                        <input type="email" name="email" value="{{ old('email', auth()->user()->email) }}"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Password Baru (kosongkan jika tidak diubah)</label>
                        <input type="password" name="password"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Konfirmasi Password</label>
                        <input type="password" name="password_confirmation"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Simpan
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
