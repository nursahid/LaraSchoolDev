@extends('layouts.guru')

@section('page-title', 'Absensi Kelas')

@section('content')
<div class="space-y-5">
    {{-- Filter --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <form method="GET" class="flex flex-wrap gap-3">
            <div>
                <label class="block text-xs text-sky-300 mb-1">Kelas</label>
                <select name="id_kelas" class="bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                    <option value="">-- Pilih Kelas --</option>
                    @foreach($kelasList as $k)
                    <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-sky-300 mb-1">Tanggal</label>
                <input type="date" name="tgl" value="{{ request('tgl', date('Y-m-d')) }}"
                    class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
            </div>
        </form>
    </div>

    @if(request('id_kelas') && $siswaList->count())
    <form action="{{ route('guru.absensi.simpan') }}" method="POST">
        @csrf
        <input type="hidden" name="id_kelas" value="{{ request('id_kelas') }}">
        <input type="hidden" name="tgl" value="{{ request('tgl', date('Y-m-d')) }}">

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
            <div class="px-4 py-3 border-b border-white/10">
                <h3 class="text-white font-semibold">Absensi {{ now()->locale('id')->parse(request('tgl', now()))->isoFormat('dddd, D MMMM Y') }}</h3>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead class="bg-sky-900/50">
                        <tr class="text-sky-200 text-left">
                            <th class="px-4 py-3 w-10">No</th>
                            <th class="px-4 py-3">Nama Siswa</th>
                            <th class="px-4 py-3 text-center">Hadir</th>
                            <th class="px-4 py-3 text-center">Sakit</th>
                            <th class="px-4 py-3 text-center">Izin</th>
                            <th class="px-4 py-3 text-center">Alpha</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($siswaList as $i => $s)
                        <tr class="border-t border-white/5 hover:bg-white/5">
                            <td class="px-4 py-2 text-sky-300">{{ $s->no_absen }}</td>
                            <td class="px-4 py-2 text-white">{{ $s->nama }}</td>
                            <input type="hidden" name="siswa[{{ $i }}][id_siswa]" value="{{ $s->id_siswa }}">
                            @foreach(['hadir','sakit','izin','alpha'] as $ket)
                            <td class="px-4 py-2 text-center">
                                <input type="radio" name="siswa[{{ $i }}][keterangan]" value="{{ $ket }}"
                                    {{ ($s->keterangan ?? 'hadir') === $ket ? 'checked' : '' }}
                                    class="w-4 h-4 accent-sky-500 cursor-pointer">
                            </td>
                            @endforeach
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="p-4 border-t border-white/10 flex items-center gap-3">
                <button type="submit" class="bg-sky-600 hover:bg-sky-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Simpan Absensi
                </button>
                <button type="button" onclick="setAllHadir()" class="bg-white/10 hover:bg-white/20 text-sky-300 rounded-xl px-4 py-2.5 text-sm transition">
                    Tandai Semua Hadir
                </button>
            </div>
        </div>
    </form>
    @elseif(request('id_kelas'))
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">Tidak ada siswa di kelas ini.</div>
    @else
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">
        <i class="fas fa-hand-point-up text-3xl mb-2 block opacity-50"></i>
        Pilih kelas untuk mulai absensi.
    </div>
    @endif
</div>
@endsection

@push('scripts')
<script>
function setAllHadir() {
    document.querySelectorAll('input[type="radio"][value="hadir"]').forEach(el => el.checked = true);
}
</script>
@endpush
