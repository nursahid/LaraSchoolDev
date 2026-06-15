<?php $__env->startSection('page-title', 'Guru Mapel'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Guru Mapel</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-5" x-data="{ showModal: false }">

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 p-4">
        <form method="GET" action="<?php echo e(route('admin.pegawai-mapel.index')); ?>" class="flex flex-wrap gap-3 items-end">
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Tahun Ajaran</label>
                <select name="tapel" onchange="this.form.submit()"
                    class="bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    <?php $__currentLoopData = $tapelList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($tp->id_tahunajaran); ?>" <?php echo e($tapelFilter == $tp->id_tahunajaran ? 'selected' : ''); ?>>
                        <?php echo e($tp->tahun_ajaran); ?><?php echo e($tp->status === '1' ? ' ★' : ''); ?>

                    </option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </div>
            <div>
                <label class="block text-xs text-indigo-300 mb-1">Semester</label>
                <select name="semester" onchange="this.form.submit()"
                    class="bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    <?php $__currentLoopData = $semesterList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sm): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <option value="<?php echo e($sm->id_semester); ?>" <?php echo e($semesterFilter == $sm->id_semester ? 'selected' : ''); ?>>
                        <?php echo e($sm->semester); ?><?php echo e($sm->status === '1' ? ' ★' : ''); ?>

                    </option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </select>
            </div>
            <div class="ml-auto">
                <button type="button" @click="showModal = true"
                    class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                    <i class="fas fa-plus mr-1"></i>Tambah Penugasan
                </button>
            </div>
        </form>
    </div>

    
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-5 py-4 bg-indigo-900/50 border-b border-white/10 flex items-center justify-between">
            <div>
                <h3 class="text-white font-semibold text-sm flex items-center gap-2">
                    <i class="fas fa-chalkboard-teacher text-indigo-400"></i>
                    Penugasan Guru Mata Pelajaran
                </h3>
                <p class="text-xs text-indigo-400 mt-0.5">
                    <?php echo e($tapelMap->get($tapelFilter)?->tahun_ajaran ?? '-'); ?>

                    — <?php echo e($semesterMap->get($semesterFilter)?->semester ?? '-'); ?>

                </p>
            </div>
            <span class="text-xs bg-indigo-600/40 text-indigo-200 rounded-lg px-3 py-1">
                <?php echo e($assignments->count()); ?> Penugasan
            </span>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full text-sm" id="tblPegawaiMapel">
                <thead>
                    <tr class="border-b border-white/10">
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">No</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Guru</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Mata Pelajaran</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Tingkat</th>
                        <th class="text-left px-4 py-3 text-indigo-300 font-medium text-xs">Jurusan</th>
                        <th class="text-center px-4 py-3 text-indigo-300 font-medium text-xs">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $assignments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-b border-white/5 hover:bg-white/5 transition">
                        <td class="px-4 py-3 text-indigo-400 text-xs"><?php echo e($i + 1); ?></td>
                        <td class="px-4 py-3">
                            <div class="font-medium text-white"><?php echo e($row->pegawai?->nama ?? '-'); ?></div>
                            <?php if($row->pegawai?->nip): ?>
                            <div class="text-xs text-indigo-400 font-mono"><?php echo e($row->pegawai->nip); ?></div>
                            <?php endif; ?>
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-indigo-100"><?php echo e($row->mapel?->nama_mapel ?? '-'); ?></div>
                            <?php if($row->mapel?->kode): ?>
                            <div class="text-xs text-indigo-500 font-mono"><?php echo e($row->mapel->kode); ?></div>
                            <?php endif; ?>
                        </td>
                        <td class="px-4 py-3 text-indigo-300 text-xs"><?php echo e($row->tingkat?->nama_tingkat ?? '-'); ?></td>
                        <td class="px-4 py-3 text-indigo-300 text-xs"><?php echo e($row->jurusan?->nama_jurusan ?? '-'); ?></td>
                        <td class="px-4 py-3 text-center">
                            <form id="del-pm<?php echo e($row->id_pegawai_mapel); ?>"
                                  action="<?php echo e(route('admin.pegawai-mapel.destroy', $row->id_pegawai_mapel)); ?>"
                                  method="POST">
                                <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                <button type="button"
                                    onclick="confirmDelete('del-pm<?php echo e($row->id_pegawai_mapel); ?>', '<?php echo e(addslashes($row->pegawai?->nama)); ?> — <?php echo e(addslashes($row->mapel?->nama_mapel)); ?>')"
                                    class="text-xs bg-red-500/20 hover:bg-red-500/40 text-red-300 rounded-lg px-3 py-1.5 transition">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr>
                        <td colspan="6" class="px-5 py-10 text-center text-indigo-400">
                            <i class="fas fa-user-slash text-3xl mb-2 block opacity-30"></i>
                            Belum ada penugasan guru untuk periode ini.
                        </td>
                    </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    
    <div x-show="showModal" x-cloak
         class="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
        <div class="bg-indigo-950 rounded-2xl border border-white/20 p-6 w-full max-w-lg">
            <div class="flex items-center justify-between mb-5">
                <h3 class="text-white font-semibold">Tambah Penugasan Guru</h3>
                <button @click="showModal = false" class="text-indigo-400 hover:text-white">
                    <i class="fas fa-times"></i>
                </button>
            </div>

            <form action="<?php echo e(route('admin.pegawai-mapel.store')); ?>" method="POST" class="space-y-4">
                <?php echo csrf_field(); ?>
                <div class="grid grid-cols-2 gap-3">
                    <div class="col-span-2">
                        <label class="block text-xs text-indigo-300 mb-1">Guru <span class="text-red-400">*</span></label>
                        <select name="id_pegawai" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih Guru --</option>
                            <?php $__currentLoopData = $guruList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $g): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($g->id_pegawai); ?>"><?php echo e($g->nama); ?><?php echo e($g->nip ? ' ('.$g->nip.')' : ''); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="col-span-2">
                        <label class="block text-xs text-indigo-300 mb-1">Mata Pelajaran <span class="text-red-400">*</span></label>
                        <select name="id_mapel" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih Mata Pelajaran --</option>
                            <?php $__currentLoopData = $mapelList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($m->id_mapel); ?>"><?php echo e($m->nama_mapel); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs text-indigo-300 mb-1">
                            Tingkat <span class="text-red-400">*</span>
                            <span class="ml-1 font-normal opacity-60">(<?php echo e($jenjang); ?>)</span>
                        </label>
                        <select name="id_tingkat" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih --</option>
                            <?php $__currentLoopData = $tingkatList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $t): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($t->id_tingkat); ?>"><?php echo e($t->nama_tingkat); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div>
                        <label class="block text-xs text-indigo-300 mb-1">Jurusan <span class="text-red-400">*</span></label>
                        <?php if($jurusanList->count() > 1): ?>
                        
                        <select name="id_jurusan" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="">-- Pilih --</option>
                            <?php $__currentLoopData = $jurusanList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $j): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($j->id_jurusan); ?>"><?php echo e($j->nama_jurusan); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                        <?php else: ?>
                        
                        <input type="hidden" name="id_jurusan" value="<?php echo e($jurusanList->first()?->id_jurusan); ?>">
                        <div class="w-full bg-white/5 border border-white/10 text-indigo-300 rounded-xl px-3 py-2 text-sm italic">
                            <?php echo e($jurusanList->first()?->nama_jurusan ?? '-'); ?>

                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="col-span-2">
                        <label class="block text-xs text-indigo-300 mb-1">Tahun Ajaran <span class="text-red-400">*</span></label>
                        <?php if($tapelAktif): ?>
                        <input type="hidden" name="tapel" value="<?php echo e($tapelAktif->id_tahunajaran); ?>">
                        <div class="w-full bg-white/5 border border-white/10 text-white rounded-xl px-3 py-2 text-sm flex items-center gap-2">
                            <i class="fas fa-calendar-check text-indigo-400 text-xs"></i>
                            <span><?php echo e($tapelAktif->tahun_ajaran); ?></span>
                            <span class="ml-auto text-xs bg-green-500/20 text-green-300 rounded-lg px-2 py-0.5">Aktif</span>
                        </div>
                        <?php else: ?>
                        <div class="w-full bg-amber-500/10 border border-amber-500/30 text-amber-300 rounded-xl px-3 py-2 text-sm">
                            <i class="fas fa-exclamation-triangle mr-1"></i> Belum ada tahun ajaran aktif
                        </div>
                        <?php endif; ?>
                    </div>
                    <div>
                        <label class="block text-xs text-indigo-300 mb-1">Semester <span class="text-red-400">*</span></label>
                        <select name="semester" required
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <?php $__currentLoopData = $semesterList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sm): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($sm->id_semester); ?>" <?php echo e($semesterFilter == $sm->id_semester ? 'selected' : ''); ?>>
                                <?php echo e($sm->semester); ?>

                            </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                </div>

                <div class="flex gap-3 pt-2 border-t border-white/10">
                    <button type="submit"
                        class="flex-1 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl py-2.5 text-sm font-medium transition">
                        <i class="fas fa-save mr-1"></i>Simpan
                    </button>
                    <button type="button" @click="showModal = false"
                        class="flex-1 bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl py-2.5 text-sm transition">
                        Batal
                    </button>
                </div>
            </form>
        </div>
    </div>

</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script>
    $('#tblPegawaiMapel').DataTable({
        language: { url: '//cdn.datatables.net/plug-ins/1.13.8/i18n/id.json' },
        pageLength: 25,
        order: [[2, 'asc'], [1, 'asc']],
        columnDefs: [{ orderable: false, targets: [0, 5] }],
    });
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/pegawai-mapel/index.blade.php ENDPATH**/ ?>