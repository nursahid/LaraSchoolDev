<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FrontpageMenuGroup extends Model
{
    protected $table = 'frontpage_menu_groups';

    protected $fillable = ['title'];

    public function menus()
    {
        return $this->hasMany(FrontpageMenu::class, 'group_id')->orderBy('position');
    }

    public function rootMenus()
    {
        return $this->hasMany(FrontpageMenu::class, 'group_id')
            ->where('parent_id', 0)
            ->orderBy('position');
    }
}
