<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Admin\AuthController as AdminAuthController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboard;
use App\Http\Controllers\Admin\SiswaController as AdminSiswa;
use App\Http\Controllers\Admin\PegawaiController as AdminPegawai;
use App\Http\Controllers\Admin\MapelController as AdminMapel;
use App\Http\Controllers\Admin\KelasController as AdminKelas;
use App\Http\Controllers\Admin\NilaiController as AdminNilai;
use App\Http\Controllers\Admin\JadwalController as AdminJadwal;
use App\Http\Controllers\Admin\TahunAjaranController as AdminTahunAjaran;
use App\Http\Controllers\Admin\EkstrakurikulerController as AdminEkstrakurikuler;
use App\Http\Controllers\Admin\AbsensiController as AdminAbsensi;
use App\Http\Controllers\Admin\PrestasiController as AdminPrestasi;
use App\Http\Controllers\Admin\ConfigController as AdminConfig;
use App\Http\Controllers\Admin\UserController as AdminUser;
use App\Http\Controllers\Admin\AktivitasController as AdminAktivitas;
use App\Http\Controllers\Admin\MenuManagerController as AdminMenuManager;
use App\Http\Controllers\Admin\MapelTingkatController as AdminMapelTingkat;
use App\Http\Controllers\Admin\PegawaiMapelController as AdminPegawaiMapel;
use App\Http\Controllers\Guru\AuthController as GuruAuthController;
use App\Http\Controllers\Guru\DashboardController as GuruDashboard;
use App\Http\Controllers\Guru\NilaiController as GuruNilai;
use App\Http\Controllers\Guru\AbsensiController as GuruAbsensi;
use App\Http\Controllers\Guru\JadwalController as GuruJadwal;
use App\Http\Controllers\Guru\RaporController as GuruRapor;
use App\Http\Controllers\Guru\MonitoringController as GuruMonitoring;
use App\Http\Controllers\Siswa\AuthController as SiswaAuthController;
use App\Http\Controllers\Siswa\DashboardController as SiswaDashboard;
use App\Http\Controllers\Siswa\NilaiController as SiswaNilai;
use App\Http\Controllers\Siswa\JadwalController as SiswaJadwal;
use App\Http\Controllers\Siswa\AbsensiController as SiswaAbsensi;
use App\Http\Controllers\Siswa\RaporController as SiswaRapor;
use App\Http\Controllers\Siswa\UjianController as SiswaUjian;
use App\Http\Controllers\Siswa\AssesmenController as SiswaAssesmen;
use Illuminate\Support\Facades\Route;

// =====================================================
// LANDING PAGE
// =====================================================
Route::get('/', function () {
    return redirect()->route('admin.auth.login');
});

