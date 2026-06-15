<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class AppConfig extends Model
{
    protected $table = 'config';
    protected $primaryKey = null;
    public $incrementing = false;
    public $timestamps = false;

    protected $fillable = ['config_name', 'config_value', 'config_description', 'config_category', 'type', 'config_order'];

    public static function get(string $key, $default = null)
    {
        return Cache::remember("config_{$key}", 3600, function () use ($key, $default) {
            $config = static::where('config_name', $key)->first();
            return $config ? $config->config_value : $default;
        });
    }

    public static function set(string $key, $value): void
    {
        static::updateOrCreate(
            ['config_name' => $key],
            ['config_value' => $value]
        );
        Cache::forget("config_{$key}");
    }

    public function category()
    {
        return $this->belongsTo(ConfigCategory::class, 'config_category', 'id');
    }
}
