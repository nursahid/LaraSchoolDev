<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NilaiController extends Controller
{
    private function getPegawai()
    {
        return DB::table('pegawai')->where('id_user', Auth::id())->first();
    }

    public function index(Request $request)
    {
        $pegawai = $this->getPegawai();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $request->get('tapel', $tapelAktif?->tapel);

        $nilaiList = DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->join('siklus_kelasrombel as kr', 'n.id_kelas', '=', 'kr.id_kelas')
            ->join('siswa as s', 'n.id_siswa', '=', 's.id_siswa')
            ->when($pegawai, fn($q) => $q->where('n.guru', $pegawai->id_pegawai))
            ->when($tapel, fn($q) => $q->where('n.tapel', $tapel))
            ->when($request->id_kelas, fn($q) => $q->where('n.id_kelas', $request->id_kelas))
            ->select('s.nama', 's.nis', 'm.nama_mapel', 'kr.nama_kelas', 'n.nilai', 'n.jenis_ujian', 'n.tgl_penilaian', 'n.id_nilai')
            ->orderBy('kr.nama_kelas')
            ->orderBy('s.nama')
            ->paginate(20)->withQueryString();

        return view('guru.nilai.index', compact('nilaiList', 'tapelAktif', 'pegawai'));
    }

    public function input(Request $request)
    {
        $pegawai = $this->getPegawai();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        // Kelas yang diajar guru ini
        $kelasList = DB::table('jadwal_pelajaran as jp')
            ->join('siklus_kelasrombel as kr', 'jp.id_kelas', '=', 'kr.id_kelas')
            ->when($pegawai, fn($q) => $q->where('jp.id_pegawai', $pegawai->id_pegawai))
            ->when($tapelAktif, fn($q) => $q->where('jp.tapel', $tapelAktif->tapel))
            ->select('kr.id_kelas', 'kr.nama_kelas')
            ->distinct()
            ->orderBy('kr.nama_kelas')
            ->get();

        $mapelList = DB::table('pegawai_mapel as pm')
            ->join('data_matapelajaran as m', 'pm.id_mapel', '=', 'm.id_mapel')
            ->when($pegawai, fn($q) => $q->where('pm.id_pegawai', $pegawai->id_pegawai))
            ->select('m.id_mapel', 'm.nama_mapel')
            ->get();

        $siswaList = collect();
        if ($request->id_kelas && $request->id_mapel) {
            $siswaList = DB::table('siswa_kelas as sk')
                ->join('siswa as s', 'sk.id_siswa', '=', 's.id_siswa')
                ->where('sk.id_kelas', $request->id_kelas)
                ->orderBy('sk.no_absen')
                ->select('s.id_siswa', 's.nama', 's.nis', 'sk.no_absen')
                ->get();

            // Ambil nilai yang sudah ada
            if ($request->jenis_ujian) {
                $nilaiExisting = DB::table('nilai')
                    ->where('id_kelas', $request->id_kelas)
                    ->where('id_mapel', $request->id_mapel)
                    ->where('jenis_ujian', $request->jenis_ujian)
                    ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
                    ->pluck('nilai', 'id_siswa');

                $siswaList = $siswaList->map(function ($s) use ($nilaiExisting) {
                    $s->nilai_existing = $nilaiExisting[$s->id_siswa] ?? null;
                    return $s;
                });
            }
        }

        return view('guru.nilai.input', compact('kelasList', 'mapelList', 'siswaList', 'tapelAktif', 'pegawai'));
    }

    public function store(Request $request)
    {
        $pegawai = $this->getPegawai();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $request->validate([
            'id_kelas'    => 'required|integer',
            'id_mapel'    => 'required|integer',
            'jenis_ujian' => 'required|string',
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
                    'tapel'       => $tapelAktif?->tapel,
                    'semester'    => $tapelAktif?->semester ?? 1,
                    'id_riwayatnilai' => 0,
                ],
                [
                    'nilai'     => (int) $nilaiVal,
                    'guru'      => $pegawai?->id_pegawai ?? 0,
                    'nip'       => $pegawai?->nip ?? '',
                    'id_sekolah' => 1,
                    'id_kompetensi' => 0,
                    'id_tugas'  => 0,
                    'id_kuis'   => 0,
                    'tgl_penilaian' => today()->format('Y-m-d'),
                    'updated_at' => now(),
                    'created_at' => now(),
                ]
            );
        }

        return back()->with('success', 'Nilai berhasil disimpan.');
    }

    public function update(Request $request, $id)
    {
        DB::table('nilai')->where('id_nilai', $id)->update([
            'nilai'      => $request->nilai,
            'deskripsi'  => $request->deskripsi ?? '',
            'updated_at' => now(),
        ]);

        return back()->with('success', 'Nilai berhasil diperbarui.');
    }

    public function destroy($id)
    {
        DB::table('nilai')->where('id_nilai', $id)->delete();
        return back()->with('success', 'Nilai berhasil dihapus.');
    }
}
