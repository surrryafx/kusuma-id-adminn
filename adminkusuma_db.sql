-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 08, 2026 at 04:47 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adminkusuma_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_items`
--

CREATE TABLE `about_items` (
  `id` int NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` text,
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `about_items`
--

INSERT INTO `about_items` (`id`, `label`, `name`, `icon`, `image`, `text`, `sort_order`) VALUES
(1, 'Pendiri', 'Ir. Edy Antoro', 'founder', 'Upload/about/1791424123_7df32ee6108753ad4ae1.jpg', '\"Dia menemukan kekuatan cinta. Menyatu dengan alam. Di mana bumi dipijak di situ langit dijunjung. Maka dia pun mencintai tanah seluas 1,8 hektar itu dengan sepenuh hati\". (sumber : Republik Agro by Anwar Hudijono)', 1),
(2, 'Sejarah', 'Kusuma Agrowisata', 'history', 'Upload/about/1789966317_6832c809ccc28fb5fa0c.jpeg', 'Berawal dari lahan 1,8 hektar pada tahun 1989, kini berkembang menjadi ratusan hektar dan menaungi beberapa anak perusahaan.', 2),
(3, 'Masa Depan', 'Bagian dari Lingkaran Kehidupan', 'future', 'Upload/about/1789966338_18fa0cb2d02d2a462605.jpeg', 'Kami berkomitmen menjadi perusahaan yang membuat kehidupan manusia lebih bahagia. Wisata, Hotel, Industri, dan Estate adalah bagian dari perjalanan kami ke depan.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `nama_lengkap`, `created_at`) VALUES
(4, 'kag_admin', '$2y$10$ouE2chllQLHjThS1po3ze.GCtSnCG/Yg6T9U2kz4gX6h6GjaS0IrO', 'KAG Admin', '2026-09-17 14:46:43'),
(5, 'admin', '$2y$10$NnJxbX78FUji3ZzUnfRxS.0J7iHX5EdbE0cpMuGtrmcSSBV1myNmu', 'Akun admin', '2026-09-17 14:56:07'),
(8, 'admin_baru', '$2y$10$w8T0m9DkC8w8p9x.Lq7H/.GqJ3J4j2e5e1m2n3o4p5q6r7s8t9u0', 'Admin Baru', '2026-09-25 10:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `api_tokens`
--

CREATE TABLE `api_tokens` (
  `id` int NOT NULL,
  `token` varchar(64) NOT NULL,
  `admin_id` int NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `api_tokens`
--

INSERT INTO `api_tokens` (`id`, `token`, `admin_id`, `expires_at`, `created_at`) VALUES
(14, '5ec90163a761d0363a6a7cc7098ad706adb9628edf078a36ea14f0d77b58d14c', 5, '2026-09-22 17:45:06', '2026-09-22 14:45:06'),
(15, '3fb56c45961e3fec17d2f9dc52971cd6b661634c72481f72544344b314ae1301', 5, '2026-09-22 17:46:09', '2026-09-22 14:46:09'),
(16, 'f9818e4f246d71d705c41545822dd01366160d4194907f2c7f7abc9ce37484db', 5, '2026-09-22 17:46:42', '2026-09-22 14:46:42'),
(17, '970fc8b371095b0c37f0630f10d106e0b7fb1a288fdd2ba671274a3b08bc31a9', 5, '2026-09-22 18:14:10', '2026-09-22 15:14:10'),
(18, '92d25b9b4649c35d60d7b1f7488826d69f1263cefaa99253931e96ad980296cc', 5, '2026-09-23 12:12:20', '2026-09-23 09:12:20'),
(19, '75faf9a73ee5e4c1214f54d712e4f2e2d3b20574fa4647b28cf1a9e31988adb3', 5, '2026-09-23 18:34:06', '2026-09-23 15:34:06'),
(20, '13635618ebc9fab98d7af80e02384f85b0b83020e58e462a8d0befc524b8ca95', 5, '2026-09-24 11:32:18', '2026-09-24 08:32:18'),
(21, '7e6c174b33e192c28d81f35d770970c6cc38b2823906e2552ec378d86e8cbaa0', 5, '2026-09-24 19:37:19', '2026-09-24 16:37:19'),
(22, 'b566fade3ff2b5c411d13d4f3803c1aaaaa204bb2f3a7687d57ed3fc0f685d61', 5, '2026-09-25 11:32:16', '2026-09-25 10:32:16'),
(23, '4374400d643617a6bfa99fdd42105314de6508a7f26e276e91e428cdb3fa3f2c', 5, '2026-09-25 11:32:59', '2026-09-25 10:32:59'),
(24, '632e5fc225451130df5338d301007f83ebc9e4774dfdb37b59a36a96263bf34a', 5, '2026-09-25 11:44:39', '2026-09-25 10:44:39'),
(25, '3e7ddc5218a3ba6879bb7689f0111cc60d7552e45971aa5a2e39c51d9fd207ea', 5, '2026-09-25 11:45:45', '2026-09-25 10:45:45'),
(26, '30f9322ba6c8e2accff56911167295eae43696b15fc15e087d2b55e5f8e423ea', 5, '2026-09-25 14:10:03', '2026-09-25 13:10:03'),
(27, '31c2abf0068be740183be28d8040d6264476fb3dff9a2a1f5612759f16055fb8', 5, '2026-09-25 16:15:33', '2026-09-25 15:15:33'),
(28, '805b44a2608213403b6d3111d68ba5a50e6c06b47e6dbbc16d9d2a87b20124fd', 5, '2026-09-28 10:26:57', '2026-09-28 09:26:57'),
(29, '5d14cdcd944a7ad31d3e02b62b4dd87cb8981bcf4724738a0887f84501c3f85e', 5, '2026-09-28 11:30:51', '2026-09-28 10:30:51'),
(30, '6a5e50545e6ed311fdd78ad541d69f14719fe77488a36e0ec7259bf1f380c234', 5, '2026-09-28 12:21:02', '2026-09-28 11:21:02'),
(31, '837583aef567041b656bb2c613c30e5430b76b4a0644dfed8d6082f882925582', 5, '2026-09-28 12:23:53', '2026-09-28 11:23:53'),
(32, '824ebd304a224a82bd6dd0af37a2fabf40ef09f59697aedd6ed789a86fc759e6', 5, '2026-09-28 13:28:36', '2026-09-28 12:28:36'),
(33, '912fef9849061a42cbd13dafba643b1528f3695bc3af6dfc14bc5fcd831387eb', 5, '2026-09-28 13:37:48', '2026-09-28 12:37:48'),
(34, 'c71ef4a814334f38141c2e9c39adae3d9a4a75050c04d4b8e93bca09c237da01', 5, '2026-09-28 13:44:43', '2026-09-28 12:44:43'),
(35, 'bafb4083eb801c0a27153b38425f38f13b931cdbfacf65f215b2c245771a69ea', 5, '2026-09-28 17:00:40', '2026-09-28 16:00:40'),
(36, '7259b778b776b038c6a483c5b14eabd58d5d7669ba9e2d5ff7fc1b1731848179', 5, '2026-09-28 17:30:45', '2026-09-28 16:30:45'),
(37, 'b556170e4a42c878064681fe2d67417d58e475b64502b957b14e29a35347f653', 5, '2026-09-29 10:15:40', '2026-09-29 09:15:40'),
(38, 'c135588d9b30d48d3ff659b91a60df9bffd6e8312eb1a45a14140b935da0247a', 5, '2026-09-29 14:33:28', '2026-09-29 13:33:28'),
(39, '7022d2fc4aee90820fefbb87b22e7a1c1a033ec9473db2b8325d8a54c2f7c4e6', 5, '2026-09-29 15:02:52', '2026-09-29 14:02:52'),
(40, '10407062154a615ca03f4a30c4fc6dfc1c9885091cdc5e38bfe5b9abba384709', 5, '2026-09-29 15:10:06', '2026-09-29 14:10:06'),
(41, 'a36e6ea5296c51e9f926cd0b66de3a12ac621c0911a856781958d913ef8f469b', 5, '2026-09-29 15:14:46', '2026-09-29 14:14:46'),
(42, '5439e781d3ff641e459f3933d52c8778bff1e9dd63badc57eb30f7dd0885b5bf', 5, '2026-09-29 15:25:35', '2026-09-29 14:25:35'),
(43, '1ca8210a652b0f5499a03062a158ee4a7ab133e6a040db38a59dcc5137c46746', 5, '2026-09-29 15:41:49', '2026-09-29 14:41:49'),
(44, 'f3e7bc41510e71f8584982426d51f97404bcc2af47180cb87d9e7c866e5d53ed', 5, '2026-09-29 16:07:12', '2026-09-29 15:07:12'),
(45, '4ec23cecad666c71b64e1ac882007201dd4fecbc56b55e1c139ae4caca23887a', 5, '2026-09-29 16:12:44', '2026-09-29 15:12:44'),
(46, 'baf06f27d5a767170a53562d1b9628c21c6927c6572dc9ae7418243ec17ff3db', 5, '2026-09-30 09:50:47', '2026-09-30 08:50:47'),
(47, 'ff5c9c46c3da24dd01fadd1b3b6da4fd86fe6fb75cebd67a64cc22e4000c7ad5', 5, '2026-09-30 10:43:35', '2026-09-30 09:43:35'),
(48, 'edc184b25338164097f9d018bc819165357b1bad0022da3e998476ad511ed54e', 5, '2026-09-30 10:53:27', '2026-09-30 09:53:27'),
(49, '6a51bfc099931919b236741ec4e04a7e0ee84c16cf8af4e027ac79e7e1b79744', 5, '2026-10-01 10:52:45', '2026-10-01 09:52:45'),
(50, '31131ebf3feedfa188272b6d92bbb7a23374864f21fbfd9d224984c60b781b2e', 5, '2026-10-01 11:04:22', '2026-10-01 10:04:22'),
(51, 'b75ed68362b83b31b0518bc2293b5bdd00223e070962a0411f6f6cf8e1d9a14d', 5, '2026-10-01 11:46:39', '2026-10-01 10:46:39'),
(52, '015e1f156bbda85bc37a7b3b7adf64b1be488d1e70e79b9d472bfec75c7b5a67', 5, '2026-10-01 14:35:17', '2026-10-01 13:35:17'),
(53, 'df8020db0f9a94b3f9c416a2bff2e7a14e43f59b0d5aa5f2ef48f02ec7a47ef2', 5, '2026-10-02 11:00:28', '2026-10-02 10:00:28'),
(54, 'd898d8bd195d5be41744509a76ae83e17c0458e0ddef4821b520dc74a66925cf', 5, '2026-10-03 23:26:11', '2026-10-03 22:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `icon`, `description`, `image`, `image2`, `image3`, `link`, `sort_order`) VALUES
(1, 'Kusuma Agrowisata', 'leaf', 'Wisata petik apel, jeruk, strawberry & sayur hidroponik langsung dari kebun.', 'Upload/company/1789958578_c9034088d4fdb0f2ef28.jpeg', NULL, NULL, 'https://agrowisata.id/', 1),
(2, 'Kusuma Hotel & Resort', 'bed', 'Resort & Convention Hotel dengan 152 kamar bernuansa kebun apel.', 'Upload/company/1789977412_d1679756c2fa061d9c98.jpeg', NULL, NULL, 'https://www.kusuma-hotel.com/', 2),
(3, 'Kusuma Estate', 'home', 'Kawasan hunian asri berkontur perbukitan di Kota Batu.', 'Upload/company/1789977121_e171833a764d5eb3acfb.jpeg', NULL, NULL, 'https://estate.kusuma.id/', 3),
(4, 'Kusuma Agro Industri', 'factory', 'Produk olahan Apel seperti Siiplah, Siipzy, Cuka Apel, serta juga ada Qirancis, Siiplah amdk, dan Selai Kusuma.', 'Upload/company/1789965866_c7172f2cd82bad776179.jpg', NULL, NULL, 'https://industri.kusuma.id/', 4);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `zone` varchar(150) DEFAULT NULL,
  `capacity` varchar(50) DEFAULT NULL,
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `unit_label` varchar(30) NOT NULL DEFAULT 'Orang',
  `status` enum('available','maintenance') NOT NULL DEFAULT 'available',
  `display_order` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `name`, `zone`, `capacity`, `price`, `unit_label`, `status`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Paintball Combat', NULL, 'Min. 20 Orang', 180000, 'Orang', 'available', 1, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(2, 'Air Softgun Battle', NULL, 'Min. 10 Orang', 120000, 'Orang', 'available', 2, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(3, 'Flying Fox', NULL, 'Per Orang', 20000, 'Orang', 'available', 3, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(4, 'Mobil Komodo (ATV Mini Off-Road)', NULL, 'Per Unit / 2 Putaran', 100000, 'Unit', 'available', 4, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(5, 'Motor Cross Funride', NULL, 'Per Orang', 50000, 'Orang', 'available', 5, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(6, 'Pony Horse Ride', NULL, 'Per Orang', 10000, 'Orang', 'available', 6, '2026-08-24 09:12:55', '2026-08-24 09:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `fnb_menu_items`
--

CREATE TABLE `fnb_menu_items` (
  `id` int UNSIGNED NOT NULL,
  `venue` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `session` varchar(20) DEFAULT NULL,
  `badge` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `stock` int UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('available','seasonal','out-of-stock') NOT NULL DEFAULT 'available',
  `is_promo` tinyint(1) NOT NULL DEFAULT '0',
  `is_low_stock` tinyint(1) NOT NULL DEFAULT '0',
  `today_sold` int UNSIGNED NOT NULL DEFAULT '0',
  `display_order` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fnb_menu_items`
--

INSERT INTO `fnb_menu_items` (`id`, `venue`, `name`, `desc`, `category`, `session`, `badge`, `image_url`, `price`, `stock`, `status`, `is_promo`, `is_low_stock`, `today_sold`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'apple-house', 'Signature Apple Pie', 'Pai renyah isi selai apel Batu kayu manis hangat disajikan dengan es krim vanila.', 'FOOD', NULL, NULL, NULL, 35000, 40, 'available', 1, 0, 20, 1, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(2, 'apple-house', 'Fresh Apple Juice', '100% perasan murni buah apel segar alami pilihan langsung dari pohon kebun.', 'BEVERAGE', NULL, NULL, NULL, 22000, 100, 'available', 0, 0, 35, 2, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(3, 'strawberry-house', 'Strawberry Premium Pancake', 'Pancake lembut hangat berlapis krim dengan limpahan saus strawberry segar.', 'FOOD', NULL, NULL, NULL, 38000, 30, 'available', 1, 0, 18, 1, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(4, 'strawberry-house', 'Strawberry Creamy Milkshake', 'Perpaduan susu segar pilihan, es krim vanilla, dan potongan buah strawberry ranum.', 'BEVERAGE', NULL, NULL, NULL, 25000, 60, 'available', 0, 0, 24, 2, '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(5, 'apple-house', 'Apple Cinnamon Porridge', 'Oatmeal hangat dimasak dengan kayu manis, disajikan dengan potongan apel segar dan madu.', 'FOOD', NULL, NULL, NULL, 38000, 25, 'available', 0, 0, 12, 3, '2026-08-24 09:14:31', '2026-08-24 09:14:31'),
(6, 'apple-house', 'Apple Cider Latte', 'Espresso dipadukan dengan sari apel hangat dan susu creamy, ditaburi kayu manis bubuk.', 'BEVERAGE', NULL, NULL, NULL, 28000, 18, 'available', 1, 1, 15, 4, '2026-08-24 09:15:51', '2026-08-24 09:15:51'),
(7, 'strawberry-house', 'Strawberry Chicken Salad', 'Salad segar dengan potongan ayam panggang, strawberry, dan dressing madu-lemon.', 'FOOD', NULL, NULL, NULL, 42000, 20, 'available', 0, 0, 9, 3, '2026-08-24 09:15:51', '2026-08-24 09:15:51'),
(8, 'strawberry-house', 'Strawberry Iced Tea', 'Teh hitam dingin dengan sirup strawberry alami dan potongan buah segar.', 'BEVERAGE', NULL, NULL, NULL, 20000, 45, 'available', 0, 0, 22, 4, '2026-08-24 09:15:51', '2026-08-24 09:15:51'),
(11, 'thana', 'Americano', 'Espresso & Water', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/ab480ce067113522f8c64aa26b59d8d5.jpeg', 25000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:20:23', '2026-09-30 15:26:53'),
(12, 'thana', 'Cappucino', 'Espresso & Milk', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/02a198f88a835072f28d7d22f2fc2cdc.jpeg', 25000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:21:11', '2026-09-30 15:27:07'),
(13, 'thana', 'Caramel Latte', 'Espresso, caramel syrup, milk & creamer', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/79136e360ca1cb875bc24d09d3101e30.jpeg', 28000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:22:13', '2026-09-30 15:27:19'),
(14, 'thana', 'Kopi Tubruk', 'Ground coffee & water', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/ae8cb8aaa818135bced1a2b72e51108c.jpeg', 15000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:23:04', '2026-09-30 15:27:29'),
(15, 'thana', 'Matcha', 'Matcha powder, milk & creamer', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/adac4cd1432fd1b0f11a9e86673e0fba.jpeg', 35000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:24:20', '2026-09-30 15:27:40'),
(16, 'thana', 'Chocolate', 'Chocolate powder, milk & creamer', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/a1a4872bd021f6eae8b3232e98d92213.jpeg', 35000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:25:13', '2026-09-30 15:27:52'),
(17, 'thana', 'Thai Tea', 'Thai tea condiment & condensed milk', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/bb635ddf0bb0412d8b60a35787b804e2.jpeg', 25000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:26:31', '2026-09-30 15:28:04'),
(18, 'thana', 'Chamomile', 'Caffeine free tea', 'DRINK', 'sunrise', NULL, 'http://localhost/kusuma-agro-backend/uploads/efa243c7ad48e244a55673cc23822d84.jpeg', 28000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:29:02', '2026-09-30 15:29:02'),
(19, 'thana', 'Americano', 'Espresso & Water', 'DRINK', 'sunset', NULL, 'http://localhost/kusuma-agro-backend/uploads/6e901b627051ad1f95fb7a6eb7846b20.jpeg', 25000, 50, 'available', 0, 0, 0, 0, '2026-09-30 15:31:25', '2026-09-30 15:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_photos`
--

CREATE TABLE `gallery_photos` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gallery_photos`
--

INSERT INTO `gallery_photos` (`id`, `image`, `caption`, `sort_order`) VALUES
(2, 'Upload/galerry/1789960053_f2ca2133a0775e6ee1ce.jpeg', 'Rasakan sensasi petik melon langsung dari pohonnya', 2),
(3, 'Upload/galerry/1789960072_17703d9154817f9cb357.jpeg', 'Seluncuran favorit anak-anak', 3),
(4, 'Upload/galerry/1789960091_ad86b2bb7927ecf70d37.jpeg', 'Glamping nyaman berpemandangan gunung', 4),
(5, 'Upload/galerry/1791424403_b45a0963bd0497138f56.jpeg', 'Produk olahan apel Siiplah', 5),
(6, 'Upload/galerry/1789960120_badaac00176785a3fbfb.jpeg', 'Sore hari di Playground Kusuma Agrowisata', 6),
(7, 'Upload/galerry/1789961430_88891cdf6ac4ef549226.jpeg', 'Nikmati Senja & Gemerlap Malam dari Ketinggian', 7);

-- --------------------------------------------------------

--
-- Table structure for table `harvest_schedules`
--

CREATE TABLE `harvest_schedules` (
  `id` int UNSIGNED NOT NULL,
  `fruit_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `harvest_schedules`
--

INSERT INTO `harvest_schedules` (`id`, `fruit_name`, `start_date`, `end_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Apel Manalagi', '2026-06-01', '2026-08-31', 'Panen raya kebun blok A', '2026-08-24 09:12:55', '2026-08-24 09:12:55'),
(2, 'Strawberry', '2026-05-01', '2026-09-30', 'Panen berkelanjutan sepanjang musim kemarau', '2026-08-24 09:12:55', '2026-08-24 09:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `hero_slides`
--

CREATE TABLE `hero_slides` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `eyebrow` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` text,
  `cta_text` varchar(255) DEFAULT NULL,
  `cta_link` varchar(255) DEFAULT NULL,
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hero_slides`
--

INSERT INTO `hero_slides` (`id`, `image`, `eyebrow`, `title`, `subtitle`, `cta_text`, `cta_link`, `sort_order`) VALUES
(1, 'Upload/hero/1789958507_c888a5d9d375047628c9.jpeg', 'Sejak 1989', 'Satu Grup, Empat Unit Usaha untuk Destinasi Wisata Anda', 'Berawal dari kebun Apel seluas 1,8 hektar pada tahun 1989, Kusuma Agrowisata Group kini menaungi wisata berbasis agrowisata, Hotel & Resort, perumahan, dan industri olahan.', 'Kenali Unit Usaha Kami', '#companies', 1),
(2, 'Upload/hero/1789958381_1ae39cb7be8f876774f1.jpeg', 'Menginap Nyaman', 'Resort & Convention Hotel di Ketinggian 1000 Mdpl', '152 kamar dan cottage asri yang dikelilingi kebun apel dan buah lainnya, kolam renang, serta udara pegunungan yang sejuk sepanjang tahun.', 'Lihat Hotel Kami', '#companies', 2),
(3, 'Upload/hero/1791432554_f06c18a370fdc18faa68.jpg', 'Seru untuk Keluarga', 'Serunya Bermain Air di Kusuma Agrowisata Waterpark', 'Kolam arus, seluncuran, dan kolam anak sebagai pelengkap keseruan setelah puas memetik buah langsung dari pohonnya.', 'Lihat Layanan', '#services', 3),
(4, 'Upload/hero/1789958419_5102c4e0c62fd471e5a5.jpeg', 'Favorit Pengunjung', 'Petik Apel, Jeruk, Jambu, Melon & Strawberry Langsung dari Kebun', 'Lebih dari 10 jenis buah siap dipetik sendiri bersama keluarga, ditemani pemandu ramah kami.', 'Rencanakan Kunjungan', '#contact', 4);

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int UNSIGNED NOT NULL,
  `type` enum('contact','cart_checkout') NOT NULL DEFAULT 'contact',
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` text,
  `items_summary` text,
  `status` enum('new','replied','closed') NOT NULL DEFAULT 'new',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `type`, `name`, `email`, `phone`, `message`, `items_summary`, `status`, `created_at`) VALUES
(1, 'contact', 'Budi Santoso', 'budi@example.com', NULL, 'Halo, apakah tersedia paket untuk rombongan 50 orang di bulan depan?', NULL, 'new', '2026-08-24 09:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `ops_stats`
--

CREATE TABLE `ops_stats` (
  `id` int UNSIGNED NOT NULL,
  `daily_group_target` int UNSIGNED NOT NULL DEFAULT '8',
  `staff_on_site` int UNSIGNED NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ops_stats`
--

INSERT INTO `ops_stats` (`id`, `daily_group_target`, `staff_on_site`, `updated_at`) VALUES
(1, 8, 18, '2026-08-24 09:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `outbound_categories`
--

CREATE TABLE `outbound_categories` (
  `id` int UNSIGNED NOT NULL,
  `package_id` int UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `col1_label` varchar(50) NOT NULL DEFAULT 'Nama Game',
  `col2_label` varchar(50) NOT NULL DEFAULT 'Learning & Goal',
  `col3_label` varchar(50) NOT NULL DEFAULT 'Durasi',
  `col4_label` varchar(50) NOT NULL DEFAULT 'Keterangan',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `outbound_categories`
--

INSERT INTO `outbound_categories` (`id`, `package_id`, `title`, `col1_label`, `col2_label`, `col3_label`, `col4_label`, `sort_order`) VALUES
(1, 1, 'A. Ice Breaking', 'Nama Game & Deskripsi', 'Learning & Goal', 'Durasi', 'Keterangan Tambahan', 0),
(2, 1, 'B. Outbound Games', 'Nama Game & Deskripsi', 'Learning & Goal', 'Durasi', 'Keterangan Tambahan', 1),
(3, 2, 'Rangkaian Game', 'Nama Game & Deskripsi', 'Learning & Goal', 'Durasi / Keterangan', 'Keterangan', 0),
(4, 3, 'A. Ice Breaking', 'Nama Game', 'Learning & Goal', 'Durasi', 'Penjelasan Tambahan', 0),
(5, 3, 'B. Game', 'Nama Game & Deskripsi Singkat', 'Learning & Goal', 'Durasi', 'Keterangan Tambahan', 1),
(6, 3, 'C. Highropes Game', 'Nama Wahana', 'Learning & Goal', 'Durasi', 'Keterangan Tambahan', 2),
(7, 3, 'D. Alternative Game', 'Nama Wahana Pilihan / Substitusi', 'Learning & Goal', 'Durasi', 'Keterangan Tambahan', 3);

-- --------------------------------------------------------

--
-- Table structure for table `outbound_category_rows`
--

CREATE TABLE `outbound_category_rows` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `col1` varchar(150) DEFAULT NULL,
  `col2` text,
  `col3` varchar(100) DEFAULT NULL,
  `col4` text,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `outbound_category_rows`
--

INSERT INTO `outbound_category_rows` (`id`, `category_id`, `col1`, `col2`, `col3`, `col4`, `sort_order`) VALUES
(1, 1, 'Chicken Dance Brands Game: Membuat lingkaran besar lalu menggoyang-goyang pinggulnya sesuai perintah instruktur.', 'Team work, decision making', '┬▒30 Menit', 'Pencairan suasana awal tim (60 pax)', 0),
(2, 1, 'People to People: Mencari pasangan masing-masing sambil berpegangan sesuai dengan hitungan instruktur.', 'Ketahanan terhadap stretching', '┬▒45 Menit', 'Membangun keakraban & adaptasi kilat', 1),
(3, 1, 'Opposite: Gerakan bersama-sama dengan satu team dengan hitungan lawan kata yang sebenarnya.', 'Team Work, Strategy, Group Strategy, Planning dan strategy', '┬▒30 Menit', 'Melatih konsentrasi tingkat tinggi', 2),
(4, 2, 'Traffic Jam: Berpindah dari satu sisi ke sisi yang lain sesuai dengan instruksi.', 'Menumbuhkan jiwa leadership', '┬▒60 Menit', 'Kriteria Peserta: Company, Instansi, Corporate', 0),
(5, 2, 'Ufo Alien: Memindahkan bola diatas nampan dari satu ke tempat lain.', 'Kekompakan dan konsentrasi team', '┬▒45 Menit', 'Kriteria Peserta: Company, Instansi, Corporate', 1),
(6, 2, 'Water Tower: Berusaha mengisi air dalam drum, yang terdapat lubang lubang kecil hingga penuh.', 'Kekompakan dan konsentrasi team', '┬▒60 Menit', 'Kriteria Peserta: Company, Instansi, Corporate', 2),
(7, 2, 'Helium Stick: Mengikuti ritme naik dan turunnya bambu dengan menggunakan jari telunjuk tiap peserta secara bersamaan.', 'Team work, strategy', '┬▒30 Menit', 'Kriteria Peserta: Company, Instansi, Corporate', 3),
(8, 3, 'Ball n Pipe: Memindahkan bola pingpong dengan menggunakan paralon dari satu tempat ke tempat yang lain.', 'Team work, tanggung jawab', 'Outbound ┬▒4 Jam / 60 pax', '', 0),
(9, 3, 'Labirin: Berusaha memasukkan bola pada sebuah lubang.', 'Leadership, kekompakan inisiatif', 'Outbound + makan + wisata + ┬▒6 jam', '', 1),
(10, 3, 'Flying Fox: Meluncur dengan tali dari ketinggian 8 meter dan panjang 100 m.', 'Melatih keberanian menguji adrenalin', 'Termasuk dalam rangkaian paket', '', 2),
(11, 3, 'Sharing game outbound: Sharing hasil outbound dengan peserta.', 'Evaluasi & Internalisasi nilai kelompok', 'Participant: SMP dan SMA', '', 3),
(12, 4, 'Chicken Dance', 'Mencairkan suasana awal anak-anak', '┬▒15 Menit', 'Game ini untuk mencairkan suasana dan membangun interaksi peserta dengan peserta juga dengan fasilitator.', 0),
(13, 4, 'People to people', 'Melatih komunikasi antar teman sebaya', '┬▒20 Menit', 'Diharapkan bisa terjadi hubungan aktif antara anak dan instruktur.', 1),
(14, 4, 'Dance Gorilla', 'Melatih motorik kasar dan ketangkasan fisik anak', '┬▒15 Menit', 'Game ini untuk mencairkan suasana dan membangun interaksi peserta dengan peserta juga dengan fasilitator.', 2),
(15, 4, 'Brands Game', 'Melatih fokus indra pendengaran anak', '┬▒20 Menit', 'Diharapkan bisa terjadi hubungan aktif antara anak dan instruktur.', 3),
(16, 5, 'Ufo Alien: Memindahkan bola diatas nampan dari satu tempat ke tempat lain.', 'Melatih Konsentrasi', '┬▒30 Menit', 'Media ramah anak (bola ringan)', 0),
(17, 5, 'Ball and Pipe: Memindahkan bola pingpong dengan menggunakan paralon dari satu tempat ke tempat lain.', 'Tanggung Jawab', '┬▒30 Menit', 'Melatih kesabaran antrean kelompok', 1),
(18, 5, 'Labirin: Berusaha memasukkan bola pada sebuah lubang.', 'Leadership Inisiatif', '┬▒25 Menit', 'Melatih arah komunikasi verbal anak', 2),
(19, 5, 'Mini Water Tower: Berusaha mengisi air dalam paralon yang terdapat lubang-lubang kecil hingga penuh.', 'Totalitas Strategi', '┬▒40 Menit', 'Disarankan membawa pakaian ganti', 3),
(20, 6, 'Burma V', 'Melatih keberanian menguji adrenalin anak sejak dini', 'Sesuai Alur Antrean', 'Bermain ketangkasan di atas ketinggian menggunakan alat pengaman full body harness standar keselamatan internasional.', 0),
(21, 6, 'Bridge Wood', 'Melatih keberanian menguji adrenalin anak sejak dini', 'Sesuai Alur Antrean', 'Bermain ketangkasan di atas ketinggian menggunakan alat pengaman full body harness standar keselamatan internasional.', 1),
(22, 6, 'Flying Fox', 'Melatih keberanian menguji adrenalin anak sejak dini', 'Sesuai Alur Antrean', 'Bermain ketangkasan di atas ketinggian menggunakan alat pengaman full body harness standar keselamatan internasional.', 2),
(23, 7, 'Ball Transfer', 'Melatih keberanian menguji adrenalin serta adaptasi alami anak', '┬▒30 Menit', 'Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.', 0),
(24, 7, 'Redmood Ring', 'Melatih keberanian menguji adrenalin serta adaptasi alami anak', '┬▒25 Menit', 'Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.', 1),
(25, 7, 'Jagur', 'Melatih keberanian menguji adrenalin serta adaptasi alami anak', '┬▒20 Menit', 'Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.', 2),
(26, 7, 'Tangkap Ikan', 'Melatih keberanian menguji adrenalin serta adaptasi alami anak', '┬▒45 Menit', 'Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.', 3),
(27, 7, 'Tanam Strawberry', 'Melatih keberanian menguji adrenalin serta adaptasi alami anak', '┬▒40 Menit', 'Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `outbound_packages`
--

CREATE TABLE `outbound_packages` (
  `id` int UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `short_desc` text,
  `facilities_note` text,
  `min_pax_note` varchar(50) DEFAULT NULL,
  `duration_note` varchar(50) DEFAULT NULL,
  `cart_subtitle` varchar(150) DEFAULT NULL,
  `display_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `outbound_packages`
--

INSERT INTO `outbound_packages` (`id`, `slug`, `name`, `short_desc`, `facilities_note`, `min_pax_note`, `duration_note`, `cart_subtitle`, `display_order`) VALUES
(1, 'ob-modal-adult', 'Outbound Dewasa', 'Program interaktif guna mempererat kerja sama kelompok, kepemimpinan, dan komunikasi efektif melalui simulasi problem solving terpandu di alam bebas.', 'Wisata petik 2 Apel/Jambu, Juice, Snack Box, Lunch Box, Mineral Water, Adventure.', 'Kapasitas Minimum: 30 Orang', '┬▒4-6 Jam', 'Paket Terpadu (Min. 30 Orang)', 1),
(2, 'ob-modal-students', 'Outbound SMP & SMA', 'Dirancang untuk menumbuhkan jiwa kepemimpinan individu, kemandirian siswa, rasa tanggung jawab sosial, serta keberanian mengambil keputusan positif.', 'Wisata petik 2 Apel/Jambu, Juice, Lunch Box, Mineral Water, Waterpark, Adventure.', 'Kapasitas Minimum: 30 Siswa', '┬▒4-6 Jam', 'Paket Sekolah (Min. 30 Siswa)', 2),
(3, 'ob-modal-kids', 'Outbound Kids (TK & SD)', 'Eksplorasi ceria motorik anak usia dini melalui pengenalan alam luar ruangan, ketangkasan fisik ringan, serta edukasi budidaya tanaman hortikultura.', 'Wisata petik 2 Apel/Jambu, Juice, Lunch Box, Mineral Water, Waterpark, Adventure.', 'Kapasitas Minimum: 30 Anak', '3 - 4 Jam', 'Paket Anak (Min. 30 Anak)', 3);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `short_desc` text,
  `badge` varchar(50) DEFAULT NULL,
  `effective_date` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `cart_subtitle` varchar(150) DEFAULT NULL,
  `min_pax_note` varchar(50) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `col1_label` varchar(50) NOT NULL DEFAULT 'Package',
  `col2_label` varchar(50) NOT NULL DEFAULT 'Facility',
  `col3_label` varchar(50) NOT NULL DEFAULT 'Rate',
  `col4_label` varchar(50) NOT NULL DEFAULT 'Information',
  `display_order` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `slug`, `short_desc`, `badge`, `effective_date`, `image_url`, `cart_subtitle`, `min_pax_note`, `is_featured`, `col1_label`, `col2_label`, `col3_label`, `col4_label`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'Wisata Petik Buah', 'detail-buah', 'Jelajahi kawasan kebun buah yang luas dan sejuk di tengah indahnya alam pegunungan Kota Batu. Rasakan manis dan renyahnya buah yang Anda petik sendiri langsung dari pohonnya, menciptakan momen liburan unik yang berkesan dan tak terlupakan.', 'Best Seller', '1 Juni 2016', 'http://localhost/kusuma-agro-backend/uploads/40d7e4303492325f44ce0a04e5ac451d.jpeg', 'Paket Kebun Apel Signature', NULL, 1, 'Package', 'Facility', 'Weekday', 'Weekend', 1, '2026-08-24 09:12:53', '2026-09-28 16:35:22'),
(2, 'Thana Nature Eatery', 'detail-Thana', 'Lengkapi momen sunrice dan sunsetmu dengan sajian lezat dan pemandangan city light yang memukau. Yuk, agendakan kunjunganmu sekarang!', NULL, '1 Januari 2015', 'http://kusuma-agro-backend.test/uploads/d21983302595dfe2eec803399e610171.jpeg', 'Paket Thana Nature Eatery', NULL, 0, 'Package', 'Facility', 'Weekday', 'Weekend', 2, '2026-08-24 09:12:53', '2026-09-23 14:05:18'),
(3, 'Playground', 'detail-playground', 'Rancang momen tumbuh kembang anak melalui aktivitas fisik yang seru, melatih motorik, dan mengasah kemampuan untuk berinteraksi di playground kleine Holland!', NULL, '1 Januari 2015', 'http://kusuma-agro-backend.test/uploads/cd9b5d5d39b2b353ca9f87723baba372.jpeg', 'Playground Kleine Holland', NULL, 0, 'Harga Tiket', 'Facility', 'Weekday', 'Weekend', 3, '2026-08-24 09:12:53', '2026-09-23 14:18:35'),
(4, 'Glamping', 'detail-glamping', 'Tinggalkan riuk pikuk kota dan rasakan ketenangan glamping eksklusif di Kusuma Agrowisata. Momen sempurna untuk chill, menikmati BBQ hangat, dan menciptakan kenangan tak terlupakan.', NULL, '1 Januari 2016', 'http://localhost/kusuma-agro-backend/uploads/c7c554ebcde64ad5ff66daaed9607ed7.jpeg', 'Glamping', NULL, 0, 'Type', 'Facility', 'Harga', 'Check in - Check Out', 4, '2026-08-24 09:12:53', '2026-09-30 09:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `package_images`
--

CREATE TABLE `package_images` (
  `id` int UNSIGNED NOT NULL,
  `package_id` int UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package_price_rows`
--

CREATE TABLE `package_price_rows` (
  `id` int UNSIGNED NOT NULL,
  `package_id` int UNSIGNED NOT NULL,
  `col1` varchar(150) DEFAULT NULL,
  `col2` text,
  `col3` varchar(100) DEFAULT NULL,
  `col4` varchar(100) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `package_price_rows`
--

INSERT INTO `package_price_rows` (`id`, `package_id`, `col1`, `col2`, `col3`, `col4`, `sort_order`) VALUES
(14, 2, 'Paket Reguler 25k Sunrise', 'Kursi & meja minimum order 25k/pax dapat memilih paket sesuai menu', 'Hubungi Kami', 'Hubungi Kami', 0),
(15, 2, 'Paket Reguler 50k Sunset', 'Kursi & meja minimum order 50k/pax dapat memilih paket sesuai menu', 'Hubungi Kami', 'Hubungi Kami', 1),
(16, 2, 'Paket Flysheet 700K', 'Termasuk 1 Flysheet, lampu, meja, kursi, grill,suki, nasi putih, sayuran, sosis, bawang bombay, minyak sayur dan peralatan memasak. Kapasitas 5 orang - max 8 orang', 'Hubungi Kami', 'Hubungi Kami', 2),
(17, 3, 'Rp 15.000', 'Arena berain outdoor yang luas dilengkapi dengan berbagai macam permainan', '08:00-20:00', '08:00-20:00', 0),
(25, 1, 'Paket Apel', 'Wisata petik 2 apel / jeruk / strw, petik 2 jambu, polo pendem, jus buah, yogurt.', 'Hubungi Kami', 'Hubungi Kami', 0),
(26, 4, 'Gatchi', 'Nikmati kenyamanan menginap di tenda Naturehike berkapasitas 2–3 orang yang sudah dilengkapi set aksesoris estetik, kasur busa empuk, sprei, 2 bantal, selimut hangat, serta lampu tenda. Di area luar, tersedia area bersantai dengan 2 kursi, meja lipat, perlindungan flysheet, lampu gantung, serta peralatan masak lengkap mulai dari kompor portable, gas, rak, hingga set alat makan. Pengalaman menginap makin berkesan dengan sajian Dinner Grill berisi 250 gram daging sapi premium lengkap bersama bumbu dan 3 botol air mineral. Seluruh kebutuhan Anda terpenuhi lewat fasilitas kenyamanan seperti akses listrik, area parkir, kamar mandi air hangat, hingga akses rekreasi ke Waterpark dan spot foto Kleine Holland.', 'Rp 650.000', '14:00-10:00 WIB', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_events`
--

CREATE TABLE `schedule_events` (
  `id` int UNSIGNED NOT NULL,
  `event_date` date DEFAULT NULL,
  `time_label` varchar(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `color` varchar(20) DEFAULT '',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `schedule_events`
--

INSERT INTO `schedule_events` (`id`, `event_date`, `time_label`, `title`, `sub`, `color`, `created_at`) VALUES
(1, '2026-08-24', '09:00 AM', 'Corporate Outbound - PT Mitra Jaya', '45 Pax ÔÇó Paintball & ATV', 'c-green', '2026-08-24 09:12:53'),
(2, '2026-08-24', '01:30 PM', 'Family Gathering - Grup B', '20 Pax ÔÇó Flying Fox & Lunch', '', '2026-08-24 09:12:53'),
(3, '2026-08-24', '03:00 PM', 'Study Tour SMA Harapan', '120 Pax ÔÇó Full Facility Circuit', 'c-red', '2026-08-24 09:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `icon`, `description`, `image1`, `image2`, `image3`, `sort_order`) VALUES
(1, 'Area & Pemandangan', 'camera', 'Berada di lokasi terbaik Kota Batu, area luas di lereng Gunung Panderman dengan udara sejuk sepanjang hari.', 'Upload/service/1789962880_d1f55d51c0908016b581.jpeg', 'Upload/service/1789958680_f53f86775bee44baa134.jpeg', 'Upload/service/1789958680_62f157cc0041330b6aea.jpeg', 1),
(2, 'Waterpark', 'waves', 'Kolam arus, seluncuran, dan kolam anak untuk keseruan seluruh keluarga.', 'Upload/service/1789962905_ca2fcdc5a565400f3c31.jpeg', 'https://picsum.photos/seed/waterpark-2/1200/800', 'https://picsum.photos/seed/waterpark-3/1200/800', 2),
(9, 'Petik Buah', 'apple', 'Lebih dari 10 jenis buah di kebun kami, siap dipetik langsung oleh Anda dan keluarga.', 'Upload/service/1789962933_dc1dd040cb30fc5e1fcc.jpeg', 'https://picsum.photos/seed/petik-2/1200/800', 'https://picsum.photos/seed/petik-3/1200/800', 3),
(10, 'Produk oleh-oleh', 'drink', 'Menyediakan berbagai minuman rasa buah Siiplah dan banyak produk pilihan lainnya seperti Qrancis snack, Cuka Apel, Selai buah, dan air mineral. Juga hadir Siipzy sebagai produk terbaru', 'Upload/service/1791424382_dbca73fdd3d65ebc7dc3.jpeg', 'https://picsum.photos/seed/kuliner-2/1200/800', 'https://picsum.photos/seed/kuliner-3/1200/800', 4),
(11, 'Perumahan', 'villa', 'Hunian terbaik di Kota Batu, siap ditempati dengan udara sejuk dan pemandangan pegunungan.', 'Upload/service/1789977053_3f353a80e2f0d6fa1b40.jpeg', 'https://picsum.photos/seed/villa-2/1200/800', 'https://picsum.photos/seed/villa-3/1200/800', 5),
(12, 'Party, Event & Wedding', 'party', 'Lapangan, Camp Ground, kolam renang dan various area untuk mewujudkan acara Anda jadi sukses dan berkesan.', 'Upload/service/1789976858_42182c1cd1b893540986.jpeg', 'https://picsum.photos/seed/event-2/1200/800', 'https://picsum.photos/seed/event-3/1200/800', 6);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `email_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `currency` varchar(10) NOT NULL DEFAULT 'IDR',
  `decimal_places` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `maintenance_mode`, `email_notifications`, `currency`, `decimal_places`, `updated_at`) VALUES
(1, 0, 1, 'IDR', 0, '2026-08-24 09:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `signature_price_rows`
--

CREATE TABLE `signature_price_rows` (
  `id` int UNSIGNED NOT NULL,
  `signature_product_id` int UNSIGNED NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `facility_desc` text,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `signature_price_rows`
--

INSERT INTO `signature_price_rows` (`id`, `signature_product_id`, `item_name`, `price`, `facility_desc`, `sort_order`) VALUES
(84, 1, 'Tiket Masuk', 25000, 'Fasilitas : Waterpark & Kleine Holland', 0),
(85, 1, 'Paket Petik Dahsyat 1', 30000, 'Fasilitas : Petik Buah Jambu/ Buah Jeruk/ Buah Naga, Kleine Holland', 1),
(86, 1, 'Paket Petik Dahsyat 2', 35000, 'Fasilitas : Petik Buah Apel/ Buah Strawberry/ Buah Melon, Kleine Holland', 2),
(87, 1, 'Tiket Terusan', 50000, 'Fasilitas : Petik Buah Apel/ Buah Strawberry/ Buah Melon, Kleine Holland, Waterpark, Animal Feeding', 3);

-- --------------------------------------------------------

--
-- Table structure for table `signature_products`
--

CREATE TABLE `signature_products` (
  `id` int UNSIGNED NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `badge` varchar(50) DEFAULT NULL,
  `effective_date` varchar(50) DEFAULT NULL,
  `operating_hours_text` varchar(150) DEFAULT 'Buka Setiap Hari (08:00 - 16:00 WIB)',
  `image_url` varchar(255) DEFAULT NULL,
  `short_desc` text,
  `detail_info` text,
  `detail_image_url` varchar(255) DEFAULT NULL,
  `price` int UNSIGNED NOT NULL DEFAULT '0',
  `link_url` varchar(255) DEFAULT NULL,
  `cart_subtitle` varchar(150) DEFAULT NULL,
  `min_pax_note` varchar(50) DEFAULT NULL,
  `display_order` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `signature_products`
--

INSERT INTO `signature_products` (`id`, `slug`, `name`, `badge`, `effective_date`, `operating_hours_text`, `image_url`, `short_desc`, `detail_info`, `detail_image_url`, `price`, `link_url`, `cart_subtitle`, `min_pax_note`, `display_order`, `created_at`, `updated_at`) VALUES
(1, 'signature-1', 'Paket Perjusa', 'New', NULL, 'Buka Setiap Hari (08:00 - 16:00 WIB)', 'http://localhost/kusuma-agro-backend/uploads/ee159c34d6088c3107d3e996d5ee0ff0.jpeg', 'Nikmati keseruan berkemah bersama di Bumi Perkemahan Kusuma Agrowisata dengan Paket Perjusa (minimal 30 orang)! Hanya Rp20.000/orang, Anda sudah mendapatkan fasilitas area kegiatan (venue), akses listrik standar, kamar mandi, hingga free api unggun untuk menghangatkan suasana malam perkemahan.', 'Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.', NULL, 20000, '#', NULL, NULL, 1, '2026-08-24 09:12:54', '2026-10-01 10:51:46'),
(2, 'signature-2', 'Paket Outbound', 'Best Seller', NULL, 'Buka Setiap Hari (08:00 - 16:00 WIB)', 'http://localhost/kusuma-agro-backend/uploads/1fe21eba98ac0d79846b636646734e95.jpeg', 'Nikmati keseruan beraktivitas outdoor lewat Outbound Package Kusuma Agrowisata (minimal 30 pax)! Dirancang khusus untuk melatih kerja sama, ketangkasan, dan kebersamaan dengan berbagai pilihan paket: Outbound Kids Super (PAUD–TK, Rp120.000), Outbound Teen Super (SD, Rp140.000), Outbound Dewasa Super (SMP ke atas, Rp155.000), serta Fun Games (Rp100.000) dengan durasi permainan 1,5 hingga 3 jam.', 'Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.', NULL, 120000, '#', NULL, NULL, 2, '2026-08-24 09:12:54', '2026-10-01 10:53:15'),
(3, 'signature-3', 'Paket Edukasi', 'Favorit', NULL, 'Buka Setiap Hari (08:00 - 16:00 WIB)', 'http://localhost/kusuma-agro-backend/uploads/77563d0b817f1f343e4bad405ceb4610.jpeg', 'Kombinasikan momen belajar dan berwisata seru di Kusuma Agrowisata lewat Paket Edukasi seharga Rp90.000/pax (minimal 30 pax)! Pilih program favoritmu mulai dari Kunjungan Industri, Budidaya Tanaman (Melon & Strawberry), Kreasi Masa Kini (pilihan materi sabun/lilin/fermentasi/teh kombucha), hingga Cooking Class (pancake/sate buah/dekorasi donat). Setiap paket sudah mencakup fasilitas presentasi/praktik, lunch box, suvenir, hingga akses Wisata Kleine Holland!', 'Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.', NULL, 90000, '#', NULL, NULL, 3, '2026-08-24 09:12:54', '2026-10-01 10:55:36'),
(4, 'signature-4', 'Paket Wisuda', 'Edisi Musim', NULL, 'Buka Setiap Hari (08:00 - 16:00 WIB)', 'http://localhost/kusuma-agro-backend/uploads/c00ef65b38edb90a4971b32171f6bbc6.jpeg', 'Rayakan kelulusan sekolah dengan lebih berkesan lewat Paket Wisuda spesial hanya IDR 140.000 (sudah termasuk untuk Ibu & Anak, min. 30 pax). Dilengkapi fasilitas Hall ber-AC hingga 5 jam, panggung, sound system, photobooth, lunchbox, goodiebag anak, serta bebas rekreasi ke Kleine Holland dan Waterpark!', 'Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.', NULL, 140000, '#', NULL, NULL, 4, '2026-08-24 09:12:54', '2026-09-30 10:37:50'),
(5, 'signature-5', 'Paket Campfun', 'Spesial', NULL, 'Buka Setiap Hari (08:00 - 16:00 WIB)', 'http://localhost/kusuma-agro-backend/uploads/952f0e70e8f0181c5eee1d66529f1c30.jpeg', 'Rasakan keseruan berkemah praktis dan nyaman lewat Paket Special Campfun seharga Rp290.000/pax (berlaku untuk anak dan dewasa, kapasitas maksimal 3 pax/tenda, min. 30 pax)! Tanpa perlu repot membawa perlengkapan, Anda sudah mendapatkan fasilitas tenda lengkap dengan kasur, bantal, selimut, kamar mandi air hangat, sajian dinner box & breakfast box, serta suasana hangatnya api unggun di malam hari.', 'Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.', NULL, 290000, '#', NULL, NULL, 5, '2026-08-24 09:12:54', '2026-10-01 10:55:50'),
(6, 'signature-6', 'Paket Agroventure', 'New', NULL, 'Buka Setiap Hari (08:00 - 16:00 WIB)', 'http://localhost/kusuma-agro-backend/uploads/84b22d9a304d60d191a149beafe09df3.jpeg', 'Pacu adrenalinmu menelusuri keasrian alam Kota Batu lewat Agro Venture seharga Rp750.000/jeep (kapasitas 3 orang)! Nikmati petualangan seru melintasi rute Jalur Perkebunan, Pedesaan, hingga Jalur Offroad menantang. Paket sudah lengkap termasuk perlengkapan keselamatan (helm & jas hujan saat hujan), wisata petik buah, tiket masuk Kleine Holland, serta sajian makan dan minum.', 'Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.', NULL, 750000, '#', NULL, NULL, 6, '2026-08-24 09:12:54', '2026-09-30 10:40:14');

-- --------------------------------------------------------

--
-- Table structure for table `signature_product_images`
--

CREATE TABLE `signature_product_images` (
  `id` int UNSIGNED NOT NULL,
  `signature_product_id` int UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `simple_pages`
--

CREATE TABLE `simple_pages` (
  `id` int UNSIGNED NOT NULL,
  `slug` varchar(50) NOT NULL,
  `hero_title` varchar(200) DEFAULT NULL,
  `hero_sub` text,
  `hero_image` varchar(255) DEFAULT NULL,
  `about_title` varchar(200) DEFAULT NULL,
  `about_image` varchar(255) DEFAULT NULL,
  `about_p1` text,
  `about_p2` text,
  `hours_sunrise_open` varchar(10) DEFAULT NULL,
  `hours_sunrise_close` varchar(10) DEFAULT NULL,
  `hours_sunset_open` varchar(10) DEFAULT NULL,
  `hours_sunset_close` varchar(10) DEFAULT NULL,
  `gallery` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `simple_pages`
--

INSERT INTO `simple_pages` (`id`, `slug`, `hero_title`, `hero_sub`, `hero_image`, `about_title`, `about_image`, `about_p1`, `about_p2`, `hours_sunrise_open`, `hours_sunrise_close`, `hours_sunset_open`, `hours_sunset_close`, `gallery`, `created_at`, `updated_at`) VALUES
(1, 'waterpark', 'Keseruan Wahana Air di Tengah Udara Sejuk Pegunungan', 'Rasakan kesegaran bermain air bersama keluarga lewat ragam seluncuran seru, kolam renang asri, dan wahana permainan air interaktif di Kusuma Waterpark.', 'http://localhost/kusuma-agro-backend/uploads/525bfe6ad9856aaf14b9648bfaf77dae.jpeg', 'Botanical Water Trails', 'https://picsum.photos/seed/waterpark-about/700/600', 'Tulis deskripsi jalur air alami di sini ÔÇö sumber mata air, proses filtrasi alami, atau jalur botani yang bisa dilalui pengunjung.', 'Tambahkan paragraf kedua bila perlu, atau hapus bagian ini kalau tidak dibutuhkan.', NULL, NULL, NULL, NULL, '[\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/5e9b873f106bf7263316ad328ff13721.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/c71a4cd7a668ec35ec2162446677dd6f.jpg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/0dd0c09213c3fad8ade2ac02bbaaa410.jpg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/c9efbada7789e8fbe17a93bee6d85288.jpg\"]', '2026-08-24 09:12:54', '2026-10-01 11:30:35'),
(2, 'thana', 'Kehangatan Cita Rasa di Atas Ketinggian Kota', 'Lepaskan penat dan rasakan pengalaman kuliner outdoor bernuansa alam di kawasan Kusuma Agrowisata. Pilihan sempurna untuk kumpul keluarga, komunitas, maupun momen romantis.', 'http://localhost/kusuma-agro-backend/uploads/71d6230c9e58c879c8282ec97b0292a0.jpeg', 'Judul Section Placeholder', 'https://picsum.photos/seed/thana-about/700/600', 'Tulis deskripsi Thana di sini ÔÇö konsep ruang relaksasi, fasilitas yang tersedia, atau suasana yang ditawarkan.', 'Tambahkan paragraf kedua bila perlu, atau hapus bagian ini kalau tidak dibutuhkan.', '04:30', '10:00', '14:00', '22:00', '[\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/9ecf1e73763026a46b8d008e88459215.jpg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/fce72b5472376ccaa6d5b47c3b22a2da.jpg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/1cd17efaf6d2f39a8c7e5dd37eabc29c.jpg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/356590ea33f2530dbbd5b304955af065.jpg\"]', '2026-08-24 09:12:54', '2026-10-01 11:26:09'),
(3, 'klene-holland', 'Sentuhan Keindahan Eropa dalam Satu Kawasan', 'Lengkapi momen liburan Anda di Kusuma Agrowisata dengan mengunjungi Kleine Holland. Tempat sempurna untuk bersantai, bersua foto, dan menikmati suasana ala Belanda yang autentik.', 'http://localhost/kusuma-agro-backend/uploads/b3a38aa8efb6a338c45b18eb68eb1e7c.jpg', 'Judul Section Placeholder', 'https://picsum.photos/seed/klene-holland-about/700/600', 'Tulis deskripsi Klene Holland di sini ÔÇö sejarah bangunan, gaya arsitektur, atau kegiatan yang bisa dilakukan pengunjung.', 'Tambahkan paragraf kedua bila perlu, atau hapus bagian ini kalau tidak dibutuhkan.', NULL, NULL, NULL, NULL, '[\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/2ab731285b7265835719b1409f8ff165.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/da4d540d50a85980285be9da8bf06a07.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/84d00bc3c57bf457ee27539c6787e47f.jpg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/6fa35eb07bd0ee54f42b8bc04b589557.jpeg\"]', '2026-08-24 09:12:54', '2026-10-01 11:41:01'),
(4, 'glamping', 'Sensasi Menginap Mewah di Tengah Keasrian Alam', 'Nikmati keseruan berkemah tanpa repot dengan fasilitas tenda Naturehike yang nyaman dan lengkap. Resapi kehangatan suasana malam di tengah perkebunan yang sejuk berlatar pemandangan indah Kota Batu.', 'http://localhost/kusuma-agro-backend/uploads/6b5c42b53ec349e690c087dd29e05aa5.jpg', 'Bermalam di Tengah Kebun', 'https://picsum.photos/seed/glamping-about/700/600', 'Setiap tenda glamping Kusuma Agrowisata sudah dilengkapi kasur, bantal, selimut, dan lampu tenda -- tinggal datang dan menikmati malam berbintang tanpa repot bawa perlengkapan sendiri.', 'Seluruh tipe tenda sudah termasuk akses parkir, listrik, kamar mandi air hangat, serta akses Waterpark & spot foto Kleine Holland. Check-in pukul 14.00 WIB, check-out pukul 10.00 WIB.', NULL, NULL, NULL, NULL, '[\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/232a0f15fb6e5cd9cefd36fa3e84b068.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/37b2dd5e885b6ead73d3526202697c27.jpeg\"]', '2026-08-24 09:12:54', '2026-10-01 15:43:25'),
(5, 'petik', 'Nikmati Sensasi Memetik Buah Segar Langsung dari Pohonnya', 'Rasakan keasrian perkebunan Kusuma Agrowisata dan nikmati manisnya beragam pilihan buah alami seperti apel, jambu, jeruk, stroberi, hingga melon yang dipetik langsung dengan tangan Anda sendiri.', 'http://localhost/kusuma-agro-backend/uploads/7c5c5f992b1b67a05d0c2d48564433b3.jpeg', '', '', '', '', NULL, NULL, NULL, NULL, '[\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/fb9a8c613922c81170b75c258986e864.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/25ac05a635a9920347f7b931e415df80.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/0567cb4bc71badbb74c2d596836d5461.jpeg\",\"http:\\/\\/localhost\\/kusuma-agro-backend\\/uploads\\/a637d7214059bb8f1f1d2fa9448f2d74.jpeg\"]', '2026-08-24 09:12:54', '2026-10-01 11:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `simple_page_categories`
--

CREATE TABLE `simple_page_categories` (
  `id` int UNSIGNED NOT NULL,
  `simple_page_id` int UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `col1_label` varchar(50) NOT NULL DEFAULT 'Nama',
  `col2_label` varchar(50) NOT NULL DEFAULT 'Keterangan',
  `col3_label` varchar(50) NOT NULL DEFAULT 'Info',
  `col4_label` varchar(50) NOT NULL DEFAULT 'Catatan',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `simple_page_categories`
--

INSERT INTO `simple_page_categories` (`id`, `simple_page_id`, `title`, `col1_label`, `col2_label`, `col3_label`, `col4_label`, `sort_order`) VALUES
(50, 5, 'Kebun Petik Pilihan', 'Nama', 'Deskripsi', 'Foto', '', 0),
(51, 1, 'Jenis Kolam & Wahana Air', 'Nama', 'Deskripsi', 'Foto', '', 0),
(52, 1, 'Fasilitas Tambahan di Area Waterpark', 'Nama', 'Deskripsi', 'Foto', '', 1),
(95, 4, 'Sanctuaries', 'Nama Tenda', 'Deskripsi Singkat', 'URL Foto', 'Harga', 0),
(96, 4, 'Tipe Glamping (Update Harga 7 September 2025)', 'Tipe Glamping', 'Harga', 'Kapasitas Tenda', 'Fasilitas Utama', 1),
(97, 4, 'Rate Sewa Campsite', 'Jenis', 'Harga', 'Kapasitas', 'Fasilitas', 2),
(98, 4, 'Sewa Perlengkapan -- Kitchen Set', 'Item', 'Harga', 'Info', 'Catatan', 3),
(99, 4, 'Sewa Perlengkapan Camping', 'Item', 'Harga', 'Kelompok', 'Catatan', 4),
(100, 4, 'Sewa Perlengkapan -- Sleeping System', 'Item', 'Harga', 'Info', 'Catatan', 5),
(101, 4, 'Sewa Perlengkapan -- Lain-lain', 'Item', 'Harga', 'Info', 'Catatan', 6);

-- --------------------------------------------------------

--
-- Table structure for table `simple_page_category_rows`
--

CREATE TABLE `simple_page_category_rows` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `col1` varchar(150) DEFAULT NULL,
  `col2` text,
  `col3` varchar(100) DEFAULT NULL,
  `col4` text,
  `image_url` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `simple_page_category_rows`
--

INSERT INTO `simple_page_category_rows` (`id`, `category_id`, `col1`, `col2`, `col3`, `col4`, `image_url`, `sort_order`) VALUES
(285, 50, 'Kebun Apel', 'Petik apel Batu segar langsung dari pohon, ditemani pemandu kebun.', 'http://localhost/kusuma-agro-backend/uploads/f47ea46228e21834c3a27b773c864cc3.jpeg', '', NULL, 0),
(286, 50, 'Kebun Strawberry', 'Petik strawberry manis, cocok untuk anak-anak.', 'http://localhost/kusuma-agro-backend/uploads/cec71820784e88a3622f735766deada6.jpeg', '', NULL, 1),
(287, 50, 'Kebun Jeruk', 'Jelajahi barisan pohon jeruk pegunungan yang sejuk.', 'http://localhost/kusuma-agro-backend/uploads/e2f876ffe22ab658b0cde42de297f02a.jpg', '', NULL, 2),
(288, 50, 'Kebun Jambu Merah', 'Petik jambu merah matang di tengah udara pegunungan yang sejuk, lalu nikmati langsung di kebun.', 'http://localhost/kusuma-agro-backend/uploads/7b1959df0bcddfb699ebc481fc9f5116.jpeg', '', NULL, 3),
(289, 51, 'Kolam Anak', 'Kolam dangkal yang aman untuk anak-anak, dilengkapi ember tumpah, pancuran air, perosotan mini, dan hiasan patung buah warna-warni.', 'http://localhost/kusuma-agro-backend/uploads/23c8cce523a758babf48dd6a0206f2a7.jpg', '', NULL, 0),
(290, 51, 'Kolam Dewasa', 'Kolam renang luas dengan kedalaman ideal untuk pengunjung dewasa. Dilengkapi wahana perosotan spiral yang memicu adrenalin serta area berenang yang lapang dan menyegarkan di tengah sejuknya udara Kota Batu.', 'http://localhost/kusuma-agro-backend/uploads/9cbb0e1c95fe02b1e30dbde36ee3444d.jpg', '', NULL, 1),
(291, 51, 'Kolam Arus', 'Nikmati sensasi bersantai mengapung mengelilingi area waterpark di atas aliran air yang tenang dan menenangkan. Cocok untuk melepas penat sambil menikmati keasrian pemandangan sekitar bersama keluarga.', 'http://localhost/kusuma-agro-backend/uploads/65adf43757c57c6dec7cdc75d6fa907b.jpeg', '', NULL, 2),
(292, 52, 'Gazebo', 'Penyewaan gazebo (sekitar Rp50.000 / 2 jam), loker penyimpanan, ban/pelampung, kafetaria, dan ruang bilas.', 'http://localhost/kusuma-agro-backend/uploads/c24d63ed8b3c2172990a2ad6b796f8ae.jpeg', '', NULL, 0),
(575, 95, 'Gatchi', 'Tenda Naturehike kapasitas 2-3 orang, lengkap kasur busa, 2 bantal, 2 selimut, dan sprei. Sudah termasuk akses Waterpark & spot foto Kleine Holland.', 'https://cdn.corenexis.com/f/Ws4cA6r32Xq.jpg', 'Rp650.000 nett/malam', NULL, 0),
(576, 95, 'Pandora', 'Tenda glamping kapasitas 4 orang dengan 2 kasur busa 200x90cm, 4 bantal, 4 selimut. Sudah termasuk akses Waterpark & spot foto Kleine Holland.', 'https://cdn.corenexis.com/f/2h53XI3E3l7.jpeg', 'Rp750.000 nett/malam', NULL, 1),
(577, 95, 'Village', 'Tenda Naturehike kapasitas 6 orang dengan 2 kasur busa 200x140cm, 6 bantal, 6 selimut. Sudah termasuk akses Waterpark & spot foto Kleine Holland.', 'https://cdn.corenexis.com/f/PQn1DKzkziG.jpeg', 'Rp1.100.000 nett/malam', NULL, 2),
(578, 95, 'Village Suite', 'Tenda premium kapasitas 4 orang lengkap fire pit, lampu rangkaian, dan 4 set amenities. Sudah termasuk akses Waterpark & spot foto Kleine Holland.', 'https://cdn.corenexis.com/f/fiV96A9jUbq.jpeg', 'Rp1.500.000 nett/malam', NULL, 3),
(579, 95, 'Campsite', 'Nikmati keseruan berkemah serta campervan bersama keluarga di Campsite Kusuma Agrowisata! Harga sewa kavling mulai Rp250.000/mobil (Weekday) dan Rp350.000/mobil (Weekend) untuk kapasitas maksimal 4 orang. Paket sudah termasuk fasilitas venue, akses listrik, kamar mandi air hangat/dingin, serta free tiket masuk ke Kleine Holland.', 'https://cdn.corenexis.com/f/f1BqCCXV9pE.jpeg', 'Rp250.000 nett/malam', NULL, 4),
(580, 96, 'Gatchi', 'Rp650.000 nett', '1 Tenda Naturehike (2-3 orang)', 'Kasur busa sesuai kapasitas, 2 bantal & 2 selimut, sprei, lampu tenda, 2 kursi (BB maks 80kg), meja lipat, flysheet & lampu gantung, rak & kompor portable, alat masak & makan, gas portable, dinner grill 250gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.', NULL, 0),
(581, 96, 'Pandora', 'Rp750.000 nett', '1 Tenda Glamping (4 orang)', '2 kasur busa 200x90cm, 4 bantal, 4 selimut, 2 sprei, lampu tenda, 4 kursi, meja lipat, rak kayu besi & lampu rangkaian, rak & kompor portable, alat masak & makan, gas portable, dinner grill 250gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.', NULL, 1),
(582, 96, 'Village', 'Rp1.100.000 nett', '1 Tenda Naturehike (6 orang)', '2 kasur busa 200x140cm, 6 bantal, 6 selimut, 2 sprei, lampu tenda, 6 kursi, meja lipat, rak kayu besi & lampu rangkaian, rak & kompor portable, alat masak & makan, gas portable, dinner grill 500gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.', NULL, 2),
(583, 96, 'Village Suite', 'Rp1.500.000 nett', '1 Tenda Naturehike (4 orang)', '2 kasur, 4 bantal, 4 selimut, 2 sprei, lampu tenda, 4 set amenities, fire pit, 4 kursi & meja lipat, lampu rangkaian, rak & kompor portable, alat masak & makan, gas portable, dinner grill 500gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.', NULL, 3),
(584, 97, 'Weekday', 'Rp250.000/mobil', 'Maks 4 orang', 'Venue, listrik, kamar mandi (air hangat/dingin), free tiket masuk Kleine Holland. Harga tidak termasuk perlengkapan camping (tenda, kabel roll listrik, makanan, dll).', NULL, 0),
(585, 97, 'Weekend', 'Rp350.000/mobil', 'Maks 4 orang', 'Venue, listrik, kamar mandi (air hangat/dingin), free tiket masuk Kleine Holland. Harga tidak termasuk perlengkapan camping (tenda, kabel roll listrik, makanan, dll).', NULL, 1),
(586, 97, 'Check-in', '14.00 WIB', '-', '-', NULL, 2),
(587, 97, 'Check-out', '10.00 WIB', '-', '-', NULL, 3),
(588, 98, 'Kompor + Set', 'Rp 50.000', '', '', NULL, 0),
(589, 98, 'Gas', 'Rp 25.000', '', '', NULL, 1),
(590, 98, 'Nesting Set', 'Rp 30.000', '', '', NULL, 2),
(591, 99, 'Kompor + Set', 'Rp50.000', 'Kitchen Set', '', NULL, 0),
(592, 99, 'Gas', 'Rp25.000', 'Kitchen Set', '', NULL, 1),
(593, 99, 'Nesting Set', 'Rp30.000', 'Kitchen Set', '', NULL, 2),
(594, 99, 'Sleeping Bag', 'Rp20.000', 'Sleeping System', '', NULL, 3),
(595, 99, 'Matras', 'Rp15.000', 'Sleeping System', '', NULL, 4),
(596, 99, 'Set Kasur 90x200 (1 Bantal, 1 Selimut)', 'Rp75.000', 'Sleeping System', '', NULL, 5),
(597, 99, 'Bantal', 'Rp10.000', 'Sleeping System', '', NULL, 6),
(598, 99, 'Selimut', 'Rp10.000', 'Sleeping System', '', NULL, 7),
(599, 99, 'Meja Lipat', 'Rp25.000', 'Lain-lain', '', NULL, 8),
(600, 99, 'Kursi Lipat', 'Rp25.000', 'Lain-lain', '', NULL, 9),
(601, 99, 'Lampu Tenda Alkaline + Baterai', 'Rp25.000', 'Lain-lain', '', NULL, 10),
(602, 99, 'Baterai Alkaline', 'Rp5.000', 'Lain-lain', '', NULL, 11),
(603, 99, 'Lampu Krompyong', 'Rp50.000', 'Lain-lain', '', NULL, 12),
(604, 99, 'Kayu Bakar', 'Rp25.000', 'Lain-lain', '', NULL, 13),
(605, 99, 'Bonfire (5 Kayu Bakar)', 'Rp150.000', 'Lain-lain', '', NULL, 14),
(606, 99, 'Flysheet 3x4', 'Rp150.000', 'Lain-lain', '', NULL, 15),
(607, 99, 'Dome Shelter', 'Rp300.000', 'Lain-lain', '', NULL, 16),
(608, 100, 'Sleeping Bag', 'Rp 20.000', '', '', NULL, 0),
(609, 100, 'Matras', 'Rp 15.000', '', '', NULL, 1),
(610, 100, 'Set Kasur 90x200 (1 Bantal, 1 Selimut)', 'Rp 75.000', '', '', NULL, 2),
(611, 100, 'Bantal', 'Rp 10.000', '', '', NULL, 3),
(612, 100, 'Selimut', 'Rp 10.000', '', '', NULL, 4),
(613, 101, 'Meja Lipat', 'Rp 25.000', '', '', NULL, 0),
(614, 101, 'Kursi Lipat', 'Rp 25.000', '', '', NULL, 1),
(615, 101, 'Lampu Tenda Alkaline + Baterai', 'Rp 25.000', '', '', NULL, 2),
(616, 101, 'Baterai Alkaline', 'Rp 5.000', '', '', NULL, 3),
(617, 101, 'Lampu Krompyong', 'Rp 50.000', '', '', NULL, 4),
(618, 101, 'Kayu Bakar', 'Rp 25.000', '', '', NULL, 5),
(619, 101, 'Bonfire (5 Kayu Bakar)', 'Rp 150.000', '', '', NULL, 6),
(620, 101, 'Flysheet 3x4', 'Rp 150.000', '', '', NULL, 7),
(621, 101, 'Dome Shelter', 'Rp 300.000', '', '', NULL, 8);

-- --------------------------------------------------------

--
-- Table structure for table `site_images`
--

CREATE TABLE `site_images` (
  `id` int UNSIGNED NOT NULL,
  `image_key` varchar(60) NOT NULL,
  `label` varchar(150) NOT NULL,
  `description` text,
  `alt_match` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `display_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `site_images`
--

INSERT INTO `site_images` (`id`, `image_key`, `label`, `description`, `alt_match`, `image_url`, `group_name`, `display_order`) VALUES
(1, 'hero_waterpark', 'Hero - Kartu Waterpark', 'Nikmati keseruan wahana air terlengkap berlatar pemandangan indah pegunungan Kota Batu. Pilihan rekreasi air sempurna yang seru, segar, dan berkesan untuk seluruh anggota keluarga!', 'Wahana waterpark seluncuran', 'http://localhost/kusuma-agro-backend/uploads/79513a84d4dbf89784ded5eb1c5381c4.jpeg', 'Beranda', 1),
(2, 'hero_outbound', 'Hero - Kartu Outbound', 'War game airsoft, mini off-road ATV, dan flying fox dengan pemandu berpengalaman.', 'Wahana outbound mini off-road', 'http://localhost/kusuma-agro-backend/uploads/9105560327b89dfb29da6e554051be08.jpeg', 'Beranda', 2),
(3, 'hero_foodcoffee', 'Hero - Kartu Food & Coffee', NULL, 'Hidangan khas Food and Coffee', 'https://picsum.photos/seed/apple-dish/600/800', 'Beranda', 3),
(4, 'philosophy_main', 'Cerita Kami - Foto Utama', NULL, 'Pengunjung memetik apel langsung dari pohon', 'http://localhost/kusuma-agro-backend/uploads/5a63c753d0cf21276c21822f742da789.jpg', 'Beranda', 4),
(5, 'philosophy_inset', 'Cerita Kami - Foto Pilihan 1', NULL, 'Pemandangan kebun Kusuma Agrowisata', 'http://localhost/kusuma-agro-backend/uploads/b859670532f8d1833224846afb82db5b.jpeg', 'Beranda', 5),
(6, 'gallery_1', 'Galeri - Foto 1', NULL, 'Pengunjung berjalan di jembatan kayu hutan', 'http://kusuma-agro-backend.test/uploads/5b983387f14d3d6beb529868e15e37c1.jpeg', 'Galeri', 6),
(7, 'gallery_2', 'Galeri - Foto 2', NULL, 'Pintu masuk sanctuary bertuliskan Agrowisata', 'http://localhost/kusuma-agro-backend/uploads/ef3a7faba597833ebc9cb441e0daf2f5.jpeg', 'Galeri', 7),
(8, 'gallery_3', 'Galeri - Foto 3', NULL, 'Detail daun pakis hijau', 'http://kusuma-agro-backend.test/uploads/4dc9ba33c55d70ca2c5f050b5ab4a6fb.jpeg', 'Galeri', 8),
(9, 'gallery_4', 'Galeri - Foto 4', NULL, 'Siluet lompatan di tebing saat senja', 'http://localhost/kusuma-agro-backend/uploads/ed7969b5e2b7901c289a15f70903f143.jpg', 'Galeri', 9),
(10, 'fc_hero', 'Food & Coffee - Foto Hero', NULL, 'Premium Coffee and Farm Concept', 'http://localhost/kusuma-agro-backend/uploads/b1251f6ee9538ff40283ab2d450a6df7.JPG', 'Food & Coffee', 10),
(11, 'fc_split', 'Food & Coffee - Foto Cerita Kuliner', NULL, 'Kusuma Agrowisata Area', 'http://localhost/kusuma-agro-backend/uploads/586c5149e4347cb44b2233791f70b04d.JPG', 'Food & Coffee', 11),
(12, 'ob_hero', 'Outbound - Foto Hero', NULL, 'Kabut pagi di kawasan hutan outbound Kusuma Agrowisata', 'http://localhost/kusuma-agro-backend/uploads/46cbf420ea2c54338b58182c1fb6ebe9.jpg', 'Outbound', 12),
(13, 'ob_experience', 'Outbound - Foto Our Experience', NULL, 'Peserta outbound menaiki mini off-road ATV', 'http://localhost/kusuma-agro-backend/uploads/438d02fb22400a59c77aa7be4df7575c.jpeg', 'Outbound', 13),
(14, 'ob_gallery_main', 'Outbound - Galeri Foto Utama', NULL, 'Peserta mengendarai mini off-road buggy', 'http://localhost/kusuma-agro-backend/uploads/79c4d0fba97fc913dcb4ff516e2c4871.jpeg', 'Outbound', 14),
(15, 'ob_gallery_side1', 'Outbound - Galeri Foto Kecil 1', NULL, 'Peserta meluncur flying fox', 'http://localhost/kusuma-agro-backend/uploads/0925b51e2c7680759f825f6dc308329b.jpeg', 'Outbound', 15),
(16, 'ob_gallery_side2', 'Outbound - Galeri Foto Kecil 2', NULL, 'Rombongan peserta outbound berfoto bersama', 'http://localhost/kusuma-agro-backend/uploads/4b8ed058ee21d1b346a14f33a1814f03.jpeg', 'Outbound', 16),
(17, 'ob_gallery_wide', 'Outbound - Galeri Foto Panjang', NULL, 'Pemandangan area outbound Kusuma Agrowisata', 'http://localhost/kusuma-agro-backend/uploads/1cd6e1affe93365d007ac673279125c9.jpg', 'Outbound', 17),
(18, 'philosophy_thumb_2', 'Cerita Kami - Foto Pilihan 2', NULL, 'Foto Cerita Pilihan 2', 'http://localhost/kusuma-agro-backend/uploads/b5b32095a7bd1dbac294d70420512c6c.jpeg', 'Beranda', 6),
(19, 'philosophy_thumb_3', 'Cerita Kami - Foto Pilihan 3', NULL, 'Foto Cerita Pilihan 3', 'http://localhost/kusuma-agro-backend/uploads/61aa8e6146450a23e4971b842ff6237b.jpeg', 'Beranda', 7),
(20, 'hero_thana', 'Hero - Kartu Thana', 'Ruang relaksasi terbuka di tengah kebun, tempat bersantai menikmati udara sejuk pegunungan.', 'Thana', 'http://localhost/kusuma-agro-backend/uploads/cc21ead0e6baf23622186384b6bd5de4.jpeg', 'Beranda', 18),
(21, 'hero_glamping', 'Hero - Kartu Glamping', 'Menginap di tenda nyaman bergaya glamour camping, dikelilingi kebun dan udara pegunungan yang sejuk.', 'Glamping', 'http://localhost/kusuma-agro-backend/uploads/90b7f568d31dc3a9e7dcd3a11f3f3943.jpeg', 'Beranda', 19),
(22, 'hero_petik', 'Hero - Kartu Petik', 'Wisata petik buah segar langsung dari pohon apel, strawberry, jeruk, hingga jambu merah.', 'Petik', 'http://localhost/kusuma-agro-backend/uploads/83db3766990cd8b9f1270631c6364f6f.jpg', 'Beranda', 20),
(23, 'hero_klene_holland', 'Hero - Kartu Klene Holland', 'Sudut arsitektur bergaya Belanda klasik, spot foto favorit bernuansa pegunungan sejuk.', 'Klene Holland', 'http://localhost/kusuma-agro-backend/uploads/4f01188c94c194cabfb1e40042f3d17f.jpeg', 'Beranda', 21),
(24, 'hero_adventure', 'Hero - Kartu Adventure', 'Rangkaian wahana adrenalin: flying fox, ATV, hingga high ropes untuk para pemburu tantangan.', 'Adventure', 'http://localhost/kusuma-agro-backend/uploads/feeb6d9a8130b7d27364162bf3640f0d.jpg', 'Beranda', 22);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `companies_subtitle` text,
  `services_subtitle` text,
  `team_subtitle` text,
  `about_subtitle` text,
  `gallery_subtitle` text,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone_link` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `maps_embed_url` text,
  `maps_link_url` varchar(255) DEFAULT NULL,
  `ig_url` varchar(255) DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `yt_url` varchar(255) DEFAULT NULL,
  `tiktok_url` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `whatsapp_message` text,
  `footer_about` text,
  `footer_copyright_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `logo`, `companies_subtitle`, `services_subtitle`, `team_subtitle`, `about_subtitle`, `gallery_subtitle`, `address`, `phone`, `phone_link`, `email`, `maps_embed_url`, `maps_link_url`, `ig_url`, `fb_url`, `yt_url`, `tiktok_url`, `whatsapp_number`, `whatsapp_message`, `footer_about`, `footer_copyright_name`, `updated_at`) VALUES
(1, 'Upload/logo/1790214104_4931c3f4e6f27b3210ce.png', 'Empat unit usaha yang tumbuh dari satu kebun apel kecil di Kota Batu, kini menaungi wisata, hotel, hunian, hingga industri olahan buah.', 'Dari wisata petik buah sampai penyelenggaraan acara, beragam layanan yang kami hadirkan untuk pengunjung dan mitra.', 'Orang-orang yang menjalankan keseharian Kusuma Group.', 'Perjalanan panjang dari kebun kecil seluas 1,8 hektar hingga menjadi grup usaha yang menghadirkan kebahagiaan untuk banyak keluarga.', 'Sedikit cerita dalam foto dari kebun, kolam renang, hingga kamar hotel kami.', 'Jl. Abdul Gani Atas, Kota Batu, Jawa Timur 65311', '0800-159-3333', '+628001593333', 'info@kusuma.co', 'https://www.google.com/maps?q=Kusuma+Agrowisata+Batu&output=embed', 'https://www.google.com/maps/search/?api=1&query=Kusuma+Agrowisata+Batu', 'https://www.instagram.com/blupblup.th/', 'https://facebook.com/kusumaagrowisata', 'https://youtube.com', 'https://tiktok.com', '6288803300699', 'Halo Kusuma Agrowisata, saya ingin bertanya tentang wisata di sini.', 'Kusuma Agrowisata Group menghadirkan wisata petik buah, hotel resort, glamping, waterpark, hunian, dan produk olahan apel asli Kota Batu sejak 1989.', 'PT Kusuma Satria Dinasasri Wisatajaya', '2026-10-08 11:05:49');

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` int NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`id`, `number`, `label`, `sort_order`) VALUES
(1, '35+', 'Tahun Berpengalaman', 1),
(2, '60+', 'Hektar Area Wisata', 2),
(3, '10+', 'Jenis Buah Siap Petik', 3),
(4, '150+', 'Kamar Hotel & Cottage', 4);

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `position` varchar(150) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` text,
  `rating` int DEFAULT '0',
  `sort_order` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `text`, `rating`, `sort_order`) VALUES
(1, 'Rina, Malang', 'Liburan keluarga paling seru! Anak-anak suka banget petik strawberry dan main di waterpark.', 5, 1),
(2, 'Budi, Surabaya', 'Hotelnya nyaman, udaranya sejuk, sarapannya enak. Pasti balik lagi.', 5, 2),
(3, 'Sari, Batu', 'Oleh-oleh Siiplah wajib dibawa pulang, seger banget rasa apelnya.', 5, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_items`
--
ALTER TABLE `about_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fnb_menu_items`
--
ALTER TABLE `fnb_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `harvest_schedules`
--
ALTER TABLE `harvest_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hero_slides`
--
ALTER TABLE `hero_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ops_stats`
--
ALTER TABLE `ops_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outbound_categories`
--
ALTER TABLE `outbound_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `outbound_category_rows`
--
ALTER TABLE `outbound_category_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `outbound_packages`
--
ALTER TABLE `outbound_packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `package_images`
--
ALTER TABLE `package_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `package_price_rows`
--
ALTER TABLE `package_price_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `schedule_events`
--
ALTER TABLE `schedule_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signature_price_rows`
--
ALTER TABLE `signature_price_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signature_product_id` (`signature_product_id`);

--
-- Indexes for table `signature_products`
--
ALTER TABLE `signature_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signature_product_images`
--
ALTER TABLE `signature_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `signature_product_id` (`signature_product_id`);

--
-- Indexes for table `simple_pages`
--
ALTER TABLE `simple_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `simple_page_categories`
--
ALTER TABLE `simple_page_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simple_page_id` (`simple_page_id`);

--
-- Indexes for table `simple_page_category_rows`
--
ALTER TABLE `simple_page_category_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `site_images`
--
ALTER TABLE `site_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image_key` (`image_key`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_items`
--
ALTER TABLE `about_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fnb_menu_items`
--
ALTER TABLE `fnb_menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `harvest_schedules`
--
ALTER TABLE `harvest_schedules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hero_slides`
--
ALTER TABLE `hero_slides`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ops_stats`
--
ALTER TABLE `ops_stats`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `outbound_categories`
--
ALTER TABLE `outbound_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `outbound_category_rows`
--
ALTER TABLE `outbound_category_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `outbound_packages`
--
ALTER TABLE `outbound_packages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_images`
--
ALTER TABLE `package_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package_price_rows`
--
ALTER TABLE `package_price_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `schedule_events`
--
ALTER TABLE `schedule_events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `signature_price_rows`
--
ALTER TABLE `signature_price_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `signature_products`
--
ALTER TABLE `signature_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `signature_product_images`
--
ALTER TABLE `signature_product_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `simple_pages`
--
ALTER TABLE `simple_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `simple_page_categories`
--
ALTER TABLE `simple_page_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `simple_page_category_rows`
--
ALTER TABLE `simple_page_category_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=622;

--
-- AUTO_INCREMENT for table `site_images`
--
ALTER TABLE `site_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stats`
--
ALTER TABLE `stats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `outbound_categories`
--
ALTER TABLE `outbound_categories`
  ADD CONSTRAINT `outbound_categories_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `outbound_packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `outbound_category_rows`
--
ALTER TABLE `outbound_category_rows`
  ADD CONSTRAINT `outbound_category_rows_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `outbound_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_images`
--
ALTER TABLE `package_images`
  ADD CONSTRAINT `package_images_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_price_rows`
--
ALTER TABLE `package_price_rows`
  ADD CONSTRAINT `package_price_rows_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `signature_price_rows`
--
ALTER TABLE `signature_price_rows`
  ADD CONSTRAINT `signature_price_rows_ibfk_1` FOREIGN KEY (`signature_product_id`) REFERENCES `signature_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `signature_product_images`
--
ALTER TABLE `signature_product_images`
  ADD CONSTRAINT `signature_product_images_ibfk_1` FOREIGN KEY (`signature_product_id`) REFERENCES `signature_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `simple_page_categories`
--
ALTER TABLE `simple_page_categories`
  ADD CONSTRAINT `simple_page_categories_ibfk_1` FOREIGN KEY (`simple_page_id`) REFERENCES `simple_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `simple_page_category_rows`
--
ALTER TABLE `simple_page_category_rows`
  ADD CONSTRAINT `simple_page_category_rows_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `simple_page_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
