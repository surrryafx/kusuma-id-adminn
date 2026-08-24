<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Admin Kusuma Agrowisata</title>
    <style>
        :root {
            --dark-green: #1b4332;
            --mid-green: #2d6a4f;
            --light-green: #d8f3dc;
            --bg-gray: #f8f9fa;
            --text-dark: #2d3748;
            --border: #e2e8f0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--bg-gray);
            color: var(--text-dark);
            display: flex;
            min-height: 100vh;
        }

        /* SIDEBAR FIX: Background dijamin hijau gelap pekat, teks terlihat jelas */
        .sidebar {
            width: 280px;
            background-color: #1b4332 !important;
            /* Hijau Gelap Hutan Kusuma */
            color: #ffffff !important;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            padding: 25px 0;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            z-index: 100;
        }

        .sidebar-brand {
            padding: 0 25px 20px 25px;
            font-size: 16px;
            font-weight: bold;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #ffffff !important;
        }

        .sidebar-menu {
            list-style: none;
            padding: 15px 0;
            margin: 0;
        }

        .sidebar-menu li {
            width: 100%;
        }

        .sidebar-menu li a {
            display: block;
            padding: 14px 25px;
            color: #e2e8f0 !important;
            /* Teks Putih Terang Jelas */
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s;
        }

        /* Menu yang aktif jadi hijau terang mendominasi */
        .sidebar-menu li.active a {
            background-color: #2d6a4f !important;
            color: #ffffff !important;
            border-left: 6px solid #d8f3dc;
            font-weight: bold;
        }

        .sidebar-menu li a:hover {
            background-color: rgba(255, 255, 255, 0.1);
            color: #ffffff !important;
        }

        .btn-logout-sidebar {
            display: block;
            margin: 30px 25px 10px 25px;
            background-color: #d90429;
            color: white !important;
            text-decoration: none;
            padding: 10px;
            text-align: center;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
        }

        /* MAIN CONTENT KANAN */
        .main-content {
            margin-left: 280px;
            flex-grow: 1;
            padding: 40px;
            box-sizing: border-box;
            width: calc(100% - 280px);
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 2px solid var(--border);
            padding-bottom: 15px;
        }

        .content-header h2 {
            margin: 0;
            color: #1b4332;
            text-transform: uppercase;
            font-size: 22px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 6px;
            border: 1px solid #c3e6cb;
        }

        .card {
            background: white;
            border-radius: 8px;
            border: 1px solid var(--border);
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 15px;
            border-bottom: 1px solid var(--border);
            text-align: left;
        }

        th {
            background-color: #f1f5f9;
            color: #1b4332;
            font-weight: 600;
        }

        .img-table {
            width: 90px;
            height: 55px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid var(--border);
        }

        .btn-edit-action {
            background-color: #2d6a4f;
            color: white;
            padding: 8px 14px;
            text-decoration: none;
            border-radius: 4px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border: none;
        }

        /* MODAL POP-UP STYLE */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }

        .modal-overlay.show {
            opacity: 1;
            visibility: visible;
        }

        .modal-box {
            background: white;
            width: 100%;
            max-width: 550px;
            padding: 30px;
            border-radius: 12px;
            transform: translateY(-20px);
            transition: all 0.3s ease;
        }

        .modal-overlay.show .modal-box {
            transform: translateY(0);
        }

        .modal-header {
            border-bottom: 1px solid var(--border);
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .modal-header h3 {
            margin: 0;
            color: #1b4332;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            font-size: 14px;
            color: #1b4332;
        }

        .current-data-box {
            background: #f1f3f9;
            padding: 10px;
            border-radius: 6px;
            font-size: 13px;
            color: #666;
            margin-bottom: 6px;
            font-style: italic;
            border-left: 3px solid #2d6a4f;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccd1d9;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 25px;
            padding-top: 15px;
            border-top: 1px solid var(--border);
        }

        .btn-save {
            background-color: #1b4332;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-close {
            background-color: #858796;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="sidebar">
        <div class="sidebar-brand">kusuma.id</div>
        <ul class="sidebar-menu">
            <li class="<?= (isset($active_section) && $active_section == 'beranda') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=beranda') ?>">Beranda</a></li>
            <li class="<?= (isset($active_section) && $active_section == 'perusahaan') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=perusahaan') ?>">Perusahaan Kami</a></li>
            <li class="<?= (isset($active_section) && $active_section == 'layanan') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=layanan') ?>">Layanan</a></li>
            <li class="<?= (isset($active_section) && $active_section == 'about') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=about') ?>">Tentang Kami</a></li>
            <li class="<?= (isset($active_section) && $active_section == 'galeri') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=galeri') ?>">Galeri Foto</a></li>
            <li class="<?= (isset($active_section) && $active_section == 'kontak') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=kontak') ?>">Data Kontak</a></li>
            <li class="<?= (isset($active_section) && $active_section == 'hubungi') ? 'active' : '' ?>"><a href="<?= base_url('admin?section=hubungi') ?>">Tombol Hubungi Kami</a></li>
        </ul>
        <a href="<?= base_url('logout') ?>" class="btn-logout-sidebar">Logout</a>
    </div>

    <div class="main-content">
        <div class="content-header">
            <h2>Kelola Bagian: <?= ucfirst($active_section ?? 'beranda') ?></h2>
            <span style="font-size: 14px; color: #718096;">Live: <a href="<?= base_url('/') ?>" target="_blank" style="color: #2d6a4f; font-weight: bold; text-decoration: none;">Pratinjau Halaman Utama →</a></span>
        </div>

        <?php if (session()->getFlashdata('success')): ?>
            <div class="alert-success"><?= session()->getFlashdata('success') ?></div>
        <?php endif; ?>

        <div class="card">
            <table>
                <thead>
                    <tr>
                        <th style="width: 15%;">Komponen</th>
                        <th style="width: 15%;">Gambar / File</th>
                        <th style="width: 30%;">Judul Konten</th>
                        <th style="width: 30%;">Subjudul / Nilai Teks</th>
                        <th style="width: 10%;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (isset($contents) && !empty($contents)): ?>
                        <?php foreach ($contents as $row): ?>
                            <tr>
                                <td style="font-weight: bold; color: #2d6a4f; text-transform: uppercase; font-size: 13px;"><?= esc(str_replace('_', ' ', $row['content_key'])) ?></td>
                                <td>
                                    <?php if (!empty($row['image_url'])): ?>
                                        <img src="<?= base_url('uploads/' . $row['image_url']) ?>" class="img-table">
                                    <?php else: ?>
                                        <span style="color: #bbb; font-style: italic; font-size: 13px;">Tidak ada file</span>
                                    <?php endif; ?>
                                </td>
                                <td><b><?= esc($row['title'] ?? '-') ?></b></td>
                                <td style="font-size: 14px; color: #4a5568;"><?= esc($row['subtitle'] ?? '-') ?></td>
                                <td>
                                    <button class="btn-edit-action" onclick="openEditModal(<?= htmlspecialchars(json_encode($row)) ?>)">Edit</button>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5" style="text-align: center; color: #718096; padding: 40px; font-style: italic;">
                                Belum ada data untuk bagian "<?= esc($active_section ?? 'beranda') ?>".<br>
                                <small style="color: #a0aec0;">Silakan isi baris data dengan section_name '<?= esc($active_section ?? 'beranda') ?>' di database phpMyAdmin Anda.</small>
                            </td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    <div id="editModal" class="modal-overlay" onclick="closeEditModal(event)">
        <div class="modal-box">
            <div class="modal-header">
                <h3 id="modal-title-text">Ubah Konten</h3>
            </div>
            <form id="modal-form" action="" method="POST" enctype="multipart/form-data" onsubmit="return confirm('Apakah Anda yakin ingin menerapkan perubahan live ini?');">

                <div class="form-group">
                    <label>Judul Teks Saat Ini:</label>
                    <div id="preview-title" class="current-data-box"></div>
                    <label style="color: #2d6a4f;">Masukkan Judul Baru:</label>
                    <input type="text" id="input-title" name="title" required>
                </div>

                <div class="form-group">
                    <label>Subjudul / Nilai Deskripsi Saat Ini:</label>
                    <div id="preview-subtitle" class="current-data-box"></div>
                    <label style="color: #2d6a4f;">Masukkan Isi Baru:</label>
                    <textarea id="input-subtitle" name="subtitle" rows="3" required></textarea>
                </div>

                <div class="form-group">
                    <label>Ganti File Gambar (Opsional):</label>
                    <input type="file" name="image_file">
                    <small style="color: #858796; display: block; margin-top: 4px;">*Kosongkan jika tidak ingin merubah gambar.</small>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn-close" onclick="document.getElementById('editModal').classList.remove('show')">Batal</button>
                    <button type="submit" class="btn-save">Simpan Perubahan</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openEditModal(data) {
            document.getElementById('modal-form').action = "<?= base_url('admin/update/') ?>/" + data.id;
            document.getElementById('modal-title-text').innerText = "EDIT: " + data.content_key.replace('_', ' ').toUpperCase();

            document.getElementById('preview-title').innerText = data.title ? '" ' + data.title + ' "' : '" - "';
            document.getElementById('preview-subtitle').innerText = data.subtitle ? '" ' + data.subtitle + ' "' : '" - "';

            document.getElementById('input-title').value = data.title ?? '';
            document.getElementById('input-subtitle').value = data.subtitle ?? '';

            document.getElementById('editModal').classList.add('show');
        }

        function closeEditModal(event) {
            if (event.target.id === 'editModal') {
                document.getElementById('editModal').classList.remove('show');
            }
        }
    </script>
</body>

</html>