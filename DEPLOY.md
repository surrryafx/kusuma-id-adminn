# Panduan Deploy ke cPanel — Kusuma ID (`kusuma-id-admin`)

Panduan deploy project ini ke hosting cPanel, menggantikan situs lama di www.kusuma.id.

> **Baca bagian 0 lebih dulu.** Project ini tidak berdiri sendiri — ada 3 sistem lain yang berbagi database dan saling memanggil. Salah urutan atau salah pisah database akan membuat login di semua sistem gagal.

---

## 0. Peta ketergantungan antar-project (BACA DULU)

Lima project saling terkait. Yang paling menentukan keputusan hosting:

```
kusuma-agro (situs statis)  ──fetch──►  kusuma-agro-backend ──┐
                                                              ├──► DB: adminkusuma_db
kusuma-agro-frontend        ──fetch──►  kusuma-id-admin ──────┘     (tabel admins + api_tokens
(dashboard admin)           ──fetch──►  kusuma-agro-backend          dipakai BERSAMA)
                            ──iframe──► kusuma-industri ──────►  DB: kusuma_industri
                                                                  + baca adminkusuma_db.admins
```

**Konsekuensi yang tidak bisa ditawar:**

| Aturan | Kenapa |
|---|---|
| `kusuma-agro-backend`, `kusuma-id-admin`, dan `kusuma-industri` **HARUS bisa mengakses database `adminkusuma_db` yang sama** | Ketiganya memverifikasi login ke tabel `admins` yang sama. Kalau dipisah ke server/akun cPanel berbeda tanpa akses lintas-database, login akan gagal total di minimal dua sistem |
| Token dari `kusuma-agro-backend` dipakai juga oleh `kusuma-id-admin` | Keduanya membaca tabel `api_tokens` yang sama. Satu login, dipakai dua API |
| **HTTPS wajib aktif sebelum ada yang login** | `CI_ENVIRONMENT=production` otomatis membuat cookie sesi `secure`. Tanpa HTTPS, cookie tidak terkirim dan **login tidak akan pernah berhasil** — ini bukan bug, pernah terjadi saat testing |

**Urutan deploy yang disarankan:**
1. `kusuma-agro-backend` (penyedia database + endpoint login)
2. `kusuma-id-admin` (project ini)
3. `kusuma-industri`
4. `kusuma-agro` dan `kusuma-agro-frontend` (keduanya statis, tinggal ganti URL API)

---

## 1. PHP version

Butuh **PHP 8.1+** (CodeIgniter 4.6). Sudah diuji di PHP 8.3.

- cPanel → **MultiPHP Manager** → pilih domain ini → set PHP **8.1 atau lebih baru** (pakai versi stabil terbaru yang tersedia).
- cPanel → **Select PHP Version** / **PHP Extensions**, pastikan aktif: `intl`, `mbstring`, `curl`, `mysqli`, `gd`, `fileinfo`, `openssl`.

`gd` wajib — dipakai `ImageUploadGuard::shrink()` untuk memperkecil foto besar saat upload. Tanpa itu, foto 6 MB dari kamera masuk apa adanya ke situs.

## 2. Document root

CodeIgniter 4 memakai folder `public/` sebagai document root. Folder `app/`, `vendor/`, `writable/`, dan file `.env` **tidak boleh** bisa diakses dari web.

**Cara yang disarankan** — custom document root:
cPanel → **Domains** → edit domain → arahkan document root ke `/home/USER/kusuma-id-admin/public`.

**Kalau hosting memaksa `public_html`:** taruh project di luar `public_html` (mis. `/home/USER/kusuma-id-admin/`), salin **isi** `public/` ke `public_html/`, lalu sesuaikan path di `public_html/index.php` (`FCPATH`, `paths.php`). Cara ini lebih rawan salah — pakai opsi pertama kalau tersedia.

> ⚠️ Kalau seluruh project terlanjur ditaruh di dalam `public_html`, **`.env` bisa diunduh siapa pun** lewat `https://domain/.env` — berisi password database dan `encryption.key`. Pastikan tidak begini.

## 3. Upload & install dependency

```bash
git clone https://github.com/kusumatech-org/kusuma-id-admin.git
cd kusuma-id-admin
composer install --no-dev --optimize-autoloader
```

Kalau hosting tidak punya Terminal/SSH/Composer: jalankan `composer install --no-dev --optimize-autoloader` di lokal, lalu upload berikut folder `vendor/`.

## 4. Database

1. cPanel → **MySQL Databases** → buat database + user, beri **ALL PRIVILEGES**. Catat nama database, user, dan password (cPanel biasanya memberi prefix, mis. `kusuma_adminkusuma`).
2. Import lewat **phpMyAdmin**: `app/Database/adminkusuma_db_full_snapshot_20260824.sql`

   > 📌 **Pakai file itu, JANGAN `kusuma_admin.sql`** — file lama itu tertinggal jauh dan sudah tidak dipakai.

   Snapshot ini berisi **31 tabel**: 10 tabel CMS project ini + 20 tabel `kusuma-agro-backend` + `api_tokens`. Jadi satu import ini sekaligus menyiapkan database untuk `kusuma-agro-backend` juga.
