<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kartu Siswa - <?php echo e($siswa->nama_lengkap); ?></title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f4f6; display: flex; align-items: center; justify-content: center; min-height: 100vh; }
        .card { width: 86mm; min-height: 54mm; background: linear-gradient(135deg, #312e81 0%, #4c1d95 50%, #312e81 100%); border-radius: 10px; color: white; padding: 10px; position: relative; overflow: hidden; box-shadow: 0 8px 32px rgba(0,0,0,0.3); }
        .card::before { content: ''; position: absolute; top: -20px; right: -20px; width: 80px; height: 80px; background: rgba(255,255,255,0.05); border-radius: 50%; }
        .card::after { content: ''; position: absolute; bottom: -30px; left: -20px; width: 100px; height: 100px; background: rgba(255,255,255,0.05); border-radius: 50%; }
        .school-header { display: flex; align-items: center; gap: 6px; border-bottom: 1px solid rgba(255,255,255,0.2); padding-bottom: 6px; margin-bottom: 8px; }
        .school-logo { width: 28px; height: 28px; background: rgba(255,255,255,0.2); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 14px; flex-shrink: 0; }
        .school-name { font-size: 7px; line-height: 1.3; }
        .school-name strong { font-size: 9px; display: block; }
        .card-title { font-size: 8px; text-align: center; background: rgba(255,255,255,0.15); border-radius: 4px; padding: 2px 6px; margin-bottom: 8px; letter-spacing: 1px; text-transform: uppercase; }
        .card-body { display: flex; gap: 8px; }
        .photo { width: 28mm; height: 32mm; background: rgba(255,255,255,0.1); border-radius: 6px; border: 1px solid rgba(255,255,255,0.2); overflow: hidden; flex-shrink: 0; }
        .photo img { width: 100%; height: 100%; object-fit: cover; }
        .info { flex: 1; }
        .info-row { margin-bottom: 3px; }
        .info-row label { font-size: 6px; color: rgba(255,255,255,0.6); display: block; text-transform: uppercase; letter-spacing: 0.5px; }
        .info-row span { font-size: 8px; font-weight: bold; display: block; }
        .info-row.mono span { font-family: 'Courier New', monospace; font-size: 9px; }
        .card-footer { margin-top: 8px; padding-top: 6px; border-top: 1px solid rgba(255,255,255,0.2); display: flex; justify-content: space-between; align-items: flex-end; font-size: 7px; color: rgba(255,255,255,0.7); }
        @media print {
            body { background: white; }
            .no-print { display: none; }
            .card { box-shadow: none; }
        }
    </style>
</head>
<body>
    <div>
        <div class="card">
            <div class="school-header">
                <div class="school-logo">🏫</div>
                <div class="school-name">
                    <strong><?php echo e(config('app.name', 'LaraSchool')); ?></strong>
                    Kartu Pelajar
                </div>
            </div>
            <div class="card-title">Kartu Tanda Siswa</div>
            <div class="card-body">
                <div class="photo">
                    <img src="<?php echo e($siswa->foto ? asset('uploads/siswa/'.$siswa->foto) : 'https://ui-avatars.com/api/?name='.urlencode($siswa->nama_lengkap).'&background=4c1d95&color=fff&size=200'); ?>" alt="Foto">
                </div>
                <div class="info">
                    <div class="info-row">
                        <label>Nama Lengkap</label>
                        <span><?php echo e(strtoupper($siswa->nama_lengkap)); ?></span>
                    </div>
                    <div class="info-row mono">
                        <label>NIS</label>
                        <span><?php echo e($siswa->nis); ?></span>
                    </div>
                    <div class="info-row mono">
                        <label>NISN</label>
                        <span><?php echo e($siswa->nisn ?? '-'); ?></span>
                    </div>
                    <div class="info-row">
                        <label>Kelas</label>
                        <span><?php echo e($siswa->nama_kelas ?? '-'); ?></span>
                    </div>
                    <div class="info-row">
                        <label>Jenis Kelamin</label>
                        <span><?php echo e($siswa->jenis_kelamin == 'L' ? 'Laki-laki' : 'Perempuan'); ?></span>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <span>Berlaku Tahun Ajaran <?php echo e(date('Y')); ?>/<?php echo e(date('Y')+1); ?></span>
                <span><?php echo e($siswa->agama); ?></span>
            </div>
        </div>

        <div class="no-print" style="text-align:center; margin-top: 20px;">
            <button onclick="window.print()" style="background:#4f46e5; color:white; border:none; padding:10px 24px; border-radius:8px; cursor:pointer; font-size:14px;">
                🖨️ Cetak Kartu
            </button>
            <button onclick="window.close()" style="background:#6b7280; color:white; border:none; padding:10px 24px; border-radius:8px; cursor:pointer; font-size:14px; margin-left:8px;">
                Tutup
            </button>
        </div>
    </div>
</body>
</html>
<?php /**PATH D:\www\laravel\laraschool\resources\views/admin/siswa/kartu.blade.php ENDPATH**/ ?>