<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\JamPelajaran;
use App\Models\SiklusKelasRombel;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class JadwalController extends Controller
{
    public function index(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapelId = (int)($tapelAktif?->id_tahunajaran ?? 0);

        $kelasList = SiklusKelasRombel::where('tapel', $tapelId)
            ->where('aktif', 1)
            ->orderBy('nama_kelas')
            ->get();

        $hariList = JamPelajaran::hariList();

        $jadwal = collect();
        if ($request->id_kelas) {
            $jadwal = DB::table('jadwal_pelajaran as jp')
                ->join('jadwal_jampelajaran as jj', 'jp.id_jampel', '=', 'jj.id_jampel')
                ->join('data_matapelajaran as m', 'jp.id_mapel', '=', 'm.id_mapel')
                ->leftJoin('pegawai as p', 'jp.id_pegawai', '=', 'p.id_pegawai')
                ->join('siklus_kelasrombel as kr', 'jp.id_kelas', '=', 'kr.id_kelas')
                ->where('jp.id_kelas', $request->id_kelas)
                ->where('jp.tapel', $tapelId)
                ->select(
                    'jp.id_jadwal', 'jj.hari', 'jj.jam_ke', 'jj.jam_awal', 'jj.jam_akhir',
                    'jj.is_istirahat', 'm.nama_mapel', 'm.kode',
                    'p.nama as nama_guru', 'kr.nama_kelas'
                )
                ->orderByRaw("FIELD(jj.hari,'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu')")
                ->orderBy('jj.no_urut')
                ->get()
                ->groupBy('hari');
        }

        return view('admin.jadwal.index', compact('kelasList', 'jadwal', 'hariList', 'tapelAktif'));
    }

    public function create()
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapelId = (int)($tapelAktif?->id_tahunajaran ?? 0);

        $kelasList = SiklusKelasRombel::where('tapel', $tapelId)
            ->where('aktif', 1)
            ->orderBy('nama_kelas')
            ->get();
        $mapelList = DB::table('data_matapelajaran')->orderBy('nama_mapel')->get();
        $guruList  = DB::table('pegawai')->where('is_active', 1)->orderBy('nama')->get();
        $jamList   = DB::table('jadwal_jampelajaran')
            ->orderByRaw("FIELD(hari,'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu')")
            ->orderBy('no_urut')
            ->get();

        return view('admin.jadwal.create', compact('kelasList', 'mapelList', 'guruList', 'jamList', 'tapelAktif'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_kelas'   => 'required|integer',
            'id_mapel'   => 'required|integer',
            'id_pegawai' => 'required|integer',
            'id_jampel'  => 'required|integer',
            'tapel'      => 'required|integer',
            'semester'   => 'required|integer',
        ]);

        DB::table('jadwal_pelajaran')->insert([
            'id_jampel'  => $request->id_jampel,
            'id_kelas'   => $request->id_kelas,
            'id_mapel'   => $request->id_mapel,
            'id_pegawai' => $request->id_pegawai,
            'tapel'      => $request->tapel,
            'semester'   => $request->semester,
            'keterangan' => $request->keterangan ?? '',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return redirect()->route('admin.jadwal.index')
            ->with('success', 'Jadwal pelajaran berhasil ditambahkan.');
    }

    public function show(int $_id)
    {
        return redirect()->route('admin.jadwal.index');
    }

    public function edit(int $id)
    {
        $jadwal = DB::table('jadwal_pelajaran')->where('id_jadwal', $id)->first();
        if (!$jadwal) return redirect()->route('admin.jadwal.index');

        $kelasList = SiklusKelasRombel::orderBy('nama_kelas')->get();
        $mapelList = DB::table('data_matapelajaran')->orderBy('nama_mapel')->get();
        $pegawaiList = DB::table('pegawai')->where('is_active', 1)->orderBy('nama')->get();
        $jampelList = DB::table('jadwal_jampelajaran')->get()->groupBy('hari');

        return view('admin.jadwal.edit', compact('jadwal', 'kelasList', 'mapelList', 'pegawaiList', 'jampelList'));
    }

    public function update(Request $request, int $id)
    {
        DB::table('jadwal_pelajaran')->where('id_jadwal', $id)->update([
            'id_jampel'  => $request->id_jampel,
            'id_kelas'   => $request->id_kelas,
            'id_mapel'   => $request->id_mapel,
            'id_pegawai' => $request->id_pegawai,
            'keterangan' => $request->keterangan ?? '',
            'updated_at' => now(),
        ]);

        return redirect()->route('admin.jadwal.index')
            ->with('success', 'Jadwal pelajaran berhasil diperbarui.');
    }

    public function destroy(int $id)
    {
        DB::table('jadwal_pelajaran')->where('id_jadwal', $id)->delete();
        return redirect()->route('admin.jadwal.index')
            ->with('success', 'Jadwal pelajaran berhasil dihapus.');
    }
}
