<?php $__env->startSection('page-title', 'Mata Pelajaran'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Mata Pelajaran</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <p class="text-indigo-300 text-sm">Total: <strong class="text-white"><?php echo e($mapelList->total()); ?></strong> mata pelajaran</p>
        <a href="<?php echo e(route('admin.mapel.create')); ?>" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah Mapel
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <table class="w-full text-sm">
            <thead class="bg-indigo-900/50">
                <tr class="text-indigo-200 text-left">
                    <th class="px-4 py-3 w-10">#</th>
                    <th class="px-4 py-3">Kode</th>
                    <th class="px-4 py-3">Nama Mata Pelajaran</th>
                    <th class="px-4 py-3">KKM</th>
                    <th class="px-4 py-3">Jml Guru</th>
                    <th class="px-4 py-3 text-center">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php $__empty_1 = true; $__currentLoopData = $mapelList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <tr class="border-t border-white/5 hover:bg-white/5">
                    <td class="px-4 py-3 text-indigo-300"><?php echo e($mapelList->firstItem() + $i); ?></td>
                    <td class="px-4 py-3 text-indigo-200 font-mono text-xs"><?php echo e($m->kode ?? '-'); ?></td>
                    <td class="px-4 py-3 text-white"><?php echo e($m->nama_mapel); ?></td>
                    <td class="px-4 py-3 text-indigo-200"><?php echo e($m->kkm ?? '-'); ?></td>
                    <td class="px-4 py-3 text-indigo-200"><?php echo e($m->jml_guru ?? 0); ?></td>
                    <td class="px-4 py-3">
                        <div class="flex items-center justify-center gap-1">
                            <a href="<?php echo e(route('admin.mapel.edit', $m->id_mapel)); ?>" class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition">
                                <i class="fas fa-edit text-xs"></i>
                            </a>
                            <form id="del-m<?php echo e($m->id_mapel); ?>" action="<?php echo e(route('admin.mapel.destroy', $m->id_mapel)); ?>" method="POST">
                                <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                <button type="button" onclick="confirmDelete('del-m<?php echo e($m->id_mapel); ?>', '<?php echo e(addslashes($m->nama_mapel)); ?>')"
                                    class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition">
                                    <i class="fas fa-trash text-xs"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <tr><td colspan="6" class="px-4 py-8 text-center text-indigo-400">Belum ada data</td></tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/mapel/index.blade.php ENDPATH**/ ?>