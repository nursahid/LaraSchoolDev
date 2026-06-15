<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $tapelAktif?->tapel;

        // Cari data pegawai berdasarkan user
        $pegawai = DB::table('pegawai')->where('id_user', $user->id)->first();
        $idPegawai = $pegawai?->id_pegawai;

        // Jadwal hari ini
        $hariIni = now()->locale('id')->isoFormat('dddd');
        $jadwalHariIni = [];
        if ($idPegawai) {
            $jadwalHariIni = DB::table('jadwal_pelajaran as jp')
                ->join('jadwal_jampelajaran as jj', 'jp.id_jampel', '=', 'jj.id_jampel')
                ->join('data_matapelajaran as m', 'jp.id_mapel', '=', 'm.id_mapel')
                ->join('siklus_kelasrombel as kr', 'jp.id_kelas', '=', 'kr.id_kelas')
                ->where('jp.id_pegawai', $idPegawai)
                ->where('jj.hari', $hariIni)
                ->when($tapel, fn($q) => $q->where('jp.tapel', $tapel))
                ->select('jj.jam_awal', 'jj.jam_akhir', 'm.nama_mapel', 'kr.nama_kelas')
                ->orderBy('jj.no_urut')
                ->get();
        }

        // Mata pelajaran yang diajar
        $mapelDiajar = [];
        if ($idPegawai) {
            $mapelDiajar = DB::table('pegawai_mapel as pm')
                ->join('data_matapelajaran as m', 'pm.id_mapel', '=', 'm.id_mapel')
                ->where('pm.id_pegawai', $idPegawai)
                ->select('m.nama_mapel', 'm.kode')
                ->get();
        }

        // Kelas wali
        $kelasWali = null;
        if ($idPegawai) {
            $kelasWali = DB::table('siklus_kelasrombel')
                ->where('id_walikelas', $idPegawai)
                ->when($tapel, fn($q) => $q->where('tapel', $tapel))
                ->first();
        }

        // Jumlah siswa per kelas yang diajar
        $totalSiswaKelas = 0;
        if ($kelasWali) {
            $totalSiswaKelas = DB::table('siswa_kelas')->where('id_kelas', $kelasWali->id_kelas)->count();
        }

        // Absensi pending (yang belum diisi hari ini)
        $absensiStatus = $kelasWali
            ? DB::table('siswa_absensi')->where('id_kelas', $kelasWali->id_kelas)->whereDate('tgl_absensi', today())->exists()
            : false;

        return view('guru.dashboard', compact(
            'user', 'pegawai', 'jadwalHariIni', 'mapelDiajar', 'kelasWali',
            'totalSiswaKelas', 'absensiStatus', 'tapelAktif', 'hariIni'
        ));
    }

    public function profile()
    {
        $user = Auth::user();
        $pegawai = DB::table('pegawai')->where('id_user', $user->id)->first();
        return view('guru.profile', compact('user', 'pegawai'));
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
