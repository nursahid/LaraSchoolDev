<?php $__env->startSection('page-title', 'Mapel per Tingkat'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Mapel per Tingkat</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-5" x-data="{ showModal: false }">

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 p-4">
        <form method="GET" action="<?php echo e(route('admin.mapel-tingkat.index')); ?>" class="flex flex-wrap gap-3 items-end">

            
            <?php
                $jenjangColor = match($jenjang) {
                    'SD'  => 'bg-emerald-500/20 text-emerald-300 border-emerald-400/30',
                    'SMP' => 'bg-sky-500/20 text-sky-300 border-sky-400/30',
                    'SMA' => 'bg-purple-500/20 text-purple-300 border-purple-400/30',
                    default => 'bg-indigo-500/20 text-indigo-300 border-indigo-400/30',
                };
                $jenjangLabel = match($jenjang) {
                    'SD'  => 'SD — Tingkat 1 s/d 6',
                    'SMP' => 'SMP — Tingkat 7, 8, 9',
                    'SMA' => 'SMA — Tingkat 10, 11, 12',
                    default => $jenjang,
                };
            ?>
            <div class="flex items-end">
                <span class="inline-flex items-center gap-1.5 border rounded-xl px-3 py-2 text-xs font-medium <?php echo e($jenjangColor); ?>">
                    <i class="fas fa-school"></i>
                    <?php echo e($jenjangLabel); ?>

                </span>
            </div>

            <div>
                <label class="block text-xs text-indigo-300 mb-1">Tingkat</label>
                <select name="id_tingkat" onchange="this.form.submit()"
                    class="bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    <?php $__currentLoopData = $tingkatList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $t): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($t->id_tingkat); ?>" <?php echo e($selTingkat == $t->id_tingkat ? 'selected' : ''); ?>>
                        <?php echo e($t->nama_tingkat); ?>

                    </option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </div>
            <?php if($jurusanList->count() > 1): ?>
            
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Jurusan</label>
                <select name="id_jurusan" onchange="this.form.submit()"
                    class="bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    <?php $__currentLoopData = $jurusanList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $j): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($j->id_jurusan); ?>" <?php echo e($selJurusan == $j->id_jurusan ? 'selected' : ''); ?>>
                        <?php echo e($j->nama_jurusan); ?>

                    </option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </div>
            <?php else: ?>
            
            <input type="hidden" name="id_jurusan" value="<?php echo e($jurusanList->first()?->id_jurusan); ?>">
            <?php endif; ?>
            <div class="ml-auto">
                <button type="button" @click="showModal = true"
                    class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                    <i class="fas fa-plus mr-1"></i>Tambah Mapel
                </button>
            </div>
        </form>
    </div>

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-5 py-4 bg-indigo-900/50 border-b border-white/10 flex items-center justify-between">
            <div>
                <h3 class="text-white font-semibold text-sm flex items-center gap-2">
                    <i class="fas fa-layer-group text-indigo-400"></i>
                    Daftar Mata Pelajaran
                </h3>
                <p class="text-xs text-indigo-400 mt-0.5">
                    <?php echo e($tingkatList->firstWhere('id_tingkat', $selTingkat)?->nama_tingkat ?? '-'); ?>

                    — <?php echo e($jurusanList->firstWhere('id_jurusan', $selJurusan)?->nama_jurusan ?? '-'); ?>

                </p>
            </div>
            <span class="text-xs bg-indigo-600/40 text-indigo-200 rounded-lg px-3 py-1">
                <?php echo e($assignments->count()); ?> Mapel
            </span>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead>
                    <tr class="border-b border-white/10">
                        <th class="text-left px-5 py-3 text-indigo-300 font-medium text-xs">No</th>
                        <th class="text-left px-5 py-3 text-indigo-300 font-medium text-xs">Mata Pelajaran</th>
                        <th class="text-left px-5 py-3 text-indigo-300 font-medium text-xs">Kode</th>
                        <th class="text-left px-5 py-3 text-indigo-300 font-medium text-xs">Kategori</th>
                        <th class="text-left px-5 py-3 text-indigo-300 font-medium text-xs">Kelompok</th>
                        <th class="text-center px-5 py-3 text-indigo-300 font-medium text-xs">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $assignments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-b border-white/5 hover:bg-white/5 transition">
                        <td class="px-5 py-3 text-indigo-400 text-xs"><?php echo e($i + 1); ?></td>
                        <td class="px-5 py-3 text-white font-medium"><?php echo e($row->mapel?->nama_mapel ?? '-'); ?></td>
                        <td class="px-5 py-3 text-indigo-300 font-mono text-xs"><?php echo e($row->mapel?->kode ?? '-'); ?></td>
                        <td class="px-5 py-3 text-indigo-300 text-xs"><?php echo e($row->mapel?->kategori ?? '-'); ?></td>
                        <td class="px-5 py-3 text-indigo-300 text-xs"><?php echo e($row->mapel?->kelompok ?? '-'); ?></td>
                        <td class="px-5 py-3 text-center">
                            <form id="del-mt<?php echo e($row->id_mapeltingkat); ?>"
                                  action="<?php echo e(route('admin.mapel-tingkat.destroy', $row->id_mapeltingkat)); ?>"
                                  method="POST">
                                <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                <button type="button"
                                    onclick="confirmDelete('del-mt<?php echo e($row->id_mapeltingkat); ?>', '<?php echo e(addslashes($row->mapel?->nama_mapel)); ?>')"
                                    class="text-xs bg-red-500/20 hover:bg-red-500/40 text-red-300 rounded-lg px-3 py-1.5 transition">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="6" class="px-5 py-10 text-center text-indigo-400">
                            <i class="fas fa-book-open text-3xl mb-2 block opacity-30"></i>
                            Belum ada mata pelajaran untuk tingkat & jurusan ini.
                        </td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    
    <div x-show="showModal" x-cloak
         class="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
        <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-lg max-h-[90vh] flex flex-col">
            <div class="flex items-center justify-between mb-4 flex-shrink-0">
                <h3 class="text-white font-semibold">Tambah Mata Pelajaran</h3>
                <button @click="showModal = false" class="text-indigo-400 hover:text-white">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            <form action="<?php echo e(route('admin.mapel-tingkat.store')); ?>" method="POST" class="flex flex-col gap-4 overflow-hidden">
                <?php echo csrf_field(); ?>
                <input type="hidden" name="id_tingkat" value="<?php echo e($selTingkat); ?>">
                <input type="hidden" name="id_jurusan" value="<?php echo e($selJurusan); ?>">

                
                <div class="bg-indigo-900/40 rounded-xl px-4 py-2.5 text-xs text-indigo-300 flex gap-4">
                    <span><i class="fas fa-graduation-cap mr-1"></i>
                        <?php echo e($tingkatList->firstWhere('id_tingkat', $selTingkat)?->nama_tingkat ?? '-'); ?>

                    </span>
                    <span><i class="fas fa-code-branch mr-1"></i>
                        <?php echo e($jurusanList->firstWhere('id_jurusan', $selJurusan)?->nama_jurusan ?? '-'); ?>

                    </span>
                </div>

                
                <div class="flex-1 overflow-y-auto space-y-1 pr-1 max-h-80">
                    <?php $__empty_1 = true; $__currentLoopData = $availableMapel; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <label class="flex items-center gap-3 px-3 py-2 rounded-xl hover:bg-white/5 cursor-pointer group">
                        <input type="checkbox" name="id_mapel[]" value="<?php echo e($m->id_mapel); ?>"
                            class="accent-indigo-500 w-4 h-4 flex-shrink-0">
                        <div class="flex-1 min-w-0">
                            <span class="text-sm text-indigo-100 group-hover:text-white"><?php echo e($m->nama_mapel); ?></span>
                            <?php if($m->kode): ?>
                            <span class="text-xs text-indigo-500 ml-2 font-mono"><?php echo e($m->kode); ?></span>
                            <?php endif; ?>
                        </div>
                        <?php if($m->kelompok): ?>
                        <span class="text-xs text-indigo-500 whitespace-nowrap"><?php echo e($m->kelompok); ?></span>
                        <?php endif; ?>
                    </label>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <p class="text-center text-indigo-400 py-6 text-sm">
                        Semua mata pelajaran sudah ditambahkan untuk tingkat ini.
                    </p>
                    <?php endif; ?>
                </div>

                <?php if($availableMapel->isNotEmpty()): ?>
                <div class="flex gap-3 pt-2 flex-shrink-0 border-t border-white/10">
                    <button type="submit"
                        class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i>Simpan
                    </button>
                    <button type="button" @click="showModal = false"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">
                        Batal
                    </button>
                </div>
                <?php endif; ?>
            </form>
        </div>
    </div>

</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/mapel-tingkat/index.blade.php ENDPATH**/ ?>