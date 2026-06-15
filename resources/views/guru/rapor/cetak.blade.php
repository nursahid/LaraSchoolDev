<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rapor - {{ $siswa->nama ?? '' }}</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; font-size: 11pt; color: #1e293b; background: white; }
        .page { width: 21cm; min-height: 29.7cm; margin: 0 auto; padding: 2cm; }
        .header { text-align: center; border-bottom: 2px solid #1e3a5f; padding-bottom: 10px; margin-bottom: 16px; }
        .header h1 { font-size: 14pt; color: #1e3a5f; font-weight: bold; }
        .header h2 { font-size: 12pt; color: #1e3a5f; }
        .header p { font-size: 9pt; color: #334155; margin-top: 2px; }
        .title-rapor { text-align: center; font-size: 13pt; font-weight: bold; color: #1e3a5f; margin: 16px 0 12px; text-transform: uppercase; letter-spacing: 1px; }
        .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 4px 16px; margin-bottom: 16px; font-size: 10pt; }
        .info-row { display: flex; gap: 4px; }
        .info-row label { width: 110px; color: #475569; }
        .info-row span { font-weight: 500; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 12px; font-size: 10pt; }
        th, td { border: 1px solid #94a3b8; padding: 5px 7px; }
        thead th { background: #1e3a5f; color: white; text-align: center; }
        tbody tr:nth-child(even) { background: #f8fafc; }
        .nilai-cell { text-align: center; }
        .footer { margin-top: 24px; display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .ttd { text-align: center; }
        .ttd-space { height: 60px; }
        .ttd p { border-top: 1px solid #1e3a5f; display: inline-block; padding-top: 4px; min-width: 140px; font-size: 10pt; }
        @media print { .no-print { display: none; } }
    </style>
</head>
<body>
    <div class="page">
        <div class="header">
            <h1>{{ \App\Models\AppConfig::get('nama_sekolah', 'LaraSchool') }}</h1>
            <h2>RAPOR SISWA</h2>
            <p>{{ \App\Models\AppConfig::get('alamat_sekolah', '') }} | Telp: {{ \App\Models\AppConfig::get('telp_sekolah', '') }}</p>
        </div>

        <div class="title-rapor">Laporan Hasil Belajar Siswa — Semester {{ $semester }}</div>

        <div class="info-grid">
            <div>
                <div class="info-row"><label>Nama Siswa</label><span>: {{ $siswa->nama }}</span></div>
                <div class="info-row"><label>NIS / NISN</label><span>: {{ $siswa->nis }} / {{ $siswa->nisn ?? '-' }}</span></div>
                <div class="info-row"><label>Kelas</label><span>: {{ $kelasInfo->nama_kelas ?? '-' }}</span></div>
            </div>
            <div>
                <div class="info-row"><label>Tahun Ajaran</label><span>: {{ $tapelInfo->nama_tapel ?? '-' }}</span></div>
                <div class="info-row"><label>Semester</label><span>: {{ $semester == 1 ? 'Satu (Ganjil)' : 'Dua (Genap)' }}</span></div>
                <div class="info-row"><label>Wali Kelas</label><span>: {{ $kelasInfo->nama_walikelas ?? '-' }}</span></div>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th style="width:5%">No</th>
                    <th style="width:40%">Mata Pelajaran</th>
                    <th style="width:12%">Harian</th>
                    <th style="width:12%">Mid</th>
                    <th style="width:12%">UAS</th>
                    <th style="width:12%">NA</th>
                    <th style="width:7%">Ket</th>
                </tr>
            </thead>
            <tbody>
                @foreach($nilaiRapor as $i => $nr)
                @php $kkm = $nr->kkm ?? 75; @endphp
                <tr>
                    <td class="nilai-cell">{{ $i + 1 }}</td>
                    <td>{{ $nr->nama_mapel }}</td>
                    <td class="nilai-cell">{{ $nr->nilai_harian ?? '-' }}</td>
                    <td class="nilai-cell">{{ $nr->nilai_mid ?? '-' }}</td>
                    <td class="nilai-cell">{{ $nr->nilai_uas ?? '-' }}</td>
                    <td class="nilai-cell" style="font-weight:bold; {{ ($nr->nilai_akhir ?? 0) >= $kkm ? 'color:#16a34a' : 'color:#dc2626' }}">
                        {{ $nr->nilai_akhir ?? '-' }}
                    </td>
                    <td class="nilai-cell" style="font-size:9pt;">{{ ($nr->nilai_akhir ?? 0) >= $kkm ? 'Tuntas' : 'Belum' }}</td>
                </tr>
                @endforeach
                @if($nilaiRapor->isEmpty())
                <tr><td colspan="7" style="text-align:center; color:#94a3b8; padding:16px;">Belum ada data nilai rapor</td></tr>
                @endif
            </tbody>
        </table>

        <div class="footer">
            <div class="ttd">
                <p>Orang Tua / Wali Murid</p>
                <div class="ttd-space"></div>
                <p style="border-top:1px solid #1e3a5f">__________________</p>
            </div>
            <div class="ttd">
                <p>{{ \App\Models\AppConfig::get('kota_sekolah', 'Kota') }}, {{ now()->locale('id')->isoFormat('D MMMM Y') }}</p>
                <p>Wali Kelas</p>
                <div class="ttd-space"></div>
                <p>{{ $kelasInfo->nama_walikelas ?? '____________________' }}</p>
            </div>
        </div>
    </div>

    <div class="no-print" style="text-align:center; padding:20px; background:#f1f5f9;">
        <button onclick="window.print()" style="background:#0ea5e9; color:white; border:none; padding:10px 24px; border-radius:8px; cursor:pointer; font-size:14px;">
            🖨️ Cetak Rapor
        </button>
        <button onclick="window.close()" style="background:#64748b; color:white; border:none; padding:10px 24px; border-radius:8px; cursor:pointer; font-size:14px; margin-left:8px;">
            Tutup
        </button>
    </div>
</body>
</html>
