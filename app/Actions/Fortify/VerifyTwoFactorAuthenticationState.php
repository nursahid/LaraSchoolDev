<?php

// Google Authenticator 2FA Verification Logic
// Menjamin validitas token login menggunakan algoritma TOTP (Time-based One-time Password) untuk keamanan users teridentifikasi.
namespace App\Actions\Fortify;

use PragmaRX\Google2FALaravel\Support\Authenticator;

class VerifyTwoFactorAuthenticationState {
    protected $authenticator;

    public function __construct(Authenticator $authenticator) {
        $this->authenticator = $authenticator;
    }

    /**
     * Memvalidasi request 2FA OTP satu arah
     */
    public function verify($user, $code) {
        $google2fa = app('pragmarx.google2fa');

        // Mengambil secret terenkripsi dari model users
        $secret = decrypt($user->google2fa_secret);

        $valid = $google2fa->verifyKey($secret, $code);

        if ($valid) {
            $user->update(['is_2fa_enabled' => true]);
            return true;
        }

        return false;
    }
}
