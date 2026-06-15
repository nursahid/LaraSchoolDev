<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AppConfig;
use App\Models\Pegawai;
use App\Models\Siswa;
use App\Models\SiklusKelasRombel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function showLogin()
    {
        $stats = [
            'total_siswa' => Siswa::aktif()->count(),
            'total_guru'  => Pegawai::aktif()->count(),
            'total_kelas' => SiklusKelasRombel::where('aktif', 1)->count(),
        ];

        return view('admin.auth.login', compact('stats'));
    }

    public function login(Request $request)
    {
        $request->validate([
            'email'    => 'required|string',
            'password' => 'required|string',
        ], [
            'email.required'    => 'Email wajib diisi.',
            'password.required' => 'Password wajib diisi.',
        ]);

        $credentials = [
            'email'    => $request->email,
            'password' => $request->password,
        ];

        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $user = Auth::user();

            // Pastikan user punya role admin
            if (!$user->hasAnyRole(['super_admin', 'admin_sekolah', 'operator_akademik', 'operator_kesiswaan', 'operator_sarpras', 'kepala_sekolah'])) {
                Auth::logout();
                return back()->withErrors(['email' => 'Akun Anda tidak memiliki akses Admin Panel.']);
            }

            $request->session()->regenerate();

            // Simpan tahun ajaran aktif ke session
            $tapelAktif = DB::table('siklus_tahunajaran')->where('status', 1)->first();
            if ($tapelAktif) {
                session(['tapel_aktif' => $tapelAktif->tahun_ajaran, 'tapel_id' => $tapelAktif->id_tahunajaran]);
            }

            activity('auth')
                ->causedBy($user)
                ->withProperties(['ip' => $request->ip(), 'panel' => 'admin'])
                ->event('login')
                ->log("Login Admin: {$user->name}");

            return redirect()->intended(route('admin.dashboard'))
                ->with('success', 'Selamat datang, ' . $user->name . '!');
        }

        activity('auth')
            ->withProperties(['ip' => $request->ip(), 'email' => $request->email, 'panel' => 'admin'])
            ->event('login_failed')
            ->log('Login Admin gagal: ' . $request->email);

        return back()->withErrors([
            'email' => 'Email atau password yang Anda masukkan tidak valid.',
        ])->withInput($request->only('email'));
    }

    public function logout(Request $request)
    {
        $user = Auth::user();

        if ($user) {
            activity('auth')
                ->causedBy($user)
                ->withProperties(['ip' => $request->ip(), 'panel' => 'admin'])
                ->event('logout')
                ->log("Logout Admin: {$user->name}");
        }

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('admin.auth.login')
            ->with('success', 'Anda berhasil keluar.');
    }
}
