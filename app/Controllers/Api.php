<?php

namespace App\Controllers;

use App\Libraries\ImageUploadGuard;
use Config\AdminTables;

/**
 * API generik untuk CMS Kusuma ID.
 *
 * Semua tabel yang terdaftar di Config\AdminTables otomatis bisa diakses
 * lewat endpoint ini (kecuali tabel 'admins', yang sengaja diblokir demi
 * keamanan). Dibuat generik supaya kalau nanti nambah tabel baru di
 * AdminTables, endpoint API-nya langsung ikut tersedia tanpa nulis kode baru.
 *
 * Endpoint:
 *   GET    /api/meta                    -> daftar semua tabel + kolomnya
 *   GET    /api/content/{table}         -> semua baris tabel (urut sort_order)
 *   GET    /api/content/{table}/{id}    -> satu baris
 *   POST   /api/content/{table}         -> tambah baris baru
 *   PUT    /api/content/{table}/{id}    -> update baris
 *   DELETE /api/content/{table}/{id}    -> hapus baris
 *   POST   /api/upload                  -> upload gambar, balikin path relatif
 */
class Api extends BaseController
{
    protected $db;
    protected $tables;

    /** Tabel yang tidak boleh diakses lewat API publik ini. */
    private array $blocked = ['admins'];

    public function __construct()
    {
        $this->db     = \Config\Database::connect();
        $this->tables = AdminTables::all();

        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header('Access-Control-Allow-Headers: Content-Type, Authorization');

        if (strtoupper($_SERVER['REQUEST_METHOD'] ?? '') === 'OPTIONS') {
            http_response_code(200);
            exit();
        }
    }

    private function json($data, int $code = 200)
    {
        return $this->response->setStatusCode($code)->setJSON($data);
    }

    private function getJsonBody(): array
    {
        $raw  = $this->request->getBody();
        $data = json_decode((string) $raw, true);

        return is_array($data) ? $data : [];
    }

    private function isAllowedTable(string $table): bool
    {
        return array_key_exists($table, $this->tables) && ! in_array($table, $this->blocked, true);
    }

    // Dipanggil otomatis oleh router untuk request OPTIONS (CORS preflight).
    public function preflight()
    {
        return $this->response->setStatusCode(200);
    }

    // GET /api/meta
    public function meta()
    {
        $meta = $this->tables;
        foreach ($this->blocked as $b) {
            unset($meta[$b]);
        }

        return $this->json($meta);
    }

    // Router utama untuk /api/content/{table}[/{id}]
    public function content(string $table, ?int $id = null)
    {
        if (! $this->isAllowedTable($table)) {
            return $this->json(['error' => 'Tabel tidak dikenal atau tidak diizinkan.'], 404);
        }

        $conf   = $this->tables[$table];
        $method = strtoupper($this->request->getMethod());

        switch ($method) {
            case 'GET':
                return $this->show($table, $conf, $id);
            case 'POST':
                return $this->create($table, $conf);
            case 'PUT':
            case 'PATCH':
                return $this->updateRow($table, $conf, $id);
            case 'DELETE':
                return $this->deleteRow($table, $conf, $id);
            default:
                return $this->json(['error' => 'Method tidak didukung.'], 405);
        }
    }

    private function show(string $table, array $conf, ?int $id)
    {
        if (! empty($conf['single'])) {
            $row = $this->db->table($table)->get()->getRowArray();

            return $this->json($row ?: new \stdClass());
        }

        if ($id !== null) {
            $row = $this->db->table($table)->where($conf['pk'], $id)->get()->getRowArray();
            if (! $row) {
                return $this->json(['error' => 'Data tidak ditemukan.'], 404);
            }

            return $this->json($row);
        }

        $rows = $this->db->table($table)
            ->orderBy($conf['order_by'] ?? $conf['pk'])
            ->get()
            ->getResultArray();

        return $this->json($rows);
    }

