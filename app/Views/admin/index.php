<?php
require 'Views/admin/config.php';

$tables = [
    'about_items' => [
        'label' => 'About Items',
        'pk' => 'id',
        'order_by' => 'sort_order',
        'columns' => [
            'label'      => ['label' => 'Label', 'type' => 'text'],
            'name'       => ['label' => 'Nama', 'type' => 'text'],
            'icon'       => ['label' => 'Icon', 'type' => 'text'],
            'image'      => ['label' => 'Gambar (URL)', 'type' => 'text'],
            'text'       => ['label' => 'Teks', 'type' => 'textarea'],
            'sort_order' => ['label' => 'Urutan', 'type' => 'number'],
        ],
    ],
    'companies' => [
        'label' => 'Companies',
        'pk' => 'id',
        'order_by' => 'sort_order',
        'columns' => [
            'name'        => ['label' => 'Nama Perusahaan', 'type' => 'text'],
            'icon'        => ['label' => 'Icon', 'type' => 'text'],
            'description' => ['label' => 'Deskripsi', 'type' => 'textarea'],
            'image'       => ['label' => 'Gambar/Logo', 'type' => 'text'],
            'link'        => ['label' => 'Link Website', 'type' => 'text'],
            'sort_order'  => ['label' => 'Urutan', 'type' => 'number'],
        ],
    ],
    'gallery_photos' => [
        'label' => 'Gallery Photos',
        'pk' => 'id',
        'order_by' => 'sort_order',
        'columns' => [
            'image'      => ['label' => 'Gambar (URL)', 'type' => 'text'],
            'caption'    => ['label' => 'Caption', 'type' => 'text'],
            'sort_order' => ['label' => 'Urutan', 'type' => 'number'],
        ],
    ],
    'hero_slides' => [
        'label' => 'Hero Slides',
        'pk' => 'id',
        'order_by' => 'sort_order',
        'columns' => [
            'image'      => ['label' => 'Gambar (URL)', 'type' => 'text'],
            'eyebrow'    => ['label' => 'Eyebrow', 'type' => 'text'],
            'title'      => ['label' => 'Judul', 'type' => 'text'],
            'subtitle'   => ['label' => 'Subjudul', 'type' => 'textarea'],
            'cta_text'   => ['label' => 'Teks Tombol', 'type' => 'text'],
            'cta_link'   => ['label' => 'Link Tombol', 'type' => 'text'],
            'sort_order' => ['label' => 'Urutan', 'type' => 'number'],
        ],
    ],
    'stats' => [
        'label' => 'Stats',
        'pk' => 'id',
        'order_by' => 'sort_order',
        'columns' => [
            'number'     => ['label' => 'Angka', 'type' => 'text'],
            'label'      => ['label' => 'Label', 'type' => 'text'],
            'sort_order' => ['label' => 'Urutan', 'type' => 'number'],
        ],
    ],
    'testimonials' => [
        'label' => 'Testimonials',
        'pk' => 'id',
        'order_by' => 'sort_order',
        'columns' => [
            'name'       => ['label' => 'Nama', 'type' => 'text'],
            'text'       => ['label' => 'Testimoni', 'type' => 'textarea'],
            'rating'     => ['label' => 'Rating (1-5)', 'type' => 'number'],
            'sort_order' => ['label' => 'Urutan', 'type' => 'number'],
        ],
    ],
    'admins' => [
        'label' => 'Admins',
        'pk' => 'id',
        'order_by' => 'id',
        'columns' => [
            'username'     => ['label' => 'Username', 'type' => 'text'],
            'password'     => ['label' => 'Password (kosongkan jika tidak diubah)', 'type' => 'password'],
            'nama_lengkap' => ['label' => 'Nama Lengkap', 'type' => 'text'],
        ],
    ],
    'site_settings' => [
        'label' => 'Site Settings',
        'pk' => 'id',
        'order_by' => 'id',
        'single' => true, // hanya 1 baris, tidak ada tambah/hapus
        'columns' => [
            'logo'                   => ['label' => 'Logo', 'type' => 'text'],
            'companies_subtitle'     => ['label' => 'Subtitle Companies', 'type' => 'textarea'],
            'about_subtitle'         => ['label' => 'Subtitle About', 'type' => 'textarea'],
            'gallery_subtitle'       => ['label' => 'Subtitle Gallery', 'type' => 'textarea'],
            'address'                => ['label' => 'Alamat', 'type' => 'text'],
            'phone'                  => ['label' => 'Telepon', 'type' => 'text'],
            'phone_link'             => ['label' => 'Link Telepon', 'type' => 'text'],
            'email'                  => ['label' => 'Email', 'type' => 'text'],
            'maps_embed_url'         => ['label' => 'Maps Embed URL', 'type' => 'textarea'],
            'maps_link_url'          => ['label' => 'Maps Link URL', 'type' => 'text'],
            'ig_url'                 => ['label' => 'Instagram', 'type' => 'text'],
            'fb_url'                 => ['label' => 'Facebook', 'type' => 'text'],
            'yt_url'                 => ['label' => 'YouTube', 'type' => 'text'],
            'tiktok_url'             => ['label' => 'TikTok', 'type' => 'text'],
            'whatsapp_number'        => ['label' => 'Nomor WhatsApp', 'type' => 'text'],
            'whatsapp_message'       => ['label' => 'Pesan WhatsApp', 'type' => 'textarea'],
            'footer_about'           => ['label' => 'Footer About', 'type' => 'textarea'],
            'footer_copyright_name'  => ['label' => 'Nama Copyright', 'type' => 'text'],
        ],
    ],
];

