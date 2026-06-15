<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EkstrakurikulerController extends Controller
{
    public function index()
    {
        $ekstras = DB::table('data_ekstrakurikuler')->orderBy('nama_ekstrakurikuler')->get();
        return view('admin.ekstrakurikuler.index', compact('ekstras'));
    }

    public function create()
    {
        return view('admin.ekstrakurikuler.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_ekstrakurikuler' => 'required|string|max:50',
            'kelompok'             => 'required|in:wajib,tidak',
            'keterangan'           => 'nullable|string|max:255',
        ]);

        DB::table('data_ekstrakurikuler')->insert([
            'nama_ekstrakurikuler' => $request->nama_ekstrakurikuler,
            'kelompok'             => $request->kelompok,
            'keterangan'           => $request->keterangan ?? '',
            'created_at'           => now(),
            'updated_at'           => now(),
        ]);

        return redirect()->route('admin.ekstrakurikuler.index')
            ->with('success', "Ekstrakurikuler {$request->nama_ekstrakurikuler} berhasil ditambahkan.");
    }

    public function show($id)
    {
        $ekstra = DB::table('data_ekstrakurikuler')->where('id_ekstra', $id)->firstOrFail();
        return view('admin.ekstrakurikuler.show', compact('ekstra'));
    }

    public function edit($id)
    {
        $ekstra = DB::table('data_ekstrakurikuler')->where('id_ekstra', $id)->firstOrFail();
        return view('admin.ekstrakurikuler.edit', compact('ekstra'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nama_ekstrakurikuler' => 'required|string|max:50',
            'kelompok'             => 'required|in:wajib,tidak',
            'keterangan'           => 'nullable|string|max:255',
        ]);

        DB::table('data_ekstrakurikuler')->where('id_ekstra', $id)->update([
            'nama_ekstrakurikuler' => $request->nama_ekstrakurikuler,
            'kelompok'             => $request->kelompok,
            'keterangan'           => $request->keterangan ?? '',
            'updated_at'           => now(),
        ]);

        return redirect()->route('admin.ekstrakurikuler.index')
            ->with('success', "Ekstrakurikuler berhasil diperbarui.");
    }

    public function destroy($id)
    {
        DB::table('data_ekstrakurikuler')->where('id_ekstra', $id)->delete();
        return redirect()->route('admin.ekstrakurikuler.index')
            ->with('success', 'Ekstrakurikuler berhasil dihapus.');
    }
}
