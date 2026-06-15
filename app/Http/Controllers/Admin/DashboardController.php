<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Pegawai;
use App\Models\Siswa;
use App\Models\SiklusKelasRombel;
use App\Models\SiklusTahunAjaran;
use App\Models\Nilai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DashboardController extends Controller
{
    public function index()
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $tapelAktif?->tapel;

        // Statistik Utama
        $stats = [
            'total_siswa'      => Siswa::aktif()->count(),
            'total_guru'       => Pegawai::aktif()->count(),
            'total_kelas'      => SiklusKelasRombel::when($tapel, fn($q) => $q->where('tapel', $tapel))->where('aktif', 1)->count(),
            'total_mapel'      => DB::table('data_matapelajaran')->count(),
            'total_pegawai_pns'  => Pegawai::aktif()->where('status_kepegawaian', 'PNS')->count(),
            'total_pegawai_honor' => Pegawai::aktif()->whereIn('status_kepegawaian', ['Guru Honor Sekolah', 'Tenaga Honor Sekolah'])->count(),
        ];

        // Siswa per Tingkat
        $siswaPerTingkat = DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->join('data_tingkat as dt', 'kr.id_tingkat', '=', 'dt.id_tingkat')
            ->when($tapel, fn($q) => $q->where('sk.tapel', $tapel))
            ->select('dt.tingkat', 'dt.nama_tingkat', DB::raw('COUNT(sk.id_siswa) as total'))
            ->groupBy('dt.id_tingkat', 'dt.tingkat', 'dt.nama_tingkat')
            ->orderBy('dt.tingkat')
            ->get();

        // Siswa per Jenis Kelamin
        $siswaLaki = Siswa::aktif()->where('kelamin', 'L')->count();
        $siswaPerempuan = Siswa::aktif()->where('kelamin', 'P')->count();

        // Pegawai terbaru
        $pegawaiBaru = Pegawai::aktif()->latest('created_at')->take(5)->get();

        // Siswa baru terdaftar
        $siswaBaru = Siswa::aktif()->latest('created_at')->take(5)->get();

        // Absensi hari ini
        $absensiHariIni = DB::table('siswa_absensi')
            ->whereDate('tanggal', today())
            ->select('keterangan', DB::raw('COUNT(*) as total'))
            ->groupBy('keterangan')
            ->get()
            ->pluck('total', 'keterangan');

        // Kelas per tahun ajaran
        // $kelasList = DB::table('siklus_kelasrombel as kr')
        //     ->leftJoin('pegawai as p', 'kr.id_walikelas', '=', 'p.id_pegawai')
        //     ->leftJoin('siswa_kelas as sk', 'kr.id_kelas', '=', 'sk.id_kelas')
        //     ->when($tapel, fn($q) => $q->where('kr.tapel', $tapel))
        //     ->where('kr.aktif', 1)
        //     ->select('kr.id_kelas', 'kr.nama_kelas', 'p.nama as nama_walikelas', DB::raw('COUNT(sk.id_siswa_kelas) as jumlah_siswa'))
        //     ->groupBy('kr.id_kelas', 'kr.nama_kelas', 'p.nama')
        //     ->orderBy('kr.nama_kelas')
        //     ->get();

        $kelasList = DB::table('siklus_kelasrombel as kr')
            ->leftJoin('pegawai_walikelas as pw', function ($join) use ($tapel) {
                $join->on('kr.id_kelas', '=', 'pw.id_kelas')
                    ->on('kr.tapel', '=', 'pw.tapel');
                // Jika menggunakan semester aktif
                // $join->where('pw.semester', get_semester_aktif());
            })

            ->leftJoin('pegawai as p', 'pw.id_pegawai', '=', 'p.id_pegawai')
            ->leftJoin('siswa_kelas as sk', 'kr.id_kelas', '=', 'sk.id_kelas')
            ->when($tapel, fn($q) => $q->where('kr.tapel', $tapel))
            ->where('kr.aktif', 1)
            ->select(
                'kr.id_kelas',
                'kr.nama_kelas',
                'p.nama as nama_walikelas',
                DB::raw('COUNT(sk.id_siswa_kelas) as jumlah_siswa')
            )
            ->groupBy(
                'kr.id_kelas',
                'kr.nama_kelas',
                'p.nama'
            )
            ->orderBy('kr.nama_kelas')
            ->get();

        // Nilai per mapel
        $rataRataNilai = DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->when($tapel, fn($q) => $q->where('n.tapel', $tapel))
            ->select('m.nama_mapel', DB::raw('AVG(n.nilai) as rata_rata'))
            ->groupBy('m.id_mapel', 'm.nama_mapel')
            ->orderBy('m.no_urut')
            ->get();

        return view('admin.dashboard', compact(
            'stats', 'siswaPerTingkat', 'siswaLaki', 'siswaPerempuan',
            'pegawaiBaru', 'siswaBaru', 'absensiHariIni', 'kelasList',
            'tapelAktif', 'rataRataNilai'
        ));
    }

    public function profile()
    {
        $user = Auth::user();
        return view('admin.profile', compact('user'));
    }

    public function updateProfile(Request $request)
    {
        $user = Auth::user();
        $request->validate(['name' => 'required', 'email' => 'required|email|unique:users,email,'.$user->id]);
        $user->name = $request->name;
        $user->email = $request->email;
        if ($request->filled('password')) {
            $user->password = Hash::make($request->password);
        }
        $user->save();
        return back()->with('success', 'Profil berhasil diperbarui.');
    }
}
