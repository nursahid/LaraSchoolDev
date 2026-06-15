<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PegawaiMapel extends Model
{
    protected $table      = 'pegawai_mapel';
    protected $primaryKey = 'id_pegawai_mapel';

    protected $fillable = [
        'id_sekolah', 'id_pegawai', 'id_mapel',
        'id_tingkat', 'id_jurusan', 'tapel', 'semester',
    ];

    public function pegawai()
    {
        return $this->belongsTo(Pegawai::class, 'id_pegawai');
    }

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
