@extends('layouts.guru')

@section('page-title', 'Data Nilai')

@section('content')
<div class="space-y-4">
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                <option value="">Semua Kelas</option>
                @foreach($kelasList as $k)
                <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                @endforeach
            </select>
            <select name="id_mapel" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none" onchange="this.form.submit()">
                <option value="">Semua Mapel</option>
                @foreach($mapelList as $m)
                <option value="{{ $m->id_mapel }}" {{ request('id_mapel')==$m->id_mapel?'selected':'' }}>{{ $m->nama_mapel }}</option>
                @endforeach
            </select>
        </form>
        <a href="{{ route('guru.nilai.input') }}" class="bg-sky-600 hover:bg-sky-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-keyboard mr-1"></i>Input Nilai
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-sky-900/50">
                    <tr class="text-sky-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Siswa</th>
                        <th class="px-4 py-3">Kelas</th>
                        <th class="px-4 py-3">Mapel</th>
                        <th class="px-4 py-3 text-center">Jenis</th>
                        <th class="px-4 py-3 text-center">Nilai</th>
                        <th class="px-4 py-3">Tanggal</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($nilaiList as $i => $n)
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-sky-300">{{ $nilaiList->firstItem() + $i }}</td>
                        <td class="px-4 py-2.5 text-white">{{ $n->nama_siswa }}</td>
                        <td class="px-4 py-2.5 text-sky-200">{{ $n->nama_kelas }}</td>
                        <td class="px-4 py-2.5 text-sky-200">{{ $n->nama_mapel }}</td>
                        <td class="px-4 py-2.5 text-center">
                            <span class="px-2 py-0.5 rounded text-xs bg-sky-500/20 text-sky-300 capitalize">{{ $n->jenis_ujian }}</span>
                        </td>
                        <td class="px-4 py-2.5 text-center font-bold {{ $n->nilai >= 75 ? 'text-green-300' : 'text-red-300' }}">
                            {{ $n->nilai }}
                        </td>
                        <td class="px-4 py-2.5 text-sky-400 text-xs">{{ \Carbon\Carbon::parse($n->tgl_penilaian)->format('d/m/Y') }}</td>
                    </tr>
                    @empty
                    <tr><td colspan="7" class="px-4 py-8 text-center text-sky-400">Belum ada data nilai</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        @if($nilaiList->hasPages())
        <div class="px-4 py-3 border-t border-white/10">
            {{ $nilaiList->appends(request()->query())->links() }}
        </div>
        @endif
    </div>
</div>
@endsection
