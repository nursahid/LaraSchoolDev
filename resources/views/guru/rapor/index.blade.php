@extends('layouts.guru')

@section('page-title', 'Cetak Rapor')

@section('content')
<div class="space-y-4">

    @if($kelasWali)
    {{-- Kelas info header --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex items-center gap-4">
        <div class="w-12 h-12 rounded-xl bg-sky-600/30 flex items-center justify-center">
            <i class="fas fa-chalkboard-teacher text-sky-300 text-xl"></i>
        </div>
        <div>
            <div class="text-white font-bold text-lg">{{ $kelasWali->nama_kelas }}</div>
            <div class="text-sky-300 text-sm">Kelas Wali — TP {{ $tapelAktif?->nama_tapel }}</div>
        </div>
        <div class="ml-auto text-right">
            <form method="GET" class="flex gap-2">
                <select name="semester" class="bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                    <option value="1" {{ request('semester', 1)==1 ? 'selected' : '' }}>Semester 1</option>
                    <option value="2" {{ request('semester')==2 ? 'selected' : '' }}>Semester 2</option>
                </select>
            </form>
        </div>
    </div>

    @if($siswas->count())
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-4 py-3 border-b border-white/10">
            <h3 class="text-white font-semibold">Daftar Siswa — {{ $siswas->count() }} orang</h3>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-sky-900/50">
                    <tr class="text-sky-200 text-left">
                        <th class="px-4 py-3 w-10">No</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3">NIS</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($siswas as $s)
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2 text-sky-300">{{ $s->no_absen }}</td>
                        <td class="px-4 py-2 text-white">{{ $s->nama }}</td>
                        <td class="px-4 py-2 text-sky-200 font-mono text-xs">{{ $s->nis }}</td>
                        <td class="px-4 py-2 text-center">
                            <a href="{{ route('guru.rapor.cetak', $s->id_siswa) }}"
                                target="_blank"
                                class="bg-sky-600/50 hover:bg-sky-600 text-white rounded-lg px-3 py-1 text-xs transition">
                                <i class="fas fa-print mr-1"></i>Cetak Rapor
                            </a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    @else
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">
        <i class="fas fa-users text-3xl mb-2 block opacity-50"></i>
        Belum ada siswa di kelas ini.
    </div>
    @endif

    @else
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">
        <i class="fas fa-file-pdf text-3xl mb-2 block opacity-50"></i>
        <p class="font-semibold text-white">Anda bukan wali kelas</p>
        <p class="text-sm mt-1">Fitur cetak rapor hanya tersedia untuk wali kelas.</p>
    </div>
    @endif

</div>
@endsection
