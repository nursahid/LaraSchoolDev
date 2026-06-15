<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PrestasiController extends Controller
{
    public function index(Request $request)
    {
        $prestasiList = DB::table('siswa_prestasi as sp')
            ->leftJoin('siswa as s', 'sp.id_siswa', '=', 's.id_siswa')
            ->when($request->search, fn($q) => $q->where(fn($q2) => $q2
                ->where('sp.nama_siswa', 'like', '%'.$request->search.'%')
                ->orWhere('sp.nama_prestasi', 'like', '%'.$request->search.'%')))
            ->when($request->jenis, fn($q) => $q->where('sp.jenis_prestasi', $request->jenis))
            ->select(
                'sp.id_prestasi', 'sp.nama_siswa', 'sp.nama_prestasi',
                'sp.jenis_prestasi', 'sp.level_prestasi', 'sp.tgl_perolehan',
                's.nis'
            )
            ->orderBy('sp.tgl_perolehan', 'desc')
            ->get();

        $siswaList  = DB::table('siswa')->where('active', 1)->orderBy('nama')->get();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        return view('admin.prestasi.index', compact('prestasiList', 'siswaList', 'tapelAktif'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_siswa'       => 'required|integer|exists:siswa,id_siswa',
            'nama_prestasi'  => 'required|string|max:200',
            'jenis_prestasi' => 'required|string|max:150',
            'level_prestasi' => 'required|string|max:155',
            'tgl_perolehan'  => 'required|date',
        ]);

        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $siswa      = DB::table('siswa')->where('id_siswa', $request->id_siswa)->first();

        // Ambil info kelas siswa di tapel aktif untuk mengisi kolom wajib
        $kelasInfo = DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->where('sk.id_siswa', $request->id_siswa)
            ->where('sk.tapel', $tapelAktif?->id_tahunajaran ?? 0)
            ->first();

        DB::table('siswa_prestasi')->insert([
            'id_sekolah'     => $kelasInfo->id_sekolah ?? 1,
            'id_jurusan'     => $kelasInfo->id_jurusan ?? 1,
            'id_tingkat'     => $kelasInfo->id_tingkat ?? null,
            'id_kelas'       => $kelasInfo->id_kelas ?? 0,
            'id_siswa'       => $request->id_siswa,
            'nama_siswa'     => $siswa?->nama ?? '',
            'tgl_perolehan'  => $request->tgl_perolehan,
            'nama_prestasi'  => $request->nama_prestasi,
            'jenis_prestasi' => $request->jenis_prestasi,
            'level_prestasi' => $request->level_prestasi,
            'tapel'          => $tapelAktif?->id_tahunajaran ?? 0,
            'semester'       => $tapelAktif?->tasm ?? 1,
            'created_at'     => now(),
            'updated_at'     => now(),
        ]);

        return redirect()->route('admin.prestasi.index')
            ->with('success', 'Prestasi berhasil ditambahkan.');
    }

    public function show(int $id)
    {
        $prestasi = DB::table('siswa_prestasi')->where('id_prestasi', $id)->first();
        if (!$prestasi) return redirect()->route('admin.prestasi.index');
        return view('admin.prestasi.show', compact('prestasi'));
    }

    public function edit(int $id)
    {
        $prestasi  = DB::table('siswa_prestasi')->where('id_prestasi', $id)->firstOrFail();
        $siswaList = DB::table('siswa')->where('active', 1)->orderBy('nama')->get();
        return view('admin.prestasi.edit', compact('prestasi', 'siswaList'));
    }

    public function update(Request $request, int $id)
    {
        $request->validate([
            'nama_prestasi'  => 'required|string|max:200',
            'jenis_prestasi' => 'required|string|max:150',
            'level_prestasi' => 'required|string|max:155',
            'tgl_perolehan'  => 'required|date',
        ]);

        DB::table('siswa_prestasi')->where('id_prestasi', $id)->update([
            'nama_prestasi'  => $request->nama_prestasi,
            'jenis_prestasi' => $request->jenis_prestasi,
            'level_prestasi' => $request->level_prestasi,
            'tgl_perolehan'  => $request->tgl_perolehan,
            'updated_at'     => now(),
        ]);

        return redirect()->route('admin.prestasi.index')
            ->with('success', 'Prestasi berhasil diperbarui.');
    }

    public function destroy(int $id)
    {
        DB::table('siswa_prestasi')->where('id_prestasi', $id)->delete();
        return redirect()->route('admin.prestasi.index')
            ->with('success', 'Prestasi berhasil dihapus.');
    }
}