3. Saat import, pastikan charset **utf8mb4** supaya karakter seperti em-dash (—) tidak berubah jadi `?`.

## 5. File `.env`

Buat `.env` di root project (**bukan** di dalam `public/`):

```
CI_ENVIRONMENT = production

app.baseURL = 'https://www.kusuma.id/'

database.default.hostname = localhost
database.default.database = NAMA_DATABASE_CPANEL
database.default.username = USER_DATABASE_CPANEL
database.default.password = PASSWORD_DATABASE_CPANEL
database.default.DBDriver = MySQLi
database.default.port = 3306

encryption.key = hex2bin:GENERATE_BARU_DI_SINI
```

**Generate `encryption.key` baru** — jangan pakai key development yang ada di HANDOFF.md:
```bash
php spark key:generate
```

`app.baseURL` harus **persis** domain final berikut `https://` dan garis miring penutup. Salah di sini membuat semua URL aset (CSS, JS, gambar) rusak.

## 6. Permission folder

`writable/` beserta subfolder (`logs`, `cache`, `session`, `debugbar`, `uploads`) harus bisa ditulis web server. Set **755** (atau **775** kalau belum cukup). **Jangan 777.**

Folder `public/Upload/` juga harus bisa ditulis — di situlah gambar dari CMS disimpan.

## 7. HTTPS

Aktifkan lewat cPanel → **SSL/TLS Status** (AutoSSL / Let's Encrypt gratis). Setelah aktif:
- Redirect HTTP → HTTPS otomatis (filter `forcehttps` sudah aktif di `app/Config/Filters.php`).
- Cookie sesi otomatis `secure` (`app/Config/Cookie.php`) begitu `CI_ENVIRONMENT=production`.

**Aktifkan SSL SEBELUM mencoba login.** Lihat peringatan di bagian 0.

## 8. CORS — kunci ke domain dashboard

Saat ini `app/Controllers/Api.php` masih mengirim `Access-Control-Allow-Origin: *`, artinya API bisa dipanggil dari domain manapun. Untuk production, ganti `*` dengan domain dashboard yang sebenarnya (tempat `kusuma-agro-frontend` di-host):

```php
header('Access-Control-Allow-Origin: https://dashboard.kusuma.id');
```

Endpoint sudah terkunci autentikasi, jadi ini lapisan pertahanan tambahan — tapi tetap sebaiknya dipersempit.

## 9. Bersihkan sebelum diserahkan

- [ ] **Hapus akun test `reviewer`** dari tabel `admins`:
      `DELETE FROM admins WHERE username = 'reviewer';`
      **Pastikan akun admin asli sudah ada dan password-nya diketahui SEBELUM menghapus ini** — kalau tidak, tidak ada yang bisa masuk. Akun `admin` (id 1) ada di database tapi plaintext password-nya tidak diketahui.
- [ ] Ganti foto yang masih placeholder lewat CMS (foto Kusuma Agro Industri, foto Services yang masih `picsum.photos`, foto founder) — lihat HANDOFF.md bagian 13.
- [ ] Perbaiki URL sosial media di **Site Settings** — Instagram masih menunjuk akun yang bukan milik Kusuma, dan ikut terbaca mesin pencari lewat JSON-LD.

## 10. Verifikasi setelah live

```bash
curl -I https://www.kusuma.id/                          # 200, dan redirect http -> https jalan
curl -o /dev/null -s -w "%{http_code}\n" https://www.kusuma.id/api/content/companies   # harus 401
curl -s https://www.kusuma.id/halaman-ngawur -H "Accept: text/html" | grep -c "Kembali ke Beranda"  # 1 = halaman 404 branded jalan
```

Lalu cek lewat browser:
- Landing page tampil dengan data asli, **tanpa debug toolbar** (kalau toolbar muncul, berarti `CI_ENVIRONMENT` belum `production`).
- Section "Layanan Kami" dan "Manajemen Kami" tampil (atau tersembunyi rapi kalau datanya kosong — tidak boleh ada judul section tanpa isi).
- `/login` → masuk dengan akun admin asli.
- Tambah/edit satu data lewat dashboard → tersimpan.
- Upload satu foto besar (>3 MB) → tersimpan dan ukurannya otomatis mengecil (bukti `gd` + `shrink()` jalan).
- Tempel URL situs ke WhatsApp → preview harus muncul dengan judul, deskripsi, dan logo (bukti Open Graph jalan).

---

Panduan project lain: `kusuma-industri/DEPLOY.md`, `kusuma-agro-backend/DEPLOY.md`, `kusuma-agro/DEPLOY.md`, `kusuma-agro-frontend/DEPLOY.md`. Konteks lengkap semua project ada di `HANDOFF.md`.
