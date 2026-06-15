<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="h-full">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Guru') — {{ config('app.name', 'LaraSchool') }}</title>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body { font-family: 'Inter', sans-serif; }
        .sidebar-link.active { background: rgba(255,255,255,0.15); border-left: 3px solid #67e8f9; }
        .sidebar-link:hover { background: rgba(255,255,255,0.10); }
        table.dataTable thead th { background: #0c4a6e; color: #e0f2fe; border: none; }
        table.dataTable tbody tr:hover td { background: rgba(8,145,178,0.1); }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: #0891b2 !important; color: #fff !important; border: none !important; border-radius: 4px;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: #0ea5e9 !important; color: #fff !important; border: none !important;
        }
        .dataTables_wrapper .dataTables_length select,
        .dataTables_wrapper .dataTables_filter input {
            background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2);
            color: #e0f2fe; border-radius: 6px; padding: 2px 6px;
        }
        .dataTables_wrapper { color: #e0f2fe; }
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-track { background: rgba(255,255,255,0.05); }
        ::-webkit-scrollbar-thumb { background: #0891b2; border-radius: 99px; }
    </style>
    @stack('styles')
</head>
<body class="h-full bg-gradient-to-br from-sky-950 via-cyan-950 to-sky-900 min-h-screen" x-data="{ sidebarOpen: true, mobileOpen: false }">

    <div x-show="mobileOpen" @click="mobileOpen = false" class="fixed inset-0 z-20 bg-black/50 lg:hidden" x-transition></div>

    <!-- Sidebar - Blue/Cyan -->
    <aside :class="sidebarOpen ? 'w-64' : 'w-16'"
           class="fixed inset-y-0 left-0 z-30 flex flex-col transition-all duration-300 bg-gradient-to-b from-sky-950 via-cyan-900 to-sky-900 shadow-2xl">

        <div class="flex items-center h-16 px-4 border-b border-white/10">
            <div class="flex items-center gap-3 overflow-hidden">
                <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-cyan-400 to-sky-600 flex items-center justify-center flex-shrink-0">
                    <i class="fas fa-chalkboard-teacher text-white text-sm"></i>
                </div>
                <div x-show="sidebarOpen" class="overflow-hidden whitespace-nowrap" x-transition>
                    <p class="text-white font-bold text-base leading-none">LaraSchool</p>
                    <p class="text-cyan-300 text-xs">Panel Guru</p>
                </div>
            </div>
            <button @click="sidebarOpen = !sidebarOpen" class="ml-auto text-white/60 hover:text-white hidden lg:block transition-colors p-1">
                <i :class="sidebarOpen ? 'fa-chevron-left' : 'fa-chevron-right'" class="fas text-xs"></i>
            </button>
        </div>

        <nav class="flex-1 overflow-y-auto py-4 space-y-1 px-2">
            <a href="{{ route('guru.dashboard') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.dashboard') ? 'active' : '' }}">
                <i class="fas fa-tachometer-alt w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Dashboard</span>
            </a>

            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-cyan-400 text-[10px] font-semibold uppercase tracking-widest">Akademik</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('guru.jadwal.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.jadwal.*') ? 'active' : '' }}">
                <i class="fas fa-calendar-alt w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Jadwal Mengajar</span>
            </a>
            <a href="{{ route('guru.nilai.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.nilai.*') ? 'active' : '' }}">
                <i class="fas fa-edit w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Input Nilai</span>
            </a>
            <a href="{{ route('guru.absensi.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.absensi.*') ? 'active' : '' }}">
                <i class="fas fa-clipboard-check w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Absensi Kelas</span>
            </a>

            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-cyan-400 text-[10px] font-semibold uppercase tracking-widest">Wali Kelas</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('guru.rapor.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.rapor.*') ? 'active' : '' }}">
                <i class="fas fa-file-alt w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Cetak Rapor</span>
            </a>
            <a href="{{ route('guru.monitoring.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.monitoring.*') ? 'active' : '' }}">
                <i class="fas fa-chart-line w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Monitoring Siswa</span>
            </a>

            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-cyan-400 text-[10px] font-semibold uppercase tracking-widest">Profil</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('guru.profile') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-cyan-100 text-sm transition-all {{ request()->routeIs('guru.profile') ? 'active' : '' }}">
                <i class="fas fa-user-circle w-5 text-center text-cyan-300"></i>
                <span x-show="sidebarOpen" x-transition>Profil Saya</span>
            </a>
        </nav>

        <div class="border-t border-white/10 p-3">
            <div class="flex items-center gap-3">
                <div class="w-8 h-8 rounded-full bg-gradient-to-br from-cyan-400 to-sky-600 flex items-center justify-center flex-shrink-0">
                    <span class="text-white text-xs font-bold">{{ substr(Auth::user()->name ?? 'G', 0, 1) }}</span>
                </div>
                <div x-show="sidebarOpen" class="overflow-hidden flex-1" x-transition>
                    <p class="text-white text-sm font-medium truncate">{{ Auth::user()->name ?? 'Guru' }}</p>
                    <p class="text-cyan-300 text-xs truncate">{{ Auth::user()->email ?? '' }}</p>
                </div>
                <div x-show="sidebarOpen" x-transition>
                    <form method="POST" action="{{ route('guru.logout') }}">
                        @csrf
                        <button type="submit" class="text-cyan-300 hover:text-red-400 transition-colors" title="Logout">
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
                <h1 class="text-white font-semibold text-base">@yield('page-title', 'Dashboard')</h1>
                <nav class="text-xs text-cyan-300 flex items-center gap-1">
                    <span>Guru</span> @yield('breadcrumb')
                </nav>
            </div>
            <div class="flex items-center gap-3">
                @if(session('tapel_aktif'))
                <span class="hidden sm:inline-flex items-center gap-1 px-3 py-1 rounded-full bg-white/10 text-cyan-200 text-xs font-medium border border-white/20">
                    <i class="fas fa-calendar-alt"></i> {{ session('tapel_aktif') }}
                </span>
                @endif
                <div class="relative" x-data="{ open: false }">
                    <button @click="open = !open" class="flex items-center gap-2 text-sm text-white/80 hover:text-white transition-colors">
                        <div class="w-8 h-8 rounded-full bg-gradient-to-br from-cyan-400 to-sky-600 flex items-center justify-center border border-white/20">
                            <span class="text-white text-xs font-bold">{{ substr(Auth::user()->name ?? 'G', 0, 1) }}</span>
                        </div>
                        <span class="hidden sm:block font-medium">{{ Auth::user()->name ?? 'Guru' }}</span>
                        <i class="fas fa-chevron-down text-xs text-white/40"></i>
                    </button>
                    <div x-show="open" @click.away="open = false" x-transition
                         class="absolute right-0 mt-2 w-48 bg-sky-900/90 backdrop-blur-md rounded-xl shadow-lg border border-white/10 py-1 z-50">
                        <a href="{{ route('guru.profile') }}" class="flex items-center gap-2 px-4 py-2 text-sm text-cyan-100 hover:bg-white/10 hover:text-white">
                            <i class="fas fa-user-circle w-4"></i> Profil Saya
                        </a>
                        <hr class="my-1 border-white/10">
                        <form method="POST" action="{{ route('guru.logout') }}">
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
            <p class="text-center text-xs text-cyan-400">
                &copy; {{ date('Y') }} LaraSchool — Panel Guru
            </p>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script>
        toastr.options = { closeButton: true, progressBar: true, positionClass: 'toast-top-right', timeOut: 4000 };
        @if(session('success')) toastr.success("{{ session('success') }}"); @endif
        @if(session('error')) toastr.error("{{ session('error') }}"); @endif
        @if(session('warning')) toastr.warning("{{ session('warning') }}"); @endif

        function confirmDelete(formId, itemName) {
            Swal.fire({
                title: 'Hapus Data?',
                html: `Yakin hapus <strong>${itemName}</strong>?`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#0891b2',
                cancelButtonColor: '#6b7280',
                confirmButtonText: 'Ya, Hapus!',
                cancelButtonText: 'Batal',
            }).then((result) => {
                if (result.isConfirmed) document.getElementById(formId).submit();
            });
        }
    </script>
    @stack('scripts')
</body>
</html>
