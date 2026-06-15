<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RaporController extends Controller
{
    private function getSiswa()
    {
        return DB::table('siswa')->where('email', Auth::user()->email)->orWhere('id_user', Auth::id())->first();
    }

    public function index()
    {
        $siswa = $this->getSiswa();
        $tapelList = SiklusTahunAjaran::orderBy('tapel', 'desc')->get();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        return view('siswa.rapor.index', compact('siswa', 'tapelList', 'tapelAktif'));
    }

    public function download($tapel, $semester)
    {
        $siswa = $this->getSiswa();
        if (!$siswa) return back()->with('error', 'Data siswa tidak ditemukan.');

        $nilaiRapor = DB::table('nilai_rapor as nr')
            ->join('data_matapelajaran as m', 'nr.id_mapel', '=', 'm.id_mapel')
            ->where('nr.id_siswa', $siswa->id_siswa)
            ->where('nr.tapel', $tapel)
            ->where('nr.semester', $semester)
            ->orderBy('m.no_urut')
            ->get();

        $tapelInfo = DB::table('siklus_tahunajaran')->where('tapel', $tapel)->first();
        $kelasInfo = DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->where('sk.id_siswa', $siswa->id_siswa)
            ->where('sk.tapel', $tapel)
            ->select('kr.nama_kelas')
            ->first();

        return view('siswa.rapor.cetak', compact('siswa', 'nilaiRapor', 'tapelInfo', 'kelasInfo', 'semester'));
    }
}
