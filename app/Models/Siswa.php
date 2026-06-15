<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Siswa extends Model
{
    use LogsActivity;
    protected $table = 'siswa';
    protected $primaryKey = 'id_siswa';

    protected $fillable = [
        'id_sekolah', 'nis', 'nisn', 'nik', 'nama', 'tempat_lahir', 'tgl_lahir',
        'kelamin', 'agama', 'alamat', 'kelurahan', 'kecamatan', 'kabupaten',
        'provinsi', 'kodepos', 'email', 'ekonomi', 'anak_ke', 'jml_saudara',
        'foto', 'telp', 'angkatan', 'program_studi', 'id_ortu',
        'nama_ayah', 'nama_ibu', 'pekerjaan_ayah', 'pekerjaan_ibu',
        'pendidikan_ayah', 'pendidikan_ibu', 'ttl_ayah', 'ttl_ibu',
        'alamat_ortu', 'hp_ortu', 'hp_ibu',
        'asal_sekolah', 'masuk_dikelas', 'diterima_tapel', 'diterima_semester',
        'tgl_daftar', 'status', 'active', 'username',
    ];

    protected $hidden = ['password', 'token', 'remember_code', 'activation_code', 'forgotten_password_code'];

    protected $casts = [
        'tgl_lahir' => 'date',
        'tgl_daftar' => 'date',
        'last_login' => 'datetime',
    ];

    public function user()
    {
        return $this->hasOne(User::class, 'profileable_id')
            ->where('profileable_type', self::class);
    }

    public function kelasAktif()
    {
        return $this->hasOne(SiswaKelas::class, 'id_siswa');
    }

    public function riwayatKelas()
    {
        return $this->hasMany(SiswaKelas::class, 'id_siswa');
    }

    public function nilai()
    {
        return $this->hasMany(Nilai::class, 'id_siswa');
    }

    public function getFotoUrlAttribute(): string
    {
        if ($this->foto && file_exists(public_path('uploads/avatar/' . $this->foto))) {
            return asset('uploads/avatar/' . $this->foto);
        }
        return 'https://ui-avatars.com/api/?name=' . urlencode($this->nama ?? 'S') . '&background=059669&color=fff&size=100';
    }

    public function getUmurAttribute(): int
    {
        return $this->tgl_lahir ? $this->tgl_lahir->diffInYears(now()) : 0;
    }

    // Alias accessors for template compatibility
    public function getNamaLengkapAttribute(): string { return $this->nama ?? ''; }
    public function getJenisKelaminAttribute(): string { return $this->kelamin ?? 'L'; }
    public function getNoTelpAttribute(): string { return $this->telp ?? ''; }
    public function getNoHpOrtuAttribute(): string { return $this->hp_ortu ?? ''; }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama', 'nis', 'nisn', 'kelamin', 'status', 'active'])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->useLogName('siswa');
    }

    public function getDescriptionForEvent(string $eventName): string
    {
        return match($eventName) {
            'created' => "Siswa {$this->nama} ditambahkan",
            'updated' => "Siswa {$this->nama} diperbarui",
            'deleted' => "Siswa {$this->nama} dihapus",
            default   => "Siswa {$this->nama}: {$eventName}",
        };
    }

    public function scopeAktif($query)
    {
        return $query->where('active', 1);
    }
}