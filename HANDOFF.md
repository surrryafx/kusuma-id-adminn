# Handoff — Proyek Website Kusuma (5 repo, lanjut di PC lain / sesi Claude Code baru)

Dokumen ini dibuat supaya sesi Claude Code baru (di PC lain) langsung punya konteks penuh tanpa perlu dijelaskan ulang. Tempel/rujuk file ini di awal sesi baru. Ditulis dari sudut pandang: **semua 5 folder project sudah di-review & 4 di antaranya sudah di-hardening**, sekarang tinggal dipindah dan disiapkan untuk naik ke server produksi.

---

## 1. Ringkasan cepat

Semua repo sekarang milik organisasi GitHub **[`kusumatech-org`](https://github.com/kusumatech-org)** — Private, branch **`main`**, satu *initial commit* masing-masing, working tree bersih.

| Project | Repo | Peran | Status | Commit |
|---|---|---|---|---|
| `kusuma-agro` | [kusumatech-org/kusuma-agro](https://github.com/kusumatech-org/kusuma-agro) | Situs publik statis Kusuma Agrowisata (HTML+JS vanilla) | Direview + di-audit UI/UX. **Tidak ada perubahan kode** (keputusan user: isi konten jadi tugas admin) | `cf90195` |
| `kusuma-agro-backend` | [kusumatech-org/kusuma-agro-backend](https://github.com/kusumatech-org/kusuma-agro-backend) | REST API backend untuk `kusuma-agro` (CodeIgniter 3, legacy) | **Di-hardening** — semua endpoint tulis sekarang wajib token | `b457404` |
| `kusuma-agro-frontend` | [kusumatech-org/kusuma-agro-frontend](https://github.com/kusumatech-org/kusuma-agro-frontend) | Dashboard admin gabungan (`Login.html`, 1 file) untuk kelola Agro + ID + Industri | **Di-hardening** — login sungguhan ke server, bukan hardcoded lagi | `a1d6116` |
| `kusuma-id-admin` | [kusumatech-org/kusuma-id-admin](https://github.com/kusumatech-org/kusuma-id-admin) | Situs publik **kusuma.id** + CMS admin + API jadi 1 (CodeIgniter 4). **Ini yang rencananya menggantikan www.kusuma.id, target deploy ke cPanel** | **Di-hardening penuh** + **landing page corporate** (bagian 12), sudah ada `DEPLOY.md` | `7aac801` |
| `kusuma-industri` | [kusumatech-org/kusuma-industri](https://github.com/kusumatech-org/kusuma-industri) | Situs publik "Kusuma Agro Industri"/SIIPLAH + CMS admin jadi 1 (CodeIgniter 4, pola sama `kusuma-id-admin`) | **Di-hardening penuh** + data test dibersihkan + gambar dikompres | `eb77f46` |

> ✅ **SUDAH DI-PUSH SEMUA (24 Agustus 2026).** Kelima repo sudah ada di `kusumatech-org`, lokal & remote sinkron. Sudah diverifikasi: **`.env` tidak ikut ter-push** di kedua project CI4. Pekerjaan tidak lagi bergantung pada satu harddisk.
>
> Author commit: `Satria Piningit <programmer@kusuma.co>`.

> **Riwayat lama sudah dibuang secara sengaja.** Repo asal milik pribadi anak magang (`farahaufahwdh-creator/...`) dan riwayatnya memuat data pribadi mereka. Kelima repo di-`git init` ulang supaya bersih sebelum jadi milik perusahaan. Bundle cadangan riwayat lama ada di folder sementara — lihat **bagian 2a**.

---

## 2. Pindah repo ke kepemilikan Kusuma + pindah PC

### 2a. Repo sudah di-init ulang — SIAP di-push ke repo Kusuma (24 Agustus 2026)

**SUDAH DIKERJAKAN**: kelima repo di-`git init` ulang dari nol. Riwayat lama (milik repo pribadi anak magang) sudah dibuang seluruhnya, diganti satu *initial commit* per project yang menjelaskan kondisi & alasan.

Alasan tidak sekadar ganti `origin`: riwayat lama memuat data pribadi anak magang (nama **Farah**, email **farahaufahwdh@gmail.com** di `index (3).html`, foto grup, 3 screenshot layar pribadi berisi tab browser & pendaftaran beasiswa). Menghapus filenya saja tidak cukup — di git semuanya tetap bisa diambil dari commit lama. Untuk repositori milik perusahaan, riwayat bersih lebih berharga daripada jejak 9 commit yang sudah terdokumentasi lengkap di dokumen ini.

**Hasil sampingan**: repo jadi jauh lebih ramping karena versi lama foto-foto besar ikut terbuang.

| Repo | Commit | Sebelum | Sesudah |
|---|---|---|---|
| `kusuma-agro` | `5e1afac` | — | 506 KB |
| `kusuma-agro-backend` | `ba3d7f5` | — | 7,8 MB |
| `kusuma-agro-frontend` | `aa59639` | — | 462 KB |
| `kusuma-id-admin` | `94b3af8` | 48 MB | **11 MB** |
| `kusuma-industri` | `497b2a1` | 261 MB | **19 MB** |

Semua di branch **`main`**, working tree bersih, **belum ada `origin`** — tinggal disambungkan.

> 💾 **Riwayat lama TIDAK hilang permanen.** Sudah dicadangkan sebagai git bundle (153 MB) di folder scratchpad sesi:
> `…\scratchpad\git_history_backup\<nama-repo>.bundle`
> Pulihkan dengan `git clone <nama>.bundle <folder>` kalau suatu saat butuh. **Folder scratchpad bersifat sementara** — salin ke tempat aman kalau riwayat lama masih dianggap perlu.

### 2b. GitHub — SELESAI (24 Agustus 2026)

Organisasi **`kusumatech-org`** dibuat, 5 repo Private dibuat kosong (tanpa README/gitignore/license supaya push pertama tidak konflik), lalu semua di-push.

Konfigurasi yang sudah terpasang di PC ini:
- `credential.helper = manager-core` (Git Credential Manager, login lewat browser — tidak perlu token manual)
- `user.email = programmer@kusuma.co` **per repo** (bukan global; global masih Gmail pribadi)
- `origin` tiap repo → `https://github.com/kusumatech-org/<nama-repo>.git`

Di PC baru, tinggal:
```bash
git clone https://github.com/kusumatech-org/<nama-repo>.git
git config user.email programmer@kusuma.co     # per repo, ulangi tiap clone
```
Lalu salin `.env` terpisah untuk `kusuma-id-admin` & `kusuma-industri` (template di bagian 9 & 10), dan ikuti setup lokal (bagian 5–10 + bagian 13 poin 10–14).

### 2c. Pindah PC (sekarang jauh lebih sederhana)

Karena semua sudah di GitHub, tidak perlu lagi menyalin folder manual:

```bash
cd C:\xampp\htdocs
git clone https://github.com/kusumatech-org/kusuma-id-admin.git
git clone https://github.com/kusumatech-org/kusuma-industri.git
git clone https://github.com/kusumatech-org/kusuma-agro.git
git clone https://github.com/kusumatech-org/kusuma-agro-backend.git
git clone https://github.com/kusumatech-org/kusuma-agro-frontend.git
```

**Yang TIDAK ikut `git clone` dan harus disiapkan manual di tiap PC baru:**

| Item | Cara |
|---|---|
| `.env` (`kusuma-id-admin`, `kusuma-industri`) | Sengaja di-gitignore. Buat ulang dari template di bagian 9 & 10 |
| `vendor/` | `composer install` pakai PHP 8.3 (bagian 9 langkah 4) |
| `writable/cache\|logs\|session\|debugbar` | Buat foldernya kalau hilang |
| Database `adminkusuma_db` & `kusuma_industri` | Import snapshot, bagian 4a & 4b |
| PHP 8.3, `php.ini`, hosts file, `mod_expires`, vhost | Bagian 13 poin 10–14 — **semua ada di luar folder project** |
| `git config user.email programmer@kusuma.co` | Per repo, tiap habis clone |

> 📌 **Pelajaran dari kejadian nyata**: pekerjaan 22 Agustus di `kusuma-id-admin` pernah HILANG total karena folder diganti dengan hasil `git clone` ulang dari PC lain — lineage-nya beda, semua perubahan lenyap dan harus dikerjakan ulang dari awal. Sekarang risiko itu jauh berkurang karena semua sudah di GitHub, tapi kebiasaannya tetap: **commit & push sebelum berpindah PC, jangan pernah menimpa folder yang masih punya perubahan belum ter-commit.**

---

## 3. ⚠️ Sebelum naik ke server produksi (checklist konsolidasi)

Ini yang **PALING PENTING** untuk direview sebelum live — dikumpulkan dari semua temuan per-project di bawah:

### Wajib dibereskan di SEMUA project sebelum go-live
- [ ] **Generate `encryption.key` BARU** untuk tiap project CI4 (`kusuma-id-admin`, `kusuma-industri`) — jangan pakai key dev lokal yang ada di dokumen ini. `php spark key:generate` di server production.
- [ ] **`.env` production**: `CI_ENVIRONMENT = production`, `app.baseURL` ke domain asli (bukan `*.test`), `database.*` ke kredensial DB server yang sebenarnya.
- [x] ~~**Buat akun admin ASLI, lalu hapus akun test `reviewer`**~~ — **SELESAI 17 September 2026.**

      Kondisi akun sekarang di tabel `admins` (dipakai bersama 3 sistem):

      | ID | Username | Nama Lengkap | Untuk |
      |---|---|---|---|
      | 4 | `kag_admin` | KAG Admin | Pemilik/pengelola utama |
      | 5 | `admin` | Akun admin | Anak magang, pengisian konten |

      Akun `admin` id 1 warisan pengembang sebelumnya (password tidak diketahui siapa pun) dan akun test `reviewer` **sudah dihapus**, berikut 10 token kedaluwarsa miliknya di `api_tokens`.

      Perintah pengelolaannya (jalankan di root `kusuma-id-admin`, juga jalan di Terminal cPanel):
      ```bash
      php spark admin:password            # buat akun baru, atau ganti password akun yang ada
      php spark admin:remove <username>   # hapus akun (menolak kalau itu akun terakhir)
      ```
      `admin:password` bisa juga dipakai mengambil alih akun yang password lamanya tidak diketahui — cukup isi username yang sama.

      ⚠️ **Dua hal yang masih terbuka soal akun:**
      1. **Tidak ada pembagian hak akses sama sekali.** Tabel `admins` tidak punya kolom peran, dan tidak ada pengecekan level di controller maupun filter manapun. Setiap akun = akses penuh: bisa mengelola seluruh konten, **bisa mengubah/menghapus akun lain lewat menu Admins di dashboard**, dan otomatis bisa masuk ke `kusuma-industri` serta API `kusuma-agro-backend`. API sudah memblokir tabel `admins` (`Api.php` `$blocked`), tapi dashboard web tidak. Sudah disampaikan; keputusan sadar untuk sementara tidak memakai pembatasan.
      2. **Akun magang memakai username `admin`** — nama paling mudah ditebak untuk brute-force (ada rate limit 5x/menit/IP sebagai penahan). Nama lengkapnya juga generik, jadi tidak bisa ditelusuri siapa pemakainya kalau nanti ada magang kedua. **Hapus akun ini begitu masa magang selesai.**
- [ ] **8 file JS di `kusuma-agro`** (`dynamic-*.js`) dan `kusuma-agro-frontend/Login.html` masih hardcode `API_BASE_URL`/`ID_API_BASE_URL`/`INDUSTRI_ADMIN_URL` ke domain `*.test` — WAJIB diganti ke domain production sebelum deploy, kalau tidak situs publik & dashboard admin tidak akan bisa fetch data sama sekali.
- [ ] Pastikan **HTTPS aktif** di server production sebelum pengguna login — cookie session `kusuma-id-admin` & `kusuma-industri` otomatis jadi `secure` di `CI_ENVIRONMENT=production` (lihat kode masing-masing), kalau situs belum HTTPS maka session/login TIDAK AKAN JALAN (cookie secure tidak terkirim lewat HTTP biasa). Ini pernah kejadian saat testing lokal — expected behavior, bukan bug.

### Data test — SUDAH dibersihkan (24 Agustus 2026)
- [x] ~~`adminkusuma_db`: baris `packages` dengan `slug IN ('test-hack','test-dengan-token')` + 1 baris `inquiries` `name='Test'`~~ — **sudah dihapus**. Dicek dulu tidak ada baris terkait di `package_images`, `package_price_rows`, `outbound_categories` (semuanya 0). Snapshot sudah di-regenerate tanpa data ini.
- [x] ~~`kusuma-agro-backend`: file `application/controllers/api/Test.php`~~ — **sudah dihapus**. Ternyata bukan sekadar file sisa: endpoint-nya **hidup & bisa diakses publik** di `/index.php/api/test` (HTTP 200) meski tidak terdaftar di `routes.php`, karena CI3 menjangkau controller langsung lewat path. Isinya cuma `echo` string, tidak menyentuh database. Setelah dihapus → 404, endpoint asli tetap normal (GET 200, POST tanpa token 401).

  > ⚠️ **Pelajaran**: di CI3, **file apa pun** yang ditaruh di `application/controllers/` otomatis jadi endpoint publik tanpa perlu didaftarkan di `routes.php`. Jangan pernah menaruh controller debug di situ.

- [ ] **Tersisa**: 1 baris `inquiries` id 1 — `Budi Santoso` / `budi@example.com`. Domain `example.com` menandakan ini data contoh juga, tapi tidak masuk daftar pembersihan awal jadi sengaja tidak disentuh. Hapus kalau memang bukan inquiry asli.
- [x] ~~`kusuma-id-admin`: file sampah tugas kuliah pribadi di root + folder `Admin/` duplikat~~ — **SUDAH dihapus** di commit `f7f49b6` (24 Agustus), bersama 2 salinan foto grup anak magang, 3 screenshot layar pribadinya, dan stock photo generik. **Catatan: masih ada di riwayat commit lama** — lihat bagian 2a.

### Konten yang masih placeholder (tugas admin/pemilik konten, BUKAN dev — tapi harus selesai sebelum publish)
- [ ] `kusuma-agro`: section "Signature Packages" di homepage (6 kartu produk masih "Nama Produk 1-6", harga `Rp 000.000`) — **ini data ASLI di tabel `signature_products`, bisa diedit langsung lewat dashboard `kusuma-agro-frontend` → Kusuma Agro → Packages → sub-bagian Signature Packages**, tidak perlu ubah kode.
- [ ] `kusuma-agro`: beberapa foto masih placeholder stok tidak nyambung dengan konten (foto biji kopi di tile "Waterpark", dll) — diedit lewat menu **Site Images** di dashboard yang sama.

### Pengisian konten — daftar periksa ada di `KONTEN.md` (17 September 2026)

Kode sudah siap deploy, tapi **kontennya belum layak publikasi**. Yang tersisa dikerjakan lewat dashboard, bukan lewat kode:

| Situs | Jumlah item | Yang paling mencolok |
|---|---|---|
| Kusuma Group (kusuma.id) | 11 | 3 hero slide + 6 foto Layanan masih `picsum.photos` (gambar acak pihak ketiga), foto pendiri belum ada |
| Kusuma Agrowisata | 23 | Signature Packages masih "Nama Produk 1–6" harga `Rp 000.000` **tampil di halaman depan**; 17 Site Images masih picsum |
| Kusuma Agro Industri | 0 | ✅ sudah pakai konten & foto asli |

Plus: URL Instagram di Site Settings mengarah ke akun yang bukan milik Kusuma (`blupblup.th`) dan ikut terbaca mesin pencari lewat JSON-LD; YouTube & TikTok masih URL generik.

`KONTEN.md` ditulis untuk diserahkan langsung ke pengisi konten — sudah termasuk cara mengakses dari komputer lain lewat file `hosts`, daftar alamat, dan panduan kalau ada kendala.

**Saran urutan**: isi konten di lokal dulu, baru deploy. Kalau dibalik, situs perusahaan sempat tayang dengan foto acak dan "Nama Produk 1".

### Dokumen deploy — SUDAH LENGKAP kelimanya (24 Agustus 2026)

Tiap repo punya `DEPLOY.md` sendiri di root-nya. **Urutan deploy penting**, ikuti dari atas:

| # | Project | Fokus panduannya |
|---|---|---|
| 1 | `kusuma-agro-backend` | CI3 + PHP 7.4, **tidak pakai `.env`** (kredensial diedit langsung di file PHP yang ter-commit), document root ke root project, `encryption_key` masih kosong |
| 2 | `kusuma-id-admin` | CI4 + PHP 8.1+, document root ke `public/`, import snapshot 31 tabel, peta ketergantungan antar-project |
| 3 | `kusuma-industri` | CI4, **dua database sekaligus** — kredensial DB kedua hardcoded di `app/Config/Database.php`, bukan `.env` |
| 4 | `kusuma-agro` | Statis, wajib ganti `API_BASE_URL` di **8 file JS** (daftar baris lengkap ada di panduannya) |
| 5 | `kusuma-agro-frontend` | Statis, wajib ganti **3 URL backend**, plus proteksi ekstra karena ini pintu masuk admin |

**Tiga hal yang paling sering bikin gagal, semuanya sudah ditulis di panduan masing-masing:**
1. **HTTPS harus aktif sebelum ada yang login** — `CI_ENVIRONMENT=production` membuat cookie sesi `secure`; tanpa HTTPS login tidak akan pernah berhasil.
2. **`kusuma-industri` punya kredensial database kedua yang tidak ada di `.env`** — kalau terlewat, situs jalan normal tapi login selalu gagal tanpa pesan yang menjelaskan.
3. **Ketiga backend harus bisa mengakses `adminkusuma_db` yang sama** — sebaiknya satu server MySQL. Kalau dipisah, skema login terpadu rusak.

### Legacy / arsitektur (tidak menghalangi go-live, tapi dicatat)
- `kusuma-agro-backend` pakai CodeIgniter 3 yang sudah legacy/mendekati EOL — hardening kali ini cuma menambal (auth, dll), bukan migrasi arsitektur. Pertimbangkan migrasi ke pola CI4 seperti `kusuma-id-admin` di masa depan.
- Panel "Kusuma Industri" di `kusuma-agro-frontend` meng-embed `kusuma-industri.test/admin/*` lewat `<iframe>` cross-origin — ada risiko cookie session tidak terkirim di browser modern (SameSite policy) tergantung domain production nanti. Perlu ditest ulang begitu domain production sudah ada.

---

## 4. Infrastruktur & skema yang dipakai BERSAMA lintas-project

Sebelum masuk ke detail per-project, penting paham 3 hal yang saling berhubungan ini:

### 4a. Database `adminkusuma_db` (dipakai `kusuma-id-admin` + `kusuma-agro-backend`)
**31 tabel** total (9 tabel CMS `kusuma-id-admin` + `team_members` yang ditambahkan di bagian 12 + 20 tabel `kusuma-agro-backend` + 1 tabel `api_tokens` bersama). **Cara restore termudah**: import SATU file `kusuma-id-admin/app/Database/adminkusuma_db_full_snapshot_20260824.sql` (snapshot lengkap, `mysqldump`, sudah termasuk skema bagian 12) — JANGAN pakai `kusuma_admin.sql` (basi). Detail command & urutan migrasi manual (kalau snapshot hilang) ada di bagian 7.

> 🔑 **Tabel `admins` dan `api_tokens` di snapshot ini sengaja KOSONG** (struktur saja, tanpa baris). Hash password akun asli tidak disimpan di repo supaya tidak bisa di-brute-force offline kalau repo bocor. Setelah import, **belum ada akun sama sekali** — buat dulu:
> ```bash
> php spark admin:password
> ```

```bash
"C:\xampp\mysql\bin\mysql.exe" -u root -e "CREATE DATABASE adminkusuma_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;"
"C:\xampp\mysql\bin\mysql.exe" -u root --default-character-set=utf8mb4 adminkusuma_db < kusuma-id-admin/app/Database/adminkusuma_db_full_snapshot_20260824.sql
```

Flag `--default-character-set=utf8mb4` penting supaya em-dash (—) tidak berubah jadi `?`.

### 4b. Database `kusuma_industri` (BERDIRI SENDIRI, punya `kusuma-industri`)
Terpisah total dari `adminkusuma_db` — TIDAK ikut ke-restore lewat snapshot di atas. Restore dari `kusuma-industri/app/Database/kusuma_industri_full_snapshot_20260824.sql` (juga sudah lengkap schema+data, karena dump asli dari intern TIDAK punya CREATE TABLE sama sekali — schema-nya direkonstruksi manual saat kerja hardening).

### 4c. Skema autentikasi terpadu — 1 kredensial admin untuk SEMUA sistem CMS
Sebelum hardening: `kusuma-agro-backend` (tanpa auth sama sekali), `kusuma-agro-frontend` (hardcoded `admin@kusuma.co.id`/`rahasia123` di JS), `kusuma-id-admin` (auth ada tapi API-nya kebobolan), `kusuma-industri` (tanpa auth sama sekali) — 4 sistem, 4 kondisi beda-beda, tidak ada yang benar-benar aman.

**Sesudah hardening**, SEMUA verifikasi login ke tabel `admins` yang SAMA (di `adminkusuma_db`), tapi mekanisme transportnya beda per kebutuhan:

- **`kusuma-agro-backend`** (dipanggil via fetch dari `kusuma-agro-frontend`, cross-origin): skema **Bearer token**. Endpoint baru `POST /api/auth/login` (`application/controllers/api/Auth.php` + library `Apiauth.php`) verifikasi `password_verify()` ke `admins`, generate token 32-byte, simpan ke tabel baru `api_tokens` (expiry 8 jam). Semua endpoint tulis (12 controller) dicek `Apiauth::requireAuth()` — baca header `Authorization: Bearer <token>`.
- **`kusuma-id-admin`** (API dipanggil `kusuma-agro-frontend` juga, plus dashboard `/admin` browser sendiri): terima **DUA jalur** — sesi cookie biasa (login browser langsung ke `kusuma-id-admin.test/login`) ATAU Bearer token yang SAMA dari `kusuma-agro-backend` di atas (`AuthFilter::isValidBearerToken()` query manual ke `api_tokens`). Jadi 1x login di `kusuma-agro-backend` bisa dipakai manggil API `kusuma-id-admin` juga.
  - **Quirk PHP-CGI**: karena PHP di sini jalan lewat Apache `Action`/CGI (bukan mod_php), header `Authorization` diteruskan sebagai `$_SERVER['REDIRECT_HTTP_AUTHORIZATION']`, BUKAN `HTTP_AUTHORIZATION` biasa — `AuthFilter` sudah handle fallback ini, tapi kalau bikin endpoint baru yang baca header lain, ingat quirk ini. Vhost-nya juga butuh `CGIPassAuth On` (Apache blokir header Authorization ke CGI secara default sejak 2.4.13).
- **`kusuma-industri`** (diakses via `<iframe>`, BUKAN fetch): cukup **session-based biasa** — tapi kredensialnya tetap dicek ke tabel `admins` yang sama, lewat koneksi lintas-database (`db_connect('shared')`, grup DB baru di `app/Config/Database.php` yang connect ke `adminkusuma_db` meski database utamanya `kusuma_industri`).
- **`kusuma-agro-frontend/Login.html`**: `handleLogin()` beneran POST ke endpoint login `kusuma-agro-backend`, simpan token di `sessionStorage`, otomatis dilampirkan (`Authorization: Bearer`) ke semua request lewat `apiFetch()`/`idApiFetch()`/5 titik upload manual. Untuk panel Kusuma Industri (iframe), token TIDAK dipakai — login terjadi natural di dalam iframe-nya sendiri.

Semua sudah diverifikasi jalan (curl + browser): 401 tanpa token/sesi, sukses dengan token/sesi valid, token dari `kusuma-agro-backend` diterima `kusuma-id-admin`.

### 4d. PHP 8.3 side-install (dipakai `kusuma-id-admin` + `kusuma-industri`)
XAMPP di PC ini cuma punya PHP 7.4 bawaan, sementara kedua project CI4 itu butuh PHP 8.1+. Solusinya: PHP 8.3 di-download terpisah ke `C:\xampp\php83` (TIDAK menimpa `C:\xampp\php`), dipakai KHUSUS oleh vhost kedua domain itu lewat Apache `Action`/CGI handler (`kusuma-agro-backend` yang CodeIgniter 3 tetap pakai PHP 7.4 default, tidak perlu ini). Kalau PC baru XAMPP-nya juga cuma ada PHP lama, ulangi cara ini (download PHP 8.1+ NTS x64 dari windows.php.net, extract ke folder terpisah).

---

## 5. Detail per project — `kusuma-agro` (situs publik statis, TIDAK ada perubahan kode)

**Tech Stack**: Static site murni — `index.html` (4.516 baris, inline CSS+JS) + 8 file `dynamic-*.js` (vanilla JS). Tidak ada build tool. Semua `dynamic-*.js` fetch ke `kusuma-agro-backend.test/index.php/api`.

**Arsitektur**: "Progressive enhancement" — HTML statis berisi fallback content, tiap `dynamic-*.js` override DOM kalau API berhasil.

**Fitur**: Situs promosi wisata "Kusuma Agrowisata" — Packages, Outbound, Waterpark, F&B, Thana, Klene Holland, Glamping, Kebun Petik, Galeri, Inquiries, dll.

**Kondisi kode**: Ada `escapeHtml()` (proteksi XSS dasar, bagus). Duplikasi `escapeHtml()`/`formatRupiah()`/`API_BASE_URL` di 8 file JS. Monolitik, tidak ada build/minify.

**Temuan UI/UX (audit `claude-in-chrome`, TERNYATA bisa diedit lewat dashboard, bukan cuma laporan)**:
1. Section "Signature Packages" — 6 kartu "Nama Produk 1-6", harga `Rp 000.000` — **data ASLI di tabel `signature_products`** (bukan HTML statis seperti dugaan awal), di-fetch `dynamic-signature.js`. Edit lewat: login `kusuma-agro-frontend` → Kusuma Agro → Kelola Landing Page → tab **Packages** → sub-bagian **Signature Packages**.
2. Foto tidak nyambung konten di beberapa tempat (tile "Waterpark" → foto biji kopi, dll) — masih placeholder `picsum.photos`. Data di tabel `site_images`, edit lewat menu **🖼️ Site Images** di dashboard yang sama.
3. Minor: 7 tag `<h1>` dalam 1 halaman (idealnya 1) — genuinely di kode, belum diperbaiki.
4. Sudah bagus: semua 66 `<img>` ada `alt`, 20 `@media` breakpoint responsif, hamburger menu jalan.

**Keputusan user**: pengisian konten asli (poin 1 & 2) jadi **tugas admin/pemilik konten**, bukan bagian sesi dev ini — butuh data yang cuma dimiliki tim Kusuma. Poin 3 (h1 struktur) belum dikerjakan, prioritas rendah.

**Setup lokal**: tidak perlu vhost khusus — buka langsung `http://localhost/kusuma-agro/index.html`. Perlu `kusuma-agro-backend` sudah jalan (bagian 6) supaya kontennya penuh muncul.

---

## 6. Detail per project — `kusuma-agro-backend` (CodeIgniter 3, legacy)

**Tech Stack**: CI 3.1.13, PHP `>=5.3.7` di composer.json (sangat longgar) tapi **jalan fine di PHP 7.4 biasa** — TIDAK perlu PHP 8+ seperti 2 project CI4 lainnya. Database `adminkusuma_db` (lihat 4a).

**Arsitektur**: MVC klasik CI3, `application/controllers/api/*` per-resource. 12 controller: Packages, Signature Products, Facilities, Outbound Packages, Schedule, F&B Menu, Harvest Schedules, Ops Stats, Site Images, Simple Pages, Settings, Inquiries — plus Upload.

**Temuan awal (SEMUA kritis, sekarang sudah diperbaiki)**:
1. **Tidak ada autentikasi sama sekali** di semua endpoint — dibuktikan POST tanpa auth berhasil.
2. CORS `*` dikombinasi endpoint tulis tanpa proteksi.
3. Kredensial DB hardcoded di `application/config/database.php` (bukan masalah besar untuk lokal, tapi perlu diganti untuk server production).
4. **Bug** di `waterpark_content_reseed.sql`: 3 dari 4 blok `INSERT` ke `fnb_menu_items` tidak alias kolom subquery → MySQL "duplicate column name" error. Sudah diperbaiki di file itu sendiri.
5. Controller `Test.php` (debug leftover, tidak ada route) — dihapus.

**Perbaikan yang sudah dikerjakan** (commit `d671e78`):
- Tabel baru `api_tokens` + endpoint `POST /api/auth/login` (`application/controllers/api/Auth.php`, library `application/libraries/Apiauth.php`) — verifikasi ke tabel `admins` bersama (lihat 4c).
- Semua 12 controller API dikunci `Apiauth::requireAuth()` untuk method non-GET.
- **4 endpoint dikunci PENUH termasuk GET** (`Schedule`, `Opsstats`, `Harvestschedules`, `Settings`) — ternyata cuma dipakai dashboard admin, TIDAK PERNAH dibaca situs publik `kusuma-agro` (dicek via grep, tidak ada referensi di 8 file JS-nya).
- `Inquiries` kebalik: GET/PUT/DELETE dikunci (berisi data pribadi pengunjung — nama/email/telepon/pesan), POST (submit form kontak publik) tetap terbuka.
- `Test.php` dihapus, bug `waterpark_content_reseed.sql` diperbaiki, `base_url` diupdate ke `kusuma-agro-backend.test`.

**Setup lokal** (PHP 7.4 default XAMPP, TIDAK perlu PHP terpisah):
1. Hosts: `127.0.0.1 kusuma-agro-backend.test`
2. Vhost:
   ```apache
   <VirtualHost *:80>
       DocumentRoot "C:/xampp/htdocs/kusuma-agro-backend"
       ServerName kusuma-agro-backend.test
       <Directory "C:/xampp/htdocs/kusuma-agro-backend">
           Options Indexes FollowSymLinks
           AllowOverride All
           Require all granted
       </Directory>
   </VirtualHost>
   ```
   (DocumentRoot ke ROOT project, CI3 tidak punya folder `public/`.)
3. Database: ikuti bagian 4a (import snapshot lengkap, JANGAN jalankan migrasi satu-satu kecuali snapshot hilang — lihat cadangan urutan migrasi di bagian 7).
4. Restart Apache. Test: `curl http://localhost/web-corporate/kusuma-agro-backend/public/index.php/api/packages` harus balikin JSON.

**Login**: pakai akun di tabel `admins` bersama (saat ini `kag_admin` atau `admin` — lihat bagian 3), via `POST /api/auth/login` atau lewat `Login.html`. Akun test `reviewer` sudah dihapus 17 Sep 2026.

**TODO**: evaluasi migrasi dari CodeIgniter 3 (legacy/mendekati EOL) ke pola CI4 seperti `kusuma-id-admin` — di luar scope hardening kali ini.

---

## 7. Cadangan: urutan migrasi manual `kusuma-agro-backend` (JANGAN dipakai kalau snapshot bagian 4a masih ada)

<details>
<summary>Klik untuk lihat (cuma perlu kalau snapshot hilang dan harus rebuild database dari nol)</summary>

Urutan PENTING karena ada dependency FK antar file — jalankan file-file ini di root `kusuma-agro-backend`:
```
additional_tables.sql
packages_extra_migration.sql        (skip packages_table.sql, sudah digantikan)
package_images_migration.sql
signature_products_migration.sql
signature_price_rows_migration.sql
signature_products_detail_info_migration.sql   (HARUS sebelum detail_image!)
signature_products_detail_image_migration.sql
signature_products_extra_fields_migration.sql
simple_pages_migration.sql
petik_page_migration.sql
glamping_content_migration.sql
outbound_full_migration.sql
fnb_reseed_migration.sql             (HARUS sebelum waterpark_content_reseed!)
fnb_menu_image_migration.sql
waterpark_content_reseed.sql         (sudah diperbaiki -- lihat commit d671e78)
inquiries_migration.sql
migration_harvest_schedules.sql
migration_ops_stats.sql
schedule_add_date.sql
site_images_migration.sql
```
Lalu jalankan manual (bukan dari file, karena file aslinya bentrok dengan kolom yang sudah ada):
```sql
UPDATE simple_pages SET hours_sunrise_open='04:00', hours_sunrise_close='10:00',
  hours_sunset_open='14:00', hours_sunset_close='22:00' WHERE slug='thana';
CREATE TABLE api_tokens (
  id INT AUTO_INCREMENT PRIMARY KEY, token VARCHAR(64) NOT NULL UNIQUE,
  admin_id INT NOT NULL, expires_at DATETIME NOT NULL, created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```
(`thana_sessions_migration.sql` kosong, lewati. `packages_table.sql` JANGAN dijalankan sama sekali.)
</details>

---

## 8. Detail per project — `kusuma-agro-frontend` (`Login.html`, dashboard admin gabungan)

**Tech Stack**: 1 file HTML (5.299 baris), vanilla JS + Bootstrap 5.3.0 + SweetAlert2 via CDN. Tidak butuh server/build — dibuka langsung sebagai file statis.

**Arsitektur**: Semua "halaman" adalah section tersembunyi dalam 1 file (`page-login`, `page-dashboard`, `page-agro-admin`, `page-id-admin`, `page-industri-admin`), navigasi via `navigateToPage()`. >150 fungsi global. Mengelola 3 "properti": Kusuma Agro (via fetch API `kusuma-agro-backend`), Kusuma ID (via fetch API `kusuma-id-admin`), Kusuma Industri (via **`<iframe>`** yang embed `kusuma-industri.test/admin/*?embed=1` langsung).

**Temuan awal (kritis)**: kredensial admin **hardcoded di JS** (`admin@kusuma.co.id`/`rahasia123`, baris ~2273) — terlihat siapapun via View Source, tidak ada verifikasi server sama sekali.

**Perbaikan yang sudah dikerjakan** (commit `1d50e6c`):
- `handleLogin()` sekarang `async`, POST beneran ke `${API_BASE_URL}/auth/login` (endpoint `kusuma-agro-backend`, lihat bagian 4c), simpan token ke `sessionStorage`.
- Token otomatis dilampirkan (`Authorization: Bearer`) ke semua request tulis: `apiFetch()` (ke `kusuma-agro-backend`), `idApiFetch()` (ke `kusuma-id-admin`), + 5 titik upload gambar yang fetch manual (tidak lewat wrapper, ditemukan lewat grep `await fetch(`).
- Fungsi `logout()` baru, di-wire ke 4 tombol Keluar/Logout yang sudah ada di UI.
- Panel Kusuma Industri (iframe) TIDAK disentuh — auth-nya terjadi natural di dalam iframe sendiri (lihat bagian 4c & 9).

**Verifikasi**: sudah dites via pemanggilan langsung `handleLogin()` di browser (login sukses, token tersimpan, redirect dashboard) + curl. Demo klik-UI penuh sempat kejegal masalah tooling browser-automation di sesi ini (BUKAN bug kode — fungsi sudah dibuktikan benar lewat cara lain).

**Setup lokal**: tidak perlu vhost — buka langsung `http://localhost/kusuma-agro-frontend/Login.html`. Perlu `kusuma-agro-backend`, `kusuma-id-admin`, `kusuma-industri` semua sudah jalan supaya 3 panelnya berfungsi penuh.

**Belum diperbaiki**: placeholder "NAME@KUSUMA.CO.ID" di field username form login — sisa UI lama, username sebenarnya bukan format email (isi dengan username asli di tabel `admins`, mis. `kag_admin`). Kosmetik saja, tidak menghalangi fungsi.

---

## 9. Detail per project — `kusuma-id-admin` (CodeIgniter 4 — situs kusuma.id + CMS + API)

**Tech Stack**: PHP 8.1+ (pakai PHP 8.3 side-install, lihat 4d), CodeIgniter 4.6.5, database `adminkusuma_db` (lihat 4a).

**Arsitektur**: 1 aplikasi CI4 = situs publik (`Home::index()` render `landing_page.php` langsung query model) + CMS admin (`Admin.php` generik, modal di dashboard POST ke `admin/{table}/simpan`) + API (`Api.php`, `/api/meta`, `/api/content/{resource}`, `/api/upload`) sekaligus. Dipakai sebagai salah satu dari 3 panel di `kusuma-agro-frontend`.

**Temuan awal (semua KRITIS, sekarang sudah diperbaiki)**:
1. **RCE via upload file** — endpoint upload tidak validasi ekstensi/MIME, folder upload web-accessible.
2. **API publik tanpa auth** — siapapun bisa ubah/hapus konten.
3. **`registerBawaan()`** — method di `Auth.php` yang reset admin ke kredensial hardcoded `admin`/`admin123`. Tidak ter-routing (auto-route mati) tapi tetap bahaya laten.
4. **Route mati `Admin::form()`** — CMS aslinya pakai modal di dashboard, bukan halaman terpisah; view `admin/form.php` tidak pernah ada, selalu 500 kalau diakses.
5. **CSRF mati**, kredensial hardcoded di kode (bukan `.env`), tidak ada rate limit login.
6. File sampah tugas kuliah pribadi di root (`evaluasi_pembelajaran.sql`, `index.html`, `index (2).html`, `index (3).html`) dan folder `Admin/` duplikat — **BELUM dihapus**, keputusan user ditunda (lihat bagian 3).

**Perbaikan yang sudah dikerjakan** (commit `fcb36c3` + `56a0109`):
- `app/Libraries/ImageUploadGuard.php` (baru) — validasi ekstensi+MIME asli sebelum `move()`, dipasang di `Admin.php` & `Api.php`.
- `app/Config/Routes.php` — route group `api` dikunci filter `auth`; route mati `admin/{table}/tambah`&`/edit` dihapus.
- `app/Controllers/Auth.php` — `registerBawaan()` dihapus total, rate limit login 5x/menit/IP ditambah.
- `app/Filters/AuthFilter.php` — balas JSON 401 untuk `/api/*` yang belum login (bukan redirect), lolos CORS preflight. **Sesudahnya** (`56a0109`) ditambah `isValidBearerToken()` — terima juga token dari `kusuma-agro-backend` (lihat bagian 4c), termasuk fix quirk `REDIRECT_HTTP_AUTHORIZATION`.
- `app/Config/Filters.php` — CSRF diaktifkan; `app/Views/admin/dashboard.php`+`login.php` — tambah `csrf_field()`.
- `app/Config/Cookie.php` — cookie `secure` otomatis `true` di production (baru berlaku kalau HTTPS aktif — lihat bagian 3).
- `.env` dibuat (gitignored — lihat template di bagian 2), kredensial DB & `encryption.key` tidak lagi hardcoded di kode.
- `DEPLOY.md` (baru) — panduan lengkap deploy ke cPanel (document root, PHP version, `.env` production, dll).

**Setup lokal**:
1. PHP 8.3 side-install (lihat bagian 4d) kalau belum ada.
2. Hosts: `127.0.0.1 kusuma-id-admin.test`
3. Vhost:
   ```apache
   <VirtualHost *:80>
       DocumentRoot "C:/xampp/htdocs/kusuma-id-admin/public"
       ServerName kusuma-id-admin.test
       <Directory "C:/xampp/htdocs/kusuma-id-admin/public">
           Options Indexes FollowSymLinks
           AllowOverride All
           Require all granted
           CGIPassAuth On
       </Directory>
       SetEnv PHPRC "C:/xampp/php83"
       ScriptAlias /php83-cgi/ "C:/xampp/php83/"
       <Directory "C:/xampp/php83/">
           Require all granted
       </Directory>
       <FilesMatch "\.php$">
           SetHandler php83-cgi-handler
       </FilesMatch>
       Action php83-cgi-handler "/php83-cgi/php-cgi.exe"
   </VirtualHost>
   ```
   (Cek `C:\xampp\apache\conf\httpd.conf` ada `Include conf/extra/httpd-vhosts.conf`.)
4. `composer install` pakai PHP 8.3: `C:\xampp\php83\php.exe path\ke\composer.phar install`
5. Buat folder writable yang kadang hilang: `writable/logs`, `writable/cache`, `writable/session`, `writable/debugbar`.
6. Database: ikuti bagian 4a.
7. `.env` (root project, BUKAN di `public/`):
   ```
   CI_ENVIRONMENT = development
   app.baseURL = 'http://kusuma-id-admin.test/'
   database.default.hostname = 127.0.0.1
   database.default.database = adminkusuma_db
   database.default.username = root
   database.default.password =
   database.default.DBDriver = MySQLi
   database.default.port = 3306
   encryption.key = hex2bin:43833da0b39661371e44e5ba481f6bd31a54dd1446fd060986fec6151c8cc96c
   ```
   (Key ini CUMA dev lokal — WAJIB generate baru untuk production, lihat `DEPLOY.md` & bagian 3.)
8. Restart Apache.

**Login**: pakai akun di tabel `admins` (saat ini `kag_admin` atau `admin` — lihat bagian 3). Akun test `reviewer` dan akun warisan `admin` id 1 sudah dihapus 17 Sep 2026; password baru dibuat lewat `php spark admin:password`.

**Untuk deploy production**: ikuti `DEPLOY.md` di root project ini — sudah berisi panduan cPanel lengkap (document root ke `public/`, pilih PHP di MultiPHP Manager, `.env` production, dll).

---

## 10. Detail per project — `kusuma-industri` (CodeIgniter 4 — Kusuma Agro Industri/SIIPLAH)

**Tech Stack**: PHP 8.1+ (reuse PHP 8.3 side-install, lihat 4d), CodeIgniter 4.6.5. Database **`kusuma_industri` BERDIRI SENDIRI** (lihat 4b) — beda dari 2 backend lain yang berbagi `adminkusuma_db`.

**Arsitektur**: Pola identik `kusuma-id-admin` (situs publik + CMS admin jadi 1 app). `Industri::index()` render `industri/index.php` dari 10 model (Hero, Keunggulan, Sejarah, Produk, Cabang, Marketplace, Galeri, Awards, Pengaturan, SectionHeading). 10 controller `Admin\Admin*`.

**Project ini TIDAK PUNYA file schema/migration sama sekali dari intern** (folder `Migrations`/`Seeds` kosong, cuma `.gitkeep`) — cuma dump data mentah (`app/Database/kusuma_industri.sql`, INSERT tanpa CREATE TABLE). Skema 10 tabel sudah direkonstruksi manual (kolom dari tiap INSERT + tipe data dari tiap Model).

**Bug ditemukan & diperbaiki**: `HeroModel` pakai `$table = 'industri_hero_slides'`, tapi dump data pakai nama `hero_slides` — mismatch, kalau tidak diperbaiki fitur Hero Slides selalu error "table not found". Sudah diperbaiki di `app/Database/kusuma_industri.sql`.

**Temuan awal (SEMUA kritis, sekarang sudah diperbaiki)**:
1. **Tidak ada sistem login SAMA SEKALI** — bukan filter yang lupa dipasang, memang belum pernah dibuat (`app/Filters/` kosong total, tidak ada controller/view Auth, session tidak pernah diaktifkan). Dibuktikan: `POST /admin/marketplace/store` tanpa apapun berhasil (HTTP 200) sebelum diperbaiki.
2. **Upload file rentan RCE** — pola sama seperti `kusuma-id-admin` sebelum diperbaiki: 8 titik upload di 7 controller cuma cek `$file->isValid()`.
3. **CSRF dimatikan**.
4. **Data test/junk milik intern tampil LIVE ke publik** — bukan cuma di database, kelihatan beneran di homepage: tagline hero "tes 123", kartu "tes" di Keunggulan & Produk, 1 foto Galeri caption "tes".

**Integrasi dengan `kusuma-agro-frontend`**: BEDA dari 2 backend lain — panel "Kusuma Industri" di `Login.html` meng-embed halaman admin ini langsung sebagai **`<iframe>`** (`src` = `http://kusuma-industri.test/admin/{section}?embed=1`; parameter `?embed=1` men-skip render sidebar/topbar `app/Views/admin/layout.php` supaya tidak dobel dengan pembungkusnya — mekanisme ini sudah ada dari sananya, bukan buatan sesi ini). Konsekuensi: cukup session-based auth biasa, TIDAK perlu skema Bearer token seperti 2 backend lain. Risiko cross-origin cookie (SameSite) dicatat di bagian 3, belum diperbaiki (itu domain `kusuma-agro-frontend`).

**Perbaikan yang sudah dikerjakan** (commit `ddfb389` + `5e24422`):
- `app/Config/Database.php` — grup koneksi baru `'shared'` ke `adminkusuma_db` (host/user/password sama, cuma beda nama database) — dipakai KHUSUS untuk cek tabel `admins`, tidak lewat `.env`.
- `app/Controllers/Auth.php` (baru), `app/Views/auth/login.php` (baru), `app/Filters/AuthFilter.php` (baru) — login session-based lengkap dengan rate limit 5x/menit/IP.
- `app/Config/Filters.php` — alias `auth` + CSRF diaktifkan. `app/Config/Routes.php` — route login/logout ditambah, grup `admin` dikunci filter `auth`.
- `app/Libraries/ImageUploadGuard.php` (baru, sama persis punya `kusuma-id-admin`) — dipasang di 8 titik upload (`AdminAwards`, `AdminGaleri`, `AdminHero`×2, `AdminKeunggulan`, `AdminMarketplace`, `AdminProduk`, `AdminSejarah`).
- `app/Views/admin/layout.php` — tambah `<meta name="csrf-token">` + link Logout. 22 form di `app/Views/admin/*/index.php` — tambah `csrf_field()`. `public/assets/admin/js/admin.js` — fungsi hapus kirim CSRF via header `X-CSRF-TOKEN` (karena fetch delete tidak punya body/form).
- **Data (database, bukan kode)** — beda dari `kusuma-agro`, di sini user MINTA konten JUGA diperbaiki: tagline hero diganti ke tagline asli (sudah ada di baris `pengaturan` lain, cuma dicopy), 4 baris data test/junk dihapus (Keunggulan, Produk, Galeri, dan 1 baris Marketplace "TEST TANPA LOGIN" hasil pengetesan celah keamanan sesi ini sendiri).
- `app/Views/industri/index.php` — tambah `alt` yang hilang di logo header.

**Setup lokal**:
1. Hosts: `127.0.0.1 kusuma-industri.test`
2. Vhost (pola sama `kusuma-id-admin`, beda path/nama handler biar tidak bentrok):
   ```apache
   <VirtualHost *:80>
       DocumentRoot "C:/xampp/htdocs/kusuma-industri/public"
       ServerName kusuma-industri.test
       <Directory "C:/xampp/htdocs/kusuma-industri/public">
           Options Indexes FollowSymLinks
           AllowOverride All
           Require all granted
           CGIPassAuth On
       </Directory>
       SetEnv PHPRC "C:/xampp/php83"
       ScriptAlias /php83-cgi-industri/ "C:/xampp/php83/"
       <Directory "C:/xampp/php83/">
           Require all granted
       </Directory>
       <FilesMatch "\.php$">
           SetHandler php83-cgi-industri-handler
       </FilesMatch>
       Action php83-cgi-industri-handler "/php83-cgi-industri/php-cgi.exe"
   </VirtualHost>
   ```
3. `composer install` pakai PHP 8.3 (sama caranya seperti `kusuma-id-admin`, lihat bagian 9 langkah 4).
4. Database: ikuti bagian 4b —
   ```
   CREATE DATABASE kusuma_industri CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   mysql -u root kusuma_industri < kusuma-industri/app/Database/kusuma_industri_full_snapshot_20260824.sql
   ```
5. `.env`:
   ```
   CI_ENVIRONMENT = development
   app.baseURL = 'http://kusuma-industri.test/'
   database.default.hostname = 127.0.0.1
   database.default.database = kusuma_industri
   database.default.username = root
   database.default.password =
   database.default.DBDriver = MySQLi
   database.default.port = 3306
   encryption.key = hex2bin:c6cc6ceba7a12c10e126a9c08ef8c360b1be0953aab5d5d3f8dc78428f0eb426
   ```
   (Key CUMA dev lokal, generate baru untuk production. Kredensial `adminkusuma_db` untuk grup `'shared'` di-hardcode di `app/Config/Database.php`, bukan `.env` — edit di situ kalau beda di PC/server baru.)
6. Restart Apache.

**Login**: pakai akun di tabel `admins` bersama, sama seperti 2 project lain (saat ini `kag_admin` atau `admin` — lihat bagian 3). Akun test `reviewer` sudah dihapus 17 Sep 2026.

**Belum ada**: `DEPLOY.md` setara `kusuma-id-admin` untuk panduan deploy production — perlu dibuat kalau sudah ada rencana hosting-nya.

---

## 11. Verifikasi cepat setelah pindah PC (jalankan berurutan)

```bash
# 1. kusuma-agro-backend
curl http://localhost/web-corporate/kusuma-agro-backend/public/index.php/api/packages
curl -X POST http://localhost/web-corporate/kusuma-agro-backend/public/index.php/api/packages -d "nama=test"   # harus 401

# 2. kusuma-id-admin
curl http://kusuma-id-admin.test/
curl http://kusuma-id-admin.test/api/content/companies   # harus 401 tanpa token

# 3. kusuma-industri
curl http://kusuma-industri.test/
curl -X POST http://kusuma-industri.test/admin/marketplace/store -d "nama=test"   # harus ditolak (403 CSRF atau 401)

# 4. login test (ambil token dari kusuma-agro-backend, verifikasi diterima kusuma-id-admin)
curl -X POST http://localhost/web-corporate/kusuma-agro-backend/public/index.php/api/auth/login \
  -H "Content-Type: application/json" -d '{"username":"USERNAME_ADMIN","password":"PASSWORD_ADMIN"}'
```

Kalau semua di atas sesuai ekspektasi, berarti environment lokal sudah pulih sepenuhnya dan siap dilanjutkan ke tahap review konten (bagian 3) lalu persiapan deploy.

---

## 12. `kusuma-id-admin` — landing page corporate + pembersihan repo (commit `f7f49b6`, 24 Agustus 2026)

> ⚠️ **Pekerjaan ini pernah HILANG sekali.** Dikerjakan pertama kali 22 Agustus, lalu folder `kusuma-id-admin` diganti dengan hasil `git clone` ulang dari PC lain (reflog membuktikan: `clone: from github.com/...`) sehingga lineage-nya beda dan semua perubahan lenyap. Dikerjakan ULANG 24 Agustus di atas basis kode terbaru (yang sudah punya Bearer token `56a0109`), lalu **langsung di-commit**.

### Konteks & keputusan (supaya tidak ditanya ulang)

| Pertanyaan | Keputusan |
|---|---|
| Branding situs untuk siapa? | **Kusuma Group (korporat)** — hub resmi 4 unit usaha, bukan situs Agrowisata saja |
| 3 link footer mati (`#services`, `#team`, `#media`) | Dibuatkan section-nya; `#media` diarahkan ke `#gallery` yang sudah ada |
| Modul `services` (tabel ada tapi tak pernah tampil) | **Kontennya dipakai** — berisi 6 deskripsi asli, bukan tabel kosong. Section dibuat + didaftarkan ke menu admin |
| Placeholder `tes`/`tes2` di hero | Diganti draft copy korporat (bisa diedit lewat CMS) |
| Foto | "Terserah dulu, nanti disesuaikan" — dipakai foto Kusuma asli yang tersedia di `public/assets/` |

### Bug yang diperbaiki

1. **`companies.image2`/`image3` — error 500 laten.** `AdminTables.php` mendeklarasikan kedua kolom itu dan `SiteContent.php` + `main.js` sudah punya kode carousel foto per perusahaan, tapi **kolomnya tidak pernah ada di tabel** → begitu admin upload "Foto 2", query UPDATE gagal. Kolom sudah ditambahkan; sudah dites simpan lewat CMS, tidak error lagi.
2. **5 gambar 404.** `companies.image` 4 baris cuma berisi nama file telanjang (`logo1.png`, dst); `about_items` id 1 menunjuk `uploads/about_items_image_6a4f48f41bd5a.png` yang **tidak ada di manapun** (folder `uploads/` huruf kecil juga tidak ada — yang benar `Upload/`).
3. **8 query mubazir** di `Home::index()` — hasilnya tidak pernah dipakai view (konten datang dari `SiteContent::index()` yang query ulang tabel yang sama). Homepage jadi ~15 query padahal cukup ~7.
4. **`SiteContent::debug()`** — mengekspos hostname/nama database + sample data mentah. Dihapus (sekelas `registerBawaan()` di Tahap 1).
5. **`app/Models/ServiceModel.php`** — tidak dipakai siapapun (`SiteContent` pakai query builder langsung). Dihapus.
6. **CSS invalid**: `max-w-[65ch]` (class Tailwind tertulis di CSS biasa) → `max-width:65ch`.
7. **Kartu Team melar 1111×1111px** waktu anggotanya cuma 1 (efek `auto-fit minmax` + `aspect-ratio`) → dibatasi `max-width:250px`.
8. **Nama file berspasi** `public/assets/petik apel.jpg` → `petik-apel.jpg` (pakai `git mv`).

### Section baru

- **Layanan Kami** (`#services`) — 6 item dari tabel `services`. Ikonnya (`camera`, `waves`, `apple`, `drink`, `villa`, `party`) ternyata **sudah tersedia** di `ICONS` dalam `main.js` — fitur ini memang direncanakan tapi tidak pernah diselesaikan.
- **Manajemen Kami** (`#team`) — tabel baru `team_members`, terisi 1 baris awalan (Ir. Edy Antoro / Pendiri & Komisaris, foto kosong → tampil inisial).
- Keduanya **otomatis tersembunyi berikut link navbar/footer-nya** kalau datanya kosong (helper `hideSection()`), jadi tidak akan ada anchor mati lagi.
- Urutan: Hero → Stats → Companies → **Services** → Gallery → About → **Team** → Testimonials → Contact.

### Performa

- **Kompresi gambar: 60,4 MB → 3,8 MB (hemat 94%)**. Foto aslinya resolusi kamera mentah (sampai 7008×4672 px).
- **Auto-resize saat upload** — `ImageUploadGuard::shrink()` (maks 1920px, kualitas 82) dipanggil di `Admin::save()` & `Api::upload()`. Tanpa ini masalahnya langsung terulang begitu staf upload foto baru. GIF dilewati supaya animasinya tidak rusak.
- **Cache browser 30 hari** untuk css/js/gambar di `public/.htaccess` — **butuh `mod_expires` aktif** (lihat bagian 13).
- **Cache-busting** `?v=filemtime` pada `style.css` & `main.js`. Wajib ada; tanpa ini update CSS/JS tidak sampai ke pengunjung lama selama 30 hari. Waktu ngoprek CSS/JS tetap pakai hard-reload.

### SEO & profesionalisme

- Judul & meta description di-rebrand ke Kusuma Group.
- **Open Graph + Twitter Card** — sebelumnya preview share ke WhatsApp/LinkedIn kosong melompong.
- **JSON-LD `Organization` schema** (nama, logo, alamat, telepon, sosial media, `foundingDate: 1989`).
- `<link rel="canonical">` pakai `base_url()` — `current_url()` menghasilkan `/index.php/` yang salah untuk canonical.
- **Halaman 404 ber-branding** menggantikan default CodeIgniter. Catatan: `curl` tanpa header `Accept: text/html` tetap dapat JSON — itu content negotiation bawaan CI4, bukan bug.
- `robots.txt` blokir `/admin`, `/login`, `/api/`; halaman admin & login diberi `noindex, nofollow`.
- Helper `esc()` ditambahkan di `main.js`, dipakai di semua kode render baru.

### Perubahan skema database

Snapshot `app/Database/adminkusuma_db_full_snapshot_20260824.sql` **sudah di-regenerate** (sekarang **31 tabel**, sebelumnya 30):
- Tabel baru **`team_members`** (`id`, `name`, `position`, `photo`, `sort_order`)
- Kolom baru **`companies.image2`**, **`companies.image3`**
- Kolom baru **`site_settings.team_subtitle`**

File `adminkusuma_db_snapshot_20260822.sql` (versi 9 tabel, basi) sudah dihapus.

### File yang berubah

```
app/Config/AdminTables.php          modul services + team_members, field team_subtitle
app/Controllers/Home.php            8 query mubazir dihapus, sisa SettingModel untuk meta
app/Controllers/SiteContent.php     data services + team, debug() dihapus
app/Controllers/Admin.php           panggil ImageUploadGuard::shrink()
app/Controllers/Api.php             panggil ImageUploadGuard::shrink()
app/Libraries/ImageUploadGuard.php  method shrink() baru
app/Views/landing_page.php          OG/Twitter/JSON-LD/canonical, section Services+Team, cache-busting
app/Views/admin/dashboard.php       ikon 2 modul baru, judul, noindex
app/Views/admin/login.php           judul, noindex
app/Views/errors/html/error_404.php halaman 404 ber-branding (ditulis ulang)
public/css/style.css                CSS Services + Team, fix max-w-[65ch], fallback foto About
public/js/main.js                   render Services+Team, helper esc/setText/hideSection
public/.htaccess                    cache header asset statis
public/robots.txt                   blokir admin/login/api
public/assets/petik-apel.jpg        rename dari "petik apel.jpg" (git mv)
public/Upload/**                    12 gambar dikompres
app/Database/...20260824.sql        regenerate, 31 tabel
app/Models/ServiceModel.php         DIHAPUS
```

### Pembersihan repo (bagian dari commit yang sama)

| Dihapus | Keterangan |
|---|---|
| `evaluasi_pembelajaran.sql`, `index.html`, `index (2).html`, `index (3).html` | Tugas kuliah pribadi anak magang; `index (3).html` berisi nama & email pribadi |
| Folder `Admin/` | Scaffolding project kedua yang tidak terpakai, **16 MB**, ter-track git |
| `Upload/about/1783933158_*`, `Upload/company/1783910089_*` | **Dua salinan** foto grup anak magang (checksum identik) |
| `Upload/company/1785375814_*` (3 PNG) | Screenshot layar pribadi anak magang — tab browser, pendaftaran beasiswa, pemutar video |
| `Upload/company/1786679500/753/761`, `1786680755/761` | Stock photo siluet senja — **5 salinan identik** |
| `Upload/company/1786679754_*`, `Upload/about/1786679684_*` | Stock photo gunung salju & flamingo, bukan foto Kusuma |
| `app/Models/ServiceModel.php` | Tidak dipakai siapapun |

Folder `Upload/about/` dan `Upload/company/` sekarang kosong. **`Upload/` total: 64 MB → 3,6 MB.** Sudah dipastikan tidak ada satupun gambar yang dihapus masih dirujuk database atau kode (dicek lewat query gabungan semua kolom gambar + grep ke `app/`, `public/css`, `public/js`).

File di `Upload/galerry/`, `Upload/hero/`, `Upload/service/` yang tidak terpakai **sengaja TIDAK dihapus** — itu foto Kusuma asli yang masih mungkin dipakai admin lewat CMS.

### Verifikasi yang sudah dilakukan

Dites langsung di browser: judul tab "Kusuma Group | …", 6 kartu Services render, 1 kartu Team render, **nol request 404**, **nol anchor mati**, desktop 3 kolom / mobile 1 kolom tanpa overflow horizontal, OG + JSON-LD terbaca, canonical bersih, cache-busting aktif, halaman 404 branded, login admin + menu Services/Team Members muncul, simpan `companies` (uji kolom `image2`) sukses tanpa 500. Semua PHP lolos `php -l`. Setelah pembersihan file, landing page & login dites ulang — tetap 200, tetap nol 404.

**Belum sempat dilihat mata langsung**: screenshot visual tidak bisa diambil (panel browser tidak compositing), verifikasi lewat pengukuran DOM & computed style. Sebaiknya dibuka sendiri sekali untuk cek estetika.

---

## 13. Yang masih perlu diperbaiki / diputuskan (per 24 Agustus 2026)

### Konten & aset — perlu keputusan pemilik konten
1. **Foto stand-in yang perlu diganti**: Kusuma Agro Industri memakai `assets/enjoy2.jpg` (kincir angin) karena tidak ada foto produk industri; semua foto tabel `services` masih `picsum.photos`; foto Ir. Edy Antoro belum ada (kartu About & Team tampil fallback ikon/inisial).
2. **Sosial media di Site Settings** — Instagram mengarah ke `instagram.com/blupblup.th` (kelihatannya bukan akun Kusuma), YouTube & TikTok masih URL generik. Ini ikut masuk ke JSON-LD `sameAs`, jadi terbaca mesin pencari.
3. **Testimoni kurang kredibel** — "Rina, Malang" / "Budi, Surabaya" / "Sari, Batu": nama depan + kota, tanpa foto/verifikasi.
4. **Konten belum benar-benar mewakili "Kusuma Group"** — branding/meta sudah korporat, tapi About/testimoni/galeri masih Agrowisata-sentris. Hotel, Estate, dan Industri belum punya porsi setara.
5. ~~**Riwayat git masih memuat data pribadi anak magang**~~ — **SELESAI**: kelima repo di-`git init` ulang 24 Agustus, riwayat lama dibuang total (bagian 2a).

### Teknis — belum dikerjakan
6. ~~**Kode render lama di `main.js` belum di-escape**~~ — **SELESAI**: seluruh titik `innerHTML` di Hero, Stats, Companies, Gallery, Testimonials, dan Contact sekarang memakai `esc()`. Sudah dibuktikan dengan menyisipkan payload `<img src=x onerror=...>` lewat database — tampil sebagai teks biasa, tidak terinjeksi. Sekalian dihapus blok `[data-brand-slot]` yang merupakan kode mati (elemennya di-comment di view, dan `brand.name1/2/3` yang dirujuknya tidak pernah disediakan `SiteContent`).
7. ~~**Belum ada `DEPLOY.md`** untuk 4 project~~ — **SELESAI**: kelima repo sudah punya `DEPLOY.md` masing-masing (lihat bagian 3).
8. ~~**Belum ada satupun repo yang di-push**~~ — **SELESAI**: kelima repo sudah di `kusumatech-org` (bagian 1 & 2b).
9. **`kusuma-agro-backend` belum punya `.gitignore`** — saat ini tidak ada file log/cache yang tertinggal, jadi belum jadi masalah. Tapi begitu aplikasi jalan lama, `application/logs/*` dan `application/cache/*` akan ikut ter-commit. Sebaiknya ditambahkan `.gitignore` standar CI3.

### Catatan setup yang BARU ditemukan di PC ini (24 Agustus)
10. **`mod_expires` harus diaktifkan** di `C:\xampp\apache\conf\httpd.conf` (hapus `#` di depan `LoadModule expires_module modules/mod_expires.so`) — dibutuhkan cache header di `public/.htaccess`. `mod_headers`, `mod_actions`, `mod_cgi` biasanya sudah aktif bawaan.
11. **Blok catch-all `localhost` wajib ada** di `httpd-vhosts.conf` sebelum vhost lain. Begitu ada satu `<VirtualHost>`, Apache pakai name-based matching untuk semua request port 80 — tanpa catch-all, project lain di `htdocs` tidak bisa diakses lewat `localhost/...`.
12. **Hati-hati entri hosts lama** — di PC ini `kusuma-industri.test` awalnya sudah ter-daftar mengarah ke `10.0.63.131` (mesin lain di jaringan), bukan `127.0.0.1`. Kalau tidak diperbaiki, situs industri tidak akan jalan lokal DAN iframe di `kusuma-agro-frontend` akan menembak server yang salah.
13. **Restart Apache SETIAP kali `httpd-vhosts.conf` diubah** — vhost baru tidak aktif sampai restart, dan gejalanya menipu: request jatuh ke catch-all `localhost` dan mengembalikan HTTP 200 berisi halaman `htdocs`, bukan error. Validasi dulu dengan `C:\xampp\apache\bin\httpd.exe -t` lalu cek `httpd.exe -S`.
14. **MySQL di PC ini jalan manual**, bukan Windows Service — nyalakan lewat XAMPP Control Panel. Apache jalan sebagai service `Apache2.4`, jadi `net stop/start` dari terminal biasa gagal "Access denied"; pakai Control Panel atau terminal Administrator.
