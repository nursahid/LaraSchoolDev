<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="h-full">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Admin') — {{ config('app.name', 'LaraSchool') }}</title>

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.min.css" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <style>
        body { font-family: 'Inter', sans-serif; }
        .sidebar-link.active { background: rgba(255,255,255,0.15); border-left: 3px solid #a78bfa; }
        .sidebar-link:hover { background: rgba(255,255,255,0.10); }
        table.dataTable thead th { background: #1e1b4b; color: #e0e7ff; border: none; }
        table.dataTable tbody tr:hover td { background: rgba(109,40,217,0.1); }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: #6d28d9 !important; color: #fff !important; border: none !important; border-radius: 4px;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: #7c3aed !important; color: #fff !important; border: none !important;
        }
        .dataTables_wrapper .dataTables_length select,
        .dataTables_wrapper .dataTables_filter input {
            background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2);
            color: #e0e7ff; border-radius: 6px; padding: 2px 6px;
        }
        .dataTables_wrapper { color: #e0e7ff; }
        #toast-container > div { border-radius: 8px; }
        ::-webkit-scrollbar { width: 5px; height: 5px; }
        ::-webkit-scrollbar-track { background: rgba(255,255,255,0.05); }
        ::-webkit-scrollbar-thumb { background: #6d28d9; border-radius: 99px; }
    </style>
    @stack('styles')
</head>
<body class="h-full bg-gradient-to-br from-indigo-950 via-purple-950 to-indigo-900 min-h-screen"
      x-data="{ sidebarOpen: true, mobileOpen: false }">

    <!-- Mobile Overlay -->
    <div x-show="mobileOpen" @click="mobileOpen = false"
         class="fixed inset-0 z-20 bg-black/50 lg:hidden" x-transition></div>

    <!-- Sidebar -->
    <aside :class="sidebarOpen ? 'w-64' : 'w-16'"
           class="fixed inset-y-0 left-0 z-30 flex flex-col transition-all duration-300 bg-gradient-to-b from-indigo-950 via-purple-900 to-indigo-900 shadow-2xl border-r border-white/10"
           :style="window.innerWidth < 1024 && !mobileOpen ? 'transform: translateX(-100%)' : ''">

        <!-- Logo / Brand -->
        <div class="flex items-center h-16 px-4 border-b border-white/10 flex-shrink-0">
            <div class="flex items-center gap-3 overflow-hidden">
                <div class="w-9 h-9 rounded-xl bg-gradient-to-br from-violet-400 to-purple-600 flex items-center justify-center flex-shrink-0">
                    <i class="fas fa-graduation-cap text-white text-sm"></i>
                </div>
                <div x-show="sidebarOpen" class="overflow-hidden whitespace-nowrap" x-transition>
                    <p class="text-white font-bold text-base leading-none">LaraSchool</p>
                    <p class="text-purple-300 text-xs">Admin Panel</p>
                </div>
            </div>
            <button @click="sidebarOpen = !sidebarOpen"
                    class="ml-auto text-white/60 hover:text-white hidden lg:block transition-colors p-1">
                <i :class="sidebarOpen ? 'fa-chevron-left' : 'fa-chevron-right'" class="fas text-xs"></i>
            </button>
        </div>

        <!-- Navigation -->
        <nav class="flex-1 overflow-y-auto py-4 space-y-0.5 px-2">

            <a href="{{ route('admin.dashboard') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                <i class="fas fa-tachometer-alt w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Dashboard</span>
            </a>

            <!-- Sistem -->
            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-purple-400 text-[10px] font-semibold uppercase tracking-widest">Sistem</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('admin.users.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.users.*') ? 'active' : '' }}">
                <i class="fas fa-users-cog w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Manajemen User</span>
            </a>
            <a href="{{ route('admin.config.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.config.*') ? 'active' : '' }}">
                <i class="fas fa-cogs w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Konfigurasi</span>
            </a>
            <a href="{{ route('admin.aktivitas.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.aktivitas.*') ? 'active' : '' }}">
                <i class="fas fa-history w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Log Aktivitas</span>
            </a>
            @if(auth()->user()->hasRole('super_admin'))
            <a href="{{ route('admin.menu-manager.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.menu-manager.*') ? 'active' : '' }}">
                <i class="fas fa-bars-staggered w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Menu Manager</span>
            </a>
            @endif

            <!-- Data Master -->
            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-purple-400 text-[10px] font-semibold uppercase tracking-widest">Data Master</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('admin.pegawai.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.pegawai.*') ? 'active' : '' }}">
                <i class="fas fa-chalkboard-teacher w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Data Pegawai</span>
            </a>
            <a href="{{ route('admin.pegawai-mapel.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.pegawai-mapel.*') ? 'active' : '' }}">
                <i class="fas fa-user-tag w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Guru Mapel</span>
            </a>
            <a href="{{ route('admin.siswa.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.siswa.*') ? 'active' : '' }}">
                <i class="fas fa-user-graduate w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Data Siswa</span>
            </a>
            <a href="{{ route('admin.kelas.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.kelas.*') ? 'active' : '' }}">
                <i class="fas fa-door-open w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Data Kelas</span>
            </a>
            <a href="{{ route('admin.mapel.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.mapel.*') ? 'active' : '' }}">
                <i class="fas fa-book w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Mata Pelajaran</span>
            </a>
            <a href="{{ route('admin.mapel-tingkat.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.mapel-tingkat.*') ? 'active' : '' }}">
                <i class="fas fa-sitemap w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Mapel per Tingkat</span>
            </a>
            <a href="{{ route('admin.tahunajaran.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.tahunajaran.*') ? 'active' : '' }}">
                <i class="fas fa-calendar-alt w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Tahun Ajaran</span>
            </a>

            <!-- Akademik -->
            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-purple-400 text-[10px] font-semibold uppercase tracking-widest">Akademik</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('admin.jadwal.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.jadwal.*') ? 'active' : '' }}">
                <i class="fas fa-calendar-week w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Jadwal Pelajaran</span>
            </a>
            <a href="{{ route('admin.absensi.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.absensi.index') ? 'active' : '' }}">
                <i class="fas fa-clipboard-check w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Absensi</span>
            </a>
            <a href="{{ route('admin.nilai.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.nilai.*') ? 'active' : '' }}">
                <i class="fas fa-star-half-alt w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Nilai</span>
            </a>
            <a href="{{ route('admin.prestasi.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.prestasi.*') ? 'active' : '' }}">
                <i class="fas fa-trophy w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Prestasi</span>
            </a>

            <!-- Laporan -->
            <div x-show="sidebarOpen" class="pt-3 pb-1 px-3" x-transition>
                <p class="text-purple-400 text-[10px] font-semibold uppercase tracking-widest">Laporan</p>
            </div>
            <div x-show="!sidebarOpen" class="border-t border-white/10 my-2"></div>

            <a href="{{ route('admin.absensi.laporan') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.absensi.laporan') ? 'active' : '' }}">
                <i class="fas fa-chart-bar w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Laporan Absensi</span>
            </a>
            <a href="{{ route('admin.nilai.index') }}"
               class="sidebar-link flex items-center gap-3 px-3 py-2.5 rounded-lg text-purple-100 text-sm transition-all {{ request()->routeIs('admin.nilai.index') ? 'active' : '' }}">
                <i class="fas fa-file-alt w-5 text-center text-purple-300"></i>
                <span x-show="sidebarOpen" class="whitespace-nowrap" x-transition>Rekap Nilai</span>
            </a>

            <!-- Ganti menggunakan data dari tabel menus dan menu_groups -->

        </nav>

        <!-- User Profile Bottom -->
        <div class="border-t border-white/10 p-3 flex-shrink-0">
            <div class="flex items-center gap-3">
                <div class="w-8 h-8 rounded-full bg-gradient-to-br from-violet-400 to-purple-600 flex items-center justify-center flex-shrink-0">
                    <span class="text-white text-xs font-bold">{{ substr(Auth::user()->name ?? 'A', 0, 1) }}</span>
                </div>
                <div x-show="sidebarOpen" class="overflow-hidden flex-1" x-transition>
                    <p class="text-white text-sm font-medium truncate">{{ Auth::user()->name ?? 'Admin' }}</p>
                    <p class="text-purple-300 text-xs truncate">{{ Auth::user()->email ?? '' }}</p>
                </div>
                <div x-show="sidebarOpen" x-transition>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="text-purple-300 hover:text-red-400 transition-colors" title="Logout">
                            <i class="fas fa-sign-out-alt"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Content -->
    <div :class="sidebarOpen ? 'lg:pl-64' : 'lg:pl-16'" class="flex flex-col min-h-screen transition-all duration-300">

        <!-- Top Header -->
        <header class="sticky top-0 z-10 flex items-center h-16 bg-white/10 backdrop-blur-md border-b border-white/10 px-4">
            <button @click="mobileOpen = !mobileOpen" class="lg:hidden mr-3 text-white/70 hover:text-white transition-colors">
                <i class="fas fa-bars text-lg"></i>
            </button>

            <div class="flex-1">
                <h1 class="text-white font-semibold text-base">@yield('page-title', 'Dashboard')</h1>
                <nav class="text-xs text-purple-300 flex items-center gap-1">
                    <span>Admin</span>
                    @yield('breadcrumb')
                </nav>
            </div>

            <div class="flex items-center gap-3">
                @if(session('tapel_aktif'))
                <span class="hidden sm:inline-flex items-center gap-1 px-3 py-1 rounded-full bg-white/10 text-purple-200 text-xs font-medium border border-white/20">
                    <i class="fas fa-calendar-alt"></i> {{ session('tapel_aktif') }}
                </span>
                @endif

                <button class="relative text-white/60 hover:text-white transition-colors p-2 rounded-lg hover:bg-white/10">
                    <i class="fas fa-bell text-lg"></i>
                    <span class="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full"></span>
                </button>

                <div class="relative" x-data="{ open: false }">
                    <button @click="open = !open" class="flex items-center gap-2 text-sm text-white/80 hover:text-white transition-colors">
                        <div class="w-8 h-8 rounded-full bg-gradient-to-br from-violet-500 to-purple-600 flex items-center justify-center border border-white/20">
                            <span class="text-white text-xs font-bold">{{ substr(Auth::user()->name ?? 'A', 0, 1) }}</span>
                        </div>
                        <span class="hidden sm:block font-medium">{{ Auth::user()->name ?? 'Admin' }}</span>
                        <i class="fas fa-chevron-down text-xs text-white/40"></i>
                    </button>

                    <div x-show="open" @click.away="open = false"
                         x-transition:enter="transition ease-out duration-100"
                         x-transition:enter-start="opacity-0 scale-95"
                         x-transition:enter-end="opacity-100 scale-100"
                         class="absolute right-0 mt-2 w-48 bg-indigo-900/90 backdrop-blur-md rounded-xl shadow-lg border border-white/10 py-1 z-50">
                        <a href="{{ route('admin.profile') }}" class="flex items-center gap-2 px-4 py-2 text-sm text-purple-100 hover:bg-white/10 hover:text-white">
                            <i class="fas fa-user-circle w-4"></i> Profil Saya
                        </a>
                        <a href="{{ route('admin.config.index') }}" class="flex items-center gap-2 px-4 py-2 text-sm text-purple-100 hover:bg-white/10 hover:text-white">
                            <i class="fas fa-cog w-4"></i> Pengaturan
                        </a>
                        <hr class="my-1 border-white/10">
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit" class="w-full flex items-center gap-2 px-4 py-2 text-sm text-red-400 hover:bg-red-500/10 hover:text-red-300">
                                <i class="fas fa-sign-out-alt w-4"></i> Keluar
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <main class="flex-1 p-4 sm:p-6">
            @yield('content')
        </main>

        <!-- Footer -->
        <footer class="py-4 px-6 border-t border-white/10">
            <p class="text-center text-xs text-purple-400">
                &copy; {{ date('Y') }} LaraSchool — SMPN 3 Mepanga. Semua Hak Dilindungi.
            </p>
        </footer>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script src="https://unpkg.com/dropzone@6/dist/dropzone-min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/dropzone@6/dist/dropzone.min.css" type="text/css" />

    <script>
        toastr.options = {
            closeButton: true,
            progressBar: true,
            positionClass: 'toast-top-right',
            timeOut: 4000,
            extendedTimeOut: 1000,
        };

        @if(session('success'))
            toastr.success("{{ session('success') }}");
        @endif
        @if(session('error'))
            toastr.error("{{ session('error') }}");
        @endif
        @if(session('warning'))
            toastr.warning("{{ session('warning') }}");
        @endif
        @if(session('info'))
            toastr.info("{{ session('info') }}");
        @endif

        function confirmDelete(formId, itemName) {
            Swal.fire({
                title: 'Hapus Data?',
                html: `Anda yakin ingin menghapus <strong>${itemName}</strong>?<br>Data yang dihapus tidak dapat dikembalikan!`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#7c3aed',
                cancelButtonColor: '#6b7280',
                confirmButtonText: '<i class="fas fa-trash"></i> Ya, Hapus!',
                cancelButtonText: 'Batal',
                reverseButtons: true,
                background: '#1e1b4b',
                color: '#e0e7ff',
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById(formId).submit();
                }
            });
        }

        function initDataTable(selector, options = {}) {
            const defaults = {
                responsive: true,
                language: { url: 'https://cdn.datatables.net/plug-ins/1.13.8/i18n/id.json' },
                pageLength: 25,
                dom: '<"flex flex-wrap items-center justify-between gap-2 mb-3"<"flex items-center gap-2"l><"flex-1"f>>rtip',
            };
            return $(selector).DataTable({ ...defaults, ...options });
        }
    </script>

    @stack('scripts')
</body>
</html>
