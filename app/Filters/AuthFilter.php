<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class AuthFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        // Biarkan CORS preflight lewat tanpa cek sesi.
        if (strtoupper($request->getMethod()) === 'OPTIONS') {
            return;
        }

        if (session()->get('logged_in')) {
            return;
        }

        // Selain sesi login browser, terima juga Bearer token dari tabel
        // `api_tokens` (database yang sama dipakai kusuma-agro-backend) --
        // supaya dashboard eksternal (kusuma-agro-frontend) yang sudah login
        // di sana bisa ikut memanggil API kusuma-id-admin dengan token yang sama.
        if ($this->isValidBearerToken($request)) {
            return;
        }

        // Endpoint API: balas JSON 401, jangan redirect (bukan browser navigation).
        // Path bisa muncul dengan atau tanpa prefix "index.php/" tergantung URL rewrite.
        $path = preg_replace('#^index\.php/#', '', trim($request->getUri()->getPath(), '/'));
        if (str_starts_with($path, 'api/')) {
            return service('response')
                ->setStatusCode(401)
                ->setJSON(['error' => 'Unauthorized. Silakan login terlebih dahulu.']);
        }

        // Kalau belum login, tendang ke halaman login
        return redirect()->to('/login')->with('error', 'Silakan login dulu.');
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Gak perlu ngapa-ngapain di sini
    }

    private function isValidBearerToken(RequestInterface $request): bool
    {
        // PHP dijalankan via CGI (Action handler) di environment ini, jadi Apache
        // meneruskan header ini sebagai REDIRECT_HTTP_AUTHORIZATION, bukan
        // HTTP_AUTHORIZATION -- baca $_SERVER langsung dengan fallback ke itu,
        // karena $request->getHeaderLine() cuma baca HTTP_AUTHORIZATION.
        $header = $request->getHeaderLine('Authorization')
            ?: ($_SERVER['HTTP_AUTHORIZATION'] ?? $_SERVER['REDIRECT_HTTP_AUTHORIZATION'] ?? '');

        if (! $header || stripos($header, 'Bearer ') !== 0) {
            return false;
        }
        $token = trim(substr($header, 7));

        $row = \Config\Database::connect()
            ->table('api_tokens')
            ->where('token', $token)
            ->where('expires_at >', date('Y-m-d H:i:s'))
            ->get()
            ->getRow();

        return (bool) $row;
    }
}
