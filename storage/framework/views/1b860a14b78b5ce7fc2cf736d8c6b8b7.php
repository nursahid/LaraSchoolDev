<?php $__env->startSection('page-title', 'Import Siswa'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.siswa.index')); ?>" class="text-indigo-300 hover:text-white">Siswa</a></li>
    <li class="text-white/40">/</li>
    <li class="text-white">Import Excel</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="max-w-2xl">
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl p-6 border border-white/20">
        <h3 class="text-white font-semibold mb-1">Import Data Siswa</h3>
        <p class="text-indigo-300 text-sm mb-6">Upload file Excel (.xlsx/.xls) sesuai template yang tersedia.</p>

        <form action="<?php echo e(route('admin.siswa.import')); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <div id="dropzone-upload" class="dropzone rounded-2xl border-2 border-dashed border-indigo-500/50 bg-indigo-900/30 mb-4">
                <div class="dz-message text-center py-10">
                    <i class="fas fa-file-excel text-4xl text-green-400 mb-3 block"></i>
                    <p class="text-white font-medium">Drag & drop file Excel di sini</p>
                    <p class="text-indigo-300 text-sm mt-1">atau klik untuk memilih file</p>
                    <p class="text-indigo-400 text-xs mt-2">.xlsx / .xls — maks 5MB</p>
                </div>
            </div>
            <input type="hidden" name="file_path" id="importFilePath">
            <div class="flex gap-3 mt-4">
                <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-6 py-2.5 text-sm font-medium transition">
                    <i class="fas fa-upload mr-2"></i>Import
                </button>
                <a href="<?php echo e(route('admin.siswa.index')); ?>" class="bg-white/10 hover:bg-white/20 text-indigo-300 rounded-xl px-6 py-2.5 text-sm transition">Batal</a>
            </div>
        </form>

        <div class="mt-6 pt-5 border-t border-white/10">
            <h4 class="text-indigo-200 font-medium text-sm mb-3">Format Kolom Excel:</h4>
            <div class="bg-white/5 rounded-xl overflow-hidden">
                <table class="w-full text-xs">
                    <thead class="bg-indigo-900/50">
                        <tr class="text-indigo-300">
                            <th class="px-3 py-2 text-left">Kolom</th>
                            <th class="px-3 py-2 text-left">Keterangan</th>
                            <th class="px-3 py-2 text-left">Wajib?</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $__currentLoopData = [
                            ['nama_lengkap','Nama lengkap siswa','Ya'],
                            ['nis','Nomor Induk Siswa','Ya'],
                            ['nisn','Nomor Induk Siswa Nasional','Tidak'],
                            ['jenis_kelamin','L atau P','Ya'],
                            ['tempat_lahir','Kota tempat lahir','Tidak'],
                            ['tgl_lahir','Format: YYYY-MM-DD','Tidak'],
                            ['agama','Islam/Kristen/dll','Tidak'],
                            ['email','Email siswa','Tidak'],
                            ['no_telp','Nomor telepon','Tidak'],
                            ['alamat','Alamat lengkap','Tidak'],
                        ]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr class="border-t border-white/5">
                            <td class="px-3 py-1.5 text-indigo-200 font-mono"><?php echo e($row[0]); ?></td>
                            <td class="px-3 py-1.5 text-white"><?php echo e($row[1]); ?></td>
                            <td class="px-3 py-1.5">
                                <span class="<?php echo e($row[2]=='Ya' ? 'text-green-400' : 'text-indigo-400'); ?>"><?php echo e($row[2]); ?></span>
                            </td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
<link rel="stylesheet" href="https://unpkg.com/dropzone@6/dist/dropzone.css"/>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="https://unpkg.com/dropzone@6/dist/dropzone-min.js"></script>
<script>
Dropzone.autoDiscover = false;
const dz = new Dropzone('#dropzone-upload', {
    url: '<?php echo e(route("admin.siswa.import")); ?>',
    autoProcessQueue: false,
    maxFiles: 1,
    maxFilesize: 5,
    acceptedFiles: '.xlsx,.xls',
    headers: { 'X-CSRF-TOKEN': '<?php echo e(csrf_token()); ?>' },
    addRemoveLinks: true,
});
dz.on('addedfile', file => {
    if (dz.files.length > 1) dz.removeFile(dz.files[0]);
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/siswa/import.blade.php ENDPATH**/ ?>