<?php

namespace App\Models;

use CodeIgniter\Model;

class GalleryModel extends Model
{

    protected $table = 'gallery_photos';

    protected $primaryKey = 'id';

    protected $allowedFields = [

        'image',

        'caption',

        'sort_order'

    ];
}
