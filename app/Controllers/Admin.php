<?php

namespace App\Controllers;

use App\Libraries\ImageUploadGuard;
use Config\AdminTables;

class Admin extends BaseController
{
    protected $db;
    protected $tables;

    public function __construct()
    {
        $this->db     = \Config\Database::connect();
        $this->tables = AdminTables::all();
    }

    private function resolveTable(?string $table): string
    {
        if ($table && array_key_exists($table, $this->tables)) {
            return $table;
        }
        return array_key_first($this->tables);
    }

    public function index(?string $table = null)
    {
        $table = $this->resolveTable($table);
        $conf  = $this->tables[$table];

        $rows = $this->db->table($table)
            ->orderBy($conf['order_by'] ?? $conf['pk'])
            ->get()
            ->getResultArray();

        if (! empty($conf['single']) && count($rows) === 0) {
            return redirect()->to(base_url("admin/{$table}/tambah"));
        }

        return view('admin/dashboard', [
            'tables'      => $this->tables,
            'activeTable' => $table,
            'conf'        => $conf,
            'rows'        => $rows,
            'username'    => session()->get('username'),
        ]);
    }

    public function save(string $table)
    {
        $table = $this->resolveTable($table);
        $conf  = $this->tables[$table];
        $id    = $this->request->getPost('id');

        $data = [];

        foreach ($conf['columns'] as $col => $meta) {
            if ($meta['type'] === 'image') {
                $file = $this->request->getFile($col);

                if ($file && $file->isValid() && ! $file->hasMoved()) {
                    if (! ImageUploadGuard::isAllowed($file)) {
                        session()->setFlashdata('error', 'File gambar tidak valid. Hanya jpg, jpeg, png, webp, gif yang diperbolehkan.');
                        return redirect()->back()->withInput();
                    }

                    $folder = $meta['folder'] ?? $table;
                    $destination = FCPATH . 'Upload/' . $folder;

                    if (! is_dir($destination)) {
                        mkdir($destination, 0755, true);
                    }

                    $newName = $file->getRandomName();
                    $file->move($destination, $newName);
                    ImageUploadGuard::shrink($destination . '/' . $newName);

                    $data[$col] = 'Upload/' . $folder . '/' . $newName;
                }
                continue;
            }

            if ($col === 'password') {
                $val = $this->request->getPost('password');
                if ($val === null || $val === '') {
                    continue;
                }
                $data['password'] = password_hash($val, PASSWORD_BCRYPT);
                continue;
            }

            $data[$col] = $this->request->getPost($col);
        }

        if ($id) {
            $this->db->table($table)->where($conf['pk'], $id)->update($data);
            session()->setFlashdata('success', 'Data berhasil diperbarui.');
        } else {
            if ($table === 'admins' && empty($data['password'])) {
                session()->setFlashdata('error', 'Password wajib diisi untuk admin baru.');
                return redirect()->back();
            }
            $this->db->table($table)->insert($data);
            session()->setFlashdata('success', 'Data berhasil ditambahkan.');
        }

        return redirect()->to(base_url("admin/{$table}"));
    }

    public function delete(string $table, int $id)
    {
        $table = $this->resolveTable($table);
        $conf  = $this->tables[$table];

        if (empty($conf['single'])) {
            $this->db->table($table)->where($conf['pk'], $id)->delete();
            session()->setFlashdata('success', 'Data berhasil dihapus.');
        }

        return redirect()->to(base_url("admin/{$table}"));
    }
}
