<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kompetensi extends Model
{
    protected $table      = 'kompetensi';
    protected $primaryKey = 'id_kompetensi';

    protected $fillable = [
        'id_sekolah', 'id_jurusan', 'id_tingkat', 'id_mapel', 'id_guru',
        'jenis', 'no_kd', 'nama_kd', 'bobot', 'semester',
    ];

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

    public function guru()
    {
        return $this->belongsTo(Pegawai::class, 'id_guru', 'id_pegawai');
    }

    public function getJenisLabelAttribute(): string
    {
        return match((int) $this->jenis) {
            1 => 'Pengetahuan',
            2 => 'Keterampilan',
            3 => 'Spiritual',
            4 => 'Sosial',
            default => '-',
        };
    }
}
