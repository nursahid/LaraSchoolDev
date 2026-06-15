<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppFile extends Model
{
    protected $table      = 'files';
    protected $primaryKey = 'id_file';

    protected $fillable = [
        'file_type', 'file_name', 'file_original_name', 'file_title',
        'file_description', 'file_size', 'file_width_height', 'status',
    ];

    protected $casts = [
        'status' => 'integer',
    ];

    public function scopeAktif($query)
    {
        return $query->where('status', 1);
    }

    public function getUrlAttribute(): string
    {
        return asset('uploads/' . $this->file_name);
    }

    public function isImage(): bool
    {
        return in_array(strtolower($this->file_type ?? ''), ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg']);
    }
}
