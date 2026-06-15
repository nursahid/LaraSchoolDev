<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiswaKelas extends Model
{
    protected $table = 'siswa_kelas';
    protected $primaryKey = 'id_siswa_kelas';

    protected $fillable = [
        'id_siswa', 'id_kelas', 'tapel', 'semester', 'no_absen', 'status',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class, 'id_siswa');
    }

    public function kelas()
    {
        return $this->belongsTo(SiklusKelasRombel::class, 'id_kelas');
    }
}
