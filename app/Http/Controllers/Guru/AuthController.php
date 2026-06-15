<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function showLogin()
    {
        return view('guru.auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email'    => 'required|string',
            'password' => 'required|string',
        ]);

        $credentials = [
            'email'    => $request->email,
            'password' => $request->password,
        ];

        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $user = Auth::user();

            $allowedRoles = ['guru', 'wali_kelas', 'kepala_sekolah', 'tata_usaha', 'bendahara', 'webmaster', 'superadmin', 'admin'];
            if (!$user->hasAnyRole($allowedRoles)) {
                Auth::logout();
                return back()->withErrors(['email' => 'Akun Anda tidak memiliki akses Panel Guru.']);
            }

            $request->session()->regenerate();

            $tapelAktif = DB::table('siklus_tahunajaran')->where('is_active', 1)->first();
            if ($tapelAktif) {
                session(['tapel_aktif' => $tapelAktif->nama_tapel, 'tapel_id' => $tapelAktif->tapel]);
            }

            activity('auth')
                ->causedBy($user)
                ->withProperties(['ip' => $request->ip(), 'panel' => 'guru'])
                ->event('login')
                ->log("Login Guru: {$user->name}");

            return redirect()->intended(route('guru.dashboard'))
                ->with('success', 'Selamat datang, ' . $user->name . '!');
        }

        activity('auth')
            ->withProperties(['ip' => $request->ip(), 'email' => $request->email, 'panel' => 'guru'])
            ->event('login_failed')
            ->log('Login Guru gagal: ' . $request->email);

        return back()->withErrors(['email' => 'Email atau password tidak valid.'])->withInput($request->only('email'));
    }

    public function logout(Request $request)
    {
        $user = Auth::user();

        if ($user) {
            activity('auth')
                ->causedBy($user)
                ->withProperties(['ip' => $request->ip(), 'panel' => 'guru'])
                ->event('logout')
                ->log("Logout Guru: {$user->name}");
        }

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('guru.auth.login')->with('success', 'Anda berhasil keluar.');
    }
}
