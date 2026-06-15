<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class MataPelajaran extends Model
{
    use LogsActivity;
    protected $table = 'data_matapelajaran';
    protected $primaryKey = 'id_mapel';

    protected $fillable = [
        'id_sekolah', 'nama_mapel', 'no_urut', 'kategori', 'kurikulum',
        'kode', 'kelompok', 'keterangan',
    ];

    public function kompetensi()
    {
        return $this->hasMany(Kompetensi::class, 'id_mapel');
    }

    public function pegawai()
    {
        return $this->belongsToMany(Pegawai::class, 'pegawai_mapel', 'id_mapel', 'id_pegawai');
    }

    public function tingkat()
    {
        return $this->belongsToMany(DataTingkat::class, 'mapel_tingkat', 'id_mapel', 'id_tingkat');
    }

    public function jadwal()
    {
        return $this->hasMany(JadwalPelajaran::class, 'id_mapel');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_mapel', 'kode', 'kategori', 'kelompok'])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->useLogName('mapel');
    }

    public function getDescriptionForEvent(string $eventName): string
    {
        return match($eventName) {
            'created' => "Mata pelajaran {$this->nama_mapel} ditambahkan",
            'updated' => "Mata pelajaran {$this->nama_mapel} diperbarui",
            'deleted' => "Mata pelajaran {$this->nama_mapel} dihapus",
            default   => "Mata pelajaran {$this->nama_mapel}: {$eventName}",
        };
    }
}
