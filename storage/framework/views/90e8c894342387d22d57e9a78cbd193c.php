<?php $__env->startSection('page-title', 'Absensi Siswa'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Absensi</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-5">
    
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <?php $__currentLoopData = ['hadir'=>['Hadir','green','check-circle'], 'sakit'=>['Sakit','yellow','procedures'], 'izin'=>['Izin','blue','file-alt'], 'alpha'=>['Alpha','red','times-circle']]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$info): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-4 border border-white/20 text-center">
            <div class="w-10 h-10 bg-<?php echo e($info[1]); ?>-500/20 rounded-xl flex items-center justify-center mx-auto mb-2">
                <i class="fas fa-<?php echo e($info[2]); ?> text-<?php echo e($info[1]); ?>-400"></i>
            </div>
            <div class="text-2xl font-bold text-white"><?php echo e($rekap[$key] ?? 0); ?></div>
            <div class="text-xs text-indigo-300 mt-1"><?php echo e($info[0]); ?> Hari Ini</div>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>

    
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap">
            <input type="date" name="tgl" value="<?php echo e(request('tgl', date('Y-m-d'))); ?>"
                class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Kelas</option>
                <?php $__currentLoopData = $kelasList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($k->id_kelas); ?>" <?php echo e(request('id_kelas')==$k->id_kelas?'selected':''); ?>><?php echo e($k->nama_kelas); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-filter mr-1"></i>Filter
            </button>
        </form>
        <a href="<?php echo e(route('admin.absensi.laporan')); ?>" class="bg-emerald-600/80 hover:bg-emerald-600 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-chart-bar mr-1"></i>Laporan
        </a>
    </div>

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3">Kelas</th>
                        <th class="px-4 py-3">Tanggal</th>
                        <th class="px-4 py-3 text-center">Keterangan</th>
                        <th class="px-4 py-3">Ket. Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $absensiList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-indigo-300"><?php echo e($absensiList->firstItem() + $i); ?></td>
                        <td class="px-4 py-2.5">
                            <div class="text-white"><?php echo e($a->nama_siswa); ?></div>
                            <div class="text-indigo-400 text-xs font-mono"><?php echo e($a->nis); ?></div>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-200"><?php echo e($a->nama_kelas ?? '-'); ?></td>
                        <td class="px-4 py-2.5 text-indigo-200 text-xs"><?php echo e(\Carbon\Carbon::parse($a->tgl_absensi)->format('d/m/Y')); ?></td>
                        <td class="px-4 py-2.5 text-center">
                            <?php
                                $colors = ['hadir'=>'green', 'sakit'=>'yellow', 'izin'=>'blue', 'alpha'=>'red'];
                                $color = $colors[strtolower($a->keterangan)] ?? 'gray';
                            ?>
                            <span class="px-2 py-0.5 rounded-lg text-xs bg-<?php echo e($color); ?>-500/20 text-<?php echo e($color); ?>-300 capitalize">
                                <?php echo e($a->keterangan); ?>

                            </span>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-300 text-xs"><?php echo e($a->keterangan_detail ?? '-'); ?></td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr><td colspan="6" class="px-4 py-8 text-center text-indigo-400">Tidak ada data absensi</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <?php if($absensiList->hasPages()): ?>
        <div class="px-4 py-3 border-t border-white/10">
            <?php echo e($absensiList->appends(request()->query())->links()); ?>

        </div>
        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/absensi/index.blade.php ENDPATH**/ ?>