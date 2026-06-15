<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FrontpageMenu extends Model
{
    protected $table = 'frontpage_menus';

    protected $fillable = [
        'parent_id', 'icon', 'title', 'url', 'position', 'group_id',
    ];

    public function group()
    {
        return $this->belongsTo(FrontpageMenuGroup::class, 'group_id');
    }

    public function parent()
    {
        return $this->belongsTo(self::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(self::class, 'parent_id')->orderBy('position');
    }

    public function scopeRoot($query)
    {
        return $query->where('parent_id', 0);
    }
}
