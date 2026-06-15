<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ModuleManager extends Model
{
    protected $table = 'module_managers';

    protected $fillable = [
        'slug', 'name', 'description', 'author', 'version',
        'admin_menu', 'module_image', 'icon', 'purchase_code',
        'is_installed', 'is_active', 'installed_at', 'activated_at', 'deactivated_at',
    ];

    protected $casts = [
        'admin_menu'    => 'array',
        'is_installed'  => 'boolean',
        'is_active'     => 'boolean',
        'installed_at'  => 'datetime',
        'activated_at'  => 'datetime',
        'deactivated_at' => 'datetime',
    ];

    public function scopeAktif($query)
    {
        return $query->where('is_active', true)->where('is_installed', true);
    }

    public function scopeTerpasang($query)
    {
        return $query->where('is_installed', true);
    }
}
