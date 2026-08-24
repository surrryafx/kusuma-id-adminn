<?php

namespace App\Commands;

use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;

/**
 * Buat akun admin baru atau ganti password akun yang sudah ada.
 *
 * Dibuat karena akun `admin` bawaan dari pengembang sebelumnya password
 * plaintext-nya tidak diketahui siapapun, sementara akun test `reviewer`
 * harus dihapus sebelum situs live. Tanpa perintah ini, tidak ada cara
 * aman membuat kredensial admin asli di server production.
 *
 *   php spark admin:password
 *   php spark admin:password <username>
 */
class AdminPassword extends BaseCommand
{
    protected $group       = 'Admin';
    protected $name        = 'admin:password';
    protected $description = 'Buat akun admin baru atau ganti password akun yang sudah ada.';
    protected $usage       = 'admin:password [username]';
    protected $arguments   = [
        'username' => 'Username yang mau dibuat/diubah. Kalau kosong, akan ditanyakan.',
    ];

    private const MIN_LENGTH = 10;

    public function run(array $params)
    {
        $db    = \Config\Database::connect();
        $table = $db->table('admins');

        CLI::write('Kelola Akun Admin — Kusuma', 'green');
        CLI::newLine();

        $existing = $db->table('admins')->select('id, username, nama_lengkap')->get()->getResultArray();
        if ($existing !== []) {
            CLI::write('Akun yang ada saat ini:', 'yellow');
            CLI::table(
                array_map(static fn ($r) => [$r['id'], $r['username'], $r['nama_lengkap'] ?? '-'], $existing),
                ['ID', 'Username', 'Nama Lengkap']
            );
            CLI::newLine();
        }

        $username = $params[0] ?? CLI::prompt('Username', null, 'required');
        $username = trim($username);

        $admin = $db->table('admins')->where('username', $username)->get()->getRowArray();

        if ($admin !== null) {
            CLI::write("Akun '{$username}' sudah ada (ID {$admin['id']}). Password akan DIGANTI.", 'yellow');
            if (strtolower(CLI::prompt('Lanjutkan?', ['y', 'n'])) !== 'y') {
                CLI::write('Dibatalkan.', 'red');
                return;
            }
        } else {
            CLI::write("Akun '{$username}' belum ada. Akan DIBUAT BARU.", 'yellow');
        }

        CLI::newLine();
        CLI::write('Catatan: password akan terlihat di layar saat diketik.', 'dark_gray');
        CLI::write('Pastikan tidak ada yang mengintip, dan bersihkan layar setelah selesai.', 'dark_gray');
        CLI::newLine();

        $password = CLI::prompt('Password baru', null, 'required');

        if (strlen($password) < self::MIN_LENGTH) {
            CLI::error('Password minimal ' . self::MIN_LENGTH . ' karakter. Dibatalkan.');
            return;
        }

        if (CLI::prompt('Ketik ulang password') !== $password) {
            CLI::error('Password tidak cocok. Dibatalkan.');
            return;
        }

        $hash = password_hash($password, PASSWORD_DEFAULT);

        if ($admin !== null) {
            $table->where('id', $admin['id'])->update(['password' => $hash]);
            CLI::newLine();
            CLI::write("Password akun '{$username}' berhasil diganti.", 'green');
        } else {
            $namaLengkap = CLI::prompt('Nama lengkap (boleh dikosongkan)', '');

            $table->insert([
                'username'     => $username,
                'password'     => $hash,
                'nama_lengkap' => $namaLengkap !== '' ? $namaLengkap : null,
            ]);
            CLI::newLine();
            CLI::write("Akun '{$username}' berhasil dibuat.", 'green');
        }

        CLI::newLine();
        CLI::write('Akun ini dipakai bersama oleh kusuma-id-admin, kusuma-industri,', 'dark_gray');
        CLI::write('dan kusuma-agro-backend — ketiganya membaca tabel admins yang sama.', 'dark_gray');
        CLI::newLine();
        CLI::write('Jangan lupa hapus akun test sebelum live:', 'yellow');
        CLI::write("  php spark admin:remove reviewer", 'yellow');
    }
}
