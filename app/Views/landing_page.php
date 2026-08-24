<!doctype html>
<html lang="id">

<?php
    $orgName   = $setting['footer_copyright_name'] ?? 'PT Kusuma Satria Dinasasri Wisatajaya';
    $pageTitle = 'Kusuma Group | Agrowisata, Hotel & Resort, Estate, Agro Industri';
    $pageDesc  = 'Kusuma Group (' . $orgName . '): grup usaha yang menaungi Kusuma Agrowisata, Kusuma Hotel & Resort, Kusuma Estate, dan Kusuma Agro Industri di Kota Batu sejak 1989.';
    $ogImage   = base_url('assets/logo1.png');
    $canonical = base_url();

    // Cache asset dipasang panjang (30 hari) di .htaccess, jadi URL-nya perlu ikut
    // berubah tiap file diedit — kalau tidak, pengunjung lama tetap dapat versi basi.
    $assetVersion = static function (string $relative): string {
        $absolute = FCPATH . $relative;
        return base_url($relative) . (is_file($absolute) ? '?v=' . filemtime($absolute) : '');
    };

    $socials = array_filter([
        $setting['ig_url'] ?? null,
        $setting['fb_url'] ?? null,
        $setting['yt_url'] ?? null,
        $setting['tiktok_url'] ?? null,
    ]);

    $jsonLd = [
        '@context'     => 'https://schema.org',
        '@type'        => 'Organization',
        'name'         => $orgName,
        'url'          => base_url(),
        'logo'         => $ogImage,
        'description'  => $pageDesc,
        'foundingDate' => '1989',
    ];
    if (! empty($setting['address'])) {
        $jsonLd['address'] = ['@type' => 'PostalAddress', 'streetAddress' => $setting['address']];
    }
    if (! empty($setting['phone'])) {
        $jsonLd['telephone'] = $setting['phone'];
    }
    if (! empty($socials)) {
        $jsonLd['sameAs'] = array_values($socials);
    }
    ?>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?= esc($pageTitle) ?></title>
    <meta name="description" content="<?= esc($pageDesc) ?>" />
    <link rel="canonical" href="<?= esc($canonical, 'attr') ?>" />

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="<?= base_url('assets/favicon.svg') ?>" />
    <link rel="alternate icon" href="<?= base_url('favicon.ico') ?>" />

    <!-- Open Graph / preview waktu link dibagikan ke WhatsApp, LinkedIn, dll -->
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="Kusuma Group" />
    <meta property="og:title" content="<?= esc($pageTitle) ?>" />
    <meta property="og:description" content="<?= esc($pageDesc) ?>" />
    <meta property="og:image" content="<?= esc($ogImage, 'attr') ?>" />
    <meta property="og:url" content="<?= esc($canonical, 'attr') ?>" />
    <meta property="og:locale" content="id_ID" />

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="<?= esc($pageTitle) ?>" />
    <meta name="twitter:description" content="<?= esc($pageDesc) ?>" />
    <meta name="twitter:image" content="<?= esc($ogImage, 'attr') ?>" />

    <!-- JSON-LD: Organization schema untuk SEO -->
    <script type="application/ld+json"><?= json_encode($jsonLd, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE) ?></script>

    <!-- Font: Plus Jakarta Sans (judul, premium & profesional) + Nunito Sans (teks, mudah dibaca) -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;600;700;800&family=Nunito+Sans:ital,wght@0,400;0,600;0,700;0,800;1,400&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="<?= esc($assetVersion('css/style.css'), 'attr') ?>" />
</head>

