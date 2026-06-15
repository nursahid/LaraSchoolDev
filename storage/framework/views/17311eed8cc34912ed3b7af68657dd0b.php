<?php $__env->startSection('page-title', 'Data Siswa'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Data Siswa</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-4">

    
    <div class="flex flex-wrap items-center gap-3">
        <?php if($tapelAktif): ?>
        <span class="inline-flex items-center gap-1.5 bg-indigo-500/20 border border-indigo-400/30 text-indigo-200 text-sm px-3 py-1.5 rounded-xl">
            <i class="fas fa-calendar-check text-indigo-400"></i>
            Tahun Ajaran Aktif: <strong class="text-white"><?php echo e($tapelAktif->tahun_ajaran); ?></strong>
        </span>
        <span class="text-indigo-400 text-xs italic">Kolom kelas menampilkan kelas pada tahun ajaran aktif saja.</span>
        <?php else: ?>
        <span class="inline-flex items-center gap-1.5 bg-amber-500/20 border border-amber-400/30 text-amber-300 text-sm px-3 py-1.5 rounded-xl">
            <i class="fas fa-exclamation-triangle"></i>
            Belum ada tahun ajaran aktif — data kelas tidak ditampilkan.
        </span>
        <?php endif; ?>
    </div>

    
    <div class="flex flex-col sm:flex-row gap-3 items-start sm:items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap items-center">
            <input type="text" name="search" value="<?php echo e(request('search')); ?>" placeholder="Cari nama / NIS..."
                class="bg-white/10 border border-white/20 text-white placeholder-indigo-300 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 w-48">
            <select name="kelamin" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                <option value="">Semua Kelamin</option>
                <option value="L" <?php echo e(request('kelamin')=='L'?'selected':''); ?>>Laki-laki</option>
                <option value="P" <?php echo e(request('kelamin')=='P'?'selected':''); ?>>Perempuan</option>
            </select>
            <select name="id_kelas" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                <option value="">Semua Kelas</option>
                <?php $__currentLoopData = $kelasList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($k->id_kelas); ?>" <?php echo e(request('id_kelas')==$k->id_kelas?'selected':''); ?>><?php echo e($k->nama_kelas); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-search mr-1"></i> Cari
            </button>
            <?php if(request()->hasAny(['search','kelamin','id_kelas'])): ?>
            <a href="<?php echo e(route('admin.siswa.index')); ?>" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-times mr-1"></i> Reset
            </a>
            <?php endif; ?>
        </form>

        <div class="flex gap-2 shrink-0">
            <a href="<?php echo e(route('admin.siswa.import.form')); ?>" class="bg-emerald-600/80 hover:bg-emerald-600 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-file-import mr-1"></i> Import
            </a>
            <a href="<?php echo e(route('admin.siswa.export')); ?>" class="bg-amber-600/80 hover:bg-amber-600 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-file-excel mr-1"></i> Export
            </a>
            <a href="<?php echo e(route('admin.siswa.create')); ?>" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-plus mr-1"></i> Tambah
            </a>
        </div>
    </div>

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3 w-8">#</th>
                        <th class="px-4 py-3">Foto</th>
                        <th class="px-4 py-3">Nama / NIS</th>
                        <th class="px-4 py-3">Kelas Aktif</th>
                        <th class="px-4 py-3">L/P</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $siswaList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $s): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-t border-white/5 hover:bg-white/5 transition">
                        <td class="px-4 py-3 text-indigo-300"><?php echo e($siswaList->firstItem() + $i); ?></td>
                        <td class="px-4 py-3">
                            <img src="<?php echo e($s->foto ? asset('uploads/siswa/'.$s->foto) : 'https://ui-avatars.com/api/?name='.urlencode($s->nama).'&background=6366f1&color=fff&size=80'); ?>"
                                 class="w-9 h-9 rounded-full object-cover" alt="">
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-white font-medium"><?php echo e($s->nama); ?></div>
                            <div class="text-indigo-300 text-xs font-mono"><?php echo e($s->nis); ?></div>
                        </td>
                        <td class="px-4 py-3">
                            <?php if($s->nama_kelas): ?>
                            <span class="bg-indigo-500/20 text-indigo-200 text-xs px-2 py-0.5 rounded-lg"><?php echo e($s->nama_kelas); ?></span>
                            <?php else: ?>
                            <span class="text-white/30 text-xs italic">Belum ditempatkan</span>
                            <?php endif; ?>
                        </td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded-lg text-xs font-medium <?php echo e($s->kelamin=='L' ? 'bg-blue-500/20 text-blue-300' : 'bg-pink-500/20 text-pink-300'); ?>">
                                <?php echo e($s->kelamin == 'L' ? 'Laki-laki' : 'Perempuan'); ?>

                            </span>
                        </td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded-lg text-xs <?php echo e($s->active ? 'bg-green-500/20 text-green-300' : 'bg-red-500/20 text-red-300'); ?>">
                                <?php echo e($s->active ? 'Aktif' : 'Non-aktif'); ?>

                            </span>
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex items-center justify-center gap-1">
                                <a href="<?php echo e(route('admin.siswa.show', $s->id_siswa)); ?>"
                                   class="w-7 h-7 rounded-lg bg-blue-500/20 hover:bg-blue-500/40 text-blue-300 flex items-center justify-center transition" title="Detail">
                                    <i class="fas fa-eye text-xs"></i>
                                </a>
                                <a href="<?php echo e(route('admin.siswa.edit', $s->id_siswa)); ?>"
                                   class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition" title="Edit">
                                    <i class="fas fa-edit text-xs"></i>
                                </a>
                                <a href="<?php echo e(route('admin.siswa.kartu', $s->id_siswa)); ?>"
                                   class="w-7 h-7 rounded-lg bg-emerald-500/20 hover:bg-emerald-500/40 text-emerald-300 flex items-center justify-center transition" title="Kartu Siswa">
                                    <i class="fas fa-id-card text-xs"></i>
                                </a>
                                <form id="del-<?php echo e($s->id_siswa); ?>" action="<?php echo e(route('admin.siswa.destroy', $s->id_siswa)); ?>" method="POST">
                                    <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                    <button type="button" onclick="confirmDelete('del-<?php echo e($s->id_siswa); ?>', '<?php echo e(addslashes($s->nama)); ?>')"
                                        class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition" title="Hapus">
                                        <i class="fas fa-trash text-xs"></i>
                                    </button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="7" class="px-4 py-10 text-center text-indigo-400">
                            <i class="fas fa-users-slash text-2xl mb-2 block opacity-40"></i>
                            Tidak ada data siswa
                        </td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>

        
        <?php if($siswaList->hasPages()): ?>
        <div class="px-4 py-3 border-t border-white/10">
            <div class="flex items-center justify-between text-sm text-indigo-300">
                <span>Menampilkan <?php echo e($siswaList->firstItem()); ?>–<?php echo e($siswaList->lastItem()); ?> dari <?php echo e($siswaList->total()); ?> siswa</span>
                <div class="flex gap-1">
                    <?php echo e($siswaList->appends(request()->query())->links('vendor.pagination.tailwind-dark')); ?>

                </div>
            </div>
        </div>
        <?php else: ?>
        <div class="px-4 py-3 border-t border-white/10 text-sm text-indigo-400">
            Total: <?php echo e($siswaList->total()); ?> siswa
        </div>
        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/siswa/index.blade.php ENDPATH**/ ?>