<?php

namespace App\Http\Controllers\Admin;

use App\Helpers\SchoolHelper;
use App\Http\Controllers\Controller;
use App\Models\DataJurusan;
use App\Models\DataTingkat;
use App\Models\MapelTingkat;
use App\Models\MataPelajaran;
use Illuminate\Http\Request;

class MapelTingkatController extends Controller
{
    public function index(Request $request)
    {
        $jenjang      = SchoolHelper::jenjang();
        $tingkatValid = SchoolHelper::tingkatAktif();   // [7,8,9] untuk SMP, dsb.

        // Hanya tampilkan tingkat sesuai jenjang sekolah
        $tingkatList = DataTingkat::when($tingkatValid, fn($q) => $q->whereIn('tingkat', $tingkatValid))
            ->orderBy('tingkat')
            ->get();

        // SMA → semua jurusan; SD/SMP → hanya "Non Jurusan"
        $jurusanList = DataJurusan::when(
                !SchoolHelper::pakaiJurusan(),
                fn($q) => $q->where('nama_jurusan', 'Non Jurusan')
            )
            ->orderBy('nama_jurusan')
            ->get();
        $mapelList    = MataPelajaran::orderBy('no_urut')->orderBy('nama_mapel')->get();

        $selTingkat = $request->integer('id_tingkat', $tingkatList->first()?->id_tingkat);
        $selJurusan = $request->integer('id_jurusan', $jurusanList->first()?->id_jurusan);

        $assignments = MapelTingkat::with(['mapel', 'tingkat', 'jurusan'])
            ->where('id_sekolah', 1)
            ->where('id_tingkat', $selTingkat)
            ->where('id_jurusan', $selJurusan)
            ->orderByRaw('(SELECT no_urut FROM data_matapelajaran WHERE id_mapel = mapel_tingkat.id_mapel)')
            ->get();

        $assignedIds = $assignments->pluck('id_mapel')->toArray();

        // Mapel that haven't been assigned yet (for the add modal)
        $availableMapel = $mapelList->whereNotIn('id_mapel', $assignedIds);

        return view('admin.mapel-tingkat.index', compact(
            'tingkatList', 'jurusanList', 'mapelList', 'assignments',
            'availableMapel', 'selTingkat', 'selJurusan', 'jenjang'
        ));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'id_tingkat'  => 'required|integer|exists:data_tingkat,id_tingkat',
            'id_jurusan'  => 'required|integer|exists:data_jurusan,id_jurusan',
            'id_mapel'    => 'required|array|min:1',
            'id_mapel.*'  => 'integer|exists:data_matapelajaran,id_mapel',
        ]);

        $added = 0;
        foreach ($validated['id_mapel'] as $idMapel) {
            $exists = MapelTingkat::where([
                'id_sekolah' => 1,
                'id_tingkat' => $validated['id_tingkat'],
                'id_jurusan' => $validated['id_jurusan'],
                'id_mapel'   => $idMapel,
            ])->exists();

            if (!$exists) {
                MapelTingkat::create([
                    'id_sekolah' => 1,
                    'id_tingkat' => $validated['id_tingkat'],
                    'id_jurusan' => $validated['id_jurusan'],
                    'id_mapel'   => $idMapel,
                ]);
                $added++;
            }
        }

        $ting = $validated['id_tingkat'];
        $jur  = $validated['id_jurusan'];

        return redirect()->route('admin.mapel-tingkat.index', ['id_tingkat' => $ting, 'id_jurusan' => $jur])
            ->with('success', "{$added} mata pelajaran berhasil ditambahkan.");
    }

    public function destroy(MapelTingkat $mapelTingkat)
    {
        $ting = $mapelTingkat->id_tingkat;
        $jur  = $mapelTingkat->id_jurusan;
        $mapelTingkat->delete();

        return redirect()->route('admin.mapel-tingkat.index', ['id_tingkat' => $ting, 'id_jurusan' => $jur])
            ->with('success', 'Mata pelajaran berhasil dihapus dari tingkat.');
    }
}
