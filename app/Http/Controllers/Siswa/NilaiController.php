<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NilaiController extends Controller
{
    private function getSiswa()
    {
        return DB::table('siswa')->where('email', Auth::user()->email)->orWhere('id_user', Auth::id())->first();
    }

    public function index(Request $request)
    {
        $siswa = $this->getSiswa();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $request->get('tapel', $tapelAktif?->tapel);
        $semester = $request->get('semester', $tapelAktif?->semester ?? 1);

        $nilaiPerMapel = $siswa ? DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->where('n.id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('n.tapel', $tapel))
            ->when($semester, fn($q) => $q->where('n.semester', $semester))
            ->select('m.id_mapel', 'm.nama_mapel', 'm.kode', 'm.no_urut',
                DB::raw('AVG(CASE WHEN n.jenis_ujian = "harian" THEN n.nilai END) as avg_harian'),
                DB::raw('AVG(CASE WHEN n.jenis_ujian = "mid" THEN n.nilai END) as avg_mid'),
                DB::raw('AVG(CASE WHEN n.jenis_ujian = "semester" THEN n.nilai END) as avg_semester'),
                DB::raw('AVG(n.nilai) as rata_rata')
            )
            ->groupBy('m.id_mapel', 'm.nama_mapel', 'm.kode', 'm.no_urut')
            ->orderBy('m.no_urut')
            ->get() : collect();

        $tapelList = SiklusTahunAjaran::orderBy('tapel', 'desc')->get();

        return view('siswa.nilai.index', compact('nilaiPerMapel', 'tapelAktif', 'tapelList', 'tapel', 'semester', 'siswa'));
    }

    public function detail($id_mapel)
    {
        $siswa = $this->getSiswa();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $mapel = DB::table('data_matapelajaran')->where('id_mapel', $id_mapel)->firstOrFail();

        $nilaiList = $siswa ? DB::table('nilai')
            ->where('id_siswa', $siswa->id_siswa)
            ->where('id_mapel', $id_mapel)
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
            ->orderBy('tgl_penilaian')
            ->get() : collect();

        return view('siswa.nilai.detail', compact('nilaiList', 'mapel', 'siswa', 'tapelAktif'));
    }
}
