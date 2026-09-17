# Daftar Periksa Pengisian Konten

Dokumen untuk tim yang mengisi konten situs Kusuma lewat dashboard admin, sebelum situs dipublikasikan.

**Semua yang ada di daftar ini dikerjakan lewat dashboard — tidak perlu menyentuh kode sama sekali.**

---

## 1. Cara mengakses dari komputer lain

Situs ini berjalan di komputer developer dengan alamat **`10.0.40.212`**. Karena servernya membedakan situs berdasarkan nama domain, membuka IP itu langsung **tidak akan menampilkan situs yang benar** — perlu satu kali penyetelan di komputer Anda.

### Penyetelan (sekali saja)

1. Buka **Notepad sebagai Administrator**
   (Start → ketik `notepad` → klik kanan → **Run as administrator**)
2. **File → Open**, arahkan ke:
   ```
   C:\Windows\System32\drivers\etc\hosts
   ```
   Di kotak tipe file, pilih **All Files (\*.\*)** supaya file `hosts` terlihat.
3. Tambahkan 3 baris ini di paling bawah:
   ```
   10.0.40.212  kusuma-id-admin.test
   10.0.40.212  kusuma-industri.test
   10.0.40.212  kusuma-agro-backend.test
   ```
4. **Save**, lalu tutup semua jendela browser dan buka lagi.

> Kalau Notepad menolak menyimpan, berarti belum dijalankan sebagai Administrator.

### Syarat agar bisa diakses

- Komputer developer **harus menyala**, dengan **Apache dan MySQL aktif** di XAMPP Control Panel
- Kedua komputer harus berada di **jaringan kantor yang sama**
- Kalau alamat IP komputer developer berubah (biasanya setelah restart router), 3 baris di atas perlu disesuaikan

---

## 2. Daftar alamat

| Situs | Alamat | Keperluan |
|---|---|---|
| **Dashboard Admin Gabungan** | http://10.0.40.212/kusuma-agro-frontend/Login.html | **Mulai dari sini** — mengelola Kusuma Agro, Kusuma ID, dan Kusuma Industri dalam satu tempat |
| Situs Kusuma Group | http://kusuma-id-admin.test/ | Melihat hasil (situs publik kusuma.id) |
| ↳ CMS-nya langsung | http://kusuma-id-admin.test/login | Alternatif kalau tidak lewat dashboard gabungan |
| Situs Kusuma Agro Industri | http://kusuma-industri.test/ | Melihat hasil |
| ↳ CMS-nya langsung | http://kusuma-industri.test/login | |
| Situs Kusuma Agrowisata | http://10.0.40.212/kusuma-agro/index.html | Melihat hasil |

**Akun login**: minta username dan password ke pengelola. Akun yang sama berlaku untuk ketiga sistem.

> ⚠️ **Jangan membuka menu "Admins"** di dashboard. Menu itu mengelola akun pengguna — salah klik di sana bisa menghapus akun pengelola dan mengunci semua orang keluar.

**Setelah mengubah sesuatu, tekan `Ctrl+Shift+R`** di halaman situsnya untuk melihat hasil. Tanpa itu, browser sering masih menampilkan versi lama.

---

## 3. Daftar periksa konten

### 🔴 A. Situs Kusuma Group (kusuma.id) — 11 item

Masuk lewat **http://kusuma-id-admin.test/login**

#### Hero Slide — 3 foto masih placeholder acak
Menu **Hero Slides** → Edit → ganti kolom Gambar.

- [ ] Slide 2 — "Resort & Convention Hotel di Ketinggian 1000 Mdpl" → butuh foto hotel/resort
- [ ] Slide 3 — "Basah-basahan Seru di Kusuma Waterpark" → butuh foto waterpark
- [ ] Slide 4 — "Petik Apel, Jeruk & Strawberry Langsung dari Kebun" → butuh foto kebun petik

> Slide 1 sudah memakai foto asli, tidak perlu diubah.

#### Layanan Kami — 6 foto masih placeholder acak
Menu **Services** → Edit → ganti kolom Foto 1.

- [ ] 1. Area & Pemandangan
- [ ] 2. Waterpark
- [ ] 3. Petik Buah
- [ ] 4. Kuliner Khas Apel
- [ ] 5. Home & Villa
- [ ] 6. Party, Event & Wedding

#### Foto pendiri — belum ada
Sekarang tampil sebagai ikon/inisial. Butuh foto potret **Ir. Edy Antoro**.

- [ ] Menu **About Items** → Edit "Ir. Edy Antoro" → isi kolom Gambar
- [ ] Menu **Team Members** → Edit "Ir. Edy Antoro" → isi kolom Foto

