/* ---------- PRELOADER: taruh paling atas + safety timeout ---------- */
(function () {
  const preloader = document.getElementById("preloader");
  const hidePreloader = () => {
    if (preloader) {
      preloader.style.opacity = "0";
      preloader.style.visibility = "hidden";
    }
  };
  window.addEventListener("load", hidePreloader);
  setTimeout(hidePreloader, 3000);
})();

(() => {
  const C = SITE_CONTENT;
  let lenisInstance;
  /* =====================================================================
     0. LENIS SMOOTH SCROLL (Awwwards-style momentum scroll)
     ===================================================================== */
  if (typeof Lenis !== "undefined") {
    lenisInstance = new Lenis({
      duration: 1.2,
      easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)), // Easing eksponensial halus
      smoothWheel: true,
      smoothTouch: false,
    });

    function raf(time) {
      lenisInstance.raf(time);
      requestAnimationFrame(raf);
    }
    requestAnimationFrame(raf);

    // Integrasi dengan klik navigasi internal (spy & scroll-to)
    document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
      anchor.addEventListener("click", function (e) {
        e.preventDefault();
        const targetId = this.getAttribute("href");
        if (targetId === "#") return;
        const targetEl = document.querySelector(targetId);
        if (targetEl) {
          lenisInstance.scrollTo(targetEl, {
            offset: -70, // Menghindari ketutup header navbar
            duration: 1.6,
            easing: (t) => 1 - Math.pow(1 - t, 4), // Easing easeOutQuart (cepat ke lambat secara dramatis)
          });
        }
      });
    });
  }

  /* ---------- Kumpulan ikon garis sederhana (SVG), tanpa perlu internet ---------- */
  const ICONS = {
    leaf: '<path d="M11 20A7 7 0 0 1 4 13a7 7 0 0 1 7-7c5 0 9 2 9 2s-1 12-9 12z"/><path d="M4 13c6 0 9-3 9-7"/>',
    bed: '<path d="M2 18v-6a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v6"/><path d="M2 18v3M22 18v3"/><path d="M2 12V8a2 2 0 0 1 2-2h6v6"/>',
    home: '<path d="M3 11l9-7 9 7"/><path d="M5 10v10h14V10"/>',
    factory: '<path d="M3 21V9l6 4V9l6 4V9l6 4v8H3z"/>',
    camera:
      '<circle cx="12" cy="13" r="4"/><path d="M4 8h3l2-3h6l2 3h3v11H4z"/>',
    waves:
      '<path d="M2 8s2-2 5-2 5 2 5 2 2 2 5 2 5-2 5-2"/><path d="M2 14s2-2 5-2 5 2 5 2 2 2 5 2 5-2 5-2"/><path d="M2 20s2-2 5-2 5 2 5 2 2 2 5 2 5-2 5-2"/>',
    apple:
      '<path d="M12 8c-3 0-6 2.5-6 7 0 3.5 2.5 6 4.5 6S12 20 12 20s1.5 1 3.5 1 4.5-2.5 4.5-6c0-4.5-3-7-6-7z"/><path d="M12 8V5"/><path d="M12 5c1-1.5 3-1.5 3-1.5"/>',
    drink:
      '<path d="M6 3h12l-2 8a4 4 0 0 1-8 0z"/><path d="M12 11v10"/><path d="M8 21h8"/>',
    villa:
      '<path d="M3 12l9-8 9 8"/><path d="M5 11v9h14v-9"/><path d="M9 20v-5h6v5"/>',
    party:
      '<path d="M4 15l7-12 3 5 3-3 3 10z"/><path d="M4 15h14"/><circle cx="7" cy="19" r="1"/><circle cx="12" cy="20" r="1"/><circle cx="17" cy="19" r="1"/>',
    pin: '<path d="M12 21s7-6.5 7-12a7 7 0 1 0-14 0c0 5.5 7 12 7 12z"/><circle cx="12" cy="9" r="2.5"/>',
    phone:
      '<path d="M22 16.9v3a2 2 0 0 1-2.2 2 19.8 19.8 0 0 1-8.6-3 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.1 4.2 2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.7c.1 1 .3 2 .6 2.9a2 2 0 0 1-.5 2.1L8 10a16 16 0 0 0 6 6l1.3-1.2a2 2 0 0 1 2.1-.5c.9.3 1.9.5 2.9.6a2 2 0 0 1 1.7 2.1z"/>',
    mail: '<path d="M4 4h16v16H4z"/><path d="M4 6l8 7 8-7"/>',
    arrow: '<path d="M5 12h14"/><path d="M13 6l6 6-6 6"/>',
    chevLeft: '<path d="M15 6l-6 6 6 6"/>',
    chevRight: '<path d="M9 6l6 6-6 6"/>',
    close: '<path d="M6 6l12 12"/><path d="M18 6L6 18"/>',
    up: '<path d="M12 19V5"/><path d="M6 11l6-6 6 6"/>',
    founder:
      '<circle cx="12" cy="8" r="4"/><path d="M4 21c0-4 4-6 8-6s8 2 8 6"/>',
    history: '<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/>',
    future: '<path d="M5 3l1 4h12l1-4"/><path d="M6 7v10a6 6 0 0 0 12 0V7"/>',
    instagram:
      '<rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.5" cy="6.5" r="1"/>',
    facebook:
      '<path d="M14 9h3V6h-3a4 4 0 0 0-4 4v2H7v3h3v6h3v-6h3l1-3h-4v-2a1 1 0 0 1 1-1z"/>',
    youtube:
      '<rect x="2" y="6" width="20" height="12" rx="4"/><path d="M10 9l6 3-6 3z"/>',
    tiktok: '<path d="M15 3v11a3 3 0 1 1-3-3"/><path d="M15 3c0 3 2 5 5 5"/>',
  };
  const svg = (name, extra = "") =>
    `<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" ${extra}>${ICONS[name] || ""}</svg>`;

  const esc = (v) =>
    String(v ?? "").replace(
      /[&<>"']/g,
      (c) =>
        ({
          "&": "&amp;",
          "<": "&lt;",
          ">": "&gt;",
          '"': "&quot;",
          "'": "&#39;",
        })[c],
    );

  const setText = (id, value) => {
    const el = document.getElementById(id);
    if (el) el.textContent = value || "";
  };

  // Sembunyikan section yang datanya kosong sekalian link navbar/footer yang
  // menunjuk ke sana, supaya tidak ada anchor yang mati.
  const hideSection = (id) => {
    const section = document.getElementById(id);
    if (section) section.hidden = true;
    document
      .querySelectorAll(`a[href="#${id}"]`)
      .forEach((a) => (a.hidden = true));
  };

  /* =====================================================================
     1. BRAND / LOGO
     Logo navbar & footer sekarang dipasang langsung di landing_page.php
     sebagai <img>, tidak lagi dirakit di sini.
     ===================================================================== */

  /* =====================================================================
     2. NAVBAR: efek solid saat scroll + menu mobile
     ===================================================================== */
  const navbar = document.getElementById("navbar");
  const navLinks = document.getElementById("nav-links");
  const navToggle = document.getElementById("nav-toggle");
  const navOverlay = document.getElementById("nav-overlay");

  const setNavState = () =>
    navbar.classList.toggle("solid", window.scrollY > 40);
  setNavState();
  window.addEventListener("scroll", setNavState, { passive: true });

  const closeMenu = () => {
    navLinks.classList.remove("open");
    navToggle.classList.remove("open");
    navOverlay.classList.remove("open");
  };
  navToggle.addEventListener("click", () => {
    const willOpen = !navLinks.classList.contains("open");
    navLinks.classList.toggle("open", willOpen);
    navToggle.classList.toggle("open", willOpen);
    navOverlay.classList.toggle("open", willOpen);
  });
  navOverlay.addEventListener("click", closeMenu);
  navLinks
    .querySelectorAll("a")
    .forEach((a) => a.addEventListener("click", closeMenu));

  // highlight menu aktif sesuai posisi scroll
  const sections = document.querySelectorAll("main section[id]");
  const navA = document.querySelectorAll(".nav-links a");
  const spy = new IntersectionObserver(
    (entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          navA.forEach((a) =>
            a.classList.toggle(
              "active",
              a.getAttribute("href") === "#" + e.target.id,
            ),
          );
        }
      });
    },
    { rootMargin: "-45% 0px -50% 0px" },
  );
  sections.forEach((s) => spy.observe(s));

  const heroTrack = document.getElementById("hero-track");
  const heroDots = document.getElementById("hero-dots");
  let heroIndex = 0,
    heroTimer;

  heroTrack.innerHTML = C.heroSlides
    .map(
      (s, i) => `
    <div class="hero-slide ${i === 0 ? "active" : ""}" data-i="${i}">
      <div class="bg" style="background-image:url('${esc(s.image)}')"></div>
      <div class="hero-content">
        <span class="eyebrow">${esc(s.eyebrow)}</span>
        <h1>${esc(s.title)}</h1>
        <p>${esc(s.subtitle)}</p>
        <div class="hero-cta">
          <a href="${esc(s.ctaLink || "#companies")}" class="btn btn-primary">${esc(s.ctaText || "Selengkapnya")} ${svg("arrow", 'width="18" height="18"')}</a>
          <a href="#contact" class="btn btn-ghost">Contact Us</a>
        </div>
      </div>
    </div>`,
    )
    .join("");

  heroDots.innerHTML = C.heroSlides
    .map(
      (_, i) =>
        `<button aria-label="Slide ${i + 1}" class="${i === 0 ? "active" : ""}"></button>`,
    )
    .join("");

  const heroSlideEls = () => heroTrack.querySelectorAll(".hero-slide");
  const heroDotEls = () => heroDots.querySelectorAll("button");

  function goToHero(i) {
    const slides = heroSlideEls(),
      dots = heroDotEls();
    heroIndex = (i + slides.length) % slides.length;
    slides.forEach((el, idx) =>
      el.classList.toggle("active", idx === heroIndex),
    );
    dots.forEach((el, idx) => el.classList.toggle("active", idx === heroIndex));
  }
  function restartAutoplay() {
    clearInterval(heroTimer);
    heroTimer = setInterval(() => goToHero(heroIndex + 1), 5500);
  }

  document.getElementById("hero-prev").addEventListener("click", () => {
    goToHero(heroIndex - 1);
    restartAutoplay();
  });
  document.getElementById("hero-next").addEventListener("click", () => {
    goToHero(heroIndex + 1);
    restartAutoplay();
  });
  heroDots.addEventListener("click", (e) => {
    if (e.target.tagName === "BUTTON") {
      goToHero([...heroDotEls()].indexOf(e.target));
      restartAutoplay();
    }
  });

  // swipe geser di layar sentuh (HP/tablet)
  let touchX = null;
  heroTrack.addEventListener(
    "touchstart",
    (e) => (touchX = e.touches[0].clientX),
    { passive: true },
  );
  heroTrack.addEventListener(
    "touchend",
    (e) => {
      if (touchX === null) return;
      const dx = e.changedTouches[0].clientX - touchX;
      if (Math.abs(dx) > 40) {
        goToHero(heroIndex + (dx < 0 ? 1 : -1));
        restartAutoplay();
      }
      touchX = null;
    },
    { passive: true },
  );

  restartAutoplay();

  /* =====================================================================
     4. STATS (angka pencapaian, jalan naik saat pertama terlihat)
     ===================================================================== */
  const statsWrap = document.getElementById("stats");
  statsWrap.innerHTML = C.stats
    .map(
      (s) => `
    <div class="stat-item"><strong data-target="${esc(s.number)}">0</strong><span>${esc(s.label)}</span></div>`,
    )
    .join("");

  const animateStats = () => {
    statsWrap.querySelectorAll("strong").forEach((el) => {
      const raw = el.dataset.target;
      const num = parseInt(raw.replace(/\D/g, ""), 10) || 0;
      const suffix = raw.replace(/[0-9]/g, "");
      let cur = 0;
      const step = Math.max(1, Math.round(num / 40));
      const t = setInterval(() => {
        cur += step;
        if (cur >= num) {
          cur = num;
          clearInterval(t);
        }
        el.textContent = cur + suffix;
      }, 30);
    });
  };
  new IntersectionObserver(
    (entries, obs) => {
      if (entries[0].isIntersecting) {
        animateStats();
        obs.disconnect();
      }
    },
    { threshold: 0.5 },
  ).observe(statsWrap);

  /* =====================================================================
     5. OUR COMPANIES — kartu klik langsung buka website resmi
     ===================================================================== */
  const companyGrid = document.getElementById("company-grid");
  if (companyGrid && C.companies) {
    companyGrid.innerHTML = C.companies
      .map((co, coIdx) => {
        const photos = (co.photos && co.photos.length ? co.photos : []).filter(
          Boolean,
        );
        return `
        <a class="company-card reveal" href="${esc(co.link)}" target="_blank" rel="noopener" data-company="${coIdx}">
          <div class="company-photos">
            ${photos
              .map(
                (p, i) =>
                  `<div class="company-slide ${i === 0 ? "active" : ""}" data-i="${i}" style="background-image:url('${esc(p)}')"></div>`,
              )
              .join("")}
          </div>
          <div class="company-body">
            ${
              photos.length > 1
                ? `<div class="company-dots">
                    ${photos
                      .map(
                        (_, i) =>
                          `<button aria-label="Foto ${i + 1}" class="${i === 0 ? "active" : ""}"></button>`,
                      )
                      .join("")}
                  </div>`
                : ""
            }
            <h3>${esc(co.name)}</h3>
            <p>${esc(co.desc)}</p>
            <span class="company-link">Kunjungi Website ${svg("arrow", 'width="15" height="15"')}</span>
          </div>
        </a>`;
      })
      .join("");

    // Carousel otomatis per card + bisa digerakkan manual lewat titik
    companyGrid.querySelectorAll(".company-card").forEach((card) => {
      const slides = card.querySelectorAll(".company-slide");
      const dots = card.querySelectorAll(".company-dots button");
      if (slides.length <= 1) return;

      let idx = 0;
      let timer;

      function goTo(i) {
        idx = (i + slides.length) % slides.length;
        slides.forEach((s, si) => s.classList.toggle("active", si === idx));
        dots.forEach((d, di) => d.classList.toggle("active", di === idx));
      }
      function restart() {
        clearInterval(timer);
        timer = setInterval(() => goTo(idx + 1), 4000);
      }

      dots.forEach((dot, i) => {
        dot.addEventListener("click", (e) => {
          e.preventDefault(); // biar klik titik gak ikut buka link website
          e.stopPropagation();
          goTo(i);
          restart();
        });
      });

      restart();
    });
  }

  /* =====================================================================
     6b. SERVICES — layanan & fasilitas yang ditawarkan
     ===================================================================== */
  const serviceGrid = document.getElementById("service-grid");
  if (serviceGrid && C.services && C.services.items.length) {
    setText("services-subtitle", C.services.sectionSubtitle);
    serviceGrid.innerHTML = C.services.items
      .map(
        (s) => `
      <article class="service-card reveal">
        ${s.photos[0] ? `<div class="service-photo"><img src="${s.photos[0]}" alt="${esc(s.title)}" loading="lazy"></div>` : ""}
        <div class="service-body">
          <span class="service-icon">${svg(s.icon, 'width="20" height="20"')}</span>
          <h3>${esc(s.title)}</h3>
          <p>${esc(s.desc)}</p>
        </div>
      </article>`,
      )
      .join("");
  } else if (serviceGrid) {
    hideSection("services");
  }

  /* =====================================================================
     6c. OUR TEAM — jajaran manajemen
     ===================================================================== */
  const teamGrid = document.getElementById("team-grid");
  if (teamGrid && C.team && C.team.members.length) {
    setText("team-subtitle", C.team.sectionSubtitle);
    teamGrid.innerHTML = C.team.members
      .map(
        (m) => `
      <figure class="team-card reveal">
        <div class="team-photo">
          ${
            m.photo
              ? `<img src="${m.photo}" alt="${esc(m.name)}" loading="lazy">`
              : `<span class="team-initial">${esc((m.name || "?").trim().charAt(0).toUpperCase())}</span>`
          }
        </div>
        <figcaption>
          <h3>${esc(m.name)}</h3>
          <span>${esc(m.position)}</span>
        </figcaption>
      </figure>`,
      )
      .join("");
  } else if (teamGrid) {
    hideSection("team");
  }

  /* =====================================================================
     7. ABOUT US — Founder / Sejarah / Masa Depan
     ===================================================================== */
  setText("about-subtitle", C.about.sectionSubtitle);
  const aboutGrid = document.getElementById("about-grid");
  aboutGrid.innerHTML = C.about.items
    .map(
      (a, i) => `
    <div class="about-card reveal">
      <div class="about-photo${a.image ? "" : " is-empty"}">
        ${
          a.image
            ? `<img src="${a.image}" alt="${esc(a.name)}">`
            : svg(a.icon, 'width="46" height="46"')
        }
        <span class="about-num">0${i + 1}</span>
      </div>
      <span class="eyebrow">${svg(a.icon, 'width="14" height="14"')} ${esc(a.label)}</span>
      <h3>${esc(a.name)}</h3>
      <p>${esc(a.text)}</p>
    </div>`,
    )
    .join("");

  /* =====================================================================
     8. GALERI MOMEN — masonry + lightbox klik-perbesar
     ===================================================================== */
  document.getElementById("gallery-subtitle").textContent =
    C.gallery.sectionSubtitle;
  const galleryGrid = document.getElementById("gallery-grid");
  galleryGrid.innerHTML = C.gallery.photos
    .map(
      (p) => `
    <div class="gallery-item reveal">
      <img src="${esc(p.image)}" alt="${esc(p.caption)}" loading="lazy">
      <div class="gallery-cap">${esc(p.caption)}</div>
    </div>`,
    )
    .join("");

  const lightbox = document.getElementById("lightbox");
  const lightboxImg = document.getElementById("lightbox-img");
  galleryGrid.addEventListener("click", (e) => {
    const item = e.target.closest(".gallery-item");
    if (!item) return;
    lightboxImg.src = item.querySelector("img").src;
    lightbox.classList.add("open");
  });
  document
    .getElementById("lightbox-close")
    .addEventListener("click", () => lightbox.classList.remove("open"));
  lightbox.addEventListener("click", (e) => {
    if (e.target === lightbox) lightbox.classList.remove("open");
  });

  /* =====================================================================
     9. TESTIMONIALS
     ===================================================================== */
  const testiGrid = document.getElementById("testi-grid");
  testiGrid.innerHTML = C.testimonials
    .map(
      (t) => `
    <div class="testi-card reveal">
      <div class="testi-stars">${"★".repeat(t.rating)}${"☆".repeat(5 - t.rating)}</div>
      <p>&ldquo;${esc(t.text)}&rdquo;</p>
      <div class="testi-name">${esc(t.name)}</div>
    </div>`,
    )
    .join("");

  /* =====================================================================
     10. KONTAK + PETA + SOSIAL MEDIA
     ===================================================================== */
  document.getElementById("contact-info").innerHTML = `
    <a class="contact-row" href="${esc(C.contact.mapsLinkUrl)}" target="_blank" rel="noopener">
      ${svg("pin", 'width="22" height="22"')}
      <div><strong>Alamat</strong><span>${esc(C.contact.address)}</span></div>
    </a>
    <a class="contact-row" href="${esc(C.contact.phoneLink)}">
      ${svg("phone", 'width="22" height="22"')}
      <div><strong>Telepon</strong><span>${esc(C.contact.phone)}</span></div>
    </a>
    <a class="contact-row" href="mailto:${esc(C.contact.email)}">
      ${svg("mail", 'width="22" height="22"')}
      <div><strong>Email</strong><span>${esc(C.contact.email)}</span></div>
    </a>
    <div class="social-row">
      ${Object.entries(C.contact.socials)
        .filter(([, v]) => v)
        .map(
          ([k, v]) =>
            `<a href="${esc(v)}" target="_blank" rel="noopener" aria-label="${esc(k)}">${svg(k, 'width="19" height="19"')}</a>`,
        )
        .join("")}
    </div>`;
  document.getElementById("map-frame").src = C.contact.mapsEmbedUrl;

  /* =====================================================================
     11. FOOTER
     ===================================================================== */
  document.getElementById("footer-about").textContent = C.footer.about;
  document.getElementById("footer-year").textContent = new Date().getFullYear();
  document.getElementById("footer-copyright-name").textContent =
    C.footer.copyrightName;

  /* =====================================================================
     12. TOMBOL WHATSAPP MENGAMBANG
     ===================================================================== */
  const waLink = `https://wa.me/${C.contact.whatsappNumber}?text=${encodeURIComponent(C.contact.whatsappMessage)}`;
  document.getElementById("fab-whatsapp").href = waLink;

  /* =====================================================================
     13. TOMBOL KEMBALI KE ATAS
     ===================================================================== */
  const fabTop = document.getElementById("fab-top");
  window.addEventListener(
    "scroll",
    () => fabTop.classList.toggle("show", window.scrollY > 500),
    { passive: true },
  );
  fabTop.addEventListener("click", () => {
    if (lenisInstance) {
      lenisInstance.scrollTo(0);
    } else {
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
  });

  /* =====================================================================
     14. ANIMASI MUNCUL SAAT DI-SCROLL
     ===================================================================== */
  const revealObserver = new IntersectionObserver(
    (entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          e.target.classList.add("in");
          revealObserver.unobserve(e.target);
        }
      });
    },
    { threshold: 0.15 },
  );
  setTimeout(
    () =>
      document
        .querySelectorAll(".reveal")
        .forEach((el) => revealObserver.observe(el)),
    50,
  );
})();
