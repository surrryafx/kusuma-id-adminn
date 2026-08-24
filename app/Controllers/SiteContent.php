<?php

namespace App\Controllers;

class SiteContent extends BaseController
{
    /**
     * Tambahkan base_url() di depan path gambar upload lokal.
     * Kalau gambarnya link eksternal (http/https), biarkan apa adanya.
     */
    private function img(?string $path): string
    {
        if (empty($path)) {
            return '';
        }
        return str_starts_with($path, 'http') ? $path : base_url($path);
    }

    public function index()
    {
        $db = \Config\Database::connect();

        $hero          = $db->table('hero_slides')->orderBy('sort_order')->get()->getResultArray();
        $companies     = $db->table('companies')->orderBy('sort_order')->get()->getResultArray();
        $services      = $db->table('services')->orderBy('sort_order')->get()->getResultArray();
        $team          = $db->table('team_members')->orderBy('sort_order')->get()->getResultArray();
        $aboutItems    = $db->table('about_items')->orderBy('sort_order')->get()->getResultArray();
        $galleryPhotos = $db->table('gallery_photos')->orderBy('sort_order')->get()->getResultArray();
        $stats         = $db->table('stats')->orderBy('sort_order')->get()->getResultArray();
        $testimonials  = $db->table('testimonials')->orderBy('sort_order')->get()->getResultArray();
        $settings      = $db->table('site_settings')->get()->getRowArray() ?: [];

        $data = [
            'brand' => [
                'logo' => $this->img($settings['logo'] ?? ''),
            ],

            'contact' => [
                'address'          => $settings['address'] ?? '',
                'phone'            => $settings['phone'] ?? '',
                'phoneLink'        => $settings['phone_link'] ?? '',
                'whatsappNumber'   => $settings['whatsapp_number'] ?? '',
                'whatsappMessage'  => $settings['whatsapp_message'] ?? '',
                'email'            => $settings['email'] ?? '',
                'mapsEmbedUrl'     => $settings['maps_embed_url'] ?? '',
                'mapsLinkUrl'      => $settings['maps_link_url'] ?? '',
                'socials'          => [
                    'instagram' => $settings['ig_url'] ?? '',
                    'facebook'  => $settings['fb_url'] ?? '',
                    'youtube'   => $settings['yt_url'] ?? '',
                    'tiktok'    => $settings['tiktok_url'] ?? '',
                ],
            ],

            'heroSlides' => array_map(fn($s) => [
                'image'    => $this->img($s['image']),
                'eyebrow'  => $s['eyebrow'],
                'title'    => $s['title'],
                'subtitle' => $s['subtitle'],
                'ctaText'  => $s['cta_text'],
                'ctaLink'  => $s['cta_link'],
            ], $hero),

            'stats' => array_map(fn($s) => [
                'number' => $s['number'],
                'label'  => $s['label'],
            ], $stats),

            'companies' => array_map(function ($c) {
                $photos = [];
                foreach (['image', 'image2', 'image3'] as $f) {
                    if (! empty($c[$f])) {
                        $photos[] = $this->img($c[$f]);
                    }
                }
                return [
                    'name'   => $c['name'],
                    'desc'   => $c['description'],
                    'link'   => $c['link'],
                    'photos' => $photos,
                ];
            }, $companies),

            'services' => [
                'sectionSubtitle' => $settings['services_subtitle'] ?? '',
                'items'           => array_map(function ($s) {
                    $photos = [];
                    foreach (['image1', 'image2', 'image3'] as $f) {
                        if (! empty($s[$f])) {
                            $photos[] = $this->img($s[$f]);
                        }
                    }
                    return [
                        'title'  => $s['title'],
                        'icon'   => $s['icon'],
                        'desc'   => $s['description'],
                        'photos' => $photos,
                    ];
                }, $services),
            ],

            'team' => [
                'sectionSubtitle' => $settings['team_subtitle'] ?? '',
                'members'         => array_map(fn($m) => [
                    'name'     => $m['name'],
                    'position' => $m['position'],
                    'photo'    => $this->img($m['photo']),
                ], $team),
            ],

            'about' => [
                'sectionTitle'    => 'Tentang Kami',
                'sectionSubtitle' => $settings['about_subtitle'] ?? '',
                'items'           => array_map(fn($a) => [
                    'label' => $a['label'],
                    'name'  => $a['name'],
                    'icon'  => $a['icon'],
                    'image' => $this->img($a['image']),
                    'text'  => $a['text'],
                ], $aboutItems),
            ],

            'gallery' => [
                'sectionTitle'    => 'Momen Seru di Kusuma',
                'sectionSubtitle' => $settings['gallery_subtitle'] ?? '',
                'photos'          => array_map(fn($g) => [
                    'image'   => $this->img($g['image']),
                    'caption' => $g['caption'],
                ], $galleryPhotos),
            ],

            'testimonials' => array_map(fn($t) => [
                'name'   => $t['name'],
                'text'   => $t['text'],
                'rating' => (int) $t['rating'],
            ], $testimonials),

            'footer' => [
                'about'         => $settings['footer_about'] ?? '',
                'copyrightName' => $settings['footer_copyright_name'] ?? '',
            ],
        ];

        $json = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        return $this->response
            ->setContentType('application/javascript')
            ->setHeader('Cache-Control', 'no-store, no-cache, must-revalidate')
            ->setBody('const SITE_CONTENT = ' . $json . ';');
    }

}
