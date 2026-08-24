<?php

namespace App\Models;

use CodeIgniter\Model;

class AboutModel extends Model
{

    protected $table = 'about_items';

    protected $primaryKey = 'id';

    protected $allowedFields = [

        'image',

        'label',

        'name',

        'icon',

        'text',

        'sort_order'

    ];
}
