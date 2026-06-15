<?php
namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

// Fortify / Breeze Multi-Auth Action Customizer
// Bagaimana login multi-guard diarahkan ke database Sanctum token yang terpusat.

class AuthController extends Controller {
    public function login(Request $request) {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'success' => false,
                'message' => 'Kredensial salah.'
            ], 401);
        }

        // Cek apakah 2FA diaktifkan
        if ($user->is_2fa_enabled) {
            $otp = rand(100000, 900000);
            
            // Simpan OTP ke cache redis atau database user_otp
            \Cache::put('otp_' . $user->email, $otp, now()->addMinutes(10));
            
            // Integrasikan dengan WA atau SMS Gateway
            // $this->whatsAppService->sendOTP($user->phone_no, $otp);

            return response()->json([
                'success' => true,
                'requireOtp' => true,
                'email' => $user->email,
                'message' => 'Kode OTP 2FA dikirimkan via WhatsApp/Email.'
            ]);
        }

        $token = $user->createToken('sanctum_token')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Login berhasil.',
            'token' => $token,
            'user' => $user->load('profileable')
        ]);
    }
}
