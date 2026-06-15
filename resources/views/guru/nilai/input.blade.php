@extends('layouts.guru')

@section('page-title', 'Input Nilai')

@section('content')
<div class="space-y-5">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <form method="GET" class="grid grid-cols-2 md:grid-cols-4 gap-3">
            <div>
                <label class="block text-xs text-sky-300 mb-1">Kelas</label>
                <select name="id_kelas" class="w-full bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                    <option value="">-- Pilih Kelas --</option>
                    @foreach($kelasList as $k)
                    <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-sky-300 mb-1">Mata Pelajaran</label>
                <select name="id_mapel" class="w-full bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                    <option value="">-- Pilih Mapel --</option>
                    @foreach($mapelList as $m)
                    <option value="{{ $m->id_mapel }}" {{ request('id_mapel')==$m->id_mapel?'selected':'' }}>{{ $m->nama_mapel }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <label class="block text-xs text-sky-300 mb-1">Jenis Ujian</label>
                <select name="jenis_ujian" class="w-full bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                    <option value="harian" {{ request('jenis_ujian','harian')=='harian'?'selected':'' }}>Harian</option>
                    <option value="mid" {{ request('jenis_ujian')=='mid'?'selected':'' }}>Mid Semester</option>
                    <option value="semester" {{ request('jenis_ujian')=='semester'?'selected':'' }}>Akhir Semester</option>
                </select>
            </div>
            <div>
                <label class="block text-xs text-sky-300 mb-1">Semester</label>
                <select name="semester" class="w-full bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                    <option value="1" {{ request('semester',1)==1?'selected':'' }}>Semester 1</option>
                    <option value="2" {{ request('semester')==2?'selected':'' }}>Semester 2</option>
                </select>
            </div>
        </form>
    </div>

    @if(request('id_kelas') && request('id_mapel') && $siswaList->count())
    <form action="{{ route('guru.nilai.store') }}" method="POST">
        @csrf
        <input type="hidden" name="id_kelas" value="{{ request('id_kelas') }}">
        <input type="hidden" name="id_mapel" value="{{ request('id_mapel') }}">
        <input type="hidden" name="jenis_ujian" value="{{ request('jenis_ujian', 'harian') }}">
        <input type="hidden" name="semester" value="{{ request('semester', 1) }}">

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
            <div class="px-4 py-3 border-b border-white/10 flex items-center justify-between">
                <h3 class="text-white font-semibold">Daftar Nilai</h3>
                <input type="date" name="tgl_penilaian" value="{{ date('Y-m-d') }}"
                    class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-1.5 text-xs focus:outline-none">
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead class="bg-sky-900/50">
                        <tr class="text-sky-200 text-left">
                            <th class="px-4 py-3 w-10">No</th>
                            <th class="px-4 py-3">Nama Siswa</th>
                            <th class="px-4 py-3">NIS</th>
                            <th class="px-4 py-3 w-32">Nilai</th>
                            <th class="px-4 py-3">Catatan</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($siswaList as $i => $s)
                        <tr class="border-t border-white/5 hover:bg-white/5">
                            <td class="px-4 py-2 text-sky-300">{{ $s->no_absen }}</td>
                            <td class="px-4 py-2 text-white">{{ $s->nama }}</td>
                            <td class="px-4 py-2 text-sky-300 font-mono text-xs">{{ $s->nis }}</td>
                            <td class="px-4 py-2">
                                <input type="hidden" name="siswa[{{ $i }}][id_siswa]" value="{{ $s->id_siswa }}">
                                <input type="number" name="siswa[{{ $i }}][nilai]" value="{{ $s->existing_nilai ?? '' }}"
                                    min="0" max="100" placeholder="—"
                                    class="w-20 bg-white/10 border border-white/20 text-white rounded-lg px-2 py-1 text-sm text-center focus:outline-none focus:border-sky-400">
                            </td>
                            <td class="px-4 py-2">
                                <input type="text" name="siswa[{{ $i }}][catatan]"
                                    class="w-full bg-white/10 border border-white/20 text-white rounded-lg px-2 py-1 text-xs focus:outline-none focus:border-sky-400" placeholder="—">
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="p-4 border-t border-white/10">
                <button type="submit" class="bg-sky-600 hover:bg-sky-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Simpan Nilai
                </button>
            </div>
        </div>
    </form>
    @else
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">
        <i class="fas fa-hand-point-up text-3xl mb-2 block opacity-50"></i>
        Pilih kelas dan mata pelajaran untuk mulai input nilai.
    </div>
    @endif
</div>
@endsection
