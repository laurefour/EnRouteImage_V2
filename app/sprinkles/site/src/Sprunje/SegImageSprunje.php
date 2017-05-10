<?php
namespace UserFrosting\Sprinkle\Site\Sprunje;

use UserFrosting\Sprinkle\Core\Facades\Debug;
use UserFrosting\Sprinkle\Core\Sprunje\Sprunje;
use UserFrosting\Sprinkle\Site\Model\SegImage;

class SegImageSprunje extends Sprunje
{
    protected $name = 'SegImage';

    /**
     * Set the initial query used by your Sprunje.
     */
    protected function baseQuery()
    {
        $query = new SegImage();

        // Alternatively, if you have defined a class mapping, you can use the classMapper:
        // $query = $this->classMapper->createInstance('owl');

        return $query;
    }
}