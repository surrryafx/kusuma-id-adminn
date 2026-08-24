<?php

namespace App\Models;

use CodeIgniter\Model;

class SettingModel extends Model
{
    protected $table = 'site_settings';

    protected $primaryKey = 'id';

    protected $allowedFields = [
        '*'
    ];
}
