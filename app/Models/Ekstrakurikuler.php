<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ekstrakurikuler extends Model
{
    protected $table      = 'data_ekstrakurikuler';
    protected $primaryKey = 'id_ekstra';

    protected $fillable = [
        'nama_ekstrakurikuler', 'kelompok', 'keterangan',
    ];

    public function scopeWajib($query)
    {
        return $query->where('kelompok', 'wajib');
    }
}
