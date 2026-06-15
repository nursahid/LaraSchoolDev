<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Login Guru — {{ config('app.name', 'LaraSchool') }}</title>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body { font-family: 'Inter', sans-serif; }
        .glass { background: rgba(255,255,255,0.08); backdrop-filter: blur(20px); border: 1px solid rgba(255,255,255,0.15); }
        .glass-input { background: rgba(255,255,255,0.10); border: 1px solid rgba(255,255,255,0.20); color:#fff; }
        .glass-input::placeholder { color: rgba(255,255,255,0.5); }
        .glass-input:focus { outline: none; border-color: rgba(103,232,249,0.8); background: rgba(255,255,255,0.15); box-shadow: 0 0 0 3px rgba(8,145,178,0.3); }
        .glow-btn { background: linear-gradient(135deg,#0891b2,#0e7490); box-shadow: 0 4px 20px rgba(8,145,178,0.5); transition: all 0.3s; }
        .glow-btn:hover { box-shadow: 0 6px 30px rgba(8,145,178,0.7); transform: translateY(-1px); }
        .blob { position:absolute; border-radius:50%; filter:blur(80px); opacity:0.4; animation:float 8s ease-in-out infinite; }
        @keyframes float { 0%,100%{transform:translate(0,0) scale(1)} 33%{transform:translate(30px,-30px) scale(1.05)} 66%{transform:translate(-20px,20px) scale(0.95)} }
    </style>
</head>
<body class="h-full overflow-hidden">
    <div class="fixed inset-0 bg-gradient-to-br from-sky-950 via-cyan-900 to-sky-900">
        <div class="blob w-96 h-96 bg-cyan-600 top-[-10%] left-[-5%]"></div>
        <div class="blob w-80 h-80 bg-sky-600 bottom-[10%] right-[-5%]" style="animation-delay:3s"></div>
        <div class="absolute inset-0 opacity-5" style="background-image: linear-gradient(rgba(255,255,255,0.1) 1px, transparent 1px), linear-gradient(90deg, rgba(255,255,255,0.1) 1px, transparent 1px); background-size: 50px 50px;"></div>
    </div>

    <div class="relative z-10 flex h-full">
        <!-- Left Branding -->
        <div class="hidden lg:flex lg:w-1/2 flex-col justify-between p-12">
            <div class="flex items-center gap-3">
                <div class="w-12 h-12 rounded-2xl bg-gradient-to-br from-cyan-400 to-sky-600 flex items-center justify-center shadow-lg">
                    <i class="fas fa-chalkboard-teacher text-white text-xl"></i>
                </div>
                <div>
                    <h1 class="text-white font-bold text-xl">LaraSchool</h1>
                    <p class="text-cyan-300 text-sm">Panel Guru & Pegawai</p>
                </div>
            </div>
            <div>
                <h2 class="text-white text-4xl font-bold leading-tight mb-4">
                    Selamat Datang,<br>
                    <span class="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-sky-300">Tenaga Pendidik</span>
                </h2>
                <p class="text-sky-200 text-base leading-relaxed mb-6">
                    Akses jadwal mengajar, input nilai siswa, absensi kelas, dan cetak rapor dalam satu platform terintegrasi.
                </p>
                <div class="flex items-center gap-4 text-cyan-200 text-sm">
                    <div class="flex items-center gap-2"><i class="fas fa-check-circle text-cyan-400"></i> Input Nilai Digital</div>
                    <div class="flex items-center gap-2"><i class="fas fa-check-circle text-cyan-400"></i> Rapor Online</div>
                </div>
            </div>
            <p class="text-sky-400 text-sm">&copy; {{ date('Y') }} SMPN 3 Mepanga</p>
        </div>

        <!-- Right Form -->
        <div class="flex-1 flex items-center justify-center p-6">
            <div class="glass rounded-3xl p-8 sm:p-10 w-full max-w-md shadow-2xl" x-data="{ showPass: false, loading: false }">
                <div class="lg:hidden flex items-center gap-3 mb-8">
                    <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-cyan-400 to-sky-600 flex items-center justify-center">
                        <i class="fas fa-chalkboard-teacher text-white"></i>
                    </div>
                    <div>
                        <p class="text-white font-bold">LaraSchool</p>
                        <p class="text-cyan-300 text-xs">Panel Guru</p>
                    </div>
                </div>

                <h2 class="text-white text-2xl font-bold mb-1">Login Guru</h2>
                <p class="text-cyan-300 text-sm mb-8">Masuk dengan akun guru atau pegawai Anda</p>

                @if ($errors->any())
                <div class="mb-5 p-4 rounded-xl bg-red-500/20 border border-red-400/30 flex items-start gap-3">
                    <i class="fas fa-exclamation-circle text-red-400 mt-0.5"></i>
                    <div>@foreach($errors->all() as $e)<p class="text-red-200 text-sm">{{ $e }}</p>@endforeach</div>
                </div>
                @endif

                <form method="POST" action="{{ route('guru.auth.login.post') }}" @submit="loading = true">
                    @csrf
                    <div class="mb-5">
                        <label class="block text-cyan-200 text-sm font-medium mb-2"><i class="fas fa-envelope mr-1 text-cyan-400"></i> Email / NIP</label>
                        <input type="text" name="email" value="{{ old('email') }}" required autofocus
                               class="glass-input w-full px-4 py-3 rounded-xl text-sm"
                               placeholder="email@sekolah.sch.id atau NIP">
                    </div>
                    <div class="mb-5">
                        <label class="block text-cyan-200 text-sm font-medium mb-2"><i class="fas fa-lock mr-1 text-cyan-400"></i> Password</label>
                        <div class="relative">
                            <input :type="showPass ? 'text' : 'password'" name="password" required
                                   class="glass-input w-full px-4 py-3 pr-12 rounded-xl text-sm"
                                   placeholder="••••••••">
                            <button type="button" @click="showPass = !showPass" class="absolute right-4 top-1/2 -translate-y-1/2 text-cyan-300 hover:text-white">
                                <i :class="showPass ? 'fa-eye-slash' : 'fa-eye'" class="fas text-sm"></i>
                            </button>
                        </div>
                    </div>
                    <div class="flex items-center justify-between mb-6">
                        <label class="flex items-center gap-2 cursor-pointer">
                            <input type="checkbox" name="remember" class="rounded border-cyan-400 text-cyan-500">
                            <span class="text-cyan-200 text-sm">Ingat saya</span>
                        </label>
                    </div>
                    <button type="submit" :disabled="loading" class="glow-btn w-full py-3.5 rounded-xl text-white font-semibold text-sm flex items-center justify-center gap-2">
                        <span x-show="!loading"><i class="fas fa-sign-in-alt mr-1"></i> Masuk ke Panel Guru</span>
                        <span x-show="loading" x-cloak><i class="fas fa-spinner fa-spin mr-1"></i> Memproses...</span>
                    </button>
                </form>

                <div class="flex items-center gap-3 my-6">
                    <div class="flex-1 h-px bg-white/10"></div>
                    <span class="text-cyan-400 text-xs">panel lainnya</span>
                    <div class="flex-1 h-px bg-white/10"></div>
                </div>
                <div class="grid grid-cols-2 gap-3">
                    <a href="{{ route('admin.auth.login') }}" class="flex items-center justify-center gap-2 py-2.5 rounded-xl border border-white/15 text-cyan-200 text-sm hover:bg-white/10 transition-all">
                        <i class="fas fa-user-shield text-purple-400"></i> Panel Admin
                    </a>
                    <a href="{{ route('siswa.auth.login') }}" class="flex items-center justify-center gap-2 py-2.5 rounded-xl border border-white/15 text-cyan-200 text-sm hover:bg-white/10 transition-all">
                        <i class="fas fa-user-graduate text-emerald-400"></i> Panel Siswa
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
