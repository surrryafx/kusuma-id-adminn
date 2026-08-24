<?php

namespace App\Controllers;

class Auth extends BaseController
{
    public function login()
    {
        // Jika sudah login, langsung lempar ke dashboard admin
        if (session()->get('logged_in')) {
            return redirect()->to('/admin');
        }
        return view('admin/login');
    }

    public function authProcess()
    {
        $throttler = service('throttler');
        // Maksimal 5 percobaan login per menit per alamat IP.
        if ($throttler->check('login-' . $this->request->getIPAddress(), 5, MINUTE) === false) {
            return redirect()->back()->with('error', 'Terlalu banyak percobaan login. Coba lagi sebentar lagi.');
        }

        $db = \Config\Database::connect();
        $username = $this->request->getPost('username');
        $password = $this->request->getPost('password');

        $admin = $db->table('admins')->where('username', $username)->get()->getRowArray();

        if ($admin) {
            // Cek kecocokan password_hash
            if (password_verify($password, $admin['password'])) {
                session()->set([
                    'id'        => $admin['id'],
                    'username'  => $admin['username'],
                    'logged_in' => true
                ]);
                return redirect()->to('/admin');
            }
        }

        return redirect()->back()->with('error', 'Username atau Password salah!');
    }

    public function logout()
    {
        session()->destroy();
        return redirect()->to('/login');
    }
}
