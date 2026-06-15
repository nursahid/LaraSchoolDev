<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Activitylog\Models\Activity;

class AktivitasController extends Controller
{
    public function index(Request $request)
    {
        $logs = Activity::with('causer')
            ->when($request->search, function ($q) use ($request) {
                $q->where('description', 'like', '%' . $request->search . '%')
                  ->orWhereHas('causer', fn($cq) => $cq->where('name', 'like', '%' . $request->search . '%'));
            })
            ->when($request->log_name, fn($q) => $q->where('log_name', $request->log_name))
            ->when($request->event, fn($q) => $q->where('event', $request->event))
            ->when($request->from, fn($q) => $q->whereDate('created_at', '>=', $request->from))
            ->when($request->to, fn($q) => $q->whereDate('created_at', '<=', $request->to))
            ->latest()
            ->paginate(50)
            ->withQueryString();

        $logNames = Activity::distinct()->pluck('log_name')->filter()->sort()->values();

        return view('admin.aktivitas.index', compact('logs', 'logNames'));
    }

    public function destroy($id)
    {
        Activity::findOrFail($id)->delete();
        return back()->with('success', 'Log aktivitas berhasil dihapus.');
    }

    public function destroyAll()
    {
        Activity::query()->delete();
        return back()->with('success', 'Semua log aktivitas berhasil dibersihkan.');
    }
}
