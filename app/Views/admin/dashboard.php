<?php
$tableIcons = [
    'hero_slides'    => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>',
    'companies'      => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>',
    'services'       => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2l2.6 6.6L21 9.3l-4.9 4.3 1.5 6.6L12 16.8 6.4 20.2l1.5-6.6L3 9.3l6.4-.7z"></path></svg>',
    'team_members'   => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>',
    'about_items'    => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>',
    'gallery_photos' => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>',
    'stats'          => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>',
    'testimonials'   => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>',
    'site_settings'  => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>',
    'admins'         => '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>'
];
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Kusuma Group</title>
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="<?= base_url('assets/favicon.svg') ?>">

    <!-- Google Fonts: Baloo 2 + Nunito Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Baloo+2:wght@500;600;700;800&family=Nunito+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400&display=swap" rel="stylesheet" />

    <style>
        :root {
            --green-bright: #62c94b;
            --green-deep: #1f5b34;
            --green-soft: #eaf8e6;
            --green-mint: #d8f3d3;
            --cream: #fbfdf8;
            --white: #ffffff;
            --apple-red: #e2543f;
            --ink: #22331f;
            --ink-soft: #5b6b56;
            --shadow-soft: 0 16px 40px -20px rgba(31, 91, 52, 0.08);
            --radius-lg: 16px;
            --radius-md: 8px;
            --font-display: "Baloo 2", "Segoe UI Rounded", sans-serif;
            --font-body: "Nunito Sans", "Segoe UI", sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: var(--font-body);
            background: var(--cream);
            color: var(--ink);
            -webkit-font-smoothing: antialiased;
        }

        .layout {
            display: flex;
            min-height: 100vh;
            min-height: 100dvh;
        }

        /* Sidebar - Airy, modern off-white */
        .sidebar {
            width: 250px;
            background: var(--white);
            border-right: 1px solid #e2e8df;
            padding: 32px 16px;
            display: flex;
            flex-direction: column;
            flex-shrink: 0;
        }

        .sidebar h2 {
            font-family: var(--font-display);
            font-size: 1.3rem;
            color: var(--green-deep);
            margin: 0 0 28px;
            padding: 0 12px;
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 700;
        }

        .sidebar-nav {
            display: flex;
            flex-direction: column;
            gap: 6px;
            flex: 1;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            gap: 12px;
            color: var(--ink-soft);
            text-decoration: none;
            padding: 11px 16px;
            font-size: 0.92rem;
            font-weight: 600;
            border-radius: var(--radius-md);
            transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .sidebar-nav a svg {
            width: 18px;
            height: 18px;
            flex-shrink: 0;
        }

        .sidebar-nav a:hover {
            background: var(--green-soft);
            color: var(--green-deep);
        }

        .sidebar-nav a.active {
            background: var(--green-soft);
            color: var(--green-deep);
        }

        .sidebar .logout {
            border-top: 1px solid #e2e8df;
            padding-top: 20px;
            margin-top: 20px;
        }

        .logout-link {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--apple-red);
            text-decoration: none;
            padding: 11px 16px;
            font-size: 0.92rem;
            font-weight: 600;
            border-radius: var(--radius-md);
            transition: all 0.2s ease;
        }

        .logout-link svg {
            width: 18px;
            height: 18px;
            flex-shrink: 0;
        }

        .logout-link:hover {
            background: rgba(226, 84, 63, 0.05);
        }

        /* Main Content */
        .main {
            flex: 1;
            padding: 40px 48px;
            overflow-x: hidden;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
            gap: 16px;
        }

        .topbar h1 {
            font-family: var(--font-display);
            font-size: 1.8rem;
            color: var(--green-deep);
            margin: 0;
            font-weight: 700;
            letter-spacing: -0.01em;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            background: var(--green-deep);
            color: var(--white);
            border: none;
            padding: 11px 20px;
            border-radius: var(--radius-md);
            cursor: pointer;
            font-family: var(--font-display);
            font-weight: 600;
            font-size: 0.92rem;
            text-decoration: none;
            transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
            outline: none;
        }

        .btn:hover {
            background: var(--green-bright);
            transform: translateY(-1px);
        }

        .btn:active {
            transform: translateY(1px);
        }

        .btn-edit {
            background: #f1f5f0;
            color: var(--green-deep);
        }

        .btn-edit:hover {
            background: var(--green-deep);
            color: var(--white);
        }

        .btn-del {
            background: #fdf2f1;
            color: var(--apple-red);
        }

        .btn-del:hover {
            background: var(--apple-red);
            color: var(--white);
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 0.82rem;
            border-radius: 6px;
            font-weight: 600;
        }

        /* Alert notifications */
        .alert {
            background: var(--green-soft);
            border: 1px solid rgba(98, 201, 75, 0.15);
            color: var(--green-deep);
            padding: 14px 18px;
            border-radius: var(--radius-md);
            margin-bottom: 28px;
            font-size: 0.88rem;
            display: flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 12px rgba(31, 91, 52, 0.03);
        }

        .alert-error {
            background: rgba(226, 84, 63, 0.05);
            border-color: rgba(226, 84, 63, 0.15);
            color: var(--apple-red);
        }

        /* Responsive Card and Modern Tables */
        .card {
            background: var(--white);
            border-radius: var(--radius-lg);
            border: 1px solid #e2e8df;
            overflow: hidden;
            box-shadow: var(--shadow-soft);
        }

        .table-responsive {
            overflow-x: auto;
            width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.88rem;
            letter-spacing: -0.01em;
        }

        th,
        td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid #edf2eb;
            vertical-align: middle;
        }

        th {
            background: #f8faf7;
            color: var(--ink-soft);
            font-family: var(--font-display);
            font-weight: 700;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            border-bottom: 2px solid #e2e8df;
        }

        /* Subtly alternate row colors for easier scanning in lists */
        tbody tr:nth-child(even) td {
            background-color: #fafbfa;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        tbody tr:hover td {
            background-color: #f3f7f2 !important;
        }

        /* Text constraints inside tables to prevent row blowout */
        .td-text {
            display: block;
            max-width: 280px;
            word-wrap: break-word;
            white-space: normal;
            line-height: 1.5;
            color: var(--ink);
        }

        .td-id {
            font-family: monospace;
            font-weight: 600;
            color: var(--ink-soft);
            width: 60px;
            text-align: center;
        }

        th.th-id {
            text-align: center;
            width: 60px;
        }

        .td-actions {
            text-align: center;
            white-space: nowrap;
            width: 150px;
        }

        th.th-actions {
            text-align: center;
            width: 150px;
        }

        /* Thumbnails for standard items (e.g. logos) */
        img.thumb {
            width: 44px;
            height: 44px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #e2e8df;
            vertical-align: middle;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
            background: #fff;
        }

        /* Dynamic Landscape preview for Hero Slides */
        img.thumb-slide {
            width: 80px;
            height: 45px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #e2e8df;
            vertical-align: middle;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
        }

        /* Single settings sheet layout */
        .settings-table {
            border-collapse: collapse;
            width: 100%;
        }

        .settings-table tr {
            border-bottom: 1px solid #edf2eb;
        }

        .settings-table tr:last-child {
            border-bottom: none;
        }

        .settings-table th {
            width: 240px;
            background: #f8faf7;
            color: var(--green-deep);
            font-family: var(--font-display);
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 18px 24px;
            vertical-align: top;
            border-bottom: none;
            border-right: 1px solid #e2e8df;
        }

        .settings-table td {
            padding: 18px 24px;
            vertical-align: middle;
            background: var(--white);
            color: var(--ink);
            line-height: 1.6;
        }

        /* Modal styling - Glassmorphic overlay & sleek popup */
        .modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(34, 51, 31, 0.4);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            align-items: center;
            justify-content: center;
            z-index: 100;
        }

        .modal-overlay.show {
            display: flex;
        }

        .modal {
            background: var(--white);
            width: 100%;
            max-width: 520px;
            max-height: 85vh;
            overflow-y: auto;
            border-radius: var(--radius-lg);
            border: 1px solid #e2e8df;
            padding: 36px;
            box-shadow: 0 24px 64px -16px rgba(31, 91, 52, 0.15);
            position: relative;
            box-sizing: border-box;
            animation: modalReveal 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes modalReveal {
            from {
                opacity: 0;
                transform: scale(0.97) translateY(8px);
            }

            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .modal h3 {
            margin: 0 0 24px;
            font-family: var(--font-display);
            color: var(--green-deep);
            font-size: 1.35rem;
            font-weight: 700;
        }

        .modal label {
            display: block;
            font-family: var(--font-display);
            font-weight: 600;
            font-size: 0.88rem;
            margin: 18px 0 6px;
            color: var(--green-deep);
        }

        .modal label:first-of-type {
            margin-top: 0;
        }

        .modal input[type=text],
        .modal input[type=number],
        .modal input[type=password],
        .modal textarea {
            width: 100%;
            padding: 11px 13px;
            border: 1px solid #ccd3c7;
            border-radius: 8px;
            font-size: 0.92rem;
            font-family: var(--font-body);
            color: var(--ink);
            box-sizing: border-box;
            outline: none;
            background: var(--white);
            transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .modal input[type=text]:focus,
        .modal input[type=number]:focus,
        .modal input[type=password]:focus,
        .modal textarea:focus {
            border-color: var(--green-deep);
            box-shadow: 0 0 0 3px rgba(31, 91, 52, 0.08);
        }

        .modal textarea {
            resize: vertical;
            min-height: 80px;
        }

        .modal input[type=file] {
            font-family: var(--font-body);
            font-size: 0.85rem;
            color: var(--ink-soft);
            margin-top: 4px;
        }

        .modal img.preview {
            max-width: 120px;
            max-height: 120px;
            display: none;
            margin: 8px 0 12px;
            border-radius: 8px;
            border: 1px solid #e2e8df;
            object-fit: cover;
        }

        .modal-actions {
            margin-top: 32px;
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }

        .close-btn {
            position: absolute;
            top: 24px;
            right: 24px;
            cursor: pointer;
            font-size: 24px;
            line-height: 1;
            color: var(--ink-soft);
            transition: color 0.2s ease;
        }

        .close-btn:hover {
            color: var(--apple-red);
        }

        @media(max-width:768px) {
            .layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 16px;
                border-right: none;
                border-bottom: 1px solid #e2e8df;
            }

            .sidebar h2 {
                margin: 0 0 16px;
            }

            .sidebar-nav {
                flex-direction: row;
                overflow-x: auto;
                padding-bottom: 8px;
            }

            .sidebar-nav a {
                white-space: nowrap;
                padding: 8px 12px;
            }

            .sidebar .logout {
                margin-top: 10px;
                padding-top: 10px;
                border-top: none;
            }

            .main {
                padding: 24px;
            }

            .settings-table th {
                width: auto;
                border-right: none;
                border-bottom: 1px solid #e2e8df;
            }

            .settings-table tr {
                display: flex;
                flex-direction: column;
            }
        }
    </style>

    <!-- SweetAlert2 (notifikasi berhasil/gagal, konfirmasi hapus) -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <div class="layout">

        <!-- Sidebar Navigation -->
        <div class="sidebar">
            <h2>🌿 Kusuma Admin</h2>
            <nav class="sidebar-nav">
                <?php foreach ($tables as $key => $t): ?>
                    <a href="<?= base_url('admin/' . $key) ?>" class="<?= $key === $activeTable ? 'active' : '' ?>">
                        <?= $tableIcons[$key] ?? '' ?>
                        <span><?= esc($t['label']) ?></span>
                    </a>
                <?php endforeach; ?>
            </nav>
            <div class="logout">
                <a href="<?= base_url('logout') ?>" class="logout-link">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"></path>
                    </svg>
                    <span>Logout (<?= esc($username) ?>)</span>
                </a>
            </div>
        </div>

        <!-- Main Panel Content -->
        <div class="main">
            <div class="topbar">
                <h1><?= esc($conf['label']) ?></h1>
                <?php if (empty($conf['single'])): ?>
                    <button class="btn" onclick="openAddModal()">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="12" y1="5" x2="12" y2="19"></line>
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                        <span>Tambah Data</span>
                    </button>
                <?php else: ?>
                    <button class="btn" onclick='openEditModal(<?= json_encode($rows[0] ?? [], JSON_HEX_APOS | JSON_HEX_QUOT) ?>)'>
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 20h9"></path>
                            <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path>
                        </svg>
                        <span>Edit Pengaturan</span>
                    </button>
                <?php endif; ?>
            </div>

            <!-- Flashdata notifications: ditampilkan lewat SweetAlert2 (lihat script di bawah) -->
            <?php $flashSuccess = session()->getFlashdata('success'); ?>
            <?php $flashError   = session()->getFlashdata('error'); ?>

            <!-- Table or Form Display -->
            <?php if (! empty($conf['single'])): ?>
                <div class="card">
                    <div class="table-responsive">
                        <table class="settings-table">
                            <?php foreach ($conf['columns'] as $field => $meta): ?>
                                <tr>
                                    <th><?= esc($meta['label']) ?></th>
                                    <td>
                                        <?php if ($meta['type'] === 'image' && ! empty($rows[0][$field])): ?>
                                            <img class="thumb" src="<?= base_url($rows[0][$field]) ?>" alt="">
                                        <?php else: ?>
                                            <div style="max-width: 700px; word-wrap: break-word; white-space: normal;">
                                                <?= esc((string) ($rows[0][$field] ?? '')) ?>
                                            </div>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </table>
                    </div>
                </div>
            <?php else: ?>
                <div class="card">
                    <div class="table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="th-id">ID</th>
                                    <?php foreach ($conf['columns'] as $field => $meta): ?>
                                        <?php if ($field === 'password') continue; ?>
                                        <th><?= esc($meta['label']) ?></th>
                                    <?php endforeach; ?>
                                    <th class="th-actions">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (count($rows) === 0): ?>
                                    <tr>
                                        <td colspan="10" style="text-align:center;color:var(--ink-soft); padding: 32px;">Belum ada data.</td>
                                    </tr>
                                <?php endif; ?>
                                <?php foreach ($rows as $row): ?>
                                    <tr>
                                        <td class="td-id"><?= esc($row[$conf['pk']]) ?></td>
                                        <?php foreach ($conf['columns'] as $field => $meta): ?>
                                            <?php if ($field === 'password') continue; ?>
                                            <td>
                                                <?php if ($meta['type'] === 'image' && ! empty($row[$field])): ?>
                                                    <?php if ($activeTable === 'hero_slides'): ?>
                                                        <!-- Widescreen preview for banners -->
                                                        <img src="<?= str_starts_with($row[$field], 'http') ? $row[$field] : base_url($row[$field]) ?>" class="thumb-slide" alt="">
                                                    <?php else: ?>
                                                        <!-- Square preview for other assets -->
                                                        <img src="<?= str_starts_with($row[$field], 'http') ? $row[$field] : base_url($row[$field]) ?>" class="thumb" alt="">
                                                    <?php endif; ?>
                                                <?php elseif ($meta['type'] === 'textarea'): ?>
                                                    <span class="td-text">
                                                        <?= esc(mb_strimwidth((string) ($row[$field] ?? ''), 0, 100, '...')) ?>
                                                    </span>
                                                <?php else: ?>
                                                    <span class="td-text">
                                                        <?= esc((string) ($row[$field] ?? '')) ?>
                                                    </span>
                                                <?php endif; ?>
                                            </td>
                                        <?php endforeach; ?>
                                        <td class="td-actions">
                                            <div style="display: flex; justify-content: center; gap: 8px;">
                                                <button class="btn btn-edit btn-sm" onclick='openEditModal(<?= json_encode($row, JSON_HEX_APOS | JSON_HEX_QUOT) ?>)'>Edit</button>
                                                <button type="button" class="btn btn-del btn-sm"
                                                    onclick="adminConfirmDelete('<?= base_url('admin/' . $activeTable . '/hapus/' . $row[$conf['pk']]) ?>')">Hapus</button>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <!-- Modal Form (Sleek Glassmorphic Overlay) -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h3 id="modalTitle">Tambah Data</h3>
            <form method="POST" action="<?= base_url('admin/' . $activeTable . '/simpan') ?>" enctype="multipart/form-data">
                <?= csrf_field() ?>
                <input type="hidden" name="id" id="field_id" value="">

                <?php foreach ($conf['columns'] as $field => $meta): ?>
                    <label for="field_<?= $field ?>"><?= esc($meta['label']) ?></label>

                    <?php if ($meta['type'] === 'image'): ?>
                        <img class="preview" id="preview_<?= $field ?>" src="" alt="">
                        <input type="file" name="<?= $field ?>" id="field_<?= $field ?>" accept="image/*"
                            onchange="previewImage(this, 'preview_<?= $field ?>')">
                        <small style="color:var(--ink-soft);display:block;margin-top:4px;">Kosongkan jika tidak ingin ganti gambar.</small>

                    <?php elseif ($meta['type'] === 'textarea'): ?>
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
        function previewImage(input, previewId) {
            const preview = document.getElementById(previewId);
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = e => {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        const BASE_URL = "<?= base_url() ?>";
        const overlay = document.getElementById('modalOverlay');
        const modalTitle = document.getElementById('modalTitle');

        function openModal() {
            overlay.classList.add('show');
        }

        function closeModal() {
            overlay.classList.remove('show');
        }

        overlay.addEventListener('click', function(e) {
            if (e.target === overlay) closeModal();
        });

        function clearForm() {
            document.querySelectorAll('#modalOverlay input[type=text], #modalOverlay input[type=number], #modalOverlay input[type=password], #modalOverlay textarea')
                .forEach(el => el.value = '');
            document.querySelectorAll('#modalOverlay input[type=file]').forEach(el => el.value = '');
            document.querySelectorAll('#modalOverlay img.preview').forEach(el => {
                el.style.display = 'none';
                el.src = '';
            });
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
            document.getElementById('field_id').value = data['<?= $conf['pk'] ?>'] ?? '';

            for (const key in data) {
                const el = document.getElementById('field_' + key);
                if (!el) continue;

                if (el.type === 'file') {
                    const preview = document.getElementById('preview_' + key);
                    if (preview && data[key]) {
                        if (data[key].startsWith('http')) {
                            preview.src = data[key];
                        } else {
                            preview.src = BASE_URL + data[key];
                        }
                        preview.style.display = 'block';
                    }
                } else if (el.type !== 'password') {
                    el.value = data[key];
                }
            }
            openModal();
        }

        /**
         * Notifikasi berhasil/gagal (SweetAlert2) — konsisten dengan admin Industri.
         */
        <?php if ($flashSuccess): ?>
            Swal.fire({ icon: 'success', title: 'Berhasil', text: <?= json_encode($flashSuccess) ?>, timer: 1400, showConfirmButton: false });
        <?php endif; ?>
        <?php if ($flashError): ?>
            Swal.fire({ icon: 'error', title: 'Gagal', text: <?= json_encode($flashError) ?> });
        <?php endif; ?>

        /**
         * Konfirmasi hapus (SweetAlert2), kalau di-OK-in baru redirect ke link hapus.
         */
        function adminConfirmDelete(url) {
            Swal.fire({
                icon: 'warning',
                title: 'Hapus data ini?',
                text: 'Data akan dihapus permanen.',
                showCancelButton: true,
                confirmButtonText: 'Ya, hapus',
                cancelButtonText: 'Batal',
                confirmButtonColor: '#dc3545',
            }).then(function (result) {
                if (result.isConfirmed) {
                    window.location.href = url;
                }
            });
        }
    </script>
</body>

</html>