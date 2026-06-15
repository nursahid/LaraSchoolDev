<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KelulusanLog extends Model
{
    protected $table      = 'kelulusan_log';
    protected $primaryKey = 'id_log';

    protected $fillable = ['id_user', 'type', 'log', 'tgl'];

    protected $casts = [
        'tgl'  => 'datetime',
        'type' => 'integer',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
