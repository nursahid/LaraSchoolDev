<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class SiklusTahunAjaran extends Model
{
    use LogsActivity;

    protected $table      = 'siklus_tahunajaran';
    protected $primaryKey = 'id_tahunajaran';

    protected $fillable = [
        'id_sekolah', 'tahun_ajaran', 'tahun_awal', 'tahun_akhir', 'tasm', 'status',
    ];

    protected $casts = [
        'tahun_awal'  => 'date',
        'tahun_akhir' => 'date',
    ];

    // ── Backward-compat accessors ────────────────────────────────────────────
    // Controllers reference ->tapel, ->nama_tapel, ->semester, ->is_active, etc.
    // Map them to the real column names so those files need no changes.

    public function getTapelAttribute(): int
    {
        return $this->id_tahunajaran;
    }

    public function getIdTapelAttribute(): int
    {
        return $this->id_tahunajaran;
    }

    public function getNamaTapelAttribute(): ?string
    {
        return $this->tahun_ajaran;
    }

    public function getIsActiveAttribute(): int
    {
        return (int) $this->status;
    }

    public function getSemesterAttribute(): ?string
    {
        return $this->tasm ?: null;
    }

    public function getTglMulaiAttribute()
    {
        return $this->tahun_awal;
    }

    public function getTglSelesaiAttribute()
    {
        return $this->tahun_akhir;
    }

    // ── Scope ────────────────────────────────────────────────────────────────

    public function scopeAktif(\Illuminate\Database\Eloquent\Builder $query)
    {
        return $query->where('status', '1');
    }

    // ── Relationships ────────────────────────────────────────────────────────

    public function kelas()
    {
        return $this->hasMany(SiklusKelasRombel::class, 'tapel', 'id_tahunajaran');
    }

    // ── Activity log ─────────────────────────────────────────────────────────

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['tahun_ajaran', 'status', 'tahun_awal', 'tahun_akhir'])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->useLogName('tahun_ajaran');
    }

    public function getDescriptionForEvent(string $eventName): string
    {
        return match ($eventName) {
            'created' => "Tahun ajaran {$this->tahun_ajaran} dibuat",
            'updated' => "Tahun ajaran {$this->tahun_ajaran} diperbarui",
            'deleted' => "Tahun ajaran {$this->tahun_ajaran} dihapus",
            default   => "Tahun ajaran {$this->tahun_ajaran}: {$eventName}",
        };
    }
}
