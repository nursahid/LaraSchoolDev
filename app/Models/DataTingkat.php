<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataTingkat extends Model
{
    protected $table = 'data_tingkat';
    protected $primaryKey = 'id_tingkat';

    protected $fillable = ['tingkat', 'nama_tingkat', 'jenjang', 'is_tertinggi'];
}
