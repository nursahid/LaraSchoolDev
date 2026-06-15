<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SiklusKelasRombel;
use App\Models\SiklusTahunAjaran;
use App\Models\DataTingkat;
use App\Models\Pegawai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KelasController extends Controller
{
    public function index(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel      = $request->get('tapel', $tapelAktif?->id_tahunajaran);
        $tapelList  = SiklusTahunAjaran::orderBy('tahun_ajaran', 'desc')->get();

        $kelasList = DB::table('siklus_kelasrombel as k')
            ->leftJoin('data_tingkat as t', 'k.id_tingkat', '=', 't.id_tingkat')
            ->leftJoin('pegawai as p', 'k.id_walikelas', '=', 'p.id_pegawai')
            ->leftJoin('siklus_tahunajaran as ta', 'k.tapel', '=', 'ta.id_tahunajaran')
            ->when($tapel, fn($q) => $q->where('k.tapel', $tapel))
            ->select(
                'k.id_kelas', 'k.nama_kelas', 'k.kapasitas', 'k.tapel', 'k.aktif',
                't.nama_tingkat',
                'p.nama as nama_walikelas',
                'ta.tahun_ajaran as nama_tapel'
            )
            ->orderBy('k.nama_kelas')
            ->get()
            ->map(function ($k) {
                $k->jumlah_siswa = DB::table('siswa_kelas')->where('id_kelas', $k->id_kelas)->count();
                return $k;
            });

        return view('admin.kelas.index', compact('kelasList', 'tapelList', 'tapelAktif', 'tapel'));
    }

    public function create()
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tingkatList = DataTingkat::orderBy('tingkat')->get();
        $guruList = Pegawai::aktif()->orderBy('nama')->get();
        $tapelList = SiklusTahunAjaran::orderBy('tahun_ajaran', 'desc')->get();
        $jurusanList = DB::table('data_jurusan')->get();

        return view('admin.kelas.create', compact('tapelAktif', 'tingkatList', 'guruList', 'tapelList', 'jurusanList'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'tapel'        => 'required|integer',
            'id_tingkat'   => 'required|integer',
            'id_jurusan'   => 'nullable|integer',
            'nama_kelas'   => 'required|string|max:50',
            'kapasitas'    => 'nullable|integer',
            'id_walikelas' => 'nullable|integer|exists:pegawai,id_pegawai',
        ]);

        SiklusKelasRombel::create([
            ...$validated,
            'id_sekolah' => 1,
            'aktif'      => '1',
        ]);

        return redirect()->route('admin.kelas.index')
            ->with('success', "Kelas {$validated['nama_kelas']} berhasil dibuat.");
    }

    public function show(SiklusKelasRombel $kela)
    {
        $kela->load(['tingkat', 'waliKelas']);
        $siswaList = DB::table('siswa_kelas as sk')
            ->join('siswa as s', 'sk.id_siswa', '=', 's.id_siswa')
            ->where('sk.id_kelas', $kela->id_kelas)
            ->select('s.*', 'sk.nis', 'sk.tapel')
            ->orderBy('sk.nis')
            ->get();

        $jadwal = DB::table('jadwal_pelajaran as jp')
            ->join('jadwal_jampelajaran as jj', 'jp.id_jampel', '=', 'jj.id_jampel')
            ->join('data_matapelajaran as m', 'jp.id_mapel', '=', 'm.id_mapel')
            ->join('pegawai as p', 'jp.id_pegawai', '=', 'p.id_pegawai')
            ->where('jp.id_kelas', $kela->id_kelas)
            ->select('jj.hari', 'jj.jam_ke', 'jj.jam_awal', 'jj.jam_akhir', 'm.nama_mapel', 'p.nama as nama_guru')
            ->orderByRaw("FIELD(jj.hari, 'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu')")
            ->orderBy('jj.no_urut')
            ->get();

        return view('admin.kelas.show', compact('kela', 'siswaList', 'jadwal'));
    }

    public function edit(SiklusKelasRombel $kela)
    {
        $tingkatList = DataTingkat::orderBy('tingkat')->get();
        $guruList = Pegawai::aktif()->orderBy('nama')->get();
        $tapelList = SiklusTahunAjaran::orderBy('tahun_ajaran', 'desc')->get();
        $jurusanList = DB::table('data_jurusan')->get();
        return view('admin.kelas.edit', compact('kela', 'tingkatList', 'guruList', 'tapelList', 'jurusanList'));
    }

    public function update(Request $request, SiklusKelasRombel $kela)
    {
        $validated = $request->validate([
            'id_tingkat'   => 'required|integer',
            'nama_kelas'   => 'required|string|max:50',
            'kapasitas'    => 'nullable|integer',
            'id_walikelas' => 'nullable|integer|exists:pegawai,id_pegawai',
        ]);

        $kela->update($validated);

        return redirect()->route('admin.kelas.index')
            ->with('success', "Kelas {$kela->nama_kelas} berhasil diperbarui.");
    }

    public function destroy(SiklusKelasRombel $kela)
    {
        $nama = $kela->nama_kelas;
        // Cek apakah ada siswa di kelas
        $jumlahSiswa = DB::table('siswa_kelas')->where('id_kelas', $kela->id_kelas)->count();
        if ($jumlahSiswa > 0) {
            return back()->with('error', "Tidak dapat menghapus kelas {$nama} karena masih ada {$jumlahSiswa} siswa.");
        }
        $kela->delete();
        return redirect()->route('admin.kelas.index')->with('success', "Kelas {$nama} berhasil dihapus.");
    }
}