// ==========================================================
// 2. TENTUKAN TABEL AKTIF
// ==========================================================
$activeTable = $_GET['table'] ?? 'about_items';
if (!array_key_exists($activeTable, $tables)) {
    $activeTable = 'about_items';
}
$conf = $tables[$activeTable];
$pk   = $conf['pk'];
$isSingle = !empty($conf['single']);

$alert = '';

// ==========================================================
// 3. PROSES SIMPAN (TAMBAH / EDIT) - via POST
// ==========================================================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['action'] ?? '') === 'save') {
    $postTable = $_POST['table'] ?? '';
    if (array_key_exists($postTable, $tables)) {
        $conf2 = $tables[$postTable];
        $cols  = array_keys($conf2['columns']);
        $id    = $_POST['id'] ?? '';

        $data = [];
        foreach ($cols as $c) {
            $val = $_POST[$c] ?? '';

            // khusus password: kalau kosong saat edit, jangan diubah
            if ($c === 'password') {
                if ($val === '') {
                    continue; // skip, tidak update password
                }
                $val = password_hash($val, PASSWORD_BCRYPT);
            }
            $data[$c] = $val;
        }

        if ($id !== '') {
            // UPDATE
            $set = implode(', ', array_map(fn($c) => "`$c` = :$c", array_keys($data)));
            $sql = "UPDATE `$postTable` SET $set WHERE `{$conf2['pk']}` = :pk";
            $stmt = $pdo->prepare($sql);
            $data['pk'] = $id;
            $stmt->execute($data);
            $alert = 'Data berhasil diperbarui.';
        } else {
            // INSERT (password wajib diisi kalau tabel admins)
            if ($postTable === 'admins' && empty($data['password'])) {
                $alert = 'Password wajib diisi untuk admin baru.';
            } else {
                $cols2 = array_keys($data);
                $fields = implode(', ', array_map(fn($c) => "`$c`", $cols2));
                $binds  = implode(', ', array_map(fn($c) => ":$c", $cols2));
                $sql = "INSERT INTO `$postTable` ($fields) VALUES ($binds)";
                $stmt = $pdo->prepare($sql);
                $stmt->execute($data);
                $alert = 'Data berhasil ditambahkan.';
            }
        }
    }
    header('Location: index.php?table=' . urlencode($postTable) . '&msg=' . urlencode($alert));
    exit;
}