<body>
    <!-- PRELOADER COMPONENT -->
    <div id="preloader">
        <img src="<?= base_url('assets/logo1.png') ?>" alt="Kusuma Agrowisata Logo" class="preloader-brand">
        <div class="preloader-spinner"></div>
    </div>

    <!--NAVBAR -->
    <header id="navbar">
        <a href="#hero" class="brand">
            <img src="<?= base_url('assets/logo1.png') ?>" alt="Logo" height="60" />
        </a>

        <nav id="nav-links" class="nav-links">
            <a href="#hero">Home</a>
            <a href="#companies">Company</a>
            <a href="#services">Services</a>
            <a href="#about">About Us</a>
            <a href="#gallery">Gallery</a>
            <a href="#contact">Contact</a>
        </nav>

        <div class="nav-cta">
            <a
                href="#contact"
                class="btn btn-primary"
                style="padding: 11px 20px; font-size: 0.9rem">
                <span class="btn-primary-label">Contact Us</span>
            </a>
            <button id="nav-toggle" class="nav-toggle" aria-label="Buka menu">
                <span></span><span></span><span></span>
            </button>
        </div>
    </header>
    <div id="nav-overlay" class="nav-overlay"></div>

    <main>
        <!--HERO SLIDER-->
        <section id="hero">
            <div id="hero-track"></div>

            <button
                id="hero-prev"
                class="hero-nav prev"
                aria-label="Slide sebelumnya">
                <svg
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round">
                    <path d="M15 6l-6 6 6 6" />
                </svg>
            </button>
            <button
                id="hero-next"
                class="hero-nav next"
                aria-label="Slide berikutnya">
                <svg
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round">
                    <path d="M9 6l6 6-6 6" />
                </svg>
            </button>
            <div id="hero-dots" class="hero-dots"></div>

            <div class="hero-wave">
                <svg viewBox="0 0 1440 90" preserveAspectRatio="none">
                    <path
                        fill="var(--cream)"
                        d="M0,64 C240,10 480,10 720,40 C960,70 1200,90 1440,50 L1440,90 L0,90 Z" />
                </svg>
            </div>
        </section>

        <div id="stats" class="reveal in"></div>

        <!--OUR COMPANIES -->
        <section id="companies" class="section-pad">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">Our Business Group</span>
                    <h2>Our Companies</h2>
                    <p>
                        Empat unit usaha yang tumbuh dari satu kebun apel kecil di Kota
                        Batu. Klik salah satu untuk kunjungi situs resminya.
                    </p>
                </div>
                <div id="company-grid" class="company-grid"></div>
            </div>
        </section>

        <!--SERVICES-->
        <section id="services" class="section-pad">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">What We Offer</span>
                    <h2>Layanan Kami</h2>
                    <p id="services-subtitle"></p>
                </div>
                <div id="service-grid" class="service-grid"></div>
            </div>
        </section>

        <!--GALLERY-->
        <section id="gallery" class="section-pad">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">Photo Gallery</span>
                    <h2>Momen Keseruan di Kusuma</h2>
                    <p id="gallery-subtitle"></p>
                </div>
                <div id="gallery-grid" class="gallery-grid"></div>
            </div>
        </section>

        <!--ABOUT US-->
        <section id="about" class="section-pad about-path">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">Get to Know Us</span>
                    <h2>About Us</h2>
                    <p id="about-subtitle"></p>
                </div>
                <div class="about-vine">
                    <svg viewBox="0 0 1200 60" preserveAspectRatio="none">
                        <path
                            d="M0,30 C300,-10 300,70 600,30 C900,-10 900,70 1200,30"
                            stroke="var(--green-mint)"
                            stroke-width="3"
                            fill="none"
                            stroke-dasharray="2 14"
                            stroke-linecap="round" />
                    </svg>
                </div>
                <div id="about-grid" class="about-grid"></div>
            </div>
        </section>

        <!--OUR TEAM-->
        <section id="team" class="section-pad">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">Our People</span>
                    <h2>Manajemen Kami</h2>
                    <p id="team-subtitle"></p>
                </div>
                <div id="team-grid" class="team-grid"></div>
            </div>
        </section>

        <div id="lightbox" class="lightbox">
            <button id="lightbox-close" class="lightbox-close" aria-label="Tutup">
                <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                    <path d="M6 6l12 12" />
                    <path d="M18 6L6 18" />
                </svg>
            </button>
            <img id="lightbox-img" src="" alt="" />
        </div>

        <!--TESTIMONIALS -->
        <section id="testimonials" class="section-pad">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">What They Say</span>
                    <h2>Stories from Visitors</h2>
                </div>
                <div id="testi-grid" class="testi-grid"></div>
            </div>
        </section>

        <!-- CONTACT + MAP -->
        <section id="contact" class="section-pad">
            <div class="container">
                <div class="section-head reveal">
                    <span class="eyebrow">Come Visit</span>
                    <h2>Get In Touch</h2>
                    <p>
                        Rencanakan kunjungan Anda atau hubungi kami langsung lewat
                        WhatsApp.
                    </p>
                </div>
                <div class="contact-grid">
                    <div id="contact-info" class="contact-info reveal"></div>
                    <div class="map-wrap reveal">
                        <iframe
                            id="map-frame"
                            src=""
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"
                            title="Lokasi Kusuma Agrowisata"></iframe>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- FOOTER -->
    <footer>
        <div class="container footer-top">
            <div class="footer-brand">
                <div class="brand">
                    <img src="<?= base_url('assets/logo1.png') ?>" alt="Logo" height="60" />
                </div>
                <!-- <div class="brand" data-brand-slot></div> -->
                <p id="footer-about"></p>
            </div>
            <div class="footer-links">
                <h4>Jelajahi</h4>
                <a href="#companies">Our Company</a>
                <a href="#services">Services</a>
                <a href="#about">About Us</a>
                <a href="#team">Our Team</a>
                <a href="#gallery">Media &amp; Gallery</a>
                <a href="#contact">Contact</a>
            </div>
            <div class="footer-links">
                <h4>Perusahaan</h4>
                <a href="https://agrowisata.id/" target="_blank" rel="noopener">Kusuma Agrowisata</a>
                <a href="https://www.kusuma-hotel.com/" target="_blank" rel="noopener">Kusuma Hotel &amp; Resort</a>
                <a href="https://estate.kusuma.id/" target="_blank" rel="noopener">Kusuma Estate</a>
                <a href="https://industri.kusuma.id/" target="_blank" rel="noopener">Kusuma Agro Industri</a>
            </div>
        </div>
        <div class="container footer-bottom">
            <span>© <span id="footer-year"></span>
                <span id="footer-copyright-name"></span>. All rights reserved.</span>
            <!-- <span>Made with Kusuma Agro in Batu City</span> -->
        </div>
    </footer>

    <!--TOMBOL MENGAMBANG-->
    <div class="float-btns">
        <button id="fab-top" class="fab fab-top" aria-label="Kembali ke atas">
            <svg
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round">
                <path d="M12 19V5" />
                <path d="M6 11l6-6 6 6" />
            </svg>
        </button>
        <a
            id="fab-whatsapp"
            class="fab fab-whatsapp"
            href="#"
            target="_blank"
            rel="noopener"
            aria-label="Chat WhatsApp">
            <svg viewBox="0 0 32 32">
                <path
                    d="M16.001 3C9.373 3 4 8.373 4 15c0 2.646.86 5.09 2.316 7.07L4.6 28.4l6.5-1.703A11.94 11.94 0 0 0 16 27c6.627 0 12-5.373 12-12S22.628 3 16.001 3zm.001 21.6c-1.902 0-3.68-.51-5.214-1.4l-.373-.216-3.86 1.01 1.03-3.762-.243-.386A9.55 9.55 0 0 1 6.4 15c0-5.303 4.298-9.6 9.6-9.6s9.6 4.297 9.6 9.6-4.297 9.6-9.598 9.6zm5.27-7.19c-.288-.144-1.706-.842-1.97-.938-.264-.096-.456-.144-.648.144-.192.288-.744.938-.912 1.13-.168.192-.336.216-.624.072-.288-.144-1.216-.448-2.317-1.43-.856-.763-1.434-1.706-1.602-1.994-.168-.288-.018-.444.126-.588.13-.129.288-.336.432-.504.144-.168.192-.288.288-.48.096-.192.048-.36-.024-.504-.072-.144-.648-1.56-.888-2.137-.234-.562-.472-.486-.648-.495-.168-.008-.36-.01-.552-.01-.192 0-.504.072-.768.36-.264.288-1.008.984-1.008 2.4s1.032 2.784 1.176 2.976c.144.192 2.03 3.1 4.92 4.347.688.297 1.224.474 1.643.606.69.22 1.318.19 1.814.115.553-.083 1.706-.697 1.947-1.371.24-.673.24-1.25.168-1.371-.072-.12-.264-.192-.552-.336z" />
            </svg>
        </a>
    </div>

    <script src="<?= base_url('js/content.php') ?>"></script>
    <script src="https://unpkg.com/@studio-freight/lenis@1.0.42/dist/lenis.min.js"></script>
    <script src="<?= esc($assetVersion('js/main.js'), 'attr') ?>"></script>
</body>

</html>