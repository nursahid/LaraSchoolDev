<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class SiklusKelasRombel extends Model
{
    use LogsActivity;
    protected $table = 'siklus_kelasrombel';
    protected $primaryKey = 'id_kelas';

    protected $fillable = [
        'id_sekolah', 'id_jurusan', 'id_tingkat', 'nama_kelas', 'kapasitas', 'id_walikelas', 'tapel', 'aktif',
    ];

    public function tingkat()
    {
        return $this->belongsTo(DataTingkat::class, 'id_tingkat');
    }

    public function waliKelas()
    {
        return $this->belongsTo(Pegawai::class, 'id_walikelas', 'id_pegawai');
    }

    public function siswaKelas()
    {
        return $this->hasMany(SiswaKelas::class, 'id_kelas');
    }

    public function countSiswa()
    {
        return $this->siswaKelas()->count();
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_kelas', 'tapel', 'semester', 'id_walikelas', 'kapasitas', 'is_active'])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->useLogName('kelas');
    }

    public function getDescriptionForEvent(string $eventName): string
    {
        return match($eventName) {
            'created' => "Kelas {$this->nama_kelas} dibuat",
            'updated' => "Kelas {$this->nama_kelas} diperbarui",
            'deleted' => "Kelas {$this->nama_kelas} dihapus",
            default   => "Kelas {$this->nama_kelas}: {$eventName}",
        };
    }
}
