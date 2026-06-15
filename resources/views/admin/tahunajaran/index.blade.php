@extends('layouts.admin')

@section('page-title', 'Tahun Ajaran')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Tahun Ajaran</li>
@endsection

@section('content')
<div class="space-y-6">

    {{-- ── Header ──────────────────────────────────────────────────── --}}
    <div class="flex justify-between items-center">
        <p class="text-indigo-300 text-sm">Kelola tahun ajaran dan semester aktif sistem.</p>
        <button onclick="document.getElementById('modalTambah').classList.remove('hidden')"
            class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah
        </button>
    </div>

    {{-- ── Tahun Ajaran Cards ───────────────────────────────────────── --}}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        @forelse($tapelList as $t)
        @php $isAktif = $t->status === '1' || $t->status == 1; @endphp
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl border {{ $isAktif ? 'border-green-500/50 ring-1 ring-green-500/30' : 'border-white/20' }} hover:bg-white/15 transition relative flex flex-col">
            <div class="p-5 flex-1">
                @if($isAktif)
                <span class="absolute top-3 right-3 bg-green-500/20 text-green-300 text-xs px-2 py-0.5 rounded-lg font-medium">
                    <i class="fas fa-circle text-green-400 text-[8px] mr-1"></i>Aktif
                </span>
                @endif

                <div class="text-xl font-bold text-white mb-1">{{ $t->tahun_ajaran }}</div>

                @if($isAktif && $semesterList->firstWhere('status', '1'))
                @php $smAktif = $semesterList->firstWhere('status', '1'); @endphp
                <div class="text-xs text-green-300 mb-2">
                    <i class="fas fa-calendar-check mr-1"></i>{{ $smAktif->semester }}
                </div>
                @elseif($t->tasm)
                <div class="text-sm text-indigo-300 mb-2">{{ $t->tasm }}</div>
                @endif

                <div class="text-xs text-indigo-400 space-y-0.5">
                    <div><span class="text-indigo-500">Mulai:</span> {{ $t->tahun_awal ? \Carbon\Carbon::parse($t->tahun_awal)->format('d/m/Y') : '-' }}</div>
                    <div><span class="text-indigo-500">Selesai:</span> {{ $t->tahun_akhir ? \Carbon\Carbon::parse($t->tahun_akhir)->format('d/m/Y') : '-' }}</div>
                </div>
            </div>

            @if(!$isAktif)
            <div class="px-5 pb-4">
                <form action="{{ route('admin.tahunajaran.aktifkan', $t->id_tahunajaran) }}" method="POST">
                    @csrf
                    <button type="submit" class="w-full text-center text-xs bg-indigo-600/40 hover:bg-indigo-600 text-white rounded-lg py-1.5 transition">
                        <i class="fas fa-check mr-1"></i>Jadikan Aktif
                    </button>
                </form>
            </div>
            @else
            <div class="px-5 pb-4 pt-2 border-t border-white/10 mt-2">
                <span class="text-xs text-green-400 flex items-center gap-1">
                    <i class="fas fa-lock-open"></i> Tahun ajaran ini sedang berjalan
                </span>
            </div>
            @endif
        </div>
        @empty
        <div class="col-span-3 text-center py-8 text-indigo-400">Belum ada data tahun ajaran.</div>
        @endforelse
    </div>

    {{-- ── Semester Panel (only when tapel aktif exists) ───────────── --}}
    @if($tapelAktif)
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-5 py-4 bg-indigo-900/50 border-b border-white/10 flex items-center justify-between">
            <div>
                <h3 class="text-white font-semibold flex items-center gap-2">
                    <i class="fas fa-calendar-alt text-indigo-400"></i>
                    Semester
                </h3>
                <p class="text-xs text-indigo-400 mt-0.5">
                    Tahun ajaran aktif: <span class="text-indigo-200 font-medium">{{ $tapelAktif->tahun_ajaran }}</span>
                </p>
            </div>
            @php $semAktif = $semesterList->firstWhere('status', '1'); @endphp
            @if($semAktif)
            <span class="text-xs bg-green-500/20 text-green-300 border border-green-500/30 rounded-lg px-3 py-1">
                <i class="fas fa-check-circle mr-1"></i>{{ $semAktif->semester }}
            </span>
            @else
            <span class="text-xs bg-yellow-500/20 text-yellow-300 border border-yellow-500/30 rounded-lg px-3 py-1">
                <i class="fas fa-exclamation-circle mr-1"></i>Belum ada semester aktif
            </span>
            @endif
        </div>

        <div class="p-5">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                @forelse($semesterList as $s)
                @php $smIsAktif = $s->status === '1'; @endphp
                <div class="rounded-xl border {{ $smIsAktif ? 'border-green-500/50 bg-green-500/10' : 'border-white/15 bg-white/5' }} p-4 flex items-center justify-between gap-4 transition">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl {{ $smIsAktif ? 'bg-green-500/20' : 'bg-indigo-900/50' }} flex items-center justify-center">
                            <i class="fas {{ $smIsAktif ? 'fa-calendar-check text-green-400' : 'fa-calendar text-indigo-400' }}"></i>
                        </div>
                        <div>
                            <div class="text-sm font-medium {{ $smIsAktif ? 'text-green-200' : 'text-indigo-100' }}">
                                {{ $s->semester }}
                            </div>
                            @if($smIsAktif)
                            <div class="text-xs text-green-400 mt-0.5">
                                <i class="fas fa-circle text-[8px] mr-1"></i>Sedang berjalan
                            </div>
                            @else
                            <div class="text-xs text-indigo-500 mt-0.5">Non-aktif</div>
                            @endif
                        </div>
                    </div>

                    <form action="{{ route('admin.tahunajaran.semester.toggle', $s->id_semester) }}" method="POST">
                        @csrf
                        @if($smIsAktif)
                        <button type="submit"
                            class="text-xs bg-red-500/20 hover:bg-red-500/40 text-red-300 border border-red-500/30 rounded-lg px-3 py-1.5 transition whitespace-nowrap">
                            <i class="fas fa-times mr-1"></i>Non-aktifkan
                        </button>
                        @else
                        <button type="submit"
                            class="text-xs bg-indigo-600/50 hover:bg-indigo-600 text-white rounded-lg px-3 py-1.5 transition whitespace-nowrap">
                            <i class="fas fa-check mr-1"></i>Aktifkan
                        </button>
                        @endif
                    </form>
                </div>
                @empty
                <div class="col-span-2 text-center py-4 text-indigo-400 text-sm">Belum ada data semester.</div>
                @endforelse
            </div>
        </div>
    </div>
    @endif

