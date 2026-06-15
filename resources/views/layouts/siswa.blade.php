<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="h-full">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Siswa') — {{ config('app.name', 'LaraSchool') }}</title>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body { font-family: 'Inter', sans-serif; }
        .sidebar-link.active { background: rgba(255,255,255,0.15); border-left: 3px solid #6ee7b7; }
        .sidebar-link:hover { background: rgba(255,255,255,0.10); }
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-thumb { background: #059669; border-radius: 99px; }
    </style>
    @stack('styles')
</head>
<body class="h-full bg-gradient-to-br from-emerald-950 via-teal-950 to-emerald-900 min-h-screen" x-data="{ sidebarOpen: true, mobileOpen: false }">

    <div x-show="mobileOpen" @click="mobileOpen = false" class="fixed inset-0 z-20 bg-black/50 lg:hidden" x-transition></div>

    <!-- Sidebar - Emerald/Teal -->
    <aside :class="sidebarOpen ? 'w-64' : 'w-16'"
           class="fixed inset-y-0 left-0 z-30 flex flex-col transition-all duration-300 bg-gradient-to-b from-emerald-950 via-teal-900 to-emerald-900 shadow-2xl">

        <div class="flex items-center h-16 px-4 border-b border-white/10">
            <div class="flex items-center gap-3 overflow-hidden">
                <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-emerald-400 to-teal-600 flex items-center justify-center flex-shrink-0">
                    <i class="fas fa-user-graduate text-white text-sm"></i>
                </div>
                <div x-show="sidebarOpen" class="overflow-hidden whitespace-nowrap" x-transition>
                    <p class="text-white font-bold text-base leading-none">LaraSchool</p>
                    <p class="text-emerald-300 text-xs">Portal Siswa</p>
                </div>
            </div>
            <button @click="sidebarOpen = !sidebarOpen" class="ml-auto text-white/60 hover:text-white hidden lg:block transition-colors p-1">
                <i :class="sidebarOpen ? 'fa-chevron-left' : 'fa-chevron-right'" class="fas text-xs"></i>
            </button>
        </div>

        <nav class="flex-1 overflow-y-auto py-4 space-y-1 px-2">
            <a href="{{ route('siswa.dashboard') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.dashboard') ? 'active' : '' }}">
                <i class="fas fa-home w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Beranda</span>
            </a>

            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-emerald-400 text-[10px] font-semibold uppercase tracking-widest">Akademik</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('siswa.nilai.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.nilai.*') ? 'active' : '' }}">
                <i class="fas fa-star w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Nilai Saya</span>
            </a>
            <a href="{{ route('siswa.jadwal.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.jadwal.*') ? 'active' : '' }}">
                <i class="fas fa-calendar-alt w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Jadwal Pelajaran</span>
            </a>
            <a href="{{ route('siswa.absensi.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.absensi.*') ? 'active' : '' }}">
                <i class="fas fa-clipboard-check w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Absensi Saya</span>
            </a>
            <a href="{{ route('siswa.rapor.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.rapor.*') ? 'active' : '' }}">
                <i class="fas fa-file-alt w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Rapor Digital</span>
            </a>

            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-emerald-400 text-[10px] font-semibold uppercase tracking-widest">Ujian</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('siswa.ujian.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.ujian.*') ? 'active' : '' }}">
                <i class="fas fa-pen-alt w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Ujian Online</span>
            </a>
            <a href="{{ route('siswa.assesmen.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.assesmen.*') ? 'active' : '' }}">
                <i class="fas fa-brain w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Assesmen</span>
            </a>

            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-emerald-400 text-[10px] font-semibold uppercase tracking-widest">Profil</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('siswa.profile') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-emerald-100 text-sm transition-all {{ request()->routeIs('siswa.profile') ? 'active' : '' }}">
                <i class="fas fa-id-card w-5 text-center text-emerald-300"></i>
                <span x-show="sidebarOpen" x-transition>Profil Saya</span>
            </a>
        </nav>

        <div class="border-t border-white/10 p-3">
            <div class="flex items-center gap-3">
                <div class="w-8 h-8 rounded-full bg-gradient-to-br from-emerald-400 to-teal-600 flex items-center justify-center flex-shrink-0">
                    <span class="text-white text-xs font-bold">{{ substr(Auth::user()->name ?? 'S', 0, 1) }}</span>
                </div>
                <div x-show="sidebarOpen" class="overflow-hidden flex-1" x-transition>
                    <p class="text-white text-sm font-medium truncate">{{ Auth::user()->name ?? 'Siswa' }}</p>
                    <p class="text-emerald-300 text-xs truncate">{{ Auth::user()->email ?? '' }}</p>
                </div>
                <div x-show="sidebarOpen" x-transition>
                    <form method="POST" action="{{ route('siswa.logout') }}">
                        @csrf
                        <button type="submit" class="text-emerald-300 hover:text-red-400 transition-colors" title="Logout">
                            <i class="fas fa-sign-out-alt"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </aside>

    <div :class="sidebarOpen ? 'lg:pl-64' : 'lg:pl-16'" class="flex flex-col min-h-screen transition-all duration-300">
        <header class="sticky top-0 z-10 flex items-center h-16 bg-white/10 backdrop-blur-md border-b border-white/10 px-4">
            <button @click="mobileOpen = !mobileOpen" class="lg:hidden mr-3 text-white/70 hover:text-white transition-colors">
                <i class="fas fa-bars text-lg"></i>
            </button>
            <div class="flex-1">
                <h1 class="text-white font-semibold text-base">@yield('page-title', 'Beranda')</h1>
                <nav class="text-xs text-emerald-300 flex items-center gap-1"><span>Siswa</span> @yield('breadcrumb')</nav>
            </div>
            <div class="flex items-center gap-3">
                @if(session('tapel_aktif'))
                <span class="hidden sm:inline-flex items-center gap-1 px-3 py-1 rounded-full bg-white/10 text-emerald-200 text-xs font-medium border border-white/20">
                    <i class="fas fa-calendar-alt"></i> {{ session('tapel_aktif') }}
                </span>
                @endif
                <div class="relative" x-data="{ open: false }">
                    <button @click="open = !open" class="flex items-center gap-2 text-sm text-white/80 hover:text-white transition-colors">
                        <div class="w-8 h-8 rounded-full bg-gradient-to-br from-emerald-400 to-teal-600 flex items-center justify-center border border-white/20">
                            <span class="text-white text-xs font-bold">{{ substr(Auth::user()->name ?? 'S', 0, 1) }}</span>
                        </div>
                        <span class="hidden sm:block font-medium">{{ Auth::user()->name ?? 'Siswa' }}</span>
                        <i class="fas fa-chevron-down text-xs text-white/40"></i>
                    </button>
                    <div x-show="open" @click.away="open = false" x-transition
                         class="absolute right-0 mt-2 w-48 bg-emerald-900/90 backdrop-blur-md rounded-xl shadow-lg border border-white/10 py-1 z-50">
                        <a href="{{ route('siswa.profile') }}" class="flex items-center gap-2 px-4 py-2 text-sm text-emerald-100 hover:bg-white/10 hover:text-white">
                            <i class="fas fa-id-card w-4"></i> Profil Saya
                        </a>
                        <hr class="my-1 border-white/10">
                        <form method="POST" action="{{ route('siswa.logout') }}">
                            @csrf
                            <button type="submit" class="w-full flex items-center gap-2 px-4 py-2 text-sm text-red-400 hover:bg-red-500/10 hover:text-red-300">
                                <i class="fas fa-sign-out-alt w-4"></i> Keluar
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </header>

        <main class="flex-1 p-4 sm:p-6">
            @yield('content')
        </main>

        <footer class="py-4 px-6 border-t border-white/10">
            <p class="text-center text-xs text-emerald-400">&copy; {{ date('Y') }} LaraSchool — Portal Siswa</p>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        toastr.options = { closeButton: true, progressBar: true, positionClass: 'toast-top-right', timeOut: 4000 };
        @if(session('success')) toastr.success("{{ session('success') }}"); @endif
        @if(session('error')) toastr.error("{{ session('error') }}"); @endif
    </script>
    @stack('scripts')
</body>
</html>
