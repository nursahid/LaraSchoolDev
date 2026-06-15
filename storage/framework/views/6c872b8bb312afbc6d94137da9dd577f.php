<?php $__env->startSection('page-title', 'Data Kelas'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Kelas</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-4">
    <div class="flex justify-between items-center">
        <p class="text-indigo-300 text-sm">Tahun Ajaran Aktif: <strong class="text-white"><?php echo e($tapelAktif->nama_tapel ?? '-'); ?></strong></p>
        <a href="<?php echo e(route('admin.kelas.create')); ?>" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah Kelas
        </a>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <?php $__empty_1 = true; $__currentLoopData = $kelasList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $kelas): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 hover:bg-white/15 transition">
            <div class="flex items-start justify-between mb-3">
                <div>
                    <h3 class="text-white font-bold text-lg"><?php echo e($kelas->nama_kelas); ?></h3>
                    <p class="text-indigo-300 text-xs mt-0.5"><?php echo e($kelas->nama_tingkat ?? ''); ?></p>
                </div>
                <span class="bg-indigo-600/30 text-indigo-200 rounded-xl px-2 py-1 text-xs font-bold">
                    <?php echo e($kelas->jumlah_siswa ?? 0); ?> Siswa
                </span>
            </div>
            <div class="text-sm text-indigo-300 mb-4">
                <div class="flex items-center gap-2 mb-1">
                    <i class="fas fa-user-tie w-4 text-center"></i>
                    <?php if($kelas->nama_walikelas): ?>
                        <span class="text-indigo-100"><?php echo e($kelas->nama_walikelas); ?></span>
                    <?php else: ?>
                        <span class="opacity-50 italic text-xs">Belum ada wali kelas</span>
                    <?php endif; ?>
                </div>
                <div class="flex items-center gap-2">
                    <i class="fas fa-calendar w-4 text-center"></i>
                    <span><?php echo e($kelas->nama_tapel ?: '-'); ?></span>
                </div>
            </div>
            <div class="flex gap-2 pt-3 border-t border-white/10">
                <a href="<?php echo e(route('admin.kelas.show', $kelas->id_kelas)); ?>"
                    class="flex-1 text-center text-xs bg-blue-500/20 hover:bg-blue-500/40 text-blue-300 rounded-lg py-1.5 transition">
                    <i class="fas fa-eye mr-1"></i>Detail
                </a>
                <a href="<?php echo e(route('admin.kelas.edit', $kelas->id_kelas)); ?>"
                    class="flex-1 text-center text-xs bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 rounded-lg py-1.5 transition">
                    <i class="fas fa-edit mr-1"></i>Edit
                </a>
                <form id="del-k<?php echo e($kelas->id_kelas); ?>" action="<?php echo e(route('admin.kelas.destroy', $kelas->id_kelas)); ?>" method="POST">
                    <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                    <button type="button" onclick="confirmDelete('del-k<?php echo e($kelas->id_kelas); ?>', '<?php echo e(addslashes($kelas->nama_kelas)); ?>')"
                        class="text-xs bg-red-500/20 hover:bg-red-500/40 text-red-300 rounded-lg px-3 py-1.5 transition">
                        <i class="fas fa-trash"></i>
                    </button>
                </form>
            </div>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <div class="col-span-3 text-center py-12 text-indigo-400">
            <i class="fas fa-door-open text-4xl mb-3 block opacity-30"></i>
            Belum ada kelas. <a href="<?php echo e(route('admin.kelas.create')); ?>" class="text-indigo-300 underline">Tambah sekarang</a>
        </div>
        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/kelas/index.blade.php ENDPATH**/ ?>