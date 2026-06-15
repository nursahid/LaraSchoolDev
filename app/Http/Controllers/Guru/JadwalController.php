<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class JadwalController extends Controller
{
    public function index()
    {
        $pegawai = DB::table('pegawai')->where('id_user', Auth::id())->first();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $jadwal = $pegawai ? DB::table('jadwal_pelajaran as jp')
            ->join('jadwal_jampelajaran as jj', 'jp.id_jampel', '=', 'jj.id_jampel')
            ->join('data_matapelajaran as m', 'jp.id_mapel', '=', 'm.id_mapel')
            ->join('siklus_kelasrombel as kr', 'jp.id_kelas', '=', 'kr.id_kelas')
            ->where('jp.id_pegawai', $pegawai->id_pegawai)
            ->when($tapelAktif, fn($q) => $q->where('jp.tapel', $tapelAktif->tapel))
            ->select('jj.hari', 'jj.jam_ke', 'jj.jam_awal', 'jj.jam_akhir', 'jj.is_istirahat', 'm.nama_mapel', 'kr.nama_kelas')
            ->orderByRaw("FIELD(jj.hari,'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu')")
            ->orderBy('jj.no_urut')
            ->get()
            ->groupBy('hari') : collect();

        $hariList = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];

        return view('guru.jadwal.index', compact('jadwal', 'hariList', 'tapelAktif', 'pegawai'));
    }
}
