<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiklusSemester extends Model
{
    protected $table      = 'siklus_semester';
    protected $primaryKey = 'id_semester';

    protected $fillable = ['id_sekolah', 'semester', 'status'];

    public function getIsActiveAttribute(): bool
    {
        return $this->status === '1';
    }
}
