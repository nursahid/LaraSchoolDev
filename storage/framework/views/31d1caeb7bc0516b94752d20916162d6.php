<?php $__env->startSection('page-title', 'Manajemen User'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Users</li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-4">
    <div class="flex flex-wrap gap-3 items-center justify-between">
        <form method="GET" class="flex gap-2">
            <input type="text" name="q" value="<?php echo e(request('q')); ?>" placeholder="Cari nama / email..."
                class="bg-white/10 border border-white/20 text-white placeholder-indigo-300 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 w-56">
            <select name="role" class="bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none">
                <option value="">Semua Role</option>
                <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $r): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($r->name); ?>" <?php echo e(request('role')==$r->name?'selected':''); ?>><?php echo e($r->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </select>
            <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
                <i class="fas fa-search mr-1"></i>Cari
            </button>
        </form>
        <a href="<?php echo e(route('admin.users.create')); ?>" class="bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl px-4 py-2 text-sm transition">
            <i class="fas fa-plus mr-1"></i>Tambah User
        </a>
    </div>

    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-sm">
                <thead class="bg-indigo-900/50">
                    <tr class="text-indigo-200 text-left">
                        <th class="px-4 py-3">#</th>
                        <th class="px-4 py-3">Avatar</th>
                        <th class="px-4 py-3">Nama / Email</th>
                        <th class="px-4 py-3">Role</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3">Bergabung</th>
                        <th class="px-4 py-3 text-center">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $__empty_1 = true; $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $u): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <tr class="border-t border-white/5 hover:bg-white/5">
                        <td class="px-4 py-3 text-indigo-300"><?php echo e($users->firstItem() + $i); ?></td>
                        <td class="px-4 py-3">
                            <img src="https://ui-avatars.com/api/?name=<?php echo e(urlencode($u->name)); ?>&background=6366f1&color=fff&size=32"
                                 class="w-8 h-8 rounded-full">
                        </td>
                        <td class="px-4 py-3">
                            <div class="text-white font-medium"><?php echo e($u->name); ?></div>
                            <div class="text-indigo-300 text-xs"><?php echo e($u->email); ?></div>
                        </td>
                        <td class="px-4 py-3">
                            <div class="flex flex-wrap gap-1">
                                <?php $__currentLoopData = $u->roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <span class="bg-indigo-600/30 text-indigo-200 rounded px-2 py-0.5 text-xs"><?php echo e($role->name); ?></span>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </div>
                        </td>
                        <td class="px-4 py-3">
                            <span class="px-2 py-0.5 rounded text-xs <?php echo e($u->email_verified_at ? 'bg-green-500/20 text-green-300' : 'bg-red-500/20 text-red-300'); ?>">
                                <?php echo e($u->email_verified_at ? 'Aktif' : 'Non-aktif'); ?>

                            </span>
                        </td>
                        <td class="px-4 py-3 text-indigo-300 text-xs"><?php echo e($u->created_at->format('d/m/Y')); ?></td>
                        <td class="px-4 py-3">
                            <div class="flex items-center justify-center gap-1">
                                <a href="<?php echo e(route('admin.users.edit', $u->id)); ?>" class="w-7 h-7 rounded-lg bg-amber-500/20 hover:bg-amber-500/40 text-amber-300 flex items-center justify-center transition">
                                    <i class="fas fa-edit text-xs"></i>
                                </a>
                                <form action="<?php echo e(route('admin.users.toggle-status', $u->id)); ?>" method="POST">
                                    <?php echo csrf_field(); ?>
                                    <button type="submit" class="w-7 h-7 rounded-lg bg-blue-500/20 hover:bg-blue-500/40 text-blue-300 flex items-center justify-center transition" title="Toggle Status">
                                        <i class="fas fa-power-off text-xs"></i>
                                    </button>
                                </form>
                                <?php if($u->id !== auth()->id()): ?>
                                <form id="del-u<?php echo e($u->id); ?>" action="<?php echo e(route('admin.users.destroy', $u->id)); ?>" method="POST">
                                    <?php echo csrf_field(); ?> <?php echo method_field('DELETE'); ?>
                                    <button type="button" onclick="confirmDelete('del-u<?php echo e($u->id); ?>', '<?php echo e(addslashes($u->name)); ?>')"
                                        class="w-7 h-7 rounded-lg bg-red-500/20 hover:bg-red-500/40 text-red-300 flex items-center justify-center transition">
                                        <i class="fas fa-trash text-xs"></i>
                                    </button>
                                </form>
                                <?php endif; ?>
                            </div>
                        </td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <tr><td colspan="7" class="px-4 py-8 text-center text-indigo-400">Tidak ada data user</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
        <?php if($users->hasPages()): ?>
        <div class="px-4 py-3 border-t border-white/10">
            <?php echo e($users->appends(request()->query())->links()); ?>

        </div>
        <?php endif; ?>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/users/index.blade.php ENDPATH**/ ?>