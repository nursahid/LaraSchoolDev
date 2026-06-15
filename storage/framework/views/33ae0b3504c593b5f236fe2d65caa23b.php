<?php $__env->startSection('page-title', 'Prestasi Siswa'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Prestasi</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-4">

    
    <div class="flex flex-col sm:flex-row gap-3 items-start sm:items-center justify-between">
        <form method="GET" class="flex gap-2 flex-wrap items-center">
            <input type="text" name="search" value="<?php echo e(request('search')); ?>" placeholder="Cari nama siswa / prestasi..."
                class="bg-white/10 border border-white/20 text-white placeholder-indigo-300 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 w-52">
            <select name="jenis" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Jenis</option>
                <option value="Akademik" <?php echo e(request('jenis')=='Akademik'?'selected':''); ?>>Akademik</option>
                <option value="Non Akademik" <?php echo e(request('jenis')=='Non Akademik'?'selected':''); ?>>Non Akademik</option>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-search mr-1"></i> Cari
            </button>
            <?php if(request()->hasAny(['search','jenis'])): ?>
            <a href="<?php echo e(route('admin.prestasi.index')); ?>" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-times mr-1"></i> Reset
            </a>
            <?php endif; ?>
        </form>

        <button onclick="document.getElementById('modalForm').classList.remove('hidden')"
            class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition shrink-0">
            <i class="fas fa-plus mr-1"></i> Tambah Prestasi
        </button>
    </div>

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-4 py-2.5 border-b border-white/10 text-indigo-300 text-sm">
            Total: <strong class="text-white"><?php echo e($prestasiList->count()); ?></strong> prestasi
        </div>
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Nama Siswa</th>
                        <th class="px-4 py-3">Nama Prestasi / Lomba</th>
                        <th class="px-4 py-3">Jenis</th>
                        <th class="px-4 py-3">Level</th>
                        <th class="px-4 py-3">Tanggal</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $prestasiList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $p): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-2.5 text-indigo-300"><?php echo e($i + 1); ?></td>
                        <td class="px-4 py-2.5">
                            <div class="text-white font-medium"><?php echo e($p->nama_siswa); ?></div>
                            <?php if($p->nis): ?><div class="text-indigo-400 text-xs font-mono"><?php echo e($p->nis); ?></div><?php endif; ?>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-100"><?php echo e($p->nama_prestasi); ?></td>
                        <td class="px-4 py-2.5">
                            <span class="px-2 py-0.5 rounded text-xs <?php echo e($p->jenis_prestasi == 'Akademik' ? 'bg-sky-500/20 text-sky-300' : 'bg-purple-500/20 text-purple-300'); ?>">
                                <?php echo e($p->jenis_prestasi); ?>

                            </span>
                        </td>
                        <td class="px-4 py-2.5">
                            <span class="px-2 py-0.5 rounded text-xs bg-indigo-500/20 text-indigo-300"><?php echo e($p->level_prestasi); ?></span>
                        </td>
                        <td class="px-4 py-2.5 text-indigo-300 text-xs">
                            <?php echo e(\Carbon\Carbon::parse($p->tgl_perolehan)->format('d M Y')); ?>

                        </td>
                        <td class="px-4 py-2.5">
                            <div class="flex justify-center gap-1">
                                <a href="<?php echo e(route('admin.prestasi.edit', $p->id_prestasi)); ?>"
                                   class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition" title="Edit">
                                    <i class="fas fa-edit text-xs"></i>
                                </a>
                                <form id="del-pr<?php echo e($p->id_prestasi); ?>" action="<?php echo e(route('admin.prestasi.destroy', $p->id_prestasi)); ?>" method="POST">
                                    <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                    <button type="button" onclick="confirmDelete('del-pr<?php echo e($p->id_prestasi); ?>', '<?php echo e(addslashes($p->nama_prestasi)); ?>')"
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
                            <i class="fas fa-trophy text-2xl mb-2 block opacity-30"></i>
                            Belum ada data prestasi
                        </td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div id="modalForm" class="hidden fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
    <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-lg">
        <div class="flex items-center justify-between mb-4">
            <h3 class="text-white font-semibold">Tambah Prestasi</h3>
            <button onclick="document.getElementById('modalForm').classList.add('hidden')" class="text-indigo-400 hover:text-white">
                <i class="fas fa-times"></i>
            </button>
        </div>
        <form action="<?php echo e(route('admin.prestasi.store')); ?>" method="POST">
            <?php echo csrf_field(); ?>
            <div class="grid grid-cols-2 gap-3">
                <div class="col-span-2">
                    <label class="block text-sm text-indigo-200 mb-1">Siswa <span class="text-red-400">*</span></label>
                    <select name="id_siswa" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="">-- Pilih Siswa --</option>
                        <?php $__currentLoopData = $siswaList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $s): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($s->id_siswa); ?>"><?php echo e($s->nama); ?> (<?php echo e($s->nis); ?>)</option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
                <div class="col-span-2">
                    <label class="block text-sm text-indigo-200 mb-1">Nama Prestasi / Lomba <span class="text-red-400">*</span></label>
                    <input type="text" name="nama_prestasi" required placeholder="Olimpiade Matematika Tingkat Kabupaten"
                        class="w-full bg-white/10 border border-white/20 text-white placeholder-indigo-400 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Jenis <span class="text-red-400">*</span></label>
                    <select name="jenis_prestasi" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="Akademik">Akademik</option>
                        <option value="Non Akademik">Non Akademik</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm text-indigo-200 mb-1">Level <span class="text-red-400">*</span></label>
                    <select name="level_prestasi" required class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                        <option value="Sekolah">Sekolah</option>
                        <option value="Kecamatan">Kecamatan</option>
                        <option value="Kabupaten/Kota">Kabupaten/Kota</option>
                        <option value="Provinsi">Provinsi</option>
                        <option value="Nasional">Nasional</option>
                        <option value="Internasional">Internasional</option>
                    </select>
                </div>
                <div class="col-span-2">
                    <label class="block text-sm text-indigo-200 mb-1">Tanggal Perolehan <span class="text-red-400">*</span></label>
                    <input type="date" name="tgl_perolehan" required value="<?php echo e(date('Y-m-d')); ?>"
                        class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                </div>
                <div class="col-span-2 flex gap-3 pt-2">
                    <button type="submit" class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i> Simpan
                    </button>
                    <button type="button" onclick="document.getElementById('modalForm').classList.add('hidden')"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">Batal</button>
                </div>
            </div>
        </form>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/prestasi/index.blade.php ENDPATH**/ ?>