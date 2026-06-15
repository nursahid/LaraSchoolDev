<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\SchoolHelper;
use App\Http\Controllers\Controller;
use App\Models\DataJurusan;
use App\Models\DataTingkat;
use App\Models\MataPelajaran;
use App\Models\Pegawai;
use App\Models\PegawaiMapel;
use App\Models\SiklusSemester;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;

class PegawaiMapelController extends Controller
{
    public function index(Request $request)
    {
        $tapelAktif    = SiklusTahunAjaran::aktif()->first();
        $semesterAktif = SiklusSemester::where('id_sekolah', 1)->where('status', '1')->first();
        $tapelList     = SiklusTahunAjaran::orderBy('tahun_ajaran', 'desc')->get();
        $semesterList  = SiklusSemester::where('id_sekolah', 1)->orderBy('id_semester')->get();
        $guruList      = Pegawai::aktif()->orderBy('nama')->get();
        $mapelList     = MataPelajaran::orderBy('no_urut')->orderBy('nama_mapel')->get();

        $jenjang      = SchoolHelper::jenjang();
        $tingkatValid = SchoolHelper::tingkatAktif();

        // Tingkat: filter sesuai jenjang sekolah
        $tingkatList = DataTingkat::when($tingkatValid, fn($q) => $q->whereIn('tingkat', $tingkatValid))
            ->orderBy('tingkat')
            ->get();

        // Jurusan: SMA → semua jurusan; SD/SMP → hanya Non Jurusan
        $jurusanList = DataJurusan::when(
                !SchoolHelper::pakaiJurusan(),
                fn($q) => $q->where('nama_jurusan', 'Non Jurusan')
            )
            ->orderBy('nama_jurusan')
            ->get();

        $tapelFilter    = $request->integer('tapel', $tapelAktif?->id_tahunajaran);
        $semesterFilter = $request->integer('semester', $semesterAktif?->id_semester);

        $assignments = PegawaiMapel::with(['pegawai', 'mapel', 'tingkat', 'jurusan'])
            ->where('id_sekolah', 1)
            ->when($tapelFilter,    fn($q) => $q->where('tapel', $tapelFilter))
            ->when($semesterFilter, fn($q) => $q->where('semester', $semesterFilter))
            ->orderBy('id_tingkat')
            ->orderBy('id_mapel')
            ->orderBy('id_pegawai')
            ->get();

        $tapelMap    = $tapelList->keyBy('id_tahunajaran');
        $semesterMap = $semesterList->keyBy('id_semester');

        return view('admin.pegawai-mapel.index', compact(
            'tapelAktif', 'semesterAktif', 'tapelList', 'semesterList',
            'guruList', 'mapelList', 'tingkatList', 'jurusanList',
            'tapelFilter', 'semesterFilter', 'assignments',
            'tapelMap', 'semesterMap', 'jenjang'
        ));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_pegawai' => 'required|integer|exists:pegawai,id_pegawai',
            'id_mapel'   => 'required|integer|exists:data_matapelajaran,id_mapel',
            'id_tingkat' => 'required|integer|exists:data_tingkat,id_tingkat',
            'id_jurusan' => 'required|integer|exists:data_jurusan,id_jurusan',
            'tapel'      => 'required|integer|exists:siklus_tahunajaran,id_tahunajaran',
            'semester'   => 'required|integer|exists:siklus_semester,id_semester',
        ]);

        $exists = PegawaiMapel::where([
            'id_sekolah' => 1,
            'id_pegawai' => $validated['id_pegawai'],
            'id_mapel'   => $validated['id_mapel'],
            'id_tingkat' => $validated['id_tingkat'],
            'id_jurusan' => $validated['id_jurusan'],
            'tapel'      => $validated['tapel'],
            'semester'   => $validated['semester'],
        ])->exists();

        if ($exists) {
            return back()->with('error', 'Penugasan guru untuk mapel ini sudah ada.');
        }

        PegawaiMapel::create([...$validated, 'id_sekolah' => 1]);

        return redirect()->route('admin.pegawai-mapel.index', [
            'tapel'    => $validated['tapel'],
            'semester' => $validated['semester'],
        ])->with('success', 'Penugasan guru berhasil ditambahkan.');
    }

    public function destroy(PegawaiMapel $pegawaiMapel)
    {
        $tapel    = $pegawaiMapel->tapel;
        $semester = $pegawaiMapel->semester;
        $pegawaiMapel->delete();

        return redirect()->route('admin.pegawai-mapel.index', compact('tapel', 'semester'))
            ->with('success', 'Penugasan guru berhasil dihapus.');
    }
}