// ==========================================================
// 4. PROSES HAPUS - via GET
// ==========================================================
if (($_GET['action'] ?? '') === 'delete' && isset($_GET['id'])) {
    $delTable = $_GET['table'] ?? '';
    if (array_key_exists($delTable, $tables) && empty($tables[$delTable]['single'])) {
        $stmt = $pdo->prepare("DELETE FROM `$delTable` WHERE `{$tables[$delTable]['pk']}` = ?");
        $stmt->execute([$_GET['id']]);
        header('Location: index.php?table=' . urlencode($delTable) . '&msg=' . urlencode('Data berhasil dihapus.'));
        exit;
    }
}

if (isset($_GET['msg'])) {
    $alert = $_GET['msg'];
}

// ==========================================================
// 5. AMBIL DATA UNTUK TABEL AKTIF
// ==========================================================
$orderBy = $conf['order_by'] ?? $pk;
$rows = $pdo->query("SELECT * FROM `$activeTable` ORDER BY `$orderBy` ASC")->fetchAll();

// kalau single (site_settings) dan belum ada baris, siapkan array kosong
if ($isSingle && count($rows) === 0) {
    $rows = [array_fill_keys(array_merge([$pk], array_keys($conf['columns'])), '')];
    $rows[0][$pk] = 1;
}
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Kusuma Agrowisata</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* ================= CSS - TEMA HIJAU ================= */
        :root {
            --green: #2e7d32;
            --green-dark: #1b5e20;
            --green-light: #e8f5e9;
            --green-soft: #66bb6a;
            --bg: #f4f7f3;
            --text: #243027;
            --border: #d7e4d7;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Segoe UI, Arial, sans-serif;
            background: var(--bg);
            color: var(--text);
        }

        .layout {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 230px;
            background: var(--green-dark);
            color: #fff;
            padding: 20px 0;
            flex-shrink: 0;
        }

        .sidebar h2 {
            font-size: 18px;
            text-align: center;
            margin: 0 0 20px;
            padding: 0 10px;
        }

        .sidebar a {
            display: block;
            color: #e8f5e9;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 14px;
            border-left: 4px solid transparent;
        }

        .sidebar a:hover {
            background: var(--green);
        }

        .sidebar a.active {
            background: var(--green);
            border-left: 4px solid #a5d6a7;
            font-weight: bold;
        }

        /* Main content */
        .main {
            flex: 1;
            padding: 25px 30px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .topbar h1 {
            font-size: 22px;
            color: var(--green-dark);
            margin: 0;
        }

        .btn {
            display: inline-block;
            background: var(--green);
            color: #fff;
            border: none;
            padding: 9px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
        }

        .btn:hover {
            background: var(--green-dark);
        }

        .btn-edit {
            background: #66bb6a;
        }

        .btn-edit:hover {
            background: var(--green);
        }

        .btn-del {
            background: #e53935;
        }

        .btn-del:hover {
            background: #b71c1c;
        }

        .btn-sm {
            padding: 6px 10px;
            font-size: 12px;
            margin-right: 5px;
        }

        .alert {
            background: var(--green-light);
            border: 1px solid var(--green-soft);
            color: var(--green-dark);
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-size: 14px;
        }

        /* Table */
        .card {
            background: #fff;
            border-radius: 10px;
            border: 1px solid var(--border);
            overflow-x: auto;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13px;
        }

        th,
        td {
            padding: 10px 12px;
            text-align: left;
            border-bottom: 1px solid var(--border);
            max-width: 260px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        th {
            background: var(--green-light);
            color: var(--green-dark);
        }

        tr:hover td {
            background: #fafffa;
        }

        img.thumb {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 5px;
            vertical-align: middle;
        }

        /* Modal */
        .modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.45);
            align-items: center;
            justify-content: center;
            z-index: 100;
        }

        .modal-overlay.show {
            display: flex;
        }

        .modal {
            background: #fff;
            width: 100%;
            max-width: 520px;
            max-height: 88vh;
            overflow-y: auto;
            border-radius: 10px;
            padding: 22px 24px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        }

        .modal h3 {
            margin-top: 0;
            color: var(--green-dark);
        }

        .modal label {
            display: block;
            font-size: 13px;
            margin: 12px 0 5px;
            color: #444;
        }

        .modal input[type=text],
        .modal input[type=number],
        .modal input[type=password],
        .modal textarea {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid var(--border);
            border-radius: 6px;
            font-size: 14px;
            font-family: inherit;
        }

        .modal textarea {
            resize: vertical;
            min-height: 70px;
        }

        .modal-actions {
            margin-top: 18px;
            display: flex;
            justify-content: flex-end;
            gap: 8px;
        }

        .close-btn {
            position: absolute;
            top: 14px;
            right: 18px;
            cursor: pointer;
            font-size: 20px;
            color: #888;
        }

        .modal {
            position: relative;
        }

        @media(max-width:768px) {
            .layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                display: flex;
                overflow-x: auto;
                padding: 10px;
            }

            .sidebar h2 {
                display: none;
            }

            .sidebar a {
                white-space: nowrap;
                padding: 10px 14px;
                border-left: none;
                border-bottom: 3px solid transparent;
            }

            .sidebar a.active {
                border-left: none;
                border-bottom: 3px solid #a5d6a7;
            }
        }
    </style>
