<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class SchoolHelper
{
    /**
     * Ambil nilai config sekolah dari tabel config.
     * Di-cache sebagai array biasa agar aman di-serialize oleh cache driver.
     */
    public static function config(string $key, mixed $default = null): mixed
    {
        // Simpan sebagai plain array — bukan Collection — agar serialize/unserialize aman
        $all = Cache::remember('school_config', 3600, function () {
            return DB::table('config')->pluck('config_value', 'config_name')->toArray();
        });

        return $all[$key] ?? $default;
    }

    /**
     * Jenjang sekolah aktif: SD | SMP | SMA
     */
    public static function jenjang(): string
    {
        return strtoupper(static::config('jenjang_sekolah', 'SMP'));
    }

    /**
     * Nomor-nomor tingkat yang valid untuk jenjang tertentu.
     * SD  → [1, 2, 3, 4, 5, 6]
     * SMP → [7, 8, 9]
     * SMA → [10, 11, 12]
     */
    public static function tingkatUntukJenjang(string $jenjang): array
    {
        return match (strtoupper($jenjang)) {
            'SD'  => [1, 2, 3, 4, 5, 6],
            'SMP' => [7, 8, 9],
            'SMA' => [10, 11, 12],
            default => [],
        };
    }

    /**
     * Nomor-nomor tingkat untuk jenjang sekolah saat ini.
     */
    public static function tingkatAktif(): array
    {
        return static::tingkatUntukJenjang(static::jenjang());
    }

    /**
     * Apakah sekolah menggunakan jurusan (hanya SMA).
     * SD dan SMP hanya punya "Non Jurusan".
     */
    public static function pakaiJurusan(): bool
    {
        return static::jenjang() === 'SMA';
    }
}
