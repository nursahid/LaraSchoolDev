@extends('layouts.admin')

@section('page-title', 'Guru Mapel')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Guru Mapel</li>
@endsection

@section('content')
<div class="space-y-5" x-data="{ showModal: false }">

    {{-- ── Filter ──────────────────────────────────────────────────────── --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 p-4">
        <form method="GET" action="{{ route('admin.pegawai-mapel.index') }}" class="flex flex-wrap gap-3 items-end">
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Tahun Ajaran</label>
                <select name="tapel" onchange="this.form.submit()"
                    class="bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    @foreach($tapelList as $tp)
                    <option value="{{ $tp->id_tahunajaran }}" {{ $tapelFilter == $tp->id_tahunajaran ? 'selected' : '' }}>
                        {{ $tp->tahun_ajaran }}{{ $tp->status === '1' ? ' ★' : '' }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Semester</label>
                <select name="semester" onchange="this.form.submit()"
                    class="bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    @foreach($semesterList as $sm)
                    <option value="{{ $sm->id_semester }}" {{ $semesterFilter == $sm->id_semester ? 'selected' : '' }}>
                        {{ $sm->semester }}{{ $sm->status === '1' ? ' ★' : '' }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="ml-auto">
                <button type="button" @click="showModal = true"
                    class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                    <i class="fas fa-plus mr-1"></i>Tambah Penugasan
                </button>
            </div>
        </form>
    </div>

    {{-- ── Table ───────────────────────────────────────────────────────── --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-5 py-4 bg-indigo-900/50 border-b border-white/10 flex items-center justify-between">
            <div>
                <h3 class="text-white font-semibold text-sm flex items-center gap-2">
                    <i class="fas fa-chalkboard-teacher text-indigo-400"></i>
                    Penugasan Guru Mata Pelajaran
                </h3>
                <p class="text-xs text-indigo-400 mt-0.5">
                    {{ $tapelMap->get($tapelFilter)?->tahun_ajaran ?? '-' }}
                    — {{ $semesterMap->get($semesterFilter)?->semester ?? '-' }}
                </p>
            </div>
            <span class="text-xs bg-indigo-600/40 text-indigo-200 rounded-lg px-3 py-1">
                {{ $assignments->count() }} Penugasan
            </span>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full text-sm" id="tblPegawaiMapel">
                <thead>
                    <tr class="border-b border-white/10">
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">No</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Guru</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Mata Pelajaran</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Tingkat</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Jurusan</th>
                        <th class="text-center px-4 py-3 text-indigo-300 font-medium text-xs">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($assignments as $i => $row)
                    <tr class="border-b border-white/5 hover:bg-white/5 transition">
                        <td class="px-4 py-3 text-indigo-400 text-xs">{{ $i + 1 }}</td>
                        <td class="px-4 py-3">
                            <div class="font-medium text-white">{{ $row->pegawai?->nama ?? '-' }}</div>
                            @if($row->pegawai?->nip)
                            <div class="text-xs text-indigo-400 font-mono">{{ $row->pegawai->nip }}</div>
                            @endif
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-indigo-100">{{ $row->mapel?->nama_mapel ?? '-' }}</div>
                            @if($row->mapel?->kode)
                            <div class="text-xs text-indigo-500 font-mono">{{ $row->mapel->kode }}</div>
                            @endif
                        </td>
                        <td class="px-4 py-3 text-indigo-300 text-xs">{{ $row->tingkat?->nama_tingkat ?? '-' }}</td>
                        <td class="px-4 py-3 text-indigo-300 text-xs">{{ $row->jurusan?->nama_jurusan ?? '-' }}</td>
                        <td class="px-4 py-3 text-center">
                            <form id="del-pm{{ $row->id_pegawai_mapel }}"
                                  action="{{ route('admin.pegawai-mapel.destroy', $row->id_pegawai_mapel) }}"
                                  method="POST">
                                @csrf @method('DELETE')
                                <button type="button"
                                    onclick="confirmDelete('del-pm{{ $row->id_pegawai_mapel }}', '{{ addslashes($row->pegawai?->nama) }} — {{ addslashes($row->mapel?->nama_mapel) }}')"
                                    class="text-xs bg-red-500/20 hover:bg-red-500/40 text-red-300 rounded-lg px-3 py-1.5 transition">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="px-5 py-10 text-center text-indigo-400">
                            <i class="fas fa-user-slash text-3xl mb-2 block opacity-30"></i>
                            Belum ada penugasan guru untuk periode ini.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    {{-- ── Modal Tambah ─────────────────────────────────────────────────── --}}
    <div x-show="showModal" x-cloak
         class="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
        <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-lg">
            <div class="flex items-center justify-between mb-5">
                <h3 class="text-white font-semibold">Tambah Penugasan Guru</h3>
                <button @click="showModal = false" class="text-indigo-400 hover:text-white">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            <form action="{{ route('admin.pegawai-mapel.store') }}" method="POST" class="space-y-4">
                @csrf
                <div class="grid grid-cols-2 gap-3">
                    <div class="col-span-2">
                        <label class="block text-xs text-indigo-300 mb-1">Guru <span class="text-red-400">*</span></label>
                        <select name="id_pegawai" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih Guru --</option>
                            @foreach($guruList as $g)
                            <option value="{{ $g->id_pegawai }}">{{ $g->nama }}{{ $g->nip ? ' ('.$g->nip.')' : '' }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-span-2">
                        <label class="block text-xs text-indigo-300 mb-1">Mata Pelajaran <span class="text-red-400">*</span></label>
                        <select name="id_mapel" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih Mata Pelajaran --</option>
                            @foreach($mapelList as $m)
                            <option value="{{ $m->id_mapel }}">{{ $m->nama_mapel }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs text-indigo-300 mb-1">
                            Tingkat <span class="text-red-400">*</span>
                            <span class="ml-1 font-normal opacity-60">({{ $jenjang }})</span>
                        </label>
                        <select name="id_tingkat" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih --</option>
                            @foreach($tingkatList as $t)
                            <option value="{{ $t->id_tingkat }}">{{ $t->nama_tingkat }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs text-indigo-300 mb-1">Jurusan <span class="text-red-400">*</span></label>
                        @if($jurusanList->count() > 1)
                        {{-- SMA: tampilkan dropdown --}}
                        <select name="id_jurusan" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih --</option>
                            @foreach($jurusanList as $j)
                            <option value="{{ $j->id_jurusan }}">{{ $j->nama_jurusan }}</option>
                            @endforeach
                        </select>
                        @else
                        {{-- SD/SMP: jurusan tunggal, kirim sebagai hidden --}}
                        <input type="hidden" name="id_jurusan" value="{{ $jurusanList->first()?->id_jurusan }}">
                        <div class="w-full bg-white/5 border border-white/10 text-indigo-300 rounded-xl px-3 py-2 text-sm italic">
                            {{ $jurusanList->first()?->nama_jurusan ?? '-' }}
                        </div>
                        @endif
                    </div>
                    <div class="col-span-2">
                        <label class="block text-xs text-indigo-300 mb-1">Tahun Ajaran <span class="text-red-400">*</span></label>
                        @if($tapelAktif)
                        <input type="hidden" name="tapel" value="{{ $tapelAktif->id_tahunajaran }}">
                        <div class="w-full bg-white/5 border border-white/10 text-white rounded-xl px-3 py-2 text-sm flex items-center gap-2">
                            <i class="fas fa-calendar-check text-indigo-400 text-xs"></i>
                            <span>{{ $tapelAktif->tahun_ajaran }}</span>
                            <span class="ml-auto text-xs bg-green-500/20 text-green-300 rounded-lg px-2 py-0.5">Aktif</span>
                        </div>
                        @else
                        <div class="w-full bg-amber-500/10 border border-amber-500/30 text-amber-300 rounded-xl px-3 py-2 text-sm">
                            <i class="fas fa-exclamation-triangle mr-1"></i> Belum ada tahun ajaran aktif
                        </div>
                        @endif
                    </div>
                    <div>
                        <label class="block text-xs text-indigo-300 mb-1">Semester <span class="text-red-400">*</span></label>
                        <select name="semester" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            @foreach($semesterList as $sm)
                            <option value="{{ $sm->id_semester }}" {{ $semesterFilter == $sm->id_semester ? 'selected' : '' }}>
                                {{ $sm->semester }}
                            </option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="flex gap-3 pt-2 border-t border-white/10">
                    <button type="submit"
                        class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i>Simpan
                    </button>
                    <button type="button" @click="showModal = false"
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
    $('#tblPegawaiMapel').DataTable({
        language: { url: '//cdn.datatables.net/plug-ins/1.13.8/i18n/id.json' },
        pageLength: 25,
        order: [[2, 'asc'], [1, 'asc']],
        columnDefs: [{ orderable: false, targets: [0, 5] }],
    });
</script>
@endpush
