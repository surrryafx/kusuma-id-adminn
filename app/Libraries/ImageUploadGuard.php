<?php

namespace App\Libraries;

use CodeIgniter\HTTP\Files\UploadedFile;

/**
 * Validasi file upload gambar: cek ekstensi DAN mime type asli (dari isi file,
 * bukan header yang dikirim client) sebelum file boleh dipindah ke folder publik.
 */
class ImageUploadGuard
{
    private const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

    private const ALLOWED_MIME_TYPES = [
        'image/jpeg',
        'image/png',
        'image/webp',
        'image/gif',
    ];

    /** Sisi terpanjang maksimum setelah upload; foto kamera mentah bisa 7000px+. */
    private const MAX_DIMENSION = 1920;

    private const JPEG_QUALITY = 82;

    public static function isAllowed(?UploadedFile $file): bool
    {
        if (! $file || ! $file->isValid() || $file->hasMoved()) {
            return false;
        }

        $extension = strtolower($file->getExtension());
        if (! in_array($extension, self::ALLOWED_EXTENSIONS, true)) {
            return false;
        }

        return in_array($file->getMimeType(), self::ALLOWED_MIME_TYPES, true);
    }

    /**
     * Perkecil gambar yang sudah dipindah ke folder publik kalau resolusinya
     * berlebihan. Tanpa ini, foto kamera 6MB+ langsung jadi aset halaman depan.
     * GIF dilewati supaya animasinya tidak rusak.
     */
    public static function shrink(string $absolutePath): void
    {
        if (strtolower(pathinfo($absolutePath, PATHINFO_EXTENSION)) === 'gif') {
            return;
        }

        $size = @getimagesize($absolutePath);
        if ($size === false) {
            return;
        }

        [$width, $height] = $size;

        if ($width <= self::MAX_DIMENSION && $height <= self::MAX_DIMENSION) {
            return;
        }

        \Config\Services::image()
            ->withFile($absolutePath)
            ->resize(self::MAX_DIMENSION, self::MAX_DIMENSION, true)
            ->save($absolutePath, self::JPEG_QUALITY);
    }
}
