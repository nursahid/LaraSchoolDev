<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Pegawai extends Model
{
    use LogsActivity;
    protected $table = 'pegawai';
    protected $primaryKey = 'id_pegawai';

    protected $fillable = [
        'id_sekolah', 'nip', 'nuptk', 'nik', 'nama', 'gelar_depan', 'gelar_belakang',
        'kelamin', 'tempat_lahir', 'tgl_lahir', 'jabatan', 'pendidikan', 'status_kepegawaian',
        'gol_ruang', 'pangkat', 'agama', 'alamat', 'rt', 'rw', 'dusun', 'kelurahan',
        'kecamatan', 'kabupaten', 'provinsi', 'kodepos', 'hp', 'email', 'tugas_tambahan',
        'nama_ibu', 'status_kawin', 'nama_sutri', 'pekerjaan_sutri', 'npwp', 'nama_npwp',
        'foto', 'id_user', 'is_active',
    ];

    protected $hidden = ['password', 'token'];

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function mapel()
    {
        return $this->belongsToMany(MataPelajaran::class, 'pegawai_mapel', 'id_pegawai', 'id_mapel');
    }

    public function walikelas()
    {
        return $this->hasMany(PegawaiWalikelas::class, 'id_pegawai');
    }

    public function kelasWali()
    {
        return $this->hasMany(SiklusKelasRombel::class, 'id_walikelas', 'id_pegawai');
    }

    public function getNamaLengkapAttribute(): string
    {
        $nama = $this->nama ?? '';
        $depan = $this->gelar_depan ? $this->gelar_depan . ' ' : '';
        $belakang = $this->gelar_belakang ? ', ' . $this->gelar_belakang : '';
        return $depan . $nama . $belakang;
    }

    public function getFotoUrlAttribute(): string
    {
        if ($this->foto && file_exists(public_path('uploads/avatar/' . $this->foto))) {
            return asset('uploads/avatar/' . $this->foto);
        }
        return 'https://ui-avatars.com/api/?name=' . urlencode($this->nama ?? 'P') . '&background=6d28d9&color=fff&size=100';
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama', 'nip', 'nuptk', 'jabatan', 'status_kepegawaian', 'is_active'])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->useLogName('pegawai');
    }

    public function getDescriptionForEvent(string $eventName): string
    {
        return match($eventName) {
            'created' => "Pegawai {$this->nama} ditambahkan",
            'updated' => "Pegawai {$this->nama} diperbarui",
            'deleted' => "Pegawai {$this->nama} dihapus",
            default   => "Pegawai {$this->nama}: {$eventName}",
        };
    }

    public function scopeAktif($query)
    {
        return $query->where('is_active', 1);
    }

    public function scopeGuru($query)
    {
        return $query->where('jabatan', 4);
    }
}
