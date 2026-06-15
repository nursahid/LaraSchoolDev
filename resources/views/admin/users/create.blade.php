@extends('layouts.admin')

@section('page-title', 'Tambah User')

@section('breadcrumb')
    <li><a href="{{ route('admin.users.index') }}" class="text-indigo-300 hover:text-white">Users</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Tambah</li>
@endsection

@section('content')
<div class="max-w-lg">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <form action="{{ route('admin.users.store') }}" method="POST">
            @csrf
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Nama <span class="text-red-400">*</span></label>
                    <input type="text" name="name" value="{{ old('name') }}" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    @error('name') <p class="text-red-400 text-xs mt-1">{{ $message }}</p> @enderror
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Email <span class="text-red-400">*</span></label>
                    <input type="email" name="email" value="{{ old('email') }}" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    @error('email') <p class="text-red-400 text-xs mt-1">{{ $message }}</p> @enderror
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Password <span class="text-red-400">*</span></label>
                    <input type="password" name="password" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-2">Role</label>
                    <div class="grid grid-cols-2 gap-2">
                        @foreach($roles as $role)
                        <label class="flex items-center gap-2 text-sm text-indigo-200 cursor-pointer">
                            <input type="checkbox" name="roles[]" value="{{ $role->name }}" class="accent-indigo-500 w-4 h-4">
                            {{ $role->name }}
                        </label>
                        @endforeach
                    </div>
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Simpan
                    </button>
                    <a href="{{ route('admin.users.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
