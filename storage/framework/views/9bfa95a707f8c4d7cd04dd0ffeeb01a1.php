<?php $__env->startSection('page-title', 'Edit Kelas'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.kelas.index')); ?>" class="text-indigo-300 hover:text-white">Kelas</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Edit: <?php echo e($kela->nama_kelas); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="max-w-xl">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <form action="<?php echo e(route('admin.kelas.update', $kela->id_kelas)); ?>" method="POST">
            <?php echo csrf_field(); ?> <?php echo method_field('PUT'); ?>
            <div class="space-y-4">
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Nama Kelas <span class="text-red-400">*</span></label>
                    <input type="text" name="nama_kelas" value="<?php echo e(old('nama_kelas', $kela->nama_kelas)); ?>" required
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Tingkat</label>
                    <select name="id_tingkat" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <?php $__currentLoopData = $tingkatList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $t): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($t->id_tingkat); ?>" <?php echo e($kela->id_tingkat == $t->id_tingkat ? 'selected' : ''); ?>><?php echo e($t->nama_tingkat); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Wali Kelas</label>
                    <select name="id_walikelas" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Tidak Ada --</option>
                        <?php $__currentLoopData = $guruList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $g): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($g->id_pegawai); ?>" <?php echo e(($kela->id_walikelas ?? '') == $g->id_pegawai ? 'selected' : ''); ?>><?php echo e($g->nama); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Kapasitas Siswa</label>
                    <input type="number" name="kapasitas" value="<?php echo e(old('kapasitas', $kela->kapasitas ?? 36)); ?>" min="1" max="50"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="flex gap-3 pt-2">
                    <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-2"></i>Update
                    </button>
                    <a href="<?php echo e(route('admin.kelas.show', $kela->id_kelas)); ?>" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
                </div>
            </div>
        </form>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/kelas/edit.blade.php ENDPATH**/ ?>