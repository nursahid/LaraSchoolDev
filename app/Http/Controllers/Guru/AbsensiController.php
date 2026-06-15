<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AbsensiController extends Controller
{
    public function index(Request $request)
    {
        $pegawai = DB::table('pegawai')->where('id_user', Auth::id())->first();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        // Kelas wali
        $kelasWali = $pegawai ? DB::table('siklus_kelasrombel')
            ->where('id_walikelas', $pegawai->id_pegawai)
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
            ->first() : null;

        $tanggal = $request->get('tanggal', today()->format('Y-m-d'));
        $idKelas = $request->get('id_kelas', $kelasWali?->id_kelas);

        $siswaList = collect();
        if ($idKelas) {
            $siswaList = DB::table('siswa_kelas as sk')
                ->join('siswa as s', 'sk.id_siswa', '=', 's.id_siswa')
                ->where('sk.id_kelas', $idKelas)
                ->select('s.id_siswa', 's.nama', 's.nis', 'sk.no_absen')
                ->orderBy('sk.no_absen')
                ->get();

            // Ambil absensi yang sudah ada
            $absensiExisting = DB::table('siswa_absensi')
                ->where('id_kelas', $idKelas)
                ->whereDate('tgl_absensi', $tanggal)
                ->pluck('keterangan', 'id_siswa');

            $siswaList = $siswaList->map(function ($s) use ($absensiExisting) {
                $s->keterangan = $absensiExisting[$s->id_siswa] ?? 'hadir';
                return $s;
            });
        }

        return view('guru.absensi.index', compact('pegawai', 'kelasWali', 'siswaList', 'tanggal', 'idKelas', 'tapelAktif'));
    }

    public function simpan(Request $request)
    {
        $request->validate([
            'id_kelas'   => 'required|integer',
            'tanggal'    => 'required|date',
            'keterangan' => 'required|array',
        ]);

        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        foreach ($request->keterangan as $siswaId => $ket) {
            DB::table('siswa_absensi')->updateOrInsert(
                ['id_siswa' => $siswaId, 'id_kelas' => $request->id_kelas, 'tgl_absensi' => $request->tanggal],
                [
                    'keterangan' => $ket,
                    'tapel'      => $tapelAktif?->tapel,
                    'semester'   => $tapelAktif?->semester ?? 1,
                    'updated_at' => now(),
                    'created_at' => now(),
                ]
            );
        }

        return back()->with('success', 'Absensi berhasil disimpan.');
    }
}
