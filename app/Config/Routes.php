<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->get('/', 'Home::index');
$routes->get('js/content.php', 'SiteContent::index');

$routes->get('/login', 'Auth::login');
$routes->post('/login/proses', 'Auth::authProcess');
$routes->get('/logout', 'Auth::logout');


$routes->group('admin', ['filter' => 'auth'], function ($routes) {
    $routes->get('/', 'admin::index');
    $routes->get('(:segment)', 'Admin::index/$1');
    $routes->post('(:segment)/simpan', 'Admin::save/$1');
    $routes->get('(:segment)/hapus/(:num)', 'Admin::delete/$1/$2');
});

// ============================================================
// API ROUTES - Kusuma ID CMS (dipakai oleh dashboard KUSUMA CMS)
// ============================================================
$routes->group('api', ['filter' => 'auth'], function ($routes) {
    $routes->get('meta', 'Api::meta');

    $routes->get('content/(:segment)', 'Api::content/$1');
    $routes->get('content/(:segment)/(:num)', 'Api::content/$1/$2');
    $routes->post('content/(:segment)', 'Api::content/$1');
    $routes->put('content/(:segment)/(:num)', 'Api::content/$1/$2');
    $routes->delete('content/(:segment)/(:num)', 'Api::content/$1/$2');

    $routes->post('upload', 'Api::upload');

    // Preflight CORS untuk browser (OPTIONS request)
    $routes->options('meta', 'Api::preflight');
    $routes->options('content/(:segment)', 'Api::preflight');
    $routes->options('content/(:segment)/(:num)', 'Api::preflight');
    $routes->options('upload', 'Api::preflight');
});
