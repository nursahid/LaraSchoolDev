<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AppConfig;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class ConfigController extends Controller
{
    public function index()
    {
        $categories = DB::table('config_category')->orderBy('id')->get()->keyBy('id');

        $configs = AppConfig::orderBy('config_category')->orderBy('config_order')->get()
            ->groupBy(function ($item) use ($categories) {
                $cat = $categories->get($item->config_category);
                return $cat ? $cat->name : 'Umum';
            });

        return view('admin.config.index', compact('configs'));
    }

    public function update(Request $request)
    {
        $values = $request->input('values', []);

        foreach ($values as $key => $value) {
            // Use query builder update (not model instance) to keep WHERE config_name = ?
            // $model->update() with primaryKey=null would omit the WHERE clause and update ALL rows
            $exists = DB::table('config')->where('config_name', $key)->exists();
            if (!$exists) continue;

            DB::table('config')
                ->where('config_name', $key)
                ->update(['config_value' => $value]);

            Cache::forget("config_{$key}");
        }

        if ($request->hasFile('values')) {
            foreach ($request->file('values') as $key => $file) {
                $row = DB::table('config')->where('config_name', $key)->first();
                if (!$row || $row->type !== 'image') continue;

                $filename = time() . '_' . Str::random(16) . '.' . $file->getClientOriginalExtension();
                $file->move(public_path('uploads/config'), $filename);

                DB::table('config')
                    ->where('config_name', $key)
                    ->update(['config_value' => $filename]);

                Cache::forget("config_{$key}");
            }
        }

        return back()->with('success', 'Konfigurasi berhasil disimpan.');
    }
}
