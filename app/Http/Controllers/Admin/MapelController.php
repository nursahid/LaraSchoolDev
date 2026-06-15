<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MataPelajaran;
use Illuminate\Http\Request;

class MapelController extends Controller
{
    public function index(Request $request)
    {
        $query = MataPelajaran::query()
            ->when($request->search, fn($q) => $q->where('nama_mapel', 'like', '%' . $request->search . '%')->orWhere('kode', 'like', '%' . $request->search . '%'))
            ->when($request->kurikulum, fn($q) => $q->where('kurikulum', $request->kurikulum))
            ->when($request->kelompok, fn($q) => $q->where('kelompok', $request->kelompok))
            ->orderBy('no_urut')
            ->orderBy('nama_mapel');

        $mapelList = $query->paginate(25)->withQueryString();
        return view('admin.mapel.index', compact('mapelList'));
    }

    public function create()
    {
        return view('admin.mapel.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_mapel' => 'required|string|max:150',
            'no_urut'    => 'required|string|max:15',
            'kategori'   => 'nullable|string|max:15',
            'kurikulum'  => 'required|in:k13,merdeka,mandiri',
            'kode'       => 'required|string|max:15',
            'kelompok'   => 'required|in:A,B,C,D,E',
            'keterangan' => 'nullable|string',
        ]);

        MataPelajaran::create([...$validated, 'id_sekolah' => 1]);

        return redirect()->route('admin.mapel.index')
            ->with('success', "Mata pelajaran {$validated['nama_mapel']} berhasil ditambahkan.");
    }

    public function show(MataPelajaran $mapel)
    {
        $mapel->load('pegawai');
        return view('admin.mapel.show', compact('mapel'));
    }

    public function edit(MataPelajaran $mapel)
    {
        return view('admin.mapel.edit', compact('mapel'));
    }

    public function update(Request $request, MataPelajaran $mapel)
    {
        $validated = $request->validate([
            'nama_mapel' => 'required|string|max:150',
            'no_urut'    => 'required|string|max:15',
            'kategori'   => 'nullable|string|max:15',
            'kurikulum'  => 'required|in:k13,merdeka,mandiri',
            'kode'       => 'required|string|max:15',
            'kelompok'   => 'required|in:A,B,C,D,E',
            'keterangan' => 'nullable|string',
        ]);

        $mapel->update($validated);

        return redirect()->route('admin.mapel.index')
            ->with('success', "Mata pelajaran {$mapel->nama_mapel} berhasil diperbarui.");
    }

    public function destroy(MataPelajaran $mapel)
    {
        $nama = $mapel->nama_mapel;
        $mapel->delete();
        return redirect()->route('admin.mapel.index')
            ->with('success', "Mata pelajaran {$nama} berhasil dihapus.");
    }
}
