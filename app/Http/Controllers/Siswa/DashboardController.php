<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    private function getSiswa()
    {
        $user = Auth::user();
        return DB::table('siswa')->where('id_user', $user->id)
            ->orWhere('email', $user->email)
            ->first();
    }

    public function index()
    {
        $user = Auth::user();
        $siswa = $this->getSiswa();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $tapelAktif?->tapel;

        // Kelas aktif siswa
        $kelasAktif = $siswa ? DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->join('data_tingkat as dt', 'kr.id_tingkat', '=', 'dt.id_tingkat')
            ->where('sk.id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('sk.tapel', $tapel))
            ->select('kr.nama_kelas', 'dt.nama_tingkat', 'sk.no_absen', 'kr.id_kelas')
            ->first() : null;

        // Nilai terbaru
        $nilaiTerbaru = $siswa ? DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->where('n.id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('n.tapel', $tapel))
            ->select('m.nama_mapel', 'n.nilai', 'n.jenis_ujian', 'n.tgl_penilaian')
            ->orderBy('n.tgl_penilaian', 'desc')
            ->limit(5)
            ->get() : collect();

        // Rata-rata nilai
        $rataRata = $siswa ? DB::table('nilai')
            ->where('id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('tapel', $tapel))
            ->avg('nilai') : 0;

        // Jadwal hari ini
        $hariIni = now()->locale('id')->isoFormat('dddd');
        $jadwalHariIni = $kelasAktif ? DB::table('jadwal_pelajaran as jp')
            ->join('jadwal_jampelajaran as jj', 'jp.id_jampel', '=', 'jj.id_jampel')
            ->join('data_matapelajaran as m', 'jp.id_mapel', '=', 'm.id_mapel')
            ->join('pegawai as p', 'jp.id_pegawai', '=', 'p.id_pegawai')
            ->where('jp.id_kelas', $kelasAktif->id_kelas)
            ->where('jj.hari', $hariIni)
            ->where('jj.is_istirahat', '0')
            ->when($tapel, fn($q) => $q->where('jp.tapel', $tapel))
            ->select('jj.jam_awal', 'jj.jam_akhir', 'm.nama_mapel', 'p.nama as nama_guru')
            ->orderBy('jj.no_urut')
            ->get() : collect();

        // Rekap absensi
        $absensiRekap = $siswa ? DB::table('siswa_absensi')
            ->where('id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('tapel', $tapel))
            ->select('keterangan', DB::raw('COUNT(*) as total'))
            ->groupBy('keterangan')
            ->get()
            ->pluck('total', 'keterangan') : collect();

        // Ujian aktif
        $ujianAktif = DB::table('ujian')
            ->where('is_aktif', 1)
            ->where('tgl_mulai', '<=', now())
            ->where('tgl_selesai', '>=', now())
            ->limit(3)
            ->get();

        return view('siswa.dashboard', compact(
            'user', 'siswa', 'kelasAktif', 'nilaiTerbaru', 'rataRata',
            'jadwalHariIni', 'absensiRekap', 'ujianAktif', 'tapelAktif', 'hariIni'
        ));
    }

    public function profile()
    {
        $user = Auth::user();
        $siswa = $this->getSiswa();
        return view('siswa.profile', compact('user', 'siswa'));
    }

    public function updateProfile(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'telp'  => 'nullable|string|max:15',
        ]);

        $siswa = $this->getSiswa();
        if ($siswa) {
            DB::table('siswa')->where('id_siswa', $siswa->id_siswa)->update([
                'email'      => $request->email,
                'telp'       => $request->telp ?? '',
                'updated_at' => now(),
            ]);
        }

        return back()->with('success', 'Profil berhasil diperbarui.');
    }
}
