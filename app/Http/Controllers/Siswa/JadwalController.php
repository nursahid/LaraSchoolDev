<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JadwalController extends Controller
{
    public function index()
    {
        $siswa = DB::table('siswa')->where('email', Auth::user()->email)->orWhere('id_user', Auth::id())->first();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $kelasAktif = $siswa ? DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->where('sk.id_siswa', $siswa->id_siswa)
            ->when($tapelAktif, fn($q) => $q->where('sk.tapel', $tapelAktif->tapel))
            ->select('sk.*', 'kr.nama_kelas')
            ->first() : null;

        $jadwal = $kelasAktif ? DB::table('jadwal_pelajaran as jp')
            ->join('jadwal_jampelajaran as jj', 'jp.id_jampel', '=', 'jj.id_jampel')
            ->join('data_matapelajaran as m', 'jp.id_mapel', '=', 'm.id_mapel')
            ->join('pegawai as p', 'jp.id_pegawai', '=', 'p.id_pegawai')
            ->where('jp.id_kelas', $kelasAktif->id_kelas)
            ->when($tapelAktif, fn($q) => $q->where('jp.tapel', $tapelAktif->tapel))
            ->select('jj.hari', 'jj.jam_ke', 'jj.jam_awal', 'jj.jam_akhir', 'jj.is_istirahat', 'jj.keterangan as ket_jam', 'm.nama_mapel', 'p.nama as nama_guru')
            ->orderByRaw("FIELD(jj.hari,'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu')")
            ->orderBy('jj.no_urut')
            ->get()
            ->groupBy('hari') : collect();

        $hariList = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

        return view('siswa.jadwal.index', compact('jadwal', 'hariList', 'kelasAktif', 'tapelAktif'));
    }
}
