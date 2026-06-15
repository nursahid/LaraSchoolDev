<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\PermissionRegistrar;

class RolesPermissionSeeder extends Seeder
{
    public function run(): void
    {
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        /*
        |--------------------------------------------------------------------------
        | Permissions
        |--------------------------------------------------------------------------
        */

        $permissions = [

            // Dashboard
            'dashboard.view',
            'dashboard.statistik',

            // Sekolah
            'sekolah.view',
            'sekolah.create',
            'sekolah.edit',
            'sekolah.delete',

            // Tahun Ajaran
            'tahunajaran.view',
            'tahunajaran.create',
            'tahunajaran.edit',
            'tahunajaran.delete',
            'tahunajaran.activate',

            // Semester
            'semester.view',
            'semester.create',
            'semester.edit',
            'semester.delete',
            'semester.activate',

            // Tingkat
            'tingkat.view',
            'tingkat.create',
            'tingkat.edit',
            'tingkat.delete',

            // Jurusan
            'jurusan.view',
            'jurusan.create',
            'jurusan.edit',
            'jurusan.delete',

            // Kelas
            'kelas.view',
            'kelas.create',
            'kelas.edit',
            'kelas.delete',

            // Mata Pelajaran
            'mapel.view',
            'mapel.create',
            'mapel.edit',
            'mapel.delete',

            // Kompetensi
            'kompetensi.view',
            'kompetensi.create',
            'kompetensi.edit',
            'kompetensi.delete',

            // Ekstrakurikuler
            'ekstrakurikuler.view',
            'ekstrakurikuler.create',
            'ekstrakurikuler.edit',
            'ekstrakurikuler.delete',

            // Siswa
            'siswa.view',
            'siswa.create',
            'siswa.edit',
            'siswa.delete',
            'siswa.import',
            'siswa.export',

            // Orang Tua
            'orangtua.view',
            'orangtua.create',
            'orangtua.edit',
            'orangtua.delete',

            // Mutasi
            'mutasi.view',
            'mutasi.create',
            'mutasi.edit',
            'mutasi.delete',
            'mutasi.approve',

            // Alumni
            'alumni.view',
            'alumni.create',
            'alumni.edit',
            'alumni.delete',

            // Prestasi
            'prestasi.view',
            'prestasi.create',
            'prestasi.edit',
            'prestasi.delete',

            // Pegawai
            'pegawai.view',
            'pegawai.create',
            'pegawai.edit',
            'pegawai.delete',
            'pegawai.import',
            'pegawai.export',

            // Guru Mapel
            'guru_mapel.view',
            'guru_mapel.create',
            'guru_mapel.edit',
            'guru_mapel.delete',

            // Wali Kelas
            'walikelas.view',
            'walikelas.create',
            'walikelas.edit',
            'walikelas.delete',

            // Jadwal
            'jadwal.view',
            'jadwal.create',
            'jadwal.edit',
            'jadwal.delete',

            // Jam Pelajaran
            'jampel.view',
            'jampel.create',
            'jampel.edit',
            'jampel.delete',

            // Absensi
            'absensi.view',
            'absensi.create',
            'absensi.edit',
            'absensi.delete',
            'absensi.approve',

            // Nilai
            'nilai.view',
            'nilai.create',
            'nilai.edit',
            'nilai.delete',
            'nilai.approve',

            // Rapor
            'rapor.view',
            'rapor.generate',
            'rapor.publish',
            'rapor.print',

            // Assessment
            'assessment.view',
            'assessment.create',
            'assessment.edit',
            'assessment.delete',
            'assessment.publish',

            // Minat Bakat
            'minatbakat.view',
            'minatbakat.create',
            'minatbakat.edit',
            'minatbakat.delete',

            // Jawaban
            'jawaban.view',
            'jawaban.input',
            'jawaban.review',
            'jawaban.nilai',

            // Ruangan
            'ruangan.view',
            'ruangan.create',
            'ruangan.edit',
            'ruangan.delete',

            // Jadwal Ruangan
            'ruangan_jadwal.view',
            'ruangan_jadwal.create',
            'ruangan_jadwal.edit',
            'ruangan_jadwal.delete',
            'ruangan_jadwal.approve',

            // Laporan
            'laporan.akademik',
            'laporan.absensi',
            'laporan.nilai',
            'laporan.rapor',
            'laporan.siswa',
            'laporan.alumni',
            'laporan.prestasi',

            // User
            'user.view',
            'user.create',
            'user.edit',
            'user.delete',
            'user.reset_password',

            // Role
            'role.view',
            'role.create',
            'role.edit',
            'role.delete',

            // Permission
            'permission.view',
            'permission.create',
            'permission.edit',
            'permission.delete',

            // Config
            'config.view',
            'config.edit',

            // Menu
            'menu.view',
            'menu.create',
            'menu.edit',
            'menu.delete',

            // File
            'file.view',
            'file.upload',
            'file.delete',

            // Module
            'module.view',
            'module.install',
            'module.activate',
            'module.deactivate',

            // Maintenance
            'cache.clear',
            'jobs.view',
            'jobs.retry',
            'sessions.view',

            // Log
            'log.view',
            'log.export',
        ];

        // foreach ($permissions as $permission) {
        //     Permission::firstOrCreate([
        //         'name' => $permission,
        //         'guard_name' => 'web'
        //     ]);
        // }

        foreach ($permissions as $permission) {
            Permission::updateOrCreate(
                [
                    'name' => $permission,
                    'guard_name' => 'web',
                ],
                [
                    'description' => $this->permissionDescription($permission),
                ]
            );
        }


        /*
        |--------------------------------------------------------------------------
        | Roles
        |--------------------------------------------------------------------------
        */

        $roles = [
            [
                'name' => 'super_admin',
                'description' => 'Super Admin',
            ],
            [
                'name' => 'admin_sekolah',
                'description' => 'Admin Sekolah',
            ],
            [
                'name' => 'operator_akademik',
                'description' => 'Operator Akademik',
            ],
            [
                'name' => 'operator_kesiswaan',
                'description' => 'Operator Kesiswaan',
            ],
            [
                'name' => 'operator_sarpras',
                'description' => 'Operator Sarpras',
            ],
            [
                'name' => 'guru',
                'description' => 'Guru',
            ],
            [
                'name' => 'wali_kelas',
                'description' => 'Wali Kelas',
            ],
            [
                'name' => 'guru_bk',
                'description' => 'Guru BK',
            ],
            [
                'name' => 'kepala_sekolah',
                'description' => 'Kepala Sekolah',
            ],
            [
                'name' => 'orang_tua',
                'description' => 'Orang Tua',
            ],
            [
                'name' => 'siswa',
                'description' => 'Siswa',
            ],
        ];

        $createdRoles = [];

        foreach ($roles as $role) {
            $createdRoles[$role['name']] = Role::updateOrCreate(
                [
                    'name' => $role['name'],
                    'guard_name' => 'web',
                ],
                [
                    'description' => $role['description'],
                ]
            );
        }

        /*
        |--------------------------------------------------------------------------
        | Assign Permissions
        |--------------------------------------------------------------------------
        */

        // Ambil role dari array
        $superAdmin       = $createdRoles['super_admin'];
        $adminSekolah     = $createdRoles['admin_sekolah'];
        $operatorAkademik = $createdRoles['operator_akademik'];
        $guru             = $createdRoles['guru'];
        $waliKelas        = $createdRoles['wali_kelas'];
        $kepalaSekolah    = $createdRoles['kepala_sekolah'];

        // Super Admin
        $superAdmin->syncPermissions(Permission::all());

        // Admin Sekolah
        $adminSekolah->syncPermissions(
            Permission::whereNotIn('name', [
                'role.create',
                'role.edit',
                'role.delete',
                'permission.create',
                'permission.edit',
                'permission.delete',
                'cache.clear',
                'jobs.retry'
            ])->get()
        );

        // Operator Akademik
        $operatorAkademik->syncPermissions([
            'dashboard.view',

            'tahunajaran.view',
            'tahunajaran.create',
            'tahunajaran.edit',

            'semester.view',
            'semester.create',
            'semester.edit',

            'tingkat.view',
            'tingkat.create',
            'tingkat.edit',

            'jurusan.view',
            'jurusan.create',
            'jurusan.edit',

            'kelas.view',
            'kelas.create',
            'kelas.edit',

            'mapel.view',
            'mapel.create',
            'mapel.edit',

            'kompetensi.view',
            'kompetensi.create',
            'kompetensi.edit',

            'jadwal.view',
            'jadwal.create',
            'jadwal.edit',

            'nilai.view',
            'nilai.create',
            'nilai.edit',

            'rapor.view',
            'rapor.generate',
            'rapor.print'
        ]);

        // Guru
        $guru->syncPermissions([
            'dashboard.view',
            'jadwal.view',
            'absensi.view',
            'absensi.create',
            'nilai.view',
            'nilai.create',
            'assessment.view',
            'assessment.create'
        ]);

        // Wali Kelas
        $waliKelas->syncPermissions(
            array_merge(
                $guru->permissions->pluck('name')->toArray(),
                [
                    'rapor.view',
                    'rapor.generate',
                    'prestasi.view',
                    'prestasi.create'
                ]
            )
        );

        // Kepala Sekolah
        $kepalaSekolah->syncPermissions([
            'dashboard.view',
            'dashboard.statistik',
            'laporan.akademik',
            'laporan.absensi',
            'laporan.nilai',
            'laporan.rapor',
            'laporan.siswa',
            'laporan.prestasi',
            'laporan.alumni'
        ]);
    }


