<?php

function img_url($file)
{
    if (empty($file)) {
        return base_url('assets/no-image.png');
    }

    return base_url('uploads/' . $file);
}
