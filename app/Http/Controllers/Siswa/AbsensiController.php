<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\SiklusTahunAjaran;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AbsensiController extends Controller
{
    public function index(Request $request)
    {
        $siswa = DB::table('siswa')->where('email', Auth::user()->email)->orWhere('id_user', Auth::id())->first();
        $tapelAktif = SiklusTahunAjaran::aktif()->first();
        $tapel = $request->get('tapel', $tapelAktif?->tapel);

        $rekap = $siswa ? DB::table('siswa_absensi')
            ->where('id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('tapel', $tapel))
            ->select('keterangan', DB::raw('COUNT(*) as total'))
            ->groupBy('keterangan')
            ->get()
            ->pluck('total', 'keterangan') : collect();

        $detail = $siswa ? DB::table('siswa_absensi')
            ->where('id_siswa', $siswa->id_siswa)
            ->when($tapel, fn($q) => $q->where('tapel', $tapel))
            ->orderBy('tgl_absensi', 'desc')
            ->paginate(25) : collect();

        $tapelList = SiklusTahunAjaran::orderBy('tapel', 'desc')->get();

        return view('siswa.absensi.index', compact('rekap', 'detail', 'tapelAktif', 'tapelList', 'tapel'));
    }
}
