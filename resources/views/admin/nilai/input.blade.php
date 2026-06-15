@extends('layouts.admin')

@section('page-title', 'Input Nilai')

@section('breadcrumb')
    <li><a href="{{ route('admin.nilai.index') }}" class="text-indigo-300 hover:text-white">Nilai</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Input Nilai</li>
@endsection

@section('content')
<div class="space-y-5">
    {{-- Filter --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <form method="GET" class="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Kelas</label>
                <select name="id_kelas" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                    <option value="">-- Pilih Kelas --</option>
                    @foreach($kelasList as $k)
                    <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Mata Pelajaran</label>
                <select name="id_mapel" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                    <option value="">-- Pilih Mapel --</option>
                    @foreach($mapelList as $m)
                    <option value="{{ $m->id_mapel }}" {{ request('id_mapel')==$m->id_mapel?'selected':'' }}>{{ $m->nama_mapel }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Jenis Ujian</label>
                <select name="jenis_ujian" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                    <option value="harian" {{ request('jenis_ujian','harian')=='harian'?'selected':'' }}>Harian</option>
                    <option value="mid" {{ request('jenis_ujian')=='mid'?'selected':'' }}>Mid Semester</option>
                    <option value="semester" {{ request('jenis_ujian')=='semester'?'selected':'' }}>Akhir Semester</option>
                </select>
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Semester</label>
                <select name="semester" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                    <option value="1" {{ request('semester',1)==1?'selected':'' }}>Semester 1</option>
                    <option value="2" {{ request('semester')==2?'selected':'' }}>Semester 2</option>
                </select>
            </div>
        </form>
    </div>

    @if(request('id_kelas') && request('id_mapel') && $siswaList->count())
    {{-- Input Form --}}
    <form action="{{ route('admin.nilai.store-batch') }}" method="POST">
        @csrf
        <input type="hidden" name="id_kelas" value="{{ request('id_kelas') }}">
        <input type="hidden" name="id_mapel" value="{{ request('id_mapel') }}">
        <input type="hidden" name="jenis_ujian" value="{{ request('jenis_ujian', 'harian') }}">
        <input type="hidden" name="semester" value="{{ request('semester', 1) }}">
        <input type="hidden" name="tgl_penilaian" value="{{ date('Y-m-d') }}">

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
            <div class="p-4 border-b border-white/10 flex items-center justify-between">
                <h3 class="text-white font-semibold">
                    Input Nilai {{ ucfirst(request('jenis_ujian','harian')) }} — {{ request('nama_kelas') }}
                </h3>
                <div class="flex gap-2">
                    <button type="button" onclick="setAllNilai()" class="bg-indigo-600/50 hover:bg-indigo-600 text-white rounded-lg px-3 py-1.5 text-xs transition">
                        Isi Semua
                    </button>
                </div>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead class="bg-indigo-900/50">
                        <tr class="text-indigo-200 text-left">
                            <th class="px-4 py-3 w-10">No</th>
                            <th class="px-4 py-3">Nama Siswa</th>
                            <th class="px-4 py-3">NIS</th>
                            <th class="px-4 py-3 w-28">Nilai (0-100)</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($siswaList as $i => $s)
                        <tr class="border-t border-white/5 hover:bg-white/5">
                            <td class="px-4 py-2 text-indigo-300">{{ $s->id_siswa }}</td>
                            <td class="px-4 py-2 text-white">{{ $s->nama }}</td>
                            <td class="px-4 py-2 text-indigo-300 font-mono text-xs">{{ $s->nis }}</td>
                            <td class="px-4 py-2">
                                <input type="hidden" name="siswa[{{ $i }}][id_siswa]" value="{{ $s->id_siswa }}">
                                <input type="number" name="siswa[{{ $i }}][nilai]" value="{{ $s->existing_nilai ?? '' }}"
                                    min="0" max="100" placeholder="—"
                                    class="nilai-input w-20 bg-white/10 border border-white/20 text-white rounded-lg px-2 py-1 text-sm text-center focus:outline-none focus:border-indigo-400">
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="p-4 border-t border-white/10">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Simpan Nilai
                </button>
            </div>
        </div>
    </form>
    @elseif(request('id_kelas') && request('id_mapel'))
    <div class="bg-white/10 rounded-2xl p-8 text-center text-indigo-400 border border-white/20">
        <i class="fas fa-users-slash text-3xl mb-2 block opacity-50"></i>
        Tidak ada siswa di kelas ini.
    </div>
    @else
    <div class="bg-white/10 rounded-2xl p-8 text-center text-indigo-400 border border-white/20">
        <i class="fas fa-hand-point-up text-3xl mb-2 block opacity-50"></i>
        Pilih kelas dan mata pelajaran untuk mulai input nilai.
    </div>
    @endif
</div>
@endsection

@push('scripts')
<script>
function setAllNilai() {
    const val = prompt('Masukkan nilai untuk semua siswa:', '75');
    if (val !== null) {
        document.querySelectorAll('.nilai-input').forEach(el => { el.value = val; });
    }
}
</script>
@endpush
