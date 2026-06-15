<?php $__env->startSection('page-title', 'Edit Pegawai'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.pegawai.index')); ?>" class="text-indigo-300 hover:text-white">Pegawai</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Edit: <?php echo e($pegawai->nama); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="max-w-4xl">
    <form action="<?php echo e(route('admin.pegawai.update', $pegawai->id_pegawai)); ?>" method="POST" enctype="multipart/form-data">
        <?php echo csrf_field(); ?> <?php echo method_field('PUT'); ?>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20 flex flex-col items-center gap-4">
                <div class="text-white font-semibold text-sm">Foto</div>
                <div class="w-32 h-32 rounded-2xl overflow-hidden border-2 border-indigo-500/50">
                    <img id="fotoImg"
                        src="<?php echo e($pegawai->foto ? asset('uploads/avatar/'.$pegawai->foto) : 'https://ui-avatars.com/api/?name='.urlencode($pegawai->nama).'&background=6366f1&color=fff&size=128'); ?>"
                        class="w-full h-full object-cover">
                </div>
                <label class="cursor-pointer">
                    <span class="bg-indigo-600/50 hover:bg-indigo-600 text-white text-xs rounded-xl px-4 py-2 transition">
                        <i class="fas fa-upload mr-1"></i>Ganti Foto
                    </span>
                    <input type="file" name="foto" accept="image/*" class="hidden" onchange="previewFoto(this)">
                </label>
            </div>

            <div class="lg:col-span-2 bg-white/10 backdrop-blur-sm rounded-2xl p-5 border border-white/20">
                <h3 class="text-white font-semibold mb-4 pb-3 border-b border-white/10">Data Pegawai</h3>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-1">Nama Lengkap <span class="text-red-400">*</span></label>
                        <input type="text" name="nama" value="<?php echo e(old('nama', $pegawai->nama)); ?>" required
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">NIP</label>
                        <input type="text" name="nip" value="<?php echo e(old('nip', $pegawai->nip)); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm font-mono focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Jabatan</label>
                        <select name="jabatan" class="w-full bg-indigo-900 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                            <?php $__currentLoopData = ['guru','kepala_sekolah','wakasek','tata_usaha','bendahara','bk']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $j): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($j); ?>" <?php echo e(($pegawai->jabatan ?? '')==$j?'selected':''); ?>><?php echo e(ucfirst(str_replace('_',' ',$j))); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">Email</label>
                        <input type="email" name="email" value="<?php echo e(old('email', $pegawai->email)); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div>
                        <label class="block text-sm text-indigo-200 mb-1">No. Telepon</label>
                        <input type="text" name="hp" value="<?php echo e(old('hp', $pegawai->hp)); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                    </div>
                    <div class="sm:col-span-2">
                        <label class="block text-sm text-indigo-200 mb-2">Mata Pelajaran Diampu</label>
                        <?php $selectedMapelIds = $pegawai->mapel->pluck('id_mapel')->toArray(); ?>
                        <div class="grid grid-cols-2 gap-2 max-h-40 overflow-y-auto pr-1">
                            <?php $__currentLoopData = $mapelList; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $m): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <label class="flex items-center gap-2 text-sm text-indigo-200 cursor-pointer">
                                <input type="checkbox" name="mapel_ids[]" value="<?php echo e($m->id_mapel); ?>"
                                    <?php echo e(in_array($m->id_mapel, $selectedMapelIds) ? 'checked' : ''); ?>

                                    class="accent-indigo-500">
                                <?php echo e($m->nama_mapel); ?>

                            </label>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                    <div class="flex items-center gap-2">
                        <input type="checkbox" name="is_active" id="is_active" value="1" <?php echo e($pegawai->is_active ? 'checked' : ''); ?> class="w-4 h-4 accent-indigo-500">
                        <label for="is_active" class="text-sm text-indigo-200">Status Aktif</label>
                    </div>
                </div>
            </div>

            <div class="lg:col-span-3 flex gap-3">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-save mr-2"></i>Update
                </button>
                <a href="<?php echo e(route('admin.pegawai.show', $pegawai->id_pegawai)); ?>" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
            </div>
        </div>
    </form>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script>
function previewFoto(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = e => { document.getElementById('fotoImg').src = e.target.result; };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/pegawai/edit.blade.php ENDPATH**/ ?>