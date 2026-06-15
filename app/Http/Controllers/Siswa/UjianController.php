<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class UjianController extends Controller
{
    private function getSiswa()
    {
        return DB::table('siswa')->where('email', Auth::user()->email)->orWhere('id_user', Auth::id())->first();
    }

    public function index()
    {
        $siswa = $this->getSiswa();

        $ujianList = DB::table('ujian')
            ->where('is_aktif', 1)
            ->orderBy('tgl_mulai', 'desc')
            ->get()
            ->map(function ($u) use ($siswa) {
                $u->sudah_mengikuti = $siswa ? DB::table('jawaban_siswa')->where('siswa_id', $siswa->id_siswa)->where('pertanyaan_id', $u->id)->exists() : false;
                $u->status = now()->between($u->tgl_mulai, $u->tgl_selesai) ? 'aktif' : (now()->lt($u->tgl_mulai) ? 'belum' : 'selesai');
                return $u;
            });

        return view('siswa.ujian.index', compact('ujianList', 'siswa'));
    }

    public function mulai($id)
    {
        $ujian = DB::table('ujian')->where('id', $id)->firstOrFail();
        $soalList = DB::table('pertanyaan')->where('ujian_id', $id)->inRandomOrder()->get();
        return view('siswa.ujian.mulai', compact('ujian', 'soalList'));
    }

    public function submit(Request $request, $id)
    {
        $siswa = $this->getSiswa();
        if (!$siswa) return back()->with('error', 'Siswa tidak ditemukan.');

        foreach ($request->jawaban ?? [] as $pertanyaanId => $jawaban) {
            DB::table('jawaban_siswa')->updateOrInsert(
                ['siswa_id' => $siswa->id_siswa, 'pertanyaan_id' => $pertanyaanId],
                ['jawaban' => $jawaban, 'updated_at' => now(), 'created_at' => now()]
            );
        }

        return redirect()->route('siswa.ujian.hasil', $id)
            ->with('success', 'Ujian berhasil diserahkan.');
    }

    public function hasil($id)
    {
        $siswa = $this->getSiswa();
        $ujian = DB::table('ujian')->where('id', $id)->firstOrFail();

        $hasil = DB::table('jawaban_siswa as js')
            ->join('pertanyaan as p', 'js.pertanyaan_id', '=', 'p.id')
            ->where('js.siswa_id', $siswa?->id_siswa)
            ->where('p.ujian_id', $id)
            ->select('p.pertanyaan', 'p.jawaban_benar', 'js.jawaban', 'js.nilai')
            ->get();

        $totalNilai = $hasil->sum('nilai');
        $totalSoal = $hasil->count();

        return view('siswa.ujian.hasil', compact('ujian', 'hasil', 'totalNilai', 'totalSoal'));
    }
}
