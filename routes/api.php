<?php
// routes/api.php
use App\Http\Controllers\Api\v1\AuthController;
use App\Http\Controllers\Api\v1\SiswaController;
use App\Http\Controllers\Api\v1\GuruController;
use App\Http\Controllers\Api\v1\AdminController;

// Sanctum Dynamic Guard API Routes v1
// Rancangan routing API di routes/api.php yang dienkapsulasi menggunakan middleware sanctum dan permission Spatie.

Route::prefix('v1')->group(function() {
    // Public routes (Auth & PPDB)
    Route::post('/auth/login', [AuthController::class, 'login']);
    Route::post('/auth/verify-otp', [AuthController::class, 'verifyOtp']);
    Route::post('/ppdb/register', [PPDBController::class, 'store']);

    // Authenticated API (Sanctum)
    Route::middleware('auth:sanctum')->group(function() {
        Route::post('/auth/logout', [AuthController::class, 'logout']);

        // Endpoints Siswa
        Route::prefix('siswa')->group(function() {
            Route::get('/profile', [SiswaController::class, 'profile']);
            Route::get('/nilai', [SiswaController::class, 'nilai'])->middleware('permission:student.view');
            Route::get('/jadwal', [SiswaController::class, 'jadwal']);
            Route::get('/absensi', [SiswaController::class, 'absensi']);
        });

        // Endpoints Guru / Pegawai
        Route::prefix('guru')->group(function() {
            Route::get('/jadwal', [GuruController::class, 'jadwal']);
            Route::post('/nilai', [GuruController::class, 'storeNilai'])->middleware('permission:nilai.input');
            Route::post('/absensi', [GuruController::class, 'storeAbsensi'])->middleware('permission:nilai.input');
        });

        // Endpoints Admin / Webmaster
        Route::prefix('admin')->middleware('role:webmaster|admin sekolah')->group(function() {
            Route::get('/dashboard', [AdminController::class, 'dashboard']);
            Route::get('/statistik', [AdminController::class, 'statistik']);
            Route::apiResource('/siswa', ManageSiswaController::class);
            Route::post('/modules/toggle', [ModuleController::class, 'toggle'])->middleware('permission:modules.manage');
        });
    });
});