    private function permissionDescription(string $permission): string
    {
        [$module, $action] = explode('.', $permission);

        $modules = [
            'dashboard' => 'Dashboard',
            'sekolah' => 'Sekolah',
            'tahunajaran' => 'Tahun Ajaran',
            'semester' => 'Semester',
            'tingkat' => 'Tingkat',
            'jurusan' => 'Jurusan',
            'kelas' => 'Kelas',
            'mapel' => 'Mata Pelajaran',
            'kompetensi' => 'Kompetensi',
            'ekstrakurikuler' => 'Ekstrakurikuler',
            'siswa' => 'Siswa',
            'orangtua' => 'Orang Tua',
            'mutasi' => 'Mutasi',
            'alumni' => 'Alumni',
            'prestasi' => 'Prestasi',
            'pegawai' => 'Pegawai',
            'guru_mapel' => 'Guru Mata Pelajaran',
            'walikelas' => 'Wali Kelas',
            'jadwal' => 'Jadwal',
            'jampel' => 'Jam Pelajaran',
            'absensi' => 'Absensi',
            'nilai' => 'Nilai',
            'rapor' => 'Rapor',
            'assessment' => 'Assessment',
            'minatbakat' => 'Minat Bakat',
            'jawaban' => 'Jawaban Assessment',
            'ruangan' => 'Ruangan',
            'ruangan_jadwal' => 'Jadwal Ruangan',
            'user' => 'User',
            'role' => 'Role',
            'permission' => 'Permission',
            'config' => 'Konfigurasi',
            'menu' => 'Menu',
            'file' => 'File',
            'module' => 'Module',
            'cache' => 'Cache',
            'jobs' => 'Jobs',
            'sessions' => 'Session',
            'log' => 'Log',
            'laporan' => 'Laporan',
        ];

        $actions = [
            'view' => 'Lihat',
            'create' => 'Tambah',
            'edit' => 'Ubah',
            'delete' => 'Hapus',
            'import' => 'Import',
            'export' => 'Export',
            'approve' => 'Approve',
            'generate' => 'Generate',
            'publish' => 'Publish',
            'print' => 'Cetak',
            'activate' => 'Aktifkan',
            'deactivate' => 'Nonaktifkan',
            'install' => 'Install',
            'upload' => 'Upload',
            'retry' => 'Retry',
            'reset_password' => 'Reset Password',
            'input' => 'Input',
            'review' => 'Review',
            'nilai' => 'Penilaian',
            'statistik' => 'Lihat Statistik',
            'clear' => 'Clear',
        ];

        return ($actions[$action] ?? ucfirst($action))
            .' '
            .($modules[$module] ?? ucfirst($module));
    }


}
