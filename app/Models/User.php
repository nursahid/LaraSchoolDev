<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

use Spatie\Permission\Traits\HasRoles;

#[Fillable(['name', 'email', 'password'])]
#[Hidden(['password', 'remember_token'])]

// Polymorphic Auth Architecture (Schema Refactor)
// Menyatukan otentikasi multi-auth (siswa, pegawai, admin) ke satu tabel users menggunakan relasi polimorfis. 
// Memudahkan otentikasi Sanctum & manajemen token.

class User extends Authenticatable
{
    /** @use HasFactory<UserFactory> */
    use HasFactory, Notifiable;
    use HasApiTokens, HasRoles;
	
	protected $guard_name = 'web';

    protected $fillable = [
        'name', 'email', 'password', 'phone_no', 
        'is_2fa_enabled', 'otp_secret', 'google2fa_secret', 
        'profileable_type', 'profileable_id'
    ];

    protected $hidden = [
        'password', 'remember_token', 'google2fa_secret', 'otp_secret'
    ];

    /**
     * Dapatkan model profil pemilik akun (Siswa / Pegawai / Admin)
     */
    public function profileable() {
        return $this->morphTo();
    }

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
