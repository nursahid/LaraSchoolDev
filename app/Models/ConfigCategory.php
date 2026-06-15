<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConfigCategory extends Model
{
    protected $table = 'config_category';

    protected $fillable = ['name', 'description'];

    public function configs()
    {
        return $this->hasMany(AppConfig::class, 'config_category', 'id');
    }
}
