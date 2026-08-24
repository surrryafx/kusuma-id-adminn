<?php

namespace App\Models;

use CodeIgniter\Model;

class CompanyModel extends Model
{
    protected $table = 'companies';

    protected $primaryKey = 'id';

    protected $allowedFields = [
        'image',
        'name',
        'icon',
        'description',
        'link',
        'sort_order'
    ];
}
