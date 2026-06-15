@extends('layouts.admin')

@section('page-title', 'Manajemen User')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Users</li>
@endsection

@section('content')
<div class="space-y-4">
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2">
            <input type="text" name="q" value="{{ request('q') }}" placeholder="Cari nama / email..."
                class="bg-white/10 border border-white/20 text-white placeholder-indigo-300 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 w-56">
            <select name="role" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Role</option>
                @foreach($roles as $r)
                <option value="{{ $r->name }}" {{ request('role')==$r->name?'selected':'' }}>{{ $r->name }}</option>
                @endforeach
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-search mr-1"></i>Cari
            </button>
        </form>
        <a href="{{ route('admin.users.create') }}" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah User
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Avatar</th>
                        <th class="px-4 py-3">Nama / Email</th>
                        <th class="px-4 py-3">Role</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3">Bergabung</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($users as $i => $u)
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-3 text-indigo-300">{{ $users->firstItem() + $i }}</td>
                        <td class="px-4 py-3">
                            <img src="https://ui-avatars.com/api/?name={{ urlencode($u->name) }}&background=6366f1&color=fff&size=32"
                                 class="w-8 h-8 rounded-full">
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-white font-medium">{{ $u->name }}</div>
                            <div class="text-indigo-300 text-xs">{{ $u->email }}</div>
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex flex-wrap gap-1">
                                @foreach($u->roles as $role)
                                <span class="bg-indigo-600/30 text-indigo-200 rounded px-2 py-0.5 text-xs">{{ $role->name }}</span>
                                @endforeach
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded text-xs {{ $u->email_verified_at ? 'bg-green-500/20 text-green-300' : 'bg-red-500/20 text-red-300' }}">
                                {{ $u->email_verified_at ? 'Aktif' : 'Non-aktif' }}
                            </span>
                        </td>
                        <td class="px-4 py-3 text-indigo-300 text-xs">{{ $u->created_at->format('d/m/Y') }}</td>
                        <td class="px-4 py-3">
                            <div class="flex items-center justify-center gap-1">
                                <a href="{{ route('admin.users.edit', $u->id) }}" class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition">
                                    <i class="fas fa-edit text-xs"></i>
                                </a>
                                <form action="{{ route('admin.users.toggle-status', $u->id) }}" method="POST">
                                    @csrf
                                    <button type="submit" class="w-7 h-7 rounded-lg bg-blue-500/20 hover:bg-blue-500/40 text-blue-300 flex items-center justify-center transition" title="Toggle Status">
                                        <i class="fas fa-power-off text-xs"></i>
                                    </button>
                                </form>
                                @if($u->id !== auth()->id())
                                <form id="del-u{{ $u->id }}" action="{{ route('admin.users.destroy', $u->id) }}" method="POST">
                                    @csrf @method('DELETE')
                                    <button type="button" onclick="confirmDelete('del-u{{ $u->id }}', '{{ addslashes($u->name) }}')"
                                        class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition">
                                        <i class="fas fa-trash text-xs"></i>
                                    </button>
                                </form>
                                @endif
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="7" class="px-4 py-8 text-center text-indigo-400">Tidak ada data user</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @if($users->hasPages())
        <div class="px-4 py-3 border-t border-white/10">
            {{ $users->appends(request()->query())->links() }}
        </div>
        @endif
    </div>
</div>
@endsection
