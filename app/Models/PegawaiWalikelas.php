<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PegawaiWalikelas extends Model
{
    protected $table = 'pegawai_walikelas';

    protected $primaryKey = 'id_pegawai_walikelas';

    public $incrementing = true;

    protected $keyType = 'int';

    protected $fillable = [
        'id_sekolah',
        'id_jurusan',
        'id_tingkat',
        'id_pegawai',
        'id_kelas',
        'tapel',
        'semester',
    ];

    protected $casts = [
        'id_sekolah' => 'integer',
        'id_jurusan' => 'integer',
        'id_tingkat' => 'integer',
        'id_pegawai' => 'integer',
        'id_kelas' => 'integer',
        'tapel' => 'integer',
        'semester' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function jurusan(): BelongsTo
    {
        return $this->belongsTo(DataJurusan::class, 'id_jurusan');
    }

    public function tingkat(): BelongsTo
    {
        return $this->belongsTo(DataTingkat::class, 'id_tingkat');
    }

    public function pegawai(): BelongsTo
    {
        return $this->belongsTo(Pegawai::class, 'id_pegawai');
    }

    public function kelas(): BelongsTo
    {
        return $this->belongsTo(SiklusKelasRombel::class, 'id_kelas');
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */

    public function scopeSekolah($query, $idSekolah)
    {
        return $query->where('id_sekolah', $idSekolah);
    }

    public function scopeTapel($query, $tapel)
    {
        return $query->where('tapel', $tapel);
    }

    public function scopeSemester($query, $semester)
    {
        return $query->where('semester', $semester);
    }

    public function scopeAktif($query, $tapel, $semester)
    {
        return $query
            ->where('tapel', $tapel)
            ->where('semester', $semester);
    }

    /*
    |--------------------------------------------------------------------------
    | Helpers
    |--------------------------------------------------------------------------
    */

    public function namaPegawai(): ?string
    {
        return $this->pegawai?->nama;
    }

    public function namaKelas(): ?string
    {
        return $this->kelas?->nama_kelas;
    }

    public function namaJurusan(): ?string
    {
        return $this->jurusan?->nama_jurusan;
    }
}
