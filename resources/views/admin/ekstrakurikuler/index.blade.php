@extends('layouts.admin')

@section('page-title', 'Ekstrakurikuler')

@section('breadcrumb')
    <li><a href="{{ route('admin.dashboard') }}" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Ekstrakurikuler</li>
@endsection

@section('content')
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <p class="text-indigo-300 text-sm">Total: <strong class="text-white">{{ count($ekstraList) }}</strong> kegiatan</p>
        <button onclick="document.getElementById('modalTambah').classList.remove('hidden')"
            class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah
        </button>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        @forelse($ekstraList as $e)
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 hover:bg-white/15 transition">
            <div class="flex items-start justify-between mb-3">
                <div>
                    <h3 class="text-white font-semibold">{{ $e->nama_ekstra }}</h3>
                    <p class="text-indigo-300 text-xs mt-1">{{ $e->jadwal ?? '-' }}</p>
                </div>
                <span class="bg-indigo-600/30 text-indigo-200 rounded-lg px-2 py-0.5 text-xs">{{ $e->kategori ?? 'Umum' }}</span>
            </div>
            <p class="text-indigo-300 text-xs mb-3">Pembina: {{ $e->nama_pembina ?? '-' }}</p>
            @if($e->deskripsi)
            <p class="text-indigo-400 text-xs line-clamp-2">{{ $e->deskripsi }}</p>
            @endif
            <div class="flex gap-2 mt-3 pt-3 border-t border-white/10">
                <button onclick="editEkstra({{ json_encode($e) }})"
                    class="flex-1 text-center text-xs bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 rounded-lg py-1.5 transition">
                    <i class="fas fa-edit mr-1"></i>Edit
                </button>
                <form id="del-e{{ $e->id }}" action="{{ route('admin.ekstrakurikuler.destroy', $e->id) }}" method="POST">
                    @csrf @method('DELETE')
                    <button type="button" onclick="confirmDelete('del-e{{ $e->id }}', '{{ addslashes($e->nama_ekstra) }}')"
                        class="text-xs bg-red-500/20 hover:bg-red-500/40 text-red-300 rounded-lg px-3 py-1.5 transition">
                        <i class="fas fa-trash"></i>
                    </button>
                </form>
            </div>
        </div>
        @empty
        <div class="col-span-3 text-center py-8 text-indigo-400">Belum ada data ekstrakurikuler.</div>
        @endforelse
    </div>
</div>

{{-- Modal Tambah/Edit --}}
<div id="modalTambah" class="hidden fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
    <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-md">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-white font-semibold" id="modalTitle">Tambah Ekstrakurikuler</h3>
            <button onclick="closeModal()" class="text-indigo-400 hover:text-white"><i class="fas fa-times"></i></button>
        </div>
        <form id="ekstraForm" action="{{ route('admin.ekstrakurikuler.store') }}" method="POST">
            @csrf
            <div id="methodField"></div>
            <div class="space-y-3">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Nama Kegiatan <span class="text-red-400">*</span></label>
                    <input type="text" name="nama_ekstra" id="inp_nama" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Kategori</label>
                    <input type="text" name="kategori" id="inp_kategori"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Jadwal</label>
                    <input type="text" name="jadwal" id="inp_jadwal" placeholder="Misal: Setiap Jumat 14.00"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Nama Pembina</label>
                    <input type="text" name="nama_pembina" id="inp_pembina"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Deskripsi</label>
                    <textarea name="deskripsi" id="inp_deskripsi" rows="2"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400"></textarea>
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">Simpan</button>
                    <button type="button" onclick="closeModal()" class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">Batal</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection

@push('scripts')
<script>
function closeModal() {
    document.getElementById('modalTambah').classList.add('hidden');
    document.getElementById('ekstraForm').reset();
    document.getElementById('ekstraForm').action = '{{ route("admin.ekstrakurikuler.store") }}';
    document.getElementById('methodField').innerHTML = '';
    document.getElementById('modalTitle').textContent = 'Tambah Ekstrakurikuler';
}

function editEkstra(data) {
    document.getElementById('ekstraForm').action = `/admin/ekstrakurikuler/${data.id}`;
    document.getElementById('methodField').innerHTML = '<input type="hidden" name="_method" value="PUT">';
    document.getElementById('modalTitle').textContent = 'Edit Ekstrakurikuler';
    document.getElementById('inp_nama').value = data.nama_ekstra || '';
    document.getElementById('inp_kategori').value = data.kategori || '';
    document.getElementById('inp_jadwal').value = data.jadwal || '';
    document.getElementById('inp_pembina').value = data.nama_pembina || '';
    document.getElementById('inp_deskripsi').value = data.deskripsi || '';
    document.getElementById('modalTambah').classList.remove('hidden');
}
</script>
@endpush
