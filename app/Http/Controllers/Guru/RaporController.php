<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RaporController extends Controller
{
    public function index()
    {
        $pegawai = DB::table('pegawai')->where('id_user', Auth::id())->first();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $kelasWali = $pegawai ? DB::table('siklus_kelasrombel')
            ->where('id_walikelas', $pegawai->id_pegawai)
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
            ->first() : null;

        $siswas = $kelasWali ? DB::table('siswa_kelas as sk')
            ->join('siswa as s', 'sk.id_siswa', '=', 's.id_siswa')
            ->where('sk.id_kelas', $kelasWali->id_kelas)
            ->select('s.id_siswa', 's.nama', 's.nis', 'sk.no_absen')
            ->orderBy('sk.no_absen')
            ->get() : collect();

        return view('guru.rapor.index', compact('kelasWali', 'siswas', 'tapelAktif', 'pegawai'));
    }

    public function cetak($id)
    {
        $siswa = DB::table('siswa')->where('id_siswa', $id)->firstOrFail();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $nilaiRapor = DB::table('nilai_rapor as nr')
            ->join('data_matapelajaran as m', 'nr.id_mapel', '=', 'm.id_mapel')
            ->where('nr.id_siswa', $id)
            ->when($tapelAktif, fn($q) => $q->where('nr.tapel', $tapelAktif->tapel))
            ->orderBy('m.no_urut')
            ->get();

        return view('guru.rapor.cetak', compact('siswa', 'nilaiRapor', 'tapelAktif'));
    }
}
