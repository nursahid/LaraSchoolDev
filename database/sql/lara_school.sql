-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 15 Jun 2026 pada 09.24
-- Versi server: 11.5.2-MariaDB-log
-- Versi PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `lara_school`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'tahun_ajaran', 'Tahun ajaran 2024-2025 diperbarui', 'App\\Models\\SiklusTahunAjaran', 'updated', 10, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"1\"},\"old\":{\"status\":\"0\"}}', NULL, '2026-06-15 00:55:50', '2026-06-15 00:55:50'),
(2, 'tahun_ajaran', 'Tahun ajaran 2025-2026 diperbarui', 'App\\Models\\SiklusTahunAjaran', 'updated', 11, 'App\\Models\\User', 1, '{\"attributes\":{\"status\":\"1\"},\"old\":{\"status\":\"0\"}}', NULL, '2026-06-15 00:55:55', '2026-06-15 00:55:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE `config` (
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` text DEFAULT NULL,
  `config_core` int(1) DEFAULT 0 COMMENT '0=no, 1=yes. if config core then please do not delete from db.',
  `config_description` text DEFAULT NULL,
  `config_category` int(11) UNSIGNED DEFAULT NULL,
  `type` enum('input','textarea','editor','number','date','datetime','image','boolean') NOT NULL DEFAULT 'input',
  `config_order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data untuk tabel `config`
--

INSERT INTO `config` (`config_name`, `config_value`, `config_core`, `config_description`, `config_category`, `type`, `config_order`) VALUES
('site_name', 'SMPN 3 Mepanga Official Website', 1, 'website name', 1, 'input', 1),
('site_description', 'Sistem Administrasi dan Manajemen Sekolah Terpadu', 1, 'Deskription website', 1, 'textarea', 1),
('keywords', 'siamas, siakad, skolah, sisfo, siaselah', 1, 'Keyword Website', 1, 'input', 1),
('author', 'Nur Sahid', 1, 'Author website', 1, 'input', 1),
('favicon', '1751217808_8eb6161a57aeadc88c3a.png', 1, 'Favicon', 1, 'image', 1),
('site_logo', '1752332304_f5863c5076b0053b0b09.png', 1, 'Logo website', 1, 'image', 1),
('site_theme', 'nursahid', 1, 'Default Website Theme', 1, 'input', 1),
('landing_page_id', 'default', 1, 'Page Landing', 1, 'input', 1),
('email', 'nsahid@gmail.com', 1, 'E-mail website', 1, 'input', 1),
('page_title_separator', ' | ', 1, 'page title separator. eg. site name | page', NULL, 'input', 1),
('duplicate_login', 'off', 1, 'allow log in more than 1 place, session? set to on/off to allow/disallow.', 2, 'input', 1),
('allow_avatar', '1', 1, 'set to 1 if use avatar or set to 0 if not use it.', 2, 'boolean', 1),
('avatar_size', '200', 1, 'set file size in Kilobyte.', 2, 'input', 1),
('avatar_allowed_types', 'gif|jpg|png', 1, 'avatar allowe file types (see reference from codeigniter)\r\neg. gif|jpg|png', 2, 'input', 1),
('avatar_path', 'uploads/avatar/', 1, 'path to directory for upload avatar', 1, 'input', 1),
('member_allow_register', '1', 1, 'allow users to register', 2, 'boolean', 1),
('member_verification', '1', 1, 'member verification method.\r\n1 = verify by email\r\n2 = wait for admin verify', 2, 'boolean', 1),
('is_website', '1', 1, 'Front End Mode = Website/Sistem Skolah', 1, 'boolean', 1),
('timezone', 'Asia/Makassar', 1, 'Timezone website', NULL, 'input', 1),
('view_perpage', '25', 1, 'View Data per Halaman', NULL, 'input', 1),
('awal_nis', '10', 1, 'Seting Nilai Awal NIS', NULL, 'input', 1),
('video_profil', '1RZUjRQUBgk', 0, 'Embed Code Video Youtube', 3, 'input', 14),
('jenjang_sekolah', 'SMP', 1, 'SD => Sekolah Dasar. SMP => Sekolah Tingkap Pertama. SMA => Tingkat Atas', 3, 'input', 1),
('nama_sekolah', 'SMP Negeri 3 Mepanga', 1, 'Nama Sekolah', 3, 'input', 2),
('alamat_sekolah', 'Jl. Nusantara No. 117', 0, 'Alamat Lengkap Sekolah', 3, 'input', 7),
('telepon_sekolah', '-', 0, 'Nomor Telepon', 3, 'input', 5),
('email_sekolah', 'smpn3mepanga@gmail.com', 0, 'Alamat Email Resmi Sekolah', 3, 'input', 6),
('website_sekolah', 'www.smpn3mepanga.sch.id', 0, 'Website Sekolah', NULL, 'input', 1),
('npsn', '40206743', 0, 'NPSN', 3, 'input', 3),
('nss', '-', 0, 'Nomor Statistik Sekolah', 3, 'input', 4),
('nama_kelurahan', 'Kayuagung', 0, 'Kelurahan atau Desa', 3, 'input', 8),
('nama_kecamatan', 'Mepanga', 0, 'Kecamatan', 3, 'input', 9),
('nama_kota', 'Parigi Moutong', 0, 'Nama Kota atau Kabupaten', 3, 'input', 10),
('nama_provinsi', 'Sulawesi Tengah', 0, 'Provinsi', 3, 'input', 11),
('kodepos', '94476', 0, 'Kodepos', 3, 'input', 12),
('tentang_sekolah', '<p>SMP Negeri 3 Mepanga, merupakan sekolah ketiga di Kecamatan Mepanga. Sekolah terletak berdekatan dengan SMK Negeri 1 Mepanga. Sekolah ini berdiri sejak tahun 2010.</p>\r\n<p>SMPN 3 Mepanga adalah institusi pendidikan yang berkomitmen untuk mencetak generasi muda yang tidak hanya unggul dalam akademik, tetapi juga memiliki karakter kuat dan menjunjung tinggi nilai-nilai moral. Kami percaya bahwa pendidikan adalah kunci untuk masa depan yang lebih baik.</p>\r\n<p>Dengan fasilitas yang memadai dan tenaga pendidik profesional, kami berupaya menciptakan lingkungan belajar yang kondusif dan inspiratif bagi seluruh peserta didik.</p>', 0, 'Sekilas tentang Sekolah', 3, 'editor', 13),
('kop_atas', 'PEMERINTAH KABUPATEN PARIGI MOUTONG', 1, 'Kop Bagian Atas Surat', NULL, 'input', 1),
('kop_tengah', 'DINAS PENDIDIKAN DAN KEBUDAYAAN', 1, 'Kop Bagian Tengah Surat Menyurat', NULL, 'input', 1),
('sebutan_kepala_sekolah', 'Kepala Sekolah', 1, 'Sebutan untuk Kepala Sekolah', NULL, 'input', 1),
('kode_ujian', '2-24-18-09-133', 1, 'Kode Peserta Ujian Kelas Akhir', 4, 'input', 1),
('foto_gedung_sekolah', '1761515734_4eb0b5a926e893af12ce.jpg', 1, 'Foto Gedung Sekolah', 3, 'image', 15),
('logo_sekolah', '1751217871_84a1a4f3162e5a36c16c.png', 0, '', 4, 'image', 1),
('logo_dinas', '1751217871_e3ae2f588b344888e1cd.png', 0, '', 4, 'image', 1),
('logo_kabupaten', '1751217871_788fc75c32b2ccc3a24b.png', 0, 'logo_kabupaten.png', 4, 'image', 1),
('stempel', '1751217939_9a0713b573b9e24eebbb.png', 0, '', 4, 'image', 1),
('ttd_kepsek', '1751217871_2ccaeb319b68b0d3a0d8.png', 0, '', 4, 'image', 1),
('syarat_guna_kartu', '<ol><li>Kartu ini bisa digunakan sebagai Kartu Absensi, Perpustakaan Sekolah, dan Login CBT.<br></li><li>Kartu ini tidak bisa dipindah tangankan</li><li>Apabila ditemukan kartu ini tercecer harap menghubungi SMP Negeri 3 Mepanga</li></ol>', 0, NULL, NULL, 'editor', 1),
('midtrans_client_key', 'SB-Mid-server-PjGJiLMTdsNXh3HUZk7puB1J', 0, NULL, 5, 'input', 1),
('midtrans_server_key', 'SB-Mid-server-PjGJiLMTdsNXh3HUZk7puB1J', 0, NULL, 5, 'input', 1),
('midtrans_production', 'false', 0, NULL, 5, 'input', 1),
('send_method', 'php', 0, NULL, NULL, 'input', 1),
('smtp_port', '465', 0, NULL, NULL, 'input', 1),
('smtp_server', 'smtp.google.com', 0, NULL, NULL, 'input', 1),
('email_smtp', 'tls', 0, NULL, NULL, 'input', 1),
('email_password', 'NVRNTDlGY295WDlPWjNZRHFVbmFNZz09', 0, NULL, NULL, 'input', 1),
('api_wasap', 'saungwa', 0, NULL, NULL, 'input', 1),
('is_wasap', '1', 0, NULL, NULL, 'input', 1),
('saungwa_appkey', 'fcb86018-9b56-408f-8a5b-6293a75afba4', 0, NULL, NULL, 'input', 1),
('saungwa_authkey', 'sQNXQ7n9qCgIsXQ0At3Cppt6Q3fDaqZLtbeOiXRnKa1EUDj7Fo', 0, NULL, NULL, 'input', 1),
('watsap_device', '', 0, NULL, NULL, 'input', 1),
('watsap_apikey', '', 0, NULL, NULL, 'input', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `config_category`
--

CREATE TABLE `config_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data untuk tabel `config_category`
--

INSERT INTO `config_category` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Website', 'Kategori Website', '2025-06-29 19:05:15', '2025-06-29 19:05:15'),
(2, 'Sistem', 'Sistem', '2025-06-29 20:13:40', '2025-06-29 20:13:40'),
(3, 'Sekolah', 'Sekolah', '2025-06-29 20:17:09', '2025-06-29 20:17:09'),
(4, 'Administrasi', 'Administrasi', '2025-06-29 20:17:29', '2025-06-29 20:17:29'),
(5, 'Keuangan', 'Keuangan', '2025-06-29 20:17:38', '2025-06-29 20:17:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_ekstrakurikuler`
--

CREATE TABLE `data_ekstrakurikuler` (
  `id_ekstra` int(2) NOT NULL,
  `nama_ekstrakurikuler` varchar(50) NOT NULL,
  `kelompok` enum('wajib','tidak') NOT NULL DEFAULT 'wajib',
  `keterangan` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_ekstrakurikuler`
--

INSERT INTO `data_ekstrakurikuler` (`id_ekstra`, `nama_ekstrakurikuler`, `kelompok`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Pramuka', 'wajib', 'Pramuka', '2025-07-02 09:46:20', '2025-07-06 00:42:10'),
(2, 'Baca Tulis Al-Quran', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(3, 'Pertanian', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(4, 'Karate', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(5, 'Ju-jitsu', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(6, 'Bulu Tangkis', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(7, 'Tenis Meja', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(8, 'Karawitan', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20'),
(9, 'Catur', 'wajib', '', '2025-07-02 09:46:20', '2025-07-02 09:46:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_jamkerja`
--

CREATE TABLE `data_jamkerja` (
  `id_jamkerja` tinyint(1) NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `keterangan` enum('Masuk','Pulang') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_jamkerja`
--

INSERT INTO `data_jamkerja` (`id_jamkerja`, `start`, `finish`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, '06:30:00', '08:15:00', 'Masuk', '2025-07-02 09:47:05', '2025-07-02 09:47:05'),
(2, '12:00:00', '14:00:00', 'Pulang', '2025-07-02 09:47:05', '2025-07-02 09:47:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_jurusan`
--

CREATE TABLE `data_jurusan` (
  `id_jurusan` int(11) UNSIGNED NOT NULL,
  `id_sekolah` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `nama_jurusan` varchar(50) NOT NULL,
  `kode_jurusan` varchar(3) NOT NULL,
  `singkatan` varchar(5) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_jurusan`
--

INSERT INTO `data_jurusan` (`id_jurusan`, `id_sekolah`, `nama_jurusan`, `kode_jurusan`, `singkatan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Non Jurusan', '01', 'SMP', '2025-07-02 09:47:37', '2025-07-06 05:45:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_matapelajaran`
--

CREATE TABLE `data_matapelajaran` (
  `id_mapel` int(10) UNSIGNED NOT NULL,
  `id_sekolah` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `nama_mapel` varchar(150) NOT NULL,
  `no_urut` varchar(15) NOT NULL,
  `kategori` varchar(15) NOT NULL,
  `kurikulum` enum('k13','merdeka','mandiri') NOT NULL DEFAULT 'k13',
  `kode` varchar(15) NOT NULL,
  `kelompok` enum('A','B','C','D','E') NOT NULL DEFAULT 'A' COMMENT 'E => Life Skill',
  `keterangan` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_matapelajaran`
--

INSERT INTO `data_matapelajaran` (`id_mapel`, `id_sekolah`, `nama_mapel`, `no_urut`, `kategori`, `kurikulum`, `kode`, `kelompok`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pendidikan Agama Islam dan Budi Pekerti', '1', '', 'k13', 'PAIB', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:40'),
(2, 1, 'Pendidikan Kewarganegaraan', '2', '', 'k13', 'PKn', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:42'),
(3, 1, 'Bahasa Indonesia', '3', '', 'k13', 'BIN', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:44'),
(4, 1, 'Matematika', '4', '', 'k13', 'MTK', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:45'),
(5, 1, 'Ilmu Pengetahuan Alam', '5', '', 'k13', 'IPA', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:46'),
(6, 1, 'Ilmu Pengetahuan Sosial', '6', '', 'k13', 'IPS', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:47'),
(7, 1, 'Bahasa Inggris', '7', '', 'k13', 'BIN', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:48'),
(8, 1, 'Pendidikan Jasmani dan Kesehatan', '8', '', 'k13', 'PENJASKES', 'A', '', '2025-07-02 09:48:08', '2025-12-02 07:00:49'),
(9, 1, 'Seni Budaya', '9', '', 'k13', 'SB', 'B', '', '2025-07-02 09:48:08', '2025-12-02 07:00:51'),
(10, 1, 'Prakarya', '10', '', 'k13', 'PRA', 'B', '', '2025-07-02 09:48:08', '2025-12-02 07:00:54'),
(11, 1, 'Informatika', '11', '', 'k13', 'INFOR', 'B', '', '2025-07-02 09:48:08', '2025-12-02 07:00:56'),
(12, 1, 'Aqidah Islam', '1', '', 'mandiri', 'AQD', 'D', '??????? ?????????', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(13, 1, 'Adab Islamy', '2', '', 'mandiri', 'ADB', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(14, 1, 'Bahasa Arab', '3', '', 'mandiri', 'BAR', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(15, 1, 'Sirah Nabawi', '4', '', 'mandiri', 'SRH', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(16, 1, 'Syarah Ahadist', '5', '', 'mandiri', 'SYAR', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(17, 1, 'Ilmu Tajwid', '6', '', 'mandiri', 'TAJ', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(18, 1, 'Nahwu', '7', '', 'mandiri', 'NAH', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(19, 1, 'Sharaf', '8', '', 'mandiri', 'SARF', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(20, 1, 'Hafalan Al-Quran', '9', '', 'mandiri', 'HAFQU', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08'),
(21, 1, 'Hafalan Hadits', '10', '', 'mandiri', 'HAFD', 'D', '', '2025-07-02 09:48:08', '2025-07-02 09:48:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_tingkat`
--

CREATE TABLE `data_tingkat` (
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `tingkat` int(6) DEFAULT NULL,
  `nama_tingkat` varchar(50) NOT NULL,
  `jenjang` enum('SD','SMP','SMA') NOT NULL,
  `is_tertinggi` int(5) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `data_tingkat`
--

INSERT INTO `data_tingkat` (`id_tingkat`, `tingkat`, `nama_tingkat`, `jenjang`, `is_tertinggi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tingkat  1', 'SD', 0, '2025-07-02 09:48:35', '2025-10-21 22:30:39'),
(2, 2, 'Tingkat 2', 'SD', 0, '2025-07-02 09:48:35', '2025-10-21 22:31:49'),
(3, 3, 'Tingkat 3', 'SD', 0, '2025-07-02 09:48:35', '2025-10-21 22:39:19'),
(4, 4, 'Tingkat  4', 'SD', 0, '2025-10-21 22:39:30', '2025-10-22 13:43:53'),
(5, 5, 'Tingkat  5', 'SD', 0, '2025-10-21 22:39:38', '2025-10-22 13:44:03'),
(6, 6, 'Tingkat  6', 'SD', 1, '2025-10-21 22:39:50', '2025-10-22 13:44:05'),
(7, 7, 'Tingkat  7', 'SMP', 0, '2025-10-21 22:40:01', '2025-10-22 13:44:07'),
(8, 8, 'Tingkat 8', 'SMP', 0, '2025-10-21 22:40:14', '2025-10-22 13:44:10'),
(9, 9, 'Tingkat 9', 'SMP', 1, '2025-10-21 22:40:23', '2025-10-22 13:44:11'),
(10, 10, 'Tingkat  10', 'SMA', 0, '2025-10-21 22:40:35', '2025-10-22 13:44:14'),
(11, 11, 'Tingkat  11', 'SMA', 0, '2025-10-21 22:40:48', '2025-10-22 13:44:16'),
(12, 12, 'Tingkat  12', 'SMA', 1, '2025-10-21 22:40:59', '2025-10-22 13:44:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `files`
--

CREATE TABLE `files` (
  `id_file` int(11) NOT NULL,
  `file_type` varchar(40) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_title` text NOT NULL,
  `file_description` text DEFAULT NULL,
  `file_size` varchar(40) DEFAULT NULL,
  `file_width_height` varchar(40) DEFAULT NULL,
  `status` int(1) DEFAULT 1 COMMENT '''1=Active, 0=Inactive''',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `frontpage_menus`
--

CREATE TABLE `frontpage_menus` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `icon` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data untuk tabel `frontpage_menus`
--

INSERT INTO `frontpage_menus` (`id`, `parent_id`, `icon`, `title`, `url`, `position`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 0, '', 'Home', '/', 1, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(2, 0, '', 'Profil', '#', 2, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(3, 2, '', 'Tentang Kami', 'page/tentang-kami', 1, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(4, 2, '', 'Visi Misi', 'page/visi-misi-sekolah', 2, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(5, 2, '', 'Tentang Sekolah', 'page/tentang-sekolah', 3, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(6, 0, '', 'Personil', '#', 3, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(7, 6, '', 'Pegawai', 'personil/pegawai', 1, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(8, 6, '', 'Data Siswa', 'personil/datasiswa', 2, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51'),
(9, 0, '', 'Blog', 'blog', 4, 1, '2025-07-02 09:50:51', '2025-07-02 09:50:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `frontpage_menu_groups`
--

CREATE TABLE `frontpage_menu_groups` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data untuk tabel `frontpage_menu_groups`
--

INSERT INTO `frontpage_menu_groups` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Main Menu', '2025-07-02 09:51:17', '2025-07-02 09:51:17'),
(4, 'Bottom Menu', '2025-07-02 09:51:17', '2025-07-02 09:51:17'),
(3, 'Side Menu', '2025-07-02 09:51:17', '2025-07-02 09:51:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_jampelajaran`
--

CREATE TABLE `jadwal_jampelajaran` (
  `id_jampel` int(10) UNSIGNED NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam_ke` int(2) NOT NULL,
  `no_urut` int(2) NOT NULL,
  `jam_awal` varchar(5) NOT NULL,
  `jam_akhir` varchar(5) NOT NULL,
  `is_istirahat` enum('0','1') NOT NULL DEFAULT '0',
  `keterangan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal_jampelajaran`
--

INSERT INTO `jadwal_jampelajaran` (`id_jampel`, `hari`, `jam_ke`, `no_urut`, `jam_awal`, `jam_akhir`, `is_istirahat`, `keterangan`) VALUES
(1, 'Senin', 1, 1, '07:15', '08:00', '1', 'UPACARA'),
(2, 'Senin', 2, 2, '08:00', '08:40', '0', ''),
(3, 'Senin', 3, 3, '08:40', '09:20', '0', ''),
(4, 'Senin', 4, 4, '09:20', '10:00', '0', ''),
(5, 'Senin', 0, 5, '10:00', '10:20', '1', 'ISTIRAHAT'),
(6, 'Senin', 5, 6, '10:20', '11:00', '0', ''),
(7, 'Senin', 6, 7, '11:00', '11:40', '0', ''),
(8, 'Senin', 7, 8, '11:40', '12:20', '0', ''),
(9, 'Senin', 0, 9, '12:20', '12:30', '1', 'Shalat Zhuhur Berjamaah'),
(10, 'Selasa', 0, 1, '07:00', '07:15', '1', 'Apel Pagi'),
(11, 'Selasa', 1, 2, '07:15', '07:55', '0', ''),
(12, 'Selasa', 2, 3, '07:55', '08:35', '0', ''),
(13, 'Selasa', 3, 4, '08:35', '09:15', '0', ''),
(14, 'Selasa', 4, 5, '09:15', '09:55', '0', ''),
(15, 'Selasa', 0, 6, '09:55', '10:15', '1', 'ISTIRAHAT'),
(16, 'Selasa', 5, 7, '10:15', '10:55', '0', ''),
(17, 'Selasa', 6, 8, '10:55', '11:35', '0', ''),
(18, 'Selasa', 7, 9, '11:35', '12:15', '0', ''),
(19, 'Selasa', 0, 10, '12:15', '12:45', '1', 'Shalat Zhuhur Berjamaah'),
(20, 'Rabu', 0, 1, '07:00', '07:15', '1', 'Apel Pagi'),
(21, 'Rabu', 1, 2, '07:15', '07:55', '0', ''),
(22, 'Rabu', 2, 3, '07:55', '08:35', '0', ''),
(23, 'Rabu', 3, 4, '08:35', '09:15', '0', ''),
(24, 'Rabu', 4, 5, '09:15', '09:55', '0', ''),
(25, 'Rabu', 0, 6, '09:55', '10:15', '1', 'ISTIRAHAT'),
(26, 'Rabu', 5, 7, '10:15', '10:55', '0', ''),
(27, 'Rabu', 6, 8, '10:55', '11:35', '0', ''),
(28, 'Rabu', 7, 9, '11:35', '12:15', '0', ''),
(29, 'Rabu', 0, 10, '12:15', '12:45', '1', 'Shalat Zhuhur Berjamaah'),
(30, 'Kamis', 0, 1, '07:00', '07:15', '1', 'Apel Pagi'),
(31, 'Kamis', 1, 2, '07:15', '07:55', '0', ''),
(32, 'Kamis', 2, 3, '07:55', '08:35', '0', ''),
(33, 'Kamis', 3, 4, '08:35', '09:15', '0', ''),
(34, 'Kamis', 4, 5, '09:15', '09:55', '0', ''),
(35, 'Kamis', 0, 6, '09:55', '10:15', '1', 'ISTIRAHAT'),
(36, 'Kamis', 5, 7, '10:15', '10:55', '0', ''),
(37, 'Kamis', 6, 8, '10:55', '11:35', '0', ''),
(38, 'Kamis', 7, 9, '11:35', '12:15', '0', ''),
(39, 'Kamis', 0, 10, '12:15', '12:45', '1', 'Shalat Zhuhur Berjamaah'),
(40, 'Jumat', 1, 1, '07:15', '08:00', '1', 'JUM\'AT PAGI CERIA'),
(41, 'Jumat', 2, 2, '08:00', '08:40', '0', ''),
(42, 'Jumat', 3, 3, '08:40', '09:20', '0', ''),
(43, 'Jumat', 0, 4, '09:20', '09:40', '1', 'ISTIRAHAT'),
(44, 'Jumat', 4, 5, '09:40', '10:20', '0', ''),
(45, 'Jumat', 5, 6, '10:20', '11:00', '0', ''),
(46, 'Jumat', 6, 7, '11:00', '12:00', '0', ''),
(47, 'Sabtu', 0, 1, '07:00', '07:15', '1', 'Apel Pagi'),
(48, 'Sabtu', 1, 2, '07:15', '07:55', '0', ''),
(49, 'Sabtu', 2, 3, '07:55', '08:35', '0', ''),
(50, 'Sabtu', 3, 4, '08:35', '09:15', '0', ''),
(51, 'Sabtu', 4, 5, '09:15', '09:55', '0', ''),
(52, 'Sabtu', 0, 6, '09:55', '10:15', '1', 'ISTIRAHAT'),
(53, 'Sabtu', 5, 7, '10:15', '10:55', '0', ''),
(54, 'Sabtu', 6, 8, '10:55', '11:35', '0', ''),
(55, 'Sabtu', 7, 9, '11:35', '12:15', '0', ''),
(56, 'Sabtu', 0, 10, '12:15', '12:45', '1', 'Shalat Zhuhur Berjamaah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_pelajaran`
--

CREATE TABLE `jadwal_pelajaran` (
  `id_jadwal` int(10) UNSIGNED NOT NULL,
  `id_jampel` int(10) UNSIGNED NOT NULL,
  `id_kelas` int(10) UNSIGNED NOT NULL,
  `id_mapel` int(10) UNSIGNED NOT NULL,
  `id_pegawai` int(10) UNSIGNED NOT NULL,
  `tapel` int(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jadwal_pelajaran`
--

INSERT INTO `jadwal_pelajaran` (`id_jadwal`, `id_jampel`, `id_kelas`, `id_mapel`, `id_pegawai`, `tapel`, `semester`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 2, 40, 8, 9, 11, 1, '', '2025-10-19 12:39:52', '2025-10-19 12:39:52'),
(2, 3, 40, 8, 9, 11, 1, '', '2025-10-19 12:39:56', '2025-10-19 12:39:56'),
(3, 4, 40, 8, 9, 11, 1, '', '2025-10-19 12:40:02', '2025-10-19 12:40:02'),
(4, 6, 40, 1, 16, 11, 1, '', '2025-10-19 12:52:37', '2025-10-19 12:52:37'),
(5, 7, 40, 1, 16, 11, 1, '', '2025-10-19 12:52:42', '2025-10-19 12:52:42'),
(6, 8, 40, 1, 16, 11, 1, '', '2025-10-19 12:52:47', '2025-10-19 12:52:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban_siswa`
--

CREATE TABLE `jawaban_siswa` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `pertanyaan_id` int(11) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_assesmen`
--

CREATE TABLE `jenis_assesmen` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data untuk tabel `jenis_assesmen`
--

INSERT INTO `jenis_assesmen` (`id`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Minat Bakat', 'Assesmen untuk mengetahui minat dan bakat siswa', '2025-07-07 02:52:07', NULL),
(2, 'Kondisi Keluarga', 'Assesmen kondisi lingkungan keluarga siswa', '2025-07-07 02:52:07', NULL),
(3, 'Literasi dan Numerasi', 'Tes kemampuan dasar literasi dan numerasi', '2025-07-07 02:52:07', '2025-07-07 18:56:53'),
(4, 'Gaya Belajar', 'Deteksi gaya belajar siswa (visual, auditori, kinestetik)', '2025-07-07 02:52:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_minat_bakat`
--

CREATE TABLE `kategori_minat_bakat` (
  `id` int(11) NOT NULL,
  `kategori` enum('minat','bakat') NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data untuk tabel `kategori_minat_bakat`
--

INSERT INTO `kategori_minat_bakat` (`id`, `kategori`, `nama`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'minat', 'Seni Musik', 'Minat dalam bidang musik dan alat musik', '2025-07-07 02:53:43', NULL),
(2, 'minat', 'Seni Lukis', 'Minat dalam bidang menggambar dan melukis', '2025-07-07 02:53:43', NULL),
(3, 'minat', 'Olahraga', 'Minat dalam berbagai cabang olahraga', '2025-07-07 02:53:43', NULL),
(4, 'minat', 'Sains', 'Minat dalam ilmu pengetahuan dan penelitian', '2025-07-07 02:53:43', NULL),
(5, 'bakat', 'Musikal', 'Bakat alami dalam bidang musik', '2025-07-07 02:53:43', NULL),
(6, 'bakat', 'Linguistik', 'Bakat dalam bahasa dan linguistik', '2025-07-07 02:53:43', NULL),
(7, 'bakat', 'Matematis', 'Bakat dalam logika dan matematika', '2025-07-07 02:53:43', NULL),
(8, 'bakat', 'Kinestetik', 'Bakat dalam gerak tubuh dan olahraga', '2025-07-07 02:53:43', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelulusan_log`
--

CREATE TABLE `kelulusan_log` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `log` varchar(50) NOT NULL,
  `tgl` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kompetensi`
--

CREATE TABLE `kompetensi` (
  `id_kompetensi` int(6) UNSIGNED NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `id_mapel` int(6) NOT NULL,
  `id_guru` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `jenis` int(11) NOT NULL COMMENT '1. Pengetahuan, 2. Keterampilan, 3. Spiritual, 4. Sosial',
  `no_kd` varchar(5) NOT NULL,
  `nama_kd` text NOT NULL,
  `bobot` int(2) NOT NULL,
  `semester` int(2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kompetensi`
--

INSERT INTO `kompetensi` (`id_kompetensi`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_mapel`, `id_guru`, `jenis`, `no_kd`, `nama_kd`, `bobot`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 11, 6, 1, '3.1', 'mengenal fitur lanjut browser untuk pencarian dengan kata kunci dan kriteria yang lebih kompleks', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(2, 1, 1, 9, 11, 6, 1, '3.2', 'mengenal fitur aplikasi CMS (Content Management System, pengelola konten web, sedapat mungkin yang berupa freeware), dan pemakaiannya untuk membuat blog', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(3, 1, 1, 9, 11, 6, 1, '3.3.1', 'memahami berbagai tipe data dalam aplikasi perkantoran: teks, data numerik, gambar, dan format file aplikasi perkantoran', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(4, 1, 1, 9, 11, 6, 1, '3.3.2', 'memahami pengolahan data menggunakan fitur lanjut aplikasi perkantoran   terkait   data:   filter, pengelompokan, memproses dengan kondisi, membuat rumus kompleks', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(5, 1, 1, 9, 11, 6, 2, '4.1.', 'melakukan pencarian informasi, memilah dan memilih informasi yang relevan, serta mempersempit hasil pencarian ', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(6, 1, 1, 9, 11, 6, 2, '4.2.', 'membuat blog untuk menunjang aktivitas siswa, contohnya membuat logbook kegiatan terkait sekolah.', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(7, 1, 1, 9, 11, 6, 2, '4.3.', ' studi kasus pengolahan data yang membutuhkan pengolahan kompleks dengan menggunakan aplikasi perkantoran sebagai tools.', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(8, 1, 1, 8, 11, 6, 1, '3.1.', 'memahami konsep algoritma dan sejarahnya, memahami fungsi dan manfaat algoritma dan kehidupan sehari-hari', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(9, 1, 1, 8, 11, 6, 1, '3.2', 'mendisposisikan berfikir komputasional yang diperlukan pada berbagai bidang', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(10, 1, 1, 8, 11, 6, 1, '4.1', 'menerapkan berfikir komputasi melalui aplikasi visual pemrograman blok', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(11, 1, 1, 8, 11, 6, 1, '4.2', 'menuliskan sekumpulan instruksi dengan menggunakan sekumpulan kosakata terbatas atau symbol dalam format pseudocode', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(12, 1, 1, 8, 11, 6, 2, '3.3', 'memahami konsep lembar kerja pengolah data text untuk representasi data', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(13, 1, 1, 8, 11, 6, 2, '3.4', 'memahami konsep lembar kerja pengolah presentasi', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(14, 1, 1, 8, 11, 6, 2, '4.3.', 'membuat sebuah artikel sederhana dengan menggunakan aplikasi pengolah data text', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(15, 1, 1, 7, 11, 6, 1, '3.1.', 'mendeskripsikan komponen, fungsi, dan cara kerja komputer', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(16, 1, 1, 7, 11, 6, 1, '3.2.', 'memahami fungsi dan manfaat tata kelola arsip digital', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(17, 1, 1, 7, 11, 6, 1, '3.3.', ' mengenal bagaimana perangkat keras, sistem operasi dan aplikasi berfungsi', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(18, 1, 1, 7, 11, 6, 1, '3.4', 'memahami browser, jenis-jenis dan fungsinya, menerapkan penggunaan browser salah satunya sebagai media membuka mesin pencari', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(19, 1, 1, 7, 11, 6, 1, '3.5', 'memahami cara kerja dan penggunaan mesin pencari di internet', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(20, 1, 1, 7, 11, 6, 2, '4.1.', 'menerapkan penggunaan dasar komputer', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(21, 1, 1, 7, 11, 6, 2, '4.2.', 'menerapkan penggunaan dasar komputer yang meliputi tata kelola folder dan file secara terstruktur', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(22, 1, 1, 7, 11, 6, 2, '4.3', 'membuat sebuah alamat email dan cara penggunaannya untuk komunikasi melalui internet', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(23, 1, 1, 7, 11, 6, 2, '4.3.2', ' menjelaskan bermacam-macam interaksi pengguna dengan piranti melalui antar muka standar', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(24, 1, 1, 7, 11, 6, 2, '4.4.1', ' merancang dan membuat sebuah lembar kerja yang mengandung data, rumus dan hasil pemakaian beberapa fungsi untuk menyelesaikan suatu kasus', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(25, 1, 1, 7, 11, 6, 2, '4.4.2', ' menginterpretasi data dari sebuah lembar kerja', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(28, 1, 1, 9, 11, 0, 0, '3.6', ' Ujicoba lagi', 0, 2, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(30, 1, 1, 7, 11, 0, 0, '4.4.3', 'eksplorasi data di internet', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39'),
(31, 1, 1, 8, 11, 0, 0, '4.4', 'membuat sebuah presentasi sederhana dengan menggunakan aplikasi pengolah presentasi', 0, 1, '2025-07-02 09:49:50', '2025-10-30 06:07:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel_tingkat`
--

CREATE TABLE `mapel_tingkat` (
  `id_mapeltingkat` int(10) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `mapel_tingkat`
--

INSERT INTO `mapel_tingkat` (`id_mapeltingkat`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_mapel`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 1, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(2, 1, 1, 9, 2, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(3, 1, 1, 9, 3, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(4, 1, 1, 9, 4, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(5, 1, 1, 9, 5, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(6, 1, 1, 9, 6, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(7, 1, 1, 9, 7, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(8, 1, 1, 9, 9, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(9, 1, 1, 9, 10, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(10, 1, 1, 9, 11, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(11, 1, 1, 7, 1, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(12, 1, 1, 7, 2, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(15, 1, 1, 7, 5, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(16, 1, 1, 7, 6, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(17, 1, 1, 7, 7, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(18, 1, 1, 7, 3, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(19, 1, 1, 7, 4, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(20, 1, 1, 7, 9, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(21, 1, 1, 7, 8, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(22, 1, 1, 8, 1, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(23, 1, 1, 8, 2, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(24, 1, 1, 8, 3, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(25, 1, 1, 8, 4, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(26, 1, 1, 8, 5, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(27, 1, 1, 8, 6, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(28, 1, 1, 8, 7, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(29, 1, 1, 8, 8, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(30, 1, 1, 8, 9, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(31, 1, 1, 8, 10, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(32, 1, 1, 8, 11, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(33, 1, 1, 9, 8, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(42, 1, 1, 7, 10, '2025-07-02 09:50:14', '2025-10-22 08:03:59'),
(43, 1, 1, 7, 11, '2025-07-02 09:50:14', '2025-10-22 08:03:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_group_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `route_name` varchar(150) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `permission_name` varchar(150) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `menu_group_id`, `parent_id`, `title`, `route_name`, `icon`, `permission_name`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Dashboard', 'admin.dashboard', 'fa-gauge', 'dashboard.view', 1, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(2, 2, NULL, 'Tahun Ajaran', 'admin.tahunajaran.index', NULL, 'tahunajaran.view', 2, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(3, 2, NULL, 'Kelas', 'admin.kelas.index', NULL, 'kelas.view', 3, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(4, 2, NULL, 'Mata Pelajaran', 'admin.mapel.index', NULL, 'mapel.view', 4, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(5, 2, NULL, 'Semester', NULL, NULL, 'semester.view', 5, 1, '2026-06-14 15:42:51', '2026-06-14 23:59:34'),
(6, 2, NULL, 'Tingkat', NULL, NULL, 'tingkat.view', 6, 1, '2026-06-14 15:42:51', '2026-06-14 23:59:55'),
(7, 2, NULL, 'Jurusan', NULL, NULL, 'jurusan.view', 7, 1, '2026-06-14 15:42:51', '2026-06-15 00:00:01'),
(8, 3, NULL, 'Data Siswa', 'admin.siswa.index', NULL, 'siswa.view', 8, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(9, 3, NULL, 'Prestasi', 'admin.prestasi.index', NULL, 'prestasi.view', 9, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(10, 3, NULL, 'Ekstrakurikuler', 'admin.ekstrakurikuler.index', NULL, 'ekstrakurikuler.view', 10, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(11, 3, NULL, 'Mutasi', NULL, NULL, 'mutasi.view', 11, 1, '2026-06-14 15:42:51', '2026-06-15 00:00:12'),
(12, 3, NULL, 'Alumni', NULL, NULL, 'alumni.view', 12, 1, '2026-06-14 15:42:51', '2026-06-15 00:00:30'),
(13, 4, NULL, 'Data Pegawai', 'admin.pegawai.index', NULL, 'pegawai.view', 13, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(14, 4, NULL, 'Guru Mata Pelajaran', NULL, NULL, 'guru_mapel.view', 14, 1, '2026-06-14 15:42:51', '2026-06-15 00:00:38'),
(15, 5, NULL, 'Jadwal', 'admin.jadwal.index', NULL, 'jadwal.view', 15, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(16, 5, NULL, 'Absensi', 'admin.absensi.index', NULL, 'absensi.view', 16, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(17, 5, NULL, 'Nilai', 'admin.nilai.index', NULL, 'nilai.view', 17, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(18, 5, NULL, 'Rapor', NULL, NULL, 'rapor.view', 18, 1, '2026-06-14 15:42:51', '2026-06-15 00:00:49'),
(19, 6, NULL, 'Laporan Akademik', NULL, NULL, 'laporan.akademik', 19, 1, '2026-06-14 15:42:51', '2026-06-15 00:00:59'),
(20, 7, NULL, 'User', 'admin.users.index', NULL, 'user.view', 20, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(21, 7, NULL, 'Konfigurasi', 'admin.config.index', NULL, 'config.view', 21, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51'),
(22, 7, NULL, 'Role', NULL, NULL, 'role.view', 22, 1, '2026-06-14 15:42:51', '2026-06-15 00:01:14'),
(23, 7, NULL, 'Permission', NULL, NULL, 'permission.view', 23, 1, '2026-06-14 15:42:51', '2026-06-15 00:01:25'),
(24, 8, NULL, 'Log Aktivitas', 'admin.aktivitas.index', NULL, 'log.view', 24, 1, '2026-06-14 15:42:51', '2026-06-14 15:42:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `name`, `description`, `icon`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'Dashboard', 'heroicon-o-home', 1, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(2, 'master_sekolah', 'Master Sekolah', 'heroicon-o-building-office', 2, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(3, 'siswa', 'Manajemen Siswa', 'heroicon-o-users', 3, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(4, 'pegawai', 'Manajemen Guru', 'heroicon-o-user-group', 4, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(5, 'akademik', 'Akademik', 'heroicon-o-academic-cap', 5, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(6, 'laporan', 'Laporan', 'heroicon-o-document-chart-bar', 6, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(7, 'pengaturan', 'Pengaturan', 'heroicon-o-cog-6-tooth', 7, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09'),
(8, 'maintenance', 'Maintenance', 'heroicon-o-wrench-screwdriver', 8, 1, '2026-06-14 15:18:09', '2026-06-14 15:18:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_12_143255_add_role_to_users_table', 1),
(5, '2026_05_12_143514_create_permission_tables', 1),
(6, '2026_05_12_144252_add_two_factor_columns_to_users_table', 1),
(7, '2026_05_12_144253_create_passkeys_table', 1),
(8, '2026_05_12_144415_add_2fa_columns_to_users_table', 1),
(9, '2026_05_12_144544_create_user_otps_table', 1),
(10, '2026_05_12_144917_create_personal_access_tokens_table', 1),
(11, '2026_06_16_144901_add_description_to_roles_permissions', 1),
(12, '2026_06_15_001322_create_activity_log_table', 2),
(13, '2026_06_15_001323_add_event_column_to_activity_log_table', 2),
(14, '2026_06_15_001324_add_batch_uuid_column_to_activity_log_table', 2),
(15, '2026_06_15_091314_add_id_walikelas_to_siklus_kelasrombel_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(9, 'App\\Models\\User', 3),
(6, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `module_managers`
--

CREATE TABLE `module_managers` (
  `id` int(11) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `admin_menu` text DEFAULT NULL,
  `module_image` varchar(150) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `purchase_code` varchar(255) NOT NULL,
  `is_installed` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `installed_at` datetime DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `deactivated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `module_managers`
--

INSERT INTO `module_managers` (`id`, `slug`, `name`, `description`, `author`, `version`, `admin_menu`, `module_image`, `icon`, `purchase_code`, `is_installed`, `is_active`, `installed_at`, `activated_at`, `deactivated_at`, `created_at`, `updated_at`) VALUES
(1, 'blog', 'Blog', 'Modul Blog - deskripsi singkat.', 'Your Name', '1.0.0', '{\"label\":\"Posts & Categories\",\"url\":\"admin\\/blog\",\"icon\":\"fas fa-newspaper\"}', '', 'fas fa-newspaper text-red', '', 1, 1, '2025-07-07 16:26:37', NULL, NULL, '2025-07-07 16:26:37', '2025-07-07 16:26:37'),
(2, 'psb', 'Psb', 'Modul Psb - deskripsi singkat.', 'Nur Sahid', '1.0.0', '{\"label\":\"Manajemen PSB\",\"url\":\"admin\\/psb\",\"icon\":\"fas fa-users\"}', '', 'fas fa-users', '', 1, 1, '2026-04-08 13:45:46', NULL, NULL, '2026-04-08 13:45:46', '2026-04-08 13:45:46'),
(4, 'banksoal', 'Banksoal', 'Modul Banksoal - Manajemen Banksoal.', 'Nur Sahid', '1.0.0', '{\"label\":\"Banksoal\",\"url\":\"admin\\/banksoal\",\"icon\":\"fas fa-question text-red\"}', '', '', '', 1, 1, '2025-10-26 22:15:10', NULL, NULL, '2025-10-26 22:15:10', '2025-10-26 22:15:10'),
(5, 'ujian', 'Ujian', 'Modul Ujian - Manajemen Ujian.', 'Nur Sahid', '1.0.0', '{\"label\":\"Manajemen Ujian\",\"url\":\"admin\\/ujian\",\"icon\":\"fas fa-newspaper text-green\"}', '', 'fas fa-newspaper text-green', '', 1, 1, '2025-12-01 06:29:48', NULL, NULL, '2025-12-01 06:29:48', '2025-12-01 06:29:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_riwayatnilai` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL DEFAULT 1,
  `id_jenispenilaian` int(10) DEFAULT NULL,
  `jenis_ujian` enum('harian','mid','semester','praktik','produk','projek','portofolio') NOT NULL DEFAULT 'harian',
  `tugas_kuis` enum('tugas','kuis','manual') NOT NULL DEFAULT 'manual',
  `id_mapel` int(11) NOT NULL,
  `id_kompetensi` int(11) NOT NULL COMMENT 'Kompetensi Mapel',
  `id_tugas` int(11) NOT NULL,
  `id_kuis` int(11) NOT NULL,
  `tgl_penilaian` varchar(10) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `guru` int(11) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `nilai` int(10) NOT NULL,
  `huruf` varchar(150) NOT NULL,
  `terbilang` varchar(150) NOT NULL,
  `deskripsi` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_riwayatnilai`, `id_sekolah`, `id_jenispenilaian`, `jenis_ujian`, `tugas_kuis`, `id_mapel`, `id_kompetensi`, `id_tugas`, `id_kuis`, `tgl_penilaian`, `id_kelas`, `id_siswa`, `guru`, `nip`, `tapel`, `semester`, `nilai`, `huruf`, `terbilang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 326, 6, '198112312014061004', 10, 1, 73, 'Tujuh Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:25'),
(2, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 327, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:24'),
(3, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 336, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:22'),
(4, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 341, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:19'),
(5, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 345, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:17'),
(6, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 347, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:16'),
(7, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 401, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:15'),
(8, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 352, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:11'),
(9, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 353, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:09'),
(10, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 354, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:08'),
(11, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 402, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:07'),
(12, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 360, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:06'),
(13, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 361, 6, '198112312014061004', 10, 1, 69, 'Enam Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:01'),
(14, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 366, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:02:00'),
(15, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 381, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:58'),
(16, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 513, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:54'),
(17, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 385, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:52'),
(18, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 386, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:50'),
(19, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 387, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:48'),
(20, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 392, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:46'),
(21, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 394, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:43'),
(22, 1, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-10', 33, 395, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:01:37'),
(23, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 316, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', 'susulan', '2025-07-02 09:58:11', '2025-07-04 17:02:40'),
(24, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 320, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', 'susulan', '2025-07-02 09:58:11', '2025-07-04 17:03:29'),
(25, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 323, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:31'),
(26, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 406, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:32'),
(27, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 324, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:33'),
(28, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 325, 6, '198112312014061004', 10, 1, 0, '', '', 'Terlambat', '2025-07-02 09:58:11', '2025-07-04 17:03:35'),
(29, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 329, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:34'),
(30, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 331, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:37'),
(31, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 333, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:41'),
(32, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 337, 6, '198112312014061004', 10, 1, 0, '', '', 'Terlambat', '2025-07-02 09:58:11', '2025-07-04 17:03:43'),
(33, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 343, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:44'),
(34, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 344, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:45'),
(35, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 349, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:46'),
(36, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 404, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:47'),
(37, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 405, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:48'),
(38, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 362, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:50'),
(39, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 368, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:51'),
(40, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 372, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:57'),
(41, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 375, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:58'),
(42, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 383, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:03:59'),
(43, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 403, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:00'),
(44, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-12', 32, 389, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:01'),
(45, 2, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 317, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:02'),
(46, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 318, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:11'),
(47, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 319, 6, '198112312014061004', 10, 1, 79, 'Tujuh Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:16'),
(48, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 321, 6, '198112312014061004', 10, 1, 79, 'Tujuh Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:17'),
(49, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 322, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:19'),
(50, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 328, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:05:08'),
(51, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 335, 6, '198112312014061004', 10, 1, 89, 'Delapan Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:05:07'),
(52, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 340, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:05:06'),
(53, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 342, 6, '198112312014061004', 10, 1, 79, 'Tujuh Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:05:02'),
(54, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 346, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:05:01'),
(55, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 350, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:05:00'),
(56, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 351, 6, '198112312014061004', 10, 1, 69, 'Enam Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:58'),
(57, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 355, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:57'),
(58, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 357, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:56'),
(59, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 358, 6, '198112312014061004', 10, 1, 79, 'Tujuh Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:55'),
(60, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 363, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:51'),
(61, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 364, 6, '198112312014061004', 10, 1, 79, 'Tujuh Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:49'),
(62, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 365, 6, '198112312014061004', 10, 1, 89, 'Delapan Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:48'),
(63, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 367, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:47'),
(64, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 370, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:46'),
(65, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 376, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:42'),
(66, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 377, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:30'),
(67, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 378, 6, '198112312014061004', 10, 1, 74, 'Tujuh Puluh Empat', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:29'),
(68, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 388, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:27'),
(69, 3, 1, NULL, 'harian', 'manual', 11, 2, 0, 0, '2024-09-13', 31, 390, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:26'),
(70, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 414, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:37'),
(71, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 512, 6, '198112312014061004', 10, 1, 0, '', '', 'Menunda-nunda tugas', '2025-07-02 09:58:11', '2025-07-04 17:04:38'),
(72, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 421, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:04:39'),
(73, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 422, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:48'),
(74, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 424, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:47'),
(75, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 426, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:46'),
(76, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 430, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:45'),
(77, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 431, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:44'),
(78, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 435, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:43'),
(79, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 437, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:41'),
(80, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 439, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:40'),
(81, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 440, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:36'),
(82, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 597, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:35'),
(83, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 445, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:33'),
(84, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 453, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:32'),
(85, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 458, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:31'),
(86, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 598, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:30'),
(87, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 470, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:29'),
(88, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 471, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:24'),
(89, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 483, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:23'),
(90, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 484, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:18'),
(91, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 486, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:17'),
(92, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 493, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:15'),
(93, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 497, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:14'),
(94, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 500, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:12'),
(95, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 501, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:10'),
(96, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 504, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:09'),
(97, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 505, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:08'),
(98, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 506, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:07'),
(99, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 507, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:06'),
(100, 4, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-11', 34, 510, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:06:04'),
(101, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 414, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:07:16'),
(102, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 512, 6, '198112312014061004', 10, 1, 0, '', '', 'Tidak praktek', '2025-07-02 09:58:11', '2025-07-04 17:09:43'),
(103, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 421, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:42'),
(104, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 422, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:41'),
(105, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 424, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:40'),
(106, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 426, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:38'),
(107, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 430, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:34'),
(108, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 431, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:33'),
(109, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 435, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:31'),
(110, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 437, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:30'),
(111, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 439, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:29'),
(112, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 440, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:26'),
(113, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 597, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:24'),
(114, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 445, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:23'),
(115, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 453, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:22'),
(116, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 458, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:21'),
(117, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 598, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:14'),
(118, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 470, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:11'),
(119, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 471, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:10'),
(120, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 483, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:09'),
(121, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 484, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:08'),
(122, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 486, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:07'),
(123, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 493, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:06'),
(124, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 497, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:04'),
(125, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 500, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:01'),
(126, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 501, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:09:00'),
(127, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 504, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:08:56'),
(128, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 505, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:08:54'),
(129, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 506, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:08:53'),
(130, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 507, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:07:34'),
(131, 5, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-18', 34, 510, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:07:27'),
(132, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 407, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:15'),
(133, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 409, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:12'),
(134, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 411, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:10'),
(135, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 413, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:09'),
(136, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 417, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:08'),
(137, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 418, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:07'),
(138, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 427, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:06'),
(139, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 428, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:02'),
(140, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 429, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:01'),
(141, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 433, 6, '198112312014061004', 10, 1, 55, 'Lima Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:00'),
(142, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 434, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:59'),
(143, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 436, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:58'),
(144, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 443, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:53'),
(145, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 444, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:52'),
(146, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 446, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:51'),
(147, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 447, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:50'),
(148, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 449, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:49'),
(149, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 450, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:48'),
(150, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 452, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:46'),
(151, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 454, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:45'),
(152, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 455, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:44'),
(153, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 457, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:40'),
(154, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 461, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:39'),
(155, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 464, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:38'),
(156, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 473, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:37'),
(157, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 474, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:36'),
(158, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 477, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:35'),
(159, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 479, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:34'),
(160, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 481, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:33'),
(161, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 482, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:32'),
(162, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 487, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:31'),
(163, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 496, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(164, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 502, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:27'),
(165, 6, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-12', 36, 508, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:11:25'),
(166, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 414, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:20'),
(167, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 512, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:32'),
(168, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 421, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:31'),
(169, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 422, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:30'),
(170, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 424, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:26'),
(171, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 426, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:25'),
(172, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 430, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:24'),
(173, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 431, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:23'),
(174, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 435, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:21'),
(175, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 437, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:17'),
(176, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 439, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:16'),
(177, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 440, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:15'),
(178, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 597, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:14'),
(179, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 445, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:13'),
(180, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 453, 6, '198112312014061004', 10, 1, 63, 'Enam Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:12'),
(181, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 458, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:11'),
(182, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 598, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:10'),
(183, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 470, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:09'),
(184, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 471, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:08'),
(185, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 483, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:04'),
(186, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 484, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:03'),
(187, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 486, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:02'),
(188, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 493, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:13:01'),
(189, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 497, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:57'),
(190, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 500, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:56'),
(191, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 501, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:55'),
(192, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 504, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:54'),
(193, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 505, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:53'),
(194, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 506, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:29'),
(195, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 507, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:27'),
(196, 7, 1, NULL, 'praktik', 'manual', 11, 9, 0, 0, '2024-09-25', 34, 510, 6, '198112312014061004', 10, 1, 63, 'Enam Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:34'),
(197, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 514, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:37'),
(198, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 519, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:38'),
(199, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 522, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:39'),
(200, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 520, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:41'),
(201, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 524, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:46'),
(202, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 525, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:12:48'),
(203, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 534, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:16:04'),
(204, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 535, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:16:02'),
(205, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 542, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:16:02'),
(206, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 544, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:16:01'),
(207, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 546, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:16:00'),
(208, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 552, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:55'),
(209, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 553, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:54'),
(210, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 554, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:53'),
(211, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 559, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:52'),
(212, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 560, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:51'),
(213, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 562, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:50'),
(214, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 563, 6, '198112312014061004', 10, 1, 89, 'Delapan Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:49'),
(215, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 564, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:47'),
(216, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 566, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:47'),
(217, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 569, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:46'),
(218, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 578, 6, '198112312014061004', 10, 1, 50, 'Lima Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:45'),
(219, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 582, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:41'),
(220, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 583, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:40'),
(221, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 586, 6, '198112312014061004', 10, 1, 89, 'Delapan Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:39'),
(222, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 592, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:37'),
(223, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 594, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:36'),
(224, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 37, 596, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:35'),
(225, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 517, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:34'),
(226, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 521, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:28'),
(227, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 523, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:27'),
(228, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 526, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:26'),
(229, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 529, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:25'),
(230, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 530, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:24'),
(231, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 538, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:23'),
(232, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 539, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:22'),
(233, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 543, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:21'),
(234, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 545, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:20'),
(235, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 550, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:15'),
(236, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 551, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:14'),
(237, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 555, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:11'),
(238, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 556, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:12'),
(239, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 570, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:13'),
(240, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 571, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:07'),
(241, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 572, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:06'),
(242, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 573, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:05'),
(243, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 574, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:04'),
(244, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 575, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:03'),
(245, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 581, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:02'),
(246, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 585, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:15:01'),
(247, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 588, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:59'),
(248, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 589, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:54'),
(249, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 591, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:53'),
(250, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 593, 6, '198112312014061004', 10, 1, 88, 'Delapan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:52'),
(251, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 38, 595, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:51'),
(252, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 515, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:50'),
(253, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 516, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:49'),
(254, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 518, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:48'),
(255, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 527, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:47'),
(256, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 528, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:44'),
(257, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 531, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:42'),
(258, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 532, 6, '198112312014061004', 10, 1, 66, 'Enam Puluh Enam', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:41'),
(259, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 533, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:41'),
(260, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 536, 6, '198112312014061004', 10, 1, 66, 'Enam Puluh Enam', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:39'),
(261, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 537, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:38'),
(262, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 540, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:37'),
(263, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 541, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:36'),
(264, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 547, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:35'),
(265, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 548, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:32'),
(266, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 549, 6, '198112312014061004', 10, 1, 100, 'Seratus ', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:31'),
(267, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 557, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:30'),
(268, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 558, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:29'),
(269, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 561, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:28'),
(270, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 565, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:26'),
(271, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 568, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:25'),
(272, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 567, 6, '198112312014061004', 10, 1, 67, 'Enam Puluh Tujuh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:24'),
(273, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 576, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:21'),
(274, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 577, 6, '198112312014061004', 10, 1, 67, 'Enam Puluh Tujuh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:20'),
(275, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 579, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:19'),
(276, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 580, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:18');
INSERT INTO `nilai` (`id_nilai`, `id_riwayatnilai`, `id_sekolah`, `id_jenispenilaian`, `jenis_ujian`, `tugas_kuis`, `id_mapel`, `id_kompetensi`, `id_tugas`, `id_kuis`, `tgl_penilaian`, `id_kelas`, `id_siswa`, `guru`, `nip`, `tapel`, `semester`, `nilai`, `huruf`, `terbilang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(277, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 584, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:04'),
(278, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 587, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:02'),
(279, 8, 1, NULL, 'harian', 'manual', 11, 15, 0, 0, '2024-09-21', 39, 590, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:01'),
(280, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 408, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:06'),
(281, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 410, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:07'),
(282, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 415, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:08'),
(283, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 416, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:09'),
(284, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 419, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:11'),
(285, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 420, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:12'),
(286, 9, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 423, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-04 17:14:13'),
(287, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 425, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(288, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 438, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(289, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 442, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(290, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 448, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(291, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 451, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(292, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 456, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(293, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 459, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(294, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 460, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(295, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 462, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(296, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 463, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(297, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 356, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(298, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 465, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(299, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 467, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(300, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 468, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(301, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 469, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(302, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 475, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(303, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 476, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(304, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 478, 6, '198112312014061004', 10, 1, 67, 'Enam Puluh Tujuh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(305, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 485, 6, '198112312014061004', 10, 1, 67, 'Enam Puluh Tujuh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(306, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 490, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(307, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 491, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(308, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 492, 6, '198112312014061004', 10, 1, 67, 'Enam Puluh Tujuh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(309, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 494, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(310, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 495, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(311, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 498, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(312, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 499, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(313, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 503, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(314, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 509, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(315, 0, 1, NULL, 'harian', 'manual', 11, 8, 0, 0, '2024-09-30', 35, 511, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(316, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 408, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(325, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 442, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(329, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 459, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(331, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 462, 6, '198112312014061004', 10, 1, 89, 'Delapan Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(332, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 463, 6, '198112312014061004', 10, 1, 0, '', '', 'Keluar', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(334, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 465, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(337, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 469, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(338, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 475, 6, '198112312014061004', 10, 1, 73, 'Tujuh Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(341, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 485, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(343, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 491, 6, '198112312014061004', 10, 1, 78, 'Tujuh Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(344, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 492, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(345, 0, 1, NULL, 'harian', 'manual', 11, 12, 0, 0, '2024-09-23', 35, 494, 6, '198112312014061004', 10, 1, 78, 'Tujuh Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(352, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 317, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', 'Judul dan paragraf', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(353, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 318, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', 'kurang', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(354, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 319, 6, '198112312014061004', 10, 1, 82, 'Delapan Puluh Dua', '', 'Judul dan jumlah', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(355, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 321, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', 'judul dan artikel copas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(356, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 322, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', 'Judul', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(357, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 328, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(358, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 335, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(359, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 340, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(360, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 342, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(361, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 346, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(362, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 350, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(363, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 351, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(364, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 355, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(365, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 357, 6, '198112312014061004', 10, 1, 83, 'Delapan Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(366, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 358, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak kerja', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(367, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 363, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', 'tidak serius', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(368, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 364, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(369, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 365, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(370, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 367, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(371, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 370, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(372, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 376, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(373, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 377, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(374, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 378, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(375, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 388, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(376, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-09-30', 31, 390, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(377, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 316, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(378, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 320, 6, '198112312014061004', 10, 1, 40, 'Empat Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(379, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 323, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(380, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 406, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(381, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 324, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(382, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 325, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(383, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 329, 6, '198112312014061004', 10, 1, 98, 'Sembilan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(384, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 331, 6, '198112312014061004', 10, 1, 98, 'Sembilan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(385, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 333, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(386, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 337, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(387, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 343, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(388, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 344, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(389, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 349, 6, '198112312014061004', 10, 1, 82, 'Delapan Puluh Dua', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(390, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 404, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(391, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 405, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(392, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 362, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(393, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 368, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(394, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 372, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(395, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 375, 6, '198112312014061004', 10, 1, 0, '', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(396, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 383, 6, '198112312014061004', 10, 1, 98, 'Sembilan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(397, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 403, 6, '198112312014061004', 10, 1, 95, 'Sembilan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(398, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-02', 32, 389, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(399, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 326, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(400, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 327, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(401, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 336, 6, '198112312014061004', 10, 1, 88, 'Delapan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(402, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 341, 6, '198112312014061004', 10, 1, 88, 'Delapan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(403, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 345, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(404, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 347, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(405, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 401, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(406, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 352, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(407, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 353, 6, '198112312014061004', 10, 1, 87, 'Delapan Puluh Tujuh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(408, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 354, 6, '198112312014061004', 10, 1, 89, 'Delapan Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(409, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 402, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(410, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 360, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(411, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 361, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(412, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 366, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(413, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 381, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(414, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 513, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(415, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 385, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(416, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 386, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(417, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 387, 6, '198112312014061004', 10, 1, 98, 'Sembilan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(418, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 392, 6, '198112312014061004', 10, 1, 90, 'Sembilan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(419, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 394, 6, '198112312014061004', 10, 1, 0, '', '', 'tidak mengerjakan tugas', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(420, 0, 1, NULL, 'projek', 'manual', 11, 6, 0, 0, '2024-10-03', 33, 395, 6, '198112312014061004', 10, 1, 98, 'Sembilan Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(422, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 410, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(423, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 415, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(424, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 416, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(425, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 419, 6, '198112312014061004', 10, 1, 69, 'Enam Puluh Sembilan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(426, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 420, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(427, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 423, 6, '198112312014061004', 10, 1, 78, 'Tujuh Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(428, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 425, 6, '198112312014061004', 10, 1, 78, 'Tujuh Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(429, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 438, 6, '198112312014061004', 10, 1, 78, 'Tujuh Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(431, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 448, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(432, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 451, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(433, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 456, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(435, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 460, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(438, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 356, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(440, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 467, 6, '198112312014061004', 10, 1, 85, 'Delapan Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(441, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 468, 6, '198112312014061004', 10, 1, 75, 'Tujuh Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(444, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 476, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(445, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 478, 6, '198112312014061004', 10, 1, 73, 'Tujuh Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(447, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 490, 6, '198112312014061004', 10, 1, 80, 'Delapan Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(451, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 495, 6, '198112312014061004', 10, 1, 70, 'Tujuh Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(452, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 498, 6, '198112312014061004', 10, 1, 60, 'Enam Puluh', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(453, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 499, 6, '198112312014061004', 10, 1, 63, 'Enam Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(454, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 503, 6, '198112312014061004', 10, 1, 63, 'Enam Puluh Tiga', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(455, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 509, 6, '198112312014061004', 10, 1, 65, 'Enam Puluh Lima', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(456, 0, 1, NULL, 'praktik', 'manual', 11, 10, 0, 0, '2024-09-23', 35, 511, 6, '198112312014061004', 10, 1, 68, 'Enam Puluh Delapan', '', '', '2025-07-02 09:58:11', '2025-07-02 09:58:11'),
(485, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 514, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(486, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 519, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(487, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 522, 6, '198112312014061004', 10, 1, 77, 'B', 'tujuh puluh tujuh', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(488, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 520, 6, '198112312014061004', 10, 1, 50, 'D', 'lima puluh', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(489, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 524, 6, '198112312014061004', 10, 1, 77, 'B', 'tujuh puluh tujuh', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(490, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 525, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(491, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 534, 6, '198112312014061004', 10, 1, 75, 'B', 'tujuh puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(492, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 535, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(493, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 542, 6, '198112312014061004', 10, 1, 58, 'C', 'lima puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(494, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 544, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(495, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 546, 6, '198112312014061004', 10, 1, 78, 'B', 'tujuh puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(496, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 552, 6, '198112312014061004', 10, 1, 78, 'B', 'tujuh puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(497, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 553, 6, '198112312014061004', 10, 1, 50, 'D', 'lima puluh', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(498, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 554, 6, '198112312014061004', 10, 1, 58, 'C', 'lima puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(499, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 559, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(500, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 560, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(501, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 562, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(502, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 563, 6, '198112312014061004', 10, 1, 75, 'B', 'tujuh puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(503, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 564, 6, '198112312014061004', 10, 1, 78, 'B', 'tujuh puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(504, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 566, 6, '198112312014061004', 10, 1, 78, 'B', 'tujuh puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(505, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 569, 6, '198112312014061004', 10, 1, 58, 'C', 'lima puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(506, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 578, 6, '198112312014061004', 10, 1, 50, 'D', 'lima puluh', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(507, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 582, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(508, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 583, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(509, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 586, 6, '198112312014061004', 10, 1, 55, 'C', 'lima puluh lima', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(510, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 592, 6, '198112312014061004', 10, 1, 58, 'C', 'lima puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(511, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 594, 6, '198112312014061004', 10, 1, 50, 'D', 'lima puluh', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26'),
(512, 20, 1, 0, 'harian', 'manual', 11, 1, 0, 0, '2025-07-04', 37, 596, 6, '198112312014061004', 10, 1, 78, 'B', 'tujuh puluh delapan', '', '2025-07-04 16:41:26', '2025-07-04 16:41:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_bobot`
--

CREATE TABLE `nilai_bobot` (
  `id_bobot` int(11) UNSIGNED NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) UNSIGNED NOT NULL,
  `id_mapel` int(10) UNSIGNED NOT NULL,
  `kkm_sekolah` int(3) NOT NULL,
  `bobot_harian` int(2) NOT NULL,
  `bobot_mid` int(2) NOT NULL,
  `bobot_akhir` int(2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nilai_bobot`
--

INSERT INTO `nilai_bobot` (`id_bobot`, `id_sekolah`, `id_tingkat`, `id_jurusan`, `id_mapel`, `kkm_sekolah`, `bobot_harian`, `bobot_mid`, `bobot_akhir`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 1, 11, 75, 50, 25, 25, '2025-07-04 17:57:19', '2025-10-22 13:05:14'),
(6, 1, 8, 1, 11, 70, 50, 25, 25, '2025-11-17 22:55:02', '2025-11-17 22:57:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_rapor`
--

CREATE TABLE `nilai_rapor` (
  `id_nilai_rapor` int(10) NOT NULL,
  `id_sekolah` int(11) NOT NULL DEFAULT 1,
  `jenis` enum('pengetahuan','keterampilan') NOT NULL DEFAULT 'pengetahuan',
  `metode` enum('manual','sistem') NOT NULL DEFAULT 'manual',
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `kurikulum` enum('k13','merdeka','mandiri') NOT NULL DEFAULT 'k13',
  `wali` int(11) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `nilai` int(11) NOT NULL,
  `predikat` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_riwayat`
--

CREATE TABLE `nilai_riwayat` (
  `id_riwayatnilai` int(10) NOT NULL,
  `id_sekolah` int(11) NOT NULL DEFAULT 1,
  `id_jenispenilaian` int(10) DEFAULT NULL,
  `jenis_ujian` enum('harian','mid','semester','praktik','produk','projek','portofolio') NOT NULL DEFAULT 'harian',
  `id_mapel` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_kompetensi` int(11) NOT NULL,
  `guru` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `tgl_penilaian` varchar(10) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `nilai_riwayat`
--

INSERT INTO `nilai_riwayat` (`id_riwayatnilai`, `id_sekolah`, `id_jenispenilaian`, `jenis_ujian`, `id_mapel`, `id_kelas`, `id_kompetensi`, `guru`, `nip`, `tgl_penilaian`, `deskripsi`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'harian', 11, 33, 2, 6, '198112312014061004', '2024-09-10', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(2, 1, NULL, 'harian', 11, 32, 2, 6, '198112312014061004', '2024-09-12', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(3, 1, NULL, 'harian', 11, 31, 2, 6, '198112312014061004', '2024-09-13', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(4, 1, NULL, 'harian', 11, 34, 8, 6, '198112312014061004', '2024-09-11', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(5, 1, NULL, 'praktik', 11, 34, 9, 6, '198112312014061004', '2024-09-18', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(6, 1, NULL, 'harian', 11, 36, 8, 6, '198112312014061004', '2024-09-12', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(7, 1, NULL, 'praktik', 11, 34, 9, 6, '198112312014061004', '2024-09-25', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(8, 1, NULL, 'harian', 11, 37, 15, 6, '198112312014061004', '2024-09-21', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(9, 1, NULL, 'harian', 11, 38, 15, 6, '198112312014061004', '2024-09-21', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(10, 1, NULL, 'harian', 11, 39, 15, 6, '198112312014061004', '2024-09-21', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(11, 1, NULL, 'harian', 11, 35, 8, 6, '198112312014061004', '2024-09-30', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(12, 1, NULL, 'harian', 11, 35, 12, 6, '198112312014061004', '2024-09-23', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(13, 1, NULL, 'projek', 11, 31, 6, 6, '198112312014061004', '2024-09-30', 'Judul dan paragraf', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(14, 1, NULL, 'projek', 11, 32, 6, 6, '198112312014061004', '2024-10-02', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(15, 1, NULL, 'projek', 11, 33, 6, 6, '198112312014061004', '2024-10-03', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(16, 1, NULL, 'praktik', 11, 35, 10, 6, '198112312014061004', '2024-09-23', '', 10, 1, '2025-07-02 09:59:36', '2025-07-02 09:59:36'),
(17, 1, 0, 'harian', 11, 37, 1, 6, '198112312014061004', '2025-07-04', 'Ujian Semester 1 TEST', 10, 1, '2025-07-04 15:10:21', '2025-07-04 15:10:21'),
(18, 1, 0, 'harian', 11, 37, 1, 6, '198112312014061004', '2025-07-04', 'Ujian Semester 1 TEST', 10, 1, '2025-07-04 15:12:49', '2025-07-04 15:12:49'),
(19, 1, 0, 'harian', 11, 37, 1, 6, '198112312014061004', '2025-07-03', 'ssfsf', 10, 1, '2025-07-04 15:13:12', '2025-07-04 15:13:12'),
(20, 1, 0, 'harian', 11, 37, 1, 6, '198112312014061004', '2025-07-04', '', 10, 1, '2025-07-04 15:33:36', '2025-07-04 15:33:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orangtua`
--

CREATE TABLE `orangtua` (
  `id_orangtua` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `agama` varchar(20) NOT NULL DEFAULT 'Islam',
  `alamat` text NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(150) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `hp` varchar(12) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `sebagai` enum('ayah','ibu','wali') NOT NULL,
  `pekerjaan` varchar(150) NOT NULL,
  `token` varchar(100) NOT NULL,
  `activation_code` varchar(50) NOT NULL,
  `forgotten_password_code` varchar(50) NOT NULL,
  `forgotten_password_time` datetime NOT NULL,
  `remember_code` varchar(50) NOT NULL,
  `active` int(1) NOT NULL DEFAULT 1,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `orangtua`
--

INSERT INTO `orangtua` (`id_orangtua`, `username`, `password`, `email`, `nama`, `kelamin`, `tempat_lahir`, `tgl_lahir`, `agama`, `alamat`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `hp`, `foto`, `sebagai`, `pekerjaan`, `token`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'maliki', '$2a$08$X4u0XcBvvXl5QaTrF2/EP.IzUKJGOIFc9GDsdTspEgTSlFBQ5qEY.', '', 'Maliki', 'L', 'Tinombala', '2004-05-11', 'Islam', 'Lorong 3 Kayuagung', '', '', '', '', '98686745445', '', 'ayah', 'Petani', 'qaixkxW', '', '', '0000-00-00 00:00:00', '', 1, '2023-11-24 01:42:22', '0000-00-00 00:00:00', '2024-03-30 19:46:46'),
(2, 'malika', '$2a$08$qcMvWzzoMI4U8aU/Bku/yeUCNcplnZx1Cl2Z3tQ296j4msG4ODvWG', '', 'Malika', 'P', 'Tinombala', '2006-05-18', 'Islam', 'Lorong 3 Kayuagung', '', '', '', '', '98686745445', '', 'ibu', 'URT', 'BDn8Gol', '', '', '0000-00-00 00:00:00', '', 1, '2023-05-09 05:42:24', '0000-00-00 00:00:00', '2024-03-30 19:50:34'),
(3, '', '', 'abdulagus@gmail.com', 'Abdul Agus', 'L', 'Tinombala', '1976-04-02', 'Islam', '', '', '', '', '', '', '', 'ayah', 'Petani', '', '', '', '0000-00-00 00:00:00', '', 1, '2024-03-31 07:03:54', '0000-00-00 00:00:00', '2024-03-31 07:03:54'),
(4, 'abdulagustaman', '$2a$08$981R8dIeWNomoL8OBc0dMeCBUjpIyafEIkRs9l11gazjnY2wKHcsW', 'agus@gmauil.com', 'Abdul Agustaman', 'L', 'Tinombala', '1976-04-02', '', '', '', '', '', '', '', '', 'ayah', 'Petani', 'ioOzrG5', '', '', '0000-00-00 00:00:00', '', 1, '2024-03-31 07:19:09', '0000-00-00 00:00:00', '2024-04-14 15:57:56'),
(5, 'aminahagustina', '$2a$08$ZldXqyVygyZHSWTR1e0Hw.LawFnxilFtExwYtitQS6Chset/pKlSK', 'agus@gmauil.com', 'Aminah Agustina', 'P', 'Kayuagung', '1980-04-17', '', '', '', '', '', '', '', '', 'ibu', 'URT', 'OZsvpPF', '', '', '0000-00-00 00:00:00', '', 1, '2024-03-31 07:19:09', '0000-00-00 00:00:00', '2024-04-14 15:58:01'),
(6, 'jainuri', '$2a$08$yOlo//mbFWcz5EnkgAmBq.1hFG7pSheK00Jqh8bwH6K.Z1Heb1YvK', '', 'Jainuri', 'L', 'Kayuagung', '1965-05-10', 'Islam', '', '', '', '', '', '', '', 'ayah', 'Petani', '8YnvTJH', '', '', '0000-00-00 00:00:00', '', 1, '2024-05-08 05:58:36', '0000-00-00 00:00:00', '2024-05-08 06:58:36'),
(7, 'sitirokanah', '$2a$08$h71auXmPauDEalEF3jAuN.NbXVxgsdVWixeO1.7wPcxkJ6zLZMtPi', '', 'Siti Rokanah', 'L', 'Kayuagung', '1970-05-10', 'Islam', '', '', '', '', '', '', '', 'ibu', 'URT', '3Yr5wJH', '', '', '0000-00-00 00:00:00', '', 1, '2024-05-08 00:14:36', '0000-00-00 00:00:00', '2024-05-08 00:14:52'),
(8, '', '$2y$10$ySI1hQbeXs58Bxdrb8S1JeqIYTi1PJrBPhUIVj/flIdW0LKyxRi1G', 'ekopramono@gmail.com', 'Eko Pramono', 'L', '', NULL, 'Islam', '', '', '', '', '', '082192029998', '', 'ayah', 'Petani', '', '', '', '0000-00-00 00:00:00', '', 1, '2025-07-06 01:07:56', '2025-07-07 01:07:56', '2025-07-05 17:07:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `passkeys`
--

CREATE TABLE `passkeys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `credential_id` varchar(255) NOT NULL,
  `credential` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`credential`)),
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(10) UNSIGNED NOT NULL,
  `id_sekolah` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `nip` varchar(50) DEFAULT NULL,
  `nuptk` varchar(50) DEFAULT NULL,
  `nik` varchar(30) DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `gelar_depan` varchar(4) NOT NULL,
  `gelar_belakang` varchar(4) NOT NULL,
  `kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jabatan` int(10) NOT NULL DEFAULT 4,
  `pendidikan` varchar(20) NOT NULL,
  `status_kepegawaian` varchar(100) DEFAULT 'Guru Honor',
  `gol_ruang` varchar(10) NOT NULL DEFAULT 'III/a',
  `pangkat` varchar(50) NOT NULL DEFAULT 'Guru Muda',
  `agama` varchar(20) NOT NULL DEFAULT 'Islam',
  `alamat` text NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `dusun` varchar(20) NOT NULL,
  `kelurahan` varchar(20) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kabupaten` varchar(50) NOT NULL,
  `provinsi` varchar(150) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `hp` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tugas_tambahan` varchar(50) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `status_kawin` varchar(50) NOT NULL DEFAULT 'Belum Kawin',
  `nama_sutri` varchar(100) NOT NULL,
  `pekerjaan_sutri` varchar(20) NOT NULL,
  `npwp` varchar(20) NOT NULL,
  `nama_npwp` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `id_sekolah`, `nip`, `nuptk`, `nik`, `nama`, `gelar_depan`, `gelar_belakang`, `kelamin`, `tempat_lahir`, `tgl_lahir`, `jabatan`, `pendidikan`, `status_kepegawaian`, `gol_ruang`, `pangkat`, `agama`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `hp`, `email`, `tugas_tambahan`, `nama_ibu`, `status_kawin`, `nama_sutri`, `pekerjaan_sutri`, `npwp`, `nama_npwp`, `foto`, `token`, `password`, `id_user`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '196610261988032006', '8358744646300003', '', 'Rini Suwandari', '', '', 'P', 'Kulonprogo', '1966-10-26', 1, 'S1', 'PNS', 'IV/b', '', 'Kristen', 'Kotaraya', '', '', '', 'Kotaraya Selatan', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', '', '', '', 'Belum Kawin', '', '', '', '', '', '', '', NULL, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(2, 1, '196412162000121002', '2548742644200003', '', 'Budi Sulistyono', '', '', 'L', 'Banyuwangi', '1964-12-16', 2, 'S1', 'PNS', 'IV/b', '', 'Islam', 'Kotaraya Selatan', '', '', '', 'Kotaraya Selatan', 'Mepanga', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'budisulistyono62@guru.smp.belajar.id', '', 'Ramlia', 'Belum Kawin', '', '', '', '', 'budi_sulistyono.png', '196412162000121002', 'cb00fe30a6503e80e9767839d3f3aba30da940bd9218c7742ff17041e996d9f7', 10, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(3, 1, '198304152011012014', '2747761662300122', '', 'Santi Sudiarti', '', '', 'P', 'Kotaraya', '1983-04-15', 4, 'S1', 'PNS', 'III/d', '', 'Islam', 'Jl. Nusantara No. 110', '', '', '', 'Kayuagung', 'Mepanga', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '0852 4111 99', 'santisudiarti54@guru.smp.belajar.id', 'Wali Kelas', '', 'Kawin', '', '', '', '', 'santisudiarti.png', '', '', 7, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(4, 1, '198203172011012012', '7649760661210152', '', 'Fatimah, S.pd', '', '', 'P', 'Palasa Tangki', '1982-03-17', 4, 'S1', 'PNS', 'III/c', '', 'Islam', '', '', '', '', '', '', '', '', '', '', 'fatimahspd73@guru.smp.belajar.id', '', '', 'Kawin', '', '', '', '', '', '198203172011012012', '0370271f6f11c06750f102651bb94c7f0510085c17c95f8b8bc609b2eb1d5e30', 4, 1, '2025-07-02 10:00:39', '2025-07-10 14:29:25'),
(5, 1, '198802162011012012', '1548766666220002', '', 'Ismawati', '', '', 'P', 'Kayuagung', '1988-02-16', 5, 'S1', 'PNS', 'III/c', '', 'Islam', 'Tinombala', '', '', '', 'Tinombala', 'Ongka Malino', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'ismawati62@guru.smp.belajar.id', '', '', 'Belum Kawin', '', '', '', '', 'ismawati.png', '198802162011012012', '89509e415601f94d633f97edd4cf7eba1dd9086220a3c7109f4f7a6a7b3ef0e6', 12, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(6, 1, '198112312014061004', '0563759661200053', '7208123112810002', 'Nur Sahid', '', '', 'L', 'Kotaraya', '1981-12-31', 4, 'S2', 'PNS', 'III/b', '', 'Islam', 'Kotaraya', '', '', '', 'Kotaraya', 'Mepanga', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', '', 'Wali Kelas', 'Sulastri', 'Belum Kawin', '', '', '', '', 'nur_sahid_1751521680.jpg', '198112312014061004', '4ffa3d7c97558fa67a8117aa89a5977866240568dc574c236a8ef7c98cd1a56c', 2, 1, '2025-07-02 10:00:39', '2025-07-09 15:13:27'),
(7, 1, '198007162014112003', '5048758659230123', '', 'Suprapti', '', '', 'P', 'Tinombala', '1980-07-16', 4, 'S1', 'PNS', 'III/b', '', 'Islam', '', '', '', '', '', '', '', '', '', '', 'suprapti67@guru.smp.belajar.id', '', '', 'Belum Kawin', '', '', '', '', 'suprapti.jpg', '198007162014112003', '627a5de48dcaa6622dbe0eebc3e632aefbb8c029216d64324c0e750550f30bcc', 13, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(8, 1, '199509302020121004', '9262773674130053', '', 'Wyn. Adhi Kresnanda Mahardika', '', '', 'L', 'Palu', '1995-09-30', 4, 'S1', 'PNS', 'III/a', '', 'Islam', 'Kayu Agung', '', '', '', 'Kayuagung', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'wayanmahardika09@guru.smp.belajar.id', 'Wali Kelas', '', 'Kawin', '', '', '', '', 'wyn_adhikresnan.png', '199509302020121004', '40f8cf74d3788d7e30145ea175e77435a20e9eade2bb260e3e920b7f6d32f86a', 9, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(9, 1, '199112112017081001', '5149765670130593', '', 'Muhammad Irwan', '', '', 'L', 'Lombong', '1991-11-12', 4, 'S1', 'PNS', 'III/b', '', 'Islam', 'Kayuagung', '', '', '', 'Kayuagung', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'muhammadirwan12@guru.smp.belajar.id', 'Wali Kelas', '', 'Kawin', '', '', '', '', '', '199112112017081001', '6be08fab445db6b5cb7e77a0474a67ac964b93365342351b3aa588ba958dd34a', 14, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(10, 1, '199708152022212010', '0147775676230063', '', 'Dewi Sri Haryati', '', '', 'P', 'Luwuk', '1997-08-15', 4, 'S1', 'PPPK', 'IX', '', 'Islam', 'Kayuagung', '', '', '', 'Kayuagung', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'dewiharyati58@guru.smp.belajar.id', '', '', 'Belum Kawin', '', '', '', '', '', '199708152022212010', '107de85d10cc57b086771a26b4bf8287b29e59370bafb79928df9b11a8559fd8', NULL, 1, '2025-07-02 10:00:39', '2026-04-11 07:56:28'),
(11, 1, '199603142022211002', '6646774675130102', '', 'Yustin Gayuh Nugroho', '', '', 'P', 'Tinombala', '1996-03-14', 4, 'S2', 'PPPK', 'IX', '', 'Kristen', 'Tinombala', '', '', '', 'Tinombala Induk', 'Ongka Malino', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'yustinnugroho43@guru.smp.belajar.id', 'Wali Kelas', '', 'Belum Kawin', '', '', '', '', '', '199603142022211002', 'ac345d2d57d3e8aa19c6acd02647848e0ff306c7ea8de11d1d148c26e5c49f4d', 16, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(12, 1, '198505272022211009', '8859763664130232', '', 'Safriyadi', '', '', 'L', 'Masamba', '1985-05-27', 4, 'S1', 'PPPK', 'IX', '', 'Islam', 'Maranti', '', '', '', 'Maranti', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'safriadi751@guru.smp.belajar.id', 'Wali Kelas', '', 'Belum Kawin', '', '', '', '', '', '198505272022211009', 'b1201ce53a405faa764309b247a1375d60d4e8ae478ce64808d34117f64abc5b', 17, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(13, 1, '197907022022212018', '6034757658130113', '', 'Yulce Stan Lepa', '', '', 'P', 'Ongka', '1979-07-02', 4, 'S1', 'PPPK', 'IX', '', 'Kristen', 'Tinombala', '', '', '', 'Tinombala', 'Ongka Malino', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'yulcelepa27@guru.smp.belajar.id', 'Wali Kelas', 'Ramlia', 'Kawin', '', '', '', '', '', '197907022022212018', 'c9ce3b55c26f26aac02c6f0a6422cd46f608acff4189842b167e66056d1b54c4', 18, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(14, 1, '198807012022212021', '6033766668230083', '', 'Rosida', '', '', 'P', 'Kayu Agung', '1988-07-01', 4, 'S1', 'PPPK', 'IX', '', 'Islam', 'Kayuagung', '', '', '', 'Kayuagung', 'Mepanga', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'rosida17@guru.smp.belajar.id', '', '', 'Kawin', '', '', '', '', '', '198807012022212021', '5ce4b94c40387e10e51ad69416ab3c44e16bf7d5b82dfc271b4cceee67a338fc', 15, 1, '2025-07-02 10:00:39', '2026-04-11 07:56:28'),
(15, 1, '19960314010016', '7646774675130122', '', 'Salimudin', '', '', 'L', 'Kayuagung', '1996-03-14', 4, 'S1', 'PPPK', '', '', 'Islam', '', '', '', '', '', '', '', '', '', '', 'salimudin43@guru.smp.belajar.id', '', '', 'Kawin', '', '', '', '', '', '19960314010016', '46cd3a030a96614b108a1e630dd2ae09c0a6f285d8ccdf4b9384bc13e3ed4901', 6, 1, '2025-07-02 10:00:39', '2025-10-11 07:44:19'),
(16, 1, '19830328010011', '4660761662130162', '', 'Hajar Sulis', '', '', 'L', 'Kayuagung', '1983-03-28', 4, 'S1', 'PPPK', '', '', 'Islam', '', '', '', '', '', '', '', '', '', '', 'hajarsulis83@guru.smp.belajar.id', '', '', 'Belum Kawin', '', '', '', '', 'hajarsulis.jpg', '19830328010011', '54aa3146d409f18cfae51682a564c39aaaff9641fda591ad1777f39f731a04be', 5, 1, '2025-07-02 10:00:39', '2025-10-11 07:39:01'),
(17, 1, '19670614010013', '1946745644200002', '', 'Sarwan, S.pd', '', '', 'L', 'Ponorogo', '1967-06-14', 4, 'S1', 'Guru Honor Sekolah', '', '', 'Islam', '', '', '', '', '', '', '', '', '', '', 'sarwanspd46@guru.smp.belajar.id', '', '', 'Belum Kawin', '', '', '', '', '', '19670614010013', '', NULL, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(18, 1, '19980715010023', '', '', 'Rahmadi', '', '', 'L', 'Kayu Agung', '1998-07-15', 4, 'S1', 'Guru Honor Sekolah', '', '', 'Islam', 'Kayu Agung', '', '', '', 'Kayuagung', 'Mepanga', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'rahmadi573@guru.smp.belajar.id', 'Wali Kelas', '', 'Belum Kawin', '', '', '', '', '', '19980715010023', '2610fdba13975f66837327c05543fba9e61c6229d9a970922d4c88c305b2887b', 22, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(19, 1, '19840901010019', '', '', 'Stevanli Mayampoh', '', '', 'L', 'Poso', '1984-09-01', 10, 'SMA Sederajat', 'Tenaga Honor Sekolah', '', '', 'Islam', 'Jl. Dahlia No. 1', '', '', '', 'Kayuagung', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', 'stevanlimayampoh19@admin.smp.belajar.id', 'Pengelola Data Dapodik', '', 'Kawin', '', '', '', '', '', '19840901010019', '6de4684bd63ae13050a51bab95616d187de9248e2a92aca0f7b31e409f8b0989', 23, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(20, 1, '19901107020020', '', '', 'Wiwik Yurianti', '', '', 'P', 'Kayuagung', '1990-11-07', 7, 'SMA Sederajat', 'Tenaga Honor Sekolah', '', '', 'Islam', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Belum Kawin', '', '', '', '', '', '19901107020020', '', NULL, 1, '2025-07-02 10:00:39', '2025-07-02 10:00:39'),
(21, 1, '19901107020025', '', '', 'Dhea Puspita Dewi', '', '', 'P', 'Kayu Agung', '1990-11-07', 12, 'SMA Sederajat', 'Tenaga Honor Sekolah', '', '', 'Islam', 'Kayuagung', '', '', '', 'Kayuagung', 'Mepanga', 'Kab. Parigi Moutong', 'Sulawesi Tengah', '94476', '', '', '', '', 'Belum Kawin', '', '', '', '', 'dhea_puspita_dewi_1752071589.jpg', '19901107020025', '', NULL, 1, '2025-07-02 10:00:39', '2025-07-09 14:33:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_mapel`
--

CREATE TABLE `pegawai_mapel` (
  `id_pegawai_mapel` int(10) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pegawai_mapel`
--

INSERT INTO `pegawai_mapel` (`id_pegawai_mapel`, `id_sekolah`, `id_pegawai`, `id_mapel`, `id_tingkat`, `id_jurusan`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 0, 9, 1, 7, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(2, 1, 9, 0, 9, 1, 7, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(3, 1, 8, 0, 7, 1, 7, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(4, 1, 8, 0, 8, 1, 7, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(5, 1, 9, 0, 7, 1, 7, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(6, 1, 8, 11, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(7, 1, 8, 11, 8, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(8, 1, 8, 11, 9, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(11, 1, 2, 2, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(12, 1, 16, 7, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(13, 1, 3, 7, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(14, 1, 4, 6, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(15, 1, 6, 1, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(16, 1, 7, 5, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(17, 1, 9, 5, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(18, 1, 10, 1, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(19, 1, 12, 8, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(20, 1, 14, 10, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(21, 1, 15, 9, 7, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(30, 1, 3, 7, 8, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(31, 1, 4, 6, 8, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(32, 1, 6, 1, 8, 1, 8, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(33, 1, 8, 5, 9, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(34, 1, 8, 5, 8, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(35, 1, 8, 5, 7, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(36, 1, 4, 6, 8, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(37, 1, 4, 6, 7, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(38, 1, 6, 11, 7, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(39, 1, 6, 11, 8, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(40, 1, 6, 11, 9, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(41, 1, 7, 1, 8, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(42, 1, 7, 1, 9, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(43, 1, 9, 8, 9, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(44, 1, 9, 8, 8, 1, 9, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(45, 1, 6, 11, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(46, 1, 6, 11, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(47, 1, 6, 11, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(48, 1, 8, 5, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(49, 1, 11, 4, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(50, 1, 11, 4, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(51, 1, 18, 2, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(52, 1, 18, 2, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(53, 1, 16, 1, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(54, 1, 16, 1, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(55, 1, 7, 1, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(56, 1, 7, 1, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(57, 1, 2, 2, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(58, 1, 2, 2, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(59, 1, 11, 4, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(60, 1, 4, 7, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(61, 1, 9, 8, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(63, 1, 3, 6, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(64, 1, 8, 5, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(65, 1, 8, 5, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(66, 1, 14, 5, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(67, 1, 10, 3, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(68, 1, 10, 3, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(69, 1, 15, 3, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(70, 1, 15, 3, 7, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(71, 1, 4, 7, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(72, 1, 4, 7, 9, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(73, 1, 3, 6, 8, 1, 10, 1, '2025-07-02 10:00:54', '2025-10-22 08:03:59'),
(74, 1, 6, 11, 7, 1, 11, 1, '2025-10-04 07:01:25', '2025-10-22 08:03:59'),
(75, 1, 12, 10, 7, 1, 11, 1, '2025-10-04 09:48:27', '2025-10-22 08:03:59'),
(76, 1, 4, 7, 7, 1, 11, 1, '2025-10-11 07:47:55', '2025-10-22 08:03:59'),
(77, 1, 9, 8, 7, 1, 11, 1, '2025-10-19 12:39:00', '2025-10-22 08:03:59'),
(78, 1, 16, 1, 7, 1, 11, 1, '2025-10-19 12:39:16', '2025-10-22 08:03:59'),
(79, 1, 13, 6, 7, 1, 11, 1, '2025-10-19 12:39:29', '2025-10-22 08:03:59'),
(80, 1, 6, 11, 8, 1, 11, 1, '2025-10-21 11:35:46', '2025-10-22 08:03:59'),
(81, 1, 6, 11, 9, 1, 11, 1, '2025-12-06 14:33:05', '2025-12-06 14:33:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_walikelas`
--

CREATE TABLE `pegawai_walikelas` (
  `id_pegawai_walikelas` int(10) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_tingkat` int(10) UNSIGNED DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pegawai_walikelas`
--

INSERT INTO `pegawai_walikelas` (`id_pegawai_walikelas`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_pegawai`, `id_kelas`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, 15, 7, 7, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(2, 1, 1, 7, 8, 8, 7, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(3, 1, 1, 9, 8, 13, 8, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(5, 1, 1, 9, 3, 11, 8, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(7, 1, 1, 7, 4, 18, 8, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(8, 1, 1, 7, 5, 19, 8, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(9, 1, 1, 7, 6, 20, 8, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(10, 1, 1, 9, 6, 22, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(11, 1, 1, 9, 8, 23, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(12, 1, 1, 9, 3, 24, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(13, 1, 1, 8, 7, 25, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(14, 1, 1, 8, 11, 26, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(15, 1, 1, 8, 12, 27, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(16, 1, 1, 7, 9, 28, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(17, 1, 1, 7, 18, 29, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(18, 1, 1, 7, 13, 30, 9, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(19, 1, 1, 9, 4, 31, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(20, 1, 1, 9, 7, 32, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(21, 1, 1, 9, 9, 33, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(22, 1, 1, 8, 16, 34, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(23, 1, 1, 8, 5, 35, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(24, 1, 1, 8, 13, 36, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:04:00'),
(25, 1, 1, 7, 15, 37, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(26, 1, 1, 7, 10, 38, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(27, 1, 1, 7, 14, 39, 10, 1, '2025-07-02 10:01:17', '2025-10-22 08:03:59'),
(29, 1, 0, 0, 6, NULL, 2025, 1, '2025-07-03 05:55:13', '2025-07-03 05:55:13'),
(30, 1, 1, 7, 16, 40, 11, 1, '2025-10-11 07:39:16', '2025-10-22 08:03:59'),
(31, 1, 1, 7, 14, 41, 11, 1, '2025-10-11 07:44:34', '2026-04-10 22:42:48'),
(32, 1, 1, 7, 13, 42, 11, 1, '2026-04-10 22:42:29', '2026-04-10 22:42:29'),
(33, 1, 1, 8, 15, 43, 11, 1, '2026-04-10 22:43:00', '2026-04-10 22:43:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(2, 'student.view', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(3, 'student.create', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(4, 'student.edit', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(5, 'student.delete', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(6, 'teacher.view', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(7, 'teacher.create', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(8, 'role.manage', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21'),
(9, 'permission.manage', 'web', '2026-05-11 14:39:21', '2026-05-11 14:39:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_agama`
--

CREATE TABLE `ref_agama` (
  `id_agama` int(10) NOT NULL,
  `agama` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_agama`
--

INSERT INTO `ref_agama` (`id_agama`, `agama`, `created_at`, `updated_at`) VALUES
(1, 'Islam', '2025-07-02 10:02:07', '2025-07-02 10:02:07'),
(2, 'Kristen', '2025-07-02 10:02:07', '2025-07-02 10:02:07'),
(3, 'Katholik', '2025-07-02 10:02:07', '2025-07-02 10:02:07'),
(4, 'Hindu', '2025-07-02 10:02:07', '2025-07-02 10:02:07'),
(5, 'Budha', '2025-07-02 10:02:07', '2025-07-02 10:02:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_angkatan`
--

CREATE TABLE `ref_angkatan` (
  `id_angkatan` int(11) NOT NULL,
  `angkatan` varchar(10) NOT NULL,
  `tapel` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_angkatan`
--

INSERT INTO `ref_angkatan` (`id_angkatan`, `angkatan`, `tapel`, `created_at`, `updated_at`) VALUES
(1, '2015', 1, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(2, '2016', 2, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(3, '2017', 3, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(4, '2018', 4, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(5, '2019', 5, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(6, '2020', 6, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(7, '2021', 7, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(8, '2022', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(9, '2023', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(10, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(11, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(12, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(13, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(14, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(15, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(16, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(17, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(18, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(19, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(20, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(21, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(22, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(23, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(24, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(25, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(26, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(27, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(28, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(29, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(30, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(31, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(32, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(33, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(34, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(35, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(36, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(37, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(38, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(39, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(40, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(41, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(42, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(43, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(44, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(45, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(46, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(47, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(48, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(49, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(50, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(51, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(52, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(53, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(54, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(55, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(56, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(57, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(58, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(59, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(60, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(61, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(62, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(63, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(64, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(65, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(66, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(67, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(68, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(69, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(70, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(71, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(72, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(73, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(74, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(75, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(76, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(77, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(78, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(79, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(80, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(81, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(82, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(83, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(84, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(85, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(86, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(87, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(88, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(89, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(90, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(91, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(92, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(93, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(94, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(95, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(96, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(97, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(98, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(99, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(100, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(101, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(102, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(103, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(104, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(105, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(106, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(107, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(108, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(109, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(110, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(111, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(112, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(113, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(114, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(115, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(116, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(117, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(118, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(119, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(120, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(121, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(122, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(123, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(124, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(125, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(126, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(127, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(128, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(129, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(130, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(131, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(132, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(133, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(134, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(135, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(136, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(137, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(138, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(139, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(140, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(141, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(142, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(143, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(144, '2020', 8, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(145, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(146, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(147, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(148, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(149, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(150, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(151, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(152, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(153, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(154, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(155, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(156, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(157, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(158, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(159, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(160, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(161, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(162, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(163, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(164, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(165, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(166, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(167, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(168, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(169, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(170, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(171, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(172, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(173, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(174, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(175, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(176, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(177, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(178, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(179, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(180, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(181, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(182, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(183, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(184, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(185, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(186, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(187, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(188, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(189, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(190, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(191, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(192, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(193, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(194, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(195, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(196, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(197, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(198, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(199, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(200, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(201, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(202, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(203, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(204, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(205, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(206, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(207, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(208, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(209, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(210, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(211, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(212, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(213, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(214, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(215, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(216, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(217, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(218, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(219, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(220, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(221, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(222, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(223, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(224, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(225, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(226, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(227, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(228, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(229, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(230, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(231, '2021', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(232, '2022', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(233, '2022', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(234, '2022', 9, '2025-07-02 10:02:25', '2025-07-02 10:02:25'),
(235, '2024', 10, '2025-07-02 10:02:25', '2025-07-02 10:02:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_bangunan`
--

CREATE TABLE `ref_bangunan` (
  `id_bangunan` int(11) NOT NULL,
  `nama_bangunan` varchar(50) DEFAULT NULL,
  `kode_bangunan` varchar(50) DEFAULT NULL,
  `kondisi` text DEFAULT 'Baik',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_bangunan`
--

INSERT INTO `ref_bangunan` (`id_bangunan`, `nama_bangunan`, `kode_bangunan`, `kondisi`, `created_at`, `updated_at`) VALUES
(1, 'Ruang Kepala Sekolah', 'RKEPSEK', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(2, 'Ruang Guru', 'RGR', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(3, 'Ruang Perpustakaan', 'RPERPUS', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(4, 'Gudang 1', 'GD1', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(5, 'Gudang 2', 'GD2', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(6, 'Gudang 3', 'GD3', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(7, 'Gudang 4', 'GD4', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(8, 'Kelas 7A', 'KLS7A', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(9, 'Kelas 7C', 'KLS7B', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(10, 'Kelas 7C', 'KLS7C', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(11, 'Kelas 7D', 'KLS7D', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(12, 'Kelas 8A', 'KLS8A', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(13, 'Kelas 8B', 'KLS8B', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(14, 'Kelas 8C', 'KLS8C', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(15, 'Kelas 9A', 'KLS9A', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(16, 'Kelas 9B', 'KLS9B', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02'),
(17, 'Kelas 9C', 'KLS9C', 'Baik', '2025-07-02 10:03:02', '2025-07-02 10:03:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_bulan`
--

CREATE TABLE `ref_bulan` (
  `id_bulan` int(5) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_bulan`
--

INSERT INTO `ref_bulan` (`id_bulan`, `bulan`, `created_at`, `updated_at`) VALUES
(1, 'Januari', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(2, 'Februari', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(3, 'Maret', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(4, 'April', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(5, 'Mei', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(6, 'Juni', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(7, 'Juli', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(8, 'Agustus', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(9, 'September', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(10, 'Oktober', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(11, 'November', '2025-07-02 10:03:33', '2025-07-02 10:03:33'),
(12, 'Desember', '2025-07-02 10:03:33', '2025-07-02 10:03:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_golruang`
--

CREATE TABLE `ref_golruang` (
  `id_golruang` int(10) NOT NULL,
  `gol_ruang` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_golruang`
--

INSERT INTO `ref_golruang` (`id_golruang`, `gol_ruang`, `created_at`, `updated_at`) VALUES
(1, 'II/a', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(2, 'II/b', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(3, 'II/c', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(4, 'II/d', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(5, 'III/a', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(6, 'III/b', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(7, 'III/c', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(8, 'III/d', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(9, 'IV/a', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(10, 'IV/b', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(11, 'IV/c', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(12, 'IV/d', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(13, 'VI', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(14, 'VII', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(15, 'IX', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(16, 'X', '2025-07-02 10:04:19', '2025-07-02 10:04:19'),
(17, 'XI', '2025-07-02 10:04:19', '2025-07-02 10:04:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_jabatanpegawai`
--

CREATE TABLE `ref_jabatanpegawai` (
  `id_jabatanpegawai` int(10) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_jabatanpegawai`
--

INSERT INTO `ref_jabatanpegawai` (`id_jabatanpegawai`, `nama_jabatan`, `created_at`, `updated_at`) VALUES
(1, 'Kepala Sekolah', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(2, 'Wakil Kepala Sekolah', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(3, 'Ketua Jurusan', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(4, 'Guru', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(5, 'Bendahara', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(6, 'Konseling', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(7, 'Kepala Perpustakaan', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(8, 'Pustakawan', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(9, 'Pengelola Asset', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(10, 'Kepala Tata Usaha', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(11, 'Staff Tata Usaha', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(12, 'Penjaga Sekolah', '2025-07-02 10:04:39', '2025-07-02 10:04:39'),
(13, 'Cleaning Service', '2025-07-02 10:04:39', '2025-07-02 10:04:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_pekerjaan`
--

CREATE TABLE `ref_pekerjaan` (
  `id_pekerjaan` int(10) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_pekerjaan`
--

INSERT INTO `ref_pekerjaan` (`id_pekerjaan`, `pekerjaan`, `created_at`, `updated_at`) VALUES
(1, 'Belum Bekerja', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(2, 'Pelajar', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(3, 'Mahasiswa', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(4, 'Petani', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(5, 'Nelayan', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(6, 'PNS', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(7, 'ASN P3K', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(8, 'TNI/POLRI', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(9, 'Wirausaha', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(10, 'Wiraswasta', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(11, 'Pegawai Swasta', '2025-07-02 10:05:05', '2025-07-02 10:05:05'),
(12, 'Pegawai BUMN', '2025-07-02 10:05:05', '2025-07-02 10:05:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_pendidikan`
--

CREATE TABLE `ref_pendidikan` (
  `id_pendidikan` int(10) NOT NULL,
  `nama_pendidikan` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_pendidikan`
--

INSERT INTO `ref_pendidikan` (`id_pendidikan`, `nama_pendidikan`, `created_at`, `updated_at`) VALUES
(1, 'Tidak Sekolah', '2025-07-02 10:05:26', '2025-07-02 10:05:26'),
(2, 'SD Sederajat', '2025-07-02 10:05:26', '2025-07-02 10:05:26'),
(3, 'SMP Sederajat', '2025-07-02 10:05:26', '2025-07-02 10:05:26'),
(4, 'SMA Sederajat', '2025-07-02 10:05:26', '2025-07-02 10:05:26'),
(5, 'S1', '2025-07-02 10:05:26', '2025-07-02 10:05:26'),
(6, 'S2', '2025-07-02 10:05:26', '2025-07-02 10:05:26'),
(7, 'S3', '2025-07-02 10:05:26', '2025-07-02 10:05:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_sekolahasal`
--

CREATE TABLE `ref_sekolahasal` (
  `id_sekolahasal` int(11) NOT NULL,
  `nama_sekolah` varchar(50) DEFAULT NULL,
  `alamat_sekolah` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_sekolahasal`
--

INSERT INTO `ref_sekolahasal` (`id_sekolahasal`, `nama_sekolah`, `alamat_sekolah`, `created_at`, `updated_at`) VALUES
(1, 'SDN 1 Kayu Agung', 'Jl. Siswa No. 7 Desa Kayuagung Kec. Mepanga Kab. Parigi Moutong Prov. Sulawesi Tengah', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(2, 'SD Inpres 1 Kayu Agung', 'Jl. Nusantara No. 116 Desa Kayu Agung', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(3, 'SD Inpres 2 Kayu Agung', 'Jl. Nusantara No. 7 Desa Kayu Agung', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(4, 'SDN 2 Ongka Malino', 'Desa Tinombala Sejati', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(5, 'MTs.N Ongka Malino', 'Tinombala Jaya', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(6, 'MTs.N Tomini', 'Tomini', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(7, 'SMP Satap Negeri 3 Ongka Malino', 'Ongka', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(8, 'SMP N 3 Bolano Lambunu', 'Ongka', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(9, 'MTs Al-Khairaat Mepanga', 'Mepanga', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(10, 'MTs Al-Muhajirin', '-', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(11, 'MTs Tinombala', '<p>Tinombala</p>', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(12, 'SD Inpres 3 Kayuagung', 'Kayuagung', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(13, 'SDN 2 Kayuagung', 'Kayuagung', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(14, 'SD Inpres 1 Tinombala', 'Desa Tinombala', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(15, 'SD Inpres 3 Malino', 'Bosagon Jaya', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(17, 'SDK Tabolo-Bolo', 'Tabolo-Bolo ', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(18, 'MTs. Swasta Al-Hikmah', 'Jl. Melati No. 3 Kotanagaya, Bolano Lambunu, 94479', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(19, 'MIN 3 Parigi', 'Tinombala', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(20, 'MI Ulil Albab', 'Sumber Agung', '2025-07-02 10:05:50', '2025-07-02 10:05:50'),
(21, 'SDN 08 Patilanggio', 'Patilanggio', '2025-07-02 10:05:50', '2025-07-02 10:05:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ref_status_kepegawaian`
--

CREATE TABLE `ref_status_kepegawaian` (
  `id_status_kepegawaian` int(10) NOT NULL,
  `status_kepegawaian` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ref_status_kepegawaian`
--

INSERT INTO `ref_status_kepegawaian` (`id_status_kepegawaian`, `status_kepegawaian`, `created_at`, `updated_at`) VALUES
(1, 'PNS', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(2, 'CPNS', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(3, 'PPPK', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(4, 'Honor Daerah TK.I Provinsi', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(5, 'Honor Daerah TK.II Kab/Kota ', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(6, 'Guru Honor Sekolah', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(7, 'Tenaga Honor Sekolah', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(8, 'Guru Bantu', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(9, 'Pegawai Tidak Tetap', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(10, 'Pegawai Tetap Yayasan', '2025-07-02 10:06:15', '2025-07-02 10:06:15'),
(11, 'Pegawai Tidak Tetap Yayasan', '2025-07-02 10:06:15', '2025-07-02 10:06:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_datasiswa`
--

CREATE TABLE `report_datasiswa` (
  `id_data` int(11) NOT NULL,
  `tahun_ajaran` varchar(15) DEFAULT NULL,
  `jml_l` int(10) NOT NULL,
  `jml_p` int(10) NOT NULL,
  `total` int(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `report_datasiswa`
--

INSERT INTO `report_datasiswa` (`id_data`, `tahun_ajaran`, `jml_l`, `jml_p`, `total`, `created_at`, `updated_at`) VALUES
(1, '2015-2016', 50, 70, 120, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(2, '2016-2017', 40, 60, 100, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(3, '2017-2018', 70, 80, 150, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(4, '2018-2019', 100, 110, 210, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(5, '2019-2020', 100, 130, 230, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(6, '2020-2021', 120, 140, 260, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(7, '2021-2022', 120, 130, 250, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(8, '2022-2023', 120, 140, 260, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(9, '2023-2024', 118, 161, 279, '2025-07-02 10:06:51', '2025-07-02 10:06:51'),
(10, '2024-2025', 110, 143, 253, '2025-07-02 10:06:51', '2025-07-02 10:06:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', 'Super Admin', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(2, 'admin_sekolah', 'web', 'Admin Sekolah', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(3, 'operator_akademik', 'web', 'Operator Akademik', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(4, 'operator_kesiswaan', 'web', 'Operator Kesiswaan', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(5, 'operator_sarpras', 'web', 'Operator Sarpras', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(6, 'guru', 'web', 'Guru', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(7, 'wali_kelas', 'web', 'Wali Kelas', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(8, 'guru_bk', 'web', 'Guru BK', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(9, 'kepala_sekolah', 'web', 'Kepala Sekolah', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(10, 'orang_tua', 'web', 'Orang Tua', '2026-06-14 15:17:43', '2026-06-14 15:17:43'),
(11, 'siswa', 'web', 'Siswa', '2026-06-14 15:17:43', '2026-06-14 15:17:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1),
(151, 1),
(152, 1),
(153, 1),
(154, 1),
(155, 1),
(156, 1),
(157, 1),
(158, 1),
(159, 1),
(160, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(119, 2),
(120, 2),
(121, 2),
(122, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(127, 2),
(128, 2),
(129, 2),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(138, 2),
(142, 2),
(143, 2),
(144, 2),
(145, 2),
(146, 2),
(147, 2),
(148, 2),
(149, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(156, 2),
(158, 2),
(159, 2),
(160, 2),
(1, 3),
(7, 3),
(8, 3),
(9, 3),
(12, 3),
(13, 3),
(14, 3),
(17, 3),
(18, 3),
(19, 3),
(21, 3),
(22, 3),
(23, 3),
(25, 3),
(26, 3),
(27, 3),
(29, 3),
(30, 3),
(31, 3),
(33, 3),
(34, 3),
(35, 3),
(78, 3),
(79, 3),
(80, 3),
(91, 3),
(92, 3),
(93, 3),
(96, 3),
(97, 3),
(99, 3),
(1, 6),
(78, 6),
(86, 6),
(87, 6),
(91, 6),
(92, 6),
(100, 6),
(101, 6),
(1, 7),
(60, 7),
(61, 7),
(78, 7),
(86, 7),
(87, 7),
(91, 7),
(92, 7),
(96, 7),
(97, 7),
(100, 7),
(101, 7),
(1, 9),
(2, 9),
(122, 9),
(123, 9),
(124, 9),
(125, 9),
(126, 9),
(127, 9),
(128, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) UNSIGNED NOT NULL,
  `id_sekolah` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `kode_ruangan` varchar(20) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `gedung` varchar(50) DEFAULT NULL,
  `lantai` int(2) DEFAULT NULL,
  `kapasitas` int(4) NOT NULL DEFAULT 30,
  `fasilitas` text DEFAULT NULL COMMENT 'JSON atau text untuk fasilitas',
  `tipe` enum('kelas','lab','aula','perpus','lainnya') NOT NULL DEFAULT 'kelas',
  `status` enum('tersedia','digunakan','perbaikan','tidak_dipakai') NOT NULL DEFAULT 'tersedia',
  `foto` varchar(255) DEFAULT NULL,
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `id_sekolah`, `kode_ruangan`, `nama_ruangan`, `gedung`, `lantai`, `kapasitas`, `fasilitas`, `tipe`, `status`, `foto`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'R001', 'Ruang Kelas 7A', 'Gedung A', 1, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(2, 1, 'R002', 'Ruang Kelas 7B', 'Gedung A', 1, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(3, 1, 'R003', 'Ruang Kelas 7C', 'Gedung A', 1, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(4, 1, 'R004', 'Ruang Kelas 8A', 'Gedung A', 2, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(5, 1, 'R005', 'Ruang Kelas 8B', 'Gedung A', 2, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(6, 1, 'R006', 'Ruang Kelas 8C', 'Gedung A', 2, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(7, 1, 'R007', 'Ruang Kelas 9A', 'Gedung B', 1, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(8, 1, 'R008', 'Ruang Kelas 9B', 'Gedung B', 1, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(9, 1, 'R009', 'Ruang Kelas 9C', 'Gedung B', 1, 35, 'AC, Proyektor, Papan Tulis', 'kelas', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(10, 1, 'LAB01', 'Laboratorium Komputer 1', 'Gedung C', 1, 25, 'AC, 25 PC, Proyektor, LAN', 'lab', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(11, 1, 'LAB02', 'Laboratorium Komputer 2', 'Gedung C', 1, 25, 'AC, 25 PC, Proyektor, LAN', 'lab', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(12, 1, 'LAB03', 'Laboratorium IPA', 'Gedung C', 2, 30, 'AC, Peralatan Lab, Proyektor', 'lab', 'perbaikan', NULL, 1, '2025-12-01 08:00:00', NULL),
(13, 1, 'AULA', 'Aula Serbaguna', 'Gedung D', 1, 200, 'AC, Sound System, Proyektor, Panggung', 'aula', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(14, 1, 'PERPUS', 'Perpustakaan', 'Gedung D', 2, 50, 'AC, Meja Baca, Rak Buku, Wi-Fi', 'perpus', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(15, 1, 'LAB04', 'Laboratorium Bahasa', 'Gedung C', 2, 30, 'AC, 30 Headset, Lab Bahasa', 'lab', 'tersedia', NULL, 1, '2025-12-01 08:00:00', NULL),
(16, 1, 'R010', 'Ruang Guru', 'Gedung A', 2, 20, 'AC, Meja Guru, Lemari', 'lainnya', 'digunakan', NULL, 1, '2025-12-01 08:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan_jadwal`
--

CREATE TABLE `ruangan_jadwal` (
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `id_ruangan` int(11) UNSIGNED NOT NULL,
  `id_sesi_ujian` int(11) UNSIGNED DEFAULT NULL,
  `id_kelas` int(11) UNSIGNED DEFAULT NULL COMMENT 'Untuk jadwal pelajaran regular',
  `kegiatan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `peminjam` varchar(150) NOT NULL,
  `penanggung_jawab` varchar(100) DEFAULT NULL,
  `keperluan` text DEFAULT NULL,
  `catatan` text NOT NULL,
  `status` enum('terjadwal','berlangsung','selesai','dibatalkan') NOT NULL DEFAULT 'terjadwal',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan_jadwal`
--

INSERT INTO `ruangan_jadwal` (`id_jadwal`, `id_ruangan`, `id_sesi_ujian`, `id_kelas`, `kegiatan`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `peminjam`, `penanggung_jawab`, `keperluan`, `catatan`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, NULL, 1, 'Pelajaran TIK Kelas X-1', '2025-12-08', '08:00:00', '09:30:00', '', 'Guru TIK', 'Pelajaran regular', '', 'selesai', '2025-12-01 08:00:00', NULL),
(2, 10, NULL, 2, 'Pelajaran TIK Kelas X-2', '2025-12-08', '10:00:00', '11:30:00', '', 'Guru TIK', 'Pelajaran regular', '', 'berlangsung', '2025-12-01 08:00:00', NULL),
(3, 13, NULL, NULL, 'Rapat Guru', '2025-12-08', '13:00:00', '15:00:00', '', 'Kepala Sekolah', 'Rapat bulanan', '', 'terjadwal', '2025-12-01 08:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sekolah`
--

CREATE TABLE `sekolah` (
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `npsn` varchar(20) DEFAULT NULL,
  `nama_sekolah` varchar(150) NOT NULL,
  `jenjang` enum('SD','SMP','SMA') NOT NULL,
  `status` enum('Negeri','Swasta') NOT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telp` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data untuk tabel `sekolah`
--

INSERT INTO `sekolah` (`id_sekolah`, `npsn`, `nama_sekolah`, `jenjang`, `status`, `provinsi`, `kabupaten`, `kecamatan`, `alamat`, `website`, `email`, `telp`, `logo`, `created_at`, `updated_at`) VALUES
(1, '4020', 'SMP NEGERI 3 MEPANGA', 'SMP', 'Negeri', 'Sulawesi Tengah', 'Parigi Moutong', 'Mepanga', 'Jl. Nusantara No. 117 Desa Kayuagung', 'www.smpn3mepanga.sch.id', 'smpn3mepanga@gmail.com', NULL, NULL, '2025-10-22 13:33:10', '2025-10-22 13:33:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4ZaM5JyDmXWXoLmzSb3QyJSwVa1Q5nvMyyZbw46y', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', 'eyJfdG9rZW4iOiI3a2VpV0twaTdueWx3TlpwZG9QeHJlZnZXYWt2b0JWYjlCdTBhQVJXIiwidXJsIjpbXSwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9hZG1pblwva2VsYXMiLCJyb3V0ZSI6ImFkbWluLmtlbGFzLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsInNlbWVzdGVyX2FrdGlmIjoiU2VtZXN0ZXIgR2VuYXAiLCJzZW1lc3Rlcl9pZCI6MiwidGFwZWxfYWt0aWYiOiIyMDI1LTIwMjYiLCJ0YXBlbF9pZCI6MTF9', 1781515251);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siklus_kelasrombel`
--

CREATE TABLE `siklus_kelasrombel` (
  `id_kelas` int(10) UNSIGNED NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) UNSIGNED NOT NULL,
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `kapasitas` int(11) NOT NULL DEFAULT 25,
  `id_walikelas` int(10) UNSIGNED DEFAULT NULL,
  `tapel` int(11) NOT NULL DEFAULT 1,
  `aktif` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siklus_kelasrombel`
--

INSERT INTO `siklus_kelasrombel` (`id_kelas`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `nama_kelas`, `kapasitas`, `id_walikelas`, `tapel`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, '9A', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:10'),
(2, 1, 1, 9, '9B', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:15'),
(3, 1, 1, 9, '9C', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:19'),
(4, 1, 1, 8, '8A', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:42:53'),
(5, 1, 1, 8, '8B', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:42:59'),
(6, 1, 1, 8, '8C', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:04'),
(7, 1, 1, 7, '7A', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:42:29'),
(8, 1, 1, 7, '7B', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:42:37'),
(9, 1, 1, 7, '7C', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:42:42'),
(10, 1, 1, 7, '7D', 25, NULL, 7, '1', '2025-07-02 10:07:21', '2025-10-22 06:42:47'),
(11, 1, 1, 9, '9A', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:49'),
(12, 1, 1, 9, '9B', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:53'),
(13, 1, 1, 9, '9C', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:58'),
(14, 1, 1, 8, '8A', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:44'),
(15, 1, 1, 8, '8B', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:07'),
(16, 1, 1, 8, '8C', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:11'),
(17, 1, 1, 8, '8D', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:15'),
(18, 1, 1, 7, '7A', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:43:37'),
(19, 1, 1, 7, '7B', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:20'),
(20, 1, 1, 7, '7C', 25, NULL, 8, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:24'),
(22, 1, 1, 9, '9A', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:09'),
(23, 1, 1, 9, '9B', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:13'),
(24, 1, 1, 9, '9C', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:17'),
(25, 1, 1, 8, '8A', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:54'),
(26, 1, 1, 8, '8B', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:58'),
(27, 1, 1, 8, '8C', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:03'),
(28, 1, 1, 7, '7A', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:39'),
(29, 1, 1, 7, '7B', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:43'),
(30, 1, 1, 7, '7C', 25, NULL, 9, '1', '2025-07-02 10:07:21', '2025-10-22 06:44:48'),
(31, 1, 1, 9, '9A', 30, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:46:13'),
(32, 1, 1, 9, '9B', 25, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:46:18'),
(33, 1, 1, 9, '9C', 25, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:46:23'),
(34, 1, 1, 8, '8A', 40, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:59'),
(35, 1, 1, 8, '8B', 40, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:46:03'),
(36, 1, 1, 8, '8C', 40, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:46:08'),
(37, 1, 1, 7, '7A', 30, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:46'),
(38, 1, 1, 7, '7B', 30, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:50'),
(39, 1, 1, 7, '7C', 30, NULL, 10, '1', '2025-07-02 10:07:21', '2025-10-22 06:45:54'),
(40, 1, 1, 7, '7A', 30, NULL, 11, '1', '2025-07-05 22:36:34', '2025-10-22 06:46:36'),
(41, 1, 1, 7, '7B', 30, NULL, 11, '1', '2025-07-05 22:36:59', '2025-10-22 06:46:41'),
(42, 1, 1, 7, '7C', 30, NULL, 11, '1', '2025-07-05 22:37:31', '2025-10-22 06:46:44'),
(43, 1, 1, 8, '8A', 30, NULL, 11, '1', '2025-07-05 22:37:49', '2025-10-22 06:46:49'),
(44, 1, 1, 8, '8B', 30, NULL, 11, '1', '2025-07-05 22:38:13', '2025-10-22 06:46:53'),
(45, 1, 1, 8, '8C', 30, NULL, 11, '1', '2025-07-05 22:38:24', '2025-10-22 06:46:58'),
(46, 1, 1, 9, '9A', 40, NULL, 11, '1', '2025-07-05 22:38:35', '2025-10-22 06:47:02'),
(47, 1, 1, 9, '9B', 40, NULL, 11, '1', '2025-07-05 22:38:43', '2025-10-22 06:47:06'),
(48, 1, 1, 9, '9C', 40, NULL, 11, '1', '2025-07-05 22:38:59', '2025-10-22 06:47:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siklus_semester`
--

CREATE TABLE `siklus_semester` (
  `id_semester` int(10) NOT NULL,
  `id_sekolah` int(11) NOT NULL DEFAULT 1,
  `semester` varchar(50) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siklus_semester`
--

INSERT INTO `siklus_semester` (`id_semester`, `id_sekolah`, `semester`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Semester Ganjil', '0', '2025-07-02 10:07:45', '2026-06-15 08:53:00'),
(2, 1, 'Semester Genap', '1', '2025-07-02 10:07:45', '2026-06-15 08:53:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siklus_tahunajaran`
--

CREATE TABLE `siklus_tahunajaran` (
  `id_tahunajaran` int(10) UNSIGNED NOT NULL,
  `id_sekolah` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `tahun_ajaran` varchar(50) NOT NULL,
  `tahun_awal` date NOT NULL,
  `tahun_akhir` date NOT NULL,
  `tasm` varchar(5) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siklus_tahunajaran`
--

INSERT INTO `siklus_tahunajaran` (`id_tahunajaran`, `id_sekolah`, `tahun_ajaran`, `tahun_awal`, `tahun_akhir`, `tasm`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-2016', '2015-07-01', '2016-06-01', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(2, 1, '2016-2017', '2016-07-01', '2017-06-30', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(3, 1, '2017-2018', '2017-07-01', '2018-06-30', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(4, 1, '2018-2019', '2018-07-16', '2019-06-01', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(5, 1, '2019-2020', '2019-07-18', '2020-06-25', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(6, 1, '2020-2021', '2020-07-13', '2021-06-21', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(7, 1, '2021-2022', '2021-07-10', '2022-06-25', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(8, 1, '2022-2023', '2022-07-11', '2023-06-15', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(9, 1, '2023-2024', '2023-07-19', '2024-06-20', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(10, 1, '2024-2025', '2024-07-15', '2025-06-29', '', '0', '2025-07-02 10:08:08', '2026-06-15 08:55:55'),
(11, 1, '2025-2026', '2025-07-14', '2026-06-30', '', '1', '2025-07-05 22:36:18', '2026-06-15 08:55:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(10) NOT NULL,
  `id_sekolah` int(11) NOT NULL DEFAULT 1,
  `nis` varchar(15) DEFAULT NULL,
  `nisn` varchar(15) DEFAULT NULL,
  `nik` varchar(25) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `kelamin` enum('L','P') DEFAULT 'L',
  `agama` varchar(10) DEFAULT 'Islam',
  `alamat` varchar(255) DEFAULT NULL,
  `kelurahan` varchar(50) DEFAULT NULL,
  `kecamatan` varchar(50) DEFAULT NULL,
  `kabupaten` varchar(50) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `kodepos` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ekonomi` varchar(50) DEFAULT NULL,
  `anak_ke` int(5) DEFAULT NULL,
  `jml_saudara` int(5) DEFAULT NULL,
  `id_saudara` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `telp` varchar(15) NOT NULL,
  `angkatan` varchar(10) DEFAULT NULL,
  `program_studi` int(11) DEFAULT NULL,
  `id_ortu` int(11) DEFAULT NULL,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(50) DEFAULT NULL,
  `pendidikan_ayah` varchar(100) NOT NULL,
  `pendidikan_ibu` varchar(100) NOT NULL,
  `ttl_ayah` varchar(150) DEFAULT NULL,
  `ttl_ibu` varchar(150) DEFAULT NULL,
  `alamat_ortu` text DEFAULT NULL,
  `hp_ortu` varchar(15) DEFAULT NULL,
  `hp_ibu` varchar(15) NOT NULL,
  `tentang_orangtua` varchar(255) DEFAULT NULL,
  `asal_sekolah` varchar(50) DEFAULT NULL,
  `masuk_dikelas` varchar(50) DEFAULT NULL,
  `diterima_tapel` int(11) DEFAULT NULL,
  `diterima_semester` int(11) DEFAULT NULL,
  `alamat_asal_sekolah` varchar(150) DEFAULT NULL,
  `ijazah_no` varchar(100) DEFAULT NULL,
  `ijazah_thn` varchar(10) DEFAULT NULL,
  `tgl_daftar` date NOT NULL,
  `status` enum('baru','mutasi') DEFAULT 'baru',
  `dok_akta` varchar(150) NOT NULL,
  `dok_kk` varchar(150) NOT NULL,
  `dok_ijazah` varchar(150) NOT NULL,
  `dok_skhun` varchar(150) NOT NULL,
  `dok_kip` varchar(150) NOT NULL,
  `no_ujian` varchar(50) NOT NULL,
  `ruang_ujian` varchar(35) NOT NULL,
  `sesi_ujian` varchar(5) NOT NULL,
  `kode_undangan` varchar(50) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activation_code` varchar(50) NOT NULL,
  `forgotten_password_code` varchar(50) NOT NULL,
  `forgotten_password_time` datetime NOT NULL,
  `remember_code` varchar(50) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `active` int(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_sekolah`, `nis`, `nisn`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `email`, `ekonomi`, `anak_ke`, `jml_saudara`, `id_saudara`, `foto`, `telp`, `angkatan`, `program_studi`, `id_ortu`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `pendidikan_ayah`, `pendidikan_ibu`, `ttl_ayah`, `ttl_ibu`, `alamat_ortu`, `hp_ortu`, `hp_ibu`, `tentang_orangtua`, `asal_sekolah`, `masuk_dikelas`, `diterima_tapel`, `diterima_semester`, `alamat_asal_sekolah`, `ijazah_no`, `ijazah_thn`, `tgl_daftar`, `status`, `dok_akta`, `dok_kk`, `dok_ijazah`, `dok_skhun`, `dok_kip`, `no_ujian`, `ruang_ujian`, `sesi_ujian`, `kode_undangan`, `username`, `password`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `token`, `last_login`, `active`, `created_at`, `updated_at`) VALUES
(356, 1, '22010479', '0085229661', '7208072011080002', 'Moh. Nasrudin', 'Bosagon', '2008-11-20', 'L', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', '2022', 1, NULL, 'Abdul Haris', 'Erlina TK', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 8, 1, NULL, NULL, NULL, '2022-07-11', 'baru', '', '', '', '', '', '', '', '', NULL, '22010479', '$2a$08$7ULFfNJHZlbiBluTKo2pr.xJqRsspRSl80rRXqIrZu9g45wLVBIhy', '', '', '0000-00-00 00:00:00', '', '22010479', '2024-10-05 03:25:02', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(408, 1, '23020418', '0107590017', '7208125212100001', 'Ade Neysa Jyasmin', 'Kayu Agung', '2010-12-12', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', '', '', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', NULL, 2, NULL, NULL, '20240824171217-ade-neysa.jpg', '', '2023', 1, NULL, 'Budiman', 'Nurfaida Apriyanti', NULL, NULL, '', '', NULL, NULL, NULL, '', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020418', '$2y$10$aVkU3OxtaVCJAMpXmlsuUuV31kmGkZSUn/2DcfQOEeyagAz.UxJuO', '', '', '0000-00-00 00:00:00', '', '4e9df6bdd740f08e48d3753a38f40d95', '2025-12-01 06:22:29', 1, '2025-06-30 13:42:46', '2025-12-02 14:22:29'),
(409, 1, '23020419', '0107642131', '6472105704100002', 'Adelia Attalivia Alzira', 'Ponorogo', '2010-04-17', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', 'Kayuagung', 'Mepanga', 'Parigi Moutong', NULL, '94476', '', '', 1, 0, NULL, NULL, '', '2023', 1, NULL, 'Matra', 'Titik Wiranti', '', '', '', '', NULL, NULL, '', '', '', NULL, '', NULL, 9, 1, '', '', '', '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020419', '$2a$08$gCsVtBVxOl8sHe14ItelqOub60Mp.cZpr/4eBEEv.4qKVpPQzOGYe', '', '', '0000-00-00 00:00:00', '', '23020419', '2024-09-24 03:00:10', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(410, 1, '23010420', '0105878182', '7208070209100002', 'Adrian Sepriansa', 'Bosagon', '2010-09-02', 'L', 'Kristen', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Wayan Herman Sumantio', 'Afriani', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010420', '$2a$08$LhFL2B2KBCo9.hQk2sQBjO8jWrPwT6wiwaCJQDXIYfOPqCqu9zuDa', '', '', '0000-00-00 00:00:00', '', '23010420', '2024-10-05 03:27:12', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(411, 1, '23010421', '0109570955', '7208120407100001', 'Ahmad Adi Chandra', 'Kayu Agung', '2010-07-04', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sutrisno', 'Sukinem', NULL, NULL, '', '', NULL, NULL, NULL, '085796981829', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010421', '$2a$08$Zp0YMVN6LepYszNjJuP9q.NkGX4IlqyiLNArEsUpAT8FJPvFVQMsC', '', '', '0000-00-00 00:00:00', '', '23010421', '2024-09-24 03:00:56', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(413, 1, '23020423', '0106224955', '7208127105100001', 'Ainun Yurizta', 'Kayu Agung', '2010-05-31', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sugiono', 'Suhartini', NULL, NULL, '', '', NULL, NULL, NULL, '085398973046', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020423', '$2a$08$l7uJIZ0RrCX0BCFmNXDmO.zpz/38Ggu3XzMVi.tWo6uUE6GX4mLSW', '', '', '0000-00-00 00:00:00', '', '23020423', '2024-09-24 03:06:04', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(414, 1, '23020424', '3104848331', '7208124811100001', 'Alisa Riyanti', 'Sumber Agung', '2010-11-08', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Siti Fatimah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020424', '$2y$10$Ntnpqr8Mgnb/vLe7FAD5fuiafzhETDgSULpGY0iI0IVxp5AfCt84G', '', '', '0000-00-00 00:00:00', '', 'ffc044e6dd0f48cd08ddbba1960aa78d', '2025-08-31 06:16:55', 1, '2025-06-30 13:42:46', '2025-09-01 14:16:55'),
(415, 1, '23020425', '0103967557', '7208126210100001', 'Alvina Dwi Natasa', 'Kayu Agung', '2010-10-22', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', '', '', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Kawidi', 'Salbiah', NULL, NULL, '', '', NULL, NULL, NULL, '081342994675', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020425', '$2a$08$PFAIQvqRnqPFSn5d3vhINeOw8u0iW95R.Lk8QhapwfgVtXArNEBzm', '', '', '0000-00-00 00:00:00', '', '23020425', '2024-10-05 01:36:07', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(416, 1, '23020426', '0117921500', '7208126202110001', 'Alzena Rifaya Reyhana', 'Sumber Agung', '2011-02-20', 'P', 'Islam', 'Jl. Kelinci', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Ahmad Shibghatul Islam', 'Desy Ambarsary', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020426', '$2a$08$/QAEvUVgwzeHcZSXazWMTuGLOc/Q8UHRFgBSGhuOUtiOr/gjvQYRO', '', '', '0000-00-00 00:00:00', '', '23020426', '2024-10-06 02:03:14', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(417, 1, '23020427', '0104401272', '7208125904100001', 'Anggy Putri Regina', 'Kayu Agung', '2010-04-19', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Imam Syafii', 'Yuliani', NULL, NULL, '', '', NULL, NULL, NULL, '085342010837', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020427', '$2a$08$1U3UtPykjoB8pZ1bWERthOPFSAxEvB1EVZs5Jh2I5dVaQVnVq1ElC', '', '', '0000-00-00 00:00:00', '', '23020427', '2024-09-24 03:05:34', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(418, 1, '23020428', '0113949094', '7208124101110001', 'Anisa Nurhaida', 'Sumber Agung', '2011-01-01', 'P', 'Islam', 'Jl. Kalora', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Kartono', 'Mastiyah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020428', '$2a$08$pqBge4AX7qgCu8wLhjMaHuhsfHVvLPF5gGOWWaeIdEThwjVRyXrWm', '', '', '0000-00-00 00:00:00', '', '23020428', '2024-09-24 03:01:16', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(419, 1, '23020429', '0106362271', '7208125404100003', 'Apri Ani Putri', 'Kayu Agung', '2010-04-14', 'P', 'Islam', 'Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Katiman', 'Warniah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020429', '$2a$08$wa3UAmJiH9yE/3rVItGONuQ3gEEyDz7b48UC0PWLbUyeunC5ZF5Dm', '', '', '0000-00-00 00:00:00', '', '23020429', '2024-10-05 01:26:40', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(420, 1, '23010430', '0103857766', '7208122907100001', 'Arya Adi Saputra', 'Kayu Agung', '2010-07-29', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Nasep Suherlan', 'Sri Anah', NULL, NULL, '', '', NULL, NULL, NULL, '082259177298', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010430', '$2a$08$GJdMxcy3QOvonSP3DEpSCOjFMJL2F6njN7LS6xaXHgKMo.lYIrEAG', '', '', '0000-00-00 00:00:00', '', '23010430', '2024-10-05 01:31:25', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(421, 1, '23020431', '3102937227', '7208226007100001', 'Azizah Alfia', 'Tinombala', '2010-07-20', 'P', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Komsatun', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020431', '$2a$08$slSzEdmB3iEA29cDjyWxIOQ/RylHAkSnoCdAj148s2Gq/D7z48MD2', '', '', '0000-00-00 00:00:00', '', '23020431', '2024-09-30 00:55:06', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(422, 1, '23020432', '0102776959', '7208075609100001', 'Berlin Septiana Pangalo', 'Tinombala', '2010-09-16', 'P', 'Kristen', 'Dusun Iv Tinombala', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Saul Pangalo', 'Puji Lestari', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 1 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020432', '$2a$08$GDFTMfSfmNXz1BXPSYbsSuqa0vp1Fhxw5R2stQwDyd1JnhHGTeWfW', '', '', '0000-00-00 00:00:00', '', '23020432', '2024-10-05 03:46:00', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(423, 1, '23020433', '0118797249', '7208125904110001', 'Clara Aprely Purnama', 'Kotaraya', '2011-04-19', 'P', 'Islam', 'Nusantara', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Wahid Ikhsanudin', 'Atik Purwandini', NULL, NULL, '', '', NULL, NULL, NULL, '081242014674', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020433', '$2a$08$4fZuMNZtA0SbMPpkWwPB1.gL4T3/1CVR09mABzactdDkviP2HK8Fm', '', '', '0000-00-00 00:00:00', '', '23020433', '2024-10-05 01:30:06', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(424, 1, '23020434', '0108153989', '7208075003100004', 'Delfita Aryanti', 'Tinombala', '2010-03-10', 'P', 'Islam', 'Tinombala', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Edi Sugianto', 'Miyati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020434', '$2a$08$tvp06upeFBhWyT9Vzd5EBekr3sQzXvEh9c3QkUvYl1ttMA1J.8Aie', '', '', '0000-00-00 00:00:00', '', '23020434', '2024-09-30 00:51:45', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(425, 1, '23020435', '0108008765', '7208074206110001', 'Derby Anindita Pasha', 'Tinombala', '2010-06-02', 'P', 'Islam', 'Jln. Nuri', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sukasno', 'Sudarmi', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 1 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020435', '$2a$08$IzuQkHDVyx4Rm0exi5/3a.XTw.tqh36am/zPPtX8/QeSUJiiN9cwC', '', '', '0000-00-00 00:00:00', '', '23020435', '2024-10-05 01:32:34', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(426, 1, '23010436', '0118883809', '7208121503110001', 'Derby Dwi Arziq', 'Kayu Agung', '2011-03-15', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Suyono S', 'Sudarmini', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010436', '$2a$08$PxbUaL.Dv7r7vV2L91PAAO3gEn4iXjdhSXEPysai6pjMaA1HMyz6y', '', '', '0000-00-00 00:00:00', '', '23010436', '2024-09-30 00:52:47', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(427, 1, '23020437', '0103572062', '7208125105100001', 'Dinda Ayu Natasya', 'Kayu Agung', '2010-05-11', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sukisno', 'Puryani', NULL, NULL, '', '', NULL, NULL, NULL, '082246653957', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020437', '$2a$08$A29hR6fhOP8SqKrmNHgAcOYTjDQ1JPpIBLa47c9zTfKNvipN1mmF6', '', '', '0000-00-00 00:00:00', '', '23020437', '2024-09-24 03:05:33', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(428, 1, '23020438', '3101341521', '7208125010100002', 'Dinda Ayu Selfia', 'Parigi', '2010-10-10', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Rubianti', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020438', '$2a$08$3kQ7MQCAfDERQLG3H0sw1ulrlQNzkJjYLUGyS6ewvjtpHkyuuqqVu', '', '', '0000-00-00 00:00:00', '', '23020438', '2024-09-24 03:00:33', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(429, 1, '23020439', '0121458474', '7208125203110004', 'Dini Hartanti', 'Toli-Toli', '2011-03-12', 'P', 'Islam', 'Jln Nusantara', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Mujianto', 'Atika', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020439', '$2a$08$ro1bp/tFnRznqgfOUcCgfuxjGFJknVWkByoZBqoSnGb3zmEO8w3sy', '', '', '0000-00-00 00:00:00', '', '23020439', '2024-09-24 03:05:54', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(430, 1, '23020440', '0109920363', '7208124909100001', 'Dini Safitri Irwanzah', 'Kayu Agung', '2010-09-09', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Asep Irawan', 'Jumrotun', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020440', '$2a$08$8Zn5UNW7OlVSCkz96p9dMOSzqLsoCAUcQqpk/.gQgkXj/4900SpKm', '', '', '0000-00-00 00:00:00', '', '23020440', '2024-09-30 00:51:01', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(431, 1, '23010441', '0103297561', '7208072910100001', 'Drenli Ananta', 'Bosagon', '2010-10-29', 'L', 'Kristen', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'I Ketut Mulyadi', 'Niluh Hendriani', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010441', '$2a$08$LwPq/fqY1VtaNyuqmRYjGOvL1kE9ThvQaTI9KFdlKJG33MErEeAla', '', '', '0000-00-00 00:00:00', '', '23010441', '2025-10-16 05:28:10', 1, '2025-06-30 13:42:46', '2025-10-17 13:28:10'),
(433, 1, '23020443', '3119430160', '7208124905110001', 'Eka Wijayanti', 'Sumber Agung', '2011-05-09', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Nasitri', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020443', '$2a$08$U2oG..Vvku8WyTe4/4RoROzfw5GfWcZs8NyES7UiII46kEV1zrLNu', '', '', '0000-00-00 00:00:00', '', '23020443', '2024-09-24 03:02:08', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(434, 1, '23010444', '0109858637', '7208121604100001', 'Endi Andika Putra', 'Denpasar', '2010-04-16', 'L', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Irawan', 'Wahyu Wati', NULL, NULL, '', '', NULL, NULL, NULL, '081340427001', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010444', '$2a$08$OKU.iziHBCKpTjWZDlM8uOn5YmzK4mtEfqEemAtBWS3hv4ANOzOrC', '', '', '0000-00-00 00:00:00', '', '23010444', '2024-09-24 03:05:29', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(435, 1, '23010445', '0107575723', '7208121409100001', 'Fadil Fahrurrohim', 'Kayu Agung', '2010-09-14', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Agus Sutikno', 'Sri Wulandarai', NULL, NULL, '', '', NULL, NULL, NULL, '082349066545', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010445', '$2a$08$ZORN/CMG7wJNfSRwoJBv5um3BBZEFGCsk5dTkvhbrDxAncAjCn5RS', '', '', '0000-00-00 00:00:00', '', '23010445', '2024-09-30 00:52:00', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(437, 1, '23020447', '0094914828', '7208124909090003', 'Falya Safira Kalila', 'Kayu Agung', '2009-09-09', 'P', 'Islam', '-', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Nawi Indrianto', 'Inem', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020447', '$2a$08$5bqu0dzyi9mWkl5hNnZVtOiJPBIY9By5uWzPtkjBXRG/QTE8uaTIi', '', '', '0000-00-00 00:00:00', '', '23020447', '2024-09-30 00:49:53', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(438, 1, '23020448', '0103959568', '7208125208100002', 'Fara Dianilova Ramadani', 'Kayu Agung', '2010-08-12', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Supriyanto', 'Yayuk Purnama Ningsih', NULL, NULL, '', '', NULL, NULL, NULL, '085823332193', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020448', '$2a$08$uKcWylH0ZryDYXIEqnxXx.YwrVOe15FE60cUW7SSCLC1dTh5eb7ti', '', '', '0000-00-00 00:00:00', '', '23020448', '2024-10-05 01:35:18', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(439, 1, '23010449', '0107622680', '7208122205100002', 'Fasbir Adytia Putra', 'Kayu Agung', '2010-05-22', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Muh.Amat Said', 'Minarsih', NULL, NULL, '', '', NULL, NULL, NULL, '085340528893', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010449', '$2a$08$Al.KzOy5I0CHEIDVl3pE2ORHZtgG59PjZe/aIF7K1D/WvpElI7cuK', '', '', '0000-00-00 00:00:00', '', '23010449', '2024-09-30 00:50:57', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(440, 1, '23020450', '0104238872', '7208126207100001', 'Feby Fanesya Putri', 'Kayu Agung', '2010-07-22', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Anwar', 'Garfit Riswati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020450', '$2a$08$rwqAd6SNZPVn918SO3COh.chjeBIHmni2ALhb24XsVbvOJQGbY1um', '', '', '0000-00-00 00:00:00', '', '23020450', '2024-09-30 00:48:17', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(442, 1, '23020452', '0101562930', '7208124709100001', 'Fitri Yuvida Ayu', 'Kayu Agung', '2010-09-07', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Joko Purnomo', 'Warti Wulandari', NULL, NULL, '', '', NULL, NULL, NULL, '085340576553', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020452', '$2a$08$PT59w/bsSvZ4jrU2hg940eRMq3lGks/ew6K8lOyqjHg3hbiD.v3Ra', '', '', '0000-00-00 00:00:00', '', '23020452', '2024-10-05 01:31:31', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(443, 1, '23020453', '0104491091', '7208074606100003', 'Gresia Karoline', 'Kayu Agung', '2010-06-06', 'P', 'Kristen', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'I Wayan Jaya Wirawan', 'Made Ayu Kristiani', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020453', '$2a$08$5oqTIx9lUywsASOx/Gc.puRbfqbReKqpJ1CVQo4xYABqsJ1l5y4uO', '', '', '0000-00-00 00:00:00', '', '23020453', '2024-09-24 03:05:26', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(444, 1, '23020454', '0104953417', '7208126311100001', 'Hazrania', 'Sumber Agung', '2010-11-23', 'P', 'Islam', 'Jl. Gajah Mada', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Suroso', 'Ida Laksana', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 1 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020454', '$2a$08$jxyQXi41VV.qEY5iWGgPH.l71.71OGCTJG2xZAXOJY.b6lyXkX2gK', '', '', '0000-00-00 00:00:00', '', '23020454', '2024-09-24 03:08:28', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(445, 1, '23020455', '3106826202', '7208125711100001', 'Hidayanti', 'Sumber Agung', '2010-11-17', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Jauri', 'Castriah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020455', '$2a$08$82zRTrfHIGpggLvInKYyp.VqU17LagiBfmLe73V3Ej0rq7R1DYv9e', '', '', '0000-00-00 00:00:00', '', '23020455', '2024-10-05 03:46:26', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(446, 1, '23010456', '0108741860', '7208070610100002', 'I Wayan Jasen Kristiadi', 'Bosagon Jaya', '2010-10-06', 'L', 'Kristen', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'I Ketut Budi Yasa', 'Niluh Yuni Krismayanti', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010456', '$2a$08$t7u3npVF1/wlR7oyXf2q0OmxNknjIqumARJZA2sRJV6rV477uGQMi', '', '', '0000-00-00 00:00:00', '', '23010456', '2024-09-24 03:13:24', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(447, 1, '23010457', '0106305111', '7208122005100001', 'Ibnu Raditya', 'Kayu Agung', '2010-05-20', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sutarno', 'Eko Supartiningsih', NULL, NULL, '', '', NULL, NULL, NULL, '082352539750', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010457', '$2a$08$ZEuciUEqU4ero4xA97ozYuMO3znmHBk1N0VyWx3/TtCCh076nhe0m', '', '', '0000-00-00 00:00:00', '', '23010457', '2024-09-24 02:59:59', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(448, 1, '23020458', '0113593325', '7208075001110001', 'Ira Dwi Astuti', 'Tinombala', '2011-01-10', 'P', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sugito', 'Asngadah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020458', '$2a$08$3PPr48FGPR6HjLp9ldUBruKX.Z43Ihnao7FjApdf2Ikywan2YeiJm', '', '', '0000-00-00 00:00:00', '', '23020458', '2024-10-05 01:30:27', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(449, 1, '23020459', '0108727353', '7208124606100001', 'Iyana Taskia', 'Kayu Agung', '2010-06-06', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Muh. Arifin', 'Casmiatun', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020459', '$2a$08$yTzz4yN5RpApXaOyJJCV6Oi9e94pixi5MRwh4AQYa2qasw2L8tnBO', '', '', '0000-00-00 00:00:00', '', '23020459', '2024-09-24 03:08:52', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(451, 1, '23020461', '0109977710', '7208126701100002', 'Karisma', 'Kayu Agung', '2010-01-27', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Marlan', 'Misinah', NULL, NULL, '', '', NULL, NULL, NULL, '085757558797', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020461', '$2a$08$syyJv6rDDdU7CsEiS.3ayO2nK7dAy.XT8SRDr1Dodw7ojlFq.7F76', '', '', '0000-00-00 00:00:00', '', '23020461', '2024-10-05 01:24:19', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(452, 1, '23010462', '0113408880', '7208122801110001', 'Khoiru Fahmi', 'Kayu Agung', '2011-01-28', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sapi\'i', 'Sunarti', NULL, NULL, '', '', NULL, NULL, NULL, '082292620692', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010462', '$2a$08$prlzd6wo/uzrUWi9ggU8ueZMz7qwix.SjGzlGc/a5v9Zd.1ceLY6G', '', '', '0000-00-00 00:00:00', '', '23010462', '2024-09-24 02:59:53', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(453, 1, '23010463', '0114194901', '7502012808110004', 'Khoirul Pajri', 'Cilacap', '2011-08-28', 'L', 'Islam', 'Tayem Timur', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Warsono', 'Lia Usmawanti', NULL, NULL, '', '', NULL, NULL, NULL, '081215615606', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010463', '$2a$08$C2812C2luzisea63zVGv7ew/xMBerQBW6yxqnd8oEoIS3XrQEZluy', '', '', '0000-00-00 00:00:00', '', '23010463', '2024-09-30 00:44:58', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(454, 1, '23020464', '3114372956', '7208125202110001', 'Khusnul Khotimah', 'Kayu Agung', '2011-02-12', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Maspupah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020464', '$2a$08$HMieHGqALffcTLyDzubQpuBobUw5pKAbSwEVSxjbJkuMXfioX88Q2', '', '', '0000-00-00 00:00:00', '', '23020464', '2024-09-24 03:05:13', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(455, 1, '23020465', '0103782759', '7208124707100001', 'Laela Dwi Anjani', 'Sumber Agung', '2010-07-07', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Siti Jamila', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020465', '$2a$08$0sTxW1BYf.EBtbM42C2Te.MxHa8JW6gulN3lpf2aC7JJi3J.FDPo6', '', '', '0000-00-00 00:00:00', '', '23020465', '2024-09-24 03:00:31', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(456, 1, '23020466', '0094417696', '7208124807090001', 'Lailatul Badriyah', 'Kayu Agung', '2009-07-08', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Rari Samuri', 'Eni Betrik', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020466', '$2a$08$mr0LwWDSt2Rnw./UdQydd.010Yp/ofIDZ6nUyGoaB7gpoS.POMQzS', '', '', '0000-00-00 00:00:00', '', '23020466', '2024-10-05 01:29:48', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(457, 1, '23020467', '0106504152', '7208072103100001', 'Leoni Pudensia Ponga', 'Bosagon', '2010-05-21', 'P', 'Katholik', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Apolos Ponga', 'Niluh Murniati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020467', '$2a$08$yk.Wa5GKmA4C/s5Ubx5JbO9mq9FyJjDtEZQ8SGbVg1g1MAiOY1.3e', '', '', '0000-00-00 00:00:00', '', '23020467', '2024-09-24 03:05:43', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(458, 1, '23010468', '0107741139', '7208070410100003', 'Lifki Indra Maulana', 'Tinombala', '2010-10-04', 'L', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Fitria', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010468', '$2a$08$714YBDincAZ4Rmuyk0q.WeYuWKwSLBHz3ZnAZ30hQOk0NkufjQBdS', '', '', '0000-00-00 00:00:00', '', '23010468', '2024-09-30 00:47:22', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(459, 1, '23020469', '0115672605', '7208077001110001', 'Lilik', 'Tinombala', '2011-01-30', 'P', 'Islam', 'Jln. Gunung Tinombala', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Dedy Parwito', 'Surati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020469', '$2a$08$HsdNAd6/kGwRS7Wk50Ix3OHog8orsv1JtUX5HxcJgPXfGKcCZOtb6', '', '', '0000-00-00 00:00:00', '', '23020469', '2024-10-05 01:24:03', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(460, 1, '23010470', '3106005866', '7208121412100001', 'M. Ahsanul Insan', 'Kayu Agung', '2010-12-14', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Khudori', 'Wuryandari', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010470', '$2a$08$5iBN/tRSwi7H6/dUHARhI.fTxEIMU9AhmRzf6Ns3xgUF2ZLSPmhda', '', '', '0000-00-00 00:00:00', '', '23010470', '2024-10-05 01:31:56', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(461, 1, '23020471', '0116077816', '7208124801110001', 'Melly Suwandari', 'Kayu Agung', '2011-01-08', 'P', 'Kristen', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Wayan Sudi Adnyana', 'Wayan Widiyani', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020471', '$2a$08$om6ETOxpvvpKJ2MMTskeSOZ0g1k8.5TEAtFfQENGXf2//2YRQB9fq', '', '', '0000-00-00 00:00:00', '', '23020471', '2024-09-24 03:01:09', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(462, 1, '23010472', '3117181980', '7208122602110001', 'Moh. Amar Husen', 'Sumber Agung', '2011-02-26', 'L', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Sarotun', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010472', '$2a$08$aj2.OAZs.881jMOkHQDVoOGzgIvjkwX6lGTRIWtu7oNjvhpnqpNru', '', '', '0000-00-00 00:00:00', '', '23010472', '2024-10-05 01:29:55', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(464, 1, '23010474', '0102494467', '7208120911100001', 'Moh. Farid', 'Sumber Agung', '2010-11-09', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Lilis Setiawati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010474', '$2a$08$z/ae64ZhVD..iQLsnsWKhOv6CVs2U3Trhul.yT0NPC9qovSL206Yu', '', '', '0000-00-00 00:00:00', '', '23010474', '2024-10-05 01:32:08', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(465, 1, '23010475', '0107531691', '7208071112100002', 'Moh. Rafianza', 'Tinombala', '2010-12-11', 'L', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Supriatin', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010475', '$2a$08$skL.fka5IzjtGlYn/VgtfO/V6ALsjKyh7GFpshIajq9lBMfd.8X1K', '', '', '0000-00-00 00:00:00', '', '23010475', '2024-10-05 01:34:02', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(467, 1, '23010477', '3102770405', '7604061207100002', 'Muh. Halim Nawawi', 'Polewali Mandar', '2010-07-12', 'L', 'Islam', 'Dusun Iv Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Hasbudiman', 'Sumra', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010477', '$2a$08$MS8hlP8k7UWQEdFmCMyR5OVmoysV93eYyfHPdS93tL/3cn0OxqLOy', '', '', '0000-00-00 00:00:00', '', '23010477', '2024-10-05 01:34:37', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(468, 1, '23020478', '0106798135', '7208126808100001', 'Naila Nur Rahma', 'Kayu Agung', '2010-08-24', 'P', 'Islam', 'Dusun 6 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Setiyohadi', 'Badriah', NULL, NULL, '', '', NULL, NULL, NULL, '085335506947', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020478', '$2a$08$5OnKP24d7xn2jBDL8N1v5.RqHeCzDrRW9mhZIDys4E6r5Xu2Up7HG', '', '', '0000-00-00 00:00:00', '', '23020478', '2024-10-05 01:31:38', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(469, 1, '23020479', '0106250728', '7105122110100001', 'Novita Azizah', 'Tinombala', '2010-10-21', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Bambang Hermanto', 'Endang', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020479', '$2a$08$47jagPKEsvPR8Jwb39AvEOLw9Cmz/PSJnMDS2bznJm4LczkJo6pdi', '', '', '0000-00-00 00:00:00', '', '23020479', '2024-05-15 13:31:03', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(470, 1, '23020480', '3109351654', '7208125110100001', 'Nuraini', 'Sumber Agung', '2010-10-11', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Arman', 'Lina', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020480', '$2a$08$pfg8oigfM.OdKZVbNyURPOXug8eGhPLpEKu.6bljXF34Fv0FKk5eS', '', '', '0000-00-00 00:00:00', '', '23020480', '2024-09-30 00:41:56', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(471, 1, '23020481', '0104388546', '7208076705100001', 'Nuralisa', 'Bosagon', '2010-05-27', 'P', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Abdul Gafur', 'Masni', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020481', '$2a$08$hlCzThm.mOxITTYLXaZjvuLAkbCsHiH09KOAYFm7PS.4YNVt0RlNS', '', '', '0000-00-00 00:00:00', '', '23020481', '2024-09-30 00:40:37', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(473, 1, '23020483', '3109915539', '7208076610100003', 'Putri Amelia', 'Palu', '2010-10-26', 'P', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Musrifah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020483', '$2a$08$ChCXv01hXm1yPjxFMvrDRu1DgSOgh9oeYt9wcCdkJue4ioEPK/2Na', '', '', '0000-00-00 00:00:00', '', '23020483', '2024-09-24 03:05:34', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(475, 1, '23010485', '0101938567', '7208221412100001', 'Rafandi', 'Tabolobolo', '2010-12-14', 'L', 'Islam', 'Jln Padaidi', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Ambo Dallek', 'Rumini', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD K Tabolo Bolo', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010485', '$2a$08$oYPRLfqBu9.fhS7jaYQeT.BVHSLke9zNJbuQIxLsZl2PWMEwT3LgS', '', '', '0000-00-00 00:00:00', '', '23010485', '2024-10-05 01:37:05', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(476, 1, '23010486', '0104394971', '7208072308100002', 'Ramadan', 'Tabolobolo', '2010-08-23', 'L', 'Islam', 'Jln Padaidi ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Taha', 'Ayu', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD K Tabolo Bolo', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010486', '$2a$08$bXMaSAS5JEMpsSf7E2YD1ONU7RWUtljoJjUe0bsKFSN9RkMFBgplW', '', '', '0000-00-00 00:00:00', '', '23010486', '2024-10-05 01:33:14', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(477, 1, '23010487', '0117375810', '7208122705110001', 'Rawlins Putra Erdian', 'Kayu Agung', '2011-05-27', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', '', '', 'Parigi Moutong', 'Sulawesi Tengah', '94476', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Romadianto', 'Ernawati', NULL, NULL, '', '', NULL, NULL, NULL, '085757554807', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010487', '$2a$08$aYyJnOmGrCPx/bMDtO689OBwLw1/oG9d4hRWuYIlRNqzSne09.alm', '', '', '0000-00-00 00:00:00', '', '23010487', '2024-09-24 03:07:34', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(478, 1, '23020488', '0107328633', '7208125610100001', 'Refina', 'Kayu Agung', '2010-10-16', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Abdul Latif', 'Markijah', NULL, NULL, '', '', NULL, NULL, NULL, '082394830754', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020488', '$2a$08$KibzP/tYd0IRLXZAAXsfYu9MGu.1K2bQFTrjN9VVT5Rxvuw1.5HSO', '', '', '0000-00-00 00:00:00', '', '23020488', '2024-10-05 01:30:54', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(479, 1, '23010489', '0111947031', '7208071002110001', 'Reifan Pratama', 'Tinombala', '2011-02-10', 'L', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Muhammad Solihin', 'Purwanti', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010489', '$2a$08$w095kmFNkPSfRTklOuQ71OWVZjy4PqbeChbGmgAtuzMKneW3LdiQC', '', '', '0000-00-00 00:00:00', '', '23010489', '2024-09-24 03:05:26', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(481, 1, '23020491', '0101755400', '7208125305100001', 'Restu Tri Utami', 'Kayu Agung', '2010-05-13', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Kliwon', 'Sainem', NULL, NULL, '', '', NULL, NULL, NULL, '085398973046', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020491', '$2a$08$6/kFPOqKAzCYxCDhdoQTqO8NvpgRHkfZDVKFtoost13FmfKV10ey6', '', '', '0000-00-00 00:00:00', '', '23020491', '2024-09-24 03:00:06', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(482, 1, '23010492', '0094256518', '7208122812090002', 'Restu Wahid Saputra', 'Kayu Agung', '2009-12-28', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sohir Bambang Irawan', 'Ririn Tiana', NULL, NULL, '', '', NULL, NULL, NULL, '085757581536', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010492', '$2a$08$6MTBFTkaNEdhuBAN0Zp7AOxnBKrPHCK34DZYbZEEtM8SE/9Hza/pi', '', '', '0000-00-00 00:00:00', '', '23010492', '2024-09-24 03:06:38', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(483, 1, '23020493', '0107314041', '7208124112100001', 'Revia Kardia Ningsih', 'Kayu Agung', '2010-12-01', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Turkamun', 'Sarmi', NULL, NULL, '', '', NULL, NULL, NULL, '081523733772', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020493', '$2a$08$Po.xwj1feWjbWcEZoelD6OEBqX1SwhdhfQ2iDAq.EuAlr004czhAq', '', '', '0000-00-00 00:00:00', '', '23020493', '2024-09-30 00:48:40', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(484, 1, '23020494', '0119591894', '7208125302110001', 'Rica Dwi Astuti', 'Kayu Agung', '2011-02-13', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Moh. Isnaeni', 'Murtini', NULL, NULL, '', '', NULL, NULL, NULL, '085267058338', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020494', '$2a$08$CC3Yz2XqCYGogPCBr2tYjuCsvADqb46zZNyJpZO9LhlkQBgHgGBiu', '', '', '0000-00-00 00:00:00', '', '23020494', '2024-09-30 00:38:11', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(485, 1, '23010495', '0104452270', '7208120804100001', 'Rifky Ferdian', 'Kayu Agung', '2010-04-08', 'L', 'Islam', 'Ponorogo', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sukoco', 'Siti Rohati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010495', '$2a$08$8trGYMltCFLV6Y3cPJOg1Oy06Ulu73Ao8XmRo/Kx6mto8czvkB19e', '', '', '0000-00-00 00:00:00', '', '23010495', '2024-10-05 01:31:03', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(490, 1, '23020500', '0109605370', '7208075107100001', 'Safa Diana', 'Tinombala', '2010-07-11', 'P', 'Islam', 'Tinombala', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Suyadi', 'Vikawati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020500', '$2a$08$MinM2rlr.g2udDp5AuHV2.sd4ktmXQhkN.PST1uyDhZg5614TL18u', '', '', '0000-00-00 00:00:00', '', '23020500', '2024-10-05 01:35:03', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(491, 1, '23020501', '0104406284', '7208074703100002', 'Sakina', 'Tabolo Bolo', '2010-03-07', 'P', 'Islam', 'Dusunn III Desa Tabolo Bolo', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Lacanambo', 'Linda', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD K Tabolo Bolo', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020501', '$2a$08$YDTBXYJWcsqf5bU4lTDwIOWcSpAnXhbezYDaNFteGonEMdJVM4OlO', '', '', '0000-00-00 00:00:00', '', '23020501', '2024-10-05 01:36:23', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(492, 1, '23020502', '3114232770', '7208076603110001', 'Salwa Annafizah', 'Bosagon', '2011-03-26', 'P', 'Islam', 'Dusun Ii', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Siti Masyitha', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020502', '$2a$08$ZScbpFA2zDSLtU4Ih/wHAusgA1hw0hZdwmhab01GiIDgUNC5PfCj6', '', '', '0000-00-00 00:00:00', '', '23020502', '2024-10-05 01:39:04', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(493, 1, '23010503', '0096682411', '7208072912090001', 'Sandi Rizki Saputra', 'Tinombala', '2009-12-29', 'L', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sutono', 'Wiji Lestari', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010503', '$2a$08$Wbl5wJnr8fvAPOkowzOR5exwoSjID3H0PFnX0J.KAQCa4NaiWJC7e', '', '', '0000-00-00 00:00:00', '', '23010503', '2024-09-30 00:53:29', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(494, 1, '23020504', '0111577713', '7208124107110004', 'Seftyana Putri', 'Sumber Agung', '2011-07-01', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Mohrodin M.D', 'Yati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020504', '$2a$08$J6CG1qPMZ8drazThjUlwi.JAMv1poPrEbiDmoHlGk5ZvHrN83PfZi', '', '', '0000-00-00 00:00:00', '', '23020504', '2024-10-05 01:31:06', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(495, 1, '23020505', '0098501291', '7208075308090001', 'Selvi Nur Anjani', 'Tinombala', '2009-08-13', 'P', 'Islam', 'Dusun 4 Desa Kayuagung', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Giran', 'Anismiwati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020505', '$2a$08$ANhedTjVOmYE80scr95yduoljD1f7e8u8Z3BIFApwWqVnCN4xYbJm', '', '', '0000-00-00 00:00:00', '', '23020505', '2024-10-05 01:28:55', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(496, 1, '23020506', '0102044664', '7208076407100001', 'Selvilia Ananta', 'Tinombala', '2010-07-24', 'P', 'Islam', 'Tinombala', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Ahmad Nursalim', 'Juarianingsih', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020506', '$2a$08$JBsXhVq2lzZmkszbMIGRSOE.DCwrCjljUQ.GkBDHWcSMrlo8GrmUW', '', '', '0000-00-00 00:00:00', '', '23020506', '2024-09-24 03:06:18', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(497, 1, '23020507', '0114900776', '7208126805110001', 'Shinta Sri Anggraini', 'Kayu Agung', '2011-05-28', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sarto Warni', 'Wiwil Milawati', NULL, NULL, '', '', NULL, NULL, NULL, '085796318994', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020507', '$2a$08$T9l1y8rCLiRut7TdfXOqw.Aivt.b175gxLByKZ1GQ.q/qXKB6NAT2', '', '', '0000-00-00 00:00:00', '', '23020507', '2024-09-30 00:51:48', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(498, 1, '23020508', '3102631793', '7208074803100001', 'Siti Muarifah', 'Tinombala', '2010-03-08', 'P', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, NULL, 'Sri Rahayu', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020508', '$2a$08$STRNJEYxQVyuvEbPbN3YqOH1pYwaEuvji9KFnVl5f2l1rEUZG3srK', '', '', '0000-00-00 00:00:00', '', '23020508', '2024-10-05 01:35:41', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(499, 1, '23020509', '0109378773', '7208075305100001', 'Siti Nurfadila', 'Tabolo Bolo', '2010-05-13', 'P', 'Islam', 'Dusun IV Desa Tabolo Bolo', NULL, NULL, NULL, NULL, '', '', NULL, 6, NULL, NULL, NULL, '', '2023', 1, NULL, 'Dahlan', 'Masnah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD K Tabolo Bolo', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020509', '$2a$08$YiV3VTga6eyN66sWLSViOOrhpeolhrPZdNw5VDpkfB5tyuzrhxigS', '', '', '0000-00-00 00:00:00', '', '23020509', '2024-10-05 01:29:17', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(500, 1, '23020510', '0106537627', '7208125204100001', 'Siti Nurhayati', 'Sumber Agung', '2010-04-12', 'P', 'Islam', 'Merpati', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sarudin', 'Nurmiah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020510', '$2a$08$iBM/ol4Bjoa1W8GWucjAfOuguDSHJBguaBJ08Bh2S8Q3K.XqWoecy', '', '', '0000-00-00 00:00:00', '', '23020510', '2024-09-30 00:40:34', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46');
INSERT INTO `siswa` (`id_siswa`, `id_sekolah`, `nis`, `nisn`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `email`, `ekonomi`, `anak_ke`, `jml_saudara`, `id_saudara`, `foto`, `telp`, `angkatan`, `program_studi`, `id_ortu`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `pendidikan_ayah`, `pendidikan_ibu`, `ttl_ayah`, `ttl_ibu`, `alamat_ortu`, `hp_ortu`, `hp_ibu`, `tentang_orangtua`, `asal_sekolah`, `masuk_dikelas`, `diterima_tapel`, `diterima_semester`, `alamat_asal_sekolah`, `ijazah_no`, `ijazah_thn`, `tgl_daftar`, `status`, `dok_akta`, `dok_kk`, `dok_ijazah`, `dok_skhun`, `dok_kip`, `no_ujian`, `ruang_ujian`, `sesi_ujian`, `kode_undangan`, `username`, `password`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `token`, `last_login`, `active`, `created_at`, `updated_at`) VALUES
(501, 1, '23020511', '0109886588', '7208126407110003', 'Siti Raudatun Hasanah', 'Sumber Agung', '2010-07-24', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Asep Suroso', 'Wiwin Winarti', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020511', '$2a$08$H.JYowG5NOrb.esjTAGJHODD39nFAYM1xB3NgIboMfuaIb/7TDSva', '', '', '0000-00-00 00:00:00', '', '23020511', '2024-09-30 00:46:37', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(502, 1, '23010512', '0083446426', '7208121104090001', 'Sujarno', 'Sumber Agung', '2008-01-11', 'L', 'Islam', 'Jl. Nusantara', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sutiman', 'Hasanah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010512', '$2a$08$5pjerGPeyNlD.rVNf1jaQOvVzQQAajLIf.KunUHvEotNwvEGeGRGa', '', '', '0000-00-00 00:00:00', '', '23010512', '2024-09-24 03:01:32', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(503, 1, '23010513', '0107178549', '7208221211100001', 'Suwito', 'Tinombala', '2010-11-12', 'L', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Sokah', 'Tita Apriyanti', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010513', '$2a$08$mZ3b93OEjOU21Id7yYO48euLFLcipwzBFAKIgcAnkBJ3jYKnRLYdW', '', '', '0000-00-00 00:00:00', '', '23010513', '2024-10-05 01:32:03', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(504, 1, '23020514', '0095497082', '7208124509090003', 'Tiara Tri Ramadani', 'Kayu Agung', '2009-09-05', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Jufri S.', 'Suratun', NULL, NULL, '', '', NULL, NULL, NULL, '085234726994', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020514', '$2a$08$tbUkLdT1c77vPX1gXPPJMeoE6pkYUGEvjQ0Wwh6tJSpZFqNqGkb1u', '', '', '0000-00-00 00:00:00', '', '23020514', '2024-09-30 00:43:16', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(506, 1, '23010516', '0023010503', '7208070807100003', 'Yelki Sunardin', 'Palasa', '2010-06-18', 'L', 'Islam', 'Bosagon Jaya', 'Bosagon Jaya', 'Ongka Malino', 'Parigi Moutong', NULL, '94479', '', '', 1, 0, NULL, NULL, '', '2023', 1, NULL, '-', 'Yerlin', '', '', '', '', NULL, NULL, '', '', '', NULL, 'SD Inpres 3 Malino', '7A', 9, 1, '', '', '', '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010516', '$2a$08$kcitLCBbalIgEOH2rIaPTuEBAkjCTIiA1HlLL95W5QGpAYjaDbUjO', '', '', '0000-00-00 00:00:00', '', '23010516', '2024-09-30 00:43:45', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(507, 1, '23020517', '0113891566', '7208127004110001', 'Yesi Aprilia', 'Kayu Agung', '2011-04-30', 'P', 'Islam', 'Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Arif', 'Susilowati', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020517', '$2a$08$la.7.TTPImmIBVCECZKYuuIr0NqFW3HmtveK2jDJd3ght4sn6nvlG', '', '', '0000-00-00 00:00:00', '', '23020517', '2024-09-30 00:39:50', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(508, 1, '23010518', '0103558095', '7208120307100001', 'Yusup Praditia', 'Sumber Agung', '2010-07-03', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2023', 1, NULL, 'Satam', 'Tumirah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23010518', '$2a$08$zKRd7dJ/SnCiREwD9LWZ0.DKFNvpXwi9Ki8xtRBjcwTsBYesaP7u2', '', '', '0000-00-00 00:00:00', '', '23010518', '2024-09-24 03:05:33', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(509, 1, '23020519', '0109466837', '7208127011100001', 'Zahira', 'Sumber Agung', '2010-11-30', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2023', 1, NULL, 'Baba', 'Jurhana', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Kayu Agung', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020519', '$2a$08$vb2j6vTgW69dgsDcIVpi8Onem4CN8Wbtc5Z8k4BE7Vofdgi8bL5gq', '', '', '0000-00-00 00:00:00', '', '23020519', '2024-10-05 14:39:36', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(510, 1, '23020520', '0118559635', '7208226203110001', 'Zahra Salzabillah', 'Tabolo-Bolo', '2011-03-22', 'P', 'Islam', 'Dusun II Desa Tabolo Bolo', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2023', 1, NULL, 'Kandacong', 'Sitti Radiah', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD K Tabolo Bolo', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020520', '$2a$08$m3DyhkcO6F6k7/3P0rC2v.xSGoGQ4h1dRVq4WG0OLKQbB3BIS2.32', '', '', '0000-00-00 00:00:00', '', '23020520', '2024-09-30 00:40:50', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(511, 1, '23020521', '0103895922', '7208224907101001', 'Zahwa', 'Bosagon', '2010-07-09', 'P', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2023', 1, NULL, 'Wahyudi', 'Riska', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Malino', NULL, 9, 1, NULL, NULL, NULL, '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020521', '$2a$08$yeCw5nzssCi0nlLl1nnZM.5gsFydT7gonfr/8jwKAS8spNPDF8NEC', '', '', '0000-00-00 00:00:00', '', '23020521', '2024-05-15 13:31:03', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(512, 1, '23020522', '0104792612', '7208225606100001', 'Alviana Aulia', 'Tinombala', '2010-06-16', 'P', 'Islam', 'Tinombala Sejati', 'Tinombala Sejati', 'Ongka Malino', 'Parigi Moutong', NULL, '94476', '', NULL, NULL, 0, NULL, NULL, '', '2023', 1, NULL, 'Waluyo', 'Nurhayati', 'Petani', 'Petani', '', '', NULL, NULL, '', '', '', NULL, 'MIN 3 Parigi', '7C', 9, 1, 'Tinombala', '', '', '2023-07-10', 'baru', '', '', '', '', '', '', '', '', NULL, '23020522', '$2a$08$dbQEpbS6qGTyk6fNCAmeEOWCrUuQgQTEkG4SQNZx9IvZ2rb/W.Sp.', '', '', '0000-00-00 00:00:00', '', '23020522', '2024-05-26 12:51:02', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(514, 1, '24020524', '0111053805', '7208126809111001', 'Adelina Putri ', 'Sumber Agung ', '2011-09-28', 'P', 'Islam', 'Sumber Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, 'adelina_putri.png', '', '2024-2025', 1, NULL, 'Harisun ', 'Siti Mardiana ', 'Petani/Pekebun ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082194764371', '', NULL, 'SD Inpres 3 Kayuagung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020524', '$2y$10$pCaTljWVPxTv3Mhzx9JaiumkPtCG97Yj85YHn5FEBpq0.zVQMWSWW', '', '', '0000-00-00 00:00:00', '', '55c6a19ff70ac703dfdefaac4098b812', '2025-08-31 08:02:45', 1, '2025-06-30 13:42:46', '2025-09-01 16:02:45'),
(515, 1, '24010525', '0119739808', '7208222404111001', 'Aditya Wahyudi', 'Tinombala Jaya', '2011-04-24', 'L', 'Islam', 'Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Suyadi', 'Sri Rahayuni', 'Petani', 'Petani', '', '', NULL, NULL, NULL, '081524451256', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010525', '$2a$08$AqRPHi2bm3jEXTAvzpyqIe4PuaR5AzUThcUTWiq2wld34wpVj1O3W', '', '', '0000-00-00 00:00:00', '', '24010525', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(516, 1, '24020526', '1292556569', '7208076105120001', 'Afikadila Anggraeni ', 'Tinombala ', '2012-05-21', 'P', 'Islam', 'Tinombala Induk ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Agus Muranto', 'Indah Lestari ', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081525924559', '', NULL, 'MIN 3 Parigi ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020526', '$2a$08$TaGvg8XHxShc6CYdbpynRu93LLNiRen/p/03xDO0gfMHJHst68DkW', '', '', '0000-00-00 00:00:00', '', '24020526', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(517, 1, '24010527', '3115672986', '7208122101110001', 'Akbar Azzahir', 'Kayu Agung', '2011-01-21', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Nursyam', 'Ria Rahma Wati', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085825306619', '', NULL, 'MIS Hidayatul Mubtadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010527', '$2a$08$jGYBLs5EvKBSTxqem9RZou0yOttLsgXMReM1G43flc.TJ308k.8pi', '', '', '0000-00-00 00:00:00', '', '24010527', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(518, 1, '24010528', NULL, '7208120601120002', 'Alfin Duwi Nata', 'Kayu Agung', '2012-01-06', 'L', 'Islam', 'Dusun IV Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Jarianto', 'Siti Mahmudah', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085825268034', '', NULL, 'MIS Hidayatul Mutadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010528', '$2a$08$W3KmWrZrDMFFVJB7lXKRV.KUJEjefF5gFrDBvvcutW5cQspnmwAYu', '', '', '0000-00-00 00:00:00', '', '24010528', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(519, 1, '24010529', '0101515990', '7208072512100002', 'Andika', 'Malino', '2010-11-25', 'L', 'Islam', 'Malino ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sumarton ', 'Misna ', 'Petani ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085345307671', '', NULL, 'SDN Malino ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010529', '$2a$08$LMQQuxfYo0cPrc/feK/vcu5HmrCMUb06T4aeFvkjN.gTPImvVasMm', '', '', '0000-00-00 00:00:00', '', '24010529', '2025-10-01 08:23:32', 1, '2025-06-30 13:42:46', '2025-10-02 16:23:32'),
(520, 1, '24010530', '3122886927', '7208120601120002', 'Azka Muhammad Syariza', ' Kayu Agung', '2012-01-06', 'L', 'Islam', 'Kayuagung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Jarianto', 'Siti Mahmudah', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085825268034', '', NULL, ' SD Inpres 2 Kayuagung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010530', '$2a$08$SgmZ80gN8p6Eh4FmiW9gDOClsAfrKSbZwAzHTuzvVzt7RTa0/oAAK', '', '', '0000-00-00 00:00:00', '', '24010530', '2024-09-26 03:03:56', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(521, 1, '24020531', '0116861477', '7208225705110002', 'Asmaul Husna', 'Kayu Agung', '2011-05-07', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Abdulah. R', 'Farida', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '08152528220', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020531', '$2a$08$BLXWTsceCG1GWNnIbm.aOeZzzs1hxbxlm/vdl8sOfOerk.PeSPOqy', '', '', '0000-00-00 00:00:00', '', '24020531', '2024-09-22 02:59:26', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(522, 1, '24020532', '011066883', '7208125307110002', 'Azizah Fitriani', 'Kayu Agung', '2011-07-13', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Salehudin', 'Ani Rohmah', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085241383255', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020532', '$2y$10$v.Fm2iMXNf4B3leJj98iMeygboZzhbtUlPxKII6sKaRYGODrP37oG', '', '', '0000-00-00 00:00:00', '', '2f54920ceea669a27176882615ae055a', '2025-08-20 05:45:25', 1, '2025-06-30 13:42:46', '2025-08-21 13:45:25'),
(524, 1, '24010534', '0111829220', '7208011607110001', 'Bagas Rahmanan ', 'Parigi ', '2011-07-16', 'L', 'Islam', 'Kayuagung ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Slamet Untung ', 'Siti Nurhayati ', 'Tani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085824227430', '', NULL, 'SD Inpres 2 ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010534', '$2a$08$pE45rGZ7pkkH69m6TOiXBOb4OtXcGBaDMBIMMNuM7vzJ/wZdVZn26', '', '', '0000-00-00 00:00:00', '', '24010534', '2024-09-26 03:14:08', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(525, 1, '24020535', '3117725578', '7208076811110002', 'Chalista ', 'Ongka', '2024-11-28', 'P', 'Kristen', 'Tabolo-Bolo ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'I Wayan Kornilius', 'Niluh Muriani', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085823985080', '', NULL, 'SDK Tabolo-Bolo ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020535', '$2a$08$rRJ89QRxLe2xvswTHewpTOonmSW6MGghWGSDFN1sND2Mqg31zaMKy', '', '', '0000-00-00 00:00:00', '', '24020535', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(526, 1, '24020536', '3117725578', '7271015211110002', 'Defysta Alika Putri', 'Palu', '2011-11-12', 'P', 'Islam', 'Kayuagung, Dsn 5', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Dedy Suparjianto', 'Febrina Dewi Ritonga ', 'Wiraswasta ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081523666889', '', NULL, 'SDN 1 Kayuagung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020536', '$2a$08$bpJfv/i/lIwDCnSaZqicAu6KX5UH8de3hO0bPb12xZyjUeyEDm1.e', '', '', '0000-00-00 00:00:00', '', '24020536', '2024-09-22 02:59:26', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(527, 1, '24020537', '0113025352', '7208126612110002', 'Defina Sesa Aulia', 'Parigi', '2011-12-26', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Suparman', 'Sriyatun', 'Wiraswasta', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085215903305', '', NULL, 'SD Inpres 1 Kotaraya', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020537', '$2a$08$lr13om828d0HEy5aP9PZfuI.tlwy78UcMl7daS2ibjllqszQAJtJ6', '', '', '0000-00-00 00:00:00', '', '24020537', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(528, 1, '24010538', '3115680733', '7208122605110001', 'Dhanar Satya Bayu', 'Sumber Agung', '2011-05-26', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Kosnan', 'Nur Kholimah', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '08152542144', '', NULL, 'MI Ulil Albab', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010538', '$2a$08$W2d6Vh6GF12IdlclYEGCweUgVcaKxyYc2c/L.1KgTsU7LOl/o4Kdm', '', '', '0000-00-00 00:00:00', '', '24010538', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(529, 1, '24010539', '3118196405', '7208122212110001', 'Dika Ardiansyah', 'Kayu Agung', '2011-12-22', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sumardi', 'Suhesti', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085232049517', '', NULL, 'MIS Hidayatul Mubtadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010539', '$2a$08$TglxNf.LWGqW9W/FtAsrF.Pup9aX4SYkJMPeiwrx.LXfEyvQW0.8C', '', '', '0000-00-00 00:00:00', '', '24010539', '2024-09-22 02:57:27', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(530, 1, '24010540', '0115818653', '7208125809110001', 'Dwi Nurhidayat', 'Kayu Agung ', '2011-09-18', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Haryono', 'Neni Haryanti', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085342937884', '', NULL, 'SDN 1 Kayu Agung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010540', '$2a$08$4evRmgZJI9j3h4FZ0iDZduJIu0AhnqusAu2xQhdudAklmkMzNpZWS', '', '', '0000-00-00 00:00:00', '', '24010540', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(531, 1, '24010541', '0111007466', '7208071104110001', 'Edi Saputra', 'Parigi Moutong', '2011-04-11', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Mahmud', 'Nuryani', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082345757961', '', NULL, '-', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010541', '$2a$08$cnyQs4I3e8Y1BLHLJufNx.pyPGuk5gKF1OSsI6oDrAI9Ib7BRtCxK', '', '', '0000-00-00 00:00:00', '', '24010541', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(532, 1, '24010542', '3112622292', '7208122908110001', 'Fadil Khoirul Rizki', 'Kayu Agung', '2011-08-29', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sarno', 'Sumini', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '083832810323', '', NULL, 'MIS Hidayatul Mubtadi-Ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010542', '$2a$08$skw42RIz/tnlu.wZ6reuZudheO4L9KcaLBu7haEW0yU3u3bhCYGu2', '', '', '0000-00-00 00:00:00', '', '24010542', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(534, 1, '24010544', '0124711807', '7208120701120001', 'Fazza Alfan Alkayis', 'Kayu Agung', '2012-01-07', 'L', 'Islam', 'Kayuagung Dusun 9', 'Kayuagung', 'Mepanga', 'Parigi Moutong', NULL, '', '', '', 1, 2, NULL, NULL, '', '2024-2025', 1, NULL, 'Darwin M.', 'Ari Rahmawati', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, 'Kayuagung Dusun 9', '082231241475', '', NULL, 'SDN Kayuagung', '7A', 10, 1, 'Jl. Siswa No. 7 Desa Kayuagung Kec. Mepanga Kab. Parigi Moutong Prov. Sulawesi Tengah', '', '', '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010544', '$2a$08$osFCDtnsrzP9zH.rrBCnN.G5tnDozRtmM8WYKCILoYUGXC6JQz1Yy', '', '', '0000-00-00 00:00:00', '', '24010544', '2024-09-26 03:11:43', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(535, 1, '24010545', '0114598092', '7271041210110001', 'Harith Hasiq Turijo', 'Mamboro', '2011-10-12', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Turijo', 'Yenny Conny Mokodongan', 'Perawat', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085398391867', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010545', '$2a$08$Yhmsr91BMwbhnLM.N1Smq.RjjEbr7uNAlqkt1LMQ3IcnT6xsEOQvC', '', '', '0000-00-00 00:00:00', '', '24010545', '2024-09-26 03:04:23', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(536, 1, '24020546', '0129316524', '7208075502120001', 'Iana Tunisa', 'Ogorandu', '2012-01-15', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Suwanto', 'Yayang Intan Redilah', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085397787166', '', NULL, 'SD Lambunu', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020546', '$2a$08$IIcr5hn2QeKGtOKLy.8PM.IFgVHKe4I/5n8qV4vFs3y8m9Yudb4iK', '', '', '0000-00-00 00:00:00', '', '24020546', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(537, 1, '24020547', '3128399805', '7208124305120001', 'Imel Putri Cahyani ', 'Kayu Agung', '2012-05-03', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sodikin', 'Susiani', 'Petani / Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '083871377587', '', NULL, 'MIS Hidayatul Mubtadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020547', '$2a$08$0dwqKkf9eC5raxxfMvGVaOrdyf/kZ.l.h4DPZk20Qaj.R9ZUbIJui', '', '', '0000-00-00 00:00:00', '', '24020547', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(538, 1, '24020548', '0124338643', '7208120701160001', 'Kaila Azzahra ', 'Sumber Agung', '2012-05-11', 'P', 'Hindu', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Katimin ', 'Suti In ', 'Petani/Pekebun ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082349386675', '', NULL, 'SD Inpres 3 Kayuagung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020548', '$2a$08$C0QN0r0WQQlr3yoc3V7q8erwiMxgegnbtVe3pITcQi0k8y9A32wPO', '', '', '0000-00-00 00:00:00', '', '24020548', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(539, 1, '24020549', '0117886252', '7208124810110001', 'Kaylla Aulia', 'Tinombala Jaya', '2011-10-08', 'P', 'Islam', 'Tinombala Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Priyohadi Utomo,S.Pd', 'Rohayati,S.Pd.Sd', 'Guru', 'Guru', '', '', NULL, NULL, NULL, '081523925213', '', NULL, 'SD Inpres 1 Tinombala', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020549', '$2a$08$NIhp9BK6bnZfgFcpDcKGu.4EI6UMsOjZOoZgVkl4E9iwkLUIWLyQ2', '', '', '0000-00-00 00:00:00', '', '24020549', '2024-09-22 02:57:43', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(540, 1, '24010550', '0126304623', '7208120701120003', 'Khoirul Afandy', 'Sumber Agung', '2012-01-07', 'L', 'Islam', 'Sumber Agung Dusun 3', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Mulyadi', 'Parjiah', 'Meninggal', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082131577062', '', NULL, 'SD Inpres 2 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010550', '$2a$08$eR71wkRSG185h5Ixq.ITq./lf5XCD1hHldEMFqhP8KhkQk0WD0vH6', '', '', '0000-00-00 00:00:00', '', '24010550', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(541, 1, '24020551', '0104560336', '7208126911100001', 'Khoirun Nisa ', 'Kayu Agung ', '2010-11-29', 'P', 'Islam', 'Dusun VII KAYU AGUNG ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Setiyono ', 'Sumiyem ', 'Buruh Tani ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085241383276', '', NULL, 'SD Negeri 1 Kayu Agung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020551', '$2a$08$pL1XCzcNQBlKD1n/WgEK1.nw0osZtBwq3/Bh1bIlCb/9RoVZKAK0O', '', '', '0000-00-00 00:00:00', '', '24020551', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(542, 1, '24020552', '3110345549', '7208226408110001', 'Lian Martanti', 'Tinombala', '2011-11-24', 'P', 'Islam', 'Tinombala', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sukawi', 'Dalsih', 'Pns', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081341190006', '', NULL, 'SD Inpres 1 Tinombala', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020552', '$2a$08$lvufIULnLWBoYREpM33k6uqa5NkrmDBfoaM9pVRot2pRGaI7pvHW2', '', '', '0000-00-00 00:00:00', '', '24020552', '2024-09-26 03:04:05', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(544, 1, '24010554', '0112090273', '7208092111110001', 'Marcel Cornelius', 'Padalembara', '2011-11-21', 'L', 'Kristen', 'Tinombala Induk ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Wayan Via Dolorosa', 'Made Ayu Kasiani', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082312433930', '', NULL, 'SDK Tabolo Bolo', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010554', '$2a$08$BLrlTelYONdhKTeXMmwP.Oq2yC2QALPtQG4CHclY5eLSX4yY4JGKG', '', '', '0000-00-00 00:00:00', '', '24010554', '2024-09-26 03:11:26', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(545, 1, '24020555', '9120030030', '7208225205110002', 'May Sarah', 'Tabolo Bolo', '2011-05-12', 'P', 'Islam', 'Tabolo Bolo', NULL, NULL, NULL, NULL, '', '', NULL, 7, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Hanipan', 'Sa\'dia', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '08152542495', '', NULL, 'MIN 3 Parigi', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020555', '$2a$08$9qflThqiDTsd3ISknwD9lOY8vnSejCVNWN/aJIQRhIAIzEHo0vmpW', '', '', '0000-00-00 00:00:00', '', '24020555', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(546, 1, '24020556', '1213788876', '7208074803120003', 'Marsya Chamiska', 'Tabolo-bolo', '2012-03-08', 'P', 'Islam', ' Tabolo-bolo', ' Tabolo-bolo', 'Ongka Malino', 'Parigi Moutong', NULL, '', '', '', 1, 1, NULL, NULL, '', '2024-2025', 1, NULL, 'Moh. Fadil', 'Nur Faina', 'Petani', 'Guru', '', '', NULL, NULL, 'Tabolo-bolo', '085823219885', '', NULL, '', '7A', 10, 1, '', '', '', '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020556', '$2a$08$GtcwwjidyFrR8wnrG.nXNuT7f6HlQI6sWKtAILSpanJSyNt.LKl3q', '', '', '0000-00-00 00:00:00', '', '24020556', '2024-09-26 03:11:20', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(547, 1, '24010557', '0119657660', '7208122209110001', 'Miftakhul Aziz', 'Kayu Agung', '2021-09-22', 'L', 'Islam', 'Kayu Agung Dusun 9', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Harianto ', 'Noriyah', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '0', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010557', '$2a$08$Cdr2uVlNmv6BCzfv2s1nfOkE1SWgUh8xhtCIiMFnsm/UZ0bXT7BlO', '', '', '0000-00-00 00:00:00', '', '24010557', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(548, 1, '24010558', '0127108446', '7208220104120001', 'Moh. Fahri', 'Olontigi', '2012-04-01', 'L', 'Islam', 'Tinombala Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Iksan', 'Hidayati', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '083892178240', '', NULL, '-', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010558', '$2a$08$hiCODLR.48Wl5tGkulex0eNGu3IC4AWurwFAQdrLN4K9sIHmP6zr2', '', '', '0000-00-00 00:00:00', '', '24010558', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(549, 1, '24010559', '3117064634', '7208072711110002', 'Moh. Naufal', 'Tinombala', '2011-11-27', 'L', 'Islam', 'Tinombala Barat', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Haerul Mustofa', 'Sri Rohaningsih', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081261953711', '', NULL, '-', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010559', '$2a$08$NRIJtiRklQiWVlQgJ9VodO7y7oh3pnOvm0EdwaJu6Vg5SMEnB6YYS', '', '', '0000-00-00 00:00:00', '', '24010559', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(550, 1, '24010560', NULL, '7208120510110002', 'Moh. Prayogi Madani', 'Sumber Agung', '2011-10-05', 'L', 'Islam', 'Sumber Agung Dusun V', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Moh. Mansur', 'Murni Ningsih', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081243745421', '', NULL, 'MI Ulil Albab', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010560', '$2a$08$STf60Lk1pHA5OogKhZxWPeqyvZJ6C/WfMt.A8fWEj.kIp8R3fuvp6', '', '', '0000-00-00 00:00:00', '', '24010560', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(551, 1, '24010561', '0108790518', '7208122102100001', 'Mohammad Fadel', 'Kayu Agung', '2010-02-21', 'L', 'Islam', 'Kayu Agung Dusun 6', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Ruslan', 'Meri', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081543112951', '', NULL, 'SDN 1 Kayu Agung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010561', '$2a$08$/2f3TJwAKthi3TSw4tbp.OwhxqGvV4xjYS/KXJm8fDCAGZw1M31kC', '', '', '0000-00-00 00:00:00', '', '24010561', '2024-09-22 03:00:14', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(552, 1, '24010562', '3112120157', '72081215041110001', 'Mualim Alfahmi', 'Kayu Agung', '2011-04-15', 'L', 'Islam', 'Kayu Agung Dusun 4', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Imam Jaelani', 'Siti Kholifah ', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081527149433', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010562', '$2a$08$kp99O3QOQYGYsgyY/CzFBO362t5tTPFjrIMn8aOBC017MHLM0NHty', '', '', '0000-00-00 00:00:00', '', '24010562', '2024-09-26 03:03:55', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(553, 1, '24010563', '0119813217', '7208122910110001', 'Muh. Arya Anjar Refranta', 'Kayu Agung ', '2011-10-29', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Adi Anjar Kusaeri', 'Ni Wayan Riyani', 'Tukang', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085397783744', '', NULL, 'SDN 1 Kayu Agung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010563', '$2a$08$PveJHiPwwBRn3m6G17R38.ypAmd5TrfXtfE/Ug6xcfeMrtbrDifCW', '', '', '0000-00-00 00:00:00', '', '24010563', '2024-09-26 03:04:01', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(554, 1, '24010564', '0114453759', '7208072605110001', 'Muhamad Rafqi Alamsya', 'Padengo', '2011-05-26', 'L', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Hamsah Ludin', 'Yulianti', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082352539686', '', NULL, 'SDN 2 Ongka Malino', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010564', '$2a$08$t43mccUB40KpwvzrVLjegOwoXllc0qd6uI47L2J7o4imykQukEZle', '', '', '0000-00-00 00:00:00', '', '24010564', '2024-09-26 03:11:11', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(556, 1, '24010566', '3110543168', '7208120402110001', 'Muhamad Rehan Saputra', 'Kayu Agung', '2011-02-04', 'L', 'Islam', 'Kayu Agung Dusun 7', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Panut', 'Jarmini', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081524451256', '', NULL, 'SD 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010566', '$2a$08$GWuLSDKx42SyxPYqrPoBcOgeuC7SqFfY3FEU65S6lTSIkv9tAx0Wi', '', '', '0000-00-00 00:00:00', '', '24010566', '2024-09-22 02:57:37', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(558, 1, '24010568', '0111014052', '7208070111110001', 'Muhammad Taufik', 'Tinombala', '2011-11-01', 'L', 'Islam', 'Tinombala Barat Jl. Mawar No W10', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Paimun', 'Jarni', 'Petani/Pekerjaan', 'Petani', '', '', NULL, NULL, NULL, '085656369819', '', NULL, 'SD Inpres 1 Tinombala', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010568', '$2a$08$n2m4aE8hjYJXLpiGoAHPJOyKQgHhvt4BAtZyWn4QqqI2j3qa2jRLe', '', '', '0000-00-00 00:00:00', '', '24010568', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(559, 1, '24020569', '0115772681', '7208124105110001', 'Mustika Nurindah', 'Kayu Agung', '2011-05-01', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Januri', 'Sariyem', 'PNS', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082194793390', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020569', '$2a$08$tXuZ9NlmF07zTOf5XtHNsuObiaif805/kLQjRjy7SgY8dgnyA2JUS', '', '', '0000-00-00 00:00:00', '', '24020569', '2024-09-26 03:06:49', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(560, 1, '24020570', '3124522159', '3506217006120002', 'Nabilatul Asna ', 'Kediri', '2011-06-30', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Mohamad Dukan', 'Miftakhul Janah', 'Berkebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085756013927', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020570', '$2a$08$RvOCk9GmF5USyvh1yQ1x1.P2T0YhI5BuS5LK9xtqvsQ0YodPFNKNu', '', '', '0000-00-00 00:00:00', '', '24020570', '2024-09-26 03:12:11', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(561, 1, '24020571', '3122300536', '6408135406120001', 'Natasya Ayunda Putri ', 'Malino', '2012-06-14', 'P', 'Islam', 'Kayu Agung Dusun 8', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Dede Suhardy ', 'Seruni Y. Sabara ', 'Wiraswasta', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '08152528220', '', NULL, 'SD Inpres 3 Kayu Agung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020571', '$2a$08$Gd.TZRl14b0U1TrYTTXCXeGuPVmKzdda3OrqGc2yDltKN8KquP0l2', '', '', '0000-00-00 00:00:00', '', '24020571', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(562, 1, '24020572', '0111491978', '7208076405110001', 'Niluh Sindy Amelia', 'Desa Bosagon', '2011-05-24', 'P', 'Kristen', 'Desa Bosagon Jaya Kecamatan Ongka Malino Kabupaten Parigi Mautong Provinsi Sulawesi Tengah', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Nyoman Eko Sunarto', 'Sisilia Ni Made Hariasih', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '083131984501', '', NULL, 'SD Inpres 3 Malino', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020572', '$2a$08$D0KxpjuNuoRNOWfJKuM1BOaR0PJQpPIGjeorUTahX5XmpLF.CWnf2', '', '', '0000-00-00 00:00:00', '', '24020572', '2024-09-26 03:10:56', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(563, 1, '24020573', '0128688824', '7601076202120001', 'Nur Fadilla ', 'Mamuju Utara', '2012-02-22', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sabrianto', 'Netti', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085142857200', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020573', '$2a$08$tTNcgv.jFgUktgCm.hPcDOO9EOJK4OCBnH6FAp0aQQpRr2faxSk6W', '', '', '0000-00-00 00:00:00', '', '24020573', '2024-09-26 03:03:50', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(564, 1, '24020574', '0114251178', '7208075905110001', 'Nurafiat', 'Bosagon', '2011-05-19', 'P', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Gapur', 'Masni', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085395156693', '', NULL, '-', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020574', '$2a$08$shuK48Q6EL4vQGJeQz.aUeaRWaSJmAp.2TpDYWgvG0F.NFXvassG.', '', '', '0000-00-00 00:00:00', '', '24020574', '2024-09-26 03:17:58', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(565, 1, '24020575', '0122775581', '7208121704120002', 'Nurul Halifah ', 'Tinombala ', '2012-04-17', 'P', 'Islam', 'Sumber Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sariman ', 'Surifah ', 'Petani/Pekebun ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085823222412', '', NULL, 'SD Inpres 2 Kayuagung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020575', '$2a$08$Zw7cQRRqf6yF72syojWH5OBcZXROsz127fftdiYN/4L/l/1ENe5Gm', '', '', '0000-00-00 00:00:00', '', '24020575', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(566, 1, '24020576', '0122549527', '7208076501120001', 'Puput Triyani', 'Petunasugi', '2012-01-25', 'P', 'Islam', 'Sumber Agung Dusun 12', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sutiyono', 'Yani', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082349386675', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020576', '$2a$08$GKFMbrLyD1n6YYARDDSsZOUVM5Obtx72mzz9RkPTIlkdWfCkR2N1y', '', '', '0000-00-00 00:00:00', '', '24020576', '2024-09-26 03:08:42', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(567, 1, '24010577', '0118883756', '7208120110110001', 'Rahmat Hidayat', 'Sumber Agung', '2011-10-01', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Nur Hidayat', 'Nurhidayah', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '0', '', NULL, 'SD Inp 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010577', '$2a$08$jxI23fSqdAjukZgUK2BVO.EZ8qs1VEF0VoZmns2IQaVoqfYRiWFBa', '', '', '0000-00-00 00:00:00', '', '24010577', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(569, 1, '24010579', '3126796024', '7208122702120005', 'Rendy Styawan', 'Sumber Agung', '2012-02-27', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sulimin', 'Murtini', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082310214969', '', NULL, 'SD Inpres 2 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010579', '$2a$08$8oeTUF3bfE6WnbAd3ZtiPeSoby7N.mNNiLQ0iEP.r0a3TWIe/WKMW', '', '', '0000-00-00 00:00:00', '', '24010579', '2024-09-26 03:03:47', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(570, 1, '24010580', '0117357087', '7208123003110001', 'Reza Alrozaqi', 'Kayu Agung', '2011-03-30', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Saiful ', 'Siti Maryam', 'Wiraswasta', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '0', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010580', '$2a$08$akY/l0QG9NhmPn0f9UVoBOo6e8Qm0LqSEJHpe2Q3EQy.sQRua.dkK', '', '', '0000-00-00 00:00:00', '', '24010580', '2024-09-22 07:32:33', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(571, 1, '24010581', '0114871865', '7208071207110001', 'Reza Nis Nur Hakim ', 'Tinombala Jaya ', '2011-07-12', 'L', 'Islam', 'Tinombala Jaya ', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Misran ', 'Tri Wahyuningsih ', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082298137114', '', NULL, 'SD I Tinombala ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010581', '$2a$08$jRP8Nkp3Cp.kU.UCN8fUEODadvH06acx88yd.FKO36cohx7D99LXW', '', '', '0000-00-00 00:00:00', '', '24010581', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(572, 1, '24010582', '0107773979', '7208122606100001', 'Reza Pratama', 'Kayu Agung', '2010-06-26', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Suparno', 'Nita', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085656106022', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010582', '$2a$08$GSXIehSQSTWBJw81mEvtieqK.PNdjQ7m.fOJFTlhSPAxv.niTuk7C', '', '', '0000-00-00 00:00:00', '', '24010582', '2026-04-19 13:51:17', 1, '2025-06-30 13:42:46', '2026-04-20 21:51:17'),
(573, 1, '24010583', '0121576259', '7208121601120002', 'Rifqi Arianto', 'Kayu Agung', '2012-01-16', 'L', 'Islam', 'Kayu Agung Dusun 2', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sugito', 'Sumiati', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081527633242', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010583', '$2a$08$eHieksy9Eiw.Zb3tQ.kSDuS7rT/3R/QYkzakQacM9ffsJEupld3k.', '', '', '0000-00-00 00:00:00', '', '24010583', '2024-09-22 02:57:56', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(574, 1, '24010584', '3114713026', '7208120808110002', 'Sahrul Mutaqim ', 'Kayu Agung', '2011-08-08', 'L', 'Islam', 'Kayuagung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Rajab', 'Sugiati', 'Wiraswasta', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '083114230740', '', NULL, 'Mi Hidayatul Mutadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010584', '$2a$08$KmG6/rC4.FRNxfTZre1an.RB4hXi2KN9IswaBl6ECkd/Q8idaAVWe', '', '', '0000-00-00 00:00:00', '', '24010584', '2024-09-22 03:15:25', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(575, 1, '24010585', '0116745212', '7208122007110003', 'Salim Nurhakim', 'Palu', '2011-07-20', 'L', 'Islam', 'Kayu Agung', '', '', '', NULL, '', '', '', 2, 2, NULL, NULL, '', '2024-2025', 1, NULL, 'Heri Sumarno', 'Munifah', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, 'Kayuagung, Dusun 5', '085399733609', '', NULL, 'SD Inpres 3 Kayuagung', '7B', 10, 1, 'Kayuagung', '', '', '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010585', '$2a$08$kvzLMv.1WTCfrAO7o13o4eSZgcpgXELAtvQMlc3XmanMqx3g1vyBG', '', '', '0000-00-00 00:00:00', '', '24010585', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(576, 1, '24020586', '0112943415', '7208124306110001', 'Sifa Marwalita', 'Kayu Agung', '2011-06-03', 'P', 'Islam', 'Kayu Agung Dusun 3', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Budianto', 'Siti Dayanti', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082196023537', '', NULL, 'SD 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020586', '$2a$08$oSZoFKrALk738acdZZmcOuMtm9zl5gHnoRDzQTxjt7iebNg37xhJi', '', '', '0000-00-00 00:00:00', '', '24020586', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(577, 1, '24020587', '0119683454', '7208074207110001', 'Sindy Julianti ', 'Tinombala ', '2012-07-02', 'P', 'Islam', 'Kayu Agung, Dsn 7', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Setu', 'Winarti', 'Pekebun/Petani ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081524451256', '', NULL, 'SDN 1 Kayuagung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020587', '$2a$08$7wPgxzcHP6GfyNu6hqrH0uAYjmXpVxJLNJVkb5X8K8UM6KgAJEkFS', '', '', '0000-00-00 00:00:00', '', '24020587', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(578, 1, '24020588', '0112766479', '7208076406110001', 'Siti Dania ', 'Parigi Moutong ', '2011-06-24', 'P', 'Islam', 'Tinombala Jaya ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Hariyanto ', 'Riyanti ', 'Tani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082298137114', '', NULL, 'SD I Tinombala ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020588', '$2a$08$mbP44y0ubN4hXBCT0deLPOOVWmCzVlYw917mQatQNMbKklSVs2Wya', '', '', '0000-00-00 00:00:00', '', '24020588', '2024-09-26 03:11:05', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(579, 1, '24020589', '0111830685', '7208126507110003', 'Siti Nurhasanah', 'Kayu Agung ', '2011-07-25', 'P', 'Islam', 'Kayu Agung Dusun 1', NULL, NULL, NULL, NULL, '', '', NULL, 5, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Ade Makmur', 'Mimin', 'Meninggal', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '08152528220', '', NULL, 'SD Inpres 3 Kayu Agung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020589', '$2a$08$Bn20wh2NY9yMgjvDm3RJwunpq2ABYkPLJOhW0VvBUDiwanJfzUtdq', '', '', '0000-00-00 00:00:00', '', '24020589', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(580, 1, '24020590', '0112004868', '7208126307110002', 'Sivara Mika Bila', 'Kayu Agung', '2011-07-23', 'P', 'Islam', 'Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sarjono', 'Marsini', 'Pertanian', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085827825983', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020590', '$2a$08$4WZ.gvzHIZI6Q9IAh4hwrOCI1m20NvtljaWK2bZuI3cVRHkC6t7ei', '', '', '0000-00-00 00:00:00', '', '24020590', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(581, 1, '24020591', '0125416737', '7208126505120001', 'Tara Mei Safitri', 'Kayu Agung', '2012-05-25', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Sulaiman', 'Sulastri', 'Petani', 'Ibu Rumahnya Tangga', '', '', NULL, NULL, NULL, '083133166934', '', NULL, 'SDN 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020591', '$2a$08$JyApcI7eLYWBpFQVZsLOzOWKdUHQ5eeKNtTqr.ejWTrfTGU/bU1Am', '', '', '0000-00-00 00:00:00', '', '24020591', '2024-09-22 02:57:41', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(582, 1, '24020592', '0117922391', '7208126605110001', 'Tri Nur Aisyah', 'Kayu Agung', '2011-05-26', 'P', 'Islam', 'Dusun 3 Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Suwarso', 'Samiyati', 'Petani', 'Buruh', '', '', NULL, NULL, NULL, '085273499939', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020592', '$2a$08$wcxjewHqxeeW8EZQ3PAfRejAKe.4rHqShIJJRcR1AVSmP1dfCKfCO', '', '', '0000-00-00 00:00:00', '', '24020592', '2024-09-26 03:03:45', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(583, 1, '24020593', '3119062755', '7208126609690001', 'Vanessa Brighita Zerah Banawa', 'Donggala', '2011-08-11', 'P', 'Kristen', 'Desa.Kayu Agung, Dusun Iii, Rt/Rw -/003, Kec.Mepanga, Kab.Parimo', NULL, NULL, NULL, NULL, '', '', NULL, 5, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Bani Banawa', 'Nyoman Sukini', 'Pensiunan Guru', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085756352146', '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020593', '$2a$08$GUgaggHCKqz8wjc1snK1v.kkOkHwCgcLUkT4FS9uMJ28D7i4Tw9fm', '', '', '0000-00-00 00:00:00', '', '24020593', '2024-09-26 03:11:16', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(585, 1, '24020595', '3115141184', '7208125503110001', 'Wahida Ainun Mardiyah', 'Kayu Agung', '2011-03-15', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Kateni', 'Lilis Widiawati', 'Petani ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082194793701', '', NULL, 'MIS Hidayatul Mubtadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020595', '$2a$08$yrG2S19yt5o9h8A2ZaUiMe8iGOdzT1Kg8/30ibNfSLe3XID/FCEqG', '', '', '0000-00-00 00:00:00', '', '24020595', '2024-09-22 02:57:23', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(586, 1, '24010596', '0112038100', '7208071904110004', 'Wahyu Saputra ', 'Tinombala ', '2011-04-19', 'L', 'Islam', 'Tinombala ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Nurul Arifin', 'Yatiyem ', 'Kuli Bagunan', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085232137724', '', NULL, 'SD Inpres 1 Tinombala ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010596', '$2a$08$EcL5KY.kNb2/IsAMrLhTX.pwszYHoJbJ6rxGcimwBTBhChwbmhG1m', '', '', '0000-00-00 00:00:00', '', '24010596', '2024-09-26 03:04:50', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46');
INSERT INTO `siswa` (`id_siswa`, `id_sekolah`, `nis`, `nisn`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `email`, `ekonomi`, `anak_ke`, `jml_saudara`, `id_saudara`, `foto`, `telp`, `angkatan`, `program_studi`, `id_ortu`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `pendidikan_ayah`, `pendidikan_ibu`, `ttl_ayah`, `ttl_ibu`, `alamat_ortu`, `hp_ortu`, `hp_ibu`, `tentang_orangtua`, `asal_sekolah`, `masuk_dikelas`, `diterima_tapel`, `diterima_semester`, `alamat_asal_sekolah`, `ijazah_no`, `ijazah_thn`, `tgl_daftar`, `status`, `dok_akta`, `dok_kk`, `dok_ijazah`, `dok_skhun`, `dok_kip`, `no_ujian`, `ruang_ujian`, `sesi_ujian`, `kode_undangan`, `username`, `password`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `token`, `last_login`, `active`, `created_at`, `updated_at`) VALUES
(587, 1, '24020597', '0102132043', '7208125608110002', 'Yayuk Agus Setiawati ', 'Sumber Agung ', '2010-07-16', 'P', 'Islam', 'Tinombala ', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Mudi\'in', 'Misiah ', 'Pertani ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081543279616', '', NULL, 'SD Inpres 2 Kayuagung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020597', '$2a$08$YPI/lfzhCJuqGNX0x9jmOO7P2wYPLLmsZ1B4pvMtG7n2OwK0Qgxve', '', '', '0000-00-00 00:00:00', '', '24020597', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(588, 1, '24020598', '0117703082', '7208185412120002', 'Yelni', 'Palasa', '2011-12-15', 'P', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Rosidin', 'Yerlin', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '000000000000', '', NULL, 'SD Inpres 3 Malino', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020598', '$2a$08$NYlq2Ft/eQQYVWs8TkrfCeEMyYIr1TcffrTBLdq1fHddqetpdtbXm', '', '', '0000-00-00 00:00:00', '', '24020598', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(589, 1, '24010599', '0111088149', '7208120306110002', 'Yonathan Towialo', 'Kayu Agung', '2011-06-03', 'L', 'Kristen', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Aris Towialo ', 'Arni Langgori ', 'Pendeta', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '0', '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010599', '$2a$08$v5ZV5I.H5iSWZEKW/JdUkeed6BjvQhjkb9V0o0BbPwjF/YibY5K/K', '', '', '0000-00-00 00:00:00', '', '24010599', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(590, 1, '24020600', '0113002533', '7208126303110003', 'Yulianna', 'Kayu Agung', '2011-03-23', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 5, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Pudak', 'Ikem', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '081525916335', '', NULL, 'SD N 1 Kayu Agung', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020600', '$2a$08$SazZVmbRyigRovgFzl4CeumXe9ov0hPhHiZ5QqTdvszNVVM6QxM5.', '', '', '0000-00-00 00:00:00', '', '24020600', '2024-08-18 01:26:35', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(591, 1, '24020601', '1219366989', '7208074702120001', 'Yuni Syarah', 'Tabolo-Bolo', '2012-02-07', 'P', 'Islam', 'Dusun 2 Tabolo - Bolo Kec. Ongka Malino', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Masran', 'Yanti', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085756952327', '', NULL, 'SD Kecil Tabolo-Bolo', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020601', '$2a$08$eUhVGhqKFPdAgx3/BI1iIOiSUh2kaePDdnL4VHhyYKx5nEE6ax8NC', '', '', '0000-00-00 00:00:00', '', '24020601', '2024-09-30 00:50:11', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(592, 1, '24020602', '0113389849', '7208126307110001', 'Zakia Arini', 'Sumber Agung', '2011-07-23', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', '', NULL, 3, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Alin', 'Jubaedah ', 'Petani/Pekebun ', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '082188893439', '', NULL, 'SD Inpres 3 Kayuagung ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020602', '$2a$08$Jaer2leSzBX9P1/f7iRTf.ahtpHZ6b8SCYVkBjmoM9P.FvbWG8GIa', '', '', '0000-00-00 00:00:00', '', '24020602', '2024-09-26 03:11:14', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(593, 1, '24020603', '3113091721', '7208126306110001', 'Zaskia Nadhiroh', 'Kayu Agung', '2011-06-23', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 2, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Imam Safi\'i', 'Isti Rujanah', 'Petani/Pekebun', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085796951553', '', NULL, 'MIS Hidayatul Mubtadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24020603', '$2a$08$sGrBqE6WYvg1JOS3CuOEyOYPbS6FjfLN/sSQP1U6g/jB4.ai4Yt.K', '', '', '0000-00-00 00:00:00', '', '24020603', '2024-09-30 00:50:58', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(594, 1, '24010604', '0116213770', '6108011010110001', 'Zefan Fahrezi Laritjo ', 'Singkawang ', '2011-10-10', 'L', 'Islam', 'Dusun IV Desa Tabolobolo Kecamatan Ongka Malino Kabupaten Parigi Moutong ', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Abd Rahim Laritjo ', 'Nurhayati ', 'TNI/AD', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085823558508', '', NULL, 'SD Inpres 2 Tinombala ', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010604', '$2a$08$MWPoTrz10Ryfsbicm4d4Oe7rTTAsdJTblcbLYfZESxivrNP5gjbx2', '', '', '0000-00-00 00:00:00', '', '24010604', '2024-09-26 03:18:16', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(595, 1, '24010605', '3118017966', '7208122103110002', 'Zilfan Fadil Kurniawan', 'Kayu Agung', '2011-03-21', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, 1, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Prasmono', 'Sumarti', 'Buruh', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '085796445287', '', NULL, 'MIS Hidayatul Mubtadi-ien', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010605', '$2a$08$hzxHomYpBpDsb1vpZslGgO4Xd4iLgHJ6WFf9jFP0koNMH1M.RGHkW', '', '', '0000-00-00 00:00:00', '', '24010605', '2024-09-22 03:15:00', 1, '2025-06-30 13:42:46', '2025-06-30 13:42:46'),
(596, 1, '24010606', '0116161930', '7208070310110001', 'Zulfinacry', 'Bosagon Jaya', '2011-10-20', 'L', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, 4, NULL, NULL, NULL, '', '2024-2025', 1, NULL, 'Abd. Haris', 'Erlina. Tk', 'Petani', 'Ibu Rumah Tangga', '', '', NULL, NULL, NULL, '083841097311', '', NULL, '-', NULL, 10, 1, NULL, NULL, NULL, '2024-07-15', 'baru', '', '', '', '', '', '', '', '', NULL, '24010606', '$2a$08$iZt/b10HvgrT288T6gk1bO/T9z5UnntW1j.i1rgsvHrX/ALa4ce9O', '', '', '0000-00-00 00:00:00', '', '24010606', '2026-04-18 14:02:42', 1, '2025-06-30 13:42:46', '2026-04-19 22:02:42'),
(597, 1, '24010607', '3106571648', '', 'Hafiz Fathurohim', 'Tinombala', '2010-03-28', 'L', 'Islam', 'Tinombala', 'Tinombala', 'Ongka Malino', 'Parigi Moutong', NULL, '94479', '', NULL, NULL, 0, NULL, NULL, '', '2024-2025', 1, NULL, 'Lanjar', 'Sutiani', 'Petani', 'URT', '', '', NULL, NULL, 'Jl. Melati No. 3 Kotanagaya, Bolano Lambunu', '085338005761', '', NULL, 'MTs. Swasta Al-Hikmah', '8A', 10, 1, 'Jl. Melati No. 3 Kotanagaya, Bolano Lambunu, 94479', '', '', '2024-07-15', 'mutasi', '', '', '', '', '', '', '', '', NULL, '24010607', '$2a$08$TTmiqjCnf0eBBfEpsfjvguhSXoGg/4IjGk0J85F4BocvJXPxno2s6', '', '', '0000-00-00 00:00:00', '', '24010607', '2025-12-10 14:06:20', 1, '2025-06-30 13:42:46', '2025-12-11 22:06:20'),
(598, 1, '24010608', '3105709054', '', 'Muhamad Rifki Maulana', 'Tinombala', '2010-09-16', 'L', 'Islam', 'Tinombala Barat', 'Tinombala Barat', 'Ongka Malino', 'Parigi Moutong', NULL, '94479', '', NULL, NULL, 0, NULL, NULL, '', '2024-2025', 1, NULL, 'Suparman', 'Suprihatin', 'Petani', 'URT', '', '', NULL, NULL, 'Tinombala Barat, Ongka Malino', '', '', NULL, 'MTs. Swasta Al-Hikmah', '8A', 10, 1, 'Jl. Melati No. 3 Kotanagaya, Bolano Lambunu, 94479', '', '', '2024-07-15', 'mutasi', '', '', '', '', '', '', '', '', NULL, '24010608', '$2a$08$N5u1dm1L9z5PitOWf7WXDOrSWtKC9kh9IcFehzqb3pevnWxr0JIJC', '', '', '0000-00-00 00:00:00', '', '24010608', '2025-12-11 00:34:54', 1, '2025-06-30 13:42:46', '2025-12-12 08:34:54'),
(599, 1, '2502609', '0118811934', '', 'Lithichia Alfyona Paelongan', 'Tana Toraja', '2011-06-28', 'P', 'Kristen', 'Bosagon Jaya', 'Bosagon Jaya', 'Ongka Malino', 'Kab. Parigi Moutong', 'undefined', '94476', '', 'Menengah', 2, 2, NULL, NULL, 'undefined', NULL, NULL, NULL, 'Alfrida Remme Paelongan', '-', 'TNI/POLRI', '-', 'SMA', 'SMA', NULL, NULL, 'Bosagon Jaya', NULL, '', NULL, 'undefined', '7A', 10, 1, NULL, '', '', '2025-01-01', 'mutasi', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0000-00-00 00:00:00', '', NULL, '2025-07-26 17:48:12', 1, '2025-07-28 01:48:12', '2025-08-20 12:17:50'),
(600, 1, '2502610', '0117904761', '7208074601120001', 'Dwi Eka Putri', 'Tinombala', '2011-01-06', 'P', 'Islam', 'Kampung Baru', 'Kotaraya Barat', 'Mepanga', 'Kab. Parigi Moutong', 'undefined', '94476', 'nsahid@gmail.com', 'Menengah', 1, 1, NULL, NULL, 'undefined', NULL, NULL, NULL, '-', 'Eci Ernawati', '-', 'URT', 'SMA', 'SMA', NULL, NULL, 'Kotaraya Barat', NULL, '', NULL, 'undefined', '7B', 10, 1, NULL, '', '', '2025-01-01', 'mutasi', '', '', '', '', '', '', '', '', NULL, '', '', '', 'a25785954941d58053655414d83a74b66df43f83', '2025-12-03 09:54:04', '', NULL, '2025-07-26 18:07:19', 1, '2025-07-28 02:07:19', '2025-12-03 09:54:04'),
(601, 1, '2502611', '0129965903', '7571014704120002', 'Aqilah Afriliana Nouren', 'Gorontalo', '2012-04-07', 'L', 'Islam', 'Kayu Agung', 'Kayuagung', 'Mepanga', 'Kab. Parigi Moutong', 'undefined', '94476', '', 'Menengah', 1, 1, NULL, NULL, 'undefined', NULL, NULL, NULL, 'Sultan Takdir', 'Sardiana', 'Karyawan', 'URT', 'SMA', 'SMA', NULL, NULL, 'Kayuagung', NULL, '', NULL, 'undefined', '7B', 10, 1, NULL, '', '', '2025-01-01', 'mutasi', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0000-00-00 00:00:00', '', NULL, '2025-07-26 18:21:32', 1, '2025-07-28 02:21:32', '2025-08-20 12:17:32'),
(602, 1, '25012612', '0121605648', '7208222712120001', 'ADITYA PRATAMA', 'Persatuan Utara', '2012-12-27', 'L', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', 'adityapratama@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Supriadi', 'Anik Rahayu', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN DESPOT ONGKA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_adityapratama_25012612.jpg', 'kk_adityapratama_25012612.jpg', 'ijazah_adityapratama_25012612.jpg', '', '', '', '', '', NULL, '25012612', '$2y$10$OybcImYcM1MP9YEv1xFYLuwQskGgsnDBau0MHpa7cImRo8Lln.DVi', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:45', '2025-08-25 23:51:45'),
(603, 1, '25022613', '0113064875', '7208124812110001', 'AFIRA  NABILA HUSNA ', 'Kayu Agung ', '2011-12-08', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'afira@gmail.com', NULL, NULL, NULL, NULL, NULL, '081525938398', NULL, NULL, NULL, 'Sarbi', 'Atik Riyani ', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_afiranabilahusna_25022613.jpg', 'kk_afiranabilahusna_25022613.jpg', 'ijazah_afiranabilahusna_25022613.jpg', '', '', '', '', '', NULL, '25022613', '$2y$10$O5LnWZz8hbVaPmepii2G8e7XLYPm635Y7x1bfuaCHUG9wkUnWf3Fe', '', '', '0000-00-00 00:00:00', '', '5776cfc02c704da3378ac4d8bac58dcc', '2025-10-01 08:24:55', 1, '2025-08-25 23:51:45', '2025-10-02 16:24:55'),
(604, 1, '25022614', '3126981019', '7208074303120001', 'AFRIANI', 'Tinombala ', '2012-03-03', 'P', 'Islam', 'Tinombala jaya', NULL, NULL, NULL, NULL, '', 'afriani@gmail.com', NULL, NULL, NULL, NULL, NULL, '+62 838-6155-54', NULL, NULL, NULL, 'Agus Supardi', 'Nurhayati', 'Petani/berkebun', 'Ibu rumah tangga ', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_afriani_25022614.jpg', 'kk_afriani_25022614.jpg', 'ijazah_afriani_25022614.jpg', '', '', '', '', '', NULL, '25022614', '$2y$10$U8puadDEEIxwB85drUJLoeQNS7tVNBSR5UgrvDukS3aYx7bXFHhMS', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:45', '2025-08-25 23:51:45'),
(605, 1, '25012615', '0129418128', '7208122509120001', 'AGUNG SETIADI', 'Sumber Agung ', '2012-09-25', 'L', 'Islam', 'Dusun III Sumber Agung ', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '081342078772', NULL, NULL, NULL, 'Suyadi', 'Nirwayanti', 'Tani', 'Urt', '', '', NULL, NULL, NULL, NULL, '', NULL, 'MADRASAH IBTIDAIYAH ULIL ALBAB SUMBER AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_agungsetiadi_25012615.jpg', 'kk_agungsetiadi_25012615.jpg', 'ijazah_agungsetiadi_25012615.jpg', '', '', '', '', '', NULL, '25012615', '$2y$10$S0TP/l6uJr8cSOiIYfp9j.o9rQQNQulGHG2ewUlkVMl7XcsV2TZWq', '', '', '0000-00-00 00:00:00', '', NULL, '2025-10-16 06:01:20', 1, '2025-08-25 23:51:45', '2025-10-17 14:01:20'),
(606, 1, '25012616', '3136185346', '7208220102130002', 'AHMAD MUSLIM', 'Tinombala Barat', '2013-02-01', 'L', 'Islam', 'Desa Tinombala Barat Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Muslimin', 'Rukini', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_ahmadmuslim_25012616.jpg', 'kk_ahmadmuslim_25012616.jpg', 'ijazah_ahmadmuslim_25012616.jpg', '', '', '', '', '', NULL, '25012616', '$2y$10$G385TVdu0JHXv.083H3Wa.2y5tNf2h.V04RiDkgOtibehWzAgFACy', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:45', '2025-08-25 23:51:45'),
(607, 1, '25022617', '3122544198', '7208125010120002', 'AISYAH PUTRI', 'Sumber Agung', '2012-10-10', 'P', 'Islam', 'Desa Sumber Agung Kecamatan Mepanga', NULL, NULL, NULL, NULL, '', 'aisyahputri@gmail.com', NULL, NULL, NULL, NULL, NULL, '083190068111', NULL, NULL, NULL, 'Moh. Marsudi', 'Homsatun', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'MIS ULIL ALBAB', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_aisyahputri_25022617.jpg', 'kk_aisyahputri_25022617.jpg', 'ijazah_aisyahputri_25022617.jpg', '', '', '', '', '', NULL, '25022617', '$2y$10$3zcIQWJah48JwgKDkOsfref0Hr48P0sKpmiiG31fnko5uLsDe7GVC', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:45', '2025-08-25 23:51:45'),
(608, 1, '25012618', '3128148489', '7208121309120001', 'AL BARA AQSHA ', 'Kayu Agung', '2012-09-13', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '0852 4220 0040', NULL, NULL, NULL, 'Joko Riyanto', 'Ratna Wati', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN INPRES 3 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_albaraaqsha_25012618.jpg', 'kk_albaraaqsha_25012618.jpg', 'ijazah_albaraaqsha_25012618.jpg', '', '', '', '', '', NULL, '25012618', '$2y$10$rKfKNmEVKqzppsF98fbCl.NHVa/YFR4reyBkAbPSLIbxlQ.dKcemO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:45', '2025-08-25 23:51:45'),
(609, 1, '25022619', '0136076898', '7208224601130001', 'ALDA DEVINA SOPIAN', 'Tinombala Barat', '2013-01-06', 'P', 'Islam', 'Desa Tinombala Barat Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', 'aldadevina@gmail.com', NULL, NULL, NULL, NULL, NULL, '089509700388', NULL, NULL, NULL, 'Usup Sopian', 'Lamitun', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_aldadevinasopian_25022619.jpg', 'kk_aldadevinasopian_25022619.jpg', 'ijazah_aldadevinasopian_25022619.jpg', '', '', '', '', '', NULL, '25022619', '$2y$10$L8NQ7OVulJxIHllK6fVpWuC3h0lMFN.4N7pVrwawNgUHGjgeyrx1i', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:45', '2025-08-25 23:51:45'),
(610, 1, '25012620', '3128337691', '7208122208120002', 'ALFI RAMA ZALNISTA', 'Kayu Agung', '2012-08-22', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'alfirama@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Zallul Triyono', 'Nila Purnamasari', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_alfiramazalnista_25012620.jpg', 'kk_alfiramazalnista_25012620.jpg', 'ijazah_alfiramazalnista_25012620.jpg', '', '', '', '', '', NULL, '25012620', '$2y$10$v41.55j4yzDzqHrWYtfX6urkQ0EDinghn6nnVK9XjnN4SnDziBdEO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(611, 1, '25022621', '0132935026', '7208126701130001', 'ALYA KANIA AZZAHRA', 'Kayu Agung', '2013-01-27', 'P', 'Islam', 'Dusun IV Desa Kayu Agung', NULL, NULL, NULL, NULL, '', 'alyakania@gmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Wahito', 'Komida', 'Guru', 'Guru', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_alyakaniaazzahra_25022621.jpg', 'kk_alyakaniaazzahra_25022621.jpg', 'ijazah_alyakaniaazzahra_25022621.jpg', '', '', '', '', '', NULL, '25022621', '$2y$10$mn0coZXcYnQBbYy6fe6OJe3ARlNizNxk66LyBPbABU04nUxAiKkii', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(612, 1, '25012622', '3137365832', '7208121404130001', 'ANDIKA SUBAKTIO', 'Kayu Agung', '2013-04-14', 'L', 'Islam', 'Desa Kayu Agung', NULL, NULL, NULL, NULL, '', 'andikasu@gmail.com', NULL, NULL, NULL, NULL, NULL, '085343609761', NULL, NULL, NULL, 'Sucipto (ALM) ', 'Miani', '-', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_andikasubaktio_25012622.jpg', 'kk_andikasubaktio_25012622.jpg', 'ijazah_andikasubaktio_25012622.jpg', '', '', '', '', '', NULL, '25012622', '$2y$10$SQLsvZAoG2Qx6/jPaNxrS.89Ekl3xqTuxn02gGvtsNNVQ7/G/mS/S', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(613, 1, '25022623', '3135118136', '7271085004130001', 'ANDITA APRILIA KARISA', 'Palu', '2013-04-10', 'P', 'Islam', 'Kayu Agung Lorong Ponorogo', NULL, NULL, NULL, NULL, '', 'andita@gmail.com', NULL, NULL, NULL, NULL, NULL, '082259647470', NULL, NULL, NULL, 'Agus Sunaryo', 'Indian Dwi Radiastuti', 'Pedagang', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_anditaapriliakarisa_25022623.jpg', 'kk_anditaapriliakarisa_25022623.jpg', 'ijazah_anditaapriliakarisa_25022623.jpg', '', '', '', '', '', NULL, '25022623', '$2y$10$Q.JuT6Z.0PQCY2hUm.a2Lu2xrnCry6rpPUjUBfZ2hMogbQoi16mvm', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(614, 1, '25012624', '0126279371', '7208121104120002', 'APRYAN ADI PRATAMA', 'Kayu Agung', '2012-04-11', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'apryan@gmail.com', NULL, NULL, NULL, NULL, NULL, '085397787166', NULL, NULL, NULL, 'Suharyanto', 'Cahyaning handayani', 'Wira usaha', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_apryanadipratama_25012624.jpg', 'kk_apryanadipratama_25012624.jpg', 'ijazah_apryanadipratama_25012624.jpg', '', '', '', '', '', NULL, '25012624', '$2y$10$7flEazfLXVylPzROGjpGouPS7WFgixv8Nlug3R80x142hKNuX56L2', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(615, 1, '25012625', '0128312032', '7208121101120001', 'ARDI KHOIRUL ZAELANI', 'Kayu Agung', '2012-01-11', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'ardikhoirul@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Samin', 'Endang Zulaeha', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_ardikhoirulzaelani_25012625.jpg', 'kk_ardikhoirulzaelani_25012625.jpg', 'ijazah_ardikhoirulzaelani_25012625.jpg', '', '', '', '', '', NULL, '25012625', '$2y$10$Q9Sf59/dd27FnUY8yW6mbu7fobk8JXystaIb5zbboBsZQ3mv09nSC', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(616, 1, '25012626', '0129307441', '7208121808120001', 'ARKAN SAID RAMADAN', 'Kayu Agung', '2012-08-18', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'arkans@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Sukarmanto', 'Waliyah', 'Karyawan Swasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_arkansaidramadan_25012626.jpg', 'kk_arkansaidramadan_25012626.jpg', 'ijazah_arkansaidramadan_25012626.jpg', '', '', '', '', '', NULL, '25012626', '$2y$10$cbcw6UZzO7dUE4LSMZtQpOsm7.pWlRXv9FtqlbxMGUTBQfVUaXJhC', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(617, 1, '25022627', '3125776604', '7208226411120001', 'AZAHRA LUSKIANTI', 'Tinombala', '2012-11-24', 'P', 'Islam', 'Desa Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '085219224692', NULL, NULL, NULL, 'edilukito', 'Sumarti', 'petani', 'rumah tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_azahraluskianti_25022627.jpeg', 'kk_azahraluskianti_25022627.jpeg', 'ijazah_azahraluskianti_25022627.jpeg', '', '', '', '', '', NULL, '25022627', '$2y$10$Xyq7nDjqUQb/v1DJEtdQee2asZV7MtRRibexNRhsstF6ZmWrGHaGq', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(618, 1, '25012628', '3127793945', '7208121502120002', 'AZAN AGEL PRATAMA', 'Palu', '2012-05-15', 'L', 'Islam', 'No LIV Blok D Dusun III Kayu Hitam Desa Kayu Agung ', NULL, NULL, NULL, NULL, '', 'azanagel@gmail.com', NULL, NULL, NULL, NULL, NULL, '082188893450', NULL, NULL, NULL, 'Agung Dwi Setyo', 'Ayu Nurlela', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_azanagelpratama_25012628.jpg', 'kk_azanagelpratama_25012628.jpg', 'ijazah_azanagelpratama_25012628.jpg', '', '', '', '', '', NULL, '25012628', '$2y$10$ur9R9JvoJgdB.nTjj.llreG7TdjGPTN6jopECrSMyiZF9Gh8eWfUO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(619, 1, '25022629', '0128520193', '7208225609120001', 'BELVANIA FEODORA MAMAHIT', 'Palu', '2012-09-16', 'P', 'Islam', 'Desa Tinombala Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Gede Windiarta', 'Leni Anice Mamahit', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_belvaniafeodoramamahit_25022629.jpg', 'kk_belvaniafeodoramamahit_25022629.jpg', 'ijazah_belvaniafeodoramamahit_25022629.jpg', '', '', '', '', '', NULL, '25022629', '$2y$10$qoTcghwtmpOLfAH1hPiGrePDFBykpvxSR2yKXDS.jDyKzLpddKE62', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(620, 1, '25022630', '0127442023', '7208224912120001', 'CRIS EKHLESIA VALENSI', 'Bosagon Jaya', '2012-12-09', 'P', 'Islam', 'Desa Bosagon Jaya \r\nkec.ongka malino', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '083185439408', NULL, NULL, NULL, 'MADE PAULUS ', 'GUSTI AYU SMARA RATIH', 'PETANI', 'Ibu rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 MALINO ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_crisekhlesiavalensi_25022630.jpg', 'kk_crisekhlesiavalensi_25022630.jpg', 'ijazah_crisekhlesiavalensi_25022630.jpg', '', '', '', '', '', NULL, '25022630', '$2y$10$pnuMKvWkPOrZ.SR7kluD5.57hb4MfkcvWi2cNXFMzryxNp6imyRdG', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(621, 1, '25012631', '3117788219', '7208121312110001', 'DERIS S RINDA', 'Ogomolos', '2011-12-13', 'L', 'Islam', 'Tinombala ', NULL, NULL, NULL, NULL, '', 'deris@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Sulaeman', 'Rinda', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_derissrinda_25012631.jpg', 'kk_derissrinda_25012631.jpg', 'ijazah_derissrinda_25012631.jpg', '', '', '', '', '', NULL, '25012631', '$2y$10$21jXg2N9arysn1wIsGLw2.pSDSwuFDM7ThN1w5Be2hILqRdXHPRo6', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(622, 1, '25012632', NULL, '7208220102120002', 'DIMAS PRAYOGA', 'Kayu Agung', '2012-02-01', 'L', 'Islam', 'Desa Tinombala Barat Kecamatan Ongka Malino Kabupaten Parigi Moutong', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_dimasprayoga_25012632.jpg', 'kk_dimasprayoga_25012632.jpg', 'ijazah_dimasprayoga_25012632.jpg', '', '', '', '', '', NULL, '25012632', '$2y$10$8bIikiValyo4Cj8foixv1.mLPnBzlm6sHhf1YEVS6BcA0FAyDXMde', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(623, 1, '25022633', '0127609164', '7208225507120001', 'DWI RATNASARI', 'Tinombala Sejati ', '2012-07-15', 'P', 'Islam', 'Tinombala Sejati ', NULL, NULL, NULL, NULL, '', 'dwiratna@gmail.com', NULL, NULL, NULL, NULL, NULL, '+62 831-9129-55', NULL, NULL, NULL, 'Sutaji ', 'Sulis tiani', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 1 TINOMBALA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_dwiratnasari_25022633.jpg', 'kk_dwiratnasari_25022633.jpg', 'ijazah_dwiratnasari_25022633.jpg', '', '', '', '', '', NULL, '25022633', '$2y$10$dAD.JfiVzlDu9nQ2SqSeTecpfdQmolU4tUlUMWuSn2UkanMK1PjPu', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(624, 1, '25022634', '3127275802', '7208125708120001', 'ELMI YUNITA ', 'Kayu Agung ', '2012-08-17', 'P', 'Islam', 'Kayu Agung Dusun VII', NULL, NULL, NULL, NULL, '', 'elmiyunita@gmail.com', NULL, NULL, NULL, NULL, NULL, '082349267673', NULL, NULL, NULL, 'HERU SUTRISNO ', 'ERNI SUGIARTI ', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYUAGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_elmiyunita_25022634.jpg', 'kk_elmiyunita_25022634.jpg', 'ijazah_elmiyunita_25022634.jpg', '', '', '', '', '', NULL, '25022634', '$2y$10$tTZRDdxH3xC.NmVYFXgOwuP3eyNUcsPNqvgaJPtOKhzucARs3HZ.2', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(625, 1, '25022635', '0128055174', '7208075803120001', 'ELVI NORHAYATI', 'Tinombala', '2012-03-18', 'P', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '0815 -2746- 660', NULL, NULL, NULL, 'Edi purwanto', 'Evi Yanti ', 'Petani ', 'Mengurus rumah tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_elvinorhayati_25022635.jpg', 'kk_elvinorhayati_25022635.jpg', 'ijazah_elvinorhayati_25022635.jpg', '', '', '', '', '', NULL, '25022635', '$2y$10$7iwrZFR10F/QF.aIXl8h7OcSfDZLXDoaItiGvBqUAcZeFFoKz8Lni', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(626, 1, '25012636', '0127356848', '7208071404120003', 'FADIL', 'Bosagon ', '2012-04-14', 'L', 'Islam', 'Bosagon', NULL, NULL, NULL, NULL, '', 'fadil@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Bahtiar', 'Manni', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_fadil_25012636.jpg', 'kk_fadil_25012636.jpg', 'ijazah_fadil_25012636.jpg', '', '', '', '', '', NULL, '25012636', '$2y$10$O0NlotHX.va.b.u68Mq8Q.XTgAoEweGpQaR4PSsE1wQvQsjxwWgum', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(627, 1, '25022637', '0127039929', '7208224511120003', 'FATMAWATI', 'Lambanau', '2012-11-05', 'P', 'Islam', 'Lambanau', NULL, NULL, NULL, NULL, '', 'fatmawati@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Irsan', 'Lisnawati', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 1 MALINO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_fatmawati_25022637.jpg', 'kk_fatmawati_25022637.jpg', 'ijazah_fatmawati_25022637.jpg', '', '', '', '', '', NULL, '25022637', '$2y$10$AinQTLiMc/1E4KuNwvgSSeG/L65YnyG/wSUoDg0A2y60DnoeaTA32', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(628, 1, '25012638', '0124914381', '7208120407120001', 'FERDIANSYAH', 'Sumber Agung', '2012-07-04', 'L', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', 'ferdiyansah@gmail.com', NULL, NULL, NULL, NULL, NULL, '082296888563', NULL, NULL, NULL, 'Misdi', 'Siti Aminah', 'Petani/pekebun ', 'Mengurus rumah tangga ', '', '', NULL, NULL, NULL, NULL, '', NULL, 'MADRASAH IBTIDAIYAH ULIL ALBAB SUMBER AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_ferdiansyah_25012638.jpg', 'kk_ferdiansyah_25012638.jpg', 'ijazah_ferdiansyah_25012638.jpg', '', '', '', '', '', NULL, '25012638', '$2y$10$ISWZXQyhW383q.vh54xrYu2B41zs0y873n2UjaGob3sDFcSu7hzSW', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:46', '2025-08-25 23:51:46'),
(629, 1, '25012639', '0124307141', '7208071301120001', 'FIRMAN', 'Bosagon', '2012-01-13', 'L', 'Islam', 'Desa Bosagon Jaya', NULL, NULL, NULL, NULL, '', 'firman@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Abdul Jamil', 'Irma', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 MALINO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_firman_25012639.jpg', 'kk_firman_25012639.jpg', 'ijazah_firman_25012639.jpg', '', '', '', '', '', NULL, '25012639', '$2y$10$gMvGm.Wuau1vNwlQFrjiEOBmQJ/1buwjnV2kHcl1XvH5JUPGtfxLm', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(630, 1, '25012640', '0114358535', '7271021003110003', 'FIRZA CHANDRA', 'Palu', '2011-03-10', 'L', 'Islam', 'Desa Kayu Agung Kecamatan mepanga', NULL, NULL, NULL, NULL, '', 'firza@gmail.com', NULL, NULL, NULL, NULL, NULL, '085178083544', NULL, NULL, NULL, 'Winarto', 'Viska Handayani', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_firzachandra_25012640.jpg', 'kk_firzachandra_25012640.jpg', 'ijazah_firzachandra_25012640.jpg', '', '', '', '', '', NULL, '25012640', '$2y$10$yMMntno83m3ji5v0oUc.4.DiQF.WKUH49n386WxwjpQNfTlg6GZPq', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(631, 1, '25012641', '0122155703', '7208120501120001', 'FITO KURNIAWAN ', 'Kota Raya', '2012-01-05', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'fitokurnia@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Arifin', 'Nova Lita Malasari', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_fitokurniawan_25012641.jpg', 'kk_fitokurniawan_25012641.jpg', 'ijazah_fitokurniawan_25012641.jpg', '', '', '', '', '', NULL, '25012641', '$2y$10$J3p1C5Sbzr8nfUbehtB29.hKnff5a6al9Ax8rKXrZVsEFNfxlCVfq', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(632, 1, '25022642', '3124617499', '7208127008120002', 'IIS LUTVIAH', 'Kayu Agung', '2025-08-30', 'P', 'Islam', 'Desa Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_iislutviah_25022642.jpg', 'kk_iislutviah_25022642.jpg', 'ijazah_iislutviah_25022642.jpg', '', '', '', '', '', NULL, '25022642', '$2y$10$uIquhyr.eyAzEH5iSmiE3O6wLTzsAe0Ln/E6Mw2BQMnZ9F6s1lXr2', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(633, 1, '25022643', '3133149520', '7208126704130001', 'INDAH PERMATA SARI', 'Parigi', '2013-04-27', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Dedi Suwanto', 'Riyanti', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_indahpermatasari_25022643.jpg', 'kk_indahpermatasari_25022643.jpg', 'ijazah_indahpermatasari_25022643.jpg', '', '', '', '', '', NULL, '25022643', '$2y$10$sB.WurrtKeIhDUeufDhkiuW8HPOE6BZa3AuUjzrjKRF0CDah1TfeO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(634, 1, '25012644', '0127433416', '7208120606120002', 'IRFAN ZAKY', 'Sumber Agung', '2012-06-06', 'L', 'Islam', 'Tinombala Induk', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '083866120705', NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 1 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_irfanzaky_25012644.jpg', 'kk_irfanzaky_25012644.jpg', 'ijazah_irfanzaky_25012644.jpg', '', '', '', '', '', NULL, '25012644', '$2y$10$NIJ2wC0pWQ9.uc4FrBvCq.4WTt6gA80/hEAPo6fgXJt45TfyNBtKO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(635, 1, '25022645', '0116896786', '7208075607110002', 'IRNA', 'Tinombo ', '2011-07-16', 'P', 'Islam', 'Bosagon Jaya', NULL, NULL, NULL, NULL, '', 'irna@gmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Ridwan', 'Hadija', 'Petani/Pekebun ', 'Mengurus rumah tangga ', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 MALINO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_irna_25022645.jpg', 'kk_irna_25022645.jpg', 'ijazah_irna_25022645.jpg', '', '', '', '', '', NULL, '25022645', '$2y$10$Gx9VRdjQbA1i8z2JG9ftF.K74ppCZCUjeeZ0FSFB0mZIj5oZAmdz.', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(636, 1, '25012646', '313893071', '7271081803130001', 'Kenzi Zaidan Mahendra', 'Palu', '2013-03-08', 'L', 'Islam', 'Kayuagung', NULL, NULL, NULL, NULL, '', 'kenzizaidan@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Mohammad Hendra Widyanto', 'Fristi Aprianti', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'MIS Ulil Albab', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_kenzizaidanmahendra_25012646.jpg', 'kk_kenzizaidanmahendra_25012646.jpg', 'ijazah_kenzizaidanmahendra_25012646.jpg', '', '', '', '', '', NULL, '25012646', '$2y$10$lmPom2XFsZ47wLTN6IBL2OKCr6aYyHq1w.HRJI4nbTk2hM/f6xGBK', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(637, 1, '25022647', '3136375929', '7504046901130001', 'LIANA ZHAHIRA', 'Parimo', '2013-01-29', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'liana@gmail.com', NULL, NULL, NULL, NULL, NULL, '082188893331', NULL, NULL, NULL, 'Hasan HL', 'Nur Azizah ', 'Petani/Pekebun ', 'PNS', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_lianazhahira_25022647.jpg', 'kk_lianazhahira_25022647.jpg', 'ijazah_lianazhahira_25022647.jpg', '', '', '', '', '', NULL, '25022647', '$2y$10$kMoglBeF00cu9M.lqb49M.gK8amAewuYxiH/Y0byRX6D53LjXpWCW', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(638, 1, '25022648', '0121727631', '7208124904120001', 'LISA NURAINI', 'Kayu Agung', '2012-04-09', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'lisanur@gmail.com', NULL, NULL, NULL, NULL, NULL, '083150137916', NULL, NULL, NULL, 'Suprianto', 'Siti Istiqomah', 'Petani', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_lisanuraini_25022648.jpg', 'kk_lisanuraini_25022648.jpg', 'ijazah_lisanuraini_25022648.jpg', '', '', '', '', '', NULL, '25022648', '$2y$10$slxpzQm/PEpUy852pUpBjeOwA7X7cAKzr4dDYSHGXoRa7hjXaJuFa', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(639, 1, '25022649', '0125870229', '7208124310110001', 'Melisa', 'Kayu Agung', '2011-03-10', 'P', 'Islam', 'Kayuagung', NULL, NULL, NULL, NULL, '', 'melisa@gmail.com', NULL, NULL, NULL, NULL, NULL, '082192029998', NULL, NULL, NULL, 'Rusman', 'Roslia', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_melisa_25022649.jpg', 'kk_melisa_25022649.jpg', 'ijazah_melisa_25022649.jpg', '', '', '', '', '', NULL, '25022649', '$2y$10$n/BGntYDsOMVrfQHAuiFxOT9UHZr76AhLevWS3.2YzxFpTaYzle3C', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(640, 1, '25022650', '3135013619', '7208225502130003', 'MIKA VALENTINA', 'Tinombala Sejati', '2013-02-15', 'P', 'Islam', 'Desa Tinombala Sejati Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '00', NULL, NULL, NULL, 'I Gede Yosua', 'Komsiati', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_mikavalentina_25022650.jpg', 'kk_mikavalentina_25022650.jpg', 'ijazah_mikavalentina_25022650.jpg', '', '', '', '', '', NULL, '25022650', '$2y$10$dUeiaNPWgjVlQoDcKLX9vOlaekbmzRNRxlWumPToAKvg6zG9ey2GK', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(641, 1, '25012651', '3122365415', '7208122810120001', 'MISBAHUL HUDA', 'Kayu Agung ', '2012-10-28', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'misbahulhuda@gmail.com', NULL, NULL, NULL, NULL, NULL, '000000', NULL, NULL, NULL, 'Jarwoto', 'Juarni', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_misbahulhuda_25012651.jpg', 'kk_misbahulhuda_25012651.jpg', 'ijazah_misbahulhuda_25012651.jpg', '', '', '', '', '', NULL, '25012651', '$2y$10$J34OD5C3e6vvoPlE08F8juyWe2C90j3N3rXV4ISlEHsggefXBpnFi', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(642, 1, '25012652', '0113928353', '7208120510110001', 'MOH PRAYOGA MADANI', 'Sumber Agung', '2011-10-05', 'L', 'Islam', 'Sumber Agung ', NULL, NULL, NULL, NULL, '', 'prayogamadani@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Moh. Mansur', 'Murni Ningsih', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'MIS ULIL ALBAB', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_mohprayogamadani_25012652.jpg', 'kk_mohprayogamadani_25012652.jpg', 'ijazah_mohprayogamadani_25012652.jpg', '', '', '', '', '', NULL, '25012652', '$2y$10$hqf9Fg/2GmWDmLETwEIYEuTTaPkX8aQoPwz8/i2uve0R9etlRuF0y', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(643, 1, '25012653', '0132029739', '7271032804130001', 'MOH RISKI KURNIAWAN', 'Palu', '2013-03-28', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'mohriski@gmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Nandar', '-', 'Karyawan Swasta', '-', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN INPRES 1 BIROBULI', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_mohriskikurniawan_25012653.jpg', 'kk_mohriskikurniawan_25012653.jpg', 'ijazah_mohriskikurniawan_25012653.jpg', '', '', '', '', '', NULL, '25012653', '$2y$10$icFJzebrVOM2A3h3Wegfz.bZyrll./TRzq5tPRLlmBJrvKKyE6Zha', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(644, 1, '25012654', '3125743099', '7208070505120001', 'MOH. ARIL ALFARISI', 'Kayu Agung', '2012-05-05', 'L', 'Islam', 'Desa Tabolo-bolo', NULL, NULL, NULL, NULL, '', 'moharil@gmail.com', NULL, NULL, NULL, NULL, NULL, '085210413169', NULL, NULL, NULL, 'Asrul', 'Suriyani', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDK TABOLOBOLO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_moharilalfarisi_25012654.jpg', 'kk_moharilalfarisi_25012654.jpg', 'ijazah_moharilalfarisi_25012654.jpg', '', '', '', '', '', NULL, '25012654', '$2y$10$iYsVVcVS12wMSPZZl5zDsOd.z5H4SzeLTlcRFZ4BWAa.Hpb.dmM.u', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(645, 1, '25012655', '0124919262', '7208071003120001', 'MOHAMMAD SAIFUL ANWAR ', 'Kayu Agung', '2012-03-10', 'L', 'Islam', 'Desa :                     KAYU AGUNG\r\nKECAMATAN :      PARIGI MAUTONG ', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '085823219816', NULL, NULL, NULL, 'Mulyono', 'Kunaini', 'Petani', 'jualan pop ice', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SMP NEGERI 3 MEPANGA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_mohammadsaifulanwar_25012655.jpg', 'kk_mohammadsaifulanwar_25012655.jpg', 'ijazah_mohammadsaifulanwar_25012655.jpg', '', '', '', '', '', NULL, '25012655', '$2y$10$bY3BYG1wPdznnMtxyIclF.7fGa/OkkOsjVrsLUKGnBuyc3HE9JR9C', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(646, 1, '25012656', '3124928497', '7208123011120001', 'MUDRIKAL REYZAN', 'Tabolo Bolo', '2012-11-30', 'L', 'Islam', 'Tabolo Bolo ', NULL, NULL, NULL, NULL, '', 'mudrikal@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000', NULL, NULL, NULL, 'Adnan', 'Sukrawati', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDK TABOLO BOLO ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_mudrikalreyzan_25012656.jpg', 'kk_mudrikalreyzan_25012656.jpg', 'ijazah_mudrikalreyzan_25012656.jpg', '', '', '', '', '', NULL, '25012656', '$2y$10$o1QOa9hyC5x26z6HD0ZUVuchRlz4VeE3Zy7nXUB1xrpeAYmul50vi', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(647, 1, '25012657', '0126602712', '7208122705120001', 'MUH ALAM NASYRAH', 'Kayu Agung', '2025-05-27', 'L', 'Islam', 'Kayu Agung lrng pasundan dusun 1 pertigaan dekat jembatan', NULL, NULL, NULL, NULL, '', 'muhalam@gmail.com', NULL, NULL, NULL, NULL, NULL, '085399732223', NULL, NULL, NULL, 'Atang', 'Asra', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_muhalamnasyrah_25012657.jpg', 'kk_muhalamnasyrah_25012657.jpg', 'ijazah_muhalamnasyrah_25012657.jpg', '', '', '', '', '', NULL, '25012657', '$2y$10$oH4SQDazAtKItCDJ0Fx9OOg54MmvAiRpG0apadhwYaAiaWjpVQZcW', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:47', '2025-08-25 23:51:47'),
(648, 1, '25012658', '0122986999', '7208071602120001', 'MUHAMAD IZAM', 'Tinombala ', '2012-02-16', 'L', 'Islam', 'Tinombala ', NULL, NULL, NULL, NULL, '', 'muhizam@gmail.com', NULL, NULL, NULL, NULL, NULL, '00000000', NULL, NULL, NULL, 'Saim', 'Kurniawati', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 1 TINOMBALA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_muhamadizam_25012658.jpg', 'kk_muhamadizam_25012658.jpg', 'ijazah_muhamadizam_25012658.jpg', '', '', '', '', '', NULL, '25012658', '$2y$10$4WxSqol2KX2p1fqu/kDs9u.9Z5B85zFIi5GNEJAHfCA2AqwiD0BBu', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(649, 1, '25012659', '3131625853', '7208220901130001', 'MUHAMMAD ANAN SIDIQ', 'Tinombala Jaya', '2013-01-09', 'L', 'Islam', 'Tinombala Jaya Dusun IV', NULL, NULL, NULL, NULL, '', 'mohanan@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Sumarji (alm)', 'Suyamti', '-', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_muhammadanansidiq_25012659.jpg', 'kk_muhammadanansidiq_25012659.jpg', 'ijazah_muhammadanansidiq_25012659.jpg', '', '', '', '', '', NULL, '25012659', '$2y$10$lGBS.C7jJb.3gVY2xHiqXuuETvGV9nhP694FbgkWbJOYz9/Susk9.', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(650, 1, '25012660', '0121956819', '7208122306120001', 'Muhammad Fadil', 'Kayu Agung', '2012-06-23', 'L', 'Islam', 'Desa Kayu Agung Kec. Mepanga', NULL, NULL, NULL, NULL, '', 'muhfadil@gmail.com', NULL, NULL, NULL, NULL, NULL, '000000000000', NULL, NULL, NULL, 'Bambang', 'Imas Suhaeni', 'Petani', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 3 Kayu Agung', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_muhammadfadil_25012660.png', 'kk_muhammadfadil_25012660.png', 'ijazah_muhammadfadil_25012660.png', '', '', '', '', '', NULL, '25012660', '$2y$10$7IX.IlcgggFiT1nclv5KBOyjdA3UmzTxtqcQJp7B3XMK4f89FD3CG', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(651, 1, '25022661', '3129043317', '7208124612120001', 'NAILA KHOIRIYAH ', 'Kayu Agung', '2012-12-06', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'nailakh@gmail.com', NULL, NULL, NULL, NULL, NULL, '083131503101', NULL, NULL, NULL, 'Azwar', 'pipit suryani', 'Petani/Pekebun ', 'Bidan', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_nailakhoiriyah_25022661.jpg', 'kk_nailakhoiriyah_25022661.jpg', 'ijazah_nailakhoiriyah_25022661.jpg', '', '', '', '', '', NULL, '25022661', '$2y$10$xeIpgOhFWMTFjUKTOqARAOJFQD0oCkmDv5tD2I2ZQBT1NVJGvph4q', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(652, 1, '25022662', '0127427118', '7208125202120001', 'NUR AINI', 'Kayu Agung ', '2012-02-12', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'nuraini@gmail.com', NULL, NULL, NULL, NULL, NULL, '081543385912', NULL, NULL, NULL, 'Ruslan', 'Meri', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_nuraini_25022662.jpg', 'kk_nuraini_25022662.jpg', 'ijazah_nuraini_25022662.jpg', '', '', '', '', '', NULL, '25022662', '$2y$10$YSbQxLMB1g7kHfSxVv3VKukbiR3NSRe.kB8lgCyGOHzWs3YK8OmsC', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(653, 1, '25022663', '3128708014', '7208126503120001', 'NUR AZIZATULLUTFIA', 'Kayu Agung ', '2012-03-25', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'nurazizah@gmail.com', NULL, NULL, NULL, NULL, NULL, '083193465157', NULL, NULL, NULL, 'Moh Nur', 'Linda Andriani', 'Pedagang ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN1 KAYU AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_nurazizatullutfia_25022663.jpg', 'kk_nurazizatullutfia_25022663.jpg', 'ijazah_nurazizatullutfia_25022663.jpg', '', '', '', '', '', NULL, '25022663', '$2y$10$./4mgF074o5/pzCmFc1Qz.QR1S15VdmMkkM9Ad43ixVur7zZsSqCe', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48');
INSERT INTO `siswa` (`id_siswa`, `id_sekolah`, `nis`, `nisn`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`, `kodepos`, `email`, `ekonomi`, `anak_ke`, `jml_saudara`, `id_saudara`, `foto`, `telp`, `angkatan`, `program_studi`, `id_ortu`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `pendidikan_ayah`, `pendidikan_ibu`, `ttl_ayah`, `ttl_ibu`, `alamat_ortu`, `hp_ortu`, `hp_ibu`, `tentang_orangtua`, `asal_sekolah`, `masuk_dikelas`, `diterima_tapel`, `diterima_semester`, `alamat_asal_sekolah`, `ijazah_no`, `ijazah_thn`, `tgl_daftar`, `status`, `dok_akta`, `dok_kk`, `dok_ijazah`, `dok_skhun`, `dok_kip`, `no_ujian`, `ruang_ujian`, `sesi_ujian`, `kode_undangan`, `username`, `password`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `token`, `last_login`, `active`, `created_at`, `updated_at`) VALUES
(654, 1, '25022664', '3129335801', '7208224511120001', 'PUTRI AULIA', 'Toboli', '2012-11-05', 'P', 'Islam', 'Desa Bosagon Jaya', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '00', NULL, NULL, NULL, 'Jainal', 'Fitriani', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 377 LOLAH', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_putriaulia_25022664.jpg', 'kk_putriaulia_25022664.jpg', '', '', '', '', '', '', NULL, '25022664', '$2y$10$myRA3x5OXM27xVb01OrtwuTjYu85xbG3HuKWyGK.gx6V8OdHbPMYm', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(655, 1, '25022665', '0119753452', '7208124801110004', 'PUTRI AYUNINGTYAS ', 'Kayu Agung ', '2011-01-08', 'P', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, 'Oooo', NULL, NULL, NULL, 'Sujut', 'Lami', 'Petani', 'Urusan Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_putriayuningtyas_25022665.jpg', 'kk_putriayuningtyas_25022665.jpg', 'ijazah_putriayuningtyas_25022665.jpg', '', '', '', '', '', NULL, '25022665', '$2y$10$Nh/RauDJbnWYhp74QjJ8WOWz2vkmTL4lCYPXoyvH8jw.QXCrIC5oK', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(656, 1, '25012666', '0129444286', '7208120308120001', 'QISKHILMAULANA', 'Kayu Agung ', '2012-08-03', 'L', 'Islam', 'Desa Kayu Agung Dusun IX', NULL, NULL, NULL, NULL, '', 'qiskhil@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Kabul Ashari', 'Siti Juriah', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD N 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_qiskhilmaulana_25012666.jpg', 'kk_qiskhilmaulana_25012666.jpg', 'ijazah_qiskhilmaulana_25012666.jpg', '', '', '', '', '', NULL, '25012666', '$2y$10$kUziDVL88I4QhK59TEoJFu1Op4pqOSbXQzKiGu5Yg2npsUfAddpxC', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(657, 1, '25012667', '0123619656', '7208120810121001', 'RADIANSYAH', 'Kayu Agung', '2012-10-08', 'L', 'Islam', 'Desa Kayu Agung Kecamatan Mepanga', NULL, NULL, NULL, NULL, '', 'radiansyah@gmail.com', NULL, NULL, NULL, NULL, NULL, '082348998870', NULL, NULL, NULL, 'Rusman', 'Siti Sarofah', 'Petani/Pekebun ', 'Mengurus Rumah Tanga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_radiansyah_25012667.jpg', 'kk_radiansyah_25012667.jpg', 'ijazah_radiansyah_25012667.jpg', '', '', '', '', '', NULL, '25012667', '$2y$10$n/Oqzv.PGWxkYAs9AEViYOC1PrBGcS0YdDKsosxJJO9haqi.ru3Mu', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(658, 1, '25022668', '3127344014', '7203115703120003', 'RADIVA RAHMAWATI', 'Tabolo Bolo', '2012-03-17', 'P', 'Islam', 'Tabolo Bolo', NULL, NULL, NULL, NULL, '', 'radiva@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Ramly', 'Irmawati', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 23 SIRENJA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_radivarahmawati_25022668.jpg', 'kk_radivarahmawati_25022668.jpg', 'ijazah_radivarahmawati_25022668.jpg', '', '', '', '', '', NULL, '25022668', '$2y$10$ohZjRU0mmpfDsHwE0Snd0ukOwiZJRfAy60jyMxYZoG9EU2o0/Y4b.', '', '', '0000-00-00 00:00:00', '', NULL, '2025-10-16 05:59:41', 1, '2025-08-25 23:51:48', '2025-10-17 13:59:41'),
(659, 1, '25012669', '3124958413', '7208221904120002', 'RAFI ABDILLAH ', 'Tinombala ', '2012-04-19', 'L', 'Islam', 'Tinombala ', NULL, NULL, NULL, NULL, '', 'rafiabdillah@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Surono', 'Siti Munfaridah', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rafiabdillah_25012669.jpg', 'kk_rafiabdillah_25012669.jpg', 'ijazah_rafiabdillah_25012669.jpg', '', '', '', '', '', NULL, '25012669', '$2y$10$fZoceTipbbmuKKqzrzzHZe4hbIwMp8Lj7FChpAdsucX74opxjQzPe', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(660, 1, '25022670', '1025634744', '7208125911120003', 'RAISYA HUMAIRAH SOFI', 'Kayu Agung', '2012-11-19', 'P', 'Islam', 'Dusun Satu Kayu Agung', NULL, NULL, NULL, NULL, '', 'rahmatsu@gmail.com', NULL, NULL, NULL, NULL, NULL, '083131983819', NULL, NULL, NULL, 'Rahmat Suhendra', 'Ariani', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN SATU KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_raisyahumairahsofi_25022670.jpg', 'kk_raisyahumairahsofi_25022670.jpg', 'ijazah_raisyahumairahsofi_25022670.jpg', '', '', '', '', '', NULL, '25022670', '$2y$10$rsgrdrTCKhH9FT0Ric.TKuEDv7aQ3ICeiZZzHAegLChB0NXCfZ6h6', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(661, 1, '25012671', '0105418670', '7208222509100001', 'RANDI DARMA IRAWAN', 'Tinombala ', '2010-09-25', 'L', 'Islam', 'Tinombala Sejati', NULL, NULL, NULL, NULL, '', 'randidarma@gmail.com', NULL, NULL, NULL, NULL, NULL, '085124171299', NULL, NULL, NULL, 'Darmono', 'Markamah', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 1 TINOMBALA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_randidarmairawan_25012671.jpg', 'kk_randidarmairawan_25012671.jpg', 'ijazah_randidarmairawan_25012671.jpg', '', '', '', '', '', NULL, '25012671', '$2y$10$/QkVP6pPRljJz14Sr3FLqO5wrSVQYECbEgAyvzYOPMGjiVSZu4UY.', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(662, 1, '25012672', NULL, '7208070305120001', 'RANGGA SAPUTRA', 'Tabolobolo', '2012-05-03', 'L', 'Islam', 'Desa Tabolobolo Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '', '', '', '', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDK TABOLOBOLO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_ranggasaputra_25012672.jpg', 'kk_ranggasaputra_25012672.jpg', 'ijazah_ranggasaputra_25012672.jpg', '', '', '', '', '', NULL, '25012672', '$2y$10$ygE6MUDz0q2ZTw9dmTckFefTYb7NtdGyVmDCX9Rf3Iidu78PMkRgm', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(663, 1, '25022673', '3136199125', '7208226603130001', 'RASTI SUSANTI', 'Bone', '2013-03-26', 'P', 'Islam', 'Padaelo', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '083871378021', NULL, NULL, NULL, 'Rustam ', 'Mardia ', 'Petani ', 'Pengurus rumah tangga ', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 MALINO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rastisusanti_25022673.jpg', 'kk_rastisusanti_25022673.jpg', 'ijazah_rastisusanti_25022673.jpg', '', '', '', '', '', NULL, '25022673', '$2y$10$MU6F3222bRjeetGNhuu/MOIFLvqtZfgCyd6U24Hk/DYd.vhpalSmC', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(664, 1, '25012674', '0133620971', '7208120904130002', 'RAYHAN PUTRA ERDIAN', 'Kayu Agung ', '2013-04-09', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'rayhanputra@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Romadianto', 'Ernawati', 'Karyawan Swasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rayhanputraerdian_25012674.jpg', 'kk_rayhanputraerdian_25012674.jpg', 'ijazah_rayhanputraerdian_25012674.jpg', '', '', '', '', '', NULL, '25012674', '$2y$10$WSsFHTbd/zXy8xWPo0a1FOzWYMK8Hwa9n4EQbfgRfMlAcZUoaaO8e', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(665, 1, '25012675', '3124881923', '7208122303090001', 'REHAN AL FARRO', 'Kayu Agung', '2012-06-16', 'L', 'Islam', 'Kayu Agung Lorong Pasundan', NULL, NULL, NULL, NULL, '', 'irfan@gmail.com', NULL, NULL, NULL, NULL, NULL, '085143703420', NULL, NULL, NULL, 'Herwanto', 'Wiwi marwiah', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES TIGA KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rehanalfarro_25012675.jpg', 'kk_rehanalfarro_25012675.jpg', 'ijazah_rehanalfarro_25012675.jpg', '', '', '', '', '', NULL, '25012675', '$2y$10$gvKrDNMcWBHx7q0o.kKLT.C4ui7NFfMSa/UeCFD/Kn/wNz3h6TJBS', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(666, 1, '25012676', '3136516681', '7208220301150001', 'REHAN SAPUTRA', 'Tinombala Barat', '2013-01-03', 'L', 'Islam', 'Tinombala barat', NULL, NULL, NULL, NULL, '', 'rehansaputra@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Misno', 'Nuryana', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rehansaputra_25012676.jpg', 'kk_rehansaputra_25012676.jpg', 'ijazah_rehansaputra_25012676.jpg', '', '', '', '', '', NULL, '25012676', '$2y$10$csxGNSBrWU4xtZiRt9A98u1zCQEi3AalJKtlXYBX5fbQYEWtFI9iW', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(667, 1, '25022677', '0129470549', '7208075204220002', 'Rifa Auliya Nisa', 'Tinombala', '2012-04-12', 'P', 'Islam', 'Tinombala Sejati Dusun 1.B5 Kecamatan Ongka Malino Kabupaten Parigi Moutong', NULL, NULL, NULL, NULL, '', 'rifaarifaauliyanisa@gmail.com', NULL, NULL, NULL, NULL, NULL, '0885821069545', NULL, NULL, NULL, 'Ihwani', 'Lamiyem', 'Petani', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Inpres 2 Tinombala', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rifaauliyanisa_25022677.jpg', 'kk_rifaauliyanisa_25022677.jpg', 'ijazah_rifaauliyanisa_25022677.jpg', '', '', '', '', '', NULL, '25022677', '$2y$10$rqEMjKnkZUQLhZh3j9OLz.6GGckEYZXwWwUmSVsQSNYQugnMY5FpW', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:48', '2025-08-25 23:51:48'),
(668, 1, '25012678', '3122262555', '7208121112120001', 'RIO ARDIANSYAH', 'Kayu Agung', '2012-12-11', 'L', 'Islam', 'Desa Tinombala Barat Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', 'rioa@gmail.com', NULL, NULL, NULL, NULL, NULL, '000000', NULL, NULL, NULL, 'Sumanto', 'Sitriani', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rioardiansyah_25012678.jpg', 'kk_rioardiansyah_25012678.jpg', 'ijazah_rioardiansyah_25012678.jpg', '', '', '', '', '', NULL, '25012678', '$2y$10$QaO6neBGeEXoCG3D5xuq8eh52f7qW7ys4LhJUNOXnIZxigceYKn2a', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(669, 1, '25022679', '0121642156', '7208074608120003', 'RISKA ALFIANI', 'Tinombala', '2012-08-06', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'riskaalfiani@gmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Agus Sutrisno', 'Hariyati', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_riskaalfiani_25022679.jpg', 'kk_riskaalfiani_25022679.jpg', 'ijazah_riskaalfiani_25022679.jpg', '', '', '', '', '', NULL, '25022679', '$2y$10$TDedVhXUjbmhyATeJwwZy.zoDUmH9ozQHnfXA5uaovuies/Dbd/gO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(670, 1, '25012680', '3126178957', '7208121305120003', 'RIZKI ADITIA', 'Kayu Agung', '2012-05-13', 'L', 'Islam', 'Desa Tinombala Sejati', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Romi', 'Siti Masita', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_rizkiaditia_25012680.jpg', 'kk_rizkiaditia_25012680.jpg', 'ijazah_rizkiaditia_25012680.jpg', '', '', '', '', '', NULL, '25012680', '$2y$10$r7q7/q571WSztEK7fGDbYu1fQl29vVGU4WMY.PtP/oP6SAcRarMoa', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(671, 1, '25012681', '0116443110', '7208122006110002', 'SAUD', 'Kayu Agung', '2025-06-20', 'L', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'saud@gmail.com', NULL, NULL, NULL, NULL, NULL, '085166515542', NULL, NULL, NULL, 'Sudirman', 'Neneng Wakijan', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 KAYU AGONG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_saud_25012681.jpg', 'kk_saud_25012681.jpg', 'ijazah_saud_25012681.jpg', '', '', '', '', '', NULL, '25012681', '$2y$10$PkcAYOW9gzRL1bgYnpdDYu5ealEeZN1qz2prA9KNIciu2Rw9ZEWee', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(672, 1, '25022682', '3139389659', '7208126105130002', 'SHEKAR TRI UTAMI', 'Kayu Agung', '2013-05-21', 'P', 'Islam', 'Dusun Vl Kayu Agung Kenari Blok F ', NULL, NULL, NULL, NULL, '', 'shekar@gmail.com', NULL, NULL, NULL, NULL, NULL, '085757277075', NULL, NULL, NULL, 'AHMAT SARTO ', 'WIWIL MILAWATI ', 'Petani ', 'Ibu rumah tangga ', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_shekartriutami_25022682.jpg', 'kk_shekartriutami_25022682.jpg', 'ijazah_shekartriutami_25022682.jpg', '', '', '', '', '', NULL, '25022682', '$2y$10$DVVOm/oKK2UxGnXSmT8nIeaq.dB5gyd4cfOGrRBt45nuIsf2YsftK', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(673, 1, '25012683', '0121790021', '7208222005120002', 'SIGIT MAHARDIKA ', 'Tinombala ', '2012-05-20', 'L', 'Islam', 'Tinombala Sejati ', NULL, NULL, NULL, NULL, '', 'sigitma@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000', NULL, NULL, NULL, 'Suwoyo', 'Sodiah Indah Puspita Sari', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_sigitmahardika_25012683.jpg', 'kk_sigitmahardika_25012683.jpg', '', '', '', '', '', '', NULL, '25012683', '$2y$10$9.dQWBMMXCEg4S35wPLooecCgUB0ZaxYK4ZAZpiSYXkvH68QKpZVa', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(674, 1, '25022684', '0117630731', '7208074110110001', 'SINDI OKTAVIA', 'Tinombala', '2011-10-01', 'P', 'Islam', 'Dusun I Sido Dadi Desa Tinombala Sejati', NULL, NULL, NULL, NULL, '', 'sindiokta@gmail.com', NULL, NULL, NULL, NULL, NULL, '0885652063097', NULL, NULL, NULL, 'Ahmadi', 'Kusuma wati', 'Pedagang', 'Ibu rumah tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_sindioktavia_25022684.jpg', 'kk_sindioktavia_25022684.jpg', 'ijazah_sindioktavia_25022684.jpg', '', '', '', '', '', NULL, '25022684', '$2y$10$qpW3oGcytB5IbkNUzrnTLu.9LHhg9KnOtq0jt6izORFYEpmJLJMyG', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(675, 1, '25022685', '3125032084', '7208125705120002', 'SISKA AULIA', 'Sumber Agung', '2012-05-17', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', 'siskaaulia@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Aahmat N. ', 'Norma', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_siskaaulia_25022685.jpg', 'kk_siskaaulia_25022685.jpg', 'ijazah_siskaaulia_25022685.jpg', '', '', '', '', '', NULL, '25022685', '$2y$10$jJC1PenD0YO8emiC42Gz5uJhrw3E213pP/UbduBp77l8vEnbK6Ymi', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(676, 1, '25022686', '3124665408', '7208057101120001', 'SITI FADILA', 'Ogotumubu', '2012-01-31', 'P', 'Islam', 'Desa Bosagon Jaya Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', 'sitifadila@gmail.com', NULL, NULL, NULL, NULL, NULL, '00', NULL, NULL, NULL, 'Dahrin', 'Lusnia', 'Petani', 'Urusan Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 3 MALINO', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_sitifadila_25022686.jpg', 'kk_sitifadila_25022686.jpg', 'ijazah_sitifadila_25022686.jpg', '', '', '', '', '', NULL, '25022686', '$2y$10$24cYMYVsPT5VXQWG4FA5QO9DwWaGEPV7.IUFBQ.8qckNm9etG.jGW', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(677, 1, '25022687', '0126993363', '7208124208120002', 'Suvi Azhra Putri', 'Kayu Agung', '2012-08-02', 'P', 'Islam', 'Desa Kayuagung Kecamatan Mepanga', NULL, NULL, NULL, NULL, '', 'suviazhra@gmail.com', NULL, NULL, NULL, NULL, NULL, '081523925219', NULL, NULL, NULL, 'Agus Supriono', 'Surfiatun', 'Petani', 'Irt', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD Negeri 1 Kayu Agung', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_suviazhraputri_25022687.jpg', 'kk_suviazhraputri_25022687.jpg', 'ijazah_suviazhraputri_25022687.jpg', '', '', '', '', '', NULL, '25022687', '$2y$10$sm1JKxKQF4dzxbhGSg0BqO3yQPKsI7TxuRlPj9Pi8oPcdrIrRXNxm', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(678, 1, '25012688', '0127732388', '7208221203120001', 'SYADIN MAULANA', 'Tinombala', '2012-03-12', 'L', 'Islam', 'Desa Tinombala Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', 'syadinmaulana@gmail.com', NULL, NULL, NULL, NULL, NULL, '087781107327', NULL, NULL, NULL, 'Muhamad Syaifudin', 'Kuminah', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_syadinmaulana_25012688.jpg', 'kk_syadinmaulana_25012688.jpg', 'ijazah_syadinmaulana_25012688.jpg', '', '', '', '', '', NULL, '25012688', '$2y$10$MfoP53.WL4w9s/DidVsAgei.chMfxDJQh0o7kX0kzvl8x./3EYhcG', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(679, 1, '25012689', '3129924855', '7208121512120003', 'SYAFERI REDIKA PRATAMA', 'Kayu Agung ', '2012-12-15', 'L', 'Islam', 'Kayu Agung ', NULL, NULL, NULL, NULL, '', 'syaferi@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Sumarni', 'Yuyun Daryanti', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'MIS HIDAYATUL MUBTADI IEN', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_syaferiredikapratama_25012689.jpg', 'kk_syaferiredikapratama_25012689.jpg', 'ijazah_syaferiredikapratama_25012689.jpg', '', '', '', '', '', NULL, '25012689', '$2y$10$jSSrqe7CMhKa.amZrgzx/eO5RCv.DEwAS6G9i7S.3.rTcPbCa2UmO', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(680, 1, '25022690', '3126588932', '7208125911120001', 'SYIFA NUR ALIYA', 'Sumber Agung', '2012-11-19', 'P', 'Islam', 'Sumber Agung', NULL, NULL, NULL, NULL, '', 'syifanur@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Suwono Wiji', 'Astutik', 'Petani/Pekebun', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_syifanuraliya_25022690.jpg', 'kk_syifanuraliya_25022690.jpg', 'ijazah_syifanuraliya_25022690.jpg', '', '', '', '', '', NULL, '25022690', '$2y$10$goRPOnLqMkOe0Cv98z46OetDfxXgSuRx7APOGfB24SFkRdY.nF6mu', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(681, 1, '25022691', '0128361901', '7208126812120001', 'SYIFA SABILA', 'Kayu Agung', '2012-12-28', 'P', 'Islam', 'Kayu Agung', NULL, NULL, NULL, NULL, '', 'syifasabila@gmail.com', NULL, NULL, NULL, NULL, NULL, '082292908593', NULL, NULL, NULL, 'Sumadi', 'Suryati', 'Petani/Pekebun', 'Petani/Pekebun', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SDN 1 KAYU AGUNG ', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_syifasabila_25022691.jpg', 'kk_syifasabila_25022691.jpg', 'ijazah_syifasabila_25022691.jpg', '', '', '', '', '', NULL, '25022691', '$2y$10$ZxL/8p4ZnEi/OmvxxUPctOj1ZRLNfG921rE6v4P7CWUMn5lPJZoqG', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(682, 1, '25022692', '3128798132', '7208224603140001', 'TUTI FIDAYANTI', 'Tinombala', '2012-03-06', 'P', 'Islam', 'Desa Tinombala Barat Kecamatan Ongka Malino', NULL, NULL, NULL, NULL, '', 'tutifidayanti@gmail.com', NULL, NULL, NULL, NULL, NULL, '0000000000', NULL, NULL, NULL, 'Tumiran', 'Slamet', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD INPRES 2 TINOMBALA', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_tutifidayanti_25022692.jpg', 'kk_tutifidayanti_25022692.jpg', 'ijazah_tutifidayanti_25022692.jpg', '', '', '', '', '', NULL, '25022692', '$2y$10$PfJ2ikSii02bAiLGz2DmdOW8I7FS2MiSxkvLtwEigWV3HJl8Cbowy', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(683, 1, '25012693', '0122162522', '7208121512120001', 'WILDAN AR RAFAEL', 'Sumber Agung', '2012-12-15', 'L', 'Islam', 'No LXXVII Blok E Rt III Dusun IX Kayu Mahoni Desa Kayu Agung', NULL, NULL, NULL, NULL, '', 'wildanar@gmail.com', NULL, NULL, NULL, NULL, NULL, '085399733668', NULL, NULL, NULL, 'Agus Sugito', 'Tresmiatun', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, NULL, NULL, '', NULL, 'SD NEGERI 1 KAYU AGUNG', NULL, 2025, 1, NULL, NULL, NULL, '2025-08-25', 'baru', 'akta_wildanarrafael_25012693.pdf', 'kk_wildanarrafael_25012693.pdf', 'ijazah_wildanarrafael_25012693.pdf', '', '', '', '', '', NULL, '25012693', '$2y$10$r/Kgyu1DiOxa9nvTUBUgfO5XPmVTNB0Bx/4mNHlYgyHeYXdtoA7B6', '', '', '0000-00-00 00:00:00', '', NULL, '2025-08-24 15:51:49', 1, '2025-08-25 23:51:49', '2025-08-25 23:51:49'),
(684, 1, '25012694', '0109412927', '7208180210100002', 'ABRAHAM SOLICHIN WONGGOW', 'Palu', '2010-10-02', 'L', 'Kristen', 'Mensung', 'Mensung', 'Mepanga', 'Parigi Moutong', 'undefined', '94476', '', 'Mampu', 2, 2, NULL, NULL, 'undefined', NULL, NULL, NULL, 'ROBBY SOLICHIN WONGGOW', 'OLIVIANA WONGGOW', 'Wiraswasta', 'Mengurus Rumah Tangga', '', '', NULL, NULL, ' Mensung', '089898989', '', NULL, '22', '46', 11, 1, NULL, '', '', '2025-09-26', 'mutasi', '', '', 'undefined', 'undefined', '', '', '', '', NULL, '25012694', '$2y$10$IhAQhKcEgq1N4GSLQ5awQOi.EMjcBBrQCu9gLT8WFUeogCYSmq27G', '', '', '0000-00-00 00:00:00', '', '8b5d0e4535ab5c482c3e92f32ba4f62c', '2025-12-05 05:27:42', 1, '2025-09-26 12:54:03', '2025-12-06 13:27:42'),
(685, 1, '25022695', '3113862275', '7208126912110001', 'Desya Anadiva', 'Sumber Agung', '2011-12-29', 'P', 'Islam', 'Desa Sumber Agung', 'Sumber Agung', 'Mepanga', 'Parigi Moutong', NULL, '94476', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Priowidodo', 'Susiana', 'Petani/Pekebun ', 'Mengurus Rumah Tangga', '', '', NULL, NULL, '   Desa Sumber Agung', '000000', '', NULL, '20', '45', 11, 1, NULL, '', '', '2025-10-01', 'mutasi', '', '', 'undefined', 'undefined', '', '', '', '', NULL, '', '', '', '', '0000-00-00 00:00:00', '', NULL, '2025-09-30 05:54:40', 1, '2025-10-01 13:54:40', '2025-10-01 14:32:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_absensi`
--

CREATE TABLE `siswa_absensi` (
  `id_absensi` bigint(20) NOT NULL,
  `id_riwayatabsensi` int(11) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_tingkat` int(10) UNSIGNED DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `jenis_absensi` enum('harian','mapel') NOT NULL DEFAULT 'harian',
  `guru` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `bulan` int(2) NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `nis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `absen` varchar(20) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tapel` varchar(9) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `siswa_absensi`
--

INSERT INTO `siswa_absensi` (`id_absensi`, `id_riwayatabsensi`, `id_sekolah`, `id_tingkat`, `id_kelas`, `id_mapel`, `jenis_absensi`, `guru`, `tanggal`, `bulan`, `jam_masuk`, `jam_keluar`, `nis`, `absen`, `keterangan`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020418', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(2, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010420', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(3, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(4, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020426', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(5, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(6, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(7, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(8, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(9, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(10, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020452', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(11, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020458', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(12, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020461', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(13, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020466', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(14, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(15, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(16, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010472', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(17, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(18, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(19, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(20, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(21, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(22, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(23, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(24, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(25, 1, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020488', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(26, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010495', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(27, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020500', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(28, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(29, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(30, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(31, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020505', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(32, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(33, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(34, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(35, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(36, 0, 1, 8, 35, 11, 'mapel', 6, '2024-07-29', 7, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(37, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020449', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(38, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(39, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(40, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(41, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(42, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(43, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(44, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(45, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(46, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(47, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(48, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(49, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(50, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(51, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(52, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(53, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(54, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(55, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(56, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(57, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(58, 0, 1, 9, 33, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(59, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(60, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(61, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(62, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(63, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(64, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(65, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(66, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(67, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(68, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(69, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(70, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(71, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010565', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(72, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(73, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(74, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(75, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(76, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(77, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(78, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(79, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(80, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020595', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(81, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(82, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(83, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(84, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(85, 0, 1, 7, 38, 11, 'mapel', 6, '2024-07-30', 7, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(86, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(87, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020522', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(88, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(89, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(90, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(91, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(92, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(93, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(94, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(95, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(96, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(97, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(98, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '24010607', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(99, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(100, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(101, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(102, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '24010608', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(103, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(104, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(105, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(106, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(107, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(108, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(109, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(110, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(111, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(112, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020514', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(113, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020515', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(114, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(115, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(116, 0, 1, 8, 34, 11, 'mapel', 6, '2024-07-31', 7, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(117, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(118, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(119, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(120, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '24020416', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(121, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(122, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(123, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(124, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(125, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(126, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(127, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(128, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(129, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(130, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '24020414', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(131, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020415', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(132, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(133, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(134, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(135, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22010498', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(136, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(137, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '001021212', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(138, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '22020512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(139, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010417', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(140, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020419', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(141, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010421', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(142, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020423', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(143, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020427', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(144, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020428', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(145, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020437', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(146, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020438', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(147, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(148, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(149, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(150, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(151, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020453', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(152, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(153, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(154, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010457', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(155, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(156, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(157, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010462', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(158, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(159, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(160, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(161, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020471', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(162, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(163, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(164, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(165, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(166, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(167, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(168, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010492', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(169, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020497', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(170, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(171, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(172, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-01', 8, NULL, NULL, '23010518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(173, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010440', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(174, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(175, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010442', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(176, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(177, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(178, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020451', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(179, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(180, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(181, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(182, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(183, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(184, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(185, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(186, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(187, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(188, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(189, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(190, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(191, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020490', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(192, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(193, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22010499', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(194, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(195, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(196, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(197, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-02', 8, NULL, NULL, '22020513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(198, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020524', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(199, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010529', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(200, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020532', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(201, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010530', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(202, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010534', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(203, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020535', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(204, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010544', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(205, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010545', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(206, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020552', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(207, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010554', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(208, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020556', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(209, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010562', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(210, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010563', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(211, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010564', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(212, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020569', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(213, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020570', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(214, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020572', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(215, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020573', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(216, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020574', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(217, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020576', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(218, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010579', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(219, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020588', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(220, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020592', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(221, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020593', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(222, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010596', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(223, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24020602', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(224, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010604', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(225, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-03', 8, NULL, NULL, '24010606', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(226, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020418', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(227, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010420', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(228, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(229, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020426', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(230, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(231, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(232, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(233, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(234, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(235, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(236, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(237, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020461', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(238, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(239, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(240, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010470', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(241, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(242, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(243, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(244, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(245, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(246, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(247, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(248, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(249, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(250, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(251, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(252, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(253, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(254, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(255, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(256, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020505', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(257, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(258, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(259, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(260, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(261, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(262, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010525', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(263, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020526', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(264, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010528', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(265, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020537', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(266, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010538', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(267, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010541', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(268, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010542', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(269, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010543', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(270, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020546', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(271, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020547', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(272, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010550', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(273, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020551', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(274, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010557', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(275, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010558', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(276, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010559', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(277, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010567', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(278, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010568', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(279, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020571', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(280, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020575', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(281, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010578', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(282, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24010577', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(283, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020586', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(284, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020587', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(285, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020589', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(286, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020590', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(287, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020594', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(288, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020597', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(289, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-05', 8, NULL, NULL, '24020600', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(290, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(291, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(292, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(293, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(294, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010468', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(295, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(296, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(297, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(298, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(299, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(300, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(301, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(302, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(303, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(304, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(305, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(306, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(307, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(308, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(309, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(310, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(311, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(312, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(313, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(314, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(315, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(316, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(317, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(318, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(319, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(320, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(321, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(322, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(323, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(324, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010565', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(325, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(326, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(327, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(328, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(329, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(330, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(331, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(332, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(333, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(334, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(335, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(336, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(337, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24020603', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(338, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-06', 8, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(339, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(340, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020522', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(341, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(342, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(343, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59');
INSERT INTO `siswa_absensi` (`id_absensi`, `id_riwayatabsensi`, `id_sekolah`, `id_tingkat`, `id_kelas`, `id_mapel`, `jenis_absensi`, `guru`, `tanggal`, `bulan`, `jam_masuk`, `jam_keluar`, `nis`, `absen`, `keterangan`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(344, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(345, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(346, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(347, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(348, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(349, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(350, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(351, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '24010607', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(352, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(353, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(354, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(355, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '24010608', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(356, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(357, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(358, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(359, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(360, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(361, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(362, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(363, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(364, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(365, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020514', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(366, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(367, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(368, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(369, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-07', 8, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(370, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020418', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(371, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010420', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(372, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(373, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020426', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(374, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(375, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(376, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(377, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(378, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(379, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(380, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(381, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020461', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(382, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(383, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(384, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(385, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(386, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(387, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(388, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(389, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(390, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(391, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(392, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(393, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(394, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(395, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(396, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(397, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(398, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(399, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(400, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020505', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(401, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(402, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(403, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(404, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(405, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(406, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010525', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(407, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020526', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(408, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010528', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(409, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020537', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(410, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010538', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(411, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010541', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(412, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010542', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(413, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010543', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(414, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020546', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(415, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020547', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(416, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010550', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(417, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020551', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(418, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010557', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(419, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010558', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(420, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010559', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(421, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010567', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(422, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010568', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(423, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020571', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(424, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020575', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(425, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010578', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(426, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24010577', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(427, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020586', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(428, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020587', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(429, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020589', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(430, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020590', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(431, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020594', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(432, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020597', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(433, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-19', 8, NULL, NULL, '24020600', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(434, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(435, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(436, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(437, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(438, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(439, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(440, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(441, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(442, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(443, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(444, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(445, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(446, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(447, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(448, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(449, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(450, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(451, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(452, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(453, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(454, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(455, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(456, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(457, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(458, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(459, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(460, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(461, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(462, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(463, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(464, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(465, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(466, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(467, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(468, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010565', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(469, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(470, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(471, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(472, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(473, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(474, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(475, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(476, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(477, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(478, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(479, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(480, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(481, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(482, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-20', 8, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(483, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(484, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020522', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(485, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(486, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(487, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(488, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(489, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(490, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(491, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(492, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(493, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(494, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(495, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '24010607', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(496, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(497, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(498, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(499, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '24010608', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(500, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(501, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(502, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(503, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(504, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(505, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(506, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(507, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(508, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(509, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020514', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(510, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(511, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(512, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(513, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-21', 8, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(514, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(515, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(516, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(517, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '24020416', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(518, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(519, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(520, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010452', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(521, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(522, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(523, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(524, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(525, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(526, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(527, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '24020414', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(528, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020415', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(529, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(530, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(531, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(532, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22010498', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(533, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(534, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '001021212', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(535, 0, 1, 9, 32, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '22020512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(536, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010417', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(537, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020419', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(538, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010421', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(539, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020423', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(540, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020427', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(541, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020428', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(542, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020437', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(543, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020438', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(544, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(545, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(546, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(547, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(548, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020453', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(549, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(550, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(551, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010457', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(552, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(553, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(554, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010462', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(555, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(556, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(557, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(558, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020471', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(559, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(560, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(561, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020484', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(562, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(563, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(564, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(565, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010492', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(566, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020497', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(567, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(568, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(569, 0, 1, 8, 36, 11, 'mapel', 6, '2024-08-22', 8, NULL, NULL, '23010518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(570, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020524', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(571, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010529', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(572, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020532', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(573, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010530', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(574, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010534', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(575, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020535', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(576, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010544', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(577, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010545', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(578, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020552', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(579, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010554', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(580, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020556', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(581, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010562', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(582, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010563', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(583, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010564', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(584, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020569', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(585, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020570', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(586, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020572', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(587, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020573', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(588, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020574', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(589, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020576', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(590, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010579', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(591, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020588', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(592, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020592', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(593, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020593', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(594, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010596', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(595, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24020602', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(596, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010604', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(597, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-24', 8, NULL, NULL, '24010606', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(598, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020418', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(599, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010420', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(600, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(601, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020426', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(602, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(603, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(604, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(605, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(606, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(607, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(608, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(609, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020461', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(610, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(611, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(612, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(613, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(614, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(615, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(616, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(617, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(618, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(619, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(620, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(621, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010486', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(622, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(623, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(624, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(625, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(626, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(627, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(628, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020505', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(629, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(630, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(631, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(632, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(633, 0, 1, 8, 35, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(634, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010525', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(635, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020526', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(636, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010528', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(637, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020537', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(638, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010538', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(639, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010541', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(640, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010542', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(641, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010543', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(642, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020546', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(643, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020547', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(644, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010550', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(645, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020551', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(646, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010557', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(647, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010558', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(648, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010559', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(649, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010567', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(650, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010568', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(651, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020571', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(652, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020575', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(653, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010578', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(654, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24010577', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(655, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020586', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(656, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020587', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(657, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020589', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(658, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020590', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(659, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020594', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(660, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020597', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(661, 0, 1, 7, 39, 11, 'mapel', 6, '2024-08-26', 8, NULL, NULL, '24020600', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(662, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(663, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(664, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(665, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(666, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(667, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(668, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(669, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(670, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(671, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(672, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(673, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(674, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(675, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(676, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(677, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(678, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(679, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(680, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(681, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(682, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(683, 0, 1, 9, 33, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(684, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(685, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59');
INSERT INTO `siswa_absensi` (`id_absensi`, `id_riwayatabsensi`, `id_sekolah`, `id_tingkat`, `id_kelas`, `id_mapel`, `jenis_absensi`, `guru`, `tanggal`, `bulan`, `jam_masuk`, `jam_keluar`, `nis`, `absen`, `keterangan`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(686, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(687, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020536', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(688, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(689, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(690, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(691, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(692, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(693, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(694, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(695, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(696, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010565', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(697, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(698, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(699, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(700, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(701, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(702, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(703, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(704, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(705, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(706, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(707, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(708, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(709, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(710, 0, 1, 7, 38, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(711, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(712, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020522', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(713, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(714, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(715, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(716, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(717, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(718, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(719, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(720, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(721, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(722, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(723, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '24010607', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(724, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(725, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(726, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(727, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '24010608', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(728, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020480', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(729, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(730, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(731, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(732, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(733, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(734, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(735, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(736, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(737, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020514', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(738, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(739, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(740, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(741, 0, 1, 8, 34, 11, 'mapel', 6, '2024-08-28', 8, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(742, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020418', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(743, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010420', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(744, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(745, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020426', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(746, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(747, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(748, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(749, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(750, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(751, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(752, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(753, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020461', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(754, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(755, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(756, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(757, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(758, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010473', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(759, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(760, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(761, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(762, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(763, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(764, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(765, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(766, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(767, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(768, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(769, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(770, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(771, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(772, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020505', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(773, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(774, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(775, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(776, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(777, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(778, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010525', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(779, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020526', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(780, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010528', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(781, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020537', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(782, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010538', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(783, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010541', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(784, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010542', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(785, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010543', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(786, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020546', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(787, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020547', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(788, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010550', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(789, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020551', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(790, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010557', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(791, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010558', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(792, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010559', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(793, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010567', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(794, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010568', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(795, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020571', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(796, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020575', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(797, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010578', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(798, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24010577', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(799, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020586', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(800, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020587', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(801, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020589', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(802, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020590', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(803, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020594', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(804, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020597', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(805, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-02', 9, NULL, NULL, '24020600', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(806, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(807, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(808, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(809, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(810, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(811, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(812, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(813, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(814, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(815, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(816, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(817, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(818, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(819, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(820, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(821, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(822, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(823, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(824, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(825, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(826, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(827, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(828, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(829, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(830, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(831, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(832, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(833, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(834, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(835, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(836, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(837, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(838, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(839, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(840, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010565', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(841, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(842, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(843, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(844, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(845, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(846, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(847, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(848, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(849, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(850, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(851, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(852, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(853, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(854, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-03', 9, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(855, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(856, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(857, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(858, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '24020416', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(859, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(860, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(861, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(862, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(863, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(864, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(865, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(866, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(867, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(868, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '24020414', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(869, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020415', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(870, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(871, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(872, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(873, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22010498', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(874, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(875, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '001021212', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(876, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '22020512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(877, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010417', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(878, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020419', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(879, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010421', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(880, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020423', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(881, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020427', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(882, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020428', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(883, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020437', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(884, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020438', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(885, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(886, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(887, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(888, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(889, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020453', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(890, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(891, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(892, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010457', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(893, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(894, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(895, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010462', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(896, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(897, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(898, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(899, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020471', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(900, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(901, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(902, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020484', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(903, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(904, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(905, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(906, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010492', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(907, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020497', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(908, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(909, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(910, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-05', 9, NULL, NULL, '23010518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(911, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(912, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(913, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010442', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(914, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(915, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(916, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020451', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(917, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(918, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(919, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(920, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(921, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(922, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(923, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(924, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(925, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(926, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(927, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(928, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020488', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(929, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020490', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(930, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(931, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22010499', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(932, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(933, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(934, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(935, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-06', 9, NULL, NULL, '22020513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(936, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020418', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(937, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010420', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(938, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(939, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020426', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(940, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(941, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(942, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(943, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(944, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(945, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(946, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(947, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020461', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(948, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(949, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(950, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(951, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(952, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(953, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(954, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(955, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(956, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(957, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(958, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(959, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(960, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(961, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(962, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(963, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(964, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(965, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(966, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020505', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(967, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(968, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(969, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(970, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(971, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(972, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010525', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(973, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020526', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(974, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010528', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(975, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020537', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(976, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010538', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(977, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010541', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(978, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010542', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(979, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010543', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(980, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020546', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(981, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020547', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(982, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010550', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(983, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020551', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(984, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010557', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(985, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010558', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(986, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010559', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(987, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010567', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(988, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010568', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(989, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020571', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(990, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020575', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(991, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010578', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(992, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24010577', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(993, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020586', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(994, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020587', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(995, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020589', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(996, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020590', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(997, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020594', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(998, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020597', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(999, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-09', 9, NULL, NULL, '24020600', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1000, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1001, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1002, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1003, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1004, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1005, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1006, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1007, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1008, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1009, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1010, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1011, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1012, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1013, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1014, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1015, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1016, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1017, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1018, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1019, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1020, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1021, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1022, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1023, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1024, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1025, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1026, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1027, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59');
INSERT INTO `siswa_absensi` (`id_absensi`, `id_riwayatabsensi`, `id_sekolah`, `id_tingkat`, `id_kelas`, `id_mapel`, `jenis_absensi`, `guru`, `tanggal`, `bulan`, `jam_masuk`, `jam_keluar`, `nis`, `absen`, `keterangan`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1028, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1029, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1030, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1031, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1032, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1033, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1034, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010565', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1035, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1036, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1037, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1038, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1039, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1040, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1041, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1042, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1043, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1044, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1045, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1046, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1047, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1048, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-10', 9, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1049, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010439', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1050, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010443', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1051, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1052, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '24020416', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1053, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1054, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1055, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1056, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1057, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1058, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010460', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1059, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1060, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1061, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1062, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '24020414', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1063, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '23020415', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1064, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1065, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1066, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1067, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22010498', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1068, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1069, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '001021212', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1070, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-12', 9, NULL, NULL, '22020512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1071, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020524', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1072, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010529', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1073, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020532', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1074, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010530', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1075, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010534', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1076, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020535', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1077, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010544', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1078, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010545', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1079, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020552', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1080, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010554', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1081, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020556', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1082, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010562', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1083, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010563', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1084, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010564', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1085, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020569', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1086, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020570', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1087, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020572', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1088, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020573', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1089, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020574', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1090, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020576', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1091, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010579', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1092, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020588', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1093, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020592', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1094, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020593', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1095, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010596', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1096, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24020602', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1097, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010604', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1098, 0, 1, 7, 37, 11, 'mapel', 6, '2024-09-14', 9, NULL, NULL, '24010606', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1099, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020524', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1100, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010529', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1101, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020532', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1102, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010530', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1103, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010534', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1104, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020535', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1105, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010544', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1106, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010545', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1107, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020552', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1108, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010554', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1109, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020556', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1110, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010562', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1111, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010563', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1112, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010564', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1113, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020569', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1114, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020570', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1115, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020572', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1116, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020573', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1117, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020574', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1118, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020576', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1119, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010579', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1120, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020588', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1121, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020592', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1122, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020593', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1123, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010596', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1124, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24020602', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1125, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010604', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1126, 0, 1, 7, 37, 11, 'mapel', 6, '2024-08-31', 8, NULL, NULL, '24010606', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1127, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1128, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1129, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010442', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1130, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1131, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1132, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020451', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1133, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1134, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1135, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1136, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1137, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1138, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020474', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1139, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1140, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010480', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1141, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1142, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1143, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1144, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020488', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1145, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020490', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1146, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1147, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22010499', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1148, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1149, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1150, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1151, 0, 1, 9, 31, 11, 'mapel', 6, '2024-08-27', 8, NULL, NULL, '22020513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1152, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1153, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1154, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1155, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1156, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1157, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1158, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1159, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1160, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1161, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1162, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1163, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1164, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1165, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1166, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1167, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1168, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1169, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1170, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1171, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1172, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1173, 0, 1, 9, 33, 6, 'mapel', 3, '2024-09-24', 9, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1174, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1175, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020522', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1176, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1177, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1178, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1179, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1180, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1181, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1182, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1183, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1184, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1185, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1186, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '24010607', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1187, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1188, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1189, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1190, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '24010608', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1191, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1192, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1193, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1194, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1195, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1196, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1197, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1198, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1199, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1200, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020514', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1201, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1202, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1203, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1204, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-11', 9, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1205, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1206, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1207, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010442', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1208, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1209, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1210, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020451', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1211, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1212, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1213, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1214, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1215, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1216, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1217, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1218, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1219, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1220, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1221, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1222, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1223, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020490', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1224, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1225, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22010499', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1226, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1227, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1228, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1229, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-13', 9, NULL, NULL, '22020513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1230, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1231, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1232, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1233, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1234, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1235, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1236, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22011210', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1237, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1238, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020476', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1239, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1240, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22011211', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1241, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1242, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010484', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1243, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1244, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1245, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020523', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1246, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1247, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1248, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1249, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1250, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22010517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1251, 0, 1, 9, 33, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '22020518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1252, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1253, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1254, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010533', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1255, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1256, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1257, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1258, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1259, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1260, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1261, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1262, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1263, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1264, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010565', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1265, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1266, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1267, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1268, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1269, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1270, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1271, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1272, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1273, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1274, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1275, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1276, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1277, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1278, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-17', 9, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1279, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1280, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020522', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1281, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1282, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1283, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1284, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1285, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020440', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1286, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1287, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1288, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1289, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1290, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1291, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '24010607', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1292, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1293, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1294, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1295, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '24010608', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1296, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1297, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1298, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1299, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1300, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1301, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1302, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1303, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1304, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1305, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020514', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1306, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1307, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1308, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1309, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-18', 9, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1310, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1311, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1312, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010446', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1313, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '24020416', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1314, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1315, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1316, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1317, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1318, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1319, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1320, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1321, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1322, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1323, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '24020414', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1324, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020415', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1325, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1326, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1327, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1328, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22010498', 'sakit', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1329, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1330, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '001021212', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1331, 0, 1, 9, 32, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '22020512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1332, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010417', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1333, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020419', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1334, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010421', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1335, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020423', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1336, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020427', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1337, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020428', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1338, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020437', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1339, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020438', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1340, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020439', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1341, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020443', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1342, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1343, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020446', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1344, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020453', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1345, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020454', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1346, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010456', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1347, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010457', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1348, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020459', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1349, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020460', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1350, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010462', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1351, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020464', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1352, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1353, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020467', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1354, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020471', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1355, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1356, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020483', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1357, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020484', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1358, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1359, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010489', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1360, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020491', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1361, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010492', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1362, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020497', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1363, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23020506', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1364, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010512', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1365, 0, 1, 8, 36, 11, 'mapel', 6, '2024-09-19', 9, NULL, NULL, '23010518', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1366, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1367, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59');
INSERT INTO `siswa_absensi` (`id_absensi`, `id_riwayatabsensi`, `id_sekolah`, `id_tingkat`, `id_kelas`, `id_mapel`, `jenis_absensi`, `guru`, `tanggal`, `bulan`, `jam_masuk`, `jam_keluar`, `nis`, `absen`, `keterangan`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1368, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010442', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1369, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010444', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1370, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1371, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020451', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1372, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1373, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1374, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010465', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1375, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1376, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010473', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1377, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020474', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1378, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1379, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1380, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1381, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020486', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1382, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010487', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1383, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1384, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020490', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1385, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1386, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22010499', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1387, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1388, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1389, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1390, 0, 1, 9, 31, 11, 'mapel', 6, '2024-09-20', 9, NULL, NULL, '22020513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1391, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020418', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1392, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010420', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1393, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020425', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1394, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020426', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1395, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020429', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1396, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010430', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1397, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020433', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1398, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020435', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1399, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020448', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1400, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020452', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1401, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020458', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1402, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020461', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1403, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020466', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1404, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020469', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1405, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010470', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1406, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010472', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1407, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010473', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1408, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '22010479', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1409, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010475', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1410, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010477', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1411, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020478', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1412, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020479', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1413, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010485', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1414, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010486', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1415, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020488', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1416, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010495', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1417, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020500', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1418, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020501', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1419, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020502', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1420, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020504', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1421, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020505', 'izin', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1422, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020508', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1423, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020509', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1424, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23010513', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1425, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020519', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1426, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '23020521', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1427, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010525', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1428, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020526', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1429, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010528', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1430, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020537', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1431, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010538', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1432, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010541', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1433, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010542', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1434, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010543', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1435, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020546', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1436, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020547', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1437, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010550', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1438, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020551', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1439, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010557', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1440, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010558', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1441, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010559', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1442, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010567', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1443, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010568', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1444, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020571', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1445, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020575', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1446, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010578', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1447, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24010577', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1448, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020586', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1449, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020587', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1450, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020589', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1451, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020590', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1452, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020594', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1453, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020597', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1454, 0, 1, 7, 39, 11, 'mapel', 6, '2024-09-23', 9, NULL, NULL, '24020600', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1455, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010527', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1456, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020531', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1457, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010533', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1458, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020536', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1459, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010539', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1460, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010540', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1461, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020548', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1462, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020549', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1463, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010553', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1464, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020555', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1465, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010560', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1466, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010561', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1467, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010565', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1468, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010566', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1469, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010580', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1470, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010581', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1471, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010582', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1472, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010583', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1473, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010584', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1474, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010585', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1475, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020591', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1476, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020595', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1477, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020598', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1478, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010599', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1479, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020601', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1480, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24020603', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1481, 0, 1, 7, 38, 11, 'mapel', 6, '2024-09-24', 9, NULL, NULL, '24010605', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1482, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020424', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1483, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020522', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1484, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020431', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1485, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020432', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1486, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020434', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1487, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010436', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1488, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020440', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1489, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010441', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1490, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010445', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1491, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020447', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1492, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010449', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1493, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020450', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1494, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '24010607', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1495, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020455', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1496, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010463', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1497, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010468', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1498, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '24010608', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1499, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020480', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1500, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020481', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1501, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020493', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1502, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020494', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1503, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020496', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1504, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010503', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1505, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020507', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1506, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020510', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1507, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020511', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1508, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020514', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1509, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020515', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1510, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23010516', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1511, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020517', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1512, 0, 1, 8, 34, 11, 'mapel', 6, '2024-09-25', 9, NULL, NULL, '23020520', 'hadir', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1513, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020418', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1514, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010420', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1515, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020425', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1516, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020426', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1517, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020429', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1518, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010430', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1519, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020433', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1520, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020435', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1521, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020448', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1522, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020452', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1523, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020458', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1524, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020461', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1525, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020466', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1526, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020469', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1527, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010470', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1528, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010472', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1529, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010473', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1530, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '22010479', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1531, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010475', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1532, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010477', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1533, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020478', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1534, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020479', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1535, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010485', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1536, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010486', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1537, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020488', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1538, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010495', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1539, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020500', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1540, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020501', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1541, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020502', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1542, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020504', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1543, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020505', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1544, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020508', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1545, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020509', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1546, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23010513', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1547, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020519', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1548, 0, 1, 8, 35, 11, 'mapel', 6, '2024-09-30', 9, NULL, NULL, '23020521', 'alpha', '', '10', '1', '2025-07-02 10:09:07', '2025-10-22 08:03:59'),
(1577, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020524', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1578, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010529', 'sakit', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1579, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020532', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1580, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010530', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1581, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010534', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1582, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020535', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1583, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010544', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1584, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010545', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1585, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020552', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1586, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010554', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1587, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020556', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1588, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010562', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1589, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010563', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1590, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010564', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1591, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020569', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1592, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020570', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1593, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020572', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1594, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020573', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1595, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020574', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1596, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020576', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1597, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010579', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1598, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020588', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1599, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020592', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1600, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020593', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1601, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010596', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1602, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24020602', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1603, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010604', 'hadir', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59'),
(1604, 57, 1, 7, 37, 11, 'harian', 6, '2025-07-04', 7, NULL, NULL, '24010606', 'alpha', '', '10', '1', '2025-07-05 00:29:59', '2025-10-22 08:03:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_absensi_riwayat`
--

CREATE TABLE `siswa_absensi_riwayat` (
  `id_riwayatabsensi` int(10) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_tingkat` int(10) UNSIGNED DEFAULT NULL,
  `id_jurusan` int(11) NOT NULL DEFAULT 1,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `jenis_absensi` enum('harian','mapel') NOT NULL DEFAULT 'harian',
  `guru` int(11) NOT NULL,
  `tgl_absensi` varchar(10) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa_absensi_riwayat`
--

INSERT INTO `siswa_absensi_riwayat` (`id_riwayatabsensi`, `id_sekolah`, `id_tingkat`, `id_jurusan`, `id_kelas`, `id_mapel`, `jenis_absensi`, `guru`, `tgl_absensi`, `bulan`, `tapel`, `semester`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 1, 35, 11, 'mapel', 6, '2024-07-29', 7, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(2, 1, 9, 1, 33, 11, 'mapel', 6, '2024-07-30', 7, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(3, 1, 7, 1, 38, 11, 'mapel', 6, '2024-07-30', 7, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(4, 1, 8, 1, 34, 11, 'mapel', 6, '2024-07-31', 7, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(5, 1, 9, 1, 32, 11, 'mapel', 6, '2024-08-01', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(6, 1, 8, 1, 36, 11, 'mapel', 6, '2024-08-01', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(7, 1, 9, 1, 31, 11, 'mapel', 6, '2024-08-02', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(8, 1, 7, 1, 37, 11, 'mapel', 6, '2024-08-03', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(9, 1, 8, 1, 35, 11, 'mapel', 6, '2024-08-05', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(10, 1, 7, 1, 39, 11, 'mapel', 6, '2024-08-05', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(11, 1, 9, 1, 33, 11, 'mapel', 6, '2024-08-06', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(12, 1, 7, 1, 38, 11, 'mapel', 6, '2024-08-06', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(13, 1, 8, 1, 34, 11, 'mapel', 6, '2024-08-07', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(14, 1, 8, 1, 35, 11, 'mapel', 6, '2024-08-19', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(15, 1, 7, 1, 39, 11, 'mapel', 6, '2024-08-19', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(16, 1, 9, 1, 33, 11, 'mapel', 6, '2024-08-20', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(17, 1, 7, 1, 38, 11, 'mapel', 6, '2024-08-20', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(18, 1, 8, 1, 34, 11, 'mapel', 6, '2024-08-21', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(19, 1, 9, 1, 32, 11, 'mapel', 6, '2024-08-22', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(20, 1, 8, 1, 36, 11, 'mapel', 6, '2024-08-22', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(21, 1, 7, 1, 37, 11, 'mapel', 6, '2024-08-24', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(22, 1, 8, 1, 35, 11, 'mapel', 6, '2024-08-26', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(23, 1, 7, 1, 39, 11, 'mapel', 6, '2024-08-26', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(24, 1, 9, 1, 33, 11, 'mapel', 6, '2024-08-27', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(25, 1, 7, 1, 38, 11, 'mapel', 6, '2024-08-27', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(26, 1, 8, 1, 34, 11, 'mapel', 6, '2024-08-28', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(27, 1, 8, 1, 35, 11, 'mapel', 6, '2024-09-02', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(28, 1, 7, 1, 39, 11, 'mapel', 6, '2024-09-02', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(29, 1, 9, 1, 33, 11, 'mapel', 6, '2024-09-03', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(30, 1, 7, 1, 38, 11, 'mapel', 6, '2024-09-03', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(31, 1, 9, 1, 32, 11, 'mapel', 6, '2024-09-05', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(32, 1, 8, 1, 36, 11, 'mapel', 6, '2024-09-05', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(33, 1, 9, 1, 31, 11, 'mapel', 6, '2024-09-06', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(34, 1, 8, 1, 35, 11, 'mapel', 6, '2024-09-09', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(35, 1, 7, 1, 39, 11, 'mapel', 6, '2024-09-09', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(36, 1, 9, 1, 33, 11, 'mapel', 6, '2024-09-10', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(37, 1, 7, 1, 38, 11, 'mapel', 6, '2024-09-10', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(38, 1, 9, 1, 32, 11, 'mapel', 6, '2024-09-12', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(39, 1, 7, 1, 37, 11, 'mapel', 6, '2024-09-14', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(40, 1, 7, 1, 37, 11, 'mapel', 6, '2024-08-31', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(41, 1, 9, 1, 31, 11, 'mapel', 6, '2024-08-27', 8, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(42, 1, 9, 1, 33, 6, 'mapel', 3, '2024-09-24', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(43, 1, 8, 1, 34, 11, 'mapel', 6, '2024-09-11', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(44, 1, 9, 1, 31, 11, 'mapel', 6, '2024-09-13', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(45, 1, 9, 1, 33, 11, 'mapel', 6, '2024-09-17', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(46, 1, 7, 1, 38, 11, 'mapel', 6, '2024-09-17', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(47, 1, 8, 1, 34, 11, 'mapel', 6, '2024-09-18', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(48, 1, 9, 1, 32, 11, 'mapel', 6, '2024-09-19', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(49, 1, 8, 1, 36, 11, 'mapel', 6, '2024-09-19', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(50, 1, 9, 1, 31, 11, 'mapel', 6, '2024-09-20', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(51, 1, 8, 1, 35, 11, 'mapel', 6, '2024-09-23', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(52, 1, 7, 1, 39, 11, 'mapel', 6, '2024-09-23', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(53, 1, 7, 1, 38, 11, 'mapel', 6, '2024-09-24', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(54, 1, 8, 1, 34, 11, 'mapel', 6, '2024-09-25', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(55, 1, 8, 1, 35, 11, 'mapel', 6, '2024-09-30', 9, 10, 1, '', '2025-07-02 10:09:38', '2025-10-22 08:03:59'),
(57, 1, 7, 1, 37, 11, 'harian', 6, '2025-07-04', 7, 10, 1, '', '2025-07-05 00:29:59', '2025-10-22 08:03:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_alumni`
--

CREATE TABLE `siswa_alumni` (
  `id_alumni` int(10) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `nis` varchar(15) DEFAULT NULL,
  `nisn` varchar(11) DEFAULT NULL,
  `nik` varchar(15) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `kelamin` enum('L','P') DEFAULT 'L',
  `agama` varchar(10) DEFAULT 'Islam',
  `alamat` varchar(255) DEFAULT NULL,
  `provinsi` varchar(50) DEFAULT NULL,
  `kodepos` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hp` varchar(15) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `tgl_daftar` date NOT NULL,
  `program_studi` int(11) DEFAULT NULL,
  `asal_sekolah` varchar(50) DEFAULT NULL,
  `angkatan` varchar(10) DEFAULT NULL,
  `tahun_lulus` int(11) DEFAULT NULL,
  `pekerjaan_sekarang` varchar(150) DEFAULT NULL,
  `ijazah_no` varchar(50) DEFAULT NULL,
  `ijazah_thn` varchar(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa_alumni`
--

INSERT INTO `siswa_alumni` (`id_alumni`, `id_siswa`, `nis`, `nisn`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `provinsi`, `kodepos`, `email`, `hp`, `facebook`, `foto`, `tgl_daftar`, `program_studi`, `asal_sekolah`, `angkatan`, `tahun_lulus`, `pekerjaan_sekarang`, `ijazah_no`, `ijazah_thn`, `created_at`, `update_at`) VALUES
(1, NULL, '19830', '0063840330', '720812681006000', 'Anarima Nadine Safitri', 'Kayu Agung', '2006-10-28', 'P', 'Islam', 'Kayuagung', 'Sulawesi Tengah', '94476', '', NULL, NULL, '20220122211637-foto-siswa.jpg', '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(2, NULL, '19831', '0062296447', '720805220205000', 'Andika Febriansa', 'Ogotumubu', '2005-02-22', 'L', 'Islam', 'Jl. Raksatama', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2025-07-02 11:51:40'),
(3, NULL, '19835', '0063153164', '720805080706000', 'Asrul Setiawan', 'Tilung', '2006-07-08', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(4, NULL, '19836', '0069733009', '720812501006000', 'Aulia Anwar Umami', 'Kayuagung', '2006-10-10', 'P', 'Islam', 'Dusun III Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(5, NULL, '19837', '0076183182', '720812570107000', 'Ayu Samsiyah', 'Sumber Agung', '2007-01-17', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(6, NULL, '19841', '0058046274', '720807200705000', 'Davit Julianto', 'Tinombala', '2005-07-20', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(7, NULL, '19847', '0063057554', '720807101106000', 'Elfixon Caresheanto', 'Palu', '2006-11-10', 'L', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(8, NULL, '19856', '0064759252', '720812560806000', 'Kurniati Rafita Sari', 'Kayuagung', '2006-08-16', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:15', '2022-07-13 00:05:15'),
(9, NULL, '19857', '0065345885', '720812280206000', 'Kurniawan', 'Kayuagung', '2006-02-28', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(10, NULL, '19858', '0076003190', '720807690407000', 'Laurensia Ponga', 'Ongka', '2007-04-29', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(11, NULL, '19862', '0067192334', '720807080906000', 'Muhammad Rizki', 'Tinombala', '2006-09-08', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(12, NULL, '19866', '3072483250', '720812110307000', 'Nasihin', 'Sumber Agung', '2007-03-11', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(13, NULL, '19871', '0067325872', '720812531106000', 'Nova Febianti', 'Kayu Agung', '2006-11-13', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(14, NULL, '19875', '0063107581', '720812410706000', 'Nur Fadila', 'Kayuagung', '2006-10-05', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(15, NULL, '19877', '3079926787', '720812020907000', 'Radit Pratama Putra', 'Parigi', '2007-07-02', 'L', 'Islam', 'Dusun I Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(16, NULL, '19879', '0072290420', '720812600807000', 'Renawati', 'Kayuagung', '2007-08-20', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(17, NULL, '19882', '0062341408', '720812010706006', 'Shidiqin Ja\'far', 'Kayu Agung', '2006-10-16', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(18, NULL, '19883', '0065784006', '720812550506000', 'Siti Istiana', 'Kotaraya', '2006-05-15', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(19, NULL, '19884', '0065488048', '720812600606000', 'Siti Nur Khodijah', 'Kayuagung', '2006-06-20', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(20, NULL, '19886', '0067422197', '720812510409000', 'Sri Indah Hidayati', 'Lambunu', '2006-05-06', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(21, NULL, '19894', '0074587639', '720812140207000', 'Varen Arya Saputra', 'Kayuagung', '2007-02-14', 'L', 'Kristen', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(22, NULL, '19895', '3069202686', '720807231106000', 'Very Luskianto', 'Sumber Agung', '2006-11-23', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(23, NULL, '19898', '3054363067', '720812020505000', 'Wahid', 'Sumber Agung', '2005-05-02', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(24, NULL, '19901', '0072637035', '720812220507000', 'Muhamar Arifin', 'Kayuagung', '2007-03-22', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2022-07-13 00:05:16'),
(25, NULL, '211127', '0062780714', '', 'Alif Anugrah', 'Tompe', '2006-01-10', 'L', 'Islam', '', NULL, '', '', NULL, NULL, NULL, '2021-11-10', 1, '', '2021-2022', 2022, '-', NULL, NULL, '2022-07-13 00:05:16', '2024-04-26 01:39:37'),
(26, NULL, '19823', '0067409965', '720822070406000', 'Abd. Romansa', 'Dongkas', '2006-04-07', 'L', 'Islam', 'Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(27, NULL, '19826', '3063242927', '720807151206000', 'Ahmat Andrianto', 'Tinombala', '2006-12-15', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(28, NULL, '19827', '0071412625', '720812010707004', 'Aldi Saputro', 'Kayu Agung', '2007-07-01', 'L', 'Islam', 'Bandeng', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(29, NULL, '19828', '0063839905', '720807061006000', 'Alfan Fahim', 'Parigi Moutong', '2006-10-06', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(30, NULL, '19834', '0071423247', '720812040907000', 'Asep Kurniawan', 'Kayuagung', '2007-09-04', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(31, NULL, '19838', '0052373243', '720812230305000', 'Bayu Ardiyansah', 'Kayu Agung', '2005-03-23', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(32, NULL, '19839', '0062771735', '720812610706000', 'Bilqis Khoirummanawa', 'Kayu Agung', '2006-07-21', 'P', 'Islam', 'Desa Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(33, NULL, '19842', '0061566199', '720807630906000', 'Dea Siska Ramadani', 'Palu', '2006-09-23', 'P', 'Islam', 'Dusun II Desa Tabolo Bolo', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(34, NULL, '19844', '0053967171', '720812220905000', 'Dhimas Aggil Rhamadan', 'Kayu Agung', '2005-10-22', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(35, NULL, '19845', '0064346249', '720812501006000', 'Dwi Novitasari', 'Kayu Agung', '2006-10-10', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(36, NULL, '19854', '0077945842', '720822450507000', 'Jeni Loika Sari', 'Tinombala', '2007-05-05', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(37, NULL, '19855', '0074166863', '720807170307000', 'Kholil Toadi', 'Swakarsa', '2007-03-17', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(38, NULL, '19860', '3064581205', '720807410406000', 'Mila Nuraini', 'Tinombala', '2006-04-01', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(39, NULL, '19863', '0061011629', '720807010700011', 'Muhamad Hanafi', 'Tinombala', '2006-11-17', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(40, NULL, '19864', '0066223312', '720807550707000', 'Nadia Abdullah', 'Parigi', '2007-07-15', 'P', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(41, NULL, '19865', '0073417651', '720812580207000', 'Namila', 'Kayuagung', '2007-02-18', 'P', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(42, NULL, '19868', '3075951642', '72080767010003 ', 'Nia Cintya Bella', 'Tinombala', '2007-01-27', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(43, NULL, '19869', '0077316301', '720807710107000', 'Niluh Ester', 'Palu', '2007-01-31', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(44, NULL, '19870', '0072964005', '720812640307000', 'Nindia Dwi Nuraini', 'Palu', '2007-03-24', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(45, NULL, '19876', '0065518640', '720822150806000', 'Prasnadi', 'Tinombala', '2006-08-15', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(46, NULL, '19888', '0079128860', '720807410707003', 'Sulis Setiyowati', 'Tinombala', '2007-04-26', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(47, NULL, '19890', '3074184087', '720807430207000', 'Sutriani', 'Tinombala', '2007-02-03', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(48, NULL, '19891', '0075469063', '720812590207000', 'Tri Musdalifah', 'Palu', '2007-02-19', 'P', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(49, NULL, '19893', '0079559768', '720812140207000', 'Varel Dwi Andika', 'Kayuagung', '2007-02-14', 'L', 'Kristen', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(50, NULL, '19896', '3069327564', '720812040706000', 'Vikri Ramadani', 'Sumber Agung', '2006-07-04', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(51, NULL, '19899', '0068904318', '720812101106000', 'Wayan Andika Pratama', 'Kayuagung', '2006-11-10', 'L', 'Hindu', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:32', '2022-07-13 00:05:32'),
(52, NULL, '19824', '0069624879', '720812260706000', 'Abd. Hakim', 'Palu', '2006-07-26', 'L', 'Islam', 'Jl. Nusantara', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(53, NULL, '19825', '0074463163', '720812030407000', 'Adil', 'Palu', '2007-04-03', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(54, NULL, '19829', '3078548742', '720812060607000', 'Alwi', 'Sumber Agung', '2007-06-06', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(55, NULL, '19832', '0048465342', '720812080404000', 'Angga Aprilianto', 'Kayuagung', '2004-04-08', 'L', 'Islam', 'Dusun Iii Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(56, NULL, '19843', '0062323150', '720807200806000', 'Dhadang Efendi', 'Tinombala', '2006-09-29', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(57, NULL, '19846', '0073014446', '720807020207000', 'Dwi Putra Vebrianto', 'Tinombala', '2007-02-02', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(58, NULL, '19848', '0063475084', '720812680206000', 'Feby Maia Syafana', 'Kayu Agung', '2006-02-28', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(59, NULL, '19849', '0076227458', '720812610307000', 'Haniarti', 'Kayuagung', '2007-03-21', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(60, NULL, '19850', '0068892484', '720812211106000', 'Hendri Kurniawan', 'Kayuagung', '2006-11-21', 'L', 'Kristen', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(61, NULL, '19851', '0066021510', '720807580906000', 'Imelda Rahmawati', 'Tinombala', '2006-09-18', 'P', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(62, NULL, '19852', '0063655493', '720812450506000', 'Iqrimmah Narullita', 'Kayu Agung', '2006-05-05', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(63, NULL, '19853', '0075350917', '720807170107000', 'Ishak Triwantoro', 'Tinombala', '2007-01-17', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(64, NULL, '19859', '0057839025', '720807470607000', 'Made Vita Angelina', 'Malino', '2006-08-30', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(65, NULL, '19861', '0059217373', '720812220205000', 'Moh. Arjunawan', 'Kayu Agung', '2005-02-22', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(66, NULL, '19867', '0068352365', '720812121006000', 'Nendra Adi Ramadani', 'Kayuagung', '2006-10-12', 'L', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(67, NULL, '19872', '0069702349', '720812281106000', 'Noval Apriadi', 'Kayu Agung', '2006-11-28', 'L', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(68, NULL, '19873', '0062955949', '720812681006000', 'Nur Ahmad Dani', 'Kayuagung', '2006-10-28', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(69, NULL, '19874', '0064009277', '720812621206000', 'Nur Aidah', 'Kayu Agung', '2006-12-22', 'P', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(70, NULL, '19878', '0063973784', '720812040206000', 'Randi Febrianto Kalape', 'Kayuagung', '2006-02-04', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(71, NULL, '19880', '0063745647', '720807100606000', 'Rio Saputra', 'Parigi Moutong', '2006-11-11', 'L', 'Islam', 'Tinombala Barat', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(72, NULL, '19881', '0064785136', '720812081006000', 'Ruli Ramadan', 'Kayu Agung', '2006-10-08', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(73, NULL, '19887', '0066049572', '720812550506000', 'Suciati', 'Kayuagung', '2006-05-15', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(74, NULL, '19889', '0066523930', '720807651006000', 'Susilowati Pakaya', 'Tinombala', '2006-11-25', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(75, NULL, '19892', '0062194247', '720812550806000', 'Ummi Nur Aisyah', 'Kayu Agung', '2006-08-15', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(76, NULL, '19897', '0061320098', '729897071206004', 'Vincensius Wayan Ergian', 'Bosagon', '2006-12-07', 'L', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(77, NULL, '201012', '3065443249', '720812590906100', 'Rita Trinada', 'Kotaraya', '2006-09-19', 'P', 'Islam', 'Kotaraya', NULL, '', '', NULL, NULL, NULL, '2019-07-12', 1, NULL, '2019-2020', 2022, '-', NULL, NULL, '2022-07-13 00:05:39', '2022-07-13 00:05:39'),
(78, NULL, '20010904', '0078039057', '720807091007000', 'Abdul Marik', 'Tabolo Bolo', '2007-10-09', 'L', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(79, NULL, '20010905', '0071899084', '727101010907000', 'Adi Surya Permana', 'Palu', '2007-09-01', 'L', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, 'SD Inpres 1 Kayuagung', '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(80, NULL, '20010910', '0076312395', '720807301007000', 'Ahmad Rizal', 'Tinombala', '2007-10-30', 'L', 'Islam', 'Lorong 3', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(81, NULL, '20010912', '0072890406', '720807150807000', 'Anang Prasetio', 'Parigi Moutong', '2007-08-15', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(82, NULL, '20010917', '0076287792', '720812010707000', 'Arif Ariyanto', 'Kayuagung', '2007-06-01', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(83, NULL, '20020918', '0083503149', '720812640208000', 'Ayu Elestari', 'Kayu Agung', '2008-02-24', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(84, NULL, '20010919', '0064103099', '720812180606000', 'Bahrul Alam', 'Kotaraya', '2006-06-18', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(85, NULL, '20020926', '0078746172', '720812681207000', 'Desi Setiyawati', 'Kayu Agung', '2007-12-28', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(86, NULL, '20020927', '0067673038', '720807500806000', 'Devi Karfila Andriani', 'Tinombala', '2006-08-10', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(87, NULL, '20020929', '3075881334', '720812420607000', 'Dian Ayu Sita', 'Parigi Moutong', '2007-06-02', 'P', 'Islam', 'Jln. Nusantara Dusun 4 Desa Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(88, NULL, '20020930', '0078402159', '720807701007000', 'Dian Dwi Kamila', 'Tinombala', '2007-01-30', 'P', 'Islam', 'Tinombala Barat', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(89, NULL, '20020935', '0075250695', '720807440407000', 'Egy Nur Pratiwi', 'Parigi Moutong', '2007-04-04', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(90, NULL, '20010939', '0079830265', '720807171107000', 'Faizal Fianto', 'Tinombala', '2007-11-17', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(91, NULL, '20020940', '0078584171', '720812630407000', 'Fanny Nur Fauziah', 'Kayu Agung', '2007-05-23', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(92, NULL, '20010943', '0085497030', '720807230608000', 'Gede Hezron Elfriawan', 'Bosagon', '2008-06-23', 'L', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(93, NULL, '20020947', '0074643272', '720812550807000', 'Ilma Putri Harianti', 'Kayu Agung', '2007-08-15', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(94, NULL, '20020949', '0081916246', '720807550508000', 'Kesya Melsheani', 'Palu', '2008-05-15', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(95, NULL, '20010951', '0078213253', '720812280807000', 'M. Naufal Gustiansyah', 'Kayu Agung', '2007-08-28', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(96, NULL, '20010952', '0078991791', '720812630307000', 'M. Rizal Saputra', 'Tinombala', '2007-03-25', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(97, NULL, '20010958', '0089432558', '720807160208000', 'Moh Andika', 'Bosagon', '2008-02-16', 'L', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(98, NULL, '20010959', '0072714622', '720812310707000', 'Moh. Alan Saputra', 'Sumber Agung', '2007-07-31', 'L', 'Islam', 'Jl. Nusantara', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(99, NULL, '20010961', '0087194772', '720807050308000', 'Moh.Arfandi.A.Musa', 'Bosagon', '2008-03-05', 'L', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(100, NULL, '20010965', '0084868550', '720812050518000', 'Mohammad Khoiril', 'Kayu Agung', '2008-01-26', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(101, NULL, '20010968', '0077292998', '720812230507000', 'Muhammad Riko Ardianto', 'Kayu Agung', '2007-05-23', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(102, NULL, '20020970', '0075003549', '720807600907000', 'Ni Made Yundriani', 'Bosagon', '2007-09-20', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(103, NULL, '20010977', '0072789739', '720812210507000', 'Pasha Ferdyansyah', 'Kayu Agung', '2007-09-19', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(104, NULL, '20020984', '0085821882', '720812560108000', 'Revalina Mahali', 'Kayuagung', '2008-01-16', 'P', 'Kristen', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(105, NULL, '20020987', '0072532740', '720812580507000', 'Rindi Mailani', 'Kayu Agung', '2007-05-18', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(106, NULL, '20010990', '0076864998', '720812011207000', 'Sahrul Prigi Basuki', 'Parigi', '2007-12-01', 'L', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(107, NULL, '20020993', '0084249114', '720807420208000', 'Silvia', 'Tinombala', '2008-02-02', 'P', 'Islam', 'Tinombala Barat', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(108, NULL, '20021001', '0089507818', '720807480408000', 'Wulan Tria Khoirunisa', 'Tinombala', '2008-04-08', 'P', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(109, NULL, '20011004', '3070063724', '------------111', 'Yunanto Agus Junantoro', 'Tinombala', '2007-08-31', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:28:55', '2023-07-17 03:28:55'),
(110, NULL, '20010903', '0078340346', '720812210807000', 'Abdul Gofur', 'Sumber Agung', '2007-08-21', 'L', 'Islam', 'Jl. Nusantara', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(111, NULL, '20010907', '0079358102', '720306291207000', 'Afdal Haris', 'Panii', '2007-12-29', 'L', 'Islam', 'Dusun 4 Desa Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(112, NULL, '20020913', '0075658194', '720812631106000', 'Andini Amalia Putri', 'Kayu Agung', '2007-11-23', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(113, NULL, '20010914', '0077406442', '720807110907000', 'Angga Ramadhandi', 'Tinombala', '2007-09-11', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(114, NULL, '20020916', '0072306260', '720807591107000', 'Arfa', 'Bosagon', '2007-11-19', 'P', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(115, NULL, '20010920', '0071161939', '720812010507000', 'Bambang Eko Wahyudi', 'Sumber Agung', '2007-05-01', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(116, NULL, '20020931', '0075067025', '720812710507000', 'Dina Ananda', 'Kayu Agung', '2007-05-31', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(117, NULL, '20020936', '0079615360', '720812471107000', 'Eka Musayadah', 'Palu', '2007-10-07', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(118, NULL, '20010938', '0061848701', '720807010305000', 'Fadlan', 'Bosagon', '2006-08-10', 'L', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(119, NULL, '20010941', '0062502002', '720812110906000', 'Feri Irawan', 'Kayuagung', '2006-09-11', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(120, NULL, '20010942', '0084017139', '720812090308000', 'Galang Aji Praseno', 'Kayu Agung', '2008-03-09', 'L', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(121, NULL, '20020945', '0076243143', '720812541007000', 'Harum Salsabila Safitri', 'Kayu Agung', '2007-10-14', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(122, NULL, '20010946', '0075415893', '720807281207000', 'Houston Sisang', 'Palu', '2007-12-28', 'L', 'Kristen', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(123, NULL, '20020953', '0088362539', '720807660308000', 'Made Mariani', 'Bosagon', '2008-03-26', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(124, NULL, '20020954', '0086516187', '720807690308000', 'Mardawiah', 'Donggala', '2008-03-29', 'P', 'Islam', 'Poros', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(125, NULL, '20020956', '0068816281', '727103561206000', 'Mendi Kristin Sampeala', 'Palu', '2006-12-16', 'P', 'Kristen', 'Jl. Purnawirawan', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(126, NULL, '20010960', '0062556608', '720807040506000', 'Moh. Fikran', 'Bosagon', '2006-06-04', 'L', 'Islam', 'Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(127, NULL, '20010962', '3078528656', '720812061007000', 'Mohamad Ari Wahyudi', 'Sumber Agung', '2007-10-06', 'L', 'Islam', 'Desa Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(128, NULL, '20010967', '0075202334', '720812131107000', 'Muhammad Hardi Alfarizi', 'Kayu Agung', '2007-11-13', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(129, NULL, '20020972', '0083674377', '720807560208000', 'Nur Afiani', 'Moutong', '2008-02-16', 'P', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(130, NULL, '20020974', '0073403683', '720812410907000', 'Nur Ain Ningsih', 'Kayuagung', '2007-09-01', 'P', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(131, NULL, '20020976', '0079923122', '720812431107000', 'Nursia', 'Sumber Agung', '2007-11-03', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(132, NULL, '20010979', '0079931745', '720807111107000', 'Qoirul Sariffudin', 'Kayu Agung', '2007-11-11', 'L', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(133, NULL, '20010980', '0075319175', '720812110207000', 'Rama Febriyanto', 'Kayu Agung', '2007-02-11', 'L', 'Islam', 'Dusun 6 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(134, NULL, '20010982', '0077557847', '720812230207000', 'Rendi Saputra', 'Sumber Agung', '2007-02-23', 'L', 'Islam', 'Desa Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(135, NULL, '20020983', '0075681920', '720807440907000', 'Resti Septiani', 'Tinombala', '2007-09-04', 'P', 'Kristen', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(136, NULL, '20010986', '0079499719', '720807220308000', 'Riko Saputra', 'Tinombala', '2008-03-22', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(137, NULL, '20020988', '0071434438', '720812490807000', 'Rizka Widiya Wati', 'Kayu Agung', '2007-08-09', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(138, NULL, '20020989', '0079309189', '720812470206000', 'Rosa Febrianti', 'Kayu Agung', '2008-02-07', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(139, NULL, '20010992', '0071644671', '720812170807000', 'Satriyo Suryo Nugroho', 'Kayu Agung', '2007-08-17', 'L', 'Islam', '-', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(140, NULL, '20020995', '0074465875', '720812640407000', 'Siska Novita Aprilia', 'Sumber Agung', '2007-04-24', 'P', 'Islam', 'Desa Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(141, NULL, '20010998', '0069872642', '720807050505000', 'Teguh Santoso', 'Tinombala', '2006-05-05', 'L', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(142, NULL, '20021000', '0088161149', '720807420208000', 'Violita Marchilya', 'Posona', '2008-02-02', 'P', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(143, NULL, '20021006', '0084281443', '720807440108000', 'Zeni Nuraini', 'Tinombala', '2008-01-04', 'P', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(144, NULL, '22010437', '0078395217', '720812030907000', 'Im Dadu Rohman', 'Sumber Agung', '2007-09-03', 'L', 'Islam', 'Sumber Agung', NULL, '94476', '', NULL, NULL, NULL, '2022-01-03', 1, NULL, '2022-2023', 2023, '-', NULL, NULL, '2023-07-17 03:29:05', '2023-07-17 03:29:05'),
(145, NULL, '20010908', '0071241559', '720812170807000', 'Ahmad Ali Said', 'Kayuagung', '2007-08-17', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(146, NULL, '20010909', '0072601114', '720812270607000', 'Ahmad Asnawi', 'Kayu Agung', '2007-06-27', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(147, NULL, '20010910', '0083848976', '720807170208000', 'Ahmat Afandi', 'Tinombala', '2008-02-17', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(148, NULL, '20020911', '0071241019', '720812580807000', 'Ainun Jaariyah', 'Kotaraya', '2007-08-19', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(149, NULL, '20020915', '0076234869', '720812411207000', 'Anisa Fadila', 'Kayu Agung', '2007-12-01', 'P', 'Islam', 'Jl. Nusantara', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(150, NULL, '20010921', '0069232901', '720812171106000', 'Bayu Kurniawan', 'Kayuagung', '2006-11-17', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(151, NULL, '20010922', '0075798308', '720812311207000', 'Bima Putra Pratama', 'Tarakan', '2007-12-31', 'L', 'Islam', 'Dusun Iv', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(152, NULL, '20020923', '0075926100', '720812681007000', 'Cindy Monica Sari', 'Parigi', '2007-10-28', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(153, NULL, '20010924', '0072451719', '720807200207000', 'Danang Febrianzah', 'Tinombala', '2007-02-20', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(154, NULL, '20010925', '0071352418', '720807020707000', 'Dedi Suprapto', 'Tinombala', '2007-07-02', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(155, NULL, '20010928', '0072498927', '720812100507000', 'Dhion Affandy', 'Sumber Agung', '2007-05-10', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(156, NULL, '20020932', '0072560182', '720812440807000', 'Diyah Fikasari', 'Kayu Agung', '2007-08-04', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(157, NULL, '20020933', '0087384126', '720812420108000', 'Dwi Kartika', 'Kotaraya', '2008-01-01', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(158, NULL, '20020934', '0071251802', '720807440407000', 'Ega Nur Saputri', 'Parigi Moutong', '2007-04-04', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(159, NULL, '20020937', '0071127703', '720812610307000', 'Erna Arita', 'Kayu Agung', '2007-03-21', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(160, NULL, '20010944', '0078135689', '720822061007000', 'Gilbert Sisco Mamahit', 'Tinombala', '2007-10-06', 'L', 'Kristen', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(161, NULL, '20010948', '0083178409', '720822070308000', 'Ivan Indrastata', 'Tinombala', '2008-03-07', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(162, NULL, '20020950', '0075925485', '720812550507000', 'Kristina Olivia Mahali', 'Kayuagung', '2007-05-15', 'P', 'Kristen', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(163, NULL, '20020955', '0079097694', '720812581107000', 'Masayu Sekarwangi', 'Kayu Agung', '2007-11-18', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(164, NULL, '20020957', '0084257854', '731205580508000', 'Meylan Amelia', 'Palu', '2008-05-18', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(165, NULL, '20010963', '0063515307', '720812040706000', 'Mohamad Ikbal', 'Kayu Agung', '2006-07-04', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(166, NULL, '20010964', '0071347870', '720812120607000', 'Mohammad Bukhori', 'Kayu Agung', '2007-06-12', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(167, NULL, '20010966', '0086259142', '720822010208000', 'Muhammad Fadel', 'Bosagon', '2008-02-01', 'L', 'Islam', 'Bosagon', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(168, NULL, '20010969', '0082656149', '720812050308000', 'Nabil Hakim', 'Pakuli', '2008-03-05', 'L', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(169, NULL, '20020971', '0075425095', '720812530707000', 'Niluh Julianti', 'Parigi', '2007-07-13', 'P', 'Kristen', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(170, NULL, '20020973', '0078845654', '720822471207000', 'Nur Ahsania', 'Tabolo - Bolo', '2007-12-07', 'P', 'Islam', 'Tabolo - Bolo', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:14', '2023-07-17 03:29:14'),
(171, NULL, '20020975', '0063527201', '720812460706000', 'Nuraini', 'Palu', '2006-07-06', 'P', 'Islam', 'Kayuagung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(172, NULL, '20020978', '0073086876', '720812551207000', 'Putri Dwi Ariyani', 'Kayu Agung', '2007-12-15', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(173, NULL, '20010985', '0073224346', '720812121107000', 'Rhama Aditya', 'Gorontalo', '2007-11-12', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(174, NULL, '20020994', '0073034785', '720807571007000', 'Siska Dwi Ariyanti', 'Tinombala', '2007-07-17', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(175, NULL, '20020996', '0078142112', '720812410407000', 'Siti Umul Lativa', 'Kayu Agung', '2007-04-01', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(176, NULL, '20010997', '0089431297', '720812240508000', 'Surya Aditia Pratama', 'Sumber Agung', '2008-05-24', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(177, NULL, '20021002', '0087847343', '720812070108000', 'Yeni Anggeraini', 'Kayu Agung', '2008-01-07', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(178, NULL, '20011003', '0072923855', '720807070507000', 'Yudi Prasetio', 'Tinombala', '2007-05-07', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(179, NULL, '20021005', '3074552638', '720812500607000', 'Yuni Asriani', 'Sumber Agung', '2007-06-10', 'P', 'Islam', 'Desa Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2020-07-20', 1, NULL, '2020-2021', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(180, NULL, '22010438', '', '', 'Vicky Yoga Pratama', 'Sumber Agung', '2006-07-16', 'L', 'Islam', 'Kotaraya', NULL, '94476', '', NULL, NULL, NULL, '2022-05-01', 1, NULL, '2022-2023', 2023, '-', NULL, NULL, '2023-07-17 03:29:15', '2023-07-17 03:29:15'),
(181, NULL, '21011008', '0081805741', '720812010208000', 'Afrizal', 'Kayu Agung', '2008-02-01', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', 'Sulawesi Tengah', '94476', '', NULL, NULL, '0081805741.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(182, NULL, '21011010', '0091229656', '720812190209000', 'Ahmad Mudzakki Anshorullah', 'Kotaraya', '2009-02-19', 'L', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0091229656.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(183, NULL, '21021016', '0094256950', '720812590309000', 'Andini Taskia Maulida', 'Donggala', '2009-03-19', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0094256950.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38');
INSERT INTO `siswa_alumni` (`id_alumni`, `id_siswa`, `nis`, `nisn`, `nik`, `nama`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `provinsi`, `kodepos`, `email`, `hp`, `facebook`, `foto`, `tgl_daftar`, `program_studi`, `asal_sekolah`, `angkatan`, `tahun_lulus`, `pekerjaan_sekarang`, `ijazah_no`, `ijazah_thn`, `created_at`, `update_at`) VALUES
(184, NULL, '21021017', '0085663032', '720812690108000', 'Anggia Kartika', 'Kayu Agung', '2008-01-29', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0085663032.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(185, NULL, '21021018', '0066445095', '720812451106000', 'Anisa', 'Kayu Agung', '2006-11-03', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0066445095.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(186, NULL, '21011021', '0096969124', '720807110409000', 'Bayu Sarira', 'Kayu Agung', '2009-04-11', 'L', 'Islam', 'Dusun IV Desa Tabolo Bolo', NULL, '', '', NULL, NULL, '0096969124.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(187, NULL, '21011026', '3094259393', '720812070509000', 'Dhenis Zefiant', 'Sumber Agung', '2009-05-07', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3094259393.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(188, NULL, '21021027', '0098353053', '720812460609000', 'Diandra Cinta Audina', 'Sumber Agung', '2009-06-06', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0098353053.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(189, NULL, '21011031', '0089536580', '720812190608000', 'Divkri Farel Kristian', 'Sumber Agung', '2008-06-19', 'L', 'Kristen', 'Jl. Nusantara', NULL, '', '', NULL, NULL, '0089536580.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(190, NULL, '21011040', '0083487636', '720812040308000', 'Ferdi Armadiansyah', 'Sumber Agung', '2008-03-04', 'L', 'Islam', 'Jl. Nusantara', NULL, '', '', NULL, NULL, '0083487636.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(191, NULL, '21011045', '0082210616', '720812281008000', 'Galang Sanggona', 'Tondo', '2008-10-28', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0082210616.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(192, NULL, '21011046', '0089750970', '720807120908000', 'Ghalih Ramadhan', 'Tinombala', '2008-09-12', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, '0089750970.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(193, NULL, '21011050', '0075307340', '720812200807000', 'Handika Pratama', 'Kayu Agung', '2007-08-20', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0075307340.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(194, NULL, '21021057', '0092310586', '720822410109000', 'Jelsi Fena Federika', 'Sumber Agung', '2009-01-01', 'P', 'Kristen', 'Tinombala', NULL, '', '', NULL, NULL, '0092310586.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(195, NULL, '21011061', '0093738630', '720807190309000', 'Marvel Yudiana', 'Bosagon', '2009-03-19', 'L', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, '0093738630.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(196, NULL, '21021062', '3094750249', '720812570109000', 'Maya Syafana', 'Sumber Agung', '2009-01-17', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3094750249.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(197, NULL, '21011064', '3089557677', '720812300408000', 'Moh. Ansor', 'Sumber Agung', '2008-04-30', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3089557677.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(198, NULL, '21011067', '0097238266', '750201141109000', 'Mohamad Rizal', 'Garut', '2009-11-14', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0097238266.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(199, NULL, '21021073', '0087999484', '720812440191000', 'Nazwa Safa Septian', 'Lambunu', '2008-09-25', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0087999484.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(200, NULL, '21021074', '0086565218', '720812510608000', 'Neneng Rosita', 'Sumber Agung', '2008-06-11', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0086565218.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(201, NULL, '21021077', '0092414672', '720807410809000', 'Nurainnissa', 'Tinombala', '2009-08-01', 'P', 'Islam', 'Jln. Seruni', NULL, '', '', NULL, NULL, '0092414672.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(202, NULL, '21021078', '0087431390', '720812650908000', 'Nurul Aini', 'Kayu Agung', '2008-09-25', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0087431390.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(203, NULL, '21021080', '0087732966', '720807571008000', 'Putri Erma Marsella', 'Tinombala', '2008-10-17', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, '0087732966.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(204, NULL, '21021081', '0086856475', '720807410908000', 'Putri Seftia Ramadani', 'Tinombala', '2008-09-01', 'P', 'Islam', 'Jln. Dadap', NULL, '', '', NULL, NULL, '0086856475.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(205, NULL, '21021084', '0081285310', '720812450908000', 'Ramanda Nur Asiah', 'Kayu Agung', '2008-09-05', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0081285310.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(206, NULL, '21011087', '0074815996', '720812221207000', 'Rendi Erik Sandi', 'Kayu Agung', '2007-12-22', 'L', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0074815996.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(207, NULL, '21021092', '0086587587', NULL, 'Riska Pertiwi', 'Donggala', '2008-05-04', 'P', 'Islam', 'Dusun II Desa Tabolo Bolo', NULL, '', '', NULL, NULL, '0086587587.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(208, NULL, '21021103', '0084654821', '720812690708000', 'Sherina Answi Putri', 'Kayu Agung', '2008-07-29', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0084654821.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(209, NULL, '21021105', '0085654813', '720812670908000', 'Siti Aisyah', 'Sumber Agung', '2008-09-27', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0085654813.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(210, NULL, '21011110', '0083693155', '720812151208000', 'Syahrul Khoir', 'Sumber Agung', '2008-12-15', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0083693155.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(211, NULL, '21021114', '3087941265', '720807480608000', 'Vika Riskiyanti', 'Wanagading', '2008-06-08', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(212, NULL, '21021119', '3083753471', '720807541008000', 'Zahra Isabela', 'Tinombala', '2008-10-14', 'P', 'Islam', 'Tinombala Induk', NULL, '', '', NULL, NULL, '3083753471.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:38', '2024-08-14 10:25:38'),
(213, NULL, '21011007', '0072287406', '720812280807000', 'Abd. David Purnama', 'Kayu Agung', '2007-08-28', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0072287406.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(214, NULL, '21021011', '0083001246', '720812661108000', 'Ai Nurfadillah', 'Kayu Agung', '2008-11-26', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0083001246.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(215, NULL, '21011020', '0084368188', '720807080809000', 'Azril Dwi Muzaki', 'Tinombala', '2008-08-05', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, '0084368188.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(216, NULL, '21011028', '0085263317', '720812090608000', 'Dicky Wahyudi', 'Kotaraya', '2008-06-09', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0085263317.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(217, NULL, '21021033', '0096067780', '720812420309000', 'Dwi Nur Atika', 'Kayu Agung', '2009-03-02', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0096067780.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(218, NULL, '21011034', '0097670834', '720812040109000', 'Dzikri Risnandi', 'Sumber Agung', '2009-01-04', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0097670834.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(219, NULL, '21011035', '0096801019', '720807210409000', 'Eric Andra Andrian', 'Tinombala', '2009-04-21', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, '0096801019.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(220, NULL, '21021036', '3081570171', '720812501208000', 'Erina Fiantika', 'Sumber Agung', '2008-12-10', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3081570171.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(221, NULL, '21011044', '0086656174', '720807250808000', 'Fransiskus Evan Sebastian', 'Bosagon Jaya', '2008-08-25', 'L', 'Katholik', 'Bosagon Jaya', NULL, '', '', NULL, NULL, '0086656174.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(222, NULL, '21011047', '0072876512', '720807241207000', 'Glen Ardianto', 'Malino', '2007-12-24', 'L', 'Kristen', 'Lambanau', NULL, '', '', NULL, NULL, '0072876512.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(223, NULL, '21011052', '0071843308', '720812090507000', 'Herman Oktaviansyah', 'Sumber Agung', '2007-05-09', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0071843308.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(224, NULL, '21021060', '0083719826', '720807550508000', 'Maria Meilani Putri Winata', 'Bosagon Jaya', '2008-05-15', 'P', 'Katholik', 'Bosagon Jaya', NULL, '', '', NULL, NULL, '0083719826.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(225, NULL, '21011065', '0098685082', '720812220409000', 'Moh. Haizun Tafdlilan', 'Kayu Agung', '2009-04-22', 'L', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0098685082.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(226, NULL, '21021070', '0095121873', NULL, 'Mutiara Sasti', 'Padaelo', '2009-03-09', 'P', 'Islam', 'Dusun Padaidi Desa Tabolo Bolo', NULL, '', '', NULL, NULL, '0095121873.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(227, NULL, '21011079', '0091777145', '720812471208000', 'Nyoman David Dinata', 'Kayu Agung', '2008-12-07', 'L', 'Kristen', 'Kayu Agung', NULL, '', '', NULL, NULL, '0091777145.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(228, NULL, '21011085', '0098723777', '720822090109000', 'Refan Adrian', 'Bosagon', '2009-01-09', 'L', 'Kristen', 'Trans Sulawesi', NULL, '', '', NULL, NULL, NULL, '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(229, NULL, '21021090', '0084963159', '720807650908000', 'Rina Rahmadani', 'Tinombala', '2008-09-25', 'P', 'Islam', 'Tinombala Barat', NULL, '', '', NULL, NULL, '0084963159.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(230, NULL, '21021093', '0082189772', '720812440708000', 'Rissa Ristiana', 'Parigi', '2008-07-04', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(231, NULL, '21021094', '0085013627', '720812410708000', 'Riyana', 'Kayu Agung', '2008-04-20', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0085013627.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(232, NULL, '21011098', '0094581669', '720807220409000', 'Sabril Ardiansah', 'Kayu Agung', '2009-04-22', 'L', 'Islam', 'Jln. Mawar', NULL, '', '', NULL, NULL, '0094581669.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(233, NULL, '21021107', '0075803498', '720807511007000', 'Siti Maimuna', 'Eeya', '2007-10-11', 'P', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, '0075803498.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(234, NULL, '21021108', '0083852240', '720812481008000', 'Siva Aulia Rahma', 'Kayu Agung', '2008-10-09', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0083852240.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(235, NULL, '21011109', '0072275159', '720807270707000', 'Supriyanto', 'Tinombala', '2007-07-27', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0072275159.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(236, NULL, '21011112', '0098544561', '720812070108000', 'Trio Agung Saputra', 'Palu', '2009-01-11', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0098544561.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(237, NULL, '21021113', '3084331599', '720812640508000', 'Ulian Mutmainah', 'Sumber Agung', '2008-05-24', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3084331599.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(238, NULL, '21021115', '0098997516', '720812420309000', 'Virgina Hermansya', 'Kayu Agung', '2009-03-02', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0098997516.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(239, NULL, '21011116', '0081936735', '720807040808000', 'Wayan Abdi Sebastian', 'Parigi', '2008-08-04', 'L', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, '0081936735.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(240, NULL, '21021118', '0098732998', '720807580309000', 'Wiwit Toiva', 'Tinombala', '2009-03-18', 'P', 'Islam', 'Jln. Timun', NULL, '', '', NULL, NULL, '0098732998.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(241, NULL, '21020434', '0083572390', '', 'Serli Yana Fadila', 'Sumber Agung', '2008-01-24', 'P', 'Islam', 'Sumberagung', NULL, '94476', '', NULL, NULL, '0083572390.png', '2021-07-10', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:25:53', '2024-08-14 10:25:53'),
(242, NULL, '21011013', '0081561951', '720807300802000', 'Alfandi Krisyanto', 'Bosagon', '2008-05-06', 'L', 'Kristen', 'Sungai Bosagon', NULL, '', '', NULL, NULL, '0081561951.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(243, NULL, '21021019', '0077338518', '720812651007000', 'Anisa Karolin', 'Sumber Agung', '2007-10-25', 'P', 'Kristen', 'Jl. Nusantara', NULL, '', '', NULL, NULL, '0077338518.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(244, NULL, '21021024', '0089515027', '720812410508000', 'Dela Safira', 'Kayu Agung', '2008-05-01', 'P', 'Islam', 'Dusun 3', NULL, '', '', NULL, NULL, '0089515027.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(245, NULL, '21021025', '3089040652', '720812401108000', 'Della Novita Sari', 'Sumber Agung', '2008-11-08', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3089040652.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(246, NULL, '21011032', '0085938999', '720812070808000', 'Drajat Ageng Dwi Bakti', 'Kayu Agung', '2008-08-07', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0085938999.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(247, NULL, '21011037', '0089671823', '720812030708000', 'Fahrian', 'Kayu Agung', '2008-07-03', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0089671823.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(248, NULL, '21011038', '0084916066', '720807050807000', 'Farel Alifrudin', 'Kayu Agung', '2008-07-26', 'L', 'Islam', 'Kayuagung', NULL, '94476', '', NULL, NULL, '0084916066.png', '2021-10-07', 1, 'SDN 2 Kayuagung', '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(249, NULL, '21021043', '0082450522', '720812520108000', 'Fitri', 'Kayu Agung', '2008-01-12', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0082450522.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(250, NULL, '21011048', '0088265778', '720812030708000', 'Hakim', 'Parigi', '2008-07-03', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0088265778.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(251, NULL, '21021049', '0098199764', '720807230509000', 'Halim', 'Bosagon', '2009-05-23', 'P', 'Islam', 'Sungai Bosagon', NULL, '', '', NULL, NULL, '0098199764.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(252, NULL, '21021051', '0083566403', '720822420408000', 'Heni Uji Safitri', 'Tinombala', '2008-04-02', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, '0083566403.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(253, NULL, '21011053', '0082948316', '720812240708000', 'Indra Abdul Muhi', 'Kayu Agung', '2008-07-24', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0082948316.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(254, NULL, '21021054', '0081708945', '720812531108000', 'Intan Novitasari', 'Sumber Agung', '2008-11-13', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0081708945.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(255, NULL, '21021058', '0084995779', '720807080808000', 'Jihan Endang Mukaromah', 'Tinombala', '2008-08-08', 'P', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, '0084995779.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(256, NULL, '21011066', '3084118052', '720812011108000', 'Moh. Reza Arfa Said', 'Sumber Agung', '2008-11-01', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3084118052.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(257, NULL, '21011068', '0093946998', '720812040309000', 'Muh. Rofiqul Ikhsan', 'Kayu Agung', '2009-03-04', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0093946998.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(258, NULL, '21011069', '0086178740', '720812270808000', 'Muhammad Azis Kurniawan', 'Kayu Agung', '2008-08-27', 'L', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0086178740.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(259, NULL, '21011072', '0088530554', '720807620708000', 'Nazril Alfian', 'Tinombala', '2008-07-22', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, '0088530554.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(260, NULL, '21021075', '0082346411', '720807461208000', 'Nur Afida', 'Bosagon', '2008-12-06', 'P', 'Islam', 'Bosagon', NULL, '', '', NULL, NULL, '0082346411.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(261, NULL, '21021076', '0082264222', '720812520108000', 'Nur Hafifah', 'Kayu Agung', '2008-01-12', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0082264222.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(262, NULL, '21011086', '0094041518', '720812270409000', 'Rehan', 'Sumber Agung', '2009-04-27', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '0094041518.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(263, NULL, '21021097', '0099506938', '720807670309000', 'Sabilatun Najah', 'Tinombala', '2009-03-27', 'P', 'Islam', 'Jln. Mangga', NULL, '', '', NULL, NULL, '0099506938.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(264, NULL, '21021100', '3081073220', '720812550708000', 'Selfiyanti', 'Sumber Agung', '2008-07-15', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, '3081073220.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(265, NULL, '21021102', '0084381711', '720812651108000', 'Setia Ningrum', 'Kayu Agung', '2008-11-25', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0084381711.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(266, NULL, '21021104', '0099535348', '332217600709000', 'Silvia Arini', 'Kab. Semarang', '2009-07-20', 'P', 'Kristen', 'Payungan', NULL, '', '', NULL, NULL, '0099535348.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(267, NULL, '21021111', '0082616419', '720812501008000', 'Tri Sriwayati', 'Kayu Agung', '2008-10-24', 'P', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, '', '', NULL, NULL, '0082616419.png', '2021-10-07', 1, NULL, '2021-2022', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(268, NULL, '22021205', '0085061789', '720807550408000', 'Suci Aprilia', 'Palu', '2008-04-15', 'P', 'Islam', 'BOSAGON JAYA', NULL, '', '', NULL, NULL, '0085061789.png', '2022-07-11', 1, NULL, '2022-2023', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(269, NULL, '22021206', '0097313037', '720807550409000', 'Niluh Enjelita Anatasya', 'Tinombala', '2009-04-15', 'P', 'Kristen', 'OGOMEGANG', NULL, '', '', NULL, NULL, '0097313037.png', '2022-07-11', 1, NULL, '2022-2023', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(270, NULL, '22021209', '0094467865', '332304510109000', 'Irzya Rizky Wijayanti', 'Temanggung', '2009-01-11', 'P', 'Islam', 'Digelan 2', NULL, '', '', NULL, NULL, '0094467865.png', '2022-07-11', 1, NULL, '2022-2023', 2024, '-', NULL, NULL, '2024-08-14 10:26:06', '2024-08-14 10:26:06'),
(271, 317, '22010440', '0095947217', '720812020909000', 'Adam', 'Palu', '2009-09-02', 'L', 'Islam', 'Kayuagung', NULL, '94476', '', '', NULL, '0095947217.jpg', '2022-07-11', 1, 'SDN 2 Kayuagung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(272, 318, '22010441', '0096418065', '720812150909000', 'Ade Ikhsan Firmansyah', 'Kayu Agung', '2009-09-15', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, '0096418065.jpg', '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(273, 319, '22010442', '0109834173', '720807270410000', 'Agung Satrio', 'Tinombala', '2010-04-27', 'L', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, NULL, '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(274, 321, '22010444', '0098136039', '720822231109000', 'Ahmad Fauzi', 'Tabolo-Bolo', '2009-11-23', 'L', 'Islam', 'Tabolo-Bolo', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDk Tabolo-Bolo', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(275, 322, '22020445', '3107098734', '720822700110000', 'Aira Elisya', 'Palu', '2010-01-30', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'MIN 3 Parigi', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(276, 328, '22020451', '0097722174', '720812670209000', 'Aulia Eka Febriyani', 'Kayu Agung', '2009-02-27', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(277, 335, '22020458', '0103471332', '720807620410000', 'Dinda Nuraini', 'Kayu Agung', '2010-04-22', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(278, 340, '22020463', '0102892232', '720812410510000', 'Erna Sari', 'Kayu Agung ', '2010-05-01', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(279, 342, '22010465', '0102407562', '720822270110000', 'Ferdi Handoko', 'Tabolo-Bolo', '2010-01-27', 'L', 'Islam', 'Tabolo-Bolo', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDK Tabolo-Bolo', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(280, 346, '22010469', '0084195694', '320417281109000', 'Imam Firmansyah', 'Bandung', '2009-11-28', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(281, 350, '22010473', '0095484042', '720807260809000', 'Kiki Setyawan', 'Tinombala', '2009-08-26', 'L', 'Islam', 'Tinombala Jaya', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(282, 351, '22020474', '0101171616', '727101590610000', 'Kirana Rasya Nabila', 'Palu', '2010-06-18', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(283, 355, '22020478', '0103422908', '720812430410000', 'Megita Maharani', 'Kayu Agung', '2010-04-03', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(284, 357, '22010480', '0097263862', '720812251099000', 'Mohamad Akbar', 'Kayu Agung', '2009-10-25', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(285, 358, '22010481', '3100524725', '720812170210000', 'Mohamad Nur Faizh', 'Kayu Agung', '2010-02-17', 'L', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'MIS Ulil Albab', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(286, 363, '22020486', '0094379395', '720822541209000', 'Olivia Dewi', 'Tabolo-Bolo', '2009-12-14', 'P', 'Islam', 'Tabolo-Bolo', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDk Tabolo-Bolo', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(287, 364, '22010487', '0098313485', '720812270309000', 'Paseh Nandi', 'Kayu Agung', '2009-03-27', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(288, 365, '22020488', '0099890528', '720812480809000', 'Pritha Agustia', 'Kayu Agung ', '2009-08-08', 'P', 'Kristen', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(289, 367, '22020490', '0107302687', '720812511110000', 'Putri Pramayssela', 'Kayu Agung', '2010-11-11', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(290, 370, '22010493', '0091133929', '720812010609000', 'Rama Khoirurreza', 'Kayu Agung ', '2009-06-01', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(291, 376, '22010499', '0088035060', '720812130608000', 'Sa\'id  Ahmad', 'Kayu Agung ', '2008-06-13', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(292, 377, '22020500', '0088615588', '720812480908000', 'Santi Nuraini', 'Tinombala', '2008-09-08', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(293, 378, '22020501', '3090696199', '720807490909000', 'Selina', 'Tinombala', '2009-09-09', 'P', 'Islam', 'Tinombala Barat', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'MIN 3 Parigi', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(294, 388, '22020511', '0102209418', '720812580110000', 'Vitria Viadi', 'Kayu Agung', '2010-01-18', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(295, 390, '22020513', '0092306570', '731404680109000', 'Wildayanti', 'Palu', '2009-01-28', 'P', 'Islam', 'Bosagon Jaya', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:37:50', '2025-07-10 14:37:50'),
(296, 316, '22010439', '0097858353', '720807060209000', 'Abdul Rafik', 'Tabolo-Bolo', '2009-02-06', 'L', 'Islam', 'Tabolo-Bolo', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, NULL, '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(297, 320, '22010443', '0107640006', '720812040210000', 'Ahmad Farhan', 'Kayu Agung', '2010-02-04', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDK Tabolo-Bolo', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(298, 323, '22010446', '0086353384', '647204261109000', 'Akhda Abdilah', 'Samarinda', '2009-11-26', 'L', 'Islam', NULL, NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(299, 324, '22020447', '0095765729', '720812520809000', 'Anggi Lusiana Putri', 'Sumber Agung', '2009-08-12', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(300, 325, '22010448', '0093410506', '720812310509000', 'Anton Mahesa Putra', 'Kayu Agung', '2009-05-31', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(301, 329, '22010452', '0109185744', '727101230710000', 'Ayub Pratama', 'Palu', '2010-07-23', 'L', 'Islam', 'Tinombala', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(302, 331, '22020454', '0081253020', '720812461008000', 'Cesya Aulia Rahma', 'Kayu Agung ', '2008-10-06', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDN 27 Palu', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(303, 333, '22010456', '0092581671', '720807290609000', 'Dandi Juni Manuel', 'Palu', '2009-06-29', 'L', 'Kristen', 'Malino', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(304, 337, '22010460', '0089013820', '720812161208000', 'Efan Erlangga', 'Lambunu', '2008-12-16', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDN Malino', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(305, 343, '22020466', '0098571187', '720807660809000', 'Fitri Hendriah', 'Tinombala', '2009-08-26', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(306, 344, '22020467', '0106605033', '720807601010000', 'Gabrilia', 'Tinombala', '2009-10-20', 'P', 'Kristen', 'Tinombala Induk', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDN Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(307, 349, '22010472', '0099085194', '720812010609000', 'Juan Carlos Sanggel', 'Kayu Agung ', '2009-06-01', 'L', 'Kristen', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(308, 362, '22020485', '0107578646', '760107620110000', 'Nur Hafizha', 'Kota Raya', '2010-01-22', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayuagung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(309, 368, '22020491', '0103404311', '720822650109000', 'Putri Ulandari', 'Tinombala', '2010-01-25', 'P', 'Islam', 'Tinombala Induk', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(310, 372, '22010495', '0096203159', '720812230309000', 'Refan Rifaldo', 'Kayu Agung ', '2009-03-23', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SDN Inpres 3 Malino', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(311, 375, '22010498', '0093900717', '720812260906000', 'Rival Setiawan', 'Sumber Agung', '2009-09-26', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(312, 383, '22020506', '0101248923', '720812510110000', 'Siti Masita', 'Sumber Agung', '2010-01-11', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(313, 389, '22020512', '0105971793', '720812570410000', 'Widya Eka  Afriyani', 'Kayu Agung', '2010-04-17', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(314, 403, '001021212', '0095725704', '720812490509000', 'Siti Shofiyah', 'Kayu Agung', '2009-05-09', 'P', 'Islam', 'Dusun 5 Desa Kayu Agung', NULL, '', '', NULL, NULL, NULL, '0000-00-00', 1, NULL, '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(315, 404, '24020414', '0099279738', '720812660809000', 'Mirza Aliana', 'Kayu Agung', '2009-08-26', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', NULL, '', '', '081341645039', NULL, NULL, '2024-05-17', 1, 'MTs Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(316, 405, '23020415', '0092748305', '720812591109000', 'Novia Naila Masruroh', 'Kayu Agung', '2009-11-19', 'P', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, '', '', '085757549936', NULL, NULL, '2023-01-03', 1, 'MTs Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(317, 406, '24020416', '0098463764', '720807500509000', 'Anesya Munifa', 'Tinombala', '2009-05-10', 'P', 'Islam', 'Tinombala', NULL, '94476', 'nsahid@gmail.com', '1', NULL, NULL, '2024-02-04', 1, 'MTs Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:18', '2025-07-10 14:38:18'),
(318, 326, '22020449', '0092361152', '720812450809000', 'Arum Sekardiyah', 'Kayu Agung', '2009-08-05', 'P', 'Islam', 'Kayu Agung', NULL, '94476', '', '085709086824', NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayuagung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(319, 327, '22020450', '3097060375', '720807470509000', 'Arum Wiyanti', 'Tinombala', '2009-05-07', 'P', 'Islam', 'Tinombala Jaya', NULL, '94476', '', '', NULL, NULL, '2022-07-11', 1, 'MIN 3 Parigi', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(320, 336, '22020459', '0099751395', '720812421109000', 'Dwi Nofika', 'Kayu Agung', '2009-11-02', 'P', 'Islam', 'Kayu Agung', NULL, '94476', '', '', NULL, NULL, '2022-07-11', 1, 'SDN 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(321, 341, '22010464', '0095661659', '720822031009000', 'Fanly Ricardus Ponga', 'Ongka', '2009-10-03', 'L', 'Katholik', 'Bosagon Jaya', NULL, '94479', '', '', NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Malino', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(322, 345, '22010468', '0099085814', '720812311209000', 'Godho Jaka Admaja', 'Kayu Agung', '2009-12-31', 'L', 'Islam', 'Kayu Agung', NULL, '94476', '', '085824394308', NULL, NULL, '2022-07-11', 1, 'SDN 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(323, 347, '22010470', '0097073911', '720812280909000', 'Iqbal Albasyari', 'Kayu Agung', '2009-09-28', 'L', 'Islam', 'Kayu Agung', 'Sulawesi Tengah', '94476', '', '085754429394', NULL, NULL, '2022-07-11', 1, 'SDN 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(324, 352, '22010475', '0086117078', '720812290908000', 'M. Andika Ramadani', 'Kayu Agung', '2008-09-29', 'L', 'Islam', 'Kayu Agung, Dusun 9', 'Sulawesi Tengah', '94476', '', '085241337823', NULL, NULL, '2022-07-11', 1, 'SDN 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(325, 353, '22020476', '0098692310', '720807660509000', 'Maria Aurela Ponga', 'Bosagon', '2009-05-26', 'P', 'Katholik', 'Bosagon Jaya', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Malino', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(326, 354, '22020477', '0098654471', '720812540409000', 'Marlisa Aprilia', 'Kayu Agung', '2009-04-14', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(327, 360, '22010483', '0089225305', '720807051208000', 'Muh. Adri Firansyah', 'Salumbia', '2008-12-05', 'L', 'Islam', 'Bosagon Jaya', NULL, '94476', '', '', NULL, NULL, '2023-07-15', 1, 'SDN 2 Ongka Malino', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(328, 361, '22010484', '3082962472', '737114060809000', 'Muhammad Adnan Maulana', 'Palu', '2009-08-06', 'L', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(329, 366, '22020489', '0108983700', '721001410410000', 'Putri Nadia', 'Tinombala', '2010-04-01', 'P', 'Islam', 'Tinombala Sejati', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Tinombala', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(330, 381, '22020504', '0094434428', '720812710309000', 'Sindi Mega Refi', 'Sumber Agung', '2009-03-31', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(331, 385, '22020508', '0095202731', '720812631209000', 'Siti Nuraini', 'Kayu Agung', '2009-12-23', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Negeri 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(332, 386, '22020509', '0094114271', '720812530809000', 'Vicka Fitria', 'Kayu Agung ', '2009-08-13', 'P', 'Islam', 'Kayu Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(333, 387, '22010510', '3091041470', '720807300609000', 'Virgi Rivano', 'Parigi', '2009-06-30', 'L', 'Islam', 'Tinombala  Barat', 'Sulawesi Tengah', '94476', '', '', NULL, NULL, '2022-07-11', 1, 'MIN 3 Parigi', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(334, 392, '22020515', '0099378820', '720812630809000', 'Wulan Mentari', 'Sumber Agung', '2009-08-23', 'P', 'Islam', 'Sumber Agung', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, 'SD Inpres 2 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(335, 394, '22010517', '0092369036', '720807161110000', 'Yoga Adi Putra', 'Malino', '2009-11-16', 'L', 'Kristen', 'Malino', 'Sulawesi Tengah', '94476', '', '', NULL, NULL, '2022-07-11', 1, 'SDN Malino', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(336, 395, '22020518', '0109414996', '720812540110000', 'Zazkia Ayu Yulandari', 'Kayu Agung', '2010-01-14', 'P', 'Islam', 'Kayu Agung', 'Sulawesi Tengah', '94476', '', '', NULL, NULL, '2022-07-11', 1, 'SD Inpres 3 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(337, 401, '22011210', '0109563588', '720812100310000', 'Iqbal Ariansyah', 'Kayu Agung', '2010-03-10', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', 'Sulawesi Tengah', '94476', '', '085696914363', NULL, NULL, '2022-07-11', 1, 'SDN 1 Kayu Agung', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(338, 402, '22011211', '0071434788', '720807050807000', 'Moh. Fikri Apriansa', 'Malino', '2007-08-05', 'L', 'Islam', 'Bosagon', NULL, '', '', NULL, NULL, NULL, '2022-07-11', 1, NULL, '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49'),
(339, 513, '24020523', '0109107340', '720822620510000', 'Siska', 'Bosagon', '2010-05-22', 'P', 'Islam', 'Bosagon', NULL, '94476', '', '', NULL, NULL, '2024-01-01', 1, 'SMP N 3 Bolano Lambunu', '2024-2025', 2025, '-', NULL, NULL, '2025-07-10 06:38:49', '2025-07-10 14:38:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_autologin`
--

CREATE TABLE `siswa_autologin` (
  `user` int(11) NOT NULL,
  `series` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_kelas`
--

CREATE TABLE `siswa_kelas` (
  `id_siswa_kelas` int(11) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) NOT NULL DEFAULT 1,
  `id_tingkat` int(10) UNSIGNED NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kelamin` varchar(5) NOT NULL,
  `nis` varchar(25) NOT NULL,
  `tapel` int(11) NOT NULL,
  `tgl_gabung` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa_kelas`
--

INSERT INTO `siswa_kelas` (`id_siswa_kelas`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_kelas`, `id_siswa`, `kelamin`, `nis`, `tapel`, `tgl_gabung`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 9, 1, 8, 'P', '19830', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(2, 1, 1, 9, 1, 9, 'L', '19831', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(3, 1, 1, 9, 1, 12, 'L', '19835', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(4, 1, 1, 9, 1, 13, 'P', '19836', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(5, 1, 1, 9, 1, 14, 'P', '19837', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(6, 1, 1, 9, 1, 17, 'L', '19841', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(7, 1, 1, 9, 1, 23, 'L', '19847', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(8, 1, 1, 9, 1, 32, 'P', '19856', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(9, 1, 1, 9, 1, 33, 'L', '19857', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(10, 1, 1, 9, 1, 34, 'P', '19858', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(11, 1, 1, 9, 1, 75, 'L', '19901', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(12, 1, 1, 9, 1, 38, 'L', '19862', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(13, 1, 1, 9, 1, 42, 'L', '19866', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(14, 1, 1, 9, 1, 47, 'P', '19871', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(15, 1, 1, 9, 1, 51, 'P', '19875', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(16, 1, 1, 9, 1, 53, 'L', '19877', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(17, 1, 1, 9, 1, 55, 'P', '19879', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(18, 1, 1, 9, 1, 58, 'L', '19882', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(19, 1, 1, 9, 1, 59, 'P', '19883', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(20, 1, 1, 9, 1, 60, 'P', '19884', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(21, 1, 1, 9, 1, 61, 'P', '19886', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(22, 1, 1, 9, 1, 69, 'L', '19894', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(23, 1, 1, 9, 1, 70, 'L', '19895', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(24, 1, 1, 9, 1, 73, 'L', '19898', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(25, 1, 1, 9, 1, 93, 'L', '211127', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(26, 1, 1, 9, 2, 1, 'L', '19823', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(27, 1, 1, 9, 2, 4, 'L', '19826', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(28, 1, 1, 9, 2, 5, 'L', '19827', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(29, 1, 1, 9, 2, 6, 'L', '19828', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(30, 1, 1, 9, 2, 11, 'L', '19834', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(31, 1, 1, 9, 2, 15, 'L', '19838', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(32, 1, 1, 9, 2, 16, 'P', '19839', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(33, 1, 1, 9, 2, 18, 'P', '19842', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(34, 1, 1, 9, 2, 20, 'L', '19844', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(35, 1, 1, 9, 2, 21, 'P', '19845', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(36, 1, 1, 9, 2, 30, 'P', '19854', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(37, 1, 1, 9, 2, 31, 'L', '19855', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(38, 1, 1, 9, 2, 36, 'P', '19860', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(39, 1, 1, 9, 2, 39, 'L', '19863', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(40, 1, 1, 9, 2, 40, 'P', '19864', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(41, 1, 1, 9, 2, 41, 'P', '19865', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(42, 1, 1, 9, 2, 44, 'P', '19868', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(43, 1, 1, 9, 2, 45, 'P', '19869', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(44, 1, 1, 9, 2, 46, 'P', '19870', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(45, 1, 1, 9, 2, 52, 'L', '19876', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(46, 1, 1, 9, 2, 63, 'P', '19888', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(47, 1, 1, 9, 2, 65, 'P', '19890', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(48, 1, 1, 9, 2, 66, 'P', '19891', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(49, 1, 1, 9, 2, 68, 'L', '19893', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(50, 1, 1, 9, 2, 71, 'L', '19896', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(51, 1, 1, 9, 2, 74, 'L', '19899', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(52, 1, 1, 9, 3, 2, 'L', '19824', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(53, 1, 1, 9, 3, 3, 'L', '19825', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(54, 1, 1, 9, 3, 7, 'L', '19829', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(55, 1, 1, 9, 3, 10, 'L', '19832', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(56, 1, 1, 9, 3, 19, 'L', '19843', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(57, 1, 1, 9, 3, 22, 'L', '19846', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(58, 1, 1, 9, 3, 24, 'P', '19848', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(59, 1, 1, 9, 3, 25, 'P', '19849', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(60, 1, 1, 9, 3, 26, 'L', '19850', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(61, 1, 1, 9, 3, 27, 'P', '19851', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(62, 1, 1, 9, 3, 28, 'P', '19852', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(63, 1, 1, 9, 3, 29, 'L', '19853', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(64, 1, 1, 9, 3, 35, 'P', '19859', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(65, 1, 1, 9, 3, 37, 'L', '19861', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(66, 1, 1, 9, 3, 43, 'L', '19867', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(67, 1, 1, 9, 3, 48, 'L', '19872', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(68, 1, 1, 9, 3, 49, 'L', '19873', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(69, 1, 1, 9, 3, 50, 'P', '19874', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(70, 1, 1, 9, 3, 54, 'L', '19878', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(71, 1, 1, 9, 3, 56, 'L', '19880', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(72, 1, 1, 9, 3, 57, 'L', '19881', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(73, 1, 1, 9, 3, 62, 'P', '19887', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(74, 1, 1, 9, 3, 64, 'P', '19889', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(75, 1, 1, 9, 3, 67, 'P', '19892', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(76, 1, 1, 9, 3, 72, 'L', '19897', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(77, 1, 1, 9, 3, 76, 'P', '201012', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(78, 1, 1, 8, 4, 95, 'L', '20010904', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(79, 1, 1, 8, 4, 96, 'L', '20010905', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(80, 1, 1, 8, 4, 100, 'L', '20010909', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(81, 1, 1, 8, 4, 103, 'L', '20010912', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(82, 1, 1, 8, 4, 109, 'P', '20020918', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(83, 1, 1, 8, 4, 110, 'L', '20010919', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(84, 1, 1, 8, 4, 117, 'P', '20020926', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(85, 1, 1, 8, 4, 120, 'P', '20020929', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(86, 1, 1, 8, 4, 121, 'P', '20020930', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(87, 1, 1, 8, 4, 126, 'P', '20020935', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(88, 1, 1, 8, 4, 130, 'L', '20010939', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(89, 1, 1, 8, 4, 131, 'P', '20020940', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(90, 1, 1, 8, 4, 134, 'L', '20010943', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(91, 1, 1, 8, 4, 138, 'P', '20020947', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(92, 1, 1, 8, 4, 140, 'P', '20020949', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(93, 1, 1, 8, 4, 142, 'L', '20010951', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(94, 1, 1, 8, 4, 143, 'L', '20010952', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(95, 1, 1, 8, 4, 149, 'L', '20010958', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(96, 1, 1, 8, 4, 150, 'L', '20010959', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(97, 1, 1, 8, 4, 152, 'L', '20010961', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(98, 1, 1, 8, 4, 156, 'L', '20010965', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(99, 1, 1, 8, 4, 159, 'L', '20010968', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(100, 1, 1, 8, 4, 161, 'P', '20020970', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(101, 1, 1, 8, 4, 168, 'L', '20010977', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(102, 1, 1, 8, 4, 175, 'P', '20020984', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(103, 1, 1, 8, 4, 178, 'P', '20020987', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(104, 1, 1, 8, 4, 181, 'L', '20010990', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(105, 1, 1, 8, 4, 184, 'P', '20020993', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(106, 1, 1, 8, 4, 192, 'P', '20021001', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(107, 1, 1, 8, 4, 195, 'L', '20011004', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(108, 1, 1, 8, 5, 94, 'L', '20010903', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(109, 1, 1, 8, 5, 97, 'L', '20010906', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(110, 1, 1, 8, 5, 104, 'P', '20020913', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(111, 1, 1, 8, 5, 105, 'L', '20010914', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(112, 1, 1, 8, 5, 107, 'P', '20020916', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(113, 1, 1, 8, 5, 111, 'L', '20010920', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(114, 1, 1, 8, 5, 122, 'P', '20020931', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(115, 1, 1, 8, 5, 127, 'P', '20020936', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(116, 1, 1, 8, 5, 129, 'L', '20010938', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(117, 1, 1, 8, 5, 132, 'L', '20010941', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(118, 1, 1, 8, 5, 133, 'L', '20010942', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(119, 1, 1, 8, 5, 136, 'P', '20020945', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(120, 1, 1, 8, 5, 137, 'L', '20010946', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(121, 1, 1, 8, 5, 144, 'P', '20020953', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(122, 1, 1, 8, 5, 145, 'P', '20020954', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(123, 1, 1, 8, 5, 147, 'P', '20020956', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(124, 1, 1, 8, 5, 151, 'L', '20010960', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(125, 1, 1, 8, 5, 153, 'L', '20010962', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(126, 1, 1, 8, 5, 158, 'L', '20010967', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(127, 1, 1, 8, 5, 163, 'P', '20020972', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(128, 1, 1, 8, 5, 165, 'P', '20020974', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(129, 1, 1, 8, 5, 167, 'P', '20020976', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(130, 1, 1, 8, 5, 170, 'L', '20010979', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(131, 1, 1, 8, 5, 171, 'L', '20010980', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(132, 1, 1, 8, 5, 174, 'P', '20020983', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(133, 1, 1, 8, 5, 177, 'L', '20010986', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(134, 1, 1, 8, 5, 179, 'P', '20020988', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(135, 1, 1, 8, 5, 180, 'P', '20020989', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(136, 1, 1, 8, 5, 183, 'L', '20010992', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(137, 1, 1, 8, 5, 186, 'P', '20020995', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(138, 1, 1, 8, 5, 189, 'L', '20010998', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(139, 1, 1, 8, 5, 191, 'P', '20021000', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(140, 1, 1, 8, 5, 197, 'P', '20021006', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(141, 1, 1, 8, 4, 108, 'L', '20010917', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(142, 1, 1, 8, 4, 118, 'P', '20020927', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(143, 1, 1, 8, 6, 98, 'L', '20010907', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(144, 1, 1, 8, 6, 99, 'L', '20010908', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(145, 1, 1, 8, 6, 101, 'L', '20010910', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(146, 1, 1, 8, 6, 102, 'P', '20020911', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(147, 1, 1, 8, 6, 106, 'P', '20020915', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(148, 1, 1, 8, 6, 112, 'L', '20010921', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(149, 1, 1, 8, 6, 113, 'L', '20010922', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(150, 1, 1, 8, 6, 114, 'P', '20020923', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(151, 1, 1, 8, 6, 115, 'L', '20010924', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(152, 1, 1, 8, 6, 116, 'L', '20010925', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(153, 1, 1, 8, 6, 119, 'L', '20010928', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(154, 1, 1, 8, 6, 123, 'P', '20020932', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(155, 1, 1, 8, 6, 124, 'P', '20020933', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(156, 1, 1, 8, 6, 125, 'P', '20020934', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(157, 1, 1, 8, 6, 128, 'P', '20020937', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(158, 1, 1, 8, 6, 135, 'L', '20010944', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(159, 1, 1, 8, 6, 139, 'L', '20010948', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(160, 1, 1, 8, 6, 141, 'P', '20020950', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(161, 1, 1, 8, 6, 146, 'P', '20020955', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(162, 1, 1, 8, 6, 148, 'P', '20020957', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(163, 1, 1, 8, 6, 154, 'L', '20010963', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(164, 1, 1, 8, 6, 155, 'L', '20010964', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(165, 1, 1, 8, 6, 157, 'L', '20010966', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(166, 1, 1, 8, 6, 160, 'L', '20010969', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(167, 1, 1, 8, 6, 162, 'P', '20020971', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(168, 1, 1, 8, 6, 164, 'P', '20020973', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(169, 1, 1, 8, 6, 166, 'P', '20020975', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(170, 1, 1, 8, 6, 169, 'P', '20020978', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(171, 1, 1, 8, 6, 176, 'L', '20010985', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(172, 1, 1, 8, 6, 185, 'P', '20020994', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(173, 1, 1, 8, 6, 187, 'P', '20020996', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(174, 1, 1, 8, 6, 188, 'L', '20010997', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(175, 1, 1, 8, 6, 193, 'P', '20021002', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(176, 1, 1, 8, 6, 194, 'L', '20011003', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(177, 1, 1, 8, 6, 196, 'P', '20021005', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(178, 1, 1, 7, 7, 199, 'L', '21011008', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(179, 1, 1, 7, 7, 207, 'P', '21021016', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(180, 1, 1, 7, 7, 208, 'P', '21021017', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(181, 1, 1, 7, 7, 214, 'L', '21011023', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(182, 1, 1, 7, 7, 217, 'L', '21011026', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(183, 1, 1, 7, 7, 218, 'P', '21021027', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(184, 1, 1, 7, 7, 222, 'L', '21011031', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(185, 1, 1, 7, 7, 231, 'L', '21011040', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(186, 1, 1, 7, 7, 236, 'L', '21011045', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(187, 1, 1, 7, 7, 237, 'L', '21011046', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(188, 1, 1, 7, 7, 241, 'L', '21011050', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(189, 1, 1, 7, 7, 248, 'P', '21021057', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(190, 1, 1, 7, 7, 252, 'L', '21011061', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(191, 1, 1, 7, 7, 253, 'P', '21021062', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(192, 1, 1, 7, 7, 255, 'L', '21011064', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(193, 1, 1, 7, 7, 258, 'L', '21011067', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(194, 1, 1, 7, 7, 264, 'P', '21021073', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(195, 1, 1, 7, 7, 268, 'P', '21021077', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(196, 1, 1, 7, 7, 271, 'P', '21021080', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(197, 1, 1, 7, 7, 272, 'P', '21021081', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(198, 1, 1, 7, 7, 273, 'L', '21011082', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(199, 1, 1, 7, 7, 275, 'P', '21021084', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(200, 1, 1, 7, 7, 278, 'L', '21011087', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(201, 1, 1, 7, 7, 280, 'L', '21011089', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(202, 1, 1, 7, 7, 283, 'P', '21021092', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(203, 1, 1, 7, 7, 287, 'L', '21011096', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(204, 1, 1, 7, 7, 294, 'P', '21021103', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(205, 1, 1, 7, 7, 296, 'P', '21021105', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(206, 1, 1, 7, 7, 310, 'P', '21021119', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(207, 1, 1, 7, 8, 198, 'L', '21011007', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(208, 1, 1, 7, 8, 202, 'P', '21021011', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(209, 1, 1, 7, 8, 206, 'L', '21011015', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(210, 1, 1, 7, 8, 211, 'L', '21011020', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(211, 1, 1, 7, 8, 219, 'L', '21011028', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(212, 1, 1, 7, 8, 221, 'P', '21021030', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(213, 1, 1, 7, 8, 224, 'P', '21021033', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(214, 1, 1, 7, 8, 225, 'L', '21011034', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(215, 1, 1, 7, 8, 226, 'L', '21011035', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(216, 1, 1, 7, 8, 227, 'P', '21021036', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(217, 1, 1, 7, 8, 235, 'L', '21011044', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(218, 1, 1, 7, 8, 238, 'L', '21011047', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(219, 1, 1, 7, 8, 243, 'L', '21011052', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(220, 1, 1, 7, 8, 251, 'P', '21021060', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(221, 1, 1, 7, 8, 256, 'L', '21011065', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(222, 1, 1, 7, 8, 270, 'L', '21011079', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(223, 1, 1, 7, 8, 276, 'L', '21011085', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(224, 1, 1, 7, 8, 281, 'P', '21021090', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(225, 1, 1, 7, 8, 284, 'P', '21021093', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(226, 1, 1, 7, 8, 289, 'L', '21011098', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(227, 1, 1, 7, 8, 292, 'P', '21021101', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(228, 1, 1, 7, 8, 298, 'P', '21021107', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(229, 1, 1, 7, 8, 299, 'P', '21021108', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(230, 1, 1, 7, 8, 300, 'L', '21011109', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(231, 1, 1, 7, 8, 303, 'L', '21011112', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(232, 1, 1, 7, 8, 304, 'P', '21021113', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(233, 1, 1, 7, 8, 306, 'P', '21021115', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(234, 1, 1, 7, 8, 309, 'P', '21021118', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(235, 1, 1, 7, 9, 210, 'P', '21021019', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(236, 1, 1, 7, 9, 213, 'L', '21011022', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(237, 1, 1, 7, 9, 216, 'P', '21021025', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(238, 1, 1, 7, 9, 220, 'P', '21021029', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(239, 1, 1, 7, 9, 228, 'L', '21011037', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(240, 1, 1, 7, 9, 229, 'L', '21011038', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(241, 1, 1, 7, 9, 239, 'L', '21011048', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(242, 1, 1, 7, 9, 240, 'P', '21021049', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(243, 1, 1, 7, 9, 242, 'P', '21021051', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(244, 1, 1, 7, 9, 245, 'P', '21021054', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(245, 1, 1, 7, 9, 246, 'P', '21021055', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(246, 1, 1, 7, 9, 249, 'P', '21021058', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(247, 1, 1, 7, 9, 250, 'P', '21021059', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(248, 1, 1, 7, 9, 257, 'L', '21011066', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(249, 1, 1, 7, 9, 259, 'L', '21011068', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(250, 1, 1, 7, 9, 260, 'L', '21011069', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(251, 1, 1, 7, 9, 262, 'L', '21011071', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(252, 1, 1, 7, 9, 263, 'L', '21011072', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(253, 1, 1, 7, 9, 266, 'P', '21021075', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(254, 1, 1, 7, 9, 267, 'P', '21021076', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(255, 1, 1, 7, 9, 277, 'L', '21011086', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(256, 1, 1, 7, 9, 279, 'L', '21011088', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(257, 1, 1, 7, 9, 282, 'L', '21011091', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(258, 1, 1, 7, 9, 286, 'L', '21011095', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(259, 1, 1, 7, 9, 288, 'P', '21021097', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(260, 1, 1, 7, 9, 293, 'P', '21021102', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(261, 1, 1, 7, 9, 302, 'P', '21021111', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(262, 1, 1, 7, 9, 308, 'P', '21021117', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(263, 1, 1, 7, 10, 200, 'L', '21011009', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(264, 1, 1, 7, 10, 201, 'L', '21011010', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(265, 1, 1, 7, 10, 203, 'L', '21011012', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(266, 1, 1, 7, 10, 204, 'L', '21011013', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(267, 1, 1, 7, 10, 205, 'L', '21011014', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(268, 1, 1, 7, 10, 209, 'P', '21021018', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(269, 1, 1, 7, 10, 212, 'L', '21011021', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(270, 1, 1, 7, 10, 215, 'P', '21021024', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(271, 1, 1, 7, 10, 223, 'L', '21011032', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(272, 1, 1, 7, 10, 230, 'L', '21011039', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(273, 1, 1, 7, 10, 232, 'P', '21021041', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(274, 1, 1, 7, 10, 233, 'L', '21011042', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(275, 1, 1, 7, 10, 234, 'P', '21021043', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(276, 1, 1, 7, 10, 244, 'L', '21011053', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(277, 1, 1, 7, 10, 247, 'L', '21011056', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(278, 1, 1, 7, 10, 254, '', '21011063', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(279, 1, 1, 7, 10, 261, 'P', '21021070', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(280, 1, 1, 7, 10, 265, 'P', '21021074', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(281, 1, 1, 7, 10, 269, 'P', '21021078', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(282, 1, 1, 7, 10, 274, 'L', '21011083', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(283, 1, 1, 7, 10, 285, 'P', '21021094', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(284, 1, 1, 7, 10, 290, 'L', '21011099', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(285, 1, 1, 7, 10, 291, 'P', '21021100', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(286, 1, 1, 7, 10, 295, 'P', '21021104', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(287, 1, 1, 7, 10, 297, 'P', '21021106', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(288, 1, 1, 7, 10, 301, 'L', '21011110', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(289, 1, 1, 7, 10, 305, 'P', '21021114', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(290, 1, 1, 7, 10, 307, 'L', '21011116', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(291, 1, 1, 7, 8, 311, 'P', '21020434', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(292, 1, 1, 7, 10, 312, 'P', '21020435', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(293, 1, 1, 8, 5, 173, 'L', '20010982', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(294, 1, 1, 8, 4, 313, 'L', '22010436', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(295, 1, 1, 8, 5, 314, 'L', '22010437', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(296, 1, 1, 8, 6, 315, 'L', '22010438', 7, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(298, 1, 1, 8, 14, 313, '', '22010436', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(299, 1, 1, 9, 11, 95, 'L', '20010904', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(300, 1, 1, 9, 11, 96, 'L', '20010905', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(301, 1, 1, 9, 11, 100, 'L', '20010909', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(302, 1, 1, 9, 11, 103, 'L', '20010912', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(303, 1, 1, 9, 11, 108, 'L', '20010917', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(304, 1, 1, 9, 11, 109, 'P', '20020918', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(305, 1, 1, 9, 11, 110, 'L', '20010919', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(306, 1, 1, 9, 11, 117, 'P', '20020926', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(307, 1, 1, 9, 11, 118, 'P', '20020927', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(308, 1, 1, 9, 11, 120, 'P', '20020929', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(309, 1, 1, 9, 11, 121, 'P', '20020930', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(310, 1, 1, 9, 11, 126, 'P', '20020935', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(311, 1, 1, 9, 11, 130, 'L', '20010939', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(312, 1, 1, 9, 11, 131, 'P', '20020940', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(313, 1, 1, 9, 11, 134, 'L', '20010943', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(314, 1, 1, 9, 11, 138, 'P', '20020947', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(315, 1, 1, 9, 11, 140, 'P', '20020949', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(316, 1, 1, 9, 11, 142, 'L', '20010951', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(317, 1, 1, 9, 11, 143, 'L', '20010952', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(318, 1, 1, 9, 11, 149, 'L', '20010958', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(319, 1, 1, 9, 11, 150, 'L', '20010959', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(320, 1, 1, 9, 11, 152, 'L', '20010961', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(321, 1, 1, 9, 11, 156, 'L', '20010965', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(322, 1, 1, 9, 11, 159, 'L', '20010968', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(323, 1, 1, 9, 11, 161, 'P', '20020970', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(324, 1, 1, 9, 11, 168, 'L', '20010977', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(325, 1, 1, 9, 11, 175, 'P', '20020984', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(326, 1, 1, 9, 11, 178, 'P', '20020987', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(327, 1, 1, 9, 11, 181, 'L', '20010990', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(328, 1, 1, 9, 11, 184, 'P', '20020993', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(329, 1, 1, 9, 11, 192, 'P', '20021001', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(330, 1, 1, 9, 11, 195, 'L', '20011004', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(331, 1, 1, 9, 12, 94, 'L', '20010903', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(332, 1, 1, 9, 12, 97, 'L', '20010906', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(333, 1, 1, 9, 12, 104, 'P', '20020913', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(334, 1, 1, 9, 12, 105, 'L', '20010914', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(335, 1, 1, 9, 12, 107, 'P', '20020916', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(336, 1, 1, 9, 12, 111, 'L', '20010920', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(337, 1, 1, 9, 12, 122, 'P', '20020931', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(338, 1, 1, 9, 12, 127, 'P', '20020936', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(339, 1, 1, 9, 12, 129, 'L', '20010938', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(340, 1, 1, 9, 12, 132, 'L', '20010941', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(341, 1, 1, 9, 12, 133, 'L', '20010942', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(342, 1, 1, 9, 12, 136, 'P', '20020945', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(343, 1, 1, 9, 12, 137, 'L', '20010946', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(344, 1, 1, 9, 12, 144, 'P', '20020953', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(345, 1, 1, 9, 12, 145, 'P', '20020954', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(346, 1, 1, 9, 12, 147, 'P', '20020956', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(347, 1, 1, 9, 12, 151, 'L', '20010960', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(348, 1, 1, 9, 12, 153, 'L', '20010962', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(349, 1, 1, 9, 12, 158, 'L', '20010967', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(350, 1, 1, 9, 12, 163, 'P', '20020972', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(351, 1, 1, 9, 12, 165, 'P', '20020974', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(352, 1, 1, 9, 12, 167, 'P', '20020976', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(353, 1, 1, 9, 12, 170, 'L', '20010979', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(354, 1, 1, 9, 12, 171, 'L', '20010980', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(355, 1, 1, 9, 12, 173, 'L', '20010982', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(356, 1, 1, 9, 12, 174, 'P', '20020983', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(357, 1, 1, 9, 12, 177, 'L', '20010986', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(358, 1, 1, 9, 12, 179, 'P', '20020988', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(359, 1, 1, 9, 12, 180, 'P', '20020989', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(360, 1, 1, 9, 12, 183, 'L', '20010992', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(361, 1, 1, 9, 12, 186, 'P', '20020995', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(362, 1, 1, 9, 12, 189, 'L', '20010998', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(363, 1, 1, 9, 12, 191, 'P', '20021000', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(364, 1, 1, 9, 12, 197, 'P', '20021006', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(365, 1, 1, 9, 12, 314, 'L', '22010437', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(366, 1, 1, 9, 13, 98, 'L', '20010907', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(367, 1, 1, 9, 13, 99, 'L', '20010908', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(368, 1, 1, 9, 13, 101, 'L', '20010910', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(369, 1, 1, 9, 13, 102, 'P', '20020911', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(370, 1, 1, 9, 13, 106, 'P', '20020915', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(371, 1, 1, 9, 13, 112, 'L', '20010921', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(372, 1, 1, 9, 13, 113, 'L', '20010922', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(373, 1, 1, 9, 13, 114, 'P', '20020923', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(374, 1, 1, 9, 13, 115, 'L', '20010924', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(375, 1, 1, 9, 13, 116, 'L', '20010925', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(376, 1, 1, 9, 13, 119, 'L', '20010928', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(377, 1, 1, 9, 13, 123, 'P', '20020932', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(378, 1, 1, 9, 13, 124, 'P', '20020933', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(379, 1, 1, 9, 13, 125, 'P', '20020934', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(380, 1, 1, 9, 13, 128, 'P', '20020937', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(381, 1, 1, 9, 13, 135, 'L', '20010944', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(382, 1, 1, 9, 13, 139, 'L', '20010948', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(383, 1, 1, 9, 13, 141, 'P', '20020950', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(384, 1, 1, 9, 13, 146, 'P', '20020955', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(385, 1, 1, 9, 13, 148, 'P', '20020957', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(386, 1, 1, 9, 13, 154, 'L', '20010963', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(387, 1, 1, 9, 13, 155, 'L', '20010964', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(388, 1, 1, 9, 13, 157, 'L', '20010966', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(389, 1, 1, 9, 13, 160, 'L', '20010969', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(390, 1, 1, 9, 13, 162, 'P', '20020971', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(391, 1, 1, 9, 13, 164, 'P', '20020973', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(392, 1, 1, 9, 13, 166, 'P', '20020975', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(393, 1, 1, 9, 13, 169, 'P', '20020978', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(394, 1, 1, 9, 13, 176, 'L', '20010985', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(395, 1, 1, 9, 13, 185, 'P', '20020994', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(396, 1, 1, 9, 13, 187, 'P', '20020996', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(397, 1, 1, 9, 13, 188, 'L', '20010997', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(398, 1, 1, 9, 13, 193, 'P', '20021002', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(399, 1, 1, 9, 13, 194, 'L', '20011003', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(400, 1, 1, 9, 13, 196, 'P', '20021005', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(401, 1, 1, 9, 13, 315, 'L', '22010438', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(403, 1, 1, 7, 18, 280, 'L', '21011089', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(404, 1, 1, 8, 14, 199, 'L', '21011008', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(405, 1, 1, 8, 14, 207, 'P', '21021016', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(406, 1, 1, 8, 14, 208, 'P', '21021017', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(407, 1, 1, 8, 14, 217, 'L', '21011026', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(408, 1, 1, 8, 14, 218, 'P', '21021027', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(409, 1, 1, 8, 14, 222, 'L', '21011031', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(410, 1, 1, 8, 14, 231, 'L', '21011040', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(411, 1, 1, 8, 14, 236, 'L', '21011045', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(412, 1, 1, 8, 14, 237, 'L', '21011046', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(413, 1, 1, 8, 14, 241, 'L', '21011050', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(414, 1, 1, 8, 14, 248, 'P', '21021057', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(415, 1, 1, 8, 14, 252, 'L', '21011061', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(416, 1, 1, 8, 14, 253, 'P', '21021062', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(417, 1, 1, 8, 14, 255, 'L', '21011064', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(418, 1, 1, 8, 14, 258, 'L', '21011067', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(419, 1, 1, 8, 14, 264, 'P', '21021073', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(420, 1, 1, 8, 14, 268, 'P', '21021077', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(421, 1, 1, 8, 14, 271, 'P', '21021080', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(422, 1, 1, 8, 14, 272, 'P', '21021081', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(423, 1, 1, 8, 14, 275, 'P', '21021084', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(424, 1, 1, 8, 14, 278, 'L', '21011087', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(425, 1, 1, 8, 14, 283, 'P', '21021092', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(426, 1, 1, 8, 14, 287, '', '21011096', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(427, 1, 1, 8, 14, 294, 'P', '21021103', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(428, 1, 1, 8, 14, 296, 'P', '21021105', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(429, 1, 1, 8, 14, 310, 'P', '21021119', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(430, 1, 1, 8, 15, 198, 'L', '21011007', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(431, 1, 1, 8, 15, 202, 'P', '21021011', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(432, 1, 1, 8, 15, 206, 'L', '21011015', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(433, 1, 1, 8, 15, 211, 'L', '21011020', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(434, 1, 1, 8, 15, 219, 'L', '21011028', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(435, 1, 1, 8, 15, 221, 'P', '21021030', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(436, 1, 1, 8, 15, 224, 'P', '21021033', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(437, 1, 1, 8, 15, 225, 'L', '21011034', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(438, 1, 1, 8, 15, 226, 'L', '21011035', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(439, 1, 1, 8, 15, 227, 'P', '21021036', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(440, 1, 1, 8, 15, 235, 'L', '21011044', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(441, 1, 1, 8, 15, 238, 'L', '21011047', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(442, 1, 1, 8, 15, 243, 'L', '21011052', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(443, 1, 1, 8, 15, 251, 'P', '21021060', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(444, 1, 1, 8, 15, 256, 'L', '21011065', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(445, 1, 1, 8, 15, 270, 'L', '21011079', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(446, 1, 1, 8, 15, 276, 'L', '21011085', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(447, 1, 1, 8, 15, 281, 'P', '21021090', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(448, 1, 1, 8, 15, 284, 'P', '21021093', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(449, 1, 1, 8, 15, 289, 'L', '21011098', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(450, 1, 1, 8, 15, 298, 'P', '21021107', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(451, 1, 1, 8, 15, 299, 'P', '21021108', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(452, 1, 1, 8, 15, 300, 'L', '21011109', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(453, 1, 1, 8, 15, 303, 'L', '21011112', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(454, 1, 1, 8, 15, 304, 'P', '21021113', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(455, 1, 1, 8, 15, 306, 'P', '21021115', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(456, 1, 1, 8, 15, 309, 'P', '21021118', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(457, 1, 1, 8, 15, 311, 'P', '21020434', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(459, 1, 1, 7, 20, 213, 'L', '21011022', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(460, 1, 1, 8, 16, 210, 'P', '21021019', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(461, 1, 1, 8, 16, 216, 'P', '21021025', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(462, 1, 1, 8, 16, 220, 'P', '21021029', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(463, 1, 1, 8, 16, 228, 'L', '21011037', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(464, 1, 1, 8, 16, 229, 'L', '21011038', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(465, 1, 1, 8, 16, 239, 'L', '21011048', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(466, 1, 1, 8, 16, 240, 'P', '21021049', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(467, 1, 1, 8, 16, 242, 'P', '21021051', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(468, 1, 1, 8, 16, 245, 'P', '21021054', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(469, 1, 1, 8, 16, 249, 'P', '21021058', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(470, 1, 1, 8, 16, 250, 'P', '21021059', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(471, 1, 1, 8, 16, 257, 'L', '21011066', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(472, 1, 1, 8, 16, 259, 'L', '21011068', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(473, 1, 1, 8, 16, 260, 'L', '21011069', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(474, 1, 1, 8, 16, 262, 'L', '21011071', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(475, 1, 1, 8, 16, 263, 'L', '21011072', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(476, 1, 1, 8, 16, 266, 'P', '21021075', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(477, 1, 1, 8, 16, 267, 'P', '21021076', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(478, 1, 1, 8, 16, 277, 'L', '21011086', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(479, 1, 1, 8, 16, 279, 'L', '21011088', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(480, 1, 1, 8, 16, 282, 'L', '21011091', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(481, 1, 1, 8, 16, 288, 'P', '21021097', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(482, 1, 1, 8, 16, 293, 'P', '21021102', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(483, 1, 1, 8, 16, 302, 'P', '21021111', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(484, 1, 1, 8, 16, 308, 'P', '21021117', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(486, 1, 1, 7, 21, 233, 'L', '21011042', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(487, 1, 1, 8, 17, 201, 'L', '21011010', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(488, 1, 1, 8, 17, 204, 'L', '21011013', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(489, 1, 1, 8, 17, 209, 'P', '21021018', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(490, 1, 1, 8, 17, 212, 'L', '21011021', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(491, 1, 1, 8, 17, 215, 'P', '21021024', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(492, 1, 1, 8, 17, 223, 'L', '21011032', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(493, 1, 1, 8, 17, 230, 'L', '21011039', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(494, 1, 1, 8, 17, 232, 'P', '21021041', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(495, 1, 1, 8, 17, 234, 'P', '21021043', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(496, 1, 1, 8, 17, 244, 'L', '21011053', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(497, 1, 1, 8, 17, 247, 'L', '21011056', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(498, 1, 1, 8, 17, 261, 'P', '21021070', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(499, 1, 1, 8, 17, 265, 'P', '21021074', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(500, 1, 1, 8, 17, 269, 'P', '21021078', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(501, 1, 1, 8, 17, 274, 'L', '21011083', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(502, 1, 1, 8, 17, 285, 'P', '21021094', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(503, 1, 1, 8, 17, 291, 'P', '21021100', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(504, 1, 1, 8, 17, 295, 'P', '21021104', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(505, 1, 1, 8, 17, 297, 'P', '21021106', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(506, 1, 1, 8, 17, 301, 'L', '21011110', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(507, 1, 1, 8, 17, 305, 'P', '21021114', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(508, 1, 1, 8, 17, 307, 'L', '21011116', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(509, 1, 1, 8, 17, 312, 'P', '21020435', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(510, 1, 1, 7, 20, 326, 'P', '22020449', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(511, 1, 1, 7, 20, 334, 'L', '22010457', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(512, 1, 1, 7, 20, 336, 'P', '22020459', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(513, 1, 1, 7, 20, 338, 'L', '22010461', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(514, 1, 1, 7, 20, 339, 'L', '22010462', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(515, 1, 1, 7, 20, 341, 'L', '22010464', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(516, 1, 1, 7, 20, 345, 'L', '22010468', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(517, 1, 1, 7, 20, 347, 'L', '22010470', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(518, 1, 1, 7, 20, 348, 'P', '22020471', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(519, 1, 1, 7, 20, 352, 'L', '22010475', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(520, 1, 1, 7, 20, 353, 'P', '22020476', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(521, 1, 1, 7, 20, 354, 'P', '22020477', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(522, 1, 1, 7, 20, 359, 'L', '22010482', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(523, 1, 1, 7, 20, 360, 'L', '22010483', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(524, 1, 1, 7, 20, 361, 'L', '22010484', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(525, 1, 1, 7, 20, 379, 'P', '22020502', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(526, 1, 1, 7, 20, 382, 'P', '22020505', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(527, 1, 1, 7, 20, 385, 'P', '22020508', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(528, 1, 1, 7, 20, 386, 'P', '22020509', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(529, 1, 1, 7, 20, 387, 'L', '22010510', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(530, 1, 1, 7, 20, 392, 'P', '22020515', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(531, 1, 1, 7, 20, 393, 'L', '22010516', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(532, 1, 1, 7, 20, 394, 'L', '22010517', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(533, 1, 1, 7, 20, 395, 'P', '22020518', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(534, 1, 1, 7, 19, 316, 'L', '22010439', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(535, 1, 1, 7, 19, 320, 'L', '22010443', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31');
INSERT INTO `siswa_kelas` (`id_siswa_kelas`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_kelas`, `id_siswa`, `kelamin`, `nis`, `tapel`, `tgl_gabung`, `created_at`, `updated_at`) VALUES
(536, 1, 1, 7, 19, 323, 'L', '22010446', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(537, 1, 1, 7, 19, 324, 'P', '22020447', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(538, 1, 1, 7, 19, 325, 'L', '22010448', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(539, 1, 1, 7, 19, 329, 'L', '22010452', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(540, 1, 1, 7, 19, 331, 'P', '22020454', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(541, 1, 1, 7, 19, 332, 'P', '22020455', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(542, 1, 1, 7, 19, 333, 'L', '22010456', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(543, 1, 1, 7, 19, 337, 'L', '22010460', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(544, 1, 1, 7, 19, 343, 'P', '22020466', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(545, 1, 1, 7, 19, 344, 'P', '22020467', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(546, 1, 1, 7, 19, 349, 'L', '22010472', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(547, 1, 1, 7, 19, 356, 'L', '22010479', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(548, 1, 1, 7, 19, 362, 'P', '22020485', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(549, 1, 1, 7, 19, 368, 'P', '22020491', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(550, 1, 1, 7, 19, 371, 'L', '22010494', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(551, 1, 1, 7, 19, 372, 'L', '22010495', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(552, 1, 1, 7, 19, 373, 'L', '22010496', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(553, 1, 1, 7, 19, 374, 'L', '22010497', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(554, 1, 1, 7, 19, 375, 'L', '22010498', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(555, 1, 1, 7, 19, 380, 'L', '22010503', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(556, 1, 1, 7, 19, 383, 'P', '22020506', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(557, 1, 1, 7, 19, 384, 'P', '22020507', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(558, 1, 1, 7, 19, 389, 'P', '22020512', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(559, 1, 1, 7, 18, 317, 'L', '22010440', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(560, 1, 1, 7, 18, 318, 'L', '22010441', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(561, 1, 1, 7, 18, 319, 'L', '22010442', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(562, 1, 1, 7, 18, 321, 'L', '22010444', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(563, 1, 1, 7, 18, 322, 'P', '22020445', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(564, 1, 1, 7, 18, 327, 'P', '22020450', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(565, 1, 1, 7, 18, 328, 'P', '22020451', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(566, 1, 1, 7, 18, 330, 'L', '22010453', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(567, 1, 1, 7, 18, 335, 'P', '22020458', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(568, 1, 1, 7, 18, 340, 'P', '22020463', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(569, 1, 1, 7, 18, 342, 'L', '22010465', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(570, 1, 1, 7, 18, 346, 'L', '22010469', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(571, 1, 1, 7, 18, 350, 'L', '22010473', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(572, 1, 1, 7, 18, 351, 'P', '22020474', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(573, 1, 1, 7, 18, 355, 'P', '22020478', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(574, 1, 1, 7, 18, 357, 'L', '22010480', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(575, 1, 1, 7, 18, 358, 'L', '22010481', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(576, 1, 1, 7, 18, 363, 'P', '22020486', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(577, 1, 1, 7, 18, 364, 'L', '22010487', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(578, 1, 1, 7, 18, 365, 'P', '22020488', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(579, 1, 1, 7, 18, 366, 'P', '22020489', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(580, 1, 1, 7, 18, 367, 'P', '22020490', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(581, 1, 1, 7, 18, 369, 'L', '22010492', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(582, 1, 1, 7, 18, 370, 'L', '22010493', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(583, 1, 1, 7, 18, 376, 'L', '22010499', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(584, 1, 1, 7, 18, 377, 'P', '22020500', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(585, 1, 1, 7, 18, 378, 'P', '22020501', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(586, 1, 1, 7, 18, 381, 'P', '22020504', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(587, 1, 1, 7, 18, 388, 'P', '22020511', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(588, 1, 1, 7, 18, 390, 'P', '22020513', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(589, 1, 1, 7, 18, 391, 'P', '22020514', 8, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(590, 1, 1, 9, 22, 199, 'L', '21011008', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(591, 1, 1, 9, 22, 207, 'P', '21021016', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(592, 1, 1, 9, 22, 208, 'P', '21021017', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(593, 1, 1, 9, 22, 217, 'L', '21011026', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(594, 1, 1, 9, 22, 218, 'P', '21021027', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(595, 1, 1, 9, 22, 222, 'L', '21011031', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(596, 1, 1, 9, 22, 231, 'L', '21011040', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(597, 1, 1, 9, 22, 236, 'L', '21011045', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(598, 1, 1, 9, 22, 237, 'L', '21011046', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(599, 1, 1, 9, 22, 241, 'L', '21011050', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(600, 1, 1, 9, 22, 248, 'P', '21021057', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(601, 1, 1, 9, 22, 252, 'L', '21011061', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(602, 1, 1, 9, 22, 253, 'P', '21021062', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(603, 1, 1, 9, 22, 255, 'L', '21011064', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(604, 1, 1, 9, 22, 258, 'L', '21011067', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(605, 1, 1, 9, 22, 264, 'P', '21021073', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(606, 1, 1, 9, 22, 268, 'P', '21021077', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(607, 1, 1, 9, 22, 271, 'P', '21021080', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(608, 1, 1, 9, 22, 272, 'P', '21021081', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(609, 1, 1, 9, 22, 275, 'P', '21021084', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(610, 1, 1, 9, 22, 278, 'L', '21011087', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(611, 1, 1, 9, 22, 283, 'P', '21021092', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(612, 1, 1, 9, 22, 294, 'P', '21021103', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(613, 1, 1, 9, 22, 296, 'P', '21021105', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(614, 1, 1, 9, 22, 310, 'P', '21021119', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(615, 1, 1, 9, 22, 201, 'L', '21011010', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(616, 1, 1, 9, 22, 209, 'P', '21021018', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(617, 1, 1, 9, 22, 212, 'L', '21011021', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(618, 1, 1, 9, 22, 265, 'P', '21021074', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(619, 1, 1, 9, 22, 269, 'P', '21021078', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(620, 1, 1, 9, 22, 301, 'L', '21011110', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(621, 1, 1, 9, 22, 305, 'P', '21021114', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(622, 1, 1, 9, 23, 198, 'L', '21011007', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(623, 1, 1, 9, 23, 202, 'P', '21021011', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(624, 1, 1, 9, 23, 211, 'L', '21011020', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(625, 1, 1, 9, 23, 219, 'L', '21011028', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(626, 1, 1, 9, 23, 221, 'P', '21021030', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(627, 1, 1, 9, 23, 224, 'P', '21021033', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(628, 1, 1, 9, 23, 225, 'L', '21011034', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(629, 1, 1, 9, 23, 226, 'L', '21011035', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(630, 1, 1, 9, 23, 227, 'P', '21021036', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(631, 1, 1, 9, 23, 235, 'L', '21011044', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(632, 1, 1, 9, 23, 238, 'L', '21011047', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(633, 1, 1, 9, 23, 243, 'L', '21011052', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(634, 1, 1, 9, 23, 251, 'P', '21021060', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(635, 1, 1, 9, 23, 256, 'L', '21011065', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(636, 1, 1, 9, 23, 270, 'L', '21011079', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(637, 1, 1, 9, 23, 276, 'L', '21011085', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(638, 1, 1, 9, 23, 281, 'P', '21021090', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(639, 1, 1, 9, 23, 284, 'P', '21021093', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(640, 1, 1, 9, 23, 289, 'L', '21011098', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(641, 1, 1, 9, 23, 298, 'P', '21021107', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(642, 1, 1, 9, 23, 299, 'P', '21021108', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(643, 1, 1, 9, 23, 300, 'L', '21011109', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(644, 1, 1, 9, 23, 303, 'L', '21011112', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(645, 1, 1, 9, 23, 304, 'P', '21021113', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(646, 1, 1, 9, 23, 306, 'P', '21021115', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(647, 1, 1, 9, 23, 309, 'P', '21021118', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(648, 1, 1, 9, 23, 311, 'P', '21020434', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(649, 1, 1, 9, 23, 261, 'P', '21021070', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(650, 1, 1, 9, 23, 285, 'P', '21021094', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(651, 1, 1, 9, 23, 312, 'P', '21020435', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(652, 1, 1, 9, 23, 307, 'L', '21011116', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(653, 1, 1, 9, 24, 210, 'P', '21021019', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(654, 1, 1, 9, 24, 216, 'P', '21021025', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(655, 1, 1, 9, 24, 220, 'P', '21021029', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(656, 1, 1, 9, 24, 228, 'L', '21011037', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(657, 1, 1, 9, 24, 229, 'L', '21011038', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(658, 1, 1, 9, 24, 239, 'L', '21011048', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(659, 1, 1, 9, 24, 240, 'P', '21021049', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(660, 1, 1, 9, 24, 242, 'P', '21021051', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(661, 1, 1, 9, 24, 245, 'P', '21021054', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(662, 1, 1, 9, 24, 249, 'P', '21021058', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(663, 1, 1, 9, 24, 250, 'P', '21021059', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(664, 1, 1, 9, 24, 257, 'L', '21011066', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(665, 1, 1, 9, 24, 259, 'L', '21011068', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(666, 1, 1, 9, 24, 260, 'L', '21011069', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(667, 1, 1, 9, 24, 263, 'L', '21011072', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(668, 1, 1, 9, 24, 266, 'P', '21021075', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(669, 1, 1, 9, 24, 267, 'P', '21021076', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(670, 1, 1, 9, 24, 277, 'L', '21011086', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(671, 1, 1, 9, 24, 288, 'P', '21021097', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(672, 1, 1, 9, 24, 293, 'P', '21021102', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(673, 1, 1, 9, 24, 302, 'P', '21021111', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(674, 1, 1, 9, 24, 204, 'L', '21011013', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(675, 1, 1, 9, 24, 215, 'P', '21021024', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(676, 1, 1, 9, 24, 223, 'L', '21011032', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(677, 1, 1, 9, 24, 234, 'P', '21021043', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(678, 1, 1, 9, 24, 244, 'L', '21011053', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(679, 1, 1, 9, 24, 291, 'P', '21021100', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(680, 1, 1, 9, 24, 295, 'P', '21021104', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(681, 1, 1, 9, 24, 396, 'P', '22021205', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(682, 1, 1, 9, 24, 397, 'P', '22021206', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(683, 1, 1, 9, 24, 400, 'P', '22021209', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(684, 1, 1, 9, 23, 398, 'P', '22021207', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(685, 1, 1, 9, 23, 399, 'P', '22021208', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(686, 1, 1, 8, 25, 317, 'L', '22010440', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(687, 1, 1, 8, 25, 318, 'L', '22010441', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(688, 1, 1, 8, 25, 319, 'L', '22010442', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(689, 1, 1, 8, 25, 321, 'L', '22010444', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(690, 1, 1, 8, 25, 322, 'P', '22020445', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(691, 1, 1, 8, 25, 327, 'P', '22020450', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(692, 1, 1, 8, 25, 328, 'P', '22020451', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(693, 1, 1, 8, 25, 335, 'P', '22020458', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(694, 1, 1, 8, 25, 340, 'P', '22020463', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(695, 1, 1, 8, 25, 342, 'L', '22010465', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(696, 1, 1, 8, 25, 346, 'L', '22010469', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(697, 1, 1, 8, 25, 350, 'L', '22010473', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(698, 1, 1, 8, 25, 351, 'P', '22020474', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(699, 1, 1, 8, 25, 355, 'P', '22020478', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(700, 1, 1, 8, 25, 357, 'L', '22010480', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(701, 1, 1, 8, 25, 358, 'L', '22010481', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(702, 1, 1, 8, 25, 363, 'P', '22020486', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(703, 1, 1, 8, 25, 364, 'L', '22010487', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(704, 1, 1, 8, 25, 365, 'P', '22020488', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(705, 1, 1, 8, 25, 366, 'P', '22020489', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(706, 1, 1, 8, 25, 367, 'P', '22020490', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(707, 1, 1, 8, 25, 369, 'L', '22010492', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(708, 1, 1, 8, 25, 370, 'L', '22010493', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(709, 1, 1, 8, 25, 376, 'L', '22010499', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(710, 1, 1, 8, 25, 377, 'P', '22020500', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(711, 1, 1, 8, 25, 378, 'P', '22020501', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(712, 1, 1, 8, 25, 381, 'P', '22020504', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(713, 1, 1, 8, 25, 388, 'P', '22020511', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(714, 1, 1, 8, 25, 390, 'P', '22020513', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(715, 1, 1, 8, 26, 316, 'L', '22010439', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(716, 1, 1, 8, 26, 320, 'L', '22010443', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(717, 1, 1, 8, 26, 323, 'L', '22010446', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(718, 1, 1, 8, 26, 324, 'P', '22020447', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(719, 1, 1, 8, 26, 325, 'L', '22010448', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(720, 1, 1, 8, 26, 329, 'L', '22010452', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(721, 1, 1, 8, 26, 331, 'P', '22020454', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(722, 1, 1, 8, 26, 332, 'P', '22020455', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(723, 1, 1, 8, 26, 333, 'L', '22010456', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(724, 1, 1, 8, 26, 337, 'L', '22010460', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(725, 1, 1, 8, 26, 343, 'P', '22020466', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(726, 1, 1, 8, 26, 344, 'P', '22020467', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(727, 1, 1, 8, 26, 349, 'L', '22010472', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(728, 1, 1, 8, 26, 356, 'L', '22010479', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(729, 1, 1, 8, 26, 362, 'P', '22020485', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(730, 1, 1, 8, 26, 368, 'P', '22020491', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(731, 1, 1, 8, 26, 371, 'L', '22010494', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(732, 1, 1, 8, 26, 372, 'L', '22010495', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(733, 1, 1, 8, 26, 373, 'L', '22010496', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(734, 1, 1, 8, 26, 374, 'L', '22010497', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(735, 1, 1, 8, 26, 375, 'L', '22010498', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(736, 1, 1, 8, 26, 380, 'L', '22010503', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(737, 1, 1, 8, 26, 383, 'P', '22020506', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(738, 1, 1, 8, 26, 384, 'P', '22020507', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(739, 1, 1, 8, 26, 389, 'P', '22020512', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(740, 1, 1, 8, 27, 326, 'P', '22020449', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(741, 1, 1, 8, 27, 334, 'L', '22010457', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(742, 1, 1, 8, 27, 336, 'P', '22020459', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(743, 1, 1, 8, 27, 339, 'L', '22010462', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(744, 1, 1, 8, 27, 341, 'L', '22010464', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(745, 1, 1, 8, 27, 345, 'L', '22010468', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(746, 1, 1, 8, 27, 347, 'L', '22010470', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(747, 1, 1, 8, 27, 348, 'P', '22020471', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(748, 1, 1, 8, 27, 352, 'L', '22010475', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(749, 1, 1, 8, 27, 353, 'P', '22020476', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(750, 1, 1, 8, 27, 354, 'P', '22020477', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(751, 1, 1, 8, 27, 360, 'L', '22010483', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(752, 1, 1, 8, 27, 361, 'L', '22010484', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(753, 1, 1, 8, 27, 379, 'P', '22020502', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(754, 1, 1, 8, 27, 385, 'P', '22020508', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(755, 1, 1, 8, 27, 386, 'P', '22020509', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(756, 1, 1, 8, 27, 387, 'L', '22010510', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(757, 1, 1, 8, 27, 392, 'P', '22020515', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(758, 1, 1, 8, 27, 393, 'L', '22010516', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(759, 1, 1, 8, 27, 394, 'L', '22010517', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(760, 1, 1, 8, 27, 395, 'P', '22020518', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(761, 1, 1, 8, 27, 401, 'L', '22011210', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(762, 1, 1, 8, 27, 402, 'L', '22011211', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(763, 1, 1, 8, 26, 403, 'P', '001021212', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(764, 1, 1, 8, 26, 404, 'P', '24020414', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(765, 1, 1, 8, 26, 405, 'P', '23020415', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(766, 1, 1, 8, 26, 406, 'P', '24020416', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(767, 1, 1, 7, 28, 412, 'L', '23010422', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(768, 1, 1, 7, 28, 414, 'P', '23020424', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(769, 1, 1, 7, 28, 421, 'P', '23020431', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(770, 1, 1, 7, 28, 422, 'P', '23020432', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(771, 1, 1, 7, 28, 424, 'P', '23020434', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(772, 1, 1, 7, 28, 426, 'L', '23010436', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(773, 1, 1, 7, 28, 430, 'P', '23020440', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(774, 1, 1, 7, 28, 431, 'L', '23010441', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(775, 1, 1, 7, 28, 432, 'L', '23010442', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(776, 1, 1, 7, 28, 435, 'L', '23010445', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(777, 1, 1, 7, 28, 437, 'P', '23020447', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(778, 1, 1, 7, 28, 439, 'L', '23010449', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(779, 1, 1, 7, 28, 441, 'L', '23010451', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(780, 1, 1, 7, 28, 445, 'P', '23020455', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(781, 1, 1, 7, 28, 453, 'L', '23010463', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(782, 1, 1, 7, 28, 458, 'L', '23010468', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(783, 1, 1, 7, 28, 470, 'P', '23020480', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(784, 1, 1, 7, 28, 471, 'P', '23020481', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(785, 1, 1, 7, 28, 480, 'L', '23010490', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(786, 1, 1, 7, 28, 483, 'P', '23020493', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(787, 1, 1, 7, 28, 484, 'P', '23020494', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(788, 1, 1, 7, 28, 486, 'P', '23020496', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(789, 1, 1, 7, 28, 488, 'L', '23010498', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(790, 1, 1, 7, 28, 493, 'L', '23010503', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(791, 1, 1, 7, 28, 497, 'P', '23020507', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(792, 1, 1, 7, 28, 500, 'P', '23020510', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(793, 1, 1, 7, 28, 501, 'P', '23020511', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(794, 1, 1, 7, 28, 504, 'P', '23020514', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(795, 1, 1, 7, 28, 505, 'P', '23020515', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(796, 1, 1, 7, 28, 506, 'L', '23010516', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(797, 1, 1, 7, 28, 507, 'P', '23020517', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(798, 1, 1, 7, 28, 510, 'P', '23020520', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(799, 1, 1, 7, 29, 408, 'P', '23020418', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(800, 1, 1, 7, 29, 410, 'L', '23010420', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(801, 1, 1, 7, 29, 415, 'P', '23020425', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(802, 1, 1, 7, 29, 419, 'P', '23020429', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(803, 1, 1, 7, 29, 420, 'L', '23010430', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(804, 1, 1, 7, 29, 423, 'P', '23020433', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(805, 1, 1, 7, 29, 425, 'P', '23020435', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(806, 1, 1, 7, 29, 438, 'P', '23020448', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(807, 1, 1, 7, 29, 442, 'P', '23020452', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(808, 1, 1, 7, 29, 448, 'P', '23020458', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(809, 1, 1, 7, 29, 451, 'P', '23020461', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(810, 1, 1, 7, 29, 456, 'P', '23020466', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(811, 1, 1, 7, 29, 459, 'P', '23020469', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(812, 1, 1, 7, 29, 460, 'L', '23010470', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(813, 1, 1, 7, 29, 462, 'L', '23010472', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(814, 1, 1, 7, 29, 463, 'L', '23010473', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(815, 1, 1, 7, 29, 465, 'L', '23010475', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(816, 1, 1, 7, 29, 466, 'L', '23010476', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(817, 1, 1, 7, 29, 467, 'L', '23010477', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(818, 1, 1, 7, 29, 468, 'P', '23020478', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(819, 1, 1, 7, 29, 469, 'P', '23020479', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(820, 1, 1, 7, 29, 475, 'L', '23010485', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(821, 1, 1, 7, 29, 476, 'L', '23010486', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(822, 1, 1, 7, 29, 478, 'P', '23020488', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(823, 1, 1, 7, 29, 485, 'L', '23010495', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(824, 1, 1, 7, 29, 490, 'P', '23020500', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(825, 1, 1, 7, 29, 491, 'P', '23020501', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(826, 1, 1, 7, 29, 492, 'P', '23020502', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(827, 1, 1, 7, 29, 494, 'P', '23020504', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(828, 1, 1, 7, 29, 495, 'P', '23020505', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(829, 1, 1, 7, 29, 498, 'P', '23020508', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(830, 1, 1, 7, 29, 499, 'P', '23020509', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(831, 1, 1, 7, 29, 503, 'L', '23010513', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(832, 1, 1, 7, 29, 509, 'P', '23020519', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(833, 1, 1, 7, 29, 511, 'P', '23020521', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(834, 1, 1, 7, 29, 416, 'P', '23020426', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(835, 1, 1, 7, 30, 407, 'L', '23010417', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(836, 1, 1, 7, 30, 409, 'P', '23020419', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(837, 1, 1, 7, 30, 411, 'L', '23010421', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(838, 1, 1, 7, 30, 413, 'P', '23020423', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(839, 1, 1, 7, 30, 417, 'P', '23020427', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(840, 1, 1, 7, 30, 418, 'P', '23020428', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(841, 1, 1, 7, 30, 427, 'P', '23020437', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(842, 1, 1, 7, 30, 428, 'P', '23020438', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(843, 1, 1, 7, 30, 429, 'P', '23020439', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(844, 1, 1, 7, 30, 433, 'P', '23020443', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(845, 1, 1, 7, 30, 434, 'L', '23010444', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(846, 1, 1, 7, 30, 436, 'P', '23020446', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(847, 1, 1, 7, 28, 440, 'P', '23020450', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(848, 1, 1, 7, 30, 443, 'P', '23020453', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(849, 1, 1, 7, 30, 444, 'P', '23020454', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(850, 1, 1, 7, 30, 446, 'L', '23010456', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(851, 1, 1, 7, 30, 447, 'L', '23010457', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(852, 1, 1, 7, 30, 449, 'P', '23020459', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(853, 1, 1, 7, 30, 450, 'P', '23020460', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(854, 1, 1, 7, 30, 452, 'L', '23010462', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(855, 1, 1, 7, 30, 454, 'P', '23020464', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(856, 1, 1, 7, 30, 455, 'P', '23020465', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(857, 1, 1, 7, 30, 457, 'P', '23020467', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(858, 1, 1, 7, 30, 461, 'P', '23020471', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(859, 1, 1, 7, 30, 464, 'L', '23010474', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(860, 1, 1, 7, 30, 472, 'P', '23020482', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(861, 1, 1, 7, 30, 473, 'P', '23020483', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(862, 1, 1, 7, 30, 474, 'P', '23020484', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(863, 1, 1, 7, 30, 477, 'L', '23010487', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(864, 1, 1, 7, 30, 479, 'L', '23010489', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(865, 1, 1, 7, 30, 481, 'P', '23020491', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(866, 1, 1, 7, 30, 482, 'L', '23010492', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(867, 1, 1, 7, 30, 487, 'P', '23020497', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(868, 1, 1, 7, 30, 489, 'P', '23020499', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(869, 1, 1, 7, 30, 496, 'P', '23020506', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(870, 1, 1, 7, 30, 502, 'L', '23010512', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(871, 1, 1, 7, 30, 508, 'L', '23010518', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(874, 1, 1, 9, 31, 317, 'L', '22010440', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(875, 1, 1, 9, 31, 318, 'L', '22010441', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(876, 1, 1, 9, 31, 319, 'L', '22010442', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(877, 1, 1, 9, 31, 321, 'L', '22010444', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(878, 1, 1, 9, 31, 322, 'P', '22020445', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(879, 1, 1, 9, 33, 327, 'P', '22020450', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(880, 1, 1, 9, 31, 328, 'P', '22020451', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(881, 1, 1, 9, 31, 335, 'P', '22020458', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(882, 1, 1, 9, 31, 340, 'P', '22020463', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(883, 1, 1, 9, 31, 342, 'L', '22010465', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(884, 1, 1, 9, 31, 346, 'L', '22010469', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(885, 1, 1, 9, 31, 350, 'L', '22010473', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(886, 1, 1, 9, 31, 351, 'P', '22020474', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(887, 1, 1, 9, 31, 355, 'P', '22020478', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(888, 1, 1, 9, 31, 357, 'L', '22010480', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(889, 1, 1, 9, 31, 358, 'L', '22010481', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(890, 1, 1, 9, 31, 363, 'P', '22020486', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(891, 1, 1, 9, 31, 364, 'L', '22010487', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(892, 1, 1, 9, 31, 365, 'P', '22020488', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(893, 1, 1, 9, 33, 366, 'P', '22020489', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(894, 1, 1, 9, 31, 367, 'P', '22020490', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(895, 1, 1, 9, 31, 370, 'L', '22010493', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(896, 1, 1, 9, 31, 376, 'L', '22010499', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(897, 1, 1, 9, 31, 377, 'P', '22020500', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(898, 1, 1, 9, 31, 378, 'P', '22020501', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(899, 1, 1, 9, 33, 381, 'P', '22020504', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(900, 1, 1, 9, 31, 388, 'P', '22020511', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(901, 1, 1, 9, 31, 390, 'P', '22020513', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(902, 1, 1, 9, 32, 316, 'L', '22010439', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(903, 1, 1, 9, 32, 320, 'L', '22010443', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(904, 1, 1, 9, 32, 323, 'L', '22010446', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(905, 1, 1, 9, 32, 324, 'P', '22020447', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(906, 1, 1, 9, 32, 325, 'L', '22010448', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(907, 1, 1, 9, 32, 329, 'L', '22010452', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(908, 1, 1, 9, 32, 331, 'P', '22020454', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(909, 1, 1, 9, 32, 333, 'L', '22010456', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(910, 1, 1, 9, 32, 337, 'L', '22010460', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(911, 1, 1, 9, 32, 343, 'P', '22020466', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(912, 1, 1, 9, 32, 344, 'P', '22020467', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(913, 1, 1, 9, 32, 349, 'L', '22010472', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(915, 1, 1, 9, 32, 362, 'P', '22020485', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(916, 1, 1, 9, 32, 368, 'P', '22020491', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(917, 1, 1, 9, 32, 372, 'L', '22010495', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(918, 1, 1, 9, 32, 375, 'L', '22010498', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(919, 1, 1, 9, 32, 383, 'P', '22020506', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(920, 1, 1, 9, 32, 389, 'P', '22020512', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(921, 1, 1, 9, 32, 403, 'P', '001021212', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(922, 1, 1, 9, 32, 404, 'P', '24020414', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(923, 1, 1, 9, 32, 405, 'P', '23020415', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(924, 1, 1, 9, 32, 406, 'P', '24020416', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(925, 1, 1, 9, 33, 326, 'P', '22020449', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(926, 1, 1, 9, 33, 336, 'P', '22020459', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(927, 1, 1, 9, 33, 341, 'L', '22010464', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(928, 1, 1, 9, 33, 345, 'L', '22010468', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(929, 1, 1, 9, 33, 347, 'L', '22010470', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(930, 1, 1, 9, 33, 352, 'L', '22010475', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(931, 1, 1, 9, 33, 353, 'P', '22020476', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(932, 1, 1, 9, 33, 354, 'P', '22020477', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(933, 1, 1, 9, 33, 361, 'L', '22010484', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(934, 1, 1, 9, 33, 385, 'P', '22020508', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(935, 1, 1, 9, 33, 386, 'P', '22020509', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(936, 1, 1, 9, 33, 387, 'L', '22010510', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(937, 1, 1, 9, 33, 392, 'P', '22020515', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(938, 1, 1, 9, 33, 394, 'L', '22010517', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(939, 1, 1, 9, 33, 395, 'P', '22020518', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(940, 1, 1, 9, 33, 401, 'L', '22011210', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(941, 1, 1, 9, 33, 402, 'L', '22011211', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(942, 1, 1, 8, 34, 414, 'P', '23020424', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(943, 1, 1, 8, 34, 421, 'P', '23020431', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(944, 1, 1, 8, 34, 422, 'P', '23020432', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(945, 1, 1, 8, 34, 424, 'P', '23020434', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(946, 1, 1, 8, 34, 426, 'L', '23010436', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(947, 1, 1, 8, 34, 430, 'P', '23020440', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(948, 1, 1, 8, 34, 431, 'L', '23010441', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(949, 1, 1, 8, 34, 432, 'L', '23010442', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(950, 1, 1, 8, 34, 435, 'L', '23010445', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(951, 1, 1, 8, 34, 437, 'P', '23020447', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(952, 1, 1, 8, 34, 439, 'L', '23010449', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(953, 1, 1, 8, 34, 440, 'P', '23020450', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(954, 1, 1, 8, 34, 441, 'L', '23010451', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(955, 1, 1, 8, 34, 445, 'P', '23020455', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(956, 1, 1, 8, 34, 453, 'L', '23010463', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(957, 1, 1, 8, 34, 458, 'L', '23010468', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(958, 1, 1, 8, 34, 470, 'P', '23020480', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(959, 1, 1, 8, 34, 471, 'P', '23020481', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(960, 1, 1, 8, 34, 480, 'L', '23010490', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(961, 1, 1, 8, 34, 483, 'P', '23020493', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(962, 1, 1, 8, 34, 484, 'P', '23020494', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(963, 1, 1, 8, 34, 486, 'P', '23020496', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(964, 1, 1, 8, 34, 488, 'L', '23010498', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(965, 1, 1, 8, 34, 493, 'L', '23010503', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(966, 1, 1, 8, 34, 497, 'P', '23020507', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(967, 1, 1, 8, 34, 500, 'P', '23020510', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(968, 1, 1, 8, 34, 501, 'P', '23020511', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(969, 1, 1, 8, 34, 504, 'P', '23020514', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(970, 1, 1, 8, 34, 505, 'P', '23020515', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(971, 1, 1, 8, 34, 506, 'L', '23010516', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(972, 1, 1, 8, 34, 507, 'P', '23020517', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(973, 1, 1, 8, 34, 510, 'P', '23020520', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(974, 1, 1, 8, 35, 408, 'P', '23020418', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(975, 1, 1, 8, 35, 410, 'L', '23010420', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(976, 1, 1, 8, 35, 415, 'P', '23020425', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(977, 1, 1, 8, 35, 416, 'P', '23020426', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(978, 1, 1, 8, 35, 419, 'P', '23020429', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(979, 1, 1, 8, 35, 420, 'L', '23010430', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(980, 1, 1, 8, 35, 423, 'P', '23020433', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(981, 1, 1, 8, 35, 425, 'P', '23020435', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(982, 1, 1, 8, 35, 438, 'P', '23020448', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(983, 1, 1, 8, 35, 442, 'P', '23020452', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(984, 1, 1, 8, 35, 448, 'P', '23020458', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(985, 1, 1, 8, 35, 451, 'P', '23020461', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(986, 1, 1, 8, 35, 456, 'P', '23020466', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(987, 1, 1, 8, 35, 459, 'P', '23020469', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(988, 1, 1, 8, 35, 460, 'L', '23010470', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(989, 1, 1, 8, 35, 462, 'L', '23010472', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(990, 1, 1, 8, 35, 463, 'L', '23010473', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(991, 1, 1, 8, 35, 465, 'L', '23010475', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(992, 1, 1, 8, 35, 466, 'L', '23010476', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(993, 1, 1, 8, 35, 467, 'L', '23010477', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(994, 1, 1, 8, 35, 468, 'P', '23020478', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(995, 1, 1, 8, 35, 469, 'P', '23020479', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(996, 1, 1, 8, 35, 475, 'L', '23010485', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(997, 1, 1, 8, 35, 476, 'L', '23010486', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(998, 1, 1, 8, 35, 478, 'P', '23020488', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(999, 1, 1, 8, 35, 485, 'L', '23010495', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1000, 1, 1, 8, 35, 490, 'P', '23020500', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1001, 1, 1, 8, 35, 491, 'P', '23020501', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1002, 1, 1, 8, 35, 492, 'P', '23020502', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1003, 1, 1, 8, 35, 494, 'P', '23020504', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1004, 1, 1, 8, 35, 495, 'P', '23020505', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1005, 1, 1, 8, 35, 498, 'P', '23020508', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1006, 1, 1, 8, 35, 499, 'P', '23020509', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1007, 1, 1, 8, 35, 503, 'L', '23010513', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1008, 1, 1, 8, 35, 509, 'P', '23020519', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1009, 1, 1, 8, 35, 511, 'P', '23020521', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1010, 1, 1, 8, 36, 407, 'L', '23010417', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1011, 1, 1, 8, 36, 409, 'P', '23020419', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1012, 1, 1, 8, 36, 411, 'L', '23010421', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1013, 1, 1, 8, 36, 413, 'P', '23020423', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1014, 1, 1, 8, 36, 417, 'P', '23020427', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1015, 1, 1, 8, 36, 418, 'P', '23020428', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1016, 1, 1, 8, 36, 427, 'P', '23020437', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1017, 1, 1, 8, 36, 428, 'P', '23020438', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1018, 1, 1, 8, 36, 429, 'P', '23020439', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1019, 1, 1, 8, 36, 433, 'P', '23020443', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1020, 1, 1, 8, 36, 434, 'L', '23010444', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1021, 1, 1, 8, 36, 436, 'P', '23020446', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1022, 1, 1, 8, 36, 443, 'P', '23020453', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1023, 1, 1, 8, 36, 444, 'P', '23020454', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1024, 1, 1, 8, 36, 446, 'L', '23010456', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1025, 1, 1, 8, 36, 447, 'L', '23010457', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1026, 1, 1, 8, 36, 449, 'P', '23020459', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1027, 1, 1, 8, 36, 450, 'P', '23020460', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1028, 1, 1, 8, 36, 452, 'L', '23010462', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1029, 1, 1, 8, 36, 454, 'P', '23020464', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1030, 1, 1, 8, 36, 455, 'P', '23020465', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1031, 1, 1, 8, 36, 457, 'P', '23020467', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1032, 1, 1, 8, 36, 461, 'P', '23020471', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1033, 1, 1, 8, 36, 464, 'L', '23010474', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1034, 1, 1, 8, 36, 472, 'P', '23020482', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1035, 1, 1, 8, 36, 473, 'P', '23020483', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1036, 1, 1, 8, 36, 474, 'P', '23020484', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1037, 1, 1, 8, 36, 477, 'L', '23010487', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1038, 1, 1, 8, 36, 479, 'L', '23010489', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1039, 1, 1, 8, 36, 481, 'P', '23020491', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1040, 1, 1, 8, 36, 482, 'L', '23010492', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1041, 1, 1, 8, 36, 487, 'P', '23020497', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1042, 1, 1, 8, 36, 489, 'P', '23020499', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1043, 1, 1, 8, 36, 496, 'P', '23020506', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1044, 1, 1, 8, 36, 502, 'L', '23010512', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1045, 1, 1, 8, 36, 508, 'L', '23010518', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1046, 1, 1, 9, 33, 513, 'P', '24020523', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1047, 1, 1, 7, 30, 512, 'P', '23020522', 9, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1048, 1, 1, 7, 37, 514, 'P', '24020524', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1049, 1, 1, 7, 37, 519, 'L', '24010529', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1050, 1, 1, 7, 37, 522, 'P', '24020532', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1051, 1, 1, 7, 37, 520, 'L', '24010530', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1052, 1, 1, 7, 37, 524, 'L', '24010534', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1053, 1, 1, 7, 37, 525, 'P', '24020535', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1054, 1, 1, 7, 37, 534, 'L', '24010544', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1055, 1, 1, 7, 37, 535, 'L', '24010545', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1056, 1, 1, 7, 37, 542, 'P', '24020552', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1057, 1, 1, 7, 37, 544, 'L', '24010554', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1058, 1, 1, 7, 37, 546, 'P', '24020556', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1059, 1, 1, 7, 37, 552, 'L', '24010562', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31');
INSERT INTO `siswa_kelas` (`id_siswa_kelas`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_kelas`, `id_siswa`, `kelamin`, `nis`, `tapel`, `tgl_gabung`, `created_at`, `updated_at`) VALUES
(1060, 1, 1, 7, 37, 553, 'L', '24010563', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1061, 1, 1, 7, 37, 554, 'L', '24010564', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1062, 1, 1, 7, 37, 559, 'P', '24020569', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1063, 1, 1, 7, 37, 560, 'P', '24020570', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1064, 1, 1, 7, 37, 562, 'P', '24020572', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1065, 1, 1, 7, 37, 563, 'P', '24020573', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1066, 1, 1, 7, 37, 564, 'P', '24020574', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1067, 1, 1, 7, 37, 566, 'P', '24020576', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1068, 1, 1, 7, 37, 569, 'L', '24010579', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1069, 1, 1, 7, 37, 578, 'P', '24020588', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1070, 1, 1, 7, 37, 582, 'P', '24020592', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1071, 1, 1, 7, 37, 583, 'P', '24020593', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1072, 1, 1, 7, 37, 586, 'L', '24010596', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1073, 1, 1, 7, 37, 592, 'P', '24020602', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1074, 1, 1, 7, 37, 594, 'L', '24010604', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1075, 1, 1, 7, 37, 596, 'L', '24010606', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1076, 1, 1, 7, 38, 517, 'L', '24010527', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1077, 1, 1, 7, 38, 521, 'P', '24020531', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1078, 1, 1, 7, 38, 523, 'L', '24010533', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1079, 1, 1, 7, 38, 526, 'P', '24020536', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1080, 1, 1, 7, 38, 529, 'L', '24010539', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1081, 1, 1, 7, 38, 530, 'L', '24010540', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1082, 1, 1, 7, 38, 538, 'P', '24020548', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1083, 1, 1, 7, 38, 539, 'P', '24020549', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1084, 1, 1, 7, 38, 543, 'L', '24010553', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1085, 1, 1, 7, 38, 545, 'P', '24020555', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1086, 1, 1, 7, 38, 550, 'L', '24010560', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1087, 1, 1, 7, 38, 551, 'L', '24010561', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1088, 1, 1, 7, 38, 555, 'L', '24010565', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1089, 1, 1, 7, 38, 556, 'L', '24010566', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1090, 1, 1, 7, 38, 570, 'L', '24010580', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1091, 1, 1, 7, 38, 571, 'L', '24010581', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1092, 1, 1, 7, 38, 572, 'L', '24010582', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1093, 1, 1, 7, 38, 573, 'L', '24010583', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1094, 1, 1, 7, 38, 574, 'L', '24010584', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1095, 1, 1, 7, 38, 575, 'L', '24010585', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1096, 1, 1, 7, 38, 581, 'P', '24020591', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1097, 1, 1, 7, 38, 585, 'P', '24020595', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1098, 1, 1, 7, 38, 588, 'P', '24020598', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1099, 1, 1, 7, 38, 589, 'L', '24010599', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1100, 1, 1, 7, 38, 591, 'P', '24020601', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1101, 1, 1, 7, 38, 593, 'P', '24020603', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1102, 1, 1, 7, 38, 595, 'L', '24010605', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1103, 1, 1, 7, 39, 515, 'L', '24010525', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1104, 1, 1, 7, 39, 516, 'P', '24020526', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1105, 1, 1, 7, 39, 518, 'L', '24010528', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1106, 1, 1, 7, 39, 527, 'P', '24020537', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1107, 1, 1, 7, 39, 528, 'L', '24010538', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1108, 1, 1, 7, 39, 531, 'L', '24010541', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1109, 1, 1, 7, 39, 532, 'L', '24010542', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1110, 1, 1, 7, 39, 533, 'L', '24010543', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1111, 1, 1, 7, 39, 536, 'P', '24020546', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1112, 1, 1, 7, 39, 537, 'P', '24020547', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1113, 1, 1, 7, 39, 540, 'L', '24010550', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1114, 1, 1, 7, 39, 541, 'P', '24020551', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1115, 1, 1, 7, 39, 547, 'L', '24010557', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1116, 1, 1, 7, 39, 548, 'L', '24010558', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1117, 1, 1, 7, 39, 549, 'L', '24010559', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1118, 1, 1, 7, 39, 557, 'L', '24010567', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1119, 1, 1, 7, 39, 558, 'L', '24010568', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1120, 1, 1, 7, 39, 561, 'P', '24020571', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1121, 1, 1, 7, 39, 565, 'P', '24020575', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1122, 1, 1, 7, 39, 567, 'L', '24010577', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1123, 1, 1, 7, 39, 568, 'L', '24010578', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1124, 1, 1, 7, 39, 576, 'P', '24020586', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1125, 1, 1, 7, 39, 577, 'P', '24020587', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1126, 1, 1, 7, 39, 579, 'P', '24020589', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1127, 1, 1, 7, 39, 580, 'P', '24020590', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1128, 1, 1, 7, 39, 584, 'P', '24020594', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1129, 1, 1, 7, 39, 587, 'P', '24020597', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1130, 1, 1, 7, 39, 590, 'P', '24020600', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1131, 1, 1, 9, 33, 360, 'L', '22010483', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1132, 1, 1, 8, 35, 356, 'L', '22010479', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1133, 1, 1, 8, 34, 512, 'P', '23020522', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1134, 1, 1, 8, 34, 597, 'L', '24010607', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1135, 1, 1, 8, 34, 598, 'L', '24010608', 10, NULL, '2025-07-11 22:18:58', '2025-10-22 12:54:31'),
(1136, 1, 1, 9, 46, 414, 'P', '23020424', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1137, 1, 1, 9, 46, 421, 'P', '23020431', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1138, 1, 1, 9, 46, 422, 'P', '23020432', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1139, 1, 1, 9, 46, 424, 'P', '23020434', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1140, 1, 1, 9, 46, 426, 'L', '23010436', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1141, 1, 1, 9, 46, 430, 'P', '23020440', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1142, 1, 1, 9, 46, 431, 'L', '23010441', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1143, 1, 1, 9, 46, 435, 'L', '23010445', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1144, 1, 1, 9, 46, 437, 'P', '23020447', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1145, 1, 1, 9, 46, 439, 'L', '23010449', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1146, 1, 1, 9, 46, 440, 'P', '23020450', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1147, 1, 1, 9, 46, 445, 'P', '23020455', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1148, 1, 1, 9, 46, 453, 'L', '23010463', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1149, 1, 1, 9, 46, 458, 'L', '23010468', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1150, 1, 1, 9, 46, 470, 'P', '23020480', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1151, 1, 1, 9, 46, 471, 'P', '23020481', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1152, 1, 1, 9, 46, 483, 'P', '23020493', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1153, 1, 1, 9, 46, 484, 'P', '23020494', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1154, 1, 1, 9, 46, 486, 'P', '23020496', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1155, 1, 1, 9, 46, 493, 'L', '23010503', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1156, 1, 1, 9, 46, 497, 'P', '23020507', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1157, 1, 1, 9, 46, 500, 'P', '23020510', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1158, 1, 1, 9, 46, 501, 'P', '23020511', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1159, 1, 1, 9, 46, 504, 'P', '23020514', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1160, 1, 1, 9, 46, 505, 'P', '23020515', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1161, 1, 1, 9, 46, 506, 'L', '23010516', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1162, 1, 1, 9, 46, 507, 'P', '23020517', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1163, 1, 1, 9, 46, 510, 'P', '23020520', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1164, 1, 1, 9, 46, 512, 'P', '23020522', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1165, 1, 1, 9, 46, 597, 'L', '24010607', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1166, 1, 1, 9, 46, 598, 'L', '24010608', 11, '2025-07-11', '2025-07-12 00:36:39', '2025-10-22 12:54:31'),
(1167, 1, 1, 9, 47, 356, 'L', '22010479', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1168, 1, 1, 9, 47, 408, 'P', '23020418', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1169, 1, 1, 9, 47, 410, 'L', '23010420', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1170, 1, 1, 9, 48, 415, 'P', '23020425', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1171, 1, 1, 9, 47, 416, 'P', '23020426', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1172, 1, 1, 9, 47, 419, 'P', '23020429', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1173, 1, 1, 9, 47, 420, 'L', '23010430', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1174, 1, 1, 9, 47, 423, 'P', '23020433', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1175, 1, 1, 9, 47, 425, 'P', '23020435', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1176, 1, 1, 9, 47, 438, 'P', '23020448', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1177, 1, 1, 9, 47, 442, 'P', '23020452', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1178, 1, 1, 9, 47, 448, 'P', '23020458', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1179, 1, 1, 9, 48, 451, 'P', '23020461', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1180, 1, 1, 9, 47, 456, 'P', '23020466', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1181, 1, 1, 9, 47, 459, 'P', '23020469', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1182, 1, 1, 9, 47, 460, 'L', '23010470', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1183, 1, 1, 9, 47, 462, 'L', '23010472', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1184, 1, 1, 9, 47, 463, 'L', '23010473', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1185, 1, 1, 9, 47, 465, 'L', '23010475', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1186, 1, 1, 9, 47, 467, 'L', '23010477', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1187, 1, 1, 9, 47, 468, 'P', '23020478', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1188, 1, 1, 9, 47, 469, 'P', '23020479', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1189, 1, 1, 9, 47, 475, 'L', '23010485', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1190, 1, 1, 9, 47, 476, 'L', '23010486', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1191, 1, 1, 9, 47, 478, 'P', '23020488', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1192, 1, 1, 9, 47, 485, 'L', '23010495', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1193, 1, 1, 9, 47, 490, 'P', '23020500', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1194, 1, 1, 9, 47, 491, 'P', '23020501', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1195, 1, 1, 9, 46, 492, 'P', '23020502', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1196, 1, 1, 9, 47, 494, 'P', '23020504', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1197, 1, 1, 9, 47, 495, 'P', '23020505', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1198, 1, 1, 9, 47, 498, 'P', '23020508', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1199, 1, 1, 9, 47, 499, 'P', '23020509', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1200, 1, 1, 9, 47, 503, 'L', '23010513', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1201, 1, 1, 9, 47, 509, 'P', '23020519', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1202, 1, 1, 9, 47, 511, 'P', '23020521', 11, '2025-07-11', '2025-07-12 00:37:48', '2025-10-22 12:54:31'),
(1203, 1, 1, 9, 48, 407, 'L', '23010417', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1204, 1, 1, 9, 48, 409, 'P', '23020419', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1205, 1, 1, 9, 48, 411, 'L', '23010421', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1206, 1, 1, 9, 48, 413, 'P', '23020423', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1207, 1, 1, 9, 48, 417, 'P', '23020427', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1208, 1, 1, 9, 48, 418, 'P', '23020428', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1209, 1, 1, 9, 48, 427, 'P', '23020437', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1210, 1, 1, 9, 48, 428, 'P', '23020438', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1211, 1, 1, 9, 48, 429, 'P', '23020439', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1212, 1, 1, 9, 48, 433, 'P', '23020443', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1213, 1, 1, 9, 48, 434, 'L', '23010444', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1214, 1, 1, 9, 48, 436, 'P', '23020446', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1215, 1, 1, 9, 48, 443, 'P', '23020453', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1216, 1, 1, 9, 48, 444, 'P', '23020454', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1217, 1, 1, 9, 48, 446, 'L', '23010456', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1218, 1, 1, 9, 48, 447, 'L', '23010457', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1219, 1, 1, 9, 48, 449, 'P', '23020459', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1220, 1, 1, 9, 48, 450, 'P', '23020460', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1221, 1, 1, 9, 48, 452, 'L', '23010462', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1222, 1, 1, 9, 48, 454, 'P', '23020464', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1223, 1, 1, 9, 48, 455, 'P', '23020465', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1224, 1, 1, 9, 48, 457, 'P', '23020467', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1225, 1, 1, 9, 48, 461, 'P', '23020471', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1226, 1, 1, 9, 48, 464, 'L', '23010474', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1227, 1, 1, 9, 48, 473, 'P', '23020483', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1228, 1, 1, 9, 48, 474, 'P', '23020484', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1229, 1, 1, 9, 48, 477, 'L', '23010487', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1230, 1, 1, 9, 48, 479, 'L', '23010489', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1231, 1, 1, 9, 48, 481, 'P', '23020491', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1232, 1, 1, 9, 48, 482, 'L', '23010492', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1233, 1, 1, 9, 48, 487, 'P', '23020497', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1234, 1, 1, 9, 48, 496, 'P', '23020506', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1235, 1, 1, 9, 48, 502, 'L', '23010512', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1236, 1, 1, 9, 48, 508, 'L', '23010518', 11, '2025-07-11', '2025-07-12 00:38:03', '2025-10-22 12:54:31'),
(1237, 1, 1, 8, 43, 514, 'P', '24020524', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1238, 1, 1, 8, 43, 519, 'L', '24010529', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1239, 1, 1, 8, 43, 520, 'L', '24010530', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1240, 1, 1, 8, 43, 522, 'P', '24020532', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1241, 1, 1, 8, 43, 524, 'L', '24010534', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1242, 1, 1, 8, 43, 525, 'P', '24020535', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1243, 1, 1, 8, 43, 534, 'L', '24010544', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1244, 1, 1, 8, 43, 535, 'L', '24010545', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1245, 1, 1, 8, 43, 542, 'P', '24020552', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1246, 1, 1, 8, 43, 544, 'L', '24010554', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1247, 1, 1, 8, 43, 546, 'P', '24020556', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1248, 1, 1, 8, 43, 552, 'L', '24010562', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1249, 1, 1, 8, 43, 553, 'L', '24010563', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1250, 1, 1, 8, 43, 554, 'L', '24010564', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1251, 1, 1, 8, 43, 559, 'P', '24020569', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1252, 1, 1, 8, 43, 560, 'P', '24020570', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1253, 1, 1, 8, 43, 562, 'P', '24020572', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1254, 1, 1, 8, 43, 563, 'P', '24020573', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1255, 1, 1, 8, 43, 564, 'P', '24020574', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1256, 1, 1, 8, 43, 566, 'P', '24020576', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1257, 1, 1, 8, 43, 569, 'L', '24010579', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1258, 1, 1, 8, 43, 578, 'P', '24020588', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1259, 1, 1, 8, 43, 582, 'P', '24020592', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1260, 1, 1, 8, 43, 583, 'P', '24020593', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1261, 1, 1, 8, 43, 586, 'L', '24010596', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1262, 1, 1, 8, 43, 592, 'P', '24020602', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1263, 1, 1, 8, 43, 594, 'L', '24010604', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1264, 1, 1, 8, 43, 596, 'L', '24010606', 11, '2025-07-11', '2025-07-12 00:38:21', '2025-10-22 12:54:31'),
(1265, 1, 1, 8, 44, 517, 'L', '24010527', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1266, 1, 1, 8, 44, 521, 'P', '24020531', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1267, 1, 1, 8, 44, 523, 'L', '24010533', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1268, 1, 1, 8, 44, 526, 'P', '24020536', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1269, 1, 1, 8, 44, 529, 'L', '24010539', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1270, 1, 1, 8, 44, 530, 'L', '24010540', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1271, 1, 1, 8, 44, 538, 'P', '24020548', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1272, 1, 1, 8, 44, 539, 'P', '24020549', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1273, 1, 1, 8, 44, 543, 'L', '24010553', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1274, 1, 1, 8, 44, 545, 'P', '24020555', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1275, 1, 1, 8, 44, 550, 'L', '24010560', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1276, 1, 1, 8, 44, 551, 'L', '24010561', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1277, 1, 1, 8, 44, 555, 'L', '24010565', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1278, 1, 1, 8, 44, 556, 'L', '24010566', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1279, 1, 1, 8, 44, 570, 'L', '24010580', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1280, 1, 1, 8, 44, 571, 'L', '24010581', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1281, 1, 1, 8, 44, 572, 'L', '24010582', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1282, 1, 1, 8, 44, 573, 'L', '24010583', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1283, 1, 1, 8, 44, 574, 'L', '24010584', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1284, 1, 1, 8, 44, 575, 'L', '24010585', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1285, 1, 1, 8, 44, 581, 'P', '24020591', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1286, 1, 1, 8, 44, 585, 'P', '24020595', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1287, 1, 1, 8, 44, 588, 'P', '24020598', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1288, 1, 1, 8, 44, 589, 'L', '24010599', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1289, 1, 1, 8, 44, 591, 'P', '24020601', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1290, 1, 1, 8, 44, 593, 'P', '24020603', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1291, 1, 1, 8, 44, 595, 'L', '24010605', 11, '2025-07-11', '2025-07-12 00:38:34', '2025-10-22 12:54:31'),
(1292, 1, 1, 8, 45, 515, 'L', '24010525', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1293, 1, 1, 8, 45, 516, 'P', '24020526', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1294, 1, 1, 8, 45, 518, 'L', '24010528', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1295, 1, 1, 8, 45, 527, 'P', '24020537', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1296, 1, 1, 8, 45, 528, 'L', '24010538', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1297, 1, 1, 8, 45, 531, 'L', '24010541', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1298, 1, 1, 8, 45, 532, 'L', '24010542', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1299, 1, 1, 8, 45, 533, 'L', '24010543', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1300, 1, 1, 8, 45, 536, 'P', '24020546', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1301, 1, 1, 8, 45, 537, 'P', '24020547', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1302, 1, 1, 8, 45, 540, 'L', '24010550', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1303, 1, 1, 8, 45, 541, 'P', '24020551', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1304, 1, 1, 8, 45, 547, 'L', '24010557', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1305, 1, 1, 8, 45, 548, 'L', '24010558', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1306, 1, 1, 8, 45, 549, 'L', '24010559', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1307, 1, 1, 8, 45, 557, 'L', '24010567', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1308, 1, 1, 8, 45, 558, 'L', '24010568', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1309, 1, 1, 8, 45, 561, 'P', '24020571', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1310, 1, 1, 8, 45, 565, 'P', '24020575', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1311, 1, 1, 8, 45, 567, 'L', '24010577', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1312, 1, 1, 8, 45, 568, 'L', '24010578', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1313, 1, 1, 8, 45, 576, 'P', '24020586', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1314, 1, 1, 8, 45, 577, 'P', '24020587', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1315, 1, 1, 8, 45, 579, 'P', '24020589', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1316, 1, 1, 8, 45, 580, 'P', '24020590', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1317, 1, 1, 8, 45, 584, 'P', '24020594', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1318, 1, 1, 8, 45, 587, 'P', '24020597', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1319, 1, 1, 8, 45, 590, 'P', '24020600', 11, '2025-07-11', '2025-07-12 00:38:47', '2025-10-22 12:54:31'),
(1320, 1, 1, 7, 38, 601, 'L', '25.01.611', 10, '2025-07-28', '2025-07-28 02:24:29', '2025-10-22 12:54:31'),
(1321, 1, 1, 7, 38, 600, 'P', '25.02.610', 10, '2025-07-28', '2025-07-28 02:25:13', '2025-10-22 12:54:31'),
(1322, 1, 1, 7, 37, 599, 'P', '25.02.609', 10, '2025-07-28', '2025-07-28 02:25:13', '2025-10-22 12:54:31'),
(1323, 1, 1, 8, 43, 599, 'P', '25.02.609', 11, '2025-07-28', '2025-07-28 02:31:02', '2025-10-22 12:54:31'),
(1324, 1, 1, 8, 44, 600, 'P', '25.02.610', 11, '2025-07-28', '2025-07-28 02:31:35', '2025-10-22 12:54:31'),
(1325, 1, 1, 8, 44, 601, 'L', '25.01.611', 11, '2025-07-28', '2025-07-28 02:31:35', '2025-10-22 12:54:31'),
(1326, 1, 1, 7, 40, 603, 'P', '25022613', 11, '2025-08-26', '2025-08-26 02:30:17', '2025-10-22 12:54:31'),
(1327, 1, 1, 7, 40, 605, 'L', '25012615', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1328, 1, 1, 7, 40, 606, 'L', '25012616', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1329, 1, 1, 7, 40, 607, 'P', '25022617', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1330, 1, 1, 7, 40, 613, 'P', '25022623', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1331, 1, 1, 7, 40, 614, 'L', '25012624', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1332, 1, 1, 7, 40, 617, 'P', '25022627', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1333, 1, 1, 7, 40, 619, 'P', '25022629', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1334, 1, 1, 7, 40, 620, 'P', '25022630', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1335, 1, 1, 7, 40, 631, 'L', '25012641', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1336, 1, 1, 7, 40, 634, 'L', '25012644', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1337, 1, 1, 7, 40, 638, 'P', '25022648', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1338, 1, 1, 7, 40, 641, 'L', '25012651', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1339, 1, 1, 7, 40, 643, 'L', '25012653', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1340, 1, 1, 7, 40, 645, 'L', '25012655', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1341, 1, 1, 7, 40, 646, 'L', '25012656', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1342, 1, 1, 7, 40, 647, 'L', '25012657', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1343, 1, 1, 7, 40, 651, 'P', '25022661', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1344, 1, 1, 7, 40, 637, 'P', '25022647', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1345, 1, 1, 7, 40, 657, 'L', '25012667', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1346, 1, 1, 7, 40, 662, 'L', '25012672', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1347, 1, 1, 7, 40, 663, 'P', '25022673', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1348, 1, 1, 7, 40, 665, 'L', '25012675', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1349, 1, 1, 7, 40, 673, 'L', '25012683', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1350, 1, 1, 7, 40, 674, 'P', '25022684', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1351, 1, 1, 7, 40, 679, 'L', '25012689', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1352, 1, 1, 7, 40, 680, 'P', '25022690', 11, '2025-08-26', '2025-08-26 02:38:08', '2025-10-22 12:54:31'),
(1353, 1, 1, 7, 41, 609, 'P', '25022619', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1354, 1, 1, 7, 41, 610, 'L', '25012620', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1355, 1, 1, 7, 41, 611, 'P', '25022621', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1356, 1, 1, 7, 41, 616, 'L', '25012626', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1357, 1, 1, 7, 41, 621, 'L', '25012631', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1358, 1, 1, 7, 41, 622, 'L', '25012632', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1359, 1, 1, 7, 41, 623, 'P', '25022633', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1360, 1, 1, 7, 41, 624, 'P', '25022634', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1361, 1, 1, 7, 41, 625, 'P', '25022635', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1362, 1, 1, 7, 41, 627, 'P', '25022637', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1363, 1, 1, 7, 41, 628, 'L', '25012638', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1364, 1, 1, 7, 41, 630, 'L', '25012640', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1365, 1, 1, 7, 41, 633, 'P', '25022643', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1366, 1, 1, 7, 41, 635, 'P', '25022645', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1367, 1, 1, 7, 41, 639, 'P', '25022649', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1368, 1, 1, 7, 41, 644, 'L', '25012654', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1369, 1, 1, 7, 41, 648, 'L', '25012658', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1370, 1, 1, 7, 41, 636, 'L', '25012646', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1371, 1, 1, 7, 41, 652, 'P', '25022662', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1372, 1, 1, 7, 41, 655, 'P', '25022665', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1373, 1, 1, 7, 41, 656, 'L', '25012666', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1374, 1, 1, 7, 41, 664, 'L', '25012674', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1375, 1, 1, 7, 41, 666, 'L', '25012676', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1376, 1, 1, 7, 41, 669, 'P', '25022679', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1377, 1, 1, 7, 41, 670, 'L', '25012680', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1378, 1, 1, 7, 41, 671, 'L', '25012681', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1379, 1, 1, 7, 41, 677, 'P', '25022687', 11, '2025-08-26', '2025-08-26 02:40:51', '2025-10-22 12:54:31'),
(1380, 1, 1, 7, 42, 602, 'L', '25012612', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1381, 1, 1, 7, 42, 604, 'P', '25022614', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1382, 1, 1, 7, 42, 608, 'L', '25012618', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1383, 1, 1, 7, 42, 612, 'L', '25012622', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1384, 1, 1, 7, 42, 615, 'L', '25012625', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1385, 1, 1, 7, 42, 618, 'L', '25012628', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1386, 1, 1, 7, 42, 626, 'L', '25012636', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1387, 1, 1, 7, 42, 629, 'L', '25012639', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1388, 1, 1, 7, 42, 632, 'P', '25022642', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1389, 1, 1, 7, 42, 640, 'P', '25022650', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1390, 1, 1, 7, 42, 642, 'L', '25012652', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1391, 1, 1, 7, 42, 649, 'L', '25012659', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1392, 1, 1, 7, 42, 650, 'L', '25012660', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1393, 1, 1, 7, 42, 653, 'P', '25022663', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1394, 1, 1, 7, 42, 654, 'P', '25022664', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1395, 1, 1, 7, 42, 658, 'P', '25022668', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1396, 1, 1, 7, 42, 659, 'L', '25012669', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1397, 1, 1, 7, 42, 660, 'P', '25022670', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1398, 1, 1, 7, 42, 661, 'L', '25012671', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1399, 1, 1, 7, 40, 667, 'P', '25022677', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1400, 1, 1, 7, 42, 668, 'L', '25012678', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1401, 1, 1, 7, 42, 672, 'P', '25022682', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1402, 1, 1, 7, 42, 675, 'P', '25022685', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1403, 1, 1, 7, 42, 676, 'P', '25022686', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1404, 1, 1, 7, 42, 678, 'L', '25012688', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1405, 1, 1, 7, 42, 681, 'P', '25022691', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1406, 1, 1, 7, 42, 682, 'P', '25022692', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1407, 1, 1, 7, 42, 683, 'L', '25012693', 11, '2025-08-26', '2025-08-26 02:42:43', '2025-10-22 12:54:31'),
(1408, 1, 1, 9, 46, 684, 'L', '25012694', 11, '2025-10-01', '2025-10-01 08:04:29', '2025-10-22 12:54:31'),
(1409, 1, 1, 8, 45, 685, 'P', '25022695', 11, '2025-10-01', '2025-10-01 14:33:40', '2025-10-22 12:54:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_mutasi`
--

CREATE TABLE `siswa_mutasi` (
  `id_mutasi` int(11) UNSIGNED NOT NULL,
  `id_siswa` int(11) UNSIGNED DEFAULT NULL,
  `id_sekolah` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `nis` varchar(15) NOT NULL,
  `nisn` varchar(15) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `nama_siswa` varchar(150) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kelamin` enum('L','P') NOT NULL DEFAULT 'L',
  `agama` varchar(50) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_ijazah` varchar(150) DEFAULT NULL,
  `nama_ayah` varchar(50) DEFAULT NULL,
  `nama_ibu` varchar(50) DEFAULT NULL,
  `pekerjaan_ayah` varchar(50) DEFAULT NULL,
  `pekerjaan_ibu` varchar(50) DEFAULT NULL,
  `ttl_ayah` varchar(150) DEFAULT NULL,
  `ttl_ibu` varchar(150) DEFAULT NULL,
  `alamat_orangtua` text NOT NULL,
  `jenis_mutasi` enum('Pindah','Mengundurkan Diri','Meninggal Dunia') DEFAULT 'Pindah',
  `tgl_daftar` date NOT NULL,
  `asal_sekolah` varchar(50) NOT NULL,
  `alamat_asal_sekolah` varchar(150) DEFAULT NULL,
  `tanggal_mutasi` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `entry_by` varchar(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa_mutasi`
--

INSERT INTO `siswa_mutasi` (`id_mutasi`, `id_siswa`, `id_sekolah`, `nis`, `nisn`, `nik`, `nama_siswa`, `tempat_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat`, `no_ijazah`, `nama_ayah`, `nama_ibu`, `pekerjaan_ayah`, `pekerjaan_ibu`, `ttl_ayah`, `ttl_ibu`, `alamat_orangtua`, `jenis_mutasi`, `tgl_daftar`, `asal_sekolah`, `alamat_asal_sekolah`, `tanggal_mutasi`, `keterangan`, `tapel`, `semester`, `entry_by`, `created_at`, `updated_at`) VALUES
(1, 172, 1, '20020981', '0075630353', '720812160605001', 'Rany Kifriani', 'Mensung', '2007-08-16', 'P', 'Islam', 'Desa Tabolo - Bolo', '', '', '', '', '', '', '', '', 'Pindah', '0000-00-00', '', '', '2021-09-15', '', 7, 1, '1', '0000-00-00 00:00:00', '2022-07-12 23:39:16'),
(2, 182, 1, '20020991', '0075879951', '720812591207001', 'Sartika Wulandari', 'Kayu Agung', '2007-12-29', 'P', 'Islam', 'Dusun 2 Desa Kayu Agung', '', '', '', '', '', '', '', '', 'Pindah', '0000-00-00', '', '', '2021-09-30', '', 7, 1, '1', '0000-00-00 00:00:00', '2022-07-12 23:39:17'),
(3, 190, 1, '20020999', '0087435099', '720812420508001', 'Ulwina Afifin', 'Kayu Agung', '2008-05-02', 'P', 'Islam', 'Desa Kayuagung', '', '', '', '', '', '', '', '', 'Pindah', '0000-00-00', '', '', '2021-11-15', '', 7, 1, '1', '0000-00-00 00:00:00', '2022-07-12 23:39:18'),
(4, 214, 1, '21011023', '0095421584', '720812201109000', 'Danang Tri Jatmiko', 'Kayu Agung', '2009-11-20', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', '', '', '', '', '', '', '', '', 'Pindah', '0000-00-00', '', '', '2021-10-14', '', 7, 1, '1', '0000-00-00 00:00:00', '2022-07-12 23:39:20'),
(5, 273, 1, '21011082', '0067645063', '720607021208000', 'Radit Hunowu', 'Bosagon', '2006-12-02', 'L', 'Islam', 'Sungai Bosagon', '', '', '', '', '', '', '', '', 'Pindah', '0000-00-00', '', '', '2021-10-13', '', 7, 1, '1', '2022-07-13 15:34:08', '2022-07-13 15:34:08'),
(6, 200, 1, '21011009', '0074821232', '720812230107000', 'Ahmad Aldiansah', 'Kayu Agung', '2007-01-23', 'L', 'Islam', 'Wijayakusuma', '', '', '', '', '', '', '', 'Wijayakusuma', 'Pindah', '0000-00-00', '', '', '2022-01-16', '', 7, 1, '1', '2022-07-13 15:39:36', '2022-07-13 15:39:36'),
(7, 203, 1, '21011012', '0095837670', '720318680209000', 'Aini Azzahra', 'Tompe', '2009-02-28', 'L', 'Islam', 'Jln Trans Sulawesi', '', 'Misno', '', 'Petani', '', 'Kotaraya, 31 Maret 1980', '', 'Jln Trans Sulawesi', 'Pindah', '0000-00-00', '', '', '2022-06-09', 'jgu', 7, 1, '1', '2022-07-13 15:43:10', '2024-04-01 03:23:47'),
(8, 205, 1, '21011014', '0082824766', '720812111008000', 'Alfin Kurniawan', 'Kayu Agung', '2008-10-11', 'L', 'Islam', 'Tinombala', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Tinombala', 'Pindah', '0000-00-00', '', '', '2022-05-11', '', 7, 1, '1', '2022-07-13 15:45:44', '2022-07-13 15:45:44'),
(9, 254, 1, '21011063', '0071434788', '720807050807000', 'Moh Fikri Apriansa', 'Malino', '2008-08-05', 'L', 'Islam', 'Sungai Bosagon', '456767', 'Ayahnya', 'Ibunya', '', '', '', '', 'Sungai Bosagon', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-04-15', '', 7, 1, '1', '2022-07-13 15:47:42', '2023-06-16 07:57:40'),
(10, 287, 1, '21011096', '0071920651', '720807160707000', 'Roy Dwi Saputra', 'Malino', '2007-07-16', 'L', 'Kristen', 'Lambanau', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Lambanau', 'Pindah', '0000-00-00', '', '', '2023-07-13', 'Pindah Sekolah mengikuti orang tua', 9, 1, '1', '2024-04-26 14:56:02', '2024-04-26 14:56:02'),
(11, 280, 1, '21011089', '0082385424', '720812100109000', 'Riki Saputra', 'Sumber Agung', '2009-01-10', 'L', 'Islam', 'Sumber Agung', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Sumber Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2023-07-19', '', 9, 1, '1', '2024-04-26 15:01:50', '2024-04-26 15:01:50'),
(12, 206, 1, '21011015', '0085866581', '720807211208000', 'Andika Pratama', 'Kayu Agung', '2008-12-21', 'L', 'Islam', 'Tinombala Jaya', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Tinombala Jaya', 'Pindah', '0000-00-00', '', '', '2023-07-20', '', 9, 1, '1', '2024-04-26 15:04:49', '2024-04-26 15:04:49'),
(13, 221, 1, '21021030', '0083217015', '720812470508000', 'Dini Arista', 'Sumber Agung', '2008-05-07', 'P', 'Islam', 'Sumber Agung', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Sumber Agung', 'Pindah', '0000-00-00', '', '', '2024-01-01', 'Mengikuti orang tua', 9, 1, '1', '2024-04-26 15:07:23', '2024-04-26 15:07:23'),
(14, 213, 1, '21011022', '0068749114', '720812120806000', 'Beni Ramadani', 'Kotaraya', '2006-08-12', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Dusun 4 Desa Kayu Agung', 'Pindah', '0000-00-00', '', '', '2024-04-28', 'Mengikuti Orang Tua', 9, 1, '1', '2024-04-26 15:10:26', '2024-04-26 15:10:26'),
(15, 220, 1, '21021029', '0088788357', '720812470508000', 'Dina Safita', 'Sumber Agung', '2008-05-07', 'P', 'Islam', 'Sumber Agung', '', NULL, NULL, NULL, NULL, NULL, NULL, 'Sumber Agung', 'Pindah', '0000-00-00', '', '', '2024-01-01', 'Mengikuti Orang Tua', 9, 1, '1', '2024-04-26 15:11:14', '2024-04-26 15:11:14'),
(16, 391, 1, '22020514', NULL, NULL, 'Wiwin', 'Bugis', '2010-05-04', 'P', 'Islam', 'Bugis Utara', NULL, 'Masdin', 'Sian', NULL, NULL, NULL, NULL, 'Bugis Utara', 'Pindah', '0000-00-00', '', '', '2023-01-03', 'Mengikuti Orang Tua', 9, 1, '1', '2024-05-14 16:34:45', '2024-05-14 16:34:45'),
(17, 330, 1, '22010453', '0093513165', '721007000809000', 'Bayu Setiawan', 'Palu', '2009-08-09', 'L', 'Kristen', 'Sumber Agung', '', 'Thomas Riyadi', 'Ferliani K. Selo, S.Ih', '', '', NULL, NULL, 'Sumber Agung', 'Pindah', '0000-00-00', '', '', '2023-12-06', 'Mengikuti Orang Tua', 9, 1, '1', '2024-05-14 16:40:22', '2024-05-14 16:40:22'),
(18, 338, 1, '22010461', '0089013820', '720812161208000', 'Eko Agus Wahyudi', 'Tinombala', '2009-08-05', 'L', 'Islam', '', '', 'Subilan', 'Sri Wahyuti', '', '', NULL, NULL, '', 'Pindah', '0000-00-00', '', '', '2023-05-10', 'Mengikuti Orang Tua', 9, 1, '1', '2024-05-14 16:44:51', '2024-05-14 16:44:51'),
(19, 359, 1, '22010482', '0085602072', '', 'Mohammad Davin', 'Towiora', '2008-09-08', 'L', 'Islam', 'Kayu Agung', '', 'Asmar', 'Sumi Rahayu', '', '', NULL, NULL, 'Kayu Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-03-13', '', 9, 1, '1', '2024-05-14 16:54:32', '2024-05-14 16:54:32'),
(20, 382, 1, '22020505', '3097761531', '720812440709000', 'Sindi Nadia', 'Sumber Agung', '2009-07-04', 'P', 'Islam', 'Sumber Agung', '', 'Sukri Kadir M', 'Supriatin', '', '', NULL, NULL, 'Sumber Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-04-02', '', 9, 1, '1', '2024-05-14 16:56:07', '2024-05-14 16:56:07'),
(21, 312, 1, '21020435', '3083192905', '', 'Suci Anjani', 'Aju Bissue', '2008-01-12', 'P', 'Islam', 'Kayuagung', NULL, 'Su', 'bu', '', '', '', '', 'Kayuagung', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-01-10', 'Kawin', 9, 1, '1', '2024-08-14 16:43:38', '2024-08-14 16:43:38'),
(22, 398, 1, '22021207', '0085372007', '7208225309080001', 'Septi Nuraini', 'Tinombala', '2008-09-13', 'P', 'Islam', 'Tinombala', NULL, 'Herman', 'Ana', NULL, NULL, NULL, NULL, 'Tinombala', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-01-10', '', 9, 1, '1', '2024-08-14 16:45:17', '2024-08-14 16:45:17'),
(23, 399, 1, '22021208', '0093923427', NULL, 'Tiara Lestari Putri', 'Talio', '2009-04-04', 'P', 'Islam', 'Sumber Agung', NULL, NULL, 'Aning Lestari', NULL, NULL, NULL, NULL, 'Sumber Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-01-16', '', 9, 1, '1', '2024-08-14 16:46:56', '2024-08-14 16:46:56'),
(24, 250, 1, '21021059', '0087853289', '721006470380000', 'Kristia Violensia', 'Ranteleda', '2008-11-16', 'P', 'Kristen', 'Dusun 1 Desa Bosagon Jaya', NULL, 'GOD SALTHER', 'Meri', '', '', '', '', 'Dusun 1 Desa Bosagon Jaya', 'Pindah', '0000-00-00', '', '', '2024-01-01', 'Mengikuti orang tua', 9, 1, '1', '2024-08-14 16:50:09', '2024-08-14 16:50:09'),
(25, 369, 1, '22010492', NULL, NULL, 'Putu Eka Setiawan', 'Tinombala', '2009-01-02', 'L', 'Hindu', 'Kotaraya Timur', NULL, 'Pande Putu Adynana', 'Juniati', NULL, NULL, NULL, NULL, 'Kotaraya Timur', 'Pindah', '0000-00-00', '', '', '2024-01-01', 'Mengundurkan diri', 9, 1, '1', '2024-08-14 17:15:20', '2024-08-14 17:15:20'),
(26, 384, 1, '22020507', NULL, NULL, 'Siti Nur Khalizah', 'Kayu Agung ', '2010-08-11', 'P', 'Islam', 'Kayu Agung', NULL, 'Erwin', 'Nurul Choirul Bariyah', NULL, NULL, NULL, NULL, 'Kayu Agung', 'Pindah', '0000-00-00', '', '', '2023-02-01', 'Pindah sekolah', 9, 1, '1', '2024-08-14 17:27:03', '2024-08-14 17:27:03'),
(27, 380, 1, '22010503', '0085681152', '7208071909090002', 'Sepgi Ramadhani', 'Parigi', '2009-09-19', 'L', 'Islam', 'Kayu Agung', NULL, 'Slamet', 'Kusmiati', NULL, NULL, NULL, NULL, 'Kayu Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-01-01', '', 9, 1, '1', '2024-08-14 17:28:05', '2024-08-14 17:28:05'),
(28, 374, 1, '22010497', '0083878990', '7208073103080003', 'Ridwan', 'Tinombala', '2008-03-31', 'L', 'Islam', 'Tinombala Jaya', NULL, 'Sukiyo', 'Eni Pratiwi', NULL, NULL, NULL, NULL, 'Tinombala Jaya', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-04-01', '', 9, 1, '1', '2024-08-14 17:28:51', '2024-08-14 17:28:51'),
(29, 373, 1, '22010496', '0084546292', '7208121510080001', 'Restu Arif Nugroho', 'Kayu Agung', '2008-10-15', 'L', 'Islam', 'Kayu Agung', NULL, 'Parno', 'Wiwik', NULL, NULL, NULL, NULL, 'Kayu Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-05-01', '', 9, 1, '1', '2024-08-14 17:29:12', '2024-08-14 17:29:12'),
(30, 371, 1, '22010494', NULL, NULL, 'Razak', 'Tabolo-Bolo', '2008-02-08', 'L', 'Islam', 'Bosagon Jaya', NULL, 'Usman', 'Musdalifa', NULL, NULL, NULL, NULL, 'Bosagon Jaya', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-04-09', '', 9, 1, '1', '2024-08-14 17:29:33', '2024-08-14 17:29:33'),
(31, 332, 1, '22020455', '0075427012', '7208126909070002', 'Chetrine Alisya Muzzaqi', 'Kayu Agung ', '2007-09-29', 'P', 'Islam', 'Kayu Agung', NULL, 'Sukisno', 'Puryani', NULL, NULL, NULL, NULL, 'Kayu Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-02-01', '', 9, 1, '1', '2024-08-14 17:30:26', '2024-08-14 17:30:26'),
(32, 334, 1, '22010457', NULL, NULL, 'Dimas Abi Saputra', 'Palu', '2010-03-31', 'L', 'Islam', 'Sumber Agung', NULL, 'Bambang Setiawan', 'Ariani', NULL, NULL, NULL, NULL, 'Sumber Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-02-16', '', 9, 1, '1', '2024-08-14 17:31:59', '2024-08-14 17:31:59'),
(33, 339, 1, '22010462', NULL, NULL, 'Eri Setiawan', 'Kayu Agung', '2009-06-28', 'L', 'Islam', 'Tinombala Barat', NULL, 'Mistam', 'Kamini', NULL, NULL, NULL, NULL, 'Tinombala Barat', 'Mengundurkan Diri', '0000-00-00', '', '', '2024-08-15', '', 9, 1, '1', '2024-08-14 17:32:44', '2024-08-14 17:32:44'),
(34, 348, 1, '22020471', '0095667836', '7208226708090001', 'Irnawati', 'Persatuan Sejati', '2009-08-27', 'P', 'Islam', 'Bosagon Jaya', NULL, 'Lamrin', 'Mirnawati', NULL, NULL, NULL, NULL, 'Bosagon Jaya', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-04-11', '', 9, 1, '1', '2024-08-14 17:33:33', '2024-08-14 17:33:33'),
(36, 379, 1, '22020502', '0092277802', '7208225012090001', 'Selvia Nuryani', 'Tinombala', '2009-12-10', 'P', 'Islam', 'Tinombala Sejati', NULL, 'Jaelani', 'Wartini', NULL, NULL, NULL, NULL, 'Tinombala Sejati', 'Mengundurkan Diri', '0000-00-00', '', '', '2023-05-24', '', 9, 1, '1', '2024-08-14 17:34:57', '2024-08-14 17:34:57'),
(37, 393, 1, '22010516', '', NULL, 'Yazid Dul\'ulum', 'Kayu Agung', '2009-12-11', 'L', 'Islam', 'Kayu Agung', NULL, 'Kkarni', 'SAMSIATIN', NULL, NULL, NULL, NULL, 'Kayu Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-01-10', '', 9, 1, '1', '2024-08-14 18:36:48', '2024-08-14 18:36:48'),
(38, 412, 1, '23010422', '0105684151', '7208122709100001', 'Ahmad Ardiansyah', 'Kayu Agung', '2010-09-27', 'L', 'Islam', 'Dusun 4 Desa Kayu Agung', NULL, 'Sunarno', 'Ida Lestari', NULL, NULL, NULL, NULL, 'Dusun 4 Desa Kayu Agung', 'Pindah', '0000-00-00', '', '', '2024-07-15', 'd', 9, 1, '1', '2024-08-14 18:39:32', '2024-08-14 18:39:32'),
(39, 232, 1, '21021041', '0084939327', '720822600708000', 'Fika Setya Putri', 'Tinombala', '2008-07-20', 'P', 'Islam', 'Tinombala Sejati', '', '', '', '', '', '', '', 'Tinombala Sejati', 'Mengundurkan Diri', '0000-00-00', '', '', '2023-01-03', 'Mengundurkan diri', 9, 1, '1', '2024-08-18 17:32:09', '2024-08-26 02:14:29'),
(40, 233, 1, '21011042', '0076278899', '720812260907000', 'Fikrian', 'Kayu Agung', '2007-09-26', 'L', 'Islam', 'Dusun 6 Desa Kayu Agung', '', '', '', '', '', '', '', 'Dusun 6 Desa Kayu Agung', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-04-19', '', 8, 1, '1', '2024-08-18 17:33:06', '2024-08-26 02:16:06'),
(41, 247, 1, '21011056', '0089794248', '720807270608000', 'Jefri Kristian', 'Malino', '2008-06-27', 'L', 'Kristen', 'Trans Sulawesi', '', '', '', '', '', '', '', 'Trans Sulawesi', 'Pindah', '0000-00-00', '', '', '2022-06-15', '', 7, 2, '1', '2024-08-18 17:33:22', '2024-08-26 02:15:46'),
(42, 297, 1, '21021106', '0092938533', '720807640209000', 'Siti Fadillah K', 'Sidoan', '2009-02-24', 'P', 'Islam', 'Sungai Bosagon', '', '', '', '', '', '', '', 'Sungai Bosagon', 'Mengundurkan Diri', '0000-00-00', '', '', '2022-08-17', '', 7, 2, '1', '2024-08-18 17:34:04', '2024-08-26 02:15:15'),
(43, 432, 1, '23010442', '0114056493', '7208120703110002', 'Ega Saputra', 'Kayu Agung', '2011-03-07', 'L', 'Islam', 'Dusun 3 Desa Kayu Agung', NULL, 'Karni', 'Siti Nurjanah', NULL, NULL, NULL, NULL, 'Dusun 3 Desa Kayu Agung', 'Pindah', '2023-07-10', 'SD Negeri 1 Kayu Agung', NULL, '2024-07-15', 'Tidak naik kelas', 10, 1, '1', '2024-08-21 07:23:10', '2024-08-21 07:23:10'),
(44, 441, 1, '23010451', '0102903210', '7208120806100001', 'Firgiyansyah', 'Kayu Agung', '2010-07-08', 'L', 'Islam', 'Nusantara', NULL, 'Tumar', 'Sumiati', NULL, NULL, NULL, NULL, 'Nusantara', 'Pindah', '2023-07-10', 'SD Inpres 2 Kayu Agung', NULL, '2024-07-15', 'Tidak naik kelas', 10, 1, '1', '2024-08-21 07:23:49', '2024-08-21 07:23:49'),
(45, 480, 1, '23010490', '0106186955', '7208071810100001', 'Rendy Kurniawan', 'Tinombala', '2010-10-18', 'L', 'Islam', 'Tinombala Barat', NULL, 'Mohammad Saefudin', 'Nety Sulansari', NULL, NULL, NULL, NULL, 'Tinombala Barat', 'Pindah', '2023-07-10', 'SD Inpres 2 Tinombala', NULL, '2024-07-15', 'Tidak naik kelas', 10, 1, '1', '2024-08-21 07:24:11', '2024-08-21 07:24:11'),
(46, 488, 1, '23010498', '0113867022', '7208120105110003', 'Rizqi Nanda Putra', 'Bugis', '2011-05-01', 'L', 'Islam', 'Nusantara', NULL, 'Ujang Supriatna', 'Fadlia', NULL, NULL, NULL, NULL, 'Nusantara', 'Pindah', '2023-07-10', 'SD Inpres 3 Kayu Agung', NULL, '2024-07-15', 'Tidak naik kelas', 10, 1, '1', '2024-08-21 07:24:35', '2024-08-21 07:24:35'),
(47, 466, 1, '23010476', '0106370430', '7201211911100001', 'Muh Ilham I Meahu', 'Kayutanyo', '2010-11-19', 'L', 'Islam', 'Buon', NULL, 'Irsan S Meahu', 'Sumartin A Paula', NULL, NULL, NULL, NULL, 'Buon', 'Pindah', '2023-07-10', 'SD Inpres Buon', NULL, '2024-07-16', 'Mengikuti Orang Tua', 10, 1, '1', '2024-08-21 07:27:15', '2024-08-21 07:27:15'),
(48, 472, 1, '23020482', '3113296667', '7210124906110001', 'Nurmazni', 'Sigi', '2011-06-09', 'P', 'Islam', 'Desa Tabolo Bolo', NULL, 'Abdul', 'Wizra', NULL, NULL, NULL, NULL, 'Desa Tabolo Bolo', 'Pindah', '2023-07-10', 'SD K Tabolo Bolo', NULL, '2024-07-15', '', 10, 1, '1', '2024-08-21 07:45:35', '2024-08-21 07:45:35'),
(49, 489, 1, '23020499', '0103376702', '7208126901100002', 'Rohilah Atiqiah', 'Kayu Agung', '2010-01-29', 'P', 'Islam', 'Pasundan', NULL, 'Moh. Anwar', 'Ny Karyati', NULL, NULL, NULL, NULL, 'Pasundan', 'Pindah', '2023-07-10', 'SD Inpres 3 Kayu Agung', NULL, '2024-07-15', '', 10, 1, '1', '2024-08-21 07:45:51', '2024-08-21 07:45:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_orangtua`
--

CREATE TABLE `siswa_orangtua` (
  `id_siswa_orangtua` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `id_jurusan` int(11) DEFAULT NULL,
  `id_orangtua` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_alumni` int(11) DEFAULT NULL,
  `nis_siswa` varchar(15) DEFAULT NULL,
  `nisn_siswa` varchar(15) DEFAULT NULL,
  `nama_siswa_historis` varchar(50) DEFAULT NULL,
  `relasi_dengan_siswa` enum('ayah','ibu','wali') NOT NULL,
  `jenis_relasi_siswa` enum('siswa_aktif','alumni') NOT NULL,
  `tgl_relasi_dimulai` date NOT NULL,
  `tgl_relasi_berakhir` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa_orangtua`
--

INSERT INTO `siswa_orangtua` (`id_siswa_orangtua`, `id_sekolah`, `id_jurusan`, `id_orangtua`, `id_siswa`, `id_alumni`, `nis_siswa`, `nisn_siswa`, `nama_siswa_historis`, `relasi_dengan_siswa`, `jenis_relasi_siswa`, `tgl_relasi_dimulai`, `tgl_relasi_berakhir`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, NULL, NULL, '22010439', '0097858353', 'Abdul Rafik', 'ayah', 'siswa_aktif', '2025-07-07', NULL, '2025-07-07 11:34:42', '2025-07-06 03:34:42'),
(2, 1, NULL, 2, NULL, NULL, '22010439', '0097858353', 'Abdul Rafik', 'ayah', 'siswa_aktif', '2025-07-07', NULL, '2025-07-07 11:34:57', '2025-07-06 03:34:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_prestasi`
--

CREATE TABLE `siswa_prestasi` (
  `id_prestasi` int(11) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `id_jurusan` int(11) UNSIGNED NOT NULL,
  `id_tingkat` int(10) UNSIGNED DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(150) NOT NULL,
  `tgl_perolehan` date NOT NULL,
  `nama_prestasi` text NOT NULL,
  `jenis_prestasi` varchar(150) NOT NULL,
  `level_prestasi` varchar(155) NOT NULL,
  `tapel` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `siswa_prestasi`
--

INSERT INTO `siswa_prestasi` (`id_prestasi`, `id_sekolah`, `id_jurusan`, `id_tingkat`, `id_kelas`, `id_siswa`, `nama_siswa`, `tgl_perolehan`, `nama_prestasi`, `jenis_prestasi`, `level_prestasi`, `tapel`, `semester`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, 37, 514, 'Adelina Putri ', '2024-07-07', 'Lomba Catur Tingkat Kecamatan', 'Non Akademik', 'Kecamatan', 10, 1, '2025-07-07 07:30:28', '2025-10-24 18:40:33'),
(4, 1, 1, 7, 40, 603, 'AFIRA  NABILA HUSNA ', '2025-10-24', 'Lomba Catur Tingkat Kecamatan', 'Non Akademik', 'Kecamatan', 11, 1, '2025-10-24 10:38:34', '2025-10-24 18:38:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `otp_secret` varchar(255) DEFAULT NULL,
  `google2fa_secret` varchar(255) DEFAULT NULL,
  `is_2fa_enabled` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `role`, `otp_secret`, `google2fa_secret`, `is_2fa_enabled`) VALUES
(1, 'superadmin', 'Super Admin', 'superadmin@laraschool.id', '2026-06-14 15:18:09', '$2y$12$EumvVYnEkvCOWWKzTkEvJuKiEqF07Zn9VGHcDeHXZvnAtFhU9.3Zm', NULL, NULL, NULL, NULL, '2026-06-14 15:18:09', '2026-06-14 15:18:09', 'admin', NULL, NULL, 0),
(2, 'adminsekolah', 'Admin Sekolah', 'admin@laraschool.id', '2026-06-14 15:18:09', '$2y$12$m52udomIjfAWXRzBwHx0guCsn31lhLZ3RD8mp3ve9yY8FoTvu2Zl.', NULL, NULL, NULL, NULL, '2026-06-14 15:18:09', '2026-06-14 15:18:09', 'admin', NULL, NULL, 0),
(3, 'kepalasekolah', 'Kepala Sekolah', 'kepsek@laraschool.id', '2026-06-14 15:18:10', '$2y$12$ejjSmSpYtK6Kva/oMgWbf.jC9hCuOdaJ/ySSxDLUhW2GynkAc.MYG', NULL, NULL, NULL, NULL, '2026-06-14 15:18:10', '2026-06-14 15:18:10', 'admin', NULL, NULL, 0),
(4, 'guru', 'Guru Demo', 'guru@laraschool.id', '2026-06-14 15:18:10', '$2y$12$YuOK3KXxBpBLeXvB6D4Hb.I4FfGkObP0teKmePeWpq2GFY346l9.a', NULL, NULL, NULL, NULL, '2026-06-14 15:18:10', '2026-06-14 15:18:10', 'admin', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_otps`
--

CREATE TABLE `user_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `otp` varchar(255) NOT NULL,
  `expired_at` timestamp NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `visitor_stats`
--

CREATE TABLE `visitor_stats` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `desktop` int(11) NOT NULL DEFAULT 0,
  `mobile` int(11) NOT NULL DEFAULT 0,
  `tablet` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `config`
--
ALTER TABLE `config`
  ADD KEY `config_name` (`config_name`);

--
-- Indeks untuk tabel `config_category`
--
ALTER TABLE `config_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_ekstrakurikuler`
--
ALTER TABLE `data_ekstrakurikuler`
  ADD PRIMARY KEY (`id_ekstra`);

--
-- Indeks untuk tabel `data_jamkerja`
--
ALTER TABLE `data_jamkerja`
  ADD PRIMARY KEY (`id_jamkerja`);

--
-- Indeks untuk tabel `data_jurusan`
--
ALTER TABLE `data_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `data_matapelajaran`
--
ALTER TABLE `data_matapelajaran`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `data_tingkat`
--
ALTER TABLE `data_tingkat`
  ADD PRIMARY KEY (`id_tingkat`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id_file`);

--
-- Indeks untuk tabel `frontpage_menus`
--
ALTER TABLE `frontpage_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `frontpage_menu_groups`
--
ALTER TABLE `frontpage_menu_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal_jampelajaran`
--
ALTER TABLE `jadwal_jampelajaran`
  ADD PRIMARY KEY (`id_jampel`);

--
-- Indeks untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `fk_jadwal_jampel` (`id_jampel`),
  ADD KEY `fk_jadwal_kelas` (`id_kelas`),
  ADD KEY `fk_jadwal_mapel` (`id_mapel`),
  ADD KEY `fk_jadwal_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswa_pertanyaan` (`siswa_id`,`pertanyaan_id`),
  ADD KEY `pertanyaan_id` (`pertanyaan_id`);

--
-- Indeks untuk tabel `jenis_assesmen`
--
ALTER TABLE `jenis_assesmen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_minat_bakat`
--
ALTER TABLE `kategori_minat_bakat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelulusan_log`
--
ALTER TABLE `kelulusan_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `kompetensi`
--
ALTER TABLE `kompetensi`
  ADD PRIMARY KEY (`id_kompetensi`),
  ADD UNIQUE KEY `id_kompetensi` (`id_kompetensi`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`),
  ADD KEY `id_sekolah_4` (`id_sekolah`),
  ADD KEY `id_tingkat_4` (`id_tingkat`);

--
-- Indeks untuk tabel `mapel_tingkat`
--
ALTER TABLE `mapel_tingkat`
  ADD PRIMARY KEY (`id_mapeltingkat`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_4` (`id_tingkat`),
  ADD KEY `id_sekolah_4` (`id_sekolah`),
  ADD KEY `id_tingkat_5` (`id_tingkat`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_menu_group_id_index` (`menu_group_id`),
  ADD KEY `menus_parent_id_index` (`parent_id`),
  ADD KEY `menus_permission_name_index` (`permission_name`),
  ADD KEY `menus_sort_order_index` (`sort_order`),
  ADD KEY `menus_is_active_index` (`is_active`);

--
-- Indeks untuk tabel `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_groups_name_unique` (`name`),
  ADD KEY `menu_groups_sort_order_index` (`sort_order`),
  ADD KEY `menu_groups_is_active_index` (`is_active`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `module_managers`
--
ALTER TABLE `module_managers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `nilai_bobot`
--
ALTER TABLE `nilai_bobot`
  ADD PRIMARY KEY (`id_bobot`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_4` (`id_tingkat`);

--
-- Indeks untuk tabel `nilai_rapor`
--
ALTER TABLE `nilai_rapor`
  ADD PRIMARY KEY (`id_nilai_rapor`);

--
-- Indeks untuk tabel `nilai_riwayat`
--
ALTER TABLE `nilai_riwayat`
  ADD PRIMARY KEY (`id_riwayatnilai`);

--
-- Indeks untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  ADD PRIMARY KEY (`id_orangtua`);

--
-- Indeks untuk tabel `passkeys`
--
ALTER TABLE `passkeys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `passkeys_credential_id_unique` (`credential_id`),
  ADD KEY `passkeys_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `pegawai_mapel`
--
ALTER TABLE `pegawai_mapel`
  ADD PRIMARY KEY (`id_pegawai_mapel`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`);

--
-- Indeks untuk tabel `pegawai_walikelas`
--
ALTER TABLE `pegawai_walikelas`
  ADD PRIMARY KEY (`id_pegawai_walikelas`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `ref_agama`
--
ALTER TABLE `ref_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indeks untuk tabel `ref_angkatan`
--
ALTER TABLE `ref_angkatan`
  ADD PRIMARY KEY (`id_angkatan`);

--
-- Indeks untuk tabel `ref_bangunan`
--
ALTER TABLE `ref_bangunan`
  ADD PRIMARY KEY (`id_bangunan`);

--
-- Indeks untuk tabel `ref_bulan`
--
ALTER TABLE `ref_bulan`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indeks untuk tabel `ref_golruang`
--
ALTER TABLE `ref_golruang`
  ADD PRIMARY KEY (`id_golruang`);

--
-- Indeks untuk tabel `ref_jabatanpegawai`
--
ALTER TABLE `ref_jabatanpegawai`
  ADD PRIMARY KEY (`id_jabatanpegawai`);

--
-- Indeks untuk tabel `ref_pekerjaan`
--
ALTER TABLE `ref_pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`);

--
-- Indeks untuk tabel `ref_pendidikan`
--
ALTER TABLE `ref_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indeks untuk tabel `ref_sekolahasal`
--
ALTER TABLE `ref_sekolahasal`
  ADD PRIMARY KEY (`id_sekolahasal`);

--
-- Indeks untuk tabel `ref_status_kepegawaian`
--
ALTER TABLE `ref_status_kepegawaian`
  ADD PRIMARY KEY (`id_status_kepegawaian`);

--
-- Indeks untuk tabel `report_datasiswa`
--
ALTER TABLE `report_datasiswa`
  ADD PRIMARY KEY (`id_data`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`),
  ADD UNIQUE KEY `kode_ruangan` (`kode_ruangan`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `status` (`status`),
  ADD KEY `tipe` (`tipe`);

--
-- Indeks untuk tabel `ruangan_jadwal`
--
ALTER TABLE `ruangan_jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_ruangan` (`id_ruangan`),
  ADD KEY `id_sesi_ujian` (`id_sesi_ujian`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `tanggal` (`tanggal`);

--
-- Indeks untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id_sekolah`),
  ADD UNIQUE KEY `unik_npsn` (`npsn`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `siklus_kelasrombel`
--
ALTER TABLE `siklus_kelasrombel`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_4` (`id_tingkat`);

--
-- Indeks untuk tabel `siklus_semester`
--
ALTER TABLE `siklus_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `siklus_tahunajaran`
--
ALTER TABLE `siklus_tahunajaran`
  ADD PRIMARY KEY (`id_tahunajaran`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `siswa_absensi`
--
ALTER TABLE `siswa_absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD UNIQUE KEY `uniq_absen` (`id_kelas`,`id_mapel`,`tanggal`,`nis`),
  ADD KEY `fk_riwayatabsensi` (`id_riwayatabsensi`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`);

--
-- Indeks untuk tabel `siswa_absensi_riwayat`
--
ALTER TABLE `siswa_absensi_riwayat`
  ADD PRIMARY KEY (`id_riwayatabsensi`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`);

--
-- Indeks untuk tabel `siswa_alumni`
--
ALTER TABLE `siswa_alumni`
  ADD PRIMARY KEY (`id_alumni`);

--
-- Indeks untuk tabel `siswa_autologin`
--
ALTER TABLE `siswa_autologin`
  ADD PRIMARY KEY (`user`,`series`);

--
-- Indeks untuk tabel `siswa_kelas`
--
ALTER TABLE `siswa_kelas`
  ADD PRIMARY KEY (`id_siswa_kelas`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`);

--
-- Indeks untuk tabel `siswa_mutasi`
--
ALTER TABLE `siswa_mutasi`
  ADD PRIMARY KEY (`id_mutasi`);

--
-- Indeks untuk tabel `siswa_orangtua`
--
ALTER TABLE `siswa_orangtua`
  ADD PRIMARY KEY (`id_siswa_orangtua`),
  ADD UNIQUE KEY `idx_siswa_orangtua_aktif_unique` (`id_orangtua`,`id_siswa`),
  ADD UNIQUE KEY `idx_siswa_orangtua_alumni_unique` (`id_orangtua`,`id_alumni`),
  ADD KEY `fk_siswa_orangtua_jurusan` (`id_jurusan`),
  ADD KEY `fk_siswa_orangtua_orangtua` (`id_orangtua`),
  ADD KEY `fk_siswa_orangtua_siswa` (`id_siswa`),
  ADD KEY `fk_siswa_orangtua_alumni` (`id_alumni`);

--
-- Indeks untuk tabel `siswa_prestasi`
--
ALTER TABLE `siswa_prestasi`
  ADD PRIMARY KEY (`id_prestasi`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_tingkat` (`id_tingkat`),
  ADD KEY `id_sekolah_2` (`id_sekolah`),
  ADD KEY `id_tingkat_2` (`id_tingkat`),
  ADD KEY `id_sekolah_3` (`id_sekolah`),
  ADD KEY `id_tingkat_3` (`id_tingkat`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_otps_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `visitor_stats`
--
ALTER TABLE `visitor_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `config_category`
--
ALTER TABLE `config_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `data_ekstrakurikuler`
--
ALTER TABLE `data_ekstrakurikuler`
  MODIFY `id_ekstra` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `data_jamkerja`
--
ALTER TABLE `data_jamkerja`
  MODIFY `id_jamkerja` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `data_jurusan`
--
ALTER TABLE `data_jurusan`
  MODIFY `id_jurusan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_matapelajaran`
--
ALTER TABLE `data_matapelajaran`
  MODIFY `id_mapel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `data_tingkat`
--
ALTER TABLE `data_tingkat`
  MODIFY `id_tingkat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `files`
--
ALTER TABLE `files`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `frontpage_menus`
--
ALTER TABLE `frontpage_menus`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `frontpage_menu_groups`
--
ALTER TABLE `frontpage_menu_groups`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `jadwal_jampelajaran`
--
ALTER TABLE `jadwal_jampelajaran`
  MODIFY `id_jampel` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  MODIFY `id_jadwal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenis_assesmen`
--
ALTER TABLE `jenis_assesmen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori_minat_bakat`
--
ALTER TABLE `kategori_minat_bakat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kelulusan_log`
--
ALTER TABLE `kelulusan_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kompetensi`
--
ALTER TABLE `kompetensi`
  MODIFY `id_kompetensi` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `mapel_tingkat`
--
ALTER TABLE `mapel_tingkat`
  MODIFY `id_mapeltingkat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `module_managers`
--
ALTER TABLE `module_managers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT untuk tabel `nilai_bobot`
--
ALTER TABLE `nilai_bobot`
  MODIFY `id_bobot` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `nilai_rapor`
--
ALTER TABLE `nilai_rapor`
  MODIFY `id_nilai_rapor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `nilai_riwayat`
--
ALTER TABLE `nilai_riwayat`
  MODIFY `id_riwayatnilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  MODIFY `id_orangtua` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `passkeys`
--
ALTER TABLE `passkeys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `pegawai_mapel`
--
ALTER TABLE `pegawai_mapel`
  MODIFY `id_pegawai_mapel` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT untuk tabel `pegawai_walikelas`
--
ALTER TABLE `pegawai_walikelas`
  MODIFY `id_pegawai_walikelas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ref_angkatan`
--
ALTER TABLE `ref_angkatan`
  MODIFY `id_angkatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT untuk tabel `ref_bangunan`
--
ALTER TABLE `ref_bangunan`
  MODIFY `id_bangunan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `ref_bulan`
--
ALTER TABLE `ref_bulan`
  MODIFY `id_bulan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `ref_golruang`
--
ALTER TABLE `ref_golruang`
  MODIFY `id_golruang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `ref_jabatanpegawai`
--
ALTER TABLE `ref_jabatanpegawai`
  MODIFY `id_jabatanpegawai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `ref_pekerjaan`
--
ALTER TABLE `ref_pekerjaan`
  MODIFY `id_pekerjaan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `ref_pendidikan`
--
ALTER TABLE `ref_pendidikan`
  MODIFY `id_pendidikan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `ref_sekolahasal`
--
ALTER TABLE `ref_sekolahasal`
  MODIFY `id_sekolahasal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `ref_status_kepegawaian`
--
ALTER TABLE `ref_status_kepegawaian`
  MODIFY `id_status_kepegawaian` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `report_datasiswa`
--
ALTER TABLE `report_datasiswa`
  MODIFY `id_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `ruangan_jadwal`
--
ALTER TABLE `ruangan_jadwal`
  MODIFY `id_jadwal` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id_sekolah` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `siklus_kelasrombel`
--
ALTER TABLE `siklus_kelasrombel`
  MODIFY `id_kelas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `siklus_semester`
--
ALTER TABLE `siklus_semester`
  MODIFY `id_semester` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siklus_tahunajaran`
--
ALTER TABLE `siklus_tahunajaran`
  MODIFY `id_tahunajaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=686;

--
-- AUTO_INCREMENT untuk tabel `siswa_absensi`
--
ALTER TABLE `siswa_absensi`
  MODIFY `id_absensi` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1605;

--
-- AUTO_INCREMENT untuk tabel `siswa_absensi_riwayat`
--
ALTER TABLE `siswa_absensi_riwayat`
  MODIFY `id_riwayatabsensi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `siswa_alumni`
--
ALTER TABLE `siswa_alumni`
  MODIFY `id_alumni` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT untuk tabel `siswa_kelas`
--
ALTER TABLE `siswa_kelas`
  MODIFY `id_siswa_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1410;

--
-- AUTO_INCREMENT untuk tabel `siswa_mutasi`
--
ALTER TABLE `siswa_mutasi`
  MODIFY `id_mutasi` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `siswa_orangtua`
--
ALTER TABLE `siswa_orangtua`
  MODIFY `id_siswa_orangtua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `siswa_prestasi`
--
ALTER TABLE `siswa_prestasi`
  MODIFY `id_prestasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `visitor_stats`
--
ALTER TABLE `visitor_stats`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD CONSTRAINT `fk_jadwal_jampel` FOREIGN KEY (`id_jampel`) REFERENCES `jadwal_jampelajaran` (`id_jampel`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwal_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `siklus_kelasrombel` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwal_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `data_matapelajaran` (`id_mapel`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwal_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jawaban_siswa`
--
ALTER TABLE `jawaban_siswa`
  ADD CONSTRAINT `jawaban_siswa_ibfk_1` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan_assesmen` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kompetensi`
--
ALTER TABLE `kompetensi`
  ADD CONSTRAINT `fk_kompetensi_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kompetensi_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mapel_tingkat`
--
ALTER TABLE `mapel_tingkat`
  ADD CONSTRAINT `fk_mapeltingkat_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mapeltingkat_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_menu_group_id_foreign` FOREIGN KEY (`menu_group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_bobot`
--
ALTER TABLE `nilai_bobot`
  ADD CONSTRAINT `fk_bobot_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `data_matapelajaran` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nilaibobot_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nilaibobot_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `passkeys`
--
ALTER TABLE `passkeys`
  ADD CONSTRAINT `passkeys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pegawai_mapel`
--
ALTER TABLE `pegawai_mapel`
  ADD CONSTRAINT `fk_pegawaimapel_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pegawaimapel_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pegawai_walikelas`
--
ALTER TABLE `pegawai_walikelas`
  ADD CONSTRAINT `fk_walikelas_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_walikelas_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD CONSTRAINT `fk_ruangan_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ruangan_jadwal`
--
ALTER TABLE `ruangan_jadwal`
  ADD CONSTRAINT `fk_jadwal_ruangan` FOREIGN KEY (`id_ruangan`) REFERENCES `ruangan` (`id_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwal_sesi` FOREIGN KEY (`id_sesi_ujian`) REFERENCES `ujian_sesi` (`id_sesi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siklus_kelasrombel`
--
ALTER TABLE `siklus_kelasrombel`
  ADD CONSTRAINT `fk_rombel_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rombel_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa_absensi`
--
ALTER TABLE `siswa_absensi`
  ADD CONSTRAINT `fk_absensi_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_absensi_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_riwayatabsensi` FOREIGN KEY (`id_riwayatabsensi`) REFERENCES `siswa_absensi_riwayat` (`id_riwayatabsensi`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa_absensi_riwayat`
--
ALTER TABLE `siswa_absensi_riwayat`
  ADD CONSTRAINT `fk_absensiriwayat_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_absensiriwayat_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa_kelas`
--
ALTER TABLE `siswa_kelas`
  ADD CONSTRAINT `fk_siswakelas_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswakelas_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa_orangtua`
--
ALTER TABLE `siswa_orangtua`
  ADD CONSTRAINT `fk_siswa_orangtua_alumni` FOREIGN KEY (`id_alumni`) REFERENCES `siswa_alumni` (`id_alumni`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_orangtua_orangtua` FOREIGN KEY (`id_orangtua`) REFERENCES `orangtua` (`id_orangtua`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswa_orangtua_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa_prestasi`
--
ALTER TABLE `siswa_prestasi`
  ADD CONSTRAINT `fk_siswaprestasi_sekolah` FOREIGN KEY (`id_sekolah`) REFERENCES `sekolah` (`id_sekolah`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_siswaprestasi_tingkat` FOREIGN KEY (`id_tingkat`) REFERENCES `data_tingkat` (`id_tingkat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_otps`
--
ALTER TABLE `user_otps`
  ADD CONSTRAINT `user_otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