</div>

{{-- ── Modal Tambah ─────────────────────────────────────────────── --}}
<div id="modalTambah" class="hidden fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
    <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-md">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-white font-semibold">Tambah Tahun Ajaran</h3>
            <button onclick="document.getElementById('modalTambah').classList.add('hidden')" class="text-indigo-400 hover:text-white">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <form action="{{ route('admin.tahunajaran.store') }}" method="POST">
            @csrf
            <div class="space-y-3">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Tahun Ajaran <span class="text-red-400">*</span></label>
                    <input type="text" name="tahun_ajaran" placeholder="2025-2026" required
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Keterangan <span class="text-indigo-500 text-xs">(opsional, maks. 5 karakter)</span></label>
                    <input type="text" name="tasm" placeholder="Contoh: G/G" maxlength="5"
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="grid grid-cols-2 gap-3">
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Tgl Mulai <span class="text-red-400">*</span></label>
                        <input type="date" name="tahun_awal" required
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 [color-scheme:dark]">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Tgl Selesai <span class="text-red-400">*</span></label>
                        <input type="date" name="tahun_akhir" required
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 [color-scheme:dark]">
                    </div>
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i>Simpan
                    </button>
                    <button type="button" onclick="document.getElementById('modalTambah').classList.add('hidden')"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">Batal</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
