<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KategoriMinatBakat extends Model
{
    protected $table = 'kategori_minat_bakat';

    protected $fillable = ['kategori', 'nama', 'deskripsi'];

    public function scopeMinat($query)
    {
        return $query->where('kategori', 'minat');
    }

    public function scopeBakat($query)
    {
        return $query->where('kategori', 'bakat');
    }
}
