<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MapelTingkat extends Model
{
    protected $table      = 'mapel_tingkat';
    protected $primaryKey = 'id_mapeltingkat';

    protected $fillable = ['id_sekolah', 'id_jurusan', 'id_tingkat', 'id_mapel'];

    public function mapel()
    {
        return $this->belongsTo(MataPelajaran::class, 'id_mapel');
    }

    public function tingkat()
    {
        return $this->belongsTo(DataTingkat::class, 'id_tingkat');
    }

    public function jurusan()
    {
        return $this->belongsTo(DataJurusan::class, 'id_jurusan');
    }
}
