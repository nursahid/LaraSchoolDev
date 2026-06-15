<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JadwalPelajaran extends Model
{
    protected $table      = 'jadwal_pelajaran';
    protected $primaryKey = 'id_jadwal';

    protected $fillable = [
        'id_jampel', 'id_kelas', 'id_mapel', 'id_pegawai',
        'tapel', 'semester', 'keterangan',
    ];

    protected $casts = [
        'tapel'    => 'integer',
        'semester' => 'integer',
    ];

    public function jamPelajaran()
    {
        return $this->belongsTo(JamPelajaran::class, 'id_jampel');
    }

    public function kelas()
    {
        return $this->belongsTo(SiklusKelasRombel::class, 'id_kelas');
    }

    public function mapel()
    {
        return $this->belongsTo(MataPelajaran::class, 'id_mapel');
    }

    public function guru()
    {
        return $this->belongsTo(Pegawai::class, 'id_pegawai', 'id_pegawai');
    }

    public function scopeTapel($query, int $tapel)
    {
        return $query->where('tapel', $tapel);
    }

    public function scopeSemester($query, int $semester)
    {
        return $query->where('semester', $semester);
    }

    public function scopeKelas($query, int $idKelas)
    {
        return $query->where('id_kelas', $idKelas);
    }
}
