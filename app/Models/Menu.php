<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Menu extends Model
{
    protected $table = 'menus';

    protected $fillable = [
        'menu_group_id',
        'parent_id',
        'title',
        'route_name',
        'icon',
        'permission_name',
        'sort_order',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    protected $guarded = [];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */

    public function group(): BelongsTo
    {
        return $this->belongsTo(MenuGroup::class, 'menu_group_id');
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(Menu::class, 'parent_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(Menu::class, 'parent_id')
            ->where('is_active', 1)
            ->orderBy('sort_order');
    }

    /*
    |--------------------------------------------------------------------------
    | Recursive Children
    |--------------------------------------------------------------------------
    */

    public function childrenRecursive(): HasMany
    {
        return $this->children()
            ->with('childrenRecursive');
    }

    /*
    |--------------------------------------------------------------------------
    | Scopes
    |--------------------------------------------------------------------------
    */

    public function scopeActive($query)
    {
        return $query->where('is_active', 1);
    }

    public function scopeOrdered($query)
    {
        return $query->orderBy('sort_order');
    }

    public function scopeParents($query)
    {
        return $query->whereNull('parent_id');
    }

    /*
    |--------------------------------------------------------------------------
    | Helpers
    |--------------------------------------------------------------------------
    */

    public function hasChildren(): bool
    {
        return $this->children()->exists();
    }

    public function canAccess(): bool
    {
        if (empty($this->permission_name)) {
            return true;
        }

        return auth()->check()
            && auth()->user()->can($this->permission_name);
    }


    public function scopeVisible($query)
    {
        return $query
            ->where('is_active', true)
            ->where(function ($q) {

                $user = auth()->user();

                $q->whereNull('permission_name');

                foreach ($user->getAllPermissions() as $permission) {
                    $q->orWhere('permission_name', $permission->name);
                }
            });
    }

}
