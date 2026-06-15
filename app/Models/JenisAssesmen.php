<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JenisAssesmen extends Model
{
    protected $table = 'jenis_assesmen';

    protected $fillable = ['nama', 'deskripsi'];
}
