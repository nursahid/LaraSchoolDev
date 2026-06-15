<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use App\Models\MenuGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class MenuManagerController extends Controller
{
    public function index()
    {
        $groups = MenuGroup::with(['menus' => fn($q) => $q->orderBy('sort_order')])
            ->orderBy('sort_order')
            ->get();

        return view('admin.menu-manager.index', compact('groups'));
    }

    // ── Menu Groups ──────────────────────────────────────────────────────────

    public function storeGroup(Request $request)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:100|unique:menu_groups,name',
            'description' => 'nullable|string|max:255',
            'icon'        => 'nullable|string|max:100',
            'sort_order'  => 'required|integer|min:0',
            'is_active'   => 'boolean',
        ]);

        MenuGroup::create([
            ...$validated,
            'is_active' => $request->boolean('is_active', true),
        ]);

        return redirect()->route('admin.menu-manager.index')
            ->with('success', "Group '{$validated['name']}' berhasil ditambahkan.");
    }

    public function updateGroup(Request $request, MenuGroup $group)
    {
        $validated = $request->validate([
            'name'        => "required|string|max:100|unique:menu_groups,name,{$group->id}",
            'description' => 'nullable|string|max:255',
            'icon'        => 'nullable|string|max:100',
            'sort_order'  => 'required|integer|min:0',
            'is_active'   => 'boolean',
        ]);

        $group->update([
            ...$validated,
            'is_active' => $request->boolean('is_active', true),
        ]);

        return redirect()->route('admin.menu-manager.index')
            ->with('success', "Group '{$group->name}' berhasil diperbarui.");
    }

    public function destroyGroup(MenuGroup $group)
    {
        $name = $group->name;
        $group->delete();

        return redirect()->route('admin.menu-manager.index')
            ->with('success', "Group '{$name}' berhasil dihapus.");
    }

    public function toggleGroup(MenuGroup $group)
    {
        $group->update(['is_active' => !$group->is_active]);
        $status = $group->is_active ? 'diaktifkan' : 'dinonaktifkan';

        return back()->with('success', "Group '{$group->name}' berhasil {$status}.");
    }

    // ── Menus ────────────────────────────────────────────────────────────────

    public function storeMenu(Request $request)
    {
        $validated = $request->validate([
            'menu_group_id'   => 'required|exists:menu_groups,id',
            'title'           => 'required|string|max:150',
            'route_name'      => 'nullable|string|max:150',
            'icon'            => 'nullable|string|max:100',
            'permission_name' => 'nullable|string|max:150',
            'sort_order'      => 'required|integer|min:0',
            'is_active'       => 'boolean',
        ]);

        Menu::create([
            ...$validated,
            'is_active' => $request->boolean('is_active', true),
        ]);

        return redirect()->route('admin.menu-manager.index')
            ->with('success', "Menu '{$validated['title']}' berhasil ditambahkan.");
    }

    public function updateMenu(Request $request, Menu $menu)
    {
        $validated = $request->validate([
            'menu_group_id'   => 'required|exists:menu_groups,id',
            'title'           => 'required|string|max:150',
            'route_name'      => 'nullable|string|max:150',
            'icon'            => 'nullable|string|max:100',
            'permission_name' => 'nullable|string|max:150',
            'sort_order'      => 'required|integer|min:0',
            'is_active'       => 'boolean',
        ]);

        $menu->update([
            ...$validated,
            'is_active' => $request->boolean('is_active', true),
        ]);

        return redirect()->route('admin.menu-manager.index')
            ->with('success', "Menu '{$menu->title}' berhasil diperbarui.");
    }

    public function destroyMenu(Menu $menu)
    {
        $title = $menu->title;
        $menu->delete();

        return redirect()->route('admin.menu-manager.index')
            ->with('success', "Menu '{$title}' berhasil dihapus.");
    }

    public function toggleMenu(Menu $menu)
    {
        $menu->update(['is_active' => !$menu->is_active]);
        $status = $menu->is_active ? 'diaktifkan' : 'dinonaktifkan';

        return back()->with('success', "Menu '{$menu->title}' berhasil {$status}.");
    }
}
