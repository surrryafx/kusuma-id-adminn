<?php

namespace App\Models;

use CodeIgniter\Model;

class StatModel extends Model
{

    protected $table = 'stats';

    protected $primaryKey = 'id';

    protected $allowedFields = [

        'number',

        'label',

        'sort_order'

    ];
}
