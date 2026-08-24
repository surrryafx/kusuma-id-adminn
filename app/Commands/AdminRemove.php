<?php

namespace App\Commands;

use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;

/**
 * Hapus akun admin, dengan pengaman supaya tidak sampai mengunci diri sendiri.
 *
 *   php spark admin:remove reviewer
 */
class AdminRemove extends BaseCommand
{
    protected $group       = 'Admin';
    protected $name        = 'admin:remove';
    protected $description = 'Hapus akun admin (menolak kalau itu akun terakhir).';
    protected $usage       = 'admin:remove <username>';
    protected $arguments   = [
        'username' => 'Username yang mau dihapus.',
    ];

    public function run(array $params)
    {
        $db = \Config\Database::connect();

        $username = $params[0] ?? CLI::prompt('Username yang mau dihapus', null, 'required');
        $username = trim($username);

        $admin = $db->table('admins')->where('username', $username)->get()->getRowArray();

        if ($admin === null) {
            CLI::error("Akun '{$username}' tidak ditemukan.");
            return;
        }

        $total = $db->table('admins')->countAllResults();

        if ($total <= 1) {
            CLI::error('Ini satu-satunya akun admin yang tersisa — tidak boleh dihapus.');
            CLI::write('Buat akun pengganti dulu: php spark admin:password', 'yellow');
            return;
        }

        CLI::write("Akan menghapus akun '{$username}' (ID {$admin['id']}).", 'yellow');
        CLI::write("Sisa akun setelah dihapus: " . ($total - 1), 'dark_gray');

        if (strtolower(CLI::prompt('Yakin?', ['y', 'n'])) !== 'y') {
            CLI::write('Dibatalkan.', 'red');
            return;
        }

        $db->table('admins')->where('id', $admin['id'])->delete();

        CLI::newLine();
        CLI::write("Akun '{$username}' dihapus.", 'green');
        CLI::write('Ingat: tabel admins dipakai bersama tiga sistem, jadi akun ini', 'dark_gray');
        CLI::write('otomatis hilang juga dari kusuma-industri dan kusuma-agro-backend.', 'dark_gray');
    }
}
