<?php $__env->startSection('page-title', 'Dashboard'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="text-indigo-300">Dashboard</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-6">

    
    <?php if($tapelAktif): ?>
    <div class="flex items-center gap-2 text-sm text-indigo-300">
        <i class="fas fa-calendar-alt"></i>
        <span>Tahun Ajaran Aktif: <strong class="text-white"><?php echo e($tapelAktif->nama_tapel); ?></strong> — Semester <strong class="text-white"><?php echo e($tapelAktif->semester); ?></strong></span>
    </div>
    <?php endif; ?>

    
    <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 hover:bg-white/15 transition">
            <div class="flex items-center justify-between mb-3">
                <div class="w-10 h-10 bg-indigo-500/30 rounded-xl flex items-center justify-center">
                    <i class="fas fa-user-graduate text-indigo-300 text-lg"></i>
                </div>
                <span class="text-xs text-green-400 font-medium">Aktif</span>
            </div>
            <div class="text-3xl font-bold text-white mb-1"><?php echo e(number_format($stats['total_siswa'])); ?></div>
            <div class="text-sm text-indigo-300">Total Siswa</div>
        </div>

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 hover:bg-white/15 transition">
            <div class="flex items-center justify-between mb-3">
                <div class="w-10 h-10 bg-purple-500/30 rounded-xl flex items-center justify-center">
                    <i class="fas fa-chalkboard-teacher text-purple-300 text-lg"></i>
                </div>
                <span class="text-xs text-green-400 font-medium">Aktif</span>
            </div>
            <div class="text-3xl font-bold text-white mb-1"><?php echo e(number_format($stats['total_guru'])); ?></div>
            <div class="text-sm text-indigo-300">Total Guru</div>
        </div>

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 hover:bg-white/15 transition">
            <div class="flex items-center justify-between mb-3">
                <div class="w-10 h-10 bg-blue-500/30 rounded-xl flex items-center justify-center">
                    <i class="fas fa-door-open text-blue-300 text-lg"></i>
                </div>
            </div>
            <div class="text-3xl font-bold text-white mb-1"><?php echo e(number_format($stats['total_kelas'])); ?></div>
            <div class="text-sm text-indigo-300">Rombel Aktif</div>
        </div>

        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 hover:bg-white/15 transition">
            <div class="flex items-center justify-between mb-3">
                <div class="w-10 h-10 bg-amber-500/30 rounded-xl flex items-center justify-center">
                    <i class="fas fa-book-open text-amber-300 text-lg"></i>
                </div>
            </div>
            <div class="text-3xl font-bold text-white mb-1"><?php echo e(number_format($stats['total_mapel'] ?? 0)); ?></div>
            <div class="text-sm text-indigo-300">Mata Pelajaran</div>
        </div>
    </div>

    
    <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <?php
            $absensiCards = [
                ['label' => 'Hadir', 'key' => 'hadir', 'icon' => 'fa-check-circle', 'color' => 'green'],
                ['label' => 'Sakit', 'key' => 'sakit', 'icon' => 'fa-procedures', 'color' => 'yellow'],
                ['label' => 'Izin', 'key' => 'izin', 'icon' => 'fa-file-alt', 'color' => 'blue'],
                ['label' => 'Alpha', 'key' => 'alpha', 'icon' => 'fa-times-circle', 'color' => 'red'],
            ];
        ?>
        <?php $__currentLoopData = $absensiCards; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $card): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-<?php echo e($card['color']); ?>-500/20 rounded-xl flex items-center justify-center">
                    <i class="fas <?php echo e($card['icon']); ?> text-<?php echo e($card['color']); ?>-400"></i>
                </div>
                <div>
                    <div class="text-xl font-bold text-white"><?php echo e($absensiHariIni[$card['key']] ?? 0); ?></div>
                    <div class="text-xs text-indigo-300"><?php echo e($card['label']); ?> Hari Ini</div>
                </div>
            </div>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>

    
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

        
        <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-white font-semibold">Sebaran Siswa per Tingkat</h3>
                <span class="text-xs text-indigo-300">Tahun Ajaran Aktif</span>
            </div>
            <canvas id="chartTingkat" height="200"></canvas>
        </div>

        
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-white font-semibold">Jenis Kelamin</h3>
            </div>
            <canvas id="chartGender" height="220"></canvas>
            <div class="flex justify-center gap-6 mt-4 text-sm">
                <div class="flex items-center gap-2">
                    <div class="w-3 h-3 rounded-full bg-blue-400"></div>
                    <span class="text-indigo-200">Laki-laki: <strong class="text-white"><?php echo e($siswaLaki); ?></strong></span>
                </div>
                <div class="flex items-center gap-2">
                    <div class="w-3 h-3 rounded-full bg-pink-400"></div>
                    <span class="text-indigo-200">Perempuan: <strong class="text-white"><?php echo e($siswaPerempuan); ?></strong></span>
                </div>
            </div>
        </div>
    </div>

    
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">

        
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-white font-semibold">Siswa Terbaru</h3>
                <a href="<?php echo e(route('admin.siswa.index')); ?>" class="text-xs text-indigo-300 hover:text-white transition">Lihat Semua →</a>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead>
                        <tr class="text-indigo-300 border-b border-white/10">
                            <th class="text-left pb-2">Nama</th>
                            <th class="text-left pb-2">NIS</th>
                            <th class="text-left pb-2">Tgl Daftar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__empty_1 = true; $__currentLoopData = $siswaBaru; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $s): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <tr class="border-b border-white/5 hover:bg-white/5">
                            <td class="py-2 text-white"><?php echo e($s->nama); ?></td>
                            <td class="py-2 text-indigo-200 font-mono"><?php echo e($s->nis); ?></td>
                            <td class="py-2 text-indigo-300 text-xs"><?php echo e(\Carbon\Carbon::parse($s->tgl_daftar)->format('d/m/Y')); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <tr><td colspan="3" class="py-4 text-center text-indigo-400">Belum ada data</td></tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>

        
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-white font-semibold">Pegawai Terbaru</h3>
                <a href="<?php echo e(route('admin.pegawai.index')); ?>" class="text-xs text-indigo-300 hover:text-white transition">Lihat Semua →</a>
            </div>
            <div class="overflow-x-auto">
                <table class="w-full text-sm">
                    <thead>
                        <tr class="text-indigo-300 border-b border-white/10">
                            <th class="text-left pb-2">Nama</th>
                            <th class="text-left pb-2">NIP</th>
                            <th class="text-left pb-2">Jabatan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__empty_1 = true; $__currentLoopData = $pegawaiBaru; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $p): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                        <tr class="border-b border-white/5 hover:bg-white/5">
                            <td class="py-2 text-white"><?php echo e($p->nama); ?></td>
                            <td class="py-2 text-indigo-200 font-mono text-xs"><?php echo e($p->nip ?? '-'); ?></td>
                            <td class="py-2 text-indigo-300 text-xs"><?php echo e($p->jabatan ?? '-'); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                        <tr><td colspan="3" class="py-4 text-center text-indigo-400">Belum ada data</td></tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-white font-semibold">Daftar Kelas Aktif</h3>
            <a href="<?php echo e(route('admin.kelas.index')); ?>" class="text-xs text-indigo-300 hover:text-white transition">Kelola Kelas →</a>
        </div>
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-3">
            <?php $__empty_1 = true; $__currentLoopData = $kelasList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $kelas): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <a href="<?php echo e(route('admin.kelas.show', $kelas->id_kelas)); ?>" class="bg-white/10 rounded-xl p-3 text-center hover:bg-indigo-600/30 transition group">
                <div class="text-lg font-bold text-white group-hover:text-indigo-200"><?php echo e($kelas->nama_kelas); ?></div>
                <div class="text-xs text-indigo-300 mt-1"><?php echo e($kelas->jumlah_siswa ?? 0); ?> Siswa</div>
                <div class="text-xs text-indigo-400 truncate mt-1"><?php echo e($kelas->nama_walikelas ?? '-'); ?></div>
            </a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <div class="col-span-6 text-center text-indigo-400 py-4">Belum ada kelas aktif</div>
            <?php endif; ?>
        </div>
    </div>

    
    <?php if($rataRataNilai && $rataRataNilai->count()): ?>
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-white font-semibold">Rata-rata Nilai per Mata Pelajaran</h3>
            <a href="<?php echo e(route('admin.nilai.index')); ?>" class="text-xs text-indigo-300 hover:text-white transition">Detail Nilai →</a>
        </div>
        <div class="space-y-3">
            <?php $__currentLoopData = $rataRataNilai->take(8); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $n): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php $pct = min(round($n->rata_rata), 100); ?>
            <div class="flex items-center gap-3">
                <div class="w-32 text-xs text-indigo-200 truncate"><?php echo e($n->nama_mapel); ?></div>
                <div class="flex-1 bg-white/10 rounded-full h-2">
                    <div class="h-2 rounded-full <?php echo e($pct >= 75 ? 'bg-green-400' : ($pct >= 60 ? 'bg-yellow-400' : 'bg-red-400')); ?>"
                         style="width: <?php echo e($pct); ?>%"></div>
                </div>
                <div class="w-10 text-xs text-right text-white font-medium"><?php echo e(number_format($n->rata_rata, 1)); ?></div>
            </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
    <?php endif; ?>

