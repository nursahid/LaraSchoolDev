@extends('layouts.admin')

@section('page-title', 'Menu Manager')

@section('breadcrumb')
    <li class="text-white/40">/</li>
    <li class="text-white">Menu Manager</li>
@endsection

@section('content')
<div x-data="menuManager()" class="space-y-6">

    {{-- ── Page Header ─────────────────────────────────────────────────────── --}}
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
        <div>
            <p class="text-indigo-300 text-sm">Kelola grup menu dan item menu yang tampil di sidebar admin.</p>
        </div>
        <button @click="openAddGroup()"
            class="inline-flex items-center gap-2 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl px-4 py-2 text-sm font-medium transition">
            <i class="fas fa-layer-group"></i>
            <span x-show="true" class="whitespace-nowrap">+ Tambah Group</span>
        </button>
    </div>

    {{-- ── Group Cards ──────────────────────────────────────────────────────── --}}
    @forelse($groups as $group)
    <div class="bg-white/5 backdrop-blur-sm rounded-2xl border {{ $group->is_active ? 'border-white/20' : 'border-red-500/20' }} overflow-hidden">

        {{-- Group Header --}}
        <div class="flex items-center justify-between px-5 py-4 bg-white/5 border-b border-white/10">
            <div class="flex items-center gap-3">
                <div class="w-8 h-8 rounded-lg bg-indigo-600/40 flex items-center justify-center">
                    <i class="fas fa-layer-group text-indigo-300 text-sm"></i>
                </div>
                <div>
                    <span class="text-white font-semibold text-sm">{{ $group->description ?? $group->name }}</span>
                    <span class="ml-2 text-indigo-400 text-xs font-mono">{{ $group->name }}</span>
                </div>
                @if(!$group->is_active)
                <span class="bg-red-500/20 text-red-300 text-xs px-2 py-0.5 rounded-full">Nonaktif</span>
                @else
                <span class="bg-green-500/20 text-green-300 text-xs px-2 py-0.5 rounded-full">Aktif</span>
                @endif
                <span class="text-indigo-500 text-xs">urutan: {{ $group->sort_order }}</span>
            </div>
            <div class="flex items-center gap-1">
                <button @click="openAddMenu({{ $group->id }}, {{ $group->menus->count() + 1 }})"
                    title="Tambah Menu"
                    class="w-8 h-8 rounded-lg bg-indigo-600/30 hover:bg-indigo-600/60 text-indigo-300 hover:text-white flex items-center justify-center transition text-xs">
                    <i class="fas fa-plus"></i>
                </button>
                <button @click="openEditGroup({{ $group->toJson() }})"
                    title="Edit Group"
                    class="w-8 h-8 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition text-xs">
                    <i class="fas fa-edit"></i>
                </button>
                <form action="{{ route('admin.menu-manager.groups.toggle', $group->id) }}" method="POST" class="inline">
                    @csrf
                    <button type="submit" title="{{ $group->is_active ? 'Nonaktifkan' : 'Aktifkan' }}"
                        class="w-8 h-8 rounded-lg {{ $group->is_active ? 'bg-green-500/20 hover:bg-green-500/40 text-green-300' : 'bg-gray-500/20 hover:bg-gray-500/40 text-gray-400' }} flex items-center justify-center transition text-xs">
                        <i class="fas {{ $group->is_active ? 'fa-toggle-on' : 'fa-toggle-off' }}"></i>
                    </button>
                </form>
                <form id="del-grp-{{ $group->id }}" action="{{ route('admin.menu-manager.groups.destroy', $group->id) }}" method="POST" class="inline">
                    @csrf @method('DELETE')
                    <button type="button"
                        onclick="confirmDelete('del-grp-{{ $group->id }}', '{{ addslashes($group->description ?? $group->name) }}')"
                        title="Hapus Group"
                        class="w-8 h-8 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition text-xs">
                        <i class="fas fa-trash"></i>
                    </button>
                </form>
            </div>
        </div>

        {{-- Menus Table --}}
        @if($group->menus->count())
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                    <tr class="text-indigo-300 text-xs text-left border-b border-white/5">
                        <th class="px-5 py-2 w-8">#</th>
                        <th class="px-5 py-2">Judul</th>
                        <th class="px-5 py-2">Route Name</th>
                        <th class="px-5 py-2">Permission</th>
                        <th class="px-5 py-2 w-12 text-center">Urutan</th>
                        <th class="px-5 py-2 w-20 text-center">Status</th>
                        <th class="px-5 py-2 w-28 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($group->menus as $menu)
                    <tr class="border-t border-white/5 hover:bg-white/5 transition {{ !$menu->is_active ? 'opacity-50' : '' }}">
                        <td class="px-5 py-2.5 text-indigo-400 text-xs">{{ $menu->sort_order }}</td>
                        <td class="px-5 py-2.5">
                            <div class="flex items-center gap-2">
                                @if($menu->icon)
                                <i class="fas {{ $menu->icon }} text-indigo-400 text-xs w-4"></i>
                                @else
                                <i class="fas fa-circle text-indigo-700 text-xs w-4"></i>
                                @endif
                                <span class="text-white font-medium">{{ $menu->title }}</span>
                            </div>
                        </td>
                        <td class="px-5 py-2.5">
                            @if($menu->route_name)
                            <span class="font-mono text-xs text-emerald-300">{{ $menu->route_name }}</span>
                            @else
                            <span class="text-indigo-600 text-xs italic">—</span>
                            @endif
                        </td>
                        <td class="px-5 py-2.5">
                            @if($menu->permission_name)
                            <span class="font-mono text-xs text-violet-300">{{ $menu->permission_name }}</span>
                            @else
                            <span class="text-indigo-600 text-xs italic">publik</span>
                            @endif
                        </td>
                        <td class="px-5 py-2.5 text-center text-indigo-300 text-xs">{{ $menu->sort_order }}</td>
                        <td class="px-5 py-2.5 text-center">
                            @if($menu->is_active)
                            <span class="bg-green-500/20 text-green-300 text-xs px-2 py-0.5 rounded-full">Aktif</span>
                            @else
                            <span class="bg-red-500/20 text-red-300 text-xs px-2 py-0.5 rounded-full">Nonaktif</span>
                            @endif
                        </td>
                        <td class="px-5 py-2.5">
                            <div class="flex items-center justify-center gap-1">
                                <button @click="openEditMenu({{ $menu->toJson() }})"
                                    title="Edit"
                                    class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition text-xs">
                                    <i class="fas fa-edit"></i>
                                </button>
                                <form action="{{ route('admin.menu-manager.menus.toggle', $menu->id) }}" method="POST" class="inline">
                                    @csrf
                                    <button type="submit" title="{{ $menu->is_active ? 'Nonaktifkan' : 'Aktifkan' }}"
                                        class="w-7 h-7 rounded-lg {{ $menu->is_active ? 'bg-green-500/20 hover:bg-green-500/40 text-green-300' : 'bg-gray-500/20 hover:bg-gray-500/40 text-gray-400' }} flex items-center justify-center transition text-xs">
                                        <i class="fas {{ $menu->is_active ? 'fa-eye' : 'fa-eye-slash' }}"></i>
                                    </button>
                                </form>
                                <form id="del-menu-{{ $menu->id }}" action="{{ route('admin.menu-manager.menus.destroy', $menu->id) }}" method="POST" class="inline">
                                    @csrf @method('DELETE')
                                    <button type="button"
                                        onclick="confirmDelete('del-menu-{{ $menu->id }}', '{{ addslashes($menu->title) }}')"
                                        title="Hapus"
                                        class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition text-xs">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        @else
        <div class="px-5 py-6 text-center text-indigo-500 text-sm">
            Belum ada menu.
            <button @click="openAddMenu({{ $group->id }}, 1)" class="ml-1 text-indigo-400 hover:text-white underline">Tambah sekarang</button>
        </div>
        @endif

    </div>
    @empty
    <div class="text-center py-16 text-indigo-500">
        <i class="fas fa-layer-group text-4xl mb-3 block"></i>
        Belum ada grup menu. <button @click="openAddGroup()" class="text-indigo-400 hover:text-white underline">Buat grup pertama</button>
    </div>
    @endforelse


    {{-- ════════════════════════════════════════════════════════════════════ --}}
    {{-- MODAL: Add / Edit Menu Group                                         --}}
    {{-- ════════════════════════════════════════════════════════════════════ --}}
    <div x-show="showGroupModal"
         class="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4"
         x-transition:enter="transition ease-out duration-150"
         x-transition:enter-start="opacity-0"
         x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-100"
         x-transition:leave-start="opacity-100"
         x-transition:leave-end="opacity-0"
         style="display:none">

        <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-md shadow-2xl"
             @click.stop
             x-transition:enter="transition ease-out duration-150"
             x-transition:enter-start="opacity-0 scale-95"
             x-transition:enter-end="opacity-100 scale-100">

            <div class="flex items-center justify-between mb-5">
                <h3 class="text-white font-semibold" x-text="groupForm.id ? 'Edit Group Menu' : 'Tambah Group Menu'"></h3>
                <button @click="showGroupModal = false" class="text-indigo-400 hover:text-white transition">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            <form x-ref="groupForm"
                  :action="groupForm.id ? `{{ url('admin/menu-manager/groups') }}/${groupForm.id}` : `{{ route('admin.menu-manager.groups.store') }}`"
                  method="POST">
                @csrf
                <input type="hidden" name="_method" x-bind:value="groupForm.id ? 'PUT' : 'POST'">

                <div class="space-y-4">
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Nama (slug) <span class="text-red-400">*</span></label>
                        <input type="text" name="name" x-model="groupForm.name" required placeholder="misal: master_sekolah"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        <p class="text-indigo-500 text-xs mt-1">Hanya huruf kecil, angka, dan underscore.</p>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Deskripsi / Label</label>
                        <input type="text" name="description" x-model="groupForm.description" placeholder="misal: Master Sekolah"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Icon (FontAwesome class)</label>
                        <input type="text" name="icon" x-model="groupForm.icon" placeholder="misal: heroicon-o-building-office"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Urutan <span class="text-red-400">*</span></label>
                            <input type="number" name="sort_order" x-model="groupForm.sort_order" min="0"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Status</label>
                            <label class="flex items-center gap-2 h-[38px] cursor-pointer">
                                <input type="hidden" name="is_active" value="0">
                                <input type="checkbox" name="is_active" value="1"
                                    x-bind:checked="groupForm.is_active"
                                    @change="groupForm.is_active = $event.target.checked ? 1 : 0"
                                    class="w-4 h-4 accent-indigo-500">
                                <span class="text-sm text-indigo-200">Aktif</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="flex gap-3 mt-6">
                    <button type="submit"
                        class="flex-1 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i>
                        <span x-text="groupForm.id ? 'Update' : 'Simpan'"></span>
                    </button>
                    <button type="button" @click="showGroupModal = false"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">
                        Batal
                    </button>
                </div>
            </form>
        </div>
    </div>


    {{-- ════════════════════════════════════════════════════════════════════ --}}
    {{-- MODAL: Add / Edit Menu Item                                          --}}
    {{-- ════════════════════════════════════════════════════════════════════ --}}
    <div x-show="showMenuModal"
         class="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4"
         x-transition:enter="transition ease-out duration-150"
         x-transition:enter-start="opacity-0"
         x-transition:enter-end="opacity-100"
         x-transition:leave="transition ease-in duration-100"
         x-transition:leave-start="opacity-100"
         x-transition:leave-end="opacity-0"
         style="display:none">

        <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-lg shadow-2xl"
             @click.stop
             x-transition:enter="transition ease-out duration-150"
             x-transition:enter-start="opacity-0 scale-95"
             x-transition:enter-end="opacity-100 scale-100">

            <div class="flex items-center justify-between mb-5">
                <h3 class="text-white font-semibold" x-text="menuForm.id ? 'Edit Menu' : 'Tambah Menu'"></h3>
                <button @click="showMenuModal = false" class="text-indigo-400 hover:text-white transition">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            <form x-ref="menuForm"
                  :action="menuForm.id ? `{{ url('admin/menu-manager/menus') }}/${menuForm.id}` : `{{ route('admin.menu-manager.menus.store') }}`"
                  method="POST">
                @csrf
                <input type="hidden" name="_method" x-bind:value="menuForm.id ? 'PUT' : 'POST'">
                <input type="hidden" name="menu_group_id" x-bind:value="menuForm.menu_group_id">

                <div class="space-y-4">
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Group Menu <span class="text-red-400">*</span></label>
                        <select name="menu_group_id" x-model="menuForm.menu_group_id"
                            class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            @foreach($groups as $g)
                            <option value="{{ $g->id }}">{{ $g->description ?? $g->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Judul <span class="text-red-400">*</span></label>
                        <input type="text" name="title" x-model="menuForm.title" required placeholder="misal: Data Siswa"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Route Name</label>
                        <input type="text" name="route_name" x-model="menuForm.route_name" placeholder="misal: admin.siswa.index"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        <p class="text-indigo-500 text-xs mt-1">Kosongkan jika belum ada route (menu akan dinonaktifkan).</p>
                    </div>
                    <div class="grid grid-cols-2 gap-3">
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Icon (fa-xxx)</label>
                            <input type="text" name="icon" x-model="menuForm.icon" placeholder="fa-home"
                                class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                        <div>
                            <label class="block text-sm text-indigo-200 mb-1">Urutan <span class="text-red-400">*</span></label>
                            <input type="number" name="sort_order" x-model="menuForm.sort_order" min="0"
                                class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Permission Name</label>
                        <input type="text" name="permission_name" x-model="menuForm.permission_name" placeholder="misal: siswa.view"
                            class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-500 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                        <p class="text-indigo-500 text-xs mt-1">Kosongkan agar menu muncul untuk semua role yang bisa akses panel ini.</p>
                    </div>
                    <div>
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="hidden" name="is_active" value="0">
                            <input type="checkbox" name="is_active" value="1"
                                x-bind:checked="menuForm.is_active"
                                @change="menuForm.is_active = $event.target.checked ? 1 : 0"
                                class="w-4 h-4 accent-indigo-500">
                            <span class="text-sm text-indigo-200">Aktifkan menu ini</span>
                        </label>
                    </div>
                </div>

                <div class="flex gap-3 mt-6">
                    <button type="submit"
                        class="flex-1 bg-indigo-600 hover:bg-indigo-500 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i>
                        <span x-text="menuForm.id ? 'Update' : 'Simpan'"></span>
                    </button>
                    <button type="button" @click="showMenuModal = false"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">
                        Batal
                    </button>
                </div>
            </form>
        </div>
    </div>

</div>
@endsection

@push('scripts')
<script>
function menuManager() {
    return {
        showGroupModal: false,
        showMenuModal:  false,

        groupForm: {
            id: null, name: '', description: '', icon: '',
            sort_order: 1, is_active: 1,
        },

        menuForm: {
            id: null, menu_group_id: null, title: '',
            route_name: '', icon: '', permission_name: '',
            sort_order: 1, is_active: 1,
        },

        openAddGroup() {
            this.groupForm = { id: null, name: '', description: '', icon: '', sort_order: {{ $groups->count() + 1 }}, is_active: 1 };
            this.showGroupModal = true;
        },

        openEditGroup(group) {
            this.groupForm = {
                id:          group.id,
                name:        group.name        ?? '',
                description: group.description ?? '',
                icon:        group.icon        ?? '',
                sort_order:  group.sort_order  ?? 0,
                is_active:   group.is_active   ? 1 : 0,
            };
            this.showGroupModal = true;
        },

        openAddMenu(groupId, nextOrder) {
            this.menuForm = {
                id: null, menu_group_id: groupId, title: '',
                route_name: '', icon: '', permission_name: '',
                sort_order: nextOrder, is_active: 1,
            };
            this.showMenuModal = true;
        },

        openEditMenu(menu) {
            this.menuForm = {
                id:              menu.id,
                menu_group_id:   menu.menu_group_id,
                title:           menu.title           ?? '',
                route_name:      menu.route_name      ?? '',
                icon:            menu.icon            ?? '',
                permission_name: menu.permission_name ?? '',
                sort_order:      menu.sort_order      ?? 0,
                is_active:       menu.is_active       ? 1 : 0,
            };
            this.showMenuModal = true;
        },
    };
}
</script>
@endpush
