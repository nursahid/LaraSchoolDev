<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Nilai extends Model
{
    protected $table = 'nilai';
    protected $primaryKey = 'id_nilai';

    protected $fillable = [
        'id_riwayatnilai', 'id_sekolah', 'id_jenispenilaian', 'jenis_ujian',
        'tugas_kuis', 'id_mapel', 'id_kompetensi', 'id_tugas', 'id_kuis',
        'tgl_penilaian', 'id_kelas', 'id_siswa', 'guru', 'nip', 'tapel',
        'semester', 'nilai', 'huruf', 'terbilang', 'deskripsi',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class, 'id_siswa');
    }

    public function mapel()
    {
        return $this->belongsTo(MataPelajaran::class, 'id_mapel');
    }

    public function kelas()
    {
        return $this->belongsTo(SiklusKelasRombel::class, 'id_kelas');
    }

    public function pegawai()
    {
        return $this->belongsTo(Pegawai::class, 'guru', 'id_pegawai');
    }

    public function kompetensi()
    {
        return $this->belongsTo(Kompetensi::class, 'id_kompetensi');
    }
}
