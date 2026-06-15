<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MonitoringController extends Controller
{
    public function index()
    {
        $pegawai = DB::table('pegawai')->where('id_user', Auth::id())->first();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $kelasWali = $pegawai ? DB::table('siklus_kelasrombel')
            ->where('id_walikelas', $pegawai->id_pegawai)
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
            ->first() : null;

        $siswaList = $kelasWali ? DB::table('siswa_kelas as sk')
            ->join('siswa as s', 'sk.id_siswa', '=', 's.id_siswa')
            ->where('sk.id_kelas', $kelasWali->id_kelas)
            ->select('s.*', 'sk.no_absen')
            ->orderBy('sk.no_absen')
            ->get()
            ->map(function ($s) use ($tapelAktif) {
                $s->rata_nilai = DB::table('nilai')
                    ->where('id_siswa', $s->id_siswa)
                    ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
                    ->avg('nilai') ?? 0;
                $s->total_absen = DB::table('siswa_absensi')
                    ->where('id_siswa', $s->id_siswa)
                    ->where('keterangan', 'alpha')
                    ->count();
                return $s;
            }) : collect();

        return view('guru.monitoring.index', compact('kelasWali', 'siswaList', 'tapelAktif'));
    }

    public function detail($id)
    {
        $siswa = DB::table('siswa')->where('id_siswa', $id)->firstOrFail();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $nilaiPerMapel = DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->where('n.id_siswa', $id)
            ->when($tapelAktif, fn($q) => $q->where('n.tapel', $tapelAktif->tapel))
            ->select('m.nama_mapel',
                DB::raw('AVG(CASE WHEN n.jenis_ujian="harian" THEN n.nilai END) as avg_harian'),
                DB::raw('AVG(CASE WHEN n.jenis_ujian="mid" THEN n.nilai END) as avg_mid'),
                DB::raw('AVG(CASE WHEN n.jenis_ujian="semester" THEN n.nilai END) as avg_semester'),
                DB::raw('AVG(n.nilai) as rata_rata')
            )
            ->groupBy('m.id_mapel', 'm.nama_mapel')
            ->orderBy('m.no_urut')
            ->get();

        $rataRataNilai = DB::table('nilai')->where('id_siswa', $id)
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
            ->avg('nilai') ?? 0;

        $totalHadir = DB::table('siswa_absensi')->where('id_siswa', $id)->where('keterangan', 'hadir')
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))->count();
        $totalAlpha = DB::table('siswa_absensi')->where('id_siswa', $id)->where('keterangan', 'alpha')
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))->count();

        return view('guru.monitoring.detail', compact('siswa', 'nilaiPerMapel', 'rataRataNilai', 'totalHadir', 'totalAlpha', 'tapelAktif'));
    }
}
