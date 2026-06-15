@extends('layouts.admin')

@section('page-title', 'Log Aktivitas')

@section('breadcrumb')
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Log Aktivitas</li>
@endsection

@section('content')
<div class="space-y-5">

    {{-- Header --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
            <div>
                <h2 class="text-xl font-bold text-white flex items-center gap-2">
                    <i class="fas fa-history text-purple-300"></i> Log Aktivitas Sistem
                </h2>
                <p class="text-indigo-300 text-sm mt-0.5">Rekam jejak seluruh aktivitas pengguna secara real-time</p>
            </div>
            <div class="flex gap-2">
                <span class="bg-white/10 text-purple-200 text-xs px-3 py-1.5 rounded-lg border border-white/10">
                    <i class="fas fa-database mr-1"></i> {{ number_format($logs->total()) }} total log
                </span>
                <form method="POST" action="{{ route('admin.aktivitas.destroy-all') }}"
                      onsubmit="return confirm('Hapus SEMUA log aktivitas? Tindakan ini tidak bisa dibatalkan!')">
                    @csrf @method('DELETE')
                    <button type="submit"
                            class="bg-red-500/20 hover:bg-red-500/40 text-red-300 text-xs px-3 py-1.5 rounded-lg border border-red-500/30 transition">
                        <i class="fas fa-trash mr-1"></i>Bersihkan Semua
                    </button>
                </form>
            </div>
        </div>
    </div>

    {{-- Filter --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20">
        <form method="GET" class="flex flex-wrap gap-3 items-end">
            <div class="flex-1 min-w-[180px]">
                <label class="block text-xs text-indigo-300 mb-1">Cari deskripsi / nama user</label>
                <input type="text" name="search" value="{{ request('search') }}" placeholder="Ketik kata kunci..."
                    class="w-full bg-white/10 border border-white/20 text-white placeholder-white/30 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
            </div>
            <div class="min-w-[140px]">
                <label class="block text-xs text-indigo-300 mb-1">Modul</label>
                <select name="log_name" class="w-full bg-indigo-900/70 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    <option value="">Semua modul</option>
                    @foreach($logNames as $ln)
                    <option value="{{ $ln }}" {{ request('log_name') == $ln ? 'selected' : '' }}>
                        {{ ucfirst(str_replace('_', ' ', $ln)) }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="min-w-[130px]">
                <label class="block text-xs text-indigo-300 mb-1">Event</label>
                <select name="event" class="w-full bg-indigo-900/70 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    <option value="">Semua event</option>
                    @foreach(['created','updated','deleted','login','logout','login_failed'] as $ev)
                    <option value="{{ $ev }}" {{ request('event') == $ev ? 'selected' : '' }}>{{ ucfirst($ev) }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Dari tanggal</label>
                <input type="date" name="from" value="{{ request('from') }}"
                    class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Sampai tanggal</label>
                <input type="date" name="to" value="{{ request('to') }}"
                    class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
            </div>
            <div class="flex gap-2">
                <button type="submit"
                        class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition flex items-center gap-1">
                    <i class="fas fa-filter"></i> Filter
                </button>
                <a href="{{ route('admin.aktivitas.index') }}"
                   class="bg-white/10 hover:bg-white/20 text-white rounded-xl px-4 py-2 text-sm transition">
                    <i class="fas fa-times"></i>
                </a>
            </div>
        </form>
    </div>

    {{-- Table --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3 w-8">#</th>
                        <th class="px-4 py-3">Waktu</th>
                        <th class="px-4 py-3">User</th>
                        <th class="px-4 py-3">Event</th>
                        <th class="px-4 py-3">Modul</th>
                        <th class="px-4 py-3">Deskripsi</th>
                        <th class="px-4 py-3">IP</th>
                        <th class="px-4 py-3 text-center">Detail</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($logs as $i => $log)
                    @php
                        $event = $log->event ?? 'info';
                        $eventColor = match(true) {
                            in_array($event, ['created'])           => 'green',
                            in_array($event, ['updated'])           => 'amber',
                            in_array($event, ['deleted'])           => 'red',
                            in_array($event, ['login'])             => 'sky',
                            in_array($event, ['logout'])            => 'slate',
                            in_array($event, ['login_failed'])      => 'orange',
                            default                                 => 'indigo',
                        };
                        $eventLabel = match($event) {
                            'created'      => 'Tambah',
                            'updated'      => 'Edit',
                            'deleted'      => 'Hapus',
                            'login'        => 'Login',
                            'logout'       => 'Logout',
                            'login_failed' => 'Login Gagal',
                            default        => ucfirst($event),
                        };
                        $modulLabel = ucfirst(str_replace('_', ' ', $log->log_name ?? '-'));
                        $ip = $log->properties['ip'] ?? '-';
                        $panel = $log->properties['panel'] ?? null;
                    @endphp
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-indigo-400 text-xs">{{ $logs->firstItem() + $i }}</td>

                        <td class="px-4 py-2.5 text-indigo-200 text-xs whitespace-nowrap">
                            {{ $log->created_at->format('d/m/Y') }}<br>
                            <span class="text-indigo-400">{{ $log->created_at->format('H:i:s') }}</span>
                        </td>

                        <td class="px-4 py-2.5">
                            @if($log->causer)
                            <div class="flex items-center gap-2">
                                <div class="w-7 h-7 rounded-full bg-indigo-700 flex items-center justify-center text-xs text-white font-bold flex-shrink-0">
                                    {{ strtoupper(substr($log->causer->name, 0, 1)) }}
                                </div>
                                <div>
                                    <div class="text-white text-xs font-medium leading-none">{{ $log->causer->name }}</div>
                                    @if($panel)
                                    <div class="text-indigo-400 text-[10px]">{{ ucfirst($panel) }}</div>
                                    @endif
                                </div>
                            </div>
                            @else
                            <span class="text-indigo-400 text-xs italic">Sistem</span>
                            @endif
                        </td>

                        <td class="px-4 py-2.5">
                            <span class="bg-{{ $eventColor }}-500/20 text-{{ $eventColor }}-300 rounded-lg px-2 py-0.5 text-xs font-medium border border-{{ $eventColor }}-500/30">
                                {{ $eventLabel }}
                            </span>
                        </td>

                        <td class="px-4 py-2.5">
                            <span class="bg-purple-500/20 text-purple-300 rounded-lg px-2 py-0.5 text-xs border border-purple-500/20">
                                {{ $modulLabel }}
                            </span>
                        </td>

                        <td class="px-4 py-2.5 text-indigo-100 text-xs max-w-xs">
                            {{ $log->description }}
                        </td>

                        <td class="px-4 py-2.5 text-indigo-400 font-mono text-xs">{{ $ip }}</td>

                        <td class="px-4 py-2.5 text-center">
                            @if($log->properties->count() > 1 || ($log->properties->has('attributes') || $log->properties->has('old')))
                            <button onclick="showDetail({{ $log->id }})" class="text-indigo-300 hover:text-white text-xs transition">
                                <i class="fas fa-eye"></i>
                            </button>
                            {{-- Hidden detail data --}}
                            <div id="detail-{{ $log->id }}" class="hidden">
                                @if($log->properties->has('old'))
                                <div class="mb-2">
                                    <div class="text-red-300 text-xs font-semibold mb-1">Sebelum:</div>
                                    <pre class="text-xs text-red-200 bg-red-900/20 rounded p-2 text-left overflow-auto max-h-32">{{ json_encode($log->properties['old'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) }}</pre>
                                </div>
                                @endif
                                @if($log->properties->has('attributes'))
                                <div>
                                    <div class="text-green-300 text-xs font-semibold mb-1">Sesudah:</div>
                                    <pre class="text-xs text-green-200 bg-green-900/20 rounded p-2 text-left overflow-auto max-h-32">{{ json_encode($log->properties['attributes'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) }}</pre>
                                </div>
                                @endif
                                @if(!$log->properties->has('old') && !$log->properties->has('attributes'))
                                <pre class="text-xs text-indigo-200 bg-indigo-900/20 rounded p-2 text-left overflow-auto max-h-48">{{ json_encode($log->properties->toArray(), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) }}</pre>
                                @endif
                            </div>
                            @else
                            <span class="text-white/20 text-xs">—</span>
                            @endif
                        </td>

                        <td class="px-4 py-2.5 text-center">
                            <form method="POST" action="{{ route('admin.aktivitas.destroy', $log->id) }}" class="inline">
                                @csrf @method('DELETE')
                                <button type="submit" onclick="return confirm('Hapus log ini?')"
                                        class="text-red-400 hover:text-red-300 text-xs transition">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="9" class="px-4 py-12 text-center">
                            <i class="fas fa-history text-3xl text-indigo-600 mb-3 block"></i>
                            <p class="text-indigo-400">Tidak ada log aktivitas ditemukan</p>
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @if($logs->hasPages())
        <div class="px-4 py-3 border-t border-white/10">
            {{ $logs->appends(request()->query())->links() }}
        </div>
        @endif
    </div>

</div>

{{-- Modal Detail --}}
<div id="modalDetail" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/60 backdrop-blur-sm p-4">
    <div class="bg-indigo-900/95 border border-white/20 rounded-2xl shadow-2xl w-full max-w-lg">
        <div class="flex items-center justify-between px-5 py-4 border-b border-white/10">
            <h3 class="text-white font-semibold flex items-center gap-2">
                <i class="fas fa-code text-purple-300"></i> Detail Perubahan
            </h3>
            <button onclick="closeModal()" class="text-white/50 hover:text-white transition">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <div id="modalBody" class="px-5 py-4 max-h-[70vh] overflow-y-auto"></div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    function showDetail(id) {
        const content = document.getElementById('detail-' + id);
        if (!content) return;
        document.getElementById('modalBody').innerHTML = content.innerHTML;
        document.getElementById('modalDetail').classList.remove('hidden');
        document.getElementById('modalDetail').classList.add('flex');
    }

    function closeModal() {
        document.getElementById('modalDetail').classList.add('hidden');
        document.getElementById('modalDetail').classList.remove('flex');
    }

    document.getElementById('modalDetail').addEventListener('click', function(e) {
        if (e.target === this) closeModal();
    });
</script>
@endpush
