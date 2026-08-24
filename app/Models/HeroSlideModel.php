<?php

namespace App\Models;

use CodeIgniter\Model;

class HeroSlideModel extends Model
{
    protected $table = 'hero_slides';

    protected $primaryKey = 'id';

    protected $allowedFields = [
        'image',
        'eyebrow',
        'title',
        'subtitle',
        'cta_text',
        'cta_link',
        'sort_order'
    ];
}
