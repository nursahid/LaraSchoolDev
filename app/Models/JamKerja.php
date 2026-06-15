<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JamKerja extends Model
{
    protected $table      = 'data_jamkerja';
    protected $primaryKey = 'id_jamkerja';
    public $incrementing  = true;

    protected $fillable = [
        'start', 'finish', 'keterangan',
    ];

    protected $casts = [
        'start'  => 'string',
        'finish' => 'string',
    ];

    public function scopeMasuk($query)
    {
        return $query->where('keterangan', 'Masuk');
    }

    public function scopePulang($query)
    {
        return $query->where('keterangan', 'Pulang');
    }
}