// =====================================================
// ADMIN PANEL
// =====================================================
Route::prefix('admin')->name('admin.')->group(function () {

    // Auth
    Route::get('login', [AdminAuthController::class, 'showLogin'])->name('auth.login')->middleware('guest');
    Route::post('login', [AdminAuthController::class, 'login'])->name('auth.login.post')->middleware('guest');
    Route::post('logout', [AdminAuthController::class, 'logout'])->name('logout')->middleware('auth');

    // Protected Admin Routes
    Route::middleware(['auth', 'role:super_admin|admin_sekolah|operator_akademik|operator_kesiswaan|operator_sarpras|kepala_sekolah'])->group(function () {

        // Dashboard
        Route::get('dashboard', [AdminDashboard::class, 'index'])->name('dashboard');
        Route::get('profile', [AdminDashboard::class, 'profile'])->name('profile');
        Route::put('profile', [AdminDashboard::class, 'updateProfile'])->name('profile.update');

        // Data Siswa
        Route::resource('siswa', AdminSiswa::class)->except(['show']);
        Route::get('siswa/{siswa}', [AdminSiswa::class, 'show'])->name('siswa.show');
        Route::get('siswa/{siswa}/kartu', [AdminSiswa::class, 'kartu'])->name('siswa.kartu');
        Route::get('siswa-import', [AdminSiswa::class, 'importForm'])->name('siswa.import.form');
        Route::post('siswa-import', [AdminSiswa::class, 'import'])->name('siswa.import');
        Route::get('siswa-export', [AdminSiswa::class, 'export'])->name('siswa.export');

        // Data Pegawai
        Route::resource('pegawai', AdminPegawai::class)->except(['show']);
        Route::get('pegawai/{pegawai}', [AdminPegawai::class, 'show'])->name('pegawai.show');

        // Data Kelas
        Route::resource('kelas', AdminKelas::class);

        // Mata Pelajaran
        Route::resource('mapel', AdminMapel::class);

        // Mapel per Tingkat (SMA)
        Route::resource('mapel-tingkat', AdminMapelTingkat::class)->only(['index', 'store', 'destroy']);

        // Guru Mapel (penugasan mengajar)
        Route::resource('pegawai-mapel', AdminPegawaiMapel::class)->only(['index', 'store', 'destroy']);

        // Nilai
        Route::get('nilai', [AdminNilai::class, 'index'])->name('nilai.index');
        Route::get('nilai/input', [AdminNilai::class, 'input'])->name('nilai.input');
        Route::post('nilai/store-batch', [AdminNilai::class, 'storeBatch'])->name('nilai.store-batch');
        Route::delete('nilai/{id}', [AdminNilai::class, 'destroy'])->name('nilai.destroy');

        // Jadwal
        Route::resource('jadwal', AdminJadwal::class);

        // Absensi
        Route::get('absensi', [AdminAbsensi::class, 'index'])->name('absensi.index');
        Route::get('absensi/laporan', [AdminAbsensi::class, 'laporan'])->name('absensi.laporan');

        // Prestasi
        Route::resource('prestasi', AdminPrestasi::class);

        // Tahun Ajaran
        Route::post('tahunajaran/semester/{id}/toggle', [AdminTahunAjaran::class, 'toggleSemester'])->name('tahunajaran.semester.toggle');
        Route::resource('tahunajaran', AdminTahunAjaran::class);
        Route::post('tahunajaran/{id}/aktifkan', [AdminTahunAjaran::class, 'aktifkan'])->name('tahunajaran.aktifkan');

        // Ekstrakurikuler
        Route::resource('ekstrakurikuler', AdminEkstrakurikuler::class);

        // Manajemen User
        Route::resource('users', AdminUser::class);
        Route::post('users/{user}/toggle-status', [AdminUser::class, 'toggleStatus'])->name('users.toggle-status');

        // Konfigurasi
        Route::get('config', [AdminConfig::class, 'index'])->name('config.index');
        Route::match(['POST', 'PUT'], 'config', [AdminConfig::class, 'update'])->name('config.update');

        // Log Aktivitas
        Route::get('aktivitas', [AdminAktivitas::class, 'index'])->name('aktivitas.index');
        Route::delete('aktivitas/{id}', [AdminAktivitas::class, 'destroy'])->name('aktivitas.destroy');
        Route::delete('aktivitas', [AdminAktivitas::class, 'destroyAll'])->name('aktivitas.destroy-all');
    });

    // Menu Manager — super_admin only
    Route::middleware(['auth', 'role:super_admin'])->prefix('menu-manager')->name('menu-manager.')->group(function () {
        Route::get('/', [AdminMenuManager::class, 'index'])->name('index');
        // Groups
        Route::post('groups', [AdminMenuManager::class, 'storeGroup'])->name('groups.store');
        Route::put('groups/{group}', [AdminMenuManager::class, 'updateGroup'])->name('groups.update');
        Route::delete('groups/{group}', [AdminMenuManager::class, 'destroyGroup'])->name('groups.destroy');
        Route::post('groups/{group}/toggle', [AdminMenuManager::class, 'toggleGroup'])->name('groups.toggle');
        // Menus
        Route::post('menus', [AdminMenuManager::class, 'storeMenu'])->name('menus.store');
        Route::put('menus/{menu}', [AdminMenuManager::class, 'updateMenu'])->name('menus.update');
        Route::delete('menus/{menu}', [AdminMenuManager::class, 'destroyMenu'])->name('menus.destroy');
        Route::post('menus/{menu}/toggle', [AdminMenuManager::class, 'toggleMenu'])->name('menus.toggle');
    });
});