#### Foto perusahaan — 1 sementara
- [ ] Menu **Companies** → Edit "Kusuma Agro Industri" → sekarang memakai foto kincir angin sebagai pengganti sementara. Butuh foto produk olahan apel (Siiplah, jenang apel, cuka apel).

---

### 🔴 B. Situs Kusuma Agrowisata — 23 item

Masuk lewat **dashboard gabungan** → panel **Kusuma Agro**.

#### Signature Packages — katalog masih kosong
Kelola Landing Page → tab **Packages** → bagian **Signature Packages**.
Saat ini tertulis "Nama Produk 1" sampai "Nama Produk 6" dengan harga `Rp 000.000` — **ini tampil di halaman depan situs publik.**

- [ ] Produk 1 — nama, deskripsi, harga, foto
- [ ] Produk 2 — nama, deskripsi, harga, foto
- [ ] Produk 3 — nama, deskripsi, harga, foto
- [ ] Produk 4 — nama, deskripsi, harga, foto
- [ ] Produk 5 — nama, deskripsi, harga, foto
- [ ] Produk 6 — nama, deskripsi, harga, foto

#### Site Images — 17 foto masih placeholder acak
Menu **🖼️ Site Images**. Foto-foto ini acak dan **tidak nyambung dengan kontennya** (contoh: tile "Waterpark" menampilkan foto biji kopi).

**Beranda (5)**
- [ ] Hero — Kartu Waterpark
- [ ] Hero — Kartu Outbound
- [ ] Hero — Kartu Food & Coffee
- [ ] Cerita Kami — Foto Utama
- [ ] Cerita Kami — Foto Kecil (Inset)

**Outbound (6)**
- [ ] Outbound — Foto Hero
- [ ] Outbound — Foto Our Experience
- [ ] Outbound — Galeri Foto Utama
- [ ] Outbound — Galeri Foto Panjang
- [ ] Outbound — Galeri Foto Kecil 1
- [ ] Outbound — Galeri Foto Kecil 2

**Galeri (4)**
- [ ] Galeri — Foto 1
- [ ] Galeri — Foto 2
- [ ] Galeri — Foto 3
- [ ] Galeri — Foto 4

**Food & Coffee (2)**
- [ ] Food & Coffee — Foto Hero
- [ ] Food & Coffee — Foto Cerita Kuliner

---

### 🟡 C. Pengaturan situs — perlu data dari perusahaan

Menu **Site Settings** di CMS Kusuma Group.

- [ ] **Instagram** — sekarang mengarah ke `instagram.com/blupblup.th`, **bukan akun Kusuma**. Ini terbaca mesin pencari, jadi penting diperbaiki.
- [ ] **YouTube** — masih `https://youtube.com` polos
- [ ] **TikTok** — masih `https://tiktok.com` polos
- [ ] Periksa ulang alamat, telepon, email, dan nomor WhatsApp

### 🟡 D. Testimoni — perlu keputusan

Menu **Testimonials**. Sekarang berisi "Rina, Malang" / "Budi, Surabaya" / "Sari, Batu" — hanya nama depan dan kota, tanpa foto atau sumber yang bisa dicek.

- [ ] Ganti dengan testimoni asli (mis. dari Google Review), atau hapus bagiannya kalau belum ada

### ✅ E. Kusuma Agro Industri — tidak ada yang perlu diisi

Situs http://kusuma-industri.test/ sudah memakai konten dan foto asli. Cukup diperiksa sekilas.

---

## 4. Panduan foto

- **Boleh unggah foto besar langsung dari kamera** — sistem otomatis memperkecilnya. Tidak perlu di-resize manual.
- Format: **JPG, PNG, atau WebP**. File selain gambar akan ditolak.
- **Foto mendatar (landscape)** lebih cocok untuk hero dan kartu; **potret** untuk foto orang.
- Pastikan fotonya **benar-benar milik Kusuma** — jangan comot dari internet, situs ini akan tayang untuk publik.

---

## 5. Kalau ada kendala

| Gejala | Penyebab biasanya |
|---|---|
| Situs tidak bisa dibuka sama sekali | Komputer developer mati, atau Apache/MySQL belum dinyalakan |
| Muncul halaman "Digdoyo Projects" | File `hosts` belum diatur (lihat bagian 1) |
| Perubahan tidak muncul | Tekan `Ctrl+Shift+R` untuk memuat ulang tanpa cache |
| Foto gagal diunggah | Cek formatnya — hanya JPG, PNG, WebP, GIF yang diterima |
| Diminta login terus-menerus | Sesi habis, cukup login ulang |

Kalau macet, catat **halaman mana** dan **pesan errornya**, lalu sampaikan ke pengelola.
