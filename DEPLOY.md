# Panduan Deploy ke cPanel — Kusuma ID (kusuma-id-admin)

Checklist untuk deploy project ini ke hosting cPanel, menggantikan situs lama di www.kusuma.id.

## 1. PHP version
Project ini butuh **PHP 8.1 atau lebih baru** (CodeIgniter 4.6).

- Masuk cPanel → **MultiPHP Manager** → pilih domain ini → set PHP ke 8.1+ (disarankan versi stabil terbaru yang tersedia, mis. 8.2/8.3).
- Di **MultiPHP INI Editor** / **PHP Extensions**, pastikan aktif: `intl`, `mbstring`, `curl`, `mysqli`, `gd`, `fileinfo`, `openssl`.

## 2. Document root
CodeIgniter 4 punya folder `public/` sebagai document root, BUKAN root project itu sendiri (`app/`, `vendor/`, `writable/` tidak boleh bisa diakses langsung dari web).

- Kalau paket hosting mengizinkan custom document root per domain (cPanel → **Domains** → edit domain ini), arahkan document root ke folder `public/` di dalam project (mis. `/home/USER/kusuma-id-admin/public`).
- Kalau tidak bisa (banyak shared hosting memaksa `public_html`), taruh seluruh project DI LUAR `public_html` (mis. `/home/USER/kusuma-id-admin/`), lalu salin **isi** folder `public/` ke `public_html/` dan sesuaikan path `require` di `public_html/index.php` supaya menunjuk ke lokasi project yang benar (`FCPATH`, `paths.php`, dst.) — cara ini lebih rawan salah, jadi opsi pertama (custom document root) lebih disarankan kalau tersedia.

## 3. Upload project & install dependency
- Upload semua file KECUALI folder `vendor/` (lebih ringan), lalu masuk **cPanel Terminal / SSH** dan jalankan di root project:
  ```
  composer install --no-dev --optimize-autoloader
  ```
- Kalau hosting tidak punya akses Terminal/SSH/Composer, install dependency dulu di lokal (`composer install --no-dev --optimize-autoloader`) lalu upload folder `vendor/` ikut ter-zip.

## 4. Database
- Buat database + user MySQL baru lewat cPanel → **MySQL Databases**, catat nama database/user/password-nya.
- Import schema dari `app/Database/kusuma_admin.sql` lewat **phpMyAdmin** cPanel (data awal/seed sudah termasuk di file ini).

## 5. File `.env`
Buat file `.env` di root project (**bukan** di dalam `public/`), isi minimal:
```
CI_ENVIRONMENT = production

app.baseURL = 'https://www.kusuma.id/'

database.default.hostname = localhost
database.default.database = NAMA_DATABASE_CPANEL
database.default.username = USER_DATABASE_CPANEL
database.default.password = PASSWORD_DATABASE_CPANEL
database.default.DBDriver = MySQLi
database.default.port = 3306

encryption.key = hex2bin:GENERATE_KEY_BARU_DI_SINI
```
Generate `encryption.key` baru (jangan pakai yang sama dengan environment testing/development) via Terminal cPanel:
```
php spark key:generate
```

## 6. Permission folder
Folder `writable/` (dan subfolder `logs`, `cache`, `session`, `debugbar`, `uploads`) harus bisa ditulis web server. Set permission **755** (atau **775** kalau 755 belum cukup) — jangan pakai 777.

## 7. HTTPS
cPanel umumnya menyediakan SSL gratis (AutoSSL / Let's Encrypt) — aktifkan lewat **SSL/TLS Status**. Setelah SSL aktif:
- Situs otomatis redirect HTTP → HTTPS (filter `forcehttps` sudah aktif secara default di `app/Config/Filters.php`).
- Cookie sesi otomatis diset `secure` (lihat `app/Config/Cookie.php`) begitu `CI_ENVIRONMENT = production`.

## 8. Setelah live — verifikasi cepat
- Buka domain → landing page harus tampil dengan data asli (bukan halaman error/debug toolbar).
- Coba `/login` → login dengan akun admin asli.
- Coba tambah/edit satu data dari dashboard → pastikan tersimpan.
- Pastikan `/api/content/...` TIDAK bisa diakses tanpa login (harus 401), untuk konfirmasi endpoint ini benar-benar terkunci di server production.
