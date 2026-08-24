-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- --------------------------------------------------------
-- Table structures
-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `about_items` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `label` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `icon` VARCHAR(255) DEFAULT NULL,
  `image` VARCHAR(255) DEFAULT NULL,
  `text` TEXT DEFAULT NULL,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `admins` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `nama_lengkap` VARCHAR(255) DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `companies` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) DEFAULT NULL,
  `icon` VARCHAR(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `image` VARCHAR(255) DEFAULT NULL,
  `link` VARCHAR(255) DEFAULT NULL,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `gallery_photos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `image` VARCHAR(255) DEFAULT NULL,
  `caption` VARCHAR(255) DEFAULT NULL,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `hero_slides` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `image` VARCHAR(255) DEFAULT NULL,
  `eyebrow` VARCHAR(255) DEFAULT NULL,
  `title` VARCHAR(255) DEFAULT NULL,
  `subtitle` TEXT DEFAULT NULL,
  `cta_text` VARCHAR(255) DEFAULT NULL,
  `cta_link` VARCHAR(255) DEFAULT NULL,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `services` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(255) DEFAULT NULL,
  `icon` VARCHAR(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `image1` VARCHAR(255) DEFAULT NULL,
  `image2` VARCHAR(255) DEFAULT NULL,
  `image3` VARCHAR(255) DEFAULT NULL,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `logo` VARCHAR(255) DEFAULT NULL,
  `companies_subtitle` TEXT DEFAULT NULL,
  `services_subtitle` TEXT DEFAULT NULL,
  `about_subtitle` TEXT DEFAULT NULL,
  `gallery_subtitle` TEXT DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `phone` VARCHAR(255) DEFAULT NULL,
  `phone_link` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `maps_embed_url` TEXT DEFAULT NULL,
  `maps_link_url` VARCHAR(255) DEFAULT NULL,
  `ig_url` VARCHAR(255) DEFAULT NULL,
  `fb_url` VARCHAR(255) DEFAULT NULL,
  `yt_url` VARCHAR(255) DEFAULT NULL,
  `tiktok_url` VARCHAR(255) DEFAULT NULL,
  `whatsapp_number` VARCHAR(255) DEFAULT NULL,
  `whatsapp_message` TEXT DEFAULT NULL,
  `footer_about` TEXT DEFAULT NULL,
  `footer_copyright_name` VARCHAR(255) DEFAULT NULL,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `stats` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `number` VARCHAR(255) DEFAULT NULL,
  `label` VARCHAR(255) DEFAULT NULL,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) DEFAULT NULL,
  `text` TEXT DEFAULT NULL,
  `rating` INT DEFAULT 0,
  `sort_order` INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------
-- Dumping data
-- --------------------------------------------------------

-- Dumping data for table about_items
INSERT INTO `about_items` (`id`, `label`, `name`, `icon`, `image`, `text`, `sort_order`) VALUES
	(1, 'Pendiri', 'Ir. Edy Antoro', 'founder', 'uploads/about_items_image_6a4f48f41bd5a.png', 'Kami bukan pelayan uang, bukan pula pelayan harta. Kami bukan orang yang hanya memikirkan untung, untung, dan untung. Tapi kami sadar bahwa kami harus berbuat baik.', 1),
	(2, 'Sejarah', 'Kusuma Agrowisata', 'history', 'https://picsum.photos/seed/kusuma-history/700/700', 'Berawal dari lahan 1,8 hektar pada tahun 1989, kini berkembang menjadi ratusan hektar dan menaungi beberapa perusahaan. Semoga semua ini menjadi berkah bagi kita semua.', 2),
	(3, 'Masa Depan', 'Bagian dari Lingkaran Kehidupan', 'future', 'https://picsum.photos/seed/kusuma-future/700/700', 'Kami berkomitmen menjadi perusahaan yang membuat kehidupan manusia lebih bahagia. Industri, Estate, dan Hotel adalah bagian dari perjalanan kami ke depan.', 3);

-- Dumping data for table admins
INSERT INTO `admins` (`id`, `username`, `password`, `nama_lengkap`, `created_at`) VALUES
	(1, 'admin', '$2y$10$uFUkHQw2TmXZ5OrUIDB5dOqhxwigCgvcDEffAiw1dQYn2z/VF8t02', NULL, '2026-07-09 14:38:24');

-- Dumping data for table companies
INSERT INTO `companies` (`id`, `name`, `icon`, `description`, `image`, `link`, `sort_order`) VALUES
	(1, 'Kusuma Agrowisata', 'leaf', 'Wisata petik apel, jeruk, strawberry & sayur hidroponik langsung dari kebun.', 'logo1.png', 'https://agrowisata.id/', 1),
	(2, 'Kusuma Hotel & Resort', 'bed', 'Resort & Convention Hotel dengan 152 kamar bernuansa kebun apel.', 'hotel.png', 'https://www.kusuma-hotel.com/', 2),
	(3, 'Kusuma Estate', 'home', 'Kawasan hunian asri berkontur perbukitan di Kota Batu.', 'kusuma-estate.png', 'https://estate.kusuma.id/', 3),
	(4, 'Kusuma Agro Industri', 'factory', 'Produk olahan apel asli seperti Siiplah, jenang apel, hingga cuka apel.', 'industri.png', 'https://industri.kusuma.id/', 4);

-- Dumping data for table gallery_photos
INSERT INTO `gallery_photos` (`id`, `image`, `caption`, `sort_order`) VALUES
	(2, 'Upload/galerry/1783650141_ef2bc7dd2e7a9b0695ed.jpg', 'Sarapan pagi di tengah kebun', 2),
	(3, 'Upload/galerry/1783650179_8fd962625fb245f7a8a4.jpg', 'Seluncuran favorit anak-anak', 3),
	(4, 'Upload/galerry/1783650212_3cbb0576023ac3ea5c27.jpg', 'Cottage nyaman berpemandangan gunung', 4),
	(5, 'Upload/galerry/1783650240_6874a297e3114c01bad2.jpg', 'Produk olahan apel Siiplah', 5),
	(6, 'Upload/galerry/1783650270_f43eabcaf53449b58b9f.jpg', 'Sore hari di Kusuma Agrowisata', 6);

-- Dumping data for table hero_slides
INSERT INTO `hero_slides` (`id`, `image`, `eyebrow`, `title`, `subtitle`, `cta_text`, `cta_link`, `sort_order`) VALUES
	(1, 'Upload/hero/1783674301_71ba5ab13a6d72eac0b4.jpg', 'Sejak 1989', 'tes', 'tes2', 'Explore Attractions', '#companies', 1),
	(2, 'https://picsum.photos/seed/kusuma-hero-hotel/1920/1080', 'Menginap Nyaman seka.li lo', 'Resort & Convention Hotel di Ketinggian 1000 Mdpl', '152 kamar dan cottage asri dikelilingi kebun apel, kolam renang, serta udara pegunungan yang sejuk sepanjang tahun.', 'Lihat Hotel Kami', '#companies', 2),
	(3, 'https://picsum.photos/seed/kusuma-hero-waterpark/1920/1080', 'Seru untuk Keluarga', 'Basah-basahan Seru di Kusuma Waterpark', 'Kolam arus, seluncuran, dan kolam anak — pelengkap keseruan setelah puas memetik buah langsung dari pohonnya.', 'Lihat Layanan', '#services', 3),
	(4, 'https://picsum.photos/seed/kusuma-hero-petik/1920/1080', 'Favorit Pengunjung', 'Petik Apel, Jeruk & Strawberry Langsung dari Kebun', 'Lebih dari 10 jenis buah siap dipetik sendiri bersama keluarga, ditemani pemandu ramah kami.', 'Rencanakan Kunjungan', '#contact', 4);

-- Dumping data for table services
INSERT INTO `services` (`id`, `title`, `icon`, `description`, `image1`, `image2`, `image3`, `sort_order`) VALUES
	(1, 'Area & Pemandangan', 'camera', 'Berada di lokasi terbaik Kota Batu, area luas di lereng Gunung Panderman dengan udara sejuk sepanjang hari.', 'https://picsum.photos/seed/area-1/1200/800', 'https://picsum.photos/seed/area-2/1200/800', 'https://picsum.photos/seed/area-3/1200/800', 1),
	(2, 'Waterpark', 'waves', 'Kolam arus, seluncuran, dan kolam anak — keseruan basah-basahan untuk seluruh keluarga.', 'https://picsum.photos/seed/waterpark-1/1200/800', 'https://picsum.photos/seed/waterpark-2/1200/800', 'https://picsum.photos/seed/waterpark-3/1200/800', 2),
	(9, 'Petik Buah', 'apple', 'Lebih dari 10 jenis buah di kebun kami, siap dipetik langsung oleh Anda dan keluarga.', 'https://picsum.photos/seed/petik-1/1200/800', 'https://picsum.photos/seed/petik-2/1200/800', 'https://picsum.photos/seed/petik-3/1200/800', 3),
	(10, 'Kuliner Khas Apel', 'drink', 'Siiplah dan TehKu adalah produk andalan kami, diracik langsung dari buah pilihan kebun sendiri.', 'https://picsum.photos/seed/kuliner-1/1200/800', 'https://picsum.photos/seed/kuliner-2/1200/800', 'https://picsum.photos/seed/kuliner-3/1200/800', 4),
	(11, 'Home & Villa', 'villa', 'Hunian dan vila terbaik di Kota Batu, siap ditempati dengan penawaran spesial.', 'https://picsum.photos/seed/villa-1/1200/800', 'https://picsum.photos/seed/villa-2/1200/800', 'https://picsum.photos/seed/villa-3/1200/800', 5),
	(12, 'Party, Event & Wedding', 'party', 'Kolam renang, gym, dan various area untuk mewujudkan acara Anda jadi sukses dan berkesan.', 'https://picsum.photos/seed/event-1/1200/800', 'https://picsum.photos/seed/event-2/1200/800', 'https://picsum.photos/seed/event-3/1200/800', 6);

-- Dumping data for table site_settings
INSERT INTO `site_settings` (`id`, `logo`, `companies_subtitle`, `services_subtitle`, `about_subtitle`, `gallery_subtitle`, `address`, `phone`, `phone_link`, `email`, `maps_embed_url`, `maps_link_url`, `ig_url`, `fb_url`, `yt_url`, `tiktok_url`, `whatsapp_number`, `whatsapp_message`, `footer_about`, `footer_copyright_name`, `updated_at`) VALUES
	(1, 'Upload/logo/1783906320_dda09745c75df4a0e3a6.png', 'Empat unit usaha yang tumbuh dari satu kebun apel kecil di Kota Batu, kini menaungi wisata, hotel, hunian, hingga industri olahan buah.', 'Tekan kartunya untuk lihat foto-fotonya — biar makin kebayang serunya liburan di sini.', 'Perjalanan panjang dari kebun kecil seluas 1,8 hektar hingga menjadi grup usaha yang menghadirkan kebahagiaan untuk banyak keluarga.', 'Sedikit cerita dalam foto dari kebun, kolam renang, hingga kamar hotel kami.', 'Jl. Abdul Gani Atas, Kota Batu, Jawa Timur 65311', '0800-159-3333', '+628001593333', 'info@kusuma.co', 'https://www.google.com/maps?q=Kusuma+Agrowisata+Batu&output=embed', 'https://www.google.com/maps/search/?api=1&query=Kusuma+Agrowisata+Batu', 'https://www.instagram.com/blupblup.th/', 'https://facebook.com/kusumaagrowisata', 'https://youtube.com', 'https://tiktok.com', '6288803300699', 'Halo Kusuma Agrowisata, saya ingin bertanya tentang wisata di sini.', 'Kusuma Agrowisata Group menghadirkan wisata petik buah, hotel resort, waterpark, hunian, dan produk olahan apel asli Kota Batu sejak 1989.', 'PT Kusuma Satria Dinasasri Wisatajaya', '2026-07-13 08:32:00');

-- Dumping data for table stats
INSERT INTO `stats` (`id`, `number`, `label`, `sort_order`) VALUES
	(1, '35+', 'Tahun Berpengalaman', 1),
	(2, '60+', 'Hektar Area Wisata', 2),
	(3, '10+', 'Jenis Buah Siap Petik', 3),
	(4, '150+', 'Kamar Hotel & Cottage', 4);

-- Dumping data for table testimonials
INSERT INTO `testimonials` (`id`, `name`, `text`, `rating`, `sort_order`) VALUES
	(1, 'Rina, Malang', 'Liburan keluarga paling seru! Anak-anak suka banget petik strawberry dan main di waterpark.', 5, 1),
	(2, 'Budi, Surabaya', 'Hotelnya nyaman, udaranya sejuk, sarapannya enak. Pasti balik lagi.', 5, 2),
	(3, 'Sari, Batu', 'Oleh-oleh Siiplah wajib dibawa pulang, seger banget rasa apelnya.', 5, 3);


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