</head>

<body>
    <div class="layout">

        <!-- ============ SIDEBAR ============ -->
        <div class="sidebar">
            <h2>🌿 Kusuma Admin</h2>
            <?php foreach ($tables as $key => $t): ?>
                <a href="index.php?table=<?= $key ?>" class="<?= $key === $activeTable ? 'active' : '' ?>">
                    <?= htmlspecialchars($t['label']) ?>
                </a>
            <?php endforeach; ?>
        </div>

        <!-- ============ MAIN CONTENT ============ -->
        <div class="main">
            <div class="topbar">
                <h1><?= htmlspecialchars($conf['label']) ?></h1>
                <?php if (!$isSingle): ?>
                    <button class="btn" onclick="openAddModal()">+ Tamshdbbah Data</button>
                <?php endif; ?>
            </div>

            <?php if ($alert): ?>
                <div class="alert"><?= htmlspecialchars($alert) ?></div>
            <?php endif; ?>

            <?php if ($isSingle): ?>
                <!-- ===== TAMPILAN SINGLE ROW (site_settings) ===== -->
                <div class="card" style="padding:20px;">
                    <button class="btn" onclick='openEditModal(<?= htmlspecialchars(json_encode($rows[0]), ENT_QUOTES) ?>)'>
                        Edit Pengaturan
                    </button>
                    <table style="margin-top:15px;">
                        <?php foreach ($conf['columns'] as $field => $meta): ?>
                            <tr>
                                <th style="width:220px;"><?= htmlspecialchars($meta['label']) ?></th>
                                <td style="white-space:normal;"><?= htmlspecialchars($rows[0][$field] ?? '') ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </table>
                </div>

            <?php else: ?>
                <!-- ===== TAMPILAN TABEL LIST ===== -->
                <div class="card">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <?php foreach ($conf['columns'] as $field => $meta):
                                    if ($field === 'password') continue; ?>
                                    <th><?= htmlspecialchars($meta['label']) ?></th>
                                <?php endforeach; ?>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (count($rows) === 0): ?>
                                <tr>
                                    <td colspan="10" style="text-align:center;color:#999;">Belum ada data.</td>
                                </tr>
                            <?php endif; ?>
                            <?php foreach ($rows as $row): ?>
                                <tr>
                                    <td><?= htmlspecialchars($row[$pk]) ?></td>
                                    <?php foreach ($conf['columns'] as $field => $meta):
                                        if ($field === 'password') continue; ?>
                                        <td>
                                            <?php if ($field === 'image' || strpos($field, 'image') === 0):
                                                $val = $row[$field] ?? ''; ?>
                                                <?php if ($val && strpos($val, 'http') === 0): ?>
                                                    <img src="<?= htmlspecialchars($val) ?>" class="thumb" alt="">
                                                <?php else: ?>
                                                    <?= htmlspecialchars($val) ?>
                                                <?php endif; ?>
                                            <?php else: ?>
                                                <?= htmlspecialchars(mb_strimwidth((string)($row[$field] ?? ''), 0, 60, '...')) ?>
                                            <?php endif; ?>
                                        </td>
                                    <?php endforeach; ?>
                                    <td>
                                        <button class="btn btn-edit btn-sm" onclick='openEditModal(<?= htmlspecialchars(json_encode($row), ENT_QUOTES) ?>)'>Edit</button>
                                        <a class="btn btn-del btn-sm" href="index.php?table=<?= $activeTable ?>&action=delete&id=<?= $row[$pk] ?>"
                                            onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <!-- ============ MODAL FORM (dipakai untuk tambah & edit) ============ -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h3 id="modalTitle">Tambah Data</h3>
            <form method="POST" action="index.php">
                <input type="hidden" name="action" value="save">
                <input type="hidden" name="table" value="<?= $activeTable ?>">
                <input type="hidden" name="id" id="field_id" value="">

                <?php foreach ($conf['columns'] as $field => $meta): ?>
                    <label for="field_<?= $field ?>"><?= htmlspecialchars($meta['label']) ?></label>
                    <?php if ($meta['type'] === 'textarea'): ?>
                        <textarea name="<?= $field ?>" id="field_<?= $field ?>"></textarea>
                    <?php elseif ($meta['type'] === 'password'): ?>
                        <input type="password" name="<?= $field ?>" id="field_<?= $field ?>" autocomplete="new-password">
                    <?php elseif ($meta['type'] === 'number'): ?>
                        <input type="number" name="<?= $field ?>" id="field_<?= $field ?>">
                    <?php else: ?>
                        <input type="text" name="<?= $field ?>" id="field_<?= $field ?>">
                    <?php endif; ?>
                <?php endforeach; ?>

                <div class="modal-actions">
                    <button type="button" class="btn btn-del" onclick="closeModal()">Batal</button>
                    <button type="submit" class="btn">Simpan</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        /* ================= JS - MODAL HANDLER ================= */
        const overlay = document.getElementById('modalOverlay');
        const modalTitle = document.getElementById('modalTitle');

        function openModal() {
            overlay.classList.add('show');
        }

        function closeModal() {
            overlay.classList.remove('show');
        }
        // klik di luar modal untuk menutup
        overlay.addEventListener('click', function(e) {
            if (e.target === overlay) closeModal();
        });

        function clearForm() {
            document.querySelectorAll('#modalOverlay input[type=text], #modalOverlay input[type=number], #modalOverlay input[type=password], #modalOverlay textarea')
                .forEach(el => el.value = '');
            document.getElementById('field_id').value = '';
        }

        function openAddModal() {
            clearForm();
            modalTitle.textContent = 'Tambah Data';
            openModal();
        }

        function openEditModal(data) {
            clearForm();
            modalTitle.textContent = 'Edit Data';
            document.getElementById('field_id').value = data['<?= $pk ?>'] ?? '';
            for (const key in data) {
                const el = document.getElementById('field_' + key);
                if (el && el.type !== 'password') {
                    el.value = data[key];
                }
            }
            openModal();
        }
    </script>
</body>

</html>