// =====================================================
// GURU PANEL
// =====================================================
Route::prefix('guru')->name('guru.')->group(function () {

    // Auth
    Route::get('login', [GuruAuthController::class, 'showLogin'])->name('auth.login')->middleware('guest');
    Route::post('login', [GuruAuthController::class, 'login'])->name('auth.login.post')->middleware('guest');
    Route::post('logout', [GuruAuthController::class, 'logout'])->name('logout')->middleware('auth');

    // Protected Guru Routes
    Route::middleware(['auth', 'role:guru|wali_kelas|kepala_sekolah|guru_bk'])->group(function () {

        Route::get('dashboard', [GuruDashboard::class, 'index'])->name('dashboard');
        Route::get('profile', [GuruDashboard::class, 'profile'])->name('profile');
        Route::put('profile', [GuruDashboard::class, 'updateProfile'])->name('profile.update');

        // Jadwal Mengajar
        Route::get('jadwal', [GuruJadwal::class, 'index'])->name('jadwal.index');

        // Input Nilai
        Route::get('nilai', [GuruNilai::class, 'index'])->name('nilai.index');
        Route::get('nilai/input', [GuruNilai::class, 'input'])->name('nilai.input');
        Route::post('nilai/store', [GuruNilai::class, 'store'])->name('nilai.store');
        Route::put('nilai/{id}', [GuruNilai::class, 'update'])->name('nilai.update');
        Route::delete('nilai/{id}', [GuruNilai::class, 'destroy'])->name('nilai.destroy');

        // Absensi Kelas
        Route::get('absensi', [GuruAbsensi::class, 'index'])->name('absensi.index');
        Route::post('absensi/simpan', [GuruAbsensi::class, 'simpan'])->name('absensi.simpan');

        // Rapor (Wali Kelas)
        Route::get('rapor', [GuruRapor::class, 'index'])->name('rapor.index');
        Route::get('rapor/{id}/cetak', [GuruRapor::class, 'cetak'])->name('rapor.cetak');

        // Monitoring Siswa
        Route::get('monitoring', [GuruMonitoring::class, 'index'])->name('monitoring.index');
        Route::get('monitoring/{id}', [GuruMonitoring::class, 'detail'])->name('monitoring.detail');
    });
});

// =====================================================
// SISWA PANEL
// =====================================================
Route::prefix('siswa')->name('siswa.')->group(function () {

    // Auth
    Route::get('login', [SiswaAuthController::class, 'showLogin'])->name('auth.login')->middleware('guest');
    Route::post('login', [SiswaAuthController::class, 'login'])->name('auth.login.post')->middleware('guest');
    Route::post('logout', [SiswaAuthController::class, 'logout'])->name('logout')->middleware('auth');

    // Protected Siswa Routes
    Route::middleware(['auth', 'role:siswa'])->group(function () {

        Route::get('dashboard', [SiswaDashboard::class, 'index'])->name('dashboard');
        Route::get('profile', [SiswaDashboard::class, 'profile'])->name('profile');
        Route::put('profile', [SiswaDashboard::class, 'updateProfile'])->name('profile.update');

        // Nilai
        Route::get('nilai', [SiswaNilai::class, 'index'])->name('nilai.index');
        Route::get('nilai/detail/{id_mapel}', [SiswaNilai::class, 'detail'])->name('nilai.detail');

        // Jadwal
        Route::get('jadwal', [SiswaJadwal::class, 'index'])->name('jadwal.index');

        // Absensi
        Route::get('absensi', [SiswaAbsensi::class, 'index'])->name('absensi.index');

        // Rapor
        Route::get('rapor', [SiswaRapor::class, 'index'])->name('rapor.index');
        Route::get('rapor/{tapel}/{semester}/download', [SiswaRapor::class, 'download'])->name('rapor.download');

        // Ujian Online
        Route::get('ujian', [SiswaUjian::class, 'index'])->name('ujian.index');
        Route::get('ujian/{id}/mulai', [SiswaUjian::class, 'mulai'])->name('ujian.mulai');
        Route::post('ujian/{id}/submit', [SiswaUjian::class, 'submit'])->name('ujian.submit');
        Route::get('ujian/{id}/hasil', [SiswaUjian::class, 'hasil'])->name('ujian.hasil');

        // Assesmen
        Route::get('assesmen', [SiswaAssesmen::class, 'index'])->name('assesmen.index');
        Route::get('assesmen/{id}', [SiswaAssesmen::class, 'kerjakan'])->name('assesmen.kerjakan');
        Route::post('assesmen/{id}/submit', [SiswaAssesmen::class, 'submit'])->name('assesmen.submit');
        Route::get('assesmen/{id}/hasil', [SiswaAssesmen::class, 'hasil'])->name('assesmen.hasil');
    });
});

// Default Breeze Routes (untuk fallback)
Route::get('/dashboard', function () {
    return redirect()->route('admin.dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
