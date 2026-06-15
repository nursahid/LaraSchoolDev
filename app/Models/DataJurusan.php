<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataJurusan extends Model
{
    protected $table      = 'data_jurusan';
    protected $primaryKey = 'id_jurusan';

    protected $fillable = ['id_sekolah', 'nama_jurusan', 'kode_jurusan', 'singkatan'];
}
