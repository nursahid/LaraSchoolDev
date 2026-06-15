<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Login Admin — {{ config('app.name', 'LaraSchool') }}</title>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body { font-family: 'Inter', sans-serif; }
        .glass {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.15);
        }
        .glass-input {
            background: rgba(255, 255, 255, 0.10);
            border: 1px solid rgba(255, 255, 255, 0.20);
            color: #fff;
        }
        .glass-input::placeholder { color: rgba(255,255,255,0.5); }
        .glass-input:focus {
            outline: none;
            border-color: rgba(167,139,250,0.8);
            background: rgba(255,255,255,0.15);
            box-shadow: 0 0 0 3px rgba(139,92,246,0.3);
        }
        .glow-btn {
            background: linear-gradient(135deg, #8b5cf6, #6d28d9);
            box-shadow: 0 4px 20px rgba(109, 40, 217, 0.5);
            transition: all 0.3s ease;
        }
        .glow-btn:hover {
            background: linear-gradient(135deg, #7c3aed, #5b21b6);
            box-shadow: 0 6px 30px rgba(109, 40, 217, 0.7);
            transform: translateY(-1px);
        }
        /* Animated blobs */
        .blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(80px);
            opacity: 0.4;
            animation: float 8s ease-in-out infinite;
        }
        @keyframes float {
            0%, 100% { transform: translate(0, 0) scale(1); }
            33% { transform: translate(30px, -30px) scale(1.05); }
            66% { transform: translate(-20px, 20px) scale(0.95); }
        }
        /* Stats card */
        .stat-card { background: rgba(255,255,255,0.07); border: 1px solid rgba(255,255,255,0.10); }
    </style>
</head>
<body class="h-full overflow-hidden">

    <!-- Background Gradient -->
    <div class="fixed inset-0 bg-gradient-to-br from-indigo-950 via-purple-900 to-violet-950">
        <!-- Animated Blobs -->
        <div class="blob w-96 h-96 bg-purple-600 top-[-10%] left-[-5%]"></div>
        <div class="blob w-80 h-80 bg-indigo-600 bottom-[10%] right-[-5%]" style="animation-delay: 3s"></div>
        <div class="blob w-64 h-64 bg-violet-700 top-[40%] left-[50%]" style="animation-delay: 5s"></div>

        <!-- Grid pattern overlay -->
        <div class="absolute inset-0 opacity-5"
             style="background-image: linear-gradient(rgba(255,255,255,0.1) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.1) 1px, transparent 1px); background-size: 50px 50px;"></div>
    </div>

    <div class="relative z-10 flex h-full">

        <!-- Left Side - Branding & Stats -->
        <div class="hidden lg:flex lg:w-1/2 flex-col justify-between p-12">
            <!-- Logo -->
            <div class="flex items-center gap-3">
                <div class="w-12 h-12 rounded-2xl bg-gradient-to-br from-violet-400 to-purple-600 flex items-center justify-center shadow-lg">
                    <i class="fas fa-graduation-cap text-white text-xl"></i>
                </div>
                <div>
                    <h1 class="text-white font-bold text-xl">LaraSchool</h1>
                    <p class="text-purple-300 text-sm">Sistem Manajemen Sekolah</p>
                </div>
            </div>

            <!-- Main Headline -->
            <div>
                <h2 class="text-white text-4xl font-bold leading-tight mb-4">
                    Panel Admin<br>
                    <span class="text-transparent bg-clip-text bg-gradient-to-r from-violet-400 to-purple-300">Terpadu & Modern</span>
                </h2>
                <p class="text-purple-200 text-base leading-relaxed mb-8">
                    Kelola seluruh data sekolah dengan mudah — siswa, guru, nilai, jadwal, dan laporan dalam satu platform terintegrasi.
                </p>

                <!-- Stats -->
                <div class="grid grid-cols-3 gap-4">
                    <div class="stat-card rounded-2xl p-4 text-center">
                        <p class="text-3xl font-bold text-white">{{ $stats['total_siswa'] ?? '~' }}</p>
                        <p class="text-purple-300 text-xs mt-1">Total Siswa</p>
                    </div>
                    <div class="stat-card rounded-2xl p-4 text-center">
                        <p class="text-3xl font-bold text-white">{{ $stats['total_guru'] ?? '~' }}</p>
                        <p class="text-purple-300 text-xs mt-1">Guru & Staff</p>
                    </div>
                    <div class="stat-card rounded-2xl p-4 text-center">
                        <p class="text-3xl font-bold text-white">{{ $stats['total_kelas'] ?? '~' }}</p>
                        <p class="text-purple-300 text-xs mt-1">Kelas Aktif</p>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <p class="text-purple-400 text-sm">
                &copy; {{ date('Y') }} SMPN 3 Mepanga — Parigi Moutong, Sulawesi Tengah
            </p>
        </div>

        <!-- Right Side - Login Form -->
        <div class="flex-1 flex items-center justify-center p-6">
            <div class="glass rounded-3xl p-8 sm:p-10 w-full max-w-md shadow-2xl" x-data="{ showPass: false, loading: false }">

                <!-- Mobile Logo -->
                <div class="lg:hidden flex items-center gap-3 mb-8">
                    <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-violet-400 to-purple-600 flex items-center justify-center">
                        <i class="fas fa-graduation-cap text-white"></i>
                    </div>
                    <div>
                        <p class="text-white font-bold">LaraSchool</p>
                        <p class="text-purple-300 text-xs">Admin Panel</p>
                    </div>
                </div>

                <h2 class="text-white text-2xl font-bold mb-1">Selamat Datang</h2>
                <p class="text-purple-300 text-sm mb-8">Masuk dengan akun administrator Anda</p>

                <!-- Alerts -->
                @if ($errors->any())
                <div class="mb-5 p-4 rounded-xl bg-red-500/20 border border-red-400/30 flex items-start gap-3">
                    <i class="fas fa-exclamation-circle text-red-400 mt-0.5"></i>
                    <div>
                        @foreach ($errors->all() as $error)
                            <p class="text-red-200 text-sm">{{ $error }}</p>
                        @endforeach
                    </div>
                </div>
                @endif

                @if (session('status'))
                <div class="mb-5 p-4 rounded-xl bg-green-500/20 border border-green-400/30 flex items-center gap-3">
                    <i class="fas fa-check-circle text-green-400"></i>
                    <p class="text-green-200 text-sm">{{ session('status') }}</p>
                </div>
                @endif

                <!-- Form -->
                <form method="POST" action="{{ route('admin.auth.login.post') }}" @submit="loading = true">
                    @csrf

                    <!-- Email -->
                    <div class="mb-5">
                        <label class="block text-purple-200 text-sm font-medium mb-2">
                            <i class="fas fa-envelope mr-1 text-purple-400"></i> Email
                        </label>
                        <input type="email" name="email" value="{{ old('email') }}" required autofocus
                               class="glass-input w-full px-4 py-3 rounded-xl text-sm transition-all"
                               placeholder="admin@sekolah.sch.id">
                    </div>

                    <!-- Password -->
                    <div class="mb-5">
                        <label class="block text-purple-200 text-sm font-medium mb-2">
                            <i class="fas fa-lock mr-1 text-purple-400"></i> Password
                        </label>
                        <div class="relative">
                            <input :type="showPass ? 'text' : 'password'" name="password" required
                                   class="glass-input w-full px-4 py-3 pr-12 rounded-xl text-sm transition-all"
                                   placeholder="••••••••">
                            <button type="button" @click="showPass = !showPass"
                                    class="absolute right-4 top-1/2 -translate-y-1/2 text-purple-300 hover:text-white transition-colors">
                                <i :class="showPass ? 'fa-eye-slash' : 'fa-eye'" class="fas text-sm"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember & Forgot -->
                    <div class="flex items-center justify-between mb-6">
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" name="remember" class="rounded border-purple-400 bg-purple-900/30 text-purple-500 focus:ring-purple-500">
                            <span class="text-purple-200 text-sm">Ingat saya</span>
                        </label>
                        @if (Route::has('password.request'))
                        <a href="{{ route('password.request') }}" class="text-purple-300 hover:text-white text-sm transition-colors">
                            Lupa password?
                        </a>
                        @endif
                    </div>

                    <!-- Submit -->
                    <button type="submit" :disabled="loading"
                            class="glow-btn w-full py-3.5 rounded-xl text-white font-semibold text-sm flex items-center justify-center gap-2">
                        <span x-show="!loading">
                            <i class="fas fa-sign-in-alt mr-1"></i> Masuk ke Panel Admin
                        </span>
                        <span x-show="loading" x-cloak>
                            <i class="fas fa-spinner fa-spin mr-1"></i> Memproses...
                        </span>
                    </button>
                </form>

                <!-- Divider -->
                <div class="flex items-center gap-3 my-6">
                    <div class="flex-1 h-px bg-white/10"></div>
                    <span class="text-purple-400 text-xs">atau akses sebagai</span>
                    <div class="flex-1 h-px bg-white/10"></div>
                </div>

                <!-- Other panels -->
                <div class="grid grid-cols-2 gap-3">
                    <a href="{{ route('guru.auth.login') }}"
                       class="flex items-center justify-center gap-2 py-2.5 rounded-xl border border-white/15 text-purple-200 text-sm hover:bg-white/10 transition-all">
                        <i class="fas fa-chalkboard-teacher text-blue-400"></i> Panel Guru
                    </a>
                    <a href="{{ route('siswa.auth.login') }}"
                       class="flex items-center justify-center gap-2 py-2.5 rounded-xl border border-white/15 text-purple-200 text-sm hover:bg-white/10 transition-all">
                        <i class="fas fa-user-graduate text-emerald-400"></i> Panel Siswa
                    </a>
                </div>
            </div>
        </div>
    </div>

    @vite(['resources/js/app.js'])
</body>
</html>
