<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function showLogin()
    {
        return view('siswa.auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'login'    => 'required|string',
            'password' => 'required|string',
        ]);

        $login = $request->login;
        $loginMode = $request->login_mode ?? 'username';

        // Cari user via email atau username/NIS
        $user = null;
        if ($loginMode === 'email' || str_contains($login, '@')) {
            $user = User::where('email', $login)->first();
        } else {
            // Login via NIS — cari siswa dulu
            $siswa = DB::table('siswa')->where('username', $login)->orWhere('nis', $login)->first();
            if ($siswa && $siswa->id_user) {
                $user = User::find($siswa->id_user);
            }
        }

        if ($user && Hash::check($request->password, $user->password)) {
            // Pastikan role siswa
            if (!$user->hasRole('siswa')) {
                return back()->withErrors(['login' => 'Akun ini bukan akun siswa.']);
            }

            Auth::login($user, $request->boolean('remember'));
            $request->session()->regenerate();

            $tapelAktif = DB::table('siklus_tahunajaran')->where('is_active', 1)->first();
            if ($tapelAktif) {
                session(['tapel_aktif' => $tapelAktif->nama_tapel, 'tapel_id' => $tapelAktif->tapel]);
            }

            activity('auth')
                ->causedBy($user)
                ->withProperties(['ip' => $request->ip(), 'panel' => 'siswa'])
                ->event('login')
                ->log("Login Siswa: {$user->name}");

            return redirect()->intended(route('siswa.dashboard'))
                ->with('success', 'Selamat datang, ' . $user->name . '!');
        }

        activity('auth')
            ->withProperties(['ip' => $request->ip(), 'login' => $request->login, 'panel' => 'siswa'])
            ->event('login_failed')
            ->log('Login Siswa gagal: ' . $request->login);

        return back()->withErrors(['login' => 'NIS/Email atau password tidak valid.'])->withInput($request->only('login'));
    }

    public function logout(Request $request)
    {
        $user = Auth::user();

        if ($user) {
            activity('auth')
                ->causedBy($user)
                ->withProperties(['ip' => $request->ip(), 'panel' => 'siswa'])
                ->event('logout')
                ->log("Logout Siswa: {$user->name}");
        }

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('siswa.auth.login')->with('success', 'Anda berhasil keluar.');
    }
}
