<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JamPelajaran extends Model
{
    protected $table      = 'jadwal_jampelajaran';
    protected $primaryKey = 'id_jampel';
    public $timestamps    = false;

    protected $fillable = [
        'hari', 'jam_ke', 'no_urut', 'jam_awal', 'jam_akhir',
        'is_istirahat', 'keterangan',
    ];

    protected $casts = [
        'jam_ke'       => 'integer',
        'no_urut'      => 'integer',
        'is_istirahat' => 'boolean',
    ];

    public function jadwal()
    {
        return $this->hasMany(JadwalPelajaran::class, 'id_jampel');
    }

    public function scopeAktif($query)
    {
        return $query->where('is_istirahat', '0');
    }

    public function scopeHari($query, string $hari)
    {
        return $query->where('hari', $hari);
    }

    public function getLabelAttribute(): string
    {
        return "{$this->hari} – {$this->jam_awal} s/d {$this->jam_akhir}";
    }

    public static function hariList(): array
    {
        return ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
    }
}
