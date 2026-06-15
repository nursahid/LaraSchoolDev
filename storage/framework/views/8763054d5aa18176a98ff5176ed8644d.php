<?php $__env->startSection('page-title', 'Konfigurasi Sistem'); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li><a href="<?php echo e(route('admin.dashboard')); ?>" class="text-indigo-300 hover:text-white">Dashboard</a></li>
    <li class="text-white/40">/</li>
    <li class="text-indigo-300">Konfigurasi</li>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('styles'); ?>
<style>
    .ck.ck-editor__main > .ck-editor__editable {
        min-height: 200px;
        background: rgba(255,255,255,0.05);
        color: #e0e7ff;
        border-color: rgba(255,255,255,0.2);
    }
    .ck.ck-toolbar {
        background: rgba(49,46,129,0.8);
        border-color: rgba(255,255,255,0.2);
    }
    .ck.ck-toolbar .ck-toolbar__separator {
        background: rgba(255,255,255,0.15);
    }
    .ck.ck-button:not(.ck-disabled):hover,
    .ck.ck-button.ck-on {
        background: rgba(99,102,241,0.4);
    }
    .ck.ck-button { color: #c7d2fe; }
    .ck.ck-icon { color: #c7d2fe; }
    .ck.ck-dropdown__panel,
    .ck.ck-balloon-panel {
        background: #1e1b4b;
        border-color: rgba(255,255,255,0.2);
    }
    .ck.ck-list__item .ck-button .ck-button__label { color: #e0e7ff; }
    .ck.ck-list__item .ck-button.ck-on { background: rgba(99,102,241,0.4); }
    .ck-rounded-corners .ck.ck-editor__main > .ck-editor__editable,
    .ck.ck-editor__main > .ck-editor__editable.ck-rounded-corners {
        border-radius: 0 0 0.75rem 0.75rem;
    }
    .ck-rounded-corners .ck.ck-editor__top .ck-sticky-panel .ck-toolbar,
    .ck.ck-editor__top .ck-sticky-panel .ck-toolbar.ck-rounded-corners {
        border-radius: 0.75rem 0.75rem 0 0;
    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
<div class="space-y-6">
    <?php $__currentLoopData = $configs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $categoryName => $items): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <div class="bg-white/10 backdrop-blur-sm rounded-2xl border border-white/20 overflow-hidden">
        <div class="px-5 py-4 bg-indigo-900/50 border-b border-white/10 flex items-center gap-2">
            <i class="fas fa-sliders-h text-indigo-400 text-sm"></i>
            <h3 class="text-white font-semibold"><?php echo e($categoryName); ?></h3>
        </div>
        <form action="<?php echo e(route('admin.config.update')); ?>" method="POST" enctype="multipart/form-data" class="p-5">
            <?php echo csrf_field(); ?> <?php echo method_field('PUT'); ?>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <?php $__currentLoopData = $items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $config): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php
                    $isWide = in_array($config->type, ['editor', 'textarea']);
                    $editorId = 'ck-' . preg_replace('/[^a-z0-9]+/', '-', strtolower($config->config_name ?? 'field-' . $loop->index));
                ?>
                <div class="<?php echo e($isWide ? 'sm:col-span-2' : ''); ?>">
                    <label class="block text-sm font-medium text-indigo-200 mb-1">
                        <?php echo e($config->config_name ?? 'Config #' . $loop->index); ?>

                    </label>

                    <?php if($config->type === 'image'): ?>
                        <div class="flex items-center gap-3">
                            <?php if($config->config_value): ?>
                            <img src="<?php echo e(asset('uploads/config/' . $config->config_value)); ?>"
                                 class="w-14 h-14 rounded-xl object-cover border border-white/20"
                                 onerror="this.style.display='none'">
                            <?php endif; ?>
                            <input type="file" name="values[<?php echo e($config->config_name); ?>]" accept="image/*"
                                class="text-xs text-indigo-300 file:bg-indigo-600/50 file:text-white file:border-0 file:rounded-lg file:px-3 file:py-1.5 file:text-xs file:cursor-pointer hover:file:bg-indigo-600">
                        </div>

                    <?php elseif($config->type === 'editor'): ?>
                        <textarea id="<?php echo e($editorId); ?>"
                                  name="values[<?php echo e($config->config_name); ?>]"
                                  class="ck-editor-field"><?php echo e($config->config_value); ?></textarea>

                    <?php elseif($config->type === 'textarea'): ?>
                        <textarea name="values[<?php echo e($config->config_name); ?>]" rows="3"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 placeholder-indigo-400/50"><?php echo e($config->config_value); ?></textarea>

                    <?php elseif($config->type === 'boolean'): ?>
                        <select name="values[<?php echo e($config->config_name); ?>]"
                            class="w-full bg-indigo-900/80 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">
                            <option value="1" <?php echo e($config->config_value == '1' ? 'selected' : ''); ?>>Aktif</option>
                            <option value="0" <?php echo e($config->config_value == '0' ? 'selected' : ''); ?>>Non-aktif</option>
                        </select>

                    <?php elseif($config->type === 'number'): ?>
                        <input type="number" name="values[<?php echo e($config->config_name); ?>]"
                            value="<?php echo e($config->config_value); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400">

                    <?php elseif($config->type === 'date'): ?>
                        <input type="date" name="values[<?php echo e($config->config_name); ?>]"
                            value="<?php echo e($config->config_value); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 [color-scheme:dark]">

                    <?php elseif($config->type === 'datetime'): ?>
                        <input type="datetime-local" name="values[<?php echo e($config->config_name); ?>]"
                            value="<?php echo e($config->config_value); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 [color-scheme:dark]">

                    <?php else: ?>
                        
                        <input type="text" name="values[<?php echo e($config->config_name); ?>]"
                            value="<?php echo e($config->config_value); ?>"
                            class="w-full bg-white/10 border border-white/20 text-white rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-indigo-400 placeholder-indigo-400/50">
                    <?php endif; ?>

                    <?php if($config->config_description && $config->type !== 'editor'): ?>
                    <p class="text-xs text-indigo-400 mt-1"><?php echo e($config->config_description); ?></p>
                    <?php endif; ?>
                </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>

            <div class="mt-5 pt-4 border-t border-white/10">
                <button type="submit"
                    class="bg-indigo-600 hover:bg-indigo-700 active:bg-indigo-800 text-white rounded-xl px-5 py-2 text-sm font-medium transition flex items-center gap-2">
                    <i class="fas fa-save"></i>
                    Simpan <?php echo e($categoryName); ?>

                </button>
            </div>
        </form>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    <?php if($configs->isEmpty()): ?>
    <div class="bg-white/10 rounded-2xl p-10 text-center text-indigo-400 border border-white/20">
        <i class="fas fa-cog text-4xl mb-3 opacity-30"></i>
        <p>Belum ada konfigurasi.</p>
    </div>
    <?php endif; ?>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
<script>
(function () {
    const formEditors = new Map();

    document.querySelectorAll('.ck-editor-field').forEach(function (textarea) {
        ClassicEditor.create(textarea, {
            toolbar: {
                items: [
                    'heading', '|',
                    'bold', 'italic', 'underline', 'strikethrough', '|',
                    'bulletedList', 'numberedList', '|',
                    'outdent', 'indent', '|',
                    'link', 'blockQuote', 'insertTable', '|',
                    'undo', 'redo'
                ]
            },
            language: 'id',
        }).then(function (editor) {
            const form = textarea.closest('form');
            if (!formEditors.has(form)) {
                formEditors.set(form, []);
                form.addEventListener('submit', function () {
                    formEditors.get(form).forEach(function (entry) {
                        entry.textarea.value = entry.editor.getData();
                    });
                });
            }
            formEditors.get(form).push({ textarea: textarea, editor: editor });
        }).catch(console.error);
    });
})();
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\www\laravel\laraschool\resources\views/admin/config/index.blade.php ENDPATH**/ ?>