<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin | Kusuma Group</title>
    <meta name="robots" content="noindex, nofollow">

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="<?= base_url('assets/favicon.svg') ?>">

    <!-- Google Fonts: Plus Jakarta Sans + Nunito Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;600;700;800&family=Nunito+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400&display=swap" rel="stylesheet" />

    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="<?= base_url('css/style.css') ?>" />

    <!-- SweetAlert2 (notifikasi gagal login) -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background-color: var(--cream);
            /* Subtle radial gradient to create ambient lighting depth in the center */
            background-image: radial-gradient(circle at center, rgba(43, 102, 61, 0.04) 0%, rgba(250, 249, 246, 0) 70%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            min-height: 100dvh;
            font-family: var(--font-body);
            color: var(--ink);
            margin: 0;
            padding: 24px;
            box-sizing: border-box;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.5s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-card {
            background: var(--white);
            border: 1px solid #e2e8df;
            border-radius: 16px;
            padding: 44px 36px;
            box-shadow: 0 16px 40px -20px rgba(31, 91, 52, 0.08);
            box-sizing: border-box;
        }

        .brand-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 28px;
        }

        .brand-logo {
            height: 38px;
            width: auto;
        }

        .brand-divider {
            width: 1px;
            height: 24px;
            background-color: #e2e8df;
        }

        .brand-badge {
            font-family: var(--font-display);
            font-weight: 700;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: var(--green-bright);
        }

        .login-header {
            margin-bottom: 32px;
        }

        .login-header h2 {
            font-family: var(--font-display);
            font-weight: 700;
            color: var(--green-deep);
            font-size: 1.45rem;
            margin: 0 0 6px 0;
            letter-spacing: -0.01em;
            line-height: 1.25;
        }

        .login-header p {
            font-size: 0.88rem;
            color: var(--ink-soft);
            margin: 0;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-group label {
            display: block;
            font-family: var(--font-display);
            font-size: 0.88rem;
            color: var(--green-deep);
            font-weight: 600;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccd3c7;
            border-radius: 8px;
            background: var(--white);
            color: var(--ink);
            font-family: var(--font-body);
            font-size: 0.92rem;
            box-sizing: border-box;
            outline: none;
            transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .form-control:focus {
            border-color: var(--green-deep);
            box-shadow: 0 0 0 3px rgba(31, 91, 52, 0.08);
        }

        .form-control::placeholder {
            color: #b0b8ac;
            opacity: 1;
        }

        /* Minimal Alert Box */
        .alert-error {
            background: rgba(226, 84, 63, 0.05);
            border: 1px solid rgba(226, 84, 63, 0.2);
            border-radius: 8px;
            color: var(--apple-red);
            padding: 12px 14px;
            font-size: 0.85rem;
            margin-bottom: 28px;
            display: flex;
            align-items: flex-start;
            gap: 10px;
            line-height: 1.4;
        }

        .alert-error svg {
            width: 16px;
            height: 16px;
            flex-shrink: 0;
            margin-top: 2px;
        }

        /* Primary Button - Serious, Minimal, Non-AI-Slop */
        .btn-submit {
            width: 100%;
            padding: 13px 20px;
            border-radius: 8px;
            border: none;
            background-color: var(--green-deep);
            color: var(--white);
            font-family: var(--font-display);
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            outline: none;
            transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .btn-submit:hover {
            background-color: var(--green-bright);
            transform: translateY(-1px);
        }

        .btn-submit:active {
            transform: translateY(1px);
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-family: var(--font-display);
            font-weight: 600;
            font-size: 0.85rem;
            color: var(--ink-soft);
            margin-top: 24px;
            transition: color 0.2s ease;
        }

        .back-link:hover {
            color: var(--green-deep);
        }

        .back-link svg {
            width: 14px;
            height: 14px;
        }

        .login-footer {
            margin-top: 32px;
            font-size: 0.72rem;
            color: var(--ink-soft);
            opacity: 0.7;
            line-height: 1.4;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <div class="login-card">
            <!-- Brand Header -->
            <div class="brand-header">
                <a href="<?= base_url() ?>">
                    <img src="<?= base_url('assets/logo1.png') ?>" alt="Kusuma Group" class="brand-logo">
                </a>
                <div class="brand-divider"></div>
                <span class="brand-badge">Kusuma Admin</span>
            </div>

            <!-- Login Header -->
            <div class="login-header">
                <h2>Login Admin</h2>
                <p>Masukkan kredensial akun Anda untuk mengakses dashboard manajemen.</p>
            </div>

            <!-- Flash Message Error: ditampilkan lewat SweetAlert2 (lihat script di bawah) -->

            <!-- Form -->
            <form action="<?= base_url('login/proses') ?>" method="POST">
                <?= csrf_field() ?>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="admin" required autofocus autocomplete="username">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required autocomplete="current-password">
                </div>

                <button type="submit" class="btn-submit">
                    <span>Masuk ke Dashboard</span>
                    <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                    </svg>
                </button>
            </form>

            <!-- Back to Website Link -->
            <a href="<?= base_url() ?>" class="back-link">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="19" y1="12" x2="5" y2="12"></line>
                    <polyline points="12 19 5 12 12 5"></polyline>
                </svg>
                <span>Kembali ke Halaman Utama</span>
            </a>
        </div>

        <!-- Legal Footer -->
        <div class="login-footer">
            &copy; 2026 PT Kusuma Satria Dinasasri Wisatajaya. Hak Cipta Dilindungi Undang-Undang.
        </div>
    </div>

    <script>
        <?php if (session()->getFlashdata('error')): ?>
            Swal.fire({ icon: 'error', title: 'Gagal', text: <?= json_encode(session()->getFlashdata('error')) ?> });
        <?php endif; ?>
    </script>
</body>

</html>