</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
<script>
const chartDefaults = {
    color: 'rgba(199,210,254,0.8)',
    font: { family: 'Inter, sans-serif', size: 11 }
};
Chart.defaults.color = chartDefaults.color;
Chart.defaults.font = chartDefaults.font;

// Tingkat bar chart
new Chart(document.getElementById('chartTingkat'), {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($siswaPerTingkat->pluck('nama_tingkat')->toArray()); ?>,
        datasets: [{
            label: 'Jumlah Siswa',
            data: <?php echo json_encode($siswaPerTingkat->pluck('total')->toArray()); ?>,
            backgroundColor: 'rgba(99,102,241,0.6)',
            borderColor: 'rgba(129,140,248,1)',
            borderWidth: 2,
            borderRadius: 8,
        }]
    },
    options: {
        responsive: true,
        plugins: { legend: { display: false } },
        scales: {
            x: { grid: { color: 'rgba(255,255,255,0.05)' } },
            y: { grid: { color: 'rgba(255,255,255,0.05)' }, beginAtZero: true }
        }
    }
});

// Gender doughnut
new Chart(document.getElementById('chartGender'), {
    type: 'doughnut',
    data: {
        labels: ['Laki-laki', 'Perempuan'],
        datasets: [{
            data: [<?php echo e($siswaLaki); ?>, <?php echo e($siswaPerempuan); ?>],
            backgroundColor: ['rgba(96,165,250,0.8)', 'rgba(244,114,182,0.8)'],
            borderColor: ['rgba(59,130,246,1)', 'rgba(236,72,153,1)'],
            borderWidth: 2,
        }]
    },
    options: {
        responsive: true,
        cutout: '65%',
        plugins: { legend: { display: false } }
    }
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/dashboard.blade.php ENDPATH**/ ?>