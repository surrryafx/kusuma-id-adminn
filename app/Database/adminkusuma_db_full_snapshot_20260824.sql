
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `about_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `about_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `about_items` WRITE;
/*!40000 ALTER TABLE `about_items` DISABLE KEYS */;
INSERT INTO `about_items` VALUES (1,'Pendiri','Ir. Edy Antoro','founder','','Kami bukan pelayan uang, bukan pula pelayan harta. Kami bukan orang yang hanya memikirkan untung, untung, dan untung. Tapi kami sadar bahwa kami harus berbuat baik.',1),(2,'Sejarah','Kusuma Agrowisata','history','assets/petik-apel.jpg','Berawal dari lahan 1,8 hektar pada tahun 1989, kini berkembang menjadi ratusan hektar dan menaungi beberapa perusahaan. Semoga semua ini menjadi berkah bagi kita semua.',2),(3,'Masa Depan','Bagian dari Lingkaran Kehidupan','future','assets/kolam.jpg','Kami berkomitmen menjadi perusahaan yang membuat kehidupan manusia lebih bahagia. Industri, Estate, dan Hotel adalah bagian dari perjalanan kami ke depan.',3);
/*!40000 ALTER TABLE `about_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Kusuma Agrowisata','leaf','Wisata petik apel, jeruk, strawberry & sayur hidroponik langsung dari kebun.','assets/waterpark.jpg',NULL,NULL,'https://agrowisata.id/',1),(2,'Kusuma Hotel & Resort','bed','Resort & Convention Hotel dengan 152 kamar bernuansa kebun apel.','assets/hotell.jpg',NULL,NULL,'https://www.kusuma-hotel.com/',2),(3,'Kusuma Estate','home','Kawasan hunian asri berkontur perbukitan di Kota Batu.','assets/kolam.jpg',NULL,NULL,'https://estate.kusuma.id/',3),(4,'Kusuma Agro Industri','factory','Produk olahan apel asli seperti Siiplah, jenang apel, hingga cuka apel.','assets/enjoy2.jpg',NULL,NULL,'https://industri.kusuma.id/',4);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `zone` varchar(150) DEFAULT NULL,
  `capacity` varchar(50) DEFAULT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `unit_label` varchar(30) NOT NULL DEFAULT 'Orang',
  `status` enum('available','maintenance') NOT NULL DEFAULT 'available',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'Paintball Combat',NULL,'Min. 20 Orang',180000,'Orang','available',1,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(2,'Air Softgun Battle',NULL,'Min. 10 Orang',120000,'Orang','available',2,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(3,'Flying Fox',NULL,'Per Orang',20000,'Orang','available',3,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(4,'Mobil Komodo (ATV Mini Off-Road)',NULL,'Per Unit / 2 Putaran',100000,'Unit','available',4,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(5,'Motor Cross Funride',NULL,'Per Orang',50000,'Orang','available',5,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(6,'Pony Horse Ride',NULL,'Per Orang',10000,'Orang','available',6,'2026-08-24 09:12:55','2026-08-24 09:12:55');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `fnb_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fnb_menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `venue` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `stock` int(10) unsigned NOT NULL DEFAULT 0,
  `status` enum('available','seasonal','out-of-stock') NOT NULL DEFAULT 'available',
  `is_promo` tinyint(1) NOT NULL DEFAULT 0,
  `is_low_stock` tinyint(1) NOT NULL DEFAULT 0,
  `today_sold` int(10) unsigned NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `fnb_menu_items` WRITE;
/*!40000 ALTER TABLE `fnb_menu_items` DISABLE KEYS */;
INSERT INTO `fnb_menu_items` VALUES (1,'apple-house','Signature Apple Pie','Pai renyah isi selai apel Batu kayu manis hangat disajikan dengan es krim vanila.','FOOD',NULL,35000,40,'available',1,0,20,1,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(2,'apple-house','Fresh Apple Juice','100% perasan murni buah apel segar alami pilihan langsung dari pohon kebun.','BEVERAGE',NULL,22000,100,'available',0,0,35,2,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(3,'strawberry-house','Strawberry Premium Pancake','Pancake lembut hangat berlapis krim dengan limpahan saus strawberry segar.','FOOD',NULL,38000,30,'available',1,0,18,1,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(4,'strawberry-house','Strawberry Creamy Milkshake','Perpaduan susu segar pilihan, es krim vanilla, dan potongan buah strawberry ranum.','BEVERAGE',NULL,25000,60,'available',0,0,24,2,'2026-08-24 09:12:55','2026-08-24 09:12:55'),(5,'apple-house','Apple Cinnamon Porridge','Oatmeal hangat dimasak dengan kayu manis, disajikan dengan potongan apel segar dan madu.','FOOD',NULL,38000,25,'available',0,0,12,3,'2026-08-24 09:14:31','2026-08-24 09:14:31'),(6,'apple-house','Apple Cider Latte','Espresso dipadukan dengan sari apel hangat dan susu creamy, ditaburi kayu manis bubuk.','BEVERAGE',NULL,28000,18,'available',1,1,15,4,'2026-08-24 09:15:51','2026-08-24 09:15:51'),(7,'strawberry-house','Strawberry Chicken Salad','Salad segar dengan potongan ayam panggang, strawberry, dan dressing madu-lemon.','FOOD',NULL,42000,20,'available',0,0,9,3,'2026-08-24 09:15:51','2026-08-24 09:15:51'),(8,'strawberry-house','Strawberry Iced Tea','Teh hitam dingin dengan sirup strawberry alami dan potongan buah segar.','BEVERAGE',NULL,20000,45,'available',0,0,22,4,'2026-08-24 09:15:51','2026-08-24 09:15:51');
/*!40000 ALTER TABLE `fnb_menu_items` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `gallery_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `gallery_photos` WRITE;
/*!40000 ALTER TABLE `gallery_photos` DISABLE KEYS */;
INSERT INTO `gallery_photos` VALUES (2,'Upload/galerry/1783650141_ef2bc7dd2e7a9b0695ed.jpg','Sarapan pagi di tengah kebun',2),(3,'Upload/galerry/1783650179_8fd962625fb245f7a8a4.jpg','Seluncuran favorit anak-anak',3),(4,'Upload/galerry/1783650212_3cbb0576023ac3ea5c27.jpg','Cottage nyaman berpemandangan gunung',4),(5,'Upload/galerry/1783650240_6874a297e3114c01bad2.jpg','Produk olahan apel Siiplah',5),(6,'Upload/galerry/1783650270_f43eabcaf53449b58b9f.jpg','Sore hari di Kusuma Agrowisata',6);
/*!40000 ALTER TABLE `gallery_photos` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `harvest_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest_schedules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fruit_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `harvest_schedules` WRITE;
/*!40000 ALTER TABLE `harvest_schedules` DISABLE KEYS */;
INSERT INTO `harvest_schedules` VALUES (1,'Apel Manalagi','2026-06-01','2026-08-31','Panen raya kebun blok A','2026-08-24 09:12:55','2026-08-24 09:12:55'),(2,'Strawberry','2026-05-01','2026-09-30','Panen berkelanjutan sepanjang musim kemarau','2026-08-24 09:12:55','2026-08-24 09:12:55');
/*!40000 ALTER TABLE `harvest_schedules` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `hero_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hero_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `eyebrow` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `cta_text` varchar(255) DEFAULT NULL,
  `cta_link` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `hero_slides` WRITE;
/*!40000 ALTER TABLE `hero_slides` DISABLE KEYS */;
INSERT INTO `hero_slides` VALUES (1,'Upload/hero/1783674301_71ba5ab13a6d72eac0b4.jpg','Sejak 1989','Satu Grup, Empat Unit Usaha untuk Kota Batu','Berawal dari kebun apel seluas 1,8 hektar pada tahun 1989, Kusuma Group kini menaungi agrowisata, hotel & resort, kawasan hunian, dan industri olahan apel.','Kenali Unit Usaha Kami','#companies',1),(2,'https://picsum.photos/seed/kusuma-hero-hotel/1920/1080','Menginap Nyaman','Resort & Convention Hotel di Ketinggian 1000 Mdpl','152 kamar dan cottage asri dikelilingi kebun apel, kolam renang, serta udara pegunungan yang sejuk sepanjang tahun.','Lihat Hotel Kami','#companies',2),(3,'https://picsum.photos/seed/kusuma-hero-waterpark/1920/1080','Seru untuk Keluarga','Basah-basahan Seru di Kusuma Waterpark','Kolam arus, seluncuran, dan kolam anak — pelengkap keseruan setelah puas memetik buah langsung dari pohonnya.','Lihat Layanan','#services',3),(4,'https://picsum.photos/seed/kusuma-hero-petik/1920/1080','Favorit Pengunjung','Petik Apel, Jeruk & Strawberry Langsung dari Kebun','Lebih dari 10 jenis buah siap dipetik sendiri bersama keluarga, ditemani pemandu ramah kami.','Rencanakan Kunjungan','#contact',4);
/*!40000 ALTER TABLE `hero_slides` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('contact','cart_checkout') NOT NULL DEFAULT 'contact',
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `items_summary` text DEFAULT NULL,
  `status` enum('new','replied','closed') NOT NULL DEFAULT 'new',
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,'contact','Budi Santoso','budi@example.com',NULL,'Halo, apakah tersedia paket untuk rombongan 50 orang di bulan depan?',NULL,'new','2026-08-24 09:12:55');
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ops_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ops_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `daily_group_target` int(10) unsigned NOT NULL DEFAULT 8,
  `staff_on_site` int(10) unsigned NOT NULL DEFAULT 0,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ops_stats` WRITE;
/*!40000 ALTER TABLE `ops_stats` DISABLE KEYS */;
INSERT INTO `ops_stats` VALUES (1,8,18,'2026-08-24 09:12:55');
/*!40000 ALTER TABLE `ops_stats` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `outbound_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL,
  `title` varchar(150) NOT NULL,
  `col1_label` varchar(50) NOT NULL DEFAULT 'Nama Game',
  `col2_label` varchar(50) NOT NULL DEFAULT 'Learning & Goal',
  `col3_label` varchar(50) NOT NULL DEFAULT 'Durasi',
  `col4_label` varchar(50) NOT NULL DEFAULT 'Keterangan',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `outbound_categories_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `outbound_packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `outbound_categories` WRITE;
/*!40000 ALTER TABLE `outbound_categories` DISABLE KEYS */;
INSERT INTO `outbound_categories` VALUES (1,1,'A. Ice Breaking','Nama Game & Deskripsi','Learning & Goal','Durasi','Keterangan Tambahan',0),(2,1,'B. Outbound Games','Nama Game & Deskripsi','Learning & Goal','Durasi','Keterangan Tambahan',1),(3,2,'Rangkaian Game','Nama Game & Deskripsi','Learning & Goal','Durasi / Keterangan','Keterangan',0),(4,3,'A. Ice Breaking','Nama Game','Learning & Goal','Durasi','Penjelasan Tambahan',0),(5,3,'B. Game','Nama Game & Deskripsi Singkat','Learning & Goal','Durasi','Keterangan Tambahan',1),(6,3,'C. Highropes Game','Nama Wahana','Learning & Goal','Durasi','Keterangan Tambahan',2),(7,3,'D. Alternative Game','Nama Wahana Pilihan / Substitusi','Learning & Goal','Durasi','Keterangan Tambahan',3);
/*!40000 ALTER TABLE `outbound_categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `outbound_category_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_category_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `col1` varchar(150) DEFAULT NULL,
  `col2` text DEFAULT NULL,
  `col3` varchar(100) DEFAULT NULL,
  `col4` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `outbound_category_rows_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `outbound_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `outbound_category_rows` WRITE;
/*!40000 ALTER TABLE `outbound_category_rows` DISABLE KEYS */;
INSERT INTO `outbound_category_rows` VALUES (1,1,'Chicken Dance Brands Game: Membuat lingkaran besar lalu menggoyang-goyang pinggulnya sesuai perintah instruktur.','Team work, decision making','┬▒30 Menit','Pencairan suasana awal tim (60 pax)',0),(2,1,'People to People: Mencari pasangan masing-masing sambil berpegangan sesuai dengan hitungan instruktur.','Ketahanan terhadap stretching','┬▒45 Menit','Membangun keakraban & adaptasi kilat',1),(3,1,'Opposite: Gerakan bersama-sama dengan satu team dengan hitungan lawan kata yang sebenarnya.','Team Work, Strategy, Group Strategy, Planning dan strategy','┬▒30 Menit','Melatih konsentrasi tingkat tinggi',2),(4,2,'Traffic Jam: Berpindah dari satu sisi ke sisi yang lain sesuai dengan instruksi.','Menumbuhkan jiwa leadership','┬▒60 Menit','Kriteria Peserta: Company, Instansi, Corporate',0),(5,2,'Ufo Alien: Memindahkan bola diatas nampan dari satu ke tempat lain.','Kekompakan dan konsentrasi team','┬▒45 Menit','Kriteria Peserta: Company, Instansi, Corporate',1),(6,2,'Water Tower: Berusaha mengisi air dalam drum, yang terdapat lubang lubang kecil hingga penuh.','Kekompakan dan konsentrasi team','┬▒60 Menit','Kriteria Peserta: Company, Instansi, Corporate',2),(7,2,'Helium Stick: Mengikuti ritme naik dan turunnya bambu dengan menggunakan jari telunjuk tiap peserta secara bersamaan.','Team work, strategy','┬▒30 Menit','Kriteria Peserta: Company, Instansi, Corporate',3),(8,3,'Ball n Pipe: Memindahkan bola pingpong dengan menggunakan paralon dari satu tempat ke tempat yang lain.','Team work, tanggung jawab','Outbound ┬▒4 Jam / 60 pax','',0),(9,3,'Labirin: Berusaha memasukkan bola pada sebuah lubang.','Leadership, kekompakan inisiatif','Outbound + makan + wisata + ┬▒6 jam','',1),(10,3,'Flying Fox: Meluncur dengan tali dari ketinggian 8 meter dan panjang 100 m.','Melatih keberanian menguji adrenalin','Termasuk dalam rangkaian paket','',2),(11,3,'Sharing game outbound: Sharing hasil outbound dengan peserta.','Evaluasi & Internalisasi nilai kelompok','Participant: SMP dan SMA','',3),(12,4,'Chicken Dance','Mencairkan suasana awal anak-anak','┬▒15 Menit','Game ini untuk mencairkan suasana dan membangun interaksi peserta dengan peserta juga dengan fasilitator.',0),(13,4,'People to people','Melatih komunikasi antar teman sebaya','┬▒20 Menit','Diharapkan bisa terjadi hubungan aktif antara anak dan instruktur.',1),(14,4,'Dance Gorilla','Melatih motorik kasar dan ketangkasan fisik anak','┬▒15 Menit','Game ini untuk mencairkan suasana dan membangun interaksi peserta dengan peserta juga dengan fasilitator.',2),(15,4,'Brands Game','Melatih fokus indra pendengaran anak','┬▒20 Menit','Diharapkan bisa terjadi hubungan aktif antara anak dan instruktur.',3),(16,5,'Ufo Alien: Memindahkan bola diatas nampan dari satu tempat ke tempat lain.','Melatih Konsentrasi','┬▒30 Menit','Media ramah anak (bola ringan)',0),(17,5,'Ball and Pipe: Memindahkan bola pingpong dengan menggunakan paralon dari satu tempat ke tempat lain.','Tanggung Jawab','┬▒30 Menit','Melatih kesabaran antrean kelompok',1),(18,5,'Labirin: Berusaha memasukkan bola pada sebuah lubang.','Leadership Inisiatif','┬▒25 Menit','Melatih arah komunikasi verbal anak',2),(19,5,'Mini Water Tower: Berusaha mengisi air dalam paralon yang terdapat lubang-lubang kecil hingga penuh.','Totalitas Strategi','┬▒40 Menit','Disarankan membawa pakaian ganti',3),(20,6,'Burma V','Melatih keberanian menguji adrenalin anak sejak dini','Sesuai Alur Antrean','Bermain ketangkasan di atas ketinggian menggunakan alat pengaman full body harness standar keselamatan internasional.',0),(21,6,'Bridge Wood','Melatih keberanian menguji adrenalin anak sejak dini','Sesuai Alur Antrean','Bermain ketangkasan di atas ketinggian menggunakan alat pengaman full body harness standar keselamatan internasional.',1),(22,6,'Flying Fox','Melatih keberanian menguji adrenalin anak sejak dini','Sesuai Alur Antrean','Bermain ketangkasan di atas ketinggian menggunakan alat pengaman full body harness standar keselamatan internasional.',2),(23,7,'Ball Transfer','Melatih keberanian menguji adrenalin serta adaptasi alami anak','┬▒30 Menit','Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.',0),(24,7,'Redmood Ring','Melatih keberanian menguji adrenalin serta adaptasi alami anak','┬▒25 Menit','Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.',1),(25,7,'Jagur','Melatih keberanian menguji adrenalin serta adaptasi alami anak','┬▒20 Menit','Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.',2),(26,7,'Tangkap Ikan','Melatih keberanian menguji adrenalin serta adaptasi alami anak','┬▒45 Menit','Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.',3),(27,7,'Tanam Strawberry','Melatih keberanian menguji adrenalin serta adaptasi alami anak','┬▒40 Menit','Alternative game khusus anak usia dini (TK). Aktivitas interaktif menanam tanaman buah serta interaksi langsung dengan ekosistem alam kebun.',4);
/*!40000 ALTER TABLE `outbound_category_rows` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `outbound_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `short_desc` text DEFAULT NULL,
  `facilities_note` text DEFAULT NULL,
  `min_pax_note` varchar(50) DEFAULT NULL,
  `duration_note` varchar(50) DEFAULT NULL,
  `cart_subtitle` varchar(150) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `outbound_packages` WRITE;
/*!40000 ALTER TABLE `outbound_packages` DISABLE KEYS */;
INSERT INTO `outbound_packages` VALUES (1,'ob-modal-adult','Outbound Dewasa','Program interaktif guna mempererat kerja sama kelompok, kepemimpinan, dan komunikasi efektif melalui simulasi problem solving terpandu di alam bebas.','Wisata petik 2 Apel/Jambu, Juice, Snack Box, Lunch Box, Mineral Water, Adventure.','Kapasitas Minimum: 30 Orang','┬▒4-6 Jam','Paket Terpadu (Min. 30 Orang)',1),(2,'ob-modal-students','Outbound SMP & SMA','Dirancang untuk menumbuhkan jiwa kepemimpinan individu, kemandirian siswa, rasa tanggung jawab sosial, serta keberanian mengambil keputusan positif.','Wisata petik 2 Apel/Jambu, Juice, Lunch Box, Mineral Water, Waterpark, Adventure.','Kapasitas Minimum: 30 Siswa','┬▒4-6 Jam','Paket Sekolah (Min. 30 Siswa)',2),(3,'ob-modal-kids','Outbound Kids (TK & SD)','Eksplorasi ceria motorik anak usia dini melalui pengenalan alam luar ruangan, ketangkasan fisik ringan, serta edukasi budidaya tanaman hortikultura.','Wisata petik 2 Apel/Jambu, Juice, Lunch Box, Mineral Water, Waterpark, Adventure.','Kapasitas Minimum: 30 Anak','3 - 4 Jam','Paket Anak (Min. 30 Anak)',3);
/*!40000 ALTER TABLE `outbound_packages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `package_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `package_images_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `package_images` WRITE;
/*!40000 ALTER TABLE `package_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_images` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `package_price_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_price_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned NOT NULL,
  `col1` varchar(150) DEFAULT NULL,
  `col2` text DEFAULT NULL,
  `col3` varchar(100) DEFAULT NULL,
  `col4` varchar(100) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `package_price_rows_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `package_price_rows` WRITE;
/*!40000 ALTER TABLE `package_price_rows` DISABLE KEYS */;
INSERT INTO `package_price_rows` VALUES (1,1,'Paket Apel','Wisata petik 2 apel / jeruk / strw, petik 2 jambu, polo pendem, jus buah, yogurt.','Hubungi Kami','Hubungi Kami',0),(2,2,'Paket Strawberry','Petik 4 buah strawberry, petik 2 buah jambu, pancake + milkshake strawberry, sayur hidroponik 1 pack, yogurt.','Hubungi Kami','Hubungi Kami',0),(3,3,'Edukasi Pelajar','Wisata petik apel/jambu, juice, presentasi, proses produksi.','Hubungi Kami','Minimal 30 Orang',0),(4,3,'Ekskul Biologi','Wisata petik apel/jambu, juice, presentasi hidroponik, bahan pelatihan, lunch box, sayur hidroponik 1 pack.','Hubungi Kami','Minimal 30 Orang',1),(5,3,'Edukasi Instansi','Wisata petik apel/jambu, juice, presentasi agrowisata, lunch buffet, yogurt, hall.','Hubungi Kami','Minimal 30 Orang',2),(6,4,'Paket Study Tour','Wisata petik apel / jambu, welcome drink yogurt. *Khusus untuk TK & SD.','Hubungi Kami','Minimal 30 Orang',0);
/*!40000 ALTER TABLE `package_price_rows` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `short_desc` text DEFAULT NULL,
  `badge` varchar(50) DEFAULT NULL,
  `effective_date` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `cart_subtitle` varchar(150) DEFAULT NULL,
  `min_pax_note` varchar(50) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `col1_label` varchar(50) NOT NULL DEFAULT 'Package',
  `col2_label` varchar(50) NOT NULL DEFAULT 'Facility',
  `col3_label` varchar(50) NOT NULL DEFAULT 'Rate',
  `col4_label` varchar(50) NOT NULL DEFAULT 'Information',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Wisata Petik Apel','detail-apel','Petualangan memetik buah segar langsung dari pohon pilihan. Dilengkapi fasilitas snack tradisional, jus segar, hingga yogurt khas produksi Kusuma.','Best Seller','1 Juni 2016','https://picsum.photos/seed/big-apple/900/600','Paket Kebun Apel Signature',NULL,1,'Package','Facility','Weekday','Weekend',1,'2026-08-24 09:12:53','2026-08-24 09:12:53'),(2,'Wisata Petik Strawberry','detail-strawberry','Pengalaman memetik buah strawberry premium berpadu hidangan strawberry pancake & milkshake segar.',NULL,'1 Januari 2015','https://picsum.photos/seed/small-strawberry/400/400','Paket Premium Strawberry',NULL,0,'Package','Facility','Weekday','Weekend',2,'2026-08-24 09:12:53','2026-08-24 09:12:53'),(3,'Paket Agro Edukasi','detail-edukasi','Program edukasi interaktif budidaya tanaman hortikultura & hidroponik untuk pelajar hingga instansi.',NULL,'1 Januari 2015','https://picsum.photos/seed/small-edu/400/400','Min. 30 Orang - Edukasi Terstruktur','Min. 30 Orang',0,'Package','Facility','Rate','Information',3,'2026-08-24 09:12:53','2026-08-24 09:12:53'),(4,'Paket Study Tour (TK & SD)','detail-studytour','Eksplorasi ceria khusus anak usia dini mengenal alam melalui petik buah terpandu dan welcome drink.',NULL,'1 Januari 2016','https://picsum.photos/seed/small-tour/400/400','Khusus Anak Usia Dini - Min 30 Pax','Min. 30 Orang',0,'Package','Facility','Rate','Information',4,'2026-08-24 09:12:53','2026-08-24 09:12:53');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `schedule_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_date` date DEFAULT NULL,
  `time_label` varchar(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `color` varchar(20) DEFAULT '',
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `schedule_events` WRITE;
/*!40000 ALTER TABLE `schedule_events` DISABLE KEYS */;
INSERT INTO `schedule_events` VALUES (1,'2026-08-24','09:00 AM','Corporate Outbound - PT Mitra Jaya','45 Pax ÔÇó Paintball & ATV','c-green','2026-08-24 09:12:53'),(2,'2026-08-24','01:30 PM','Family Gathering - Grup B','20 Pax ÔÇó Flying Fox & Lunch','','2026-08-24 09:12:53'),(3,'2026-08-24','03:00 PM','Study Tour SMA Harapan','120 Pax ÔÇó Full Facility Circuit','c-red','2026-08-24 09:12:53');
/*!40000 ALTER TABLE `schedule_events` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Area & Pemandangan','camera','Berada di lokasi terbaik Kota Batu, area luas di lereng Gunung Panderman dengan udara sejuk sepanjang hari.','https://picsum.photos/seed/area-1/1200/800','https://picsum.photos/seed/area-2/1200/800','https://picsum.photos/seed/area-3/1200/800',1),(2,'Waterpark','waves','Kolam arus, seluncuran, dan kolam anak — keseruan basah-basahan untuk seluruh keluarga.','https://picsum.photos/seed/waterpark-1/1200/800','https://picsum.photos/seed/waterpark-2/1200/800','https://picsum.photos/seed/waterpark-3/1200/800',2),(9,'Petik Buah','apple','Lebih dari 10 jenis buah di kebun kami, siap dipetik langsung oleh Anda dan keluarga.','https://picsum.photos/seed/petik-1/1200/800','https://picsum.photos/seed/petik-2/1200/800','https://picsum.photos/seed/petik-3/1200/800',3),(10,'Kuliner Khas Apel','drink','Siiplah dan TehKu adalah produk andalan kami, diracik langsung dari buah pilihan kebun sendiri.','https://picsum.photos/seed/kuliner-1/1200/800','https://picsum.photos/seed/kuliner-2/1200/800','https://picsum.photos/seed/kuliner-3/1200/800',4),(11,'Home & Villa','villa','Hunian dan vila terbaik di Kota Batu, siap ditempati dengan penawaran spesial.','https://picsum.photos/seed/villa-1/1200/800','https://picsum.photos/seed/villa-2/1200/800','https://picsum.photos/seed/villa-3/1200/800',5),(12,'Party, Event & Wedding','party','Kolam renang, gym, dan various area untuk mewujudkan acara Anda jadi sukses dan berkesan.','https://picsum.photos/seed/event-1/1200/800','https://picsum.photos/seed/event-2/1200/800','https://picsum.photos/seed/event-3/1200/800',6);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `currency` varchar(10) NOT NULL DEFAULT 'IDR',
  `decimal_places` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,0,1,'IDR',0,'2026-08-24 09:12:53');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `signature_price_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_price_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `signature_product_id` int(10) unsigned NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `facility_desc` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `signature_product_id` (`signature_product_id`),
  CONSTRAINT `signature_price_rows_ibfk_1` FOREIGN KEY (`signature_product_id`) REFERENCES `signature_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `signature_price_rows` WRITE;
/*!40000 ALTER TABLE `signature_price_rows` DISABLE KEYS */;
INSERT INTO `signature_price_rows` VALUES (1,1,'Tiket Masuk',25000,'Fasilitas : Waterpark & Kleine Holland',0),(2,1,'Paket Petik Dahsyat 1',30000,'Fasilitas : Petik Buah Jambu/ Buah Jeruk/ Buah Naga, Kleine Holland',1),(3,1,'Paket Petik Dahsyat 2',35000,'Fasilitas : Petik Buah Apel/ Buah Strawberry/ Buah Melon, Kleine Holland',2),(4,1,'Tiket Terusan',50000,'Fasilitas : Petik Buah Apel/ Buah Strawberry/ Buah Melon, Kleine Holland, Waterpark, Animal Feeding',3);
/*!40000 ALTER TABLE `signature_price_rows` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `signature_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `signature_product_id` int(10) unsigned NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `signature_product_id` (`signature_product_id`),
  CONSTRAINT `signature_product_images_ibfk_1` FOREIGN KEY (`signature_product_id`) REFERENCES `signature_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `signature_product_images` WRITE;
/*!40000 ALTER TABLE `signature_product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `signature_product_images` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `signature_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signature_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `badge` varchar(50) DEFAULT NULL,
  `effective_date` varchar(50) DEFAULT NULL,
  `operating_hours_text` varchar(150) DEFAULT 'Buka Setiap Hari (08:00 - 16:00 WIB)',
  `image_url` varchar(255) DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `detail_info` text DEFAULT NULL,
  `detail_image_url` varchar(255) DEFAULT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `link_url` varchar(255) DEFAULT NULL,
  `cart_subtitle` varchar(150) DEFAULT NULL,
  `min_pax_note` varchar(50) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `signature_products` WRITE;
/*!40000 ALTER TABLE `signature_products` DISABLE KEYS */;
INSERT INTO `signature_products` VALUES (1,'signature-1','Nama Produk 1','Edisi Musim',NULL,'Buka Setiap Hari (08:00 - 16:00 WIB)','https://picsum.photos/seed/shop-item-1/500/420','Deskripsi singkat produk placeholder ÔÇö ganti dengan detail bahan, keunggulan, atau cerita produknya di sini.','Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.',NULL,0,'#',NULL,NULL,1,'2026-08-24 09:12:54','2026-08-24 09:12:54'),(2,'signature-2','Nama Produk 2','Best Seller',NULL,'Buka Setiap Hari (08:00 - 16:00 WIB)','https://picsum.photos/seed/shop-item-2/500/420','Deskripsi singkat produk placeholder ÔÇö ganti dengan detail bahan, keunggulan, atau cerita produknya di sini.','Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.',NULL,0,'#',NULL,NULL,2,'2026-08-24 09:12:54','2026-08-24 09:12:54'),(3,'signature-3','Nama Produk 3','Eksklusif',NULL,'Buka Setiap Hari (08:00 - 16:00 WIB)','https://picsum.photos/seed/shop-item-3/500/420','Deskripsi singkat produk placeholder ÔÇö ganti dengan detail bahan, keunggulan, atau cerita produknya di sini.','Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.',NULL,0,'#',NULL,NULL,3,'2026-08-24 09:12:54','2026-08-24 09:12:54'),(4,'signature-4','Nama Produk 4','Terbatas',NULL,'Buka Setiap Hari (08:00 - 16:00 WIB)','https://picsum.photos/seed/shop-item-4/500/420','Deskripsi singkat produk placeholder ÔÇö ganti dengan detail bahan, keunggulan, atau cerita produknya di sini.','Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.',NULL,0,'#',NULL,NULL,4,'2026-08-24 09:12:54','2026-08-24 09:12:54'),(5,'signature-5','Nama Produk 5','Spesial',NULL,'Buka Setiap Hari (08:00 - 16:00 WIB)','https://picsum.photos/seed/shop-item-5/500/420','Deskripsi singkat produk placeholder ÔÇö ganti dengan detail bahan, keunggulan, atau cerita produknya di sini.','Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.',NULL,0,'#',NULL,NULL,5,'2026-08-24 09:12:54','2026-08-24 09:12:54'),(6,'signature-6','Nama Produk 6','Favorit',NULL,'Buka Setiap Hari (08:00 - 16:00 WIB)','https://picsum.photos/seed/shop-item-6/500/420','Deskripsi singkat produk placeholder ÔÇö ganti dengan detail bahan, keunggulan, atau cerita produknya di sini.','Tulis di sini informasi lanjutan tentang produk ini: bahan, cara penyajian, keunggulan, atau cerita di balik produknya. Bisa beberapa paragraf.',NULL,0,'#',NULL,NULL,6,'2026-08-24 09:12:54','2026-08-24 09:12:54');
/*!40000 ALTER TABLE `signature_products` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `simple_page_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_page_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `simple_page_id` int(10) unsigned NOT NULL,
  `title` varchar(150) NOT NULL,
  `col1_label` varchar(50) NOT NULL DEFAULT 'Nama',
  `col2_label` varchar(50) NOT NULL DEFAULT 'Keterangan',
  `col3_label` varchar(50) NOT NULL DEFAULT 'Info',
  `col4_label` varchar(50) NOT NULL DEFAULT 'Catatan',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `simple_page_id` (`simple_page_id`),
  CONSTRAINT `simple_page_categories_ibfk_1` FOREIGN KEY (`simple_page_id`) REFERENCES `simple_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `simple_page_categories` WRITE;
/*!40000 ALTER TABLE `simple_page_categories` DISABLE KEYS */;
INSERT INTO `simple_page_categories` VALUES (1,1,'Jenis Kolam & Wahana Air','Nama Wahana','Deskripsi Singkat','URL Foto','Catatan (opsional)',1),(2,4,'Sanctuaries','Nama Tenda','Deskripsi Singkat','URL Foto','Harga',1),(4,4,'Sewa Perlengkapan -- Kitchen Set','Item','Harga','','',3),(5,4,'Sewa Perlengkapan -- Sleeping System','Item','Harga','','',4),(6,4,'Sewa Perlengkapan -- Lain-lain','Item','Harga','','',5),(7,5,'Kebun Petik Pilihan','Nama Kebun','Deskripsi Singkat','URL Foto','Catatan (opsional)',1),(8,4,'Tipe Glamping (Update Harga 7 September 2025)','Tipe Glamping','Harga','Kapasitas Tenda','Fasilitas Utama',1),(9,4,'Rate Sewa Campsite','Jenis','Harga','Kapasitas','Fasilitas',2),(10,4,'Sewa Perlengkapan Camping','Item','Harga','Kelompok','',3),(13,1,'Fasilitas Tambahan di Area Waterpark','Nama Wahana','Deskripsi Singkat','URL Foto','Catatan (opsional)',2);
/*!40000 ALTER TABLE `simple_page_categories` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `simple_page_category_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_page_category_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `col1` varchar(150) DEFAULT NULL,
  `col2` text DEFAULT NULL,
  `col3` varchar(100) DEFAULT NULL,
  `col4` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `simple_page_category_rows_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `simple_page_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `simple_page_category_rows` WRITE;
/*!40000 ALTER TABLE `simple_page_category_rows` DISABLE KEYS */;
INSERT INTO `simple_page_category_rows` VALUES (4,2,'Gatchi','Tenda Naturehike kapasitas 2-3 orang, lengkap kasur busa, 2 bantal, 2 selimut, dan sprei. Sudah termasuk akses Waterpark & spot foto Kleine Holland.','https://picsum.photos/seed/glamping-gatchi/700/500','Rp650.000 nett/malam',1),(5,2,'Pandora','Tenda glamping kapasitas 4 orang dengan 2 kasur busa 200x90cm, 4 bantal, 4 selimut. Sudah termasuk akses Waterpark & spot foto Kleine Holland.','https://picsum.photos/seed/glamping-pandora/700/500','Rp750.000 nett/malam',2),(6,2,'Village','Tenda Naturehike kapasitas 6 orang dengan 2 kasur busa 200x140cm, 6 bantal, 6 selimut. Sudah termasuk akses Waterpark & spot foto Kleine Holland.','https://picsum.photos/seed/glamping-village/700/500','Rp1.100.000 nett/malam',3),(7,2,'Village Suite','Tenda premium kapasitas 4 orang lengkap fire pit, lampu rangkaian, dan 4 set amenities. Sudah termasuk akses Waterpark & spot foto Kleine Holland.','https://picsum.photos/seed/glamping-villagesuite/700/500','Rp1.500.000 nett/malam',4),(11,4,'Kompor + Set','Rp 50.000','','',1),(12,4,'Gas','Rp 25.000','','',2),(13,4,'Nesting Set','Rp 30.000','','',3),(14,5,'Sleeping Bag','Rp 20.000','','',1),(15,5,'Matras','Rp 15.000','','',2),(16,5,'Set Kasur 90x200 (1 Bantal, 1 Selimut)','Rp 75.000','','',3),(17,5,'Bantal','Rp 10.000','','',4),(18,5,'Selimut','Rp 10.000','','',5),(21,6,'Meja Lipat','Rp 25.000','','',1),(22,6,'Kursi Lipat','Rp 25.000','','',2),(23,6,'Lampu Tenda Alkaline + Baterai','Rp 25.000','','',3),(24,6,'Baterai Alkaline','Rp 5.000','','',4),(25,6,'Lampu Krompyong','Rp 50.000','','',5),(26,6,'Kayu Bakar','Rp 25.000','','',6),(27,6,'Bonfire (5 Kayu Bakar)','Rp 150.000','','',7),(28,6,'Flysheet 3x4','Rp 150.000','','',8),(29,6,'Dome Shelter','Rp 300.000','','',9),(36,7,'Kebun Apel','Petik apel Batu segar langsung dari pohon, ditemani pemandu kebun.','https://picsum.photos/seed/petik-kebun-apel/700/900','',1),(37,7,'Kebun Strawberry','Petik strawberry manis, cocok untuk anak-anak.','https://picsum.photos/seed/petik-kebun-strawberry/700/500','',2),(38,7,'Kebun Jeruk','Jelajahi barisan pohon jeruk pegunungan yang sejuk.','https://picsum.photos/seed/petik-kebun-jeruk/700/500','',3),(39,7,'Kebun Jambu Merah','Petik jambu merah matang di tengah udara pegunungan yang sejuk, lalu nikmati langsung di kebun.','https://picsum.photos/seed/petik-kebun-jambu/700/900','',4),(40,8,'Gatchi','Rp650.000 nett','1 Tenda Naturehike (2-3 orang)','Kasur busa sesuai kapasitas, 2 bantal & 2 selimut, sprei, lampu tenda, 2 kursi (BB maks 80kg), meja lipat, flysheet & lampu gantung, rak & kompor portable, alat masak & makan, gas portable, dinner grill 250gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.',1),(41,8,'Pandora','Rp750.000 nett','1 Tenda Glamping (4 orang)','2 kasur busa 200x90cm, 4 bantal, 4 selimut, 2 sprei, lampu tenda, 4 kursi, meja lipat, rak kayu besi & lampu rangkaian, rak & kompor portable, alat masak & makan, gas portable, dinner grill 250gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.',2),(42,8,'Village','Rp1.100.000 nett','1 Tenda Naturehike (6 orang)','2 kasur busa 200x140cm, 6 bantal, 6 selimut, 2 sprei, lampu tenda, 6 kursi, meja lipat, rak kayu besi & lampu rangkaian, rak & kompor portable, alat masak & makan, gas portable, dinner grill 500gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.',3),(43,8,'Village Suite','Rp1.500.000 nett','1 Tenda Naturehike (4 orang)','2 kasur, 4 bantal, 4 selimut, 2 sprei, lampu tenda, 4 set amenities, fire pit, 4 kursi & meja lipat, lampu rangkaian, rak & kompor portable, alat masak & makan, gas portable, dinner grill 500gr beef. Termasuk area parkir & akses listrik, kamar mandi air hangat, tiket Waterpark & spot foto Kleine Holland.',4),(44,9,'Weekday','Rp250.000/mobil','Maks 4 orang','Venue, listrik, kamar mandi (air hangat/dingin), free tiket masuk Kleine Holland. Harga tidak termasuk perlengkapan camping (tenda, kabel roll listrik, makanan, dll).',1),(45,9,'Weekend','Rp350.000/mobil','Maks 4 orang','Venue, listrik, kamar mandi (air hangat/dingin), free tiket masuk Kleine Holland. Harga tidak termasuk perlengkapan camping (tenda, kabel roll listrik, makanan, dll).',2),(46,9,'Check-in','14.00 WIB','-','-',3),(47,9,'Check-out','10.00 WIB','-','-',4),(48,10,'Kompor + Set','Rp50.000','Kitchen Set','',1),(49,10,'Gas','Rp25.000','Kitchen Set','',2),(50,10,'Nesting Set','Rp30.000','Kitchen Set','',3),(51,10,'Sleeping Bag','Rp20.000','Sleeping System','',4),(52,10,'Matras','Rp15.000','Sleeping System','',5),(53,10,'Set Kasur 90x200 (1 Bantal, 1 Selimut)','Rp75.000','Sleeping System','',6),(54,10,'Bantal','Rp10.000','Sleeping System','',7),(55,10,'Selimut','Rp10.000','Sleeping System','',8),(56,10,'Meja Lipat','Rp25.000','Lain-lain','',9),(57,10,'Kursi Lipat','Rp25.000','Lain-lain','',10),(58,10,'Lampu Tenda Alkaline + Baterai','Rp25.000','Lain-lain','',11),(59,10,'Baterai Alkaline','Rp5.000','Lain-lain','',12),(60,10,'Lampu Krompyong','Rp50.000','Lain-lain','',13),(61,10,'Kayu Bakar','Rp25.000','Lain-lain','',14),(62,10,'Bonfire (5 Kayu Bakar)','Rp150.000','Lain-lain','',15),(63,10,'Flysheet 3x4','Rp150.000','Lain-lain','',16),(64,10,'Dome Shelter','Rp300.000','Lain-lain','',17),(79,1,'Kolam Apel (Kiddy Pool)','Kolam dangkal yang aman untuk anak-anak, dilengkapi ember tumpah, pancuran air, perosotan mini, dan hiasan patung buah warna-warni.','https://picsum.photos/seed/wp-kolam-apel/500/400','',1),(80,1,'Wahana Jambu (Body Slide)','Seluncuran air tipe body slide yang berkelok-kelok dari ketinggian cukup tinggi untuk memacu adrenalin.','https://picsum.photos/seed/wp-wahana-jambu/500/400','',2),(81,1,'Racer Slide','Seluncuran lurus berjajar yang bisa digunakan untuk meluncur bersamaan atau balapan dengan teman.','https://picsum.photos/seed/wp-racer-slide/500/400','',3),(82,1,'Wahana Strawberry (Family Slide)','Perosotan berukuran lebih lebar dan pendek, sangat cocok untuk berseluncur bersama keluarga atau anak-anak.','https://picsum.photos/seed/wp-wahana-strawberry/500/400','',4),(83,1,'Kolam Arus','Kolam mengalir santai yang mengitari area, pas untuk bersantai menggunakan ban pelampung.','https://picsum.photos/seed/wp-kolam-arus/500/400','',5),(84,1,'Kolam Kopi (Hot Water Pool)','Kolam air hangat yang dangkal untuk relaksasi tubuh setelah dinginnya bermain air di area Batu.','https://picsum.photos/seed/wp-kolam-kopi/500/400','',6),(88,1,'Kolam Apel (Kiddy Pool)','Kolam dangkal yang aman untuk anak-anak, dilengkapi ember tumpah, pancuran air, perosotan mini, dan hiasan patung buah warna-warni.','https://picsum.photos/seed/wp-kolam-apel/500/400','',1),(89,1,'Wahana Jambu (Body Slide)','Seluncuran air tipe body slide yang berkelok-kelok dari ketinggian cukup tinggi untuk memacu adrenalin.','https://picsum.photos/seed/wp-wahana-jambu/500/400','',2),(90,1,'Racer Slide','Seluncuran lurus berjajar yang bisa digunakan untuk meluncur bersamaan atau balapan dengan teman.','https://picsum.photos/seed/wp-racer-slide/500/400','',3),(91,1,'Wahana Strawberry (Family Slide)','Perosotan berukuran lebih lebar dan pendek, sangat cocok untuk berseluncur bersama keluarga atau anak-anak.','https://picsum.photos/seed/wp-wahana-strawberry/500/400','',4),(92,1,'Kolam Arus','Kolam mengalir santai yang mengitari area, pas untuk bersantai menggunakan ban pelampung.','https://picsum.photos/seed/wp-kolam-arus/500/400','',5),(93,1,'Kolam Kopi (Hot Water Pool)','Kolam air hangat yang dangkal untuk relaksasi tubuh setelah dinginnya bermain air di area Batu.','https://picsum.photos/seed/wp-kolam-kopi/500/400','',6),(97,1,'Kolam Apel (Kiddy Pool)','Kolam dangkal yang aman untuk anak-anak, dilengkapi ember tumpah, pancuran air, perosotan mini, dan hiasan patung buah warna-warni.','https://picsum.photos/seed/wp-kolam-apel/500/400','',1),(98,1,'Wahana Jambu (Body Slide)','Seluncuran air tipe body slide yang berkelok-kelok dari ketinggian cukup tinggi untuk memacu adrenalin.','https://picsum.photos/seed/wp-wahana-jambu/500/400','',2),(99,1,'Racer Slide','Seluncuran lurus berjajar yang bisa digunakan untuk meluncur bersamaan atau balapan dengan teman.','https://picsum.photos/seed/wp-racer-slide/500/400','',3),(100,1,'Wahana Strawberry (Family Slide)','Perosotan berukuran lebih lebar dan pendek, sangat cocok untuk berseluncur bersama keluarga atau anak-anak.','https://picsum.photos/seed/wp-wahana-strawberry/500/400','',4),(101,1,'Kolam Arus','Kolam mengalir santai yang mengitari area, pas untuk bersantai menggunakan ban pelampung.','https://picsum.photos/seed/wp-kolam-arus/500/400','',5),(102,1,'Kolam Kopi (Hot Water Pool)','Kolam air hangat yang dangkal untuk relaksasi tubuh setelah dinginnya bermain air di area Batu.','https://picsum.photos/seed/wp-kolam-kopi/500/400','',6),(103,13,'Foam Party (Mandi Busa)','Acara seru-seruan mandi busa yang biasanya diadakan pada jam tertentu (high season / akhir pekan).','https://picsum.photos/seed/wp-foam-party/500/400','',1),(104,13,'Playground Non-Air','Area bermain kering luar ruangan untuk balita atau anak-anak yang tidak ingin basah-basahan.','https://picsum.photos/seed/wp-playground/500/400','',2),(105,13,'Fasilitas Pendukung','Penyewaan gazebo (sekitar Rp50.000 / 2 jam), loker penyimpanan, ban/pelampung, kafetaria, dan ruang bilas.','https://picsum.photos/seed/wp-fasilitas-pendukung/500/400','',3);
/*!40000 ALTER TABLE `simple_page_category_rows` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `simple_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `hero_title` varchar(200) DEFAULT NULL,
  `hero_sub` text DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `about_title` varchar(200) DEFAULT NULL,
  `about_image` varchar(255) DEFAULT NULL,
  `about_p1` text DEFAULT NULL,
  `about_p2` text DEFAULT NULL,
  `hours_sunrise_open` varchar(10) DEFAULT NULL,
  `hours_sunrise_close` varchar(10) DEFAULT NULL,
  `hours_sunset_open` varchar(10) DEFAULT NULL,
  `hours_sunset_close` varchar(10) DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `simple_pages` WRITE;
/*!40000 ALTER TABLE `simple_pages` DISABLE KEYS */;
INSERT INTO `simple_pages` VALUES (1,'waterpark','Judul Halaman\nWaterpark di Sini','Ini teks placeholder. Ganti judul, deskripsi singkat, dan foto latar di bagian ini sesuai konten Waterpark yang sebenarnya.','https://picsum.photos/seed/waterpark-placeholder/1600/1000','Botanical Water Trails','https://picsum.photos/seed/waterpark-about/700/600','Tulis deskripsi jalur air alami di sini ÔÇö sumber mata air, proses filtrasi alami, atau jalur botani yang bisa dilalui pengunjung.','Tambahkan paragraf kedua bila perlu, atau hapus bagian ini kalau tidak dibutuhkan.',NULL,NULL,NULL,NULL,'[\"https://picsum.photos/seed/wp-gal-1/700/900\",\"https://picsum.photos/seed/wp-gal-2/500/500\",\"https://picsum.photos/seed/wp-gal-3/500/500\",\"https://picsum.photos/seed/wp-gal-4/1400/500\"]','2026-08-24 09:12:54','2026-08-24 09:12:54'),(2,'thana','Judul Halaman\nThana di Sini','Ini teks placeholder. Ganti judul, deskripsi singkat, dan foto latar di bagian ini sesuai konten Thana yang sebenarnya.','https://picsum.photos/seed/thana-placeholder/1600/1000','Judul Section Placeholder','https://picsum.photos/seed/thana-about/700/600','Tulis deskripsi Thana di sini ÔÇö konsep ruang relaksasi, fasilitas yang tersedia, atau suasana yang ditawarkan.','Tambahkan paragraf kedua bila perlu, atau hapus bagian ini kalau tidak dibutuhkan.','04:00','10:00','14:00','22:00','[\"https://picsum.photos/seed/thana-gal-1/700/900\",\"https://picsum.photos/seed/thana-gal-2/500/500\",\"https://picsum.photos/seed/thana-gal-3/500/500\",\"https://picsum.photos/seed/thana-gal-4/1400/500\"]','2026-08-24 09:12:54','2026-08-24 09:13:57'),(3,'klene-holland','Judul Halaman\nKlene Holland di Sini','Ini teks placeholder. Ganti judul, deskripsi singkat, dan foto latar di bagian ini sesuai konten Klene Holland yang sebenarnya.','https://picsum.photos/seed/klene-holland-placeholder/1600/1000','Judul Section Placeholder','https://picsum.photos/seed/klene-holland-about/700/600','Tulis deskripsi Klene Holland di sini ÔÇö sejarah bangunan, gaya arsitektur, atau kegiatan yang bisa dilakukan pengunjung.','Tambahkan paragraf kedua bila perlu, atau hapus bagian ini kalau tidak dibutuhkan.',NULL,NULL,NULL,NULL,'[\"https://picsum.photos/seed/kh-gal-1/700/900\",\"https://picsum.photos/seed/kh-gal-2/500/500\",\"https://picsum.photos/seed/kh-gal-3/500/500\",\"https://picsum.photos/seed/kh-gal-4/1400/500\"]','2026-08-24 09:12:54','2026-08-24 09:12:54'),(4,'glamping','Pricelist Glamping<br>Kusuma Agrowisata','Rasakan sensasi liburan yang berbeda di Kusuma Agrowisata -- menginap di tengah kebun dengan pemandangan gunung, dilengkapi tenda glamping yang nyaman.','https://picsum.photos/seed/glamping-placeholder/1600/1000','Bermalam di Tengah Kebun','https://picsum.photos/seed/glamping-about/700/600','Setiap tenda glamping Kusuma Agrowisata sudah dilengkapi kasur, bantal, selimut, dan lampu tenda -- tinggal datang dan menikmati malam berbintang tanpa repot bawa perlengkapan sendiri.','Seluruh tipe tenda sudah termasuk akses parkir, listrik, kamar mandi air hangat, serta akses Waterpark & spot foto Kleine Holland. Check-in pukul 14.00 WIB, check-out pukul 10.00 WIB.',NULL,NULL,NULL,NULL,'[\"https://picsum.photos/seed/glamping-gal-1/700/900\",\"https://picsum.photos/seed/glamping-gal-2/500/500\",\"https://picsum.photos/seed/glamping-gal-3/500/500\",\"https://picsum.photos/seed/glamping-gal-4/1400/500\"]','2026-08-24 09:12:54','2026-08-24 09:12:54'),(5,'petik','Petik dari Akarnya.','Rasakan langsung sejuknya kebun Kusuma Agrowisata -- petik apel, strawberry, jeruk, dan jambu segar bersama keluarga, langsung dari pohonnya.','https://picsum.photos/seed/petik-forest-hero/1600/1000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-08-24 09:12:54','2026-08-24 09:12:54');
/*!40000 ALTER TABLE `simple_pages` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `site_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_key` varchar(60) NOT NULL,
  `label` varchar(150) NOT NULL,
  `alt_match` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `image_key` (`image_key`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `site_images` WRITE;
/*!40000 ALTER TABLE `site_images` DISABLE KEYS */;
INSERT INTO `site_images` VALUES (1,'hero_waterpark','Hero - Kartu Waterpark','Wahana waterpark seluncuran','https://picsum.photos/seed/waterpark-slide/600/800','Beranda',1),(2,'hero_outbound','Hero - Kartu Outbound','Wahana outbound mini off-road','https://picsum.photos/seed/offroad-outbound/600/800','Beranda',2),(3,'hero_foodcoffee','Hero - Kartu Food & Coffee','Hidangan khas Food and Coffee','https://picsum.photos/seed/apple-dish/600/800','Beranda',3),(4,'philosophy_main','Cerita Kami - Foto Utama','Pengunjung memetik apel langsung dari pohon','https://picsum.photos/seed/apple-picking-woman/700/900','Beranda',4),(5,'philosophy_inset','Cerita Kami - Foto Kecil (Inset)','Pemandangan kebun Kusuma Agrowisata','https://picsum.photos/seed/kusuma-hillside-view/500/380','Beranda',5),(6,'gallery_1','Galeri - Foto 1','Pengunjung berjalan di jembatan kayu hutan','https://picsum.photos/seed/hiker-boardwalk/400/580','Galeri',6),(7,'gallery_2','Galeri - Foto 2','Pintu masuk sanctuary bertuliskan Agrowisata','https://picsum.photos/seed/entrance-sign/400/580','Galeri',7),(8,'gallery_3','Galeri - Foto 3','Detail daun pakis hijau','https://picsum.photos/seed/fern-macro/400/580','Galeri',8),(9,'gallery_4','Galeri - Foto 4','Siluet lompatan di tebing saat senja','https://picsum.photos/seed/cliff-sunset/400/580','Galeri',9),(10,'fc_hero','Food & Coffee - Foto Hero','Premium Coffee and Farm Concept','https://picsum.photos/seed/coffeehero/1400/800','Food & Coffee',10),(11,'fc_split','Food & Coffee - Foto Cerita Kuliner','Kusuma Agrowisata Area','https://picsum.photos/seed/aboutmedia/700/600','Food & Coffee',11),(12,'ob_hero','Outbound - Foto Hero','Kabut pagi di kawasan hutan outbound Kusuma Agrowisata','https://picsum.photos/seed/outbound-forest-mist/1600/1000','Outbound',12),(13,'ob_experience','Outbound - Foto Our Experience','Peserta outbound menaiki mini off-road ATV','https://picsum.photos/seed/outbound-team-cabin/700/900','Outbound',13),(14,'ob_gallery_main','Outbound - Galeri Foto Utama','Peserta mengendarai mini off-road buggy','https://picsum.photos/seed/atv-bw-outbound/700/900','Outbound',14),(15,'ob_gallery_side1','Outbound - Galeri Foto Kecil 1','Peserta meluncur flying fox','https://picsum.photos/seed/flyingfox-jump/500/500','Outbound',15),(16,'ob_gallery_side2','Outbound - Galeri Foto Kecil 2','Rombongan peserta outbound berfoto bersama','https://picsum.photos/seed/bonfire-circle-night/500/500','Outbound',16),(17,'ob_gallery_wide','Outbound - Galeri Foto Panjang','Pemandangan area outbound Kusuma Agrowisata','https://picsum.photos/seed/aerial-outbound-camp/1400/500','Outbound',17);
/*!40000 ALTER TABLE `site_images` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `companies_subtitle` text DEFAULT NULL,
  `services_subtitle` text DEFAULT NULL,
  `team_subtitle` text DEFAULT NULL,
  `about_subtitle` text DEFAULT NULL,
  `gallery_subtitle` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone_link` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `maps_embed_url` text DEFAULT NULL,
  `maps_link_url` varchar(255) DEFAULT NULL,
  `ig_url` varchar(255) DEFAULT NULL,
  `fb_url` varchar(255) DEFAULT NULL,
  `yt_url` varchar(255) DEFAULT NULL,
  `tiktok_url` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `whatsapp_message` text DEFAULT NULL,
  `footer_about` text DEFAULT NULL,
  `footer_copyright_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'Upload/logo/1783906320_dda09745c75df4a0e3a6.png','Empat unit usaha yang tumbuh dari satu kebun apel kecil di Kota Batu, kini menaungi wisata, hotel, hunian, hingga industri olahan buah.','Dari wisata petik buah sampai penyelenggaraan acara — beragam layanan yang kami hadirkan untuk pengunjung dan mitra.','Orang-orang yang menjalankan keseharian Kusuma Group.','Perjalanan panjang dari kebun kecil seluas 1,8 hektar hingga menjadi grup usaha yang menghadirkan kebahagiaan untuk banyak keluarga.','Sedikit cerita dalam foto dari kebun, kolam renang, hingga kamar hotel kami.','Jl. Abdul Gani Atas, Kota Batu, Jawa Timur 65311','0800-159-3333','+628001593333','info@kusuma.co','https://www.google.com/maps?q=Kusuma+Agrowisata+Batu&output=embed','https://www.google.com/maps/search/?api=1&query=Kusuma+Agrowisata+Batu','https://www.instagram.com/blupblup.th/','https://facebook.com/kusumaagrowisata','https://youtube.com','https://tiktok.com','6288803300699','Halo Kusuma Agrowisata, saya ingin bertanya tentang wisata di sini.','Kusuma Agrowisata Group menghadirkan wisata petik buah, hotel resort, waterpark, hunian, dan produk olahan apel asli Kota Batu sejak 1989.','PT Kusuma Satria Dinasasri Wisatajaya','2026-08-24 17:45:19');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,'35+','Tahun Berpengalaman',1),(2,'60+','Hektar Area Wisata',2),(3,'10+','Jenis Buah Siap Petik',3),(4,'150+','Kamar Hotel & Cottage',4);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `position` varchar(150) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES (1,'Ir. Edy Antoro','Pendiri & Komisaris','',1);
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Rina, Malang','Liburan keluarga paling seru! Anak-anak suka banget petik strawberry dan main di waterpark.',5,1),(2,'Budi, Surabaya','Hotelnya nyaman, udaranya sejuk, sarapannya enak. Pasti balik lagi.',5,2),(3,'Sari, Batu','Oleh-oleh Siiplah wajib dibawa pulang, seger banget rasa apelnya.',5,3);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

