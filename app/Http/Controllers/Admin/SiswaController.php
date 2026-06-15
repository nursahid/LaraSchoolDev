<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Siswa;
use App\Models\SiklusKelasRombel;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class SiswaController extends Controller
{
    public function index(Request $request)
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapelId = (int)($tapelAktif?->id_tahunajaran ?? 0);

        // Subquery: tepat satu baris per siswa — kelas di tahun ajaran aktif saja.
        // MIN() menjamin tidak ada duplikat meski siswa terdaftar >1 kelas dalam tapel yang sama.
        $kelasAktifSub = DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->where('sk.tapel', $tapelId)
            ->select('sk.id_siswa', DB::raw('MIN(sk.id_kelas) as id_kelas'), DB::raw('MIN(kr.nama_kelas) as nama_kelas'))
            ->groupBy('sk.id_siswa');

        $query = DB::table('siswa as s')
            ->leftJoinSub($kelasAktifSub, 'ka', 's.id_siswa', '=', 'ka.id_siswa')
            ->select('s.id_siswa', 's.nis', 's.nisn', 's.nama', 's.kelamin', 's.foto', 's.active', 'ka.nama_kelas')
            ->when($request->search, fn($q) => $q->where(fn($q2) => $q2
                ->where('s.nama', 'like', '%'.$request->search.'%')
                ->orWhere('s.nis', 'like', '%'.$request->search.'%')))
            ->when($request->kelamin, fn($q) => $q->where('s.kelamin', $request->kelamin))
            ->when($request->id_kelas, fn($q) => $q->where('ka.id_kelas', $request->id_kelas))
            ->where('s.active', 1)
            ->orderBy('ka.nama_kelas')
            ->orderBy('s.nama');

        $siswaList = $query->paginate(25)->withQueryString();

        $kelasList = SiklusKelasRombel::where('tapel', $tapelId)
            ->where('aktif', 1)
            ->orderBy('nama_kelas')
            ->get();

        return view('admin.siswa.index', compact('siswaList', 'kelasList', 'tapelAktif'));
    }

    public function create()
    {
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapelId    = (int)($tapelAktif?->id_tahunajaran ?? 0);

        $kelasList = SiklusKelasRombel::where('tapel', $tapelId)
            ->where('aktif', 1)
            ->orderBy('nama_kelas')
            ->get();

        return view('admin.siswa.create', compact('kelasList', 'tapelAktif'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nis'            => 'required|string|max:20|unique:siswa,nis',
            'nisn'           => 'nullable|string|max:20',
            'nama'           => 'required|string|max:150',
            'kelamin'        => 'required|in:L,P',
            'tgl_lahir'      => 'nullable|date',
            'tempat_lahir'   => 'nullable|string|max:50',
            'agama'          => 'nullable|string|max:20',
            'alamat'         => 'nullable|string',
            'angkatan'       => 'nullable|string|max:10',
            'email'          => 'nullable|email|max:100',
            'id_kelas'       => 'nullable|integer|exists:siklus_kelasrombel,id_kelas',
        ]);

        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $siswa = Siswa::create([
            ...$validated,
            'tgl_daftar' => today(),
            'username'   => $validated['nis'],
            'password'   => Hash::make($validated['nis']),
            'angkatan'   => $validated['angkatan'] ?? date('Y'),
            'diterima_tapel' => $tapelAktif?->tapel,
        ]);

        // Masukkan ke kelas jika dipilih
        if ($request->id_kelas && $tapelAktif) {
            DB::table('siswa_kelas')->insert([
                'id_siswa'  => $siswa->id_siswa,
                'id_kelas'  => $request->id_kelas,
                'tapel'     => $tapelAktif->tapel,
                'semester'  => $tapelAktif->semester ?? 1,
                'status'    => 'aktif',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        return redirect()->route('admin.siswa.index')
            ->with('success', "Siswa {$siswa->nama} berhasil ditambahkan.");
    }

    public function show(Siswa $siswa)
    {
        $siswa->load(['riwayatKelas.kelas.tingkat', 'nilai.mapel']);

        $nilaiRekap = DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->where('n.id_siswa', $siswa->id_siswa)
            ->select('m.nama_mapel', 'm.kode', 'n.jenis_ujian', DB::raw('AVG(n.nilai) as rata'))
            ->groupBy('m.id_mapel', 'm.nama_mapel', 'm.kode', 'n.jenis_ujian')
            ->get();

        $absensiRekap = DB::table('siswa_absensi')
            ->where('nis', $siswa->nis)
            ->select('keterangan', DB::raw('COUNT(*) as total'))
            ->groupBy('keterangan')
            ->get()
            ->pluck('total', 'keterangan');

        // Reformat nilaiRekap to have avg_harian, avg_mid, avg_semester per mapel
        $nilaiRekap = DB::table('nilai as n')
            ->join('data_matapelajaran as m', 'n.id_mapel', '=', 'm.id_mapel')
            ->where('n.id_siswa', $siswa->id_siswa)
            ->select('m.nama_mapel',
                DB::raw('AVG(CASE WHEN n.jenis_ujian = "harian" THEN n.nilai END) as avg_harian'),
                DB::raw('AVG(CASE WHEN n.jenis_ujian = "mid" THEN n.nilai END) as avg_mid'),
                DB::raw('AVG(CASE WHEN n.jenis_ujian = "semester" THEN n.nilai END) as avg_semester'),
                DB::raw('AVG(n.nilai) as rata_rata')
            )
            ->groupBy('m.id_mapel', 'm.nama_mapel')
            ->orderBy('m.no_urut')
            ->get();

        // Get kelas info for show
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $siswa->nama_kelas = DB::table('siswa_kelas as sk')
            ->join('siklus_kelasrombel as kr', 'sk.id_kelas', '=', 'kr.id_kelas')
            ->where('sk.id_siswa', $siswa->id_siswa)
            ->when($tapelAktif, fn($q) => $q->where('sk.tapel', $tapelAktif->tapel))
            ->value('kr.nama_kelas');

        return view('admin.siswa.show', compact('siswa', 'nilaiRekap', 'absensiRekap'));
    }

    public function edit(Siswa $siswa)
    {
        $kelasList = SiklusKelasRombel::where('aktif', 1)->orderBy('nama_kelas')->get();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $kelasAktif = DB::table('siswa_kelas')
            ->where('id_siswa', $siswa->id_siswa)
            ->when($tapelAktif, fn($q) => $q->where('tapel', $tapelAktif->tapel))
            ->first();

        return view('admin.siswa.edit', compact('siswa', 'kelasList', 'tapelAktif', 'kelasAktif'));
    }

    public function update(Request $request, Siswa $siswa)
    {
        $validated = $request->validate([
            'nis'          => 'required|string|max:20|unique:siswa,nis,' . $siswa->id_siswa . ',id_siswa',
            'nisn'         => 'nullable|string|max:20',
            'nama'         => 'required|string|max:150',
            'kelamin'      => 'required|in:L,P',
            'tgl_lahir'    => 'nullable|date',
            'tempat_lahir' => 'nullable|string|max:50',
            'agama'        => 'nullable|string|max:20',
            'alamat'       => 'nullable|string',
            'angkatan'     => 'nullable|string|max:10',
            'email'        => 'nullable|email|max:100',
        ]);

        // Handle foto upload
        if ($request->hasFile('foto')) {
            $request->validate(['foto' => 'image|max:2048']);
            $file = $request->file('foto');
            $filename = time() . '_' . Str::slug($siswa->nama) . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/avatar'), $filename);
            $validated['foto'] = $filename;
        }

        $siswa->update($validated);

        // Update kelas jika ada
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        if ($request->id_kelas && $tapelAktif) {
            DB::table('siswa_kelas')
                ->where('id_siswa', $siswa->id_siswa)
                ->where('tapel', $tapelAktif->tapel)
                ->updateOrInsert(
                    ['id_siswa' => $siswa->id_siswa, 'tapel' => $tapelAktif->tapel],
                    ['id_kelas' => $request->id_kelas, 'updated_at' => now()]
                );
        }

        return redirect()->route('admin.siswa.index')
            ->with('success', "Data siswa {$siswa->nama} berhasil diperbarui.");
    }

    public function destroy(Siswa $siswa)
    {
        $nama = $siswa->nama;
        $siswa->delete();

        return redirect()->route('admin.siswa.index')
            ->with('success', "Siswa {$nama} berhasil dihapus.");
    }

    public function kartu(Siswa $siswa)
    {
        $siswa->load(['riwayatKelas.kelas.tingkat']);
        return view('admin.siswa.kartu', compact('siswa'));
    }

    public function importForm()
    {
        return view('admin.siswa.import');
    }

    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:xlsx,xls,csv',
        ]);

        // TODO: implement Excel import
        return back()->with('info', 'Fitur import sedang dalam pengembangan.');
    }

    public function export()
    {
        // TODO: implement Excel export
        return back()->with('info', 'Fitur export sedang dalam pengembangan.');
    }
}
