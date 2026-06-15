<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AssesmenController extends Controller
{
    private function getSiswa()
    {
        return DB::table('siswa')->where('email', Auth::user()->email)->orWhere('id_user', Auth::id())->first();
    }

    public function index()
    {
        $siswa = $this->getSiswa();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();

        $assesmenList = DB::table('assesmen')
            ->where('is_aktif', 1)
            ->orderBy('tgl_mulai', 'desc')
            ->get()
            ->map(function ($a) use ($siswa) {
                $a->sudah_dikerjakan = $siswa ? DB::table('assesmen_jawaban')
                    ->where('id_siswa', $siswa->id_siswa)
                    ->where('id_assesmen', $a->id)
                    ->exists() : false;
                $a->status = now()->between($a->tgl_mulai, $a->tgl_selesai) ? 'aktif' :
                    (now()->lt($a->tgl_mulai) ? 'belum' : 'selesai');
                return $a;
            });

        return view('siswa.assesmen.index', compact('assesmenList', 'siswa', 'tapelAktif'));
    }

    public function kerjakan($id)
    {
        $assesmen = DB::table('assesmen')->where('id', $id)->firstOrFail();
        $soalList = DB::table('assesmen_soal')->where('id_assesmen', $id)->get();
        return view('siswa.assesmen.show', compact('assesmen', 'soalList'));
    }

    public function submit(Request $request, $id)
    {
        $siswa = $this->getSiswa();
        if (!$siswa) return back()->with('error', 'Data siswa tidak ditemukan.');

        foreach ($request->jawaban ?? [] as $soalId => $jawaban) {
            DB::table('assesmen_jawaban')->updateOrInsert(
                ['id_siswa' => $siswa->id_siswa, 'id_soal' => $soalId],
                ['id_assesmen' => $id, 'jawaban' => $jawaban, 'updated_at' => now(), 'created_at' => now()]
            );
        }

        return redirect()->route('siswa.assesmen.hasil', $id)
            ->with('success', 'Assesmen berhasil diserahkan.');
    }

    public function hasil($id)
    {
        $siswa = $this->getSiswa();
        $assesmen = DB::table('assesmen')->where('id', $id)->firstOrFail();

        $jawaban = $siswa ? DB::table('assesmen_jawaban as aj')
            ->join('assesmen_soal as s', 'aj.id_soal', '=', 's.id')
            ->where('aj.id_siswa', $siswa->id_siswa)
            ->where('aj.id_assesmen', $id)
            ->select('s.pertanyaan', 'aj.jawaban', 's.id')
            ->get() : collect();

        return view('siswa.assesmen.hasil', compact('assesmen', 'jawaban', 'siswa'));
    }
}
