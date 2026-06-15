<?php $__env->startSection('page-title', 'Data Nilai'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Nilai</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-4">
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap">
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Kelas</option>
                <?php $__currentLoopData = $kelasList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($k->id_kelas); ?>" <?php echo e(request('id_kelas')==$k->id_kelas?'selected':''); ?>><?php echo e($k->nama_kelas); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <select name="id_mapel" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Mapel</option>
                <?php $__currentLoopData = $mapelList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($m->id_mapel); ?>" <?php echo e(request('id_mapel')==$m->id_mapel?'selected':''); ?>><?php echo e($m->nama_mapel); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <select name="semester" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="1" <?php echo e(request('semester',1)==1?'selected':''); ?>>Semester 1</option>
                <option value="2" <?php echo e(request('semester')==2?'selected':''); ?>>Semester 2</option>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-filter mr-1"></i>Filter
            </button>
        </form>
        <a href="<?php echo e(route('admin.nilai.input')); ?>" class="bg-emerald-600/80 hover:bg-emerald-600 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-keyboard mr-1"></i>Input Nilai
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Siswa</th>
                        <th class="px-4 py-3">Kelas</th>
                        <th class="px-4 py-3">Mata Pelajaran</th>
                        <th class="px-4 py-3">Jenis</th>
                        <th class="px-4 py-3 text-center">Nilai</th>
                        <th class="px-4 py-3">Tgl Penilaian</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $nilaiList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $n): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-3 text-indigo-300"><?php echo e($nilaiList->firstItem() + $i); ?></td>
                        <td class="px-4 py-3">
                            <div class="text-white"><?php echo e($n->nama); ?></div>
                            <div class="text-indigo-400 text-xs font-mono"><?php echo e($n->nis); ?></div>
                        </td>
                        <td class="px-4 py-3 text-indigo-200"><?php echo e($n->nama_kelas); ?></td>
                        <td class="px-4 py-3 text-indigo-200"><?php echo e($n->nama_mapel); ?></td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded text-xs <?php echo e($n->jenis_ujian=='harian' ? 'bg-blue-500/20 text-blue-300' : ($n->jenis_ujian=='mid' ? 'bg-amber-500/20 text-amber-300' : 'bg-purple-500/20 text-purple-300')); ?>">
                                <?php echo e(ucfirst($n->jenis_ujian)); ?>

                            </span>
                        </td>
                        <td class="px-4 py-3 text-center font-bold <?php echo e($n->nilai >= 75 ? 'text-green-300' : 'text-red-300'); ?>">
                            <?php echo e($n->nilai); ?>

                        </td>
                        <td class="px-4 py-3 text-indigo-300 text-xs"><?php echo e(\Carbon\Carbon::parse($n->tgl_penilaian)->format('d/m/Y')); ?></td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr><td colspan="7" class="px-4 py-8 text-center text-indigo-400">Belum ada data nilai</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <?php if($nilaiList->hasPages()): ?>
        <div class="px-4 py-3 border-t border-white/10 text-sm text-indigo-300">
            <?php echo e($nilaiList->appends(request()->query())->links()); ?>

        </div>
        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/nilai/index.blade.php ENDPATH**/ ?>