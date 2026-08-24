<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Tidak Ditemukan | Kusuma Group</title>
    <meta name="robots" content="noindex">

    <link rel="icon" type="image/svg+xml" href="<?= base_url('assets/favicon.svg') ?>">

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;600;700;800&family=Nunito+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="<?= base_url('css/style.css') ?>">

    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            min-height: 100dvh;
            padding: 24px;
            text-align: center;
        }

        .err-wrap {
            max-width: 520px;
        }

        .err-code {
            font-family: var(--font-display);
            font-size: clamp(4.5rem, 18vw, 8rem);
            font-weight: 800;
            line-height: 1;
            color: var(--green-deep);
            letter-spacing: -0.04em;
        }

        .err-wrap h1 {
            font-size: clamp(1.4rem, 4vw, 1.9rem);
            margin: 12px 0 14px;
        }

        .err-wrap p {
            color: var(--ink-soft);
            line-height: 1.65;
            margin: 0 0 32px;
        }

        .err-actions {
            display: flex;
            gap: 12px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .err-logo {
            height: 46px;
            width: auto;
            margin: 0 auto 36px;
        }

        .err-detail {
            margin-top: 34px;
            text-align: left;
            background: var(--green-soft);
            border: 1px solid var(--green-mint);
            border-radius: var(--radius-md);
            padding: 14px 16px;
            font-size: 0.82rem;
            color: var(--ink-soft);
            word-break: break-word;
        }
    </style>
</head>

<body>
    <div class="err-wrap">
        <a href="<?= base_url() ?>">
            <img src="<?= base_url('assets/logo1.png') ?>" alt="Kusuma Group" class="err-logo">
        </a>

        <div class="err-code">404</div>
        <h1>Halaman Tidak Ditemukan</h1>
        <p>
            Maaf, halaman yang Anda cari tidak tersedia atau sudah dipindahkan.
            Silakan kembali ke beranda untuk menelusuri unit usaha kami.
        </p>

        <div class="err-actions">
            <a href="<?= base_url() ?>" class="btn btn-primary">Kembali ke Beranda</a>
            <a href="<?= base_url() ?>#contact" class="btn btn-outline">Hubungi Kami</a>
        </div>

        <?php if (ENVIRONMENT !== 'production' && ! empty($message)) : ?>
            <div class="err-detail"><?= nl2br(esc($message)) ?></div>
        <?php endif; ?>
    </div>
</body>

</html>
