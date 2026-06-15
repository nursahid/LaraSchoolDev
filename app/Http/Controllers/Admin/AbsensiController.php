<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SiklusKelasRombel;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AbsensiController extends Controller
{
    public function index(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $request->get('tapel', $tapelAktif?->tapel);

        $absensiList = DB::table('siswa_absensi as sa')
            ->join('siswa as s', 'sa.nis', '=', 's.nis')
            ->join('siklus_kelasrombel as kr', 'sa.id_kelas', '=', 'kr.id_kelas')
            ->when(request('tgl'), fn($q) => $q->whereDate('sa.tanggal', request('tgl')), fn($q) => $q->whereDate('sa.tanggal', today()))
            ->when(request('id_kelas'), fn($q) => $q->where('sa.id_kelas', request('id_kelas')))
            ->select('s.nama', 's.nis', 'kr.nama_kelas', 'sa.keterangan', 'sa.tanggal')
            ->orderBy('s.nama')
            ->paginate(25)->withQueryString();

        $rekap = DB::table('siswa_absensi')
            ->when($tapel, fn($q) => $q->where('tapel', $tapel))
            ->select('keterangan', DB::raw('COUNT(*) as total'))
            ->groupBy('keterangan')
            ->get()
            ->pluck('total', 'keterangan');

        $kelasList = SiklusKelasRombel::when($tapel, fn($q) => $q->where('tapel', $tapel))->orderBy('nama_kelas')->get();

        return view('admin.absensi.index', compact('absensiList', 'rekap', 'kelasList', 'tapelAktif'));
    }

    public function laporan(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $request->get('tapel', $tapelAktif?->tapel);

        $laporan = DB::table('siswa_absensi as sa')
            ->join('siswa as s', 'sa.nis', '=', 's.nis')
            ->leftJoin('siklus_kelasrombel as kr', 'sa.id_kelas', '=', 'kr.id_kelas')
            ->when($tapel, fn($q) => $q->where('sa.tapel', $tapel))
            ->when($request->id_kelas, fn($q) => $q->where('sa.id_kelas', $request->id_kelas))
            ->when($request->bulan, fn($q) => $q->whereMonth('sa.tanggal', $request->bulan))
            ->when($request->tahun, fn($q) => $q->whereYear('sa.tanggal', $request->tahun))
            ->select('s.nama as nama_siswa', 's.nis', 'kr.nama_kelas',
                     DB::raw("SUM(CASE WHEN sa.keterangan='hadir' THEN 1 ELSE 0 END) as hadir"),
                     DB::raw("SUM(CASE WHEN sa.keterangan='sakit' THEN 1 ELSE 0 END) as sakit"),
                     DB::raw("SUM(CASE WHEN sa.keterangan='izin' THEN 1 ELSE 0 END) as izin"),
                     DB::raw("SUM(CASE WHEN sa.keterangan='alpha' THEN 1 ELSE 0 END) as alpha"))
            ->groupBy('s.id_siswa', 's.nama', 's.nis', 'kr.nama_kelas')
            ->orderBy('kr.nama_kelas')
            ->orderBy('s.nama')
            ->paginate(25)->withQueryString();

        $kelasList = SiklusKelasRombel::when($tapel, fn($q) => $q->where('tapel', $tapel))->orderBy('nama_kelas')->get();

        return view('admin.absensi.laporan', compact('laporan', 'kelasList', 'tapelAktif'));
    }
}
