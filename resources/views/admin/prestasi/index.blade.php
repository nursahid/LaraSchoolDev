@extends('layouts.admin')

@section('page-title', 'Prestasi Siswa')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Prestasi</li>
@endsection

@section('content')
<div class="space-y-4">

    {{-- Toolbar --}}
    <div class="flex flex-col sm:flex-row gap-3 items-start sm:items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap items-center">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari nama siswa / prestasi..."
                class="bg-white/10 border border-white/20 text-white placeholder-indigo-300 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 w-52">
            <select name="jenis" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Jenis</option>
                <option value="Akademik" {{ request('jenis')=='Akademik'?'selected':'' }}>Akademik</option>
                <option value="Non Akademik" {{ request('jenis')=='Non Akademik'?'selected':'' }}>Non Akademik</option>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-search mr-1"></i> Cari
            </button>
            @if(request()->hasAny(['search','jenis']))
            <a href="{{ route('admin.prestasi.index') }}" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-times mr-1"></i> Reset
            </a>
            @endif
        </form>

        <button onclick="document.getElementById('modalForm').classList.remove('hidden')"
            class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition shrink-0">
            <i class="fas fa-plus mr-1"></i> Tambah Prestasi
        </button>
    </div>

    {{-- Table --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-4 py-2.5 border-b border-white/10 text-indigo-300 text-sm">
            Total: <strong class="text-white">{{ $prestasiList->count() }}</strong> prestasi
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3">Nama Prestasi / Lomba</th>
                        <th class="px-4 py-3">Jenis</th>
                        <th class="px-4 py-3">Level</th>
                        <th class="px-4 py-3">Tanggal</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($prestasiList as $i => $p)
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-indigo-300">{{ $i + 1 }}</td>
                        <td class="px-4 py-2.5">
                            <div class="text-white font-medium">{{ $p->nama_siswa }}</div>
                            @if($p->nis)<div class="text-indigo-400 text-xs font-mono">{{ $p->nis }}</div>@endif
                        </td>
                        <td class="px-4 py-2.5 text-indigo-100">{{ $p->nama_prestasi }}</td>
                        <td class="px-4 py-2.5">
                            <span class="px-2 py-0.5 rounded text-xs {{ $p->jenis_prestasi == 'Akademik' ? 'bg-sky-500/20 text-sky-300' : 'bg-purple-500/20 text-purple-300' }}">
                                {{ $p->jenis_prestasi }}
                            </span>
                        </td>
                        <td class="px-4 py-2.5">
                            <span class="px-2 py-0.5 rounded text-xs bg-indigo-500/20 text-indigo-300">{{ $p->level_prestasi }}</span>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-300 text-xs">
                            {{ \Carbon\Carbon::parse($p->tgl_perolehan)->format('d M Y') }}
                        </td>
                        <td class="px-4 py-2.5">
                            <div class="flex justify-center gap-1">
                                <a href="{{ route('admin.prestasi.edit', $p->id_prestasi) }}"
                                   class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition" title="Edit">
                                    <i class="fas fa-edit text-xs"></i>
                                </a>
                                <form id="del-pr{{ $p->id_prestasi }}" action="{{ route('admin.prestasi.destroy', $p->id_prestasi) }}" method="POST">
                                    @csrf @method('DELETE')
                                    <button type="button" onclick="confirmDelete('del-pr{{ $p->id_prestasi }}', '{{ addslashes($p->nama_prestasi) }}')"
                                        class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition" title="Hapus">
                                        <i class="fas fa-trash text-xs"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="px-4 py-10 text-center text-indigo-400">
                            <i class="fas fa-trophy text-2xl mb-2 block opacity-30"></i>
                            Belum ada data prestasi
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

{{-- Modal Tambah --}}
<div id="modalForm" class="hidden fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
    <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-lg">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-white font-semibold">Tambah Prestasi</h3>
            <button onclick="document.getElementById('modalForm').classList.add('hidden')" class="text-indigo-400 hover:text-white">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <form action="{{ route('admin.prestasi.store') }}" method="POST">
            @csrf
            <div class="grid grid-cols-2 gap-3">
                <div class="col-span-2">
                    <label class="block text-sm text-indigo-200 mb-1">Siswa <span class="text-red-400">*</span></label>
                    <select name="id_siswa" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Pilih Siswa --</option>
                        @foreach($siswaList as $s)
                        <option value="{{ $s->id_siswa }}">{{ $s->nama }} ({{ $s->nis }})</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-span-2">
                    <label class="block text-sm text-indigo-200 mb-1">Nama Prestasi / Lomba <span class="text-red-400">*</span></label>
                    <input type="text" name="nama_prestasi" required placeholder="Olimpiade Matematika Tingkat Kabupaten"
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Jenis <span class="text-red-400">*</span></label>
                    <select name="jenis_prestasi" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="Akademik">Akademik</option>
                        <option value="Non Akademik">Non Akademik</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Level <span class="text-red-400">*</span></label>
                    <select name="level_prestasi" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="Sekolah">Sekolah</option>
                        <option value="Kecamatan">Kecamatan</option>
                        <option value="Kabupaten/Kota">Kabupaten/Kota</option>
                        <option value="Provinsi">Provinsi</option>
                        <option value="Nasional">Nasional</option>
                        <option value="Internasional">Internasional</option>
                    </select>
                </div>
                <div class="col-span-2">
                    <label class="block text-sm text-indigo-200 mb-1">Tanggal Perolehan <span class="text-red-400">*</span></label>
                    <input type="date" name="tgl_perolehan" required value="{{ date('Y-m-d') }}"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="col-span-2 flex gap-3 pt-2">
                    <button type="submit" class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i> Simpan
                    </button>
                    <button type="button" onclick="document.getElementById('modalForm').classList.add('hidden')"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">Batal</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
