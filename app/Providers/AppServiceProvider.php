<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\View;
use App\Models\MenuGroup;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Gate::before(function ($user, $ability) {
            return $user->hasRole('super_admin') ? true : null;
        });

        View::composer('layouts.admin', function ($view) {

            $user = auth()->user();

            if (!$user) {
                return;
            }

            $groups = MenuGroup::with([
                'menus' => function ($query) use ($user) {

                    $query
                        ->where('is_active', true)
                        ->where(function ($q) use ($user) {

                            $q->whereNull('permission_name');

                            foreach ($user->getAllPermissions() as $permission) {
                                $q->orWhere(
                                    'permission_name',
                                    $permission->name
                                );
                            }
                        })
                        ->orderBy('sort_order');
                }
            ])
            ->where('is_active', true)
            ->orderBy('sort_order')
            ->get();

            $view->with('menuGroups', $groups);
        });
    }
}
