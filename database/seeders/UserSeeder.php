<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        /*
        |--------------------------------------------------------------------------
        | Super Admin
        |--------------------------------------------------------------------------
        */

        $superAdmin = User::updateOrCreate(
            [
                'email' => 'superadmin@laraschool.id',
            ],
            [
                'name' => 'Super Admin',
                'username' => 'superadmin',
                'password' => Hash::make('password123'),
                'email_verified_at' => now(),
            ]
        );

        $superAdmin->syncRoles(['super_admin']);

        /*
        |--------------------------------------------------------------------------
        | Admin Sekolah
        |--------------------------------------------------------------------------
        */

        $adminSekolah = User::updateOrCreate(
            [
                'email' => 'admin@laraschool.id',
            ],
            [
                'name' => 'Admin Sekolah',
                'username' => 'adminsekolah',
                'password' => Hash::make('password123'),
                'email_verified_at' => now(),
            ]
        );

        $adminSekolah->syncRoles(['admin_sekolah']);

        /*
        |--------------------------------------------------------------------------
        | Kepala Sekolah
        |--------------------------------------------------------------------------
        */

        $kepalaSekolah = User::updateOrCreate(
            [
                'email' => 'kepsek@laraschool.id',
            ],
            [
                'name' => 'Kepala Sekolah',
                'username' => 'kepalasekolah',
                'password' => Hash::make('password123'),
                'email_verified_at' => now(),
            ]
        );

        $kepalaSekolah->syncRoles(['kepala_sekolah']);

        /*
        |--------------------------------------------------------------------------
        | Guru
        |--------------------------------------------------------------------------
        */

        $guru = User::updateOrCreate(
            [
                'email' => 'guru@laraschool.id',
            ],
            [
                'name' => 'Guru Demo',
                'username' => 'guru',
                'password' => Hash::make('password123'),
                'email_verified_at' => now(),
            ]
        );

        $guru->syncRoles(['guru']);
    }
}
