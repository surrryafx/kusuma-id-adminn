<?php
$host = 'localhost';
$db   = 'kusuma_admin';
$user = 'root';
$pass = 'femas12';

try {
    $pdo = new PDO(
        "mysql:host={$host};dbname={$db};charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        ]
    );
} catch (PDOException $e) {
    // Kalau db gagal connect, content.php akan fallback ke array kosong
    // (lihat content.php) supaya halaman tetap tampil, bukan error total.
    $pdo = null;
}