    /** Ambil hanya kolom yang memang terdaftar di AdminTables (whitelist). */
    private function extractFields(array $conf, array $input): array
    {
        $data = [];

        foreach ($conf['columns'] as $col => $meta) {
            // Kolom password (tabel admins) tidak pernah lewat API generik ini.
            if ($col === 'password') {
                continue;
            }

            if (! array_key_exists($col, $input)) {
                continue;
            }

            $value = $input[$col];

            if ($meta['type'] === 'number') {
                $data[$col] = is_numeric($value) ? $value + 0 : 0;
            } else {
                $data[$col] = $value;
            }
        }

        return $data;
    }

    private function create(string $table, array $conf)
    {
        $input = $this->getJsonBody();
        $data  = $this->extractFields($conf, $input);

        // Tabel "single" (mis. site_settings): jangan pernah bikin baris kedua,
        // kalau sudah ada baris -> update baris itu saja.
        if (! empty($conf['single'])) {
            $existing = $this->db->table($table)->get()->getRowArray();
            if ($existing) {
                $this->db->table($table)->where($conf['pk'], $existing[$conf['pk']])->update($data);

                return $this->json(
                    $this->db->table($table)->where($conf['pk'], $existing[$conf['pk']])->get()->getRowArray()
                );
            }
        }

        $this->db->table($table)->insert($data);
        $newId = $this->db->insertID();

        return $this->json(
            $this->db->table($table)->where($conf['pk'], $newId)->get()->getRowArray(),
            201
        );
    }

    private function updateRow(string $table, array $conf, ?int $id)
    {
        $input = $this->getJsonBody();
        $data  = $this->extractFields($conf, $input);

        if (! empty($conf['single']) && $id === null) {
            $existing = $this->db->table($table)->get()->getRowArray();
            $id       = $existing[$conf['pk']] ?? null;

            if ($id === null) {
                // Belum ada baris sama sekali -> perlakukan sebagai create.
                $this->db->table($table)->insert($data);
                $id = $this->db->insertID();

                return $this->json($this->db->table($table)->where($conf['pk'], $id)->get()->getRowArray(), 201);
            }
        }

        if ($id === null) {
            return $this->json(['error' => 'ID wajib diisi.'], 400);
        }

        $this->db->table($table)->where($conf['pk'], $id)->update($data);

        return $this->json($this->db->table($table)->where($conf['pk'], $id)->get()->getRowArray());
    }

    private function deleteRow(string $table, array $conf, ?int $id)
    {
        if (! empty($conf['single'])) {
            return $this->json(['error' => 'Data pengaturan ini tidak bisa dihapus.'], 400);
        }

        if ($id === null) {
            return $this->json(['error' => 'ID wajib diisi.'], 400);
        }

        $this->db->table($table)->where($conf['pk'], $id)->delete();

        return $this->json(['success' => true]);
    }

    // POST /api/upload  (multipart/form-data; field: "image" atau "file"; opsional: "folder")
    public function upload()
    {
        $file = $this->request->getFile('image') ?: $this->request->getFile('file');

        if (! ImageUploadGuard::isAllowed($file)) {
            return $this->json(['success' => false, 'error' => 'File tidak valid. Hanya gambar (jpg, jpeg, png, webp, gif) yang diperbolehkan.'], 400);
        }

        $folder = (string) ($this->request->getPost('folder') ?: 'misc');
        $folder = preg_replace('/[^a-zA-Z0-9_-]/', '', $folder) ?: 'misc';

        $destination = FCPATH . 'Upload/' . $folder;
        if (! is_dir($destination)) {
            mkdir($destination, 0755, true);
        }

        $newName = $file->getRandomName();
        $file->move($destination, $newName);
        ImageUploadGuard::shrink($destination . '/' . $newName);

        $path = 'Upload/' . $folder . '/' . $newName;

        return $this->json([
            'success' => true,
            'path'    => $path,
            'url'     => base_url($path),
        ], 201);
    }
}
