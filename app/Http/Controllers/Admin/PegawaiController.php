<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Pegawai;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class PegawaiController extends Controller
{
    public function index(Request $request)
    {
        $query = Pegawai::query()
            ->when($request->search, fn($q) => $q->where(function ($q2) use ($request) {
                $q2->where('nama', 'like', '%' . $request->search . '%')
                   ->orWhere('nip', 'like', '%' . $request->search . '%')
                   ->orWhere('nuptk', 'like', '%' . $request->search . '%');
            }))
            ->when($request->kelamin, fn($q) => $q->where('kelamin', $request->kelamin))
            ->when($request->status_kepegawaian, fn($q) => $q->where('status_kepegawaian', $request->status_kepegawaian))
            ->when($request->jabatan, fn($q) => $q->where('jabatan', $request->jabatan))
            ->orderBy('nama');

        $pegawaiList = $query->paginate(25)->withQueryString();

        $jabatanList = DB::table('ref_jabatanpegawai')->orderBy('nama_jabatan')->get();
        $statusList = ['PNS', 'PPPK', 'Guru Honor Sekolah', 'Tenaga Honor Sekolah'];

        return view('admin.pegawai.index', compact('pegawaiList', 'jabatanList', 'statusList'));
    }

    public function create()
    {
        $jabatanList = DB::table('ref_jabatanpegawai')->orderBy('nama_jabatan')->get();
        $mapelList = DB::table('data_matapelajaran')->orderBy('nama_mapel')->get();
        return view('admin.pegawai.create', compact('jabatanList', 'mapelList'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nip'                => 'nullable|string|max:50|unique:pegawai,nip',
            'nuptk'              => 'nullable|string|max:50',
            'nama'               => 'required|string|max:50',
            'kelamin'            => 'required|in:L,P',
            'tgl_lahir'          => 'nullable|date',
            'jabatan'            => 'nullable|integer',
            'pendidikan'         => 'nullable|string|max:20',
            'status_kepegawaian' => 'nullable|string|max:100',
            'agama'              => 'nullable|string|max:20',
            'alamat'             => 'nullable|string',
            'hp'                 => 'nullable|string|max:15',
            'email'              => 'nullable|email|max:50',
            'tugas_tambahan'     => 'nullable|string|max:50',
        ]);

        $nip = $validated['nip'] ?? Str::random(10);
        $pegawai = Pegawai::create([
            ...$validated,
            'token'    => $nip,
            'password' => Hash::make($nip),
        ]);

        // Assign mata pelajaran
        if ($request->mapel_ids) {
            foreach ($request->mapel_ids as $mapelId) {
                DB::table('pegawai_mapel')->insert([
                    'id_pegawai' => $pegawai->id_pegawai,
                    'id_mapel'   => $mapelId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        return redirect()->route('admin.pegawai.index')
            ->with('success', "Pegawai {$pegawai->nama} berhasil ditambahkan.");
    }

    public function show(Pegawai $pegawai)
    {
        $pegawai->load(['mapel']);
        $walikelas = DB::table('pegawai_walikelas as pw')
            ->join('siklus_kelasrombel as kr', 'pw.id_kelas', '=', 'kr.id_kelas')
            ->join('data_tingkat as dt', 'kr.id_tingkat', '=', 'dt.id_tingkat')
            ->where('pw.id_pegawai', $pegawai->id_pegawai)
            ->select('kr.nama_kelas', 'dt.nama_tingkat', 'pw.tapel', 'pw.semester')
            ->orderBy('pw.tapel', 'desc')
            ->get();

        return view('admin.pegawai.show', compact('pegawai', 'walikelas'));
    }

    public function edit(Pegawai $pegawai)
    {
        $pegawai->load(['mapel']);
        $jabatanList = DB::table('ref_jabatanpegawai')->orderBy('nama_jabatan')->get();
        $mapelList = DB::table('data_matapelajaran')->orderBy('nama_mapel')->get();
        return view('admin.pegawai.edit', compact('pegawai', 'jabatanList', 'mapelList'));
    }

    public function update(Request $request, Pegawai $pegawai)
    {
        $validated = $request->validate([
            'nip'                => 'nullable|string|max:50|unique:pegawai,nip,' . $pegawai->id_pegawai . ',id_pegawai',
            'nuptk'              => 'nullable|string|max:50',
            'nama'               => 'required|string|max:50',
            'kelamin'            => 'required|in:L,P',
            'tgl_lahir'          => 'nullable|date',
            'jabatan'            => 'nullable|integer',
            'pendidikan'         => 'nullable|string|max:20',
            'status_kepegawaian' => 'nullable|string|max:100',
            'agama'              => 'nullable|string|max:20',
            'alamat'             => 'nullable|string',
            'hp'                 => 'nullable|string|max:15',
            'email'              => 'nullable|email|max:50',
            'tugas_tambahan'     => 'nullable|string|max:50',
        ]);

        // Handle foto
        if ($request->hasFile('foto')) {
            $request->validate(['foto' => 'image|max:2048']);
            $file = $request->file('foto');
            $filename = time() . '_' . Str::slug($pegawai->nama) . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/avatar'), $filename);
            $validated['foto'] = $filename;
        }

        $pegawai->update($validated);

        // Update mapel
        if ($request->has('mapel_ids')) {
            DB::table('pegawai_mapel')->where('id_pegawai', $pegawai->id_pegawai)->delete();
            foreach ($request->mapel_ids as $mapelId) {
                DB::table('pegawai_mapel')->insert([
                    'id_pegawai' => $pegawai->id_pegawai,
                    'id_mapel'   => $mapelId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        return redirect()->route('admin.pegawai.index')
            ->with('success', "Data pegawai {$pegawai->nama} berhasil diperbarui.");
    }

    public function destroy(Pegawai $pegawai)
    {
        $nama = $pegawai->nama;
        $pegawai->delete();
        return redirect()->route('admin.pegawai.index')
            ->with('success', "Pegawai {$nama} berhasil dihapus.");
    }
}
