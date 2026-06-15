<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Menu;
use App\Models\MenuGroup;

class MenuPermissionSeeder extends Seeder
{
    public function run(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        Menu::truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        $dashboard = MenuGroup::updateOrCreate(
            ['name' => 'dashboard'],
            ['description' => 'Dashboard', 'icon' => 'heroicon-o-home', 'sort_order' => 1]
        );

        $masterSekolah = MenuGroup::updateOrCreate(
            ['name' => 'master_sekolah'],
            ['description' => 'Master Sekolah', 'icon' => 'heroicon-o-building-office', 'sort_order' => 2]
        );

        $siswa = MenuGroup::updateOrCreate(
            ['name' => 'siswa'],
            ['description' => 'Manajemen Siswa', 'icon' => 'heroicon-o-users', 'sort_order' => 3]
        );

        $pegawai = MenuGroup::updateOrCreate(
            ['name' => 'pegawai'],
            ['description' => 'Manajemen Guru', 'icon' => 'heroicon-o-user-group', 'sort_order' => 4]
        );

        $akademik = MenuGroup::updateOrCreate(
            ['name' => 'akademik'],
            ['description' => 'Akademik', 'icon' => 'heroicon-o-academic-cap', 'sort_order' => 5]
        );

        $laporan = MenuGroup::updateOrCreate(
            ['name' => 'laporan'],
            ['description' => 'Laporan', 'icon' => 'heroicon-o-document-chart-bar', 'sort_order' => 6]
        );

        $pengaturan = MenuGroup::updateOrCreate(
            ['name' => 'pengaturan'],
            ['description' => 'Pengaturan', 'icon' => 'heroicon-o-cog-6-tooth', 'sort_order' => 7]
        );

        $maintenance = MenuGroup::updateOrCreate(
            ['name' => 'maintenance'],
            ['description' => 'Maintenance', 'icon' => 'heroicon-o-wrench-screwdriver', 'sort_order' => 8]
        );

        $menus = [

            // ── Dashboard ──────────────────────────────────────────────────
            [
                'group'           => $dashboard,
                'title'           => 'Dashboard',
                'route_name'      => 'admin.dashboard',
                'icon'            => 'fa-gauge',
                'permission_name' => 'dashboard.view',
                'is_active'       => true,
            ],

            // ── Master Sekolah ─────────────────────────────────────────────
            [
                'group'           => $masterSekolah,
                'title'           => 'Tahun Ajaran',
                'route_name'      => 'admin.tahunajaran.index',
                'permission_name' => 'tahunajaran.view',
                'is_active'       => true,
            ],
            [
                'group'           => $masterSekolah,
                'title'           => 'Kelas',
                'route_name'      => 'admin.kelas.index',
                'permission_name' => 'kelas.view',
                'is_active'       => true,
            ],
            [
                'group'           => $masterSekolah,
                'title'           => 'Mata Pelajaran',
                'route_name'      => 'admin.mapel.index',
                'permission_name' => 'mapel.view',
                'is_active'       => true,
            ],
            // Belum ada route-nya (dinonaktifkan)
            [
                'group'           => $masterSekolah,
                'title'           => 'Semester',
                'route_name'      => null,
                'permission_name' => 'semester.view',
                'is_active'       => false,
            ],
            [
                'group'           => $masterSekolah,
                'title'           => 'Tingkat',
                'route_name'      => null,
                'permission_name' => 'tingkat.view',
                'is_active'       => false,
            ],
            [
                'group'           => $masterSekolah,
                'title'           => 'Jurusan',
                'route_name'      => null,
                'permission_name' => 'jurusan.view',
                'is_active'       => false,
            ],

            // ── Manajemen Siswa ────────────────────────────────────────────
            [
                'group'           => $siswa,
                'title'           => 'Data Siswa',
                'route_name'      => 'admin.siswa.index',
                'permission_name' => 'siswa.view',
                'is_active'       => true,
            ],
            [
                'group'           => $siswa,
                'title'           => 'Prestasi',
                'route_name'      => 'admin.prestasi.index',
                'permission_name' => 'prestasi.view',
                'is_active'       => true,
            ],
            [
                'group'           => $siswa,
                'title'           => 'Ekstrakurikuler',
                'route_name'      => 'admin.ekstrakurikuler.index',
                'permission_name' => 'ekstrakurikuler.view',
                'is_active'       => true,
            ],
            // Belum ada route-nya
            [
                'group'           => $siswa,
                'title'           => 'Mutasi',
                'route_name'      => null,
                'permission_name' => 'mutasi.view',
                'is_active'       => false,
            ],
            [
                'group'           => $siswa,
                'title'           => 'Alumni',
                'route_name'      => null,
                'permission_name' => 'alumni.view',
                'is_active'       => false,
            ],

            // ── Manajemen Guru ─────────────────────────────────────────────
            [
                'group'           => $pegawai,
                'title'           => 'Data Pegawai',
                'route_name'      => 'admin.pegawai.index',
                'permission_name' => 'pegawai.view',
                'is_active'       => true,
            ],
            // Belum ada route-nya
            [
                'group'           => $pegawai,
                'title'           => 'Guru Mata Pelajaran',
                'route_name'      => null,
                'permission_name' => 'guru_mapel.view',
                'is_active'       => false,
            ],

            // ── Akademik ───────────────────────────────────────────────────
            [
                'group'           => $akademik,
                'title'           => 'Jadwal',
                'route_name'      => 'admin.jadwal.index',
                'permission_name' => 'jadwal.view',
                'is_active'       => true,
            ],
            [
                'group'           => $akademik,
                'title'           => 'Absensi',
                'route_name'      => 'admin.absensi.index',
                'permission_name' => 'absensi.view',
                'is_active'       => true,
            ],
            [
                'group'           => $akademik,
                'title'           => 'Nilai',
                'route_name'      => 'admin.nilai.index',
                'permission_name' => 'nilai.view',
                'is_active'       => true,
            ],
            // Belum ada route-nya
            [
                'group'           => $akademik,
                'title'           => 'Rapor',
                'route_name'      => null,
                'permission_name' => 'rapor.view',
                'is_active'       => false,
            ],

            // ── Laporan ────────────────────────────────────────────────────
            // Belum ada route-nya
            [
                'group'           => $laporan,
                'title'           => 'Laporan Akademik',
                'route_name'      => null,
                'permission_name' => 'laporan.akademik',
                'is_active'       => false,
            ],

            // ── Pengaturan ─────────────────────────────────────────────────
            [
                'group'           => $pengaturan,
                'title'           => 'User',
                'route_name'      => 'admin.users.index',
                'permission_name' => 'user.view',
                'is_active'       => true,
            ],
            [
                'group'           => $pengaturan,
                'title'           => 'Konfigurasi',
                'route_name'      => 'admin.config.index',
                'permission_name' => 'config.view',
                'is_active'       => true,
            ],
            // Belum ada route-nya
            [
                'group'           => $pengaturan,
                'title'           => 'Role',
                'route_name'      => null,
                'permission_name' => 'role.view',
                'is_active'       => false,
            ],
            [
                'group'           => $pengaturan,
                'title'           => 'Permission',
                'route_name'      => null,
                'permission_name' => 'permission.view',
                'is_active'       => false,
            ],

            // ── Maintenance ────────────────────────────────────────────────
            [
                'group'           => $maintenance,
                'title'           => 'Log Aktivitas',
                'route_name'      => 'admin.aktivitas.index',
                'permission_name' => 'log.view',
                'is_active'       => true,
            ],
        ];

        foreach ($menus as $index => $menu) {
            Menu::create([
                'menu_group_id'   => $menu['group']->id,
                'title'           => $menu['title'],
                'route_name'      => $menu['route_name'],
                'icon'            => $menu['icon'] ?? null,
                'permission_name' => $menu['permission_name'],
                'sort_order'      => $index + 1,
                'is_active'       => $menu['is_active'],
            ]);
        }
    }
}
