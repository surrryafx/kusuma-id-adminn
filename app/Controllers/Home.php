<?php

namespace App\Controllers;

use App\Models\SettingModel;

class Home extends BaseController
{
    public function index()
    {
        // Cuma untuk meta tag & JSON-LD (SEO) yang harus ada di HTML mentah;
        // konten section (hero, about, dst) dirender client-side dari js/content.php.
        $data['setting'] = (new SettingModel())->first();

        return view('landing_page', $data);
    }
}
