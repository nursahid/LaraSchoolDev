<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use App\Models\SiklusSemester;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TahunAjaranController extends Controller
{
    public function index()
    {
        $tapelList    = SiklusTahunAjaran::orderBy('tahun_ajaran', 'desc')->get();
        $tapelAktif   = $tapelList->firstWhere('status', '1');
        $semesterList = SiklusSemester::where('id_sekolah', 1)->orderBy('id_semester')->get();

        return view('admin.tahunajaran.index', compact('tapelList', 'tapelAktif', 'semesterList'));
    }

    public function create()
    {
        return view('admin.tahunajaran.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'tahun_ajaran' => 'required|string|max:50',
            'tahun_awal'   => 'required|date',
            'tahun_akhir'  => 'required|date|after:tahun_awal',
            'tasm'         => 'nullable|string|max:5',
        ]);

        SiklusTahunAjaran::create([...$validated, 'id_sekolah' => 1, 'status' => '0']);

        return redirect()->route('admin.tahunajaran.index')
            ->with('success', "Tahun ajaran {$validated['tahun_ajaran']} berhasil ditambahkan.");
    }

    public function show(SiklusTahunAjaran $tahunajaran)
    {
        $stats = [
            'total_kelas'  => DB::table('siklus_kelasrombel')->where('tapel', $tahunajaran->id_tahunajaran)->count(),
            'total_siswa'  => DB::table('siswa_kelas')->where('tapel', $tahunajaran->id_tahunajaran)->distinct('id_siswa')->count(),
            'total_jadwal' => DB::table('jadwal_pelajaran')->where('tapel', $tahunajaran->id_tahunajaran)->count(),
        ];
        return view('admin.tahunajaran.show', compact('tahunajaran', 'stats'));
    }

    public function edit(SiklusTahunAjaran $tahunajaran)
    {
        return view('admin.tahunajaran.edit', compact('tahunajaran'));
    }

    public function update(Request $request, SiklusTahunAjaran $tahunajaran)
    {
        $validated = $request->validate([
            'tahun_ajaran' => 'required|string|max:50',
            'tahun_awal'   => 'required|date',
            'tahun_akhir'  => 'required|date|after:tahun_awal',
            'tasm'         => 'nullable|string|max:5',
        ]);

        $tahunajaran->update($validated);
        return redirect()->route('admin.tahunajaran.index')
            ->with('success', "Tahun ajaran {$tahunajaran->tahun_ajaran} berhasil diperbarui.");
    }

    public function destroy(SiklusTahunAjaran $tahunajaran)
    {
        $nama = $tahunajaran->tahun_ajaran;
        $tahunajaran->delete();
        return redirect()->route('admin.tahunajaran.index')
            ->with('success', "Tahun ajaran {$nama} berhasil dihapus.");
    }

    public function aktifkan(Request $request, $id)
    {
        SiklusTahunAjaran::query()->update(['status' => '0']);
        $tapel = SiklusTahunAjaran::findOrFail($id);
        $tapel->update(['status' => '1']);

        session(['tapel_aktif' => $tapel->tahun_ajaran, 'tapel_id' => $tapel->id_tahunajaran]);

        return back()->with('success', "Tahun ajaran {$tapel->tahun_ajaran} berhasil diaktifkan.");
    }

    public function toggleSemester($id)
    {
        $semester = SiklusSemester::findOrFail($id);

        if ($semester->status === '1') {
            $semester->update(['status' => '0']);
            session()->forget(['semester_aktif', 'semester_id']);
            $msg = "{$semester->semester} berhasil dinonaktifkan.";
        } else {
            SiklusSemester::where('id_sekolah', $semester->id_sekolah)->update(['status' => '0']);
            $semester->update(['status' => '1']);
            session(['semester_aktif' => $semester->semester, 'semester_id' => $semester->id_semester]);
            $msg = "{$semester->semester} berhasil diaktifkan.";
        }

        return back()->with('success', $msg);
    }
}
