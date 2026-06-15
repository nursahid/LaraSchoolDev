@extends('layouts.admin')

@section('page-title', 'Detail Siswa')

@section('breadcrumb')
    <li><a href="{{ route('admin.siswa.index') }}" class="text-indigo-300 hover:text-white">Siswa</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">{{ $siswa->nama_lengkap }}</li>
@endsection

@section('content')
<div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

    {{-- Profile Card --}}
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20 text-center">
        <img src="{{ $siswa->foto ? asset('uploads/siswa/'.$siswa->foto) : 'https://ui-avatars.com/api/?name='.urlencode($siswa->nama_lengkap).'&background=6366f1&color=fff&size=200' }}"
             class="w-28 h-28 rounded-2xl object-cover mx-auto mb-4 ring-4 ring-indigo-500/30">
        <h2 class="text-xl font-bold text-white">{{ $siswa->nama_lengkap }}</h2>
        <p class="text-indigo-300 text-sm font-mono mt-1">{{ $siswa->nis }}</p>
        <span class="inline-block mt-2 px-3 py-1 rounded-lg text-xs font-medium {{ $siswa->active ? 'bg-green-500/20 text-green-300' : 'bg-red-500/20 text-red-300' }}">
            {{ $siswa->active ? 'Aktif' : 'Non-aktif' }}
        </span>

        <div class="mt-4 pt-4 border-t border-white/10 text-left space-y-2 text-sm">
            <div class="flex justify-between">
                <span class="text-indigo-300">NISN</span>
                <span class="text-white font-mono">{{ $siswa->nisn ?? '-' }}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-indigo-300">L/P</span>
                <span class="text-white">{{ $siswa->jenis_kelamin == 'L' ? 'Laki-laki' : 'Perempuan' }}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-indigo-300">Kelas</span>
                <span class="text-white">{{ $siswa->nama_kelas ?? '-' }}</span>
            </div>
            <div class="flex justify-between">
                <span class="text-indigo-300">Agama</span>
                <span class="text-white">{{ $siswa->agama ?? '-' }}</span>
            </div>
        </div>

        <div class="mt-4 pt-4 border-t border-white/10 flex gap-2 justify-center">
            <a href="{{ route('admin.siswa.edit', $siswa->id_siswa) }}" class="flex-1 bg-amber-600/50 hover:bg-amber-600 text-white rounded-xl py-2 text-xs transition text-center">
                <i class="fas fa-edit mr-1"></i>Edit
            </a>
            <a href="{{ route('admin.siswa.kartu', $siswa->id_siswa) }}" class="flex-1 bg-indigo-600/50 hover:bg-indigo-600 text-white rounded-xl py-2 text-xs transition text-center" target="_blank">
                <i class="fas fa-id-card mr-1"></i>Kartu
            </a>
            <form id="del-siswa" action="{{ route('admin.siswa.destroy', $siswa->id_siswa) }}" method="POST">
                @csrf @method('DELETE')
                <button type="button" onclick="confirmDelete('del-siswa', '{{ addslashes($siswa->nama_lengkap) }}')"
                    class="bg-red-600/40 hover:bg-red-600 text-white rounded-xl py-2 px-3 text-xs transition">
                    <i class="fas fa-trash"></i>
                </button>
            </form>
        </div>
    </div>

    {{-- Info Detail --}}
    <div class="lg:col-span-2 space-y-5">
        {{-- Personal --}}
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Informasi Pribadi</h3>
            <div class="grid grid-cols-2 gap-3 text-sm">
                <div><span class="text-indigo-300 block">Tempat Lahir</span><span class="text-white">{{ $siswa->tempat_lahir ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Tgl Lahir</span><span class="text-white">{{ $siswa->tgl_lahir ? \Carbon\Carbon::parse($siswa->tgl_lahir)->format('d/m/Y') : '-' }}</span></div>
                <div><span class="text-indigo-300 block">Email</span><span class="text-white">{{ $siswa->email ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">No. Telp</span><span class="text-white">{{ $siswa->no_telp ?? '-' }}</span></div>
                <div class="col-span-2"><span class="text-indigo-300 block">Alamat</span><span class="text-white">{{ $siswa->alamat ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Nama Ayah</span><span class="text-white">{{ $siswa->nama_ayah ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Nama Ibu</span><span class="text-white">{{ $siswa->nama_ibu ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">No. HP Ortu</span><span class="text-white">{{ $siswa->no_hp_ortu ?? '-' }}</span></div>
                <div><span class="text-indigo-300 block">Tgl Daftar</span><span class="text-white">{{ $siswa->tgl_daftar ? \Carbon\Carbon::parse($siswa->tgl_daftar)->format('d/m/Y') : '-' }}</span></div>
            </div>
        </div>

        {{-- Rekap Nilai --}}
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Rekap Nilai</h3>
            @if($nilaiRekap && $nilaiRekap->count())
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead>
                        <tr class="text-indigo-300 border-b border-white/10">
                            <th class="text-left pb-2">Mata Pelajaran</th>
                            <th class="text-center pb-2">Harian</th>
                            <th class="text-center pb-2">Mid</th>
                            <th class="text-center pb-2">Semester</th>
                            <th class="text-center pb-2">Rata-rata</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($nilaiRekap as $n)
                        <tr class="border-b border-white/5">
                            <td class="py-1.5 text-white">{{ $n->nama_mapel }}</td>
                            <td class="py-1.5 text-center text-indigo-200">{{ $n->avg_harian ? number_format($n->avg_harian,1) : '-' }}</td>
                            <td class="py-1.5 text-center text-indigo-200">{{ $n->avg_mid ? number_format($n->avg_mid,1) : '-' }}</td>
                            <td class="py-1.5 text-center text-indigo-200">{{ $n->avg_semester ? number_format($n->avg_semester,1) : '-' }}</td>
                            <td class="py-1.5 text-center font-semibold {{ $n->rata_rata >= 75 ? 'text-green-300' : 'text-red-300' }}">
                                {{ $n->rata_rata ? number_format($n->rata_rata,1) : '-' }}
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            @else
            <p class="text-indigo-400 text-sm">Belum ada data nilai.</p>
            @endif
        </div>

        {{-- Rekap Absensi --}}
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <h3 class="text-white font-semibold mb-4">Rekap Absensi</h3>
            <div class="grid grid-cols-4 gap-3">
                @foreach(['hadir'=>'Hadir','sakit'=>'Sakit','izin'=>'Izin','alpha'=>'Alpha'] as $key=>$label)
                <div class="text-center bg-white/10 rounded-xl p-3">
                    <div class="text-2xl font-bold text-white">{{ $absensiRekap[$key] ?? 0 }}</div>
                    <div class="text-xs text-indigo-300 mt-1">{{ $label }}</div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
@endsection
