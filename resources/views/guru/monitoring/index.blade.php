@extends('layouts.guru')

@section('page-title', 'Monitoring Siswa')

@section('content')
<div class="space-y-4">
    <div class="flex gap-3 flex-wrap">
        <form method="GET" class="flex gap-2">
            <select name="id_kelas" class="bg-sky-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm" onchange="this.form.submit()">
                <option value="">-- Pilih Kelas --</option>
                @foreach($kelasList as $k)
                <option value="{{ $k->id_kelas }}" {{ request('id_kelas')==$k->id_kelas?'selected':'' }}>{{ $k->nama_kelas }}</option>
                @endforeach
            </select>
        </form>
    </div>

    @if(request('id_kelas') && $siswaList->count())
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-sky-900/50">
                    <tr class="text-sky-200 text-left">
                        <th class="px-4 py-3 w-10">No</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3 text-center">Rata Nilai</th>
                        <th class="px-4 py-3 text-center">Alpha</th>
                        <th class="px-4 py-3 text-center">Kondisi</th>
                        <th class="px-4 py-3 text-center">Detail</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($siswaList as $i => $s)
                    @php
                        $nilai = $s->rata_nilai ?? 0;
                        $alpha = $s->total_absen ?? 0;
                        $kondisi = ($nilai >= 75 && $alpha <= 3) ? 'baik' : (($nilai >= 60 || $alpha <= 6) ? 'perhatian' : 'kritis');
                        $kondisiColors = ['baik'=>'green','perhatian'=>'amber','kritis'=>'red'];
                    @endphp
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-sky-300">{{ $s->no_absen }}</td>
                        <td class="px-4 py-2.5 text-white">{{ $s->nama }}</td>
                        <td class="px-4 py-2.5 text-center font-bold {{ $nilai >= 75 ? 'text-green-300' : ($nilai >= 60 ? 'text-amber-300' : 'text-red-300') }}">
                            {{ $nilai ? number_format($nilai, 1) : '-' }}
                        </td>
                        <td class="px-4 py-2.5 text-center {{ $alpha > 6 ? 'text-red-300 font-bold' : 'text-sky-200' }}">
                            {{ $alpha }}x
                        </td>
                        <td class="px-4 py-2.5 text-center">
                            <span class="px-2 py-0.5 rounded-lg text-xs bg-{{ $kondisiColors[$kondisi] }}-500/20 text-{{ $kondisiColors[$kondisi] }}-300 capitalize">
                                {{ $kondisi }}
                            </span>
                        </td>
                        <td class="px-4 py-2.5 text-center">
                            <a href="{{ route('guru.monitoring.detail', $s->id_siswa) }}" class="text-sky-300 hover:text-white text-xs">Detail →</a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    @else
    <div class="bg-white/10 rounded-2xl p-8 text-center text-sky-400 border border-white/20">
        <i class="fas fa-chart-line text-3xl mb-2 block opacity-50"></i>
        Pilih kelas untuk monitoring.
    </div>
    @endif
</div>
@endsection
