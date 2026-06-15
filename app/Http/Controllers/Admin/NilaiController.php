<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Nilai;
use App\Models\SiklusKelasRombel;
use App\Models\SiklusTahunAjaran;
use App\Models\MataPelajaran;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NilaiController extends Controller
{
    public function index(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $request->get('tapel', $tapelAktif?->tapel);

        $nilaiList = DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->join('siklus_kelasrombel as kr', 'n.id_kelas', '=', 'kr.id_kelas')
            ->join('siswa as s', 'n.id_siswa', '=', 's.id_siswa')
            ->when($tapel, fn($q) => $q->where('n.tapel', $tapel))
            ->when($request->id_kelas, fn($q) => $q->where('n.id_kelas', $request->id_kelas))
            ->when($request->id_mapel, fn($q) => $q->where('n.id_mapel', $request->id_mapel))
            ->when($request->semester, fn($q) => $q->where('n.semester', $request->semester))
            ->select('s.nama', 's.nis', 'm.nama_mapel', 'kr.nama_kelas', 'n.nilai', 'n.jenis_ujian', 'n.tgl_penilaian', 'n.id_nilai')
            ->orderBy('kr.nama_kelas')
            ->orderBy('s.nama')
            ->paginate(25)->withQueryString();

        $kelasList = SiklusKelasRombel::when($tapel, fn($q) => $q->where('tapel', $tapel))->orderBy('nama_kelas')->get();
        $mapelList = MataPelajaran::orderBy('nama_mapel')->get();
        $tapelList = SiklusTahunAjaran::orderBy('tahun_ajaran', 'desc')->get();

        return view('admin.nilai.index', compact('nilaiList', 'kelasList', 'mapelList', 'tapelList', 'tapelAktif'));
    }

    public function input(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $kelasList = SiklusKelasRombel::when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))->orderBy('nama_kelas')->get();
        $mapelList = MataPelajaran::orderBy('nama_mapel')->get();

        $siswaList = collect();
        if ($request->id_kelas && $request->id_mapel) {
            $siswaList = DB::table('siswa_kelas as sk')
                ->join('siswa as s', 'sk.id_siswa', '=', 's.id_siswa')
                ->where('sk.id_kelas', $request->id_kelas)
                ->orderBy('sk.nis')
                ->select('s.id_siswa', 's.nama', 's.nis', 'sk.kelamin')
                ->get();
        }

        return view('admin.nilai.input', compact('kelasList', 'mapelList', 'siswaList', 'tapelAktif'));
    }

    public function storeBatch(Request $request)
    {
        $request->validate([
            'id_kelas'    => 'required|integer',
            'id_mapel'    => 'required|integer',
            'jenis_ujian' => 'required|string',
            'tapel'       => 'required|integer',
            'semester'    => 'required|integer',
            'nilai'       => 'required|array',
        ]);

        foreach ($request->nilai as $siswaId => $nilaiVal) {
            if ($nilaiVal === null || $nilaiVal === '') continue;

            DB::table('nilai')->updateOrInsert(
                [
                    'id_siswa'    => $siswaId,
                    'id_kelas'    => $request->id_kelas,
                    'id_mapel'    => $request->id_mapel,
                    'jenis_ujian' => $request->jenis_ujian,
                    'tapel'       => $request->tapel,
                    'semester'    => $request->semester,
                    'id_riwayatnilai' => $request->id_riwayatnilai ?? 0,
                ],
                [
                    'nilai'      => (int)$nilaiVal,
                    'updated_at' => now(),
                    'created_at' => now(),
                ]
            );
        }

        return back()->with('success', 'Nilai berhasil disimpan.');
    }

    public function destroy($id)
    {
        DB::table('nilai')->where('id_nilai', $id)->delete();
        return back()->with('success', 'Data nilai berhasil dihapus.');
    }
}
