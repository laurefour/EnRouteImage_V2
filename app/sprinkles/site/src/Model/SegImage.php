<?php
/**
 * labelimage ()
 *
 * @link      
 * @copyright 
 * @license   
 */
namespace UserFrosting\Sprinkle\Site\Model;


use UserFrosting\Sprinkle\Core\Model\UFModel;

/**
 * Verification Class
 *
 * Represents an segimg ref in database.
 * @author Shaun Mermet ()
 * @property string path
 * @property string validated
 * @property string requested
 * @property int Category
 */
class SegImage extends UFModel
{
    public $timestamps = true;

    /**
     * @var string The name of the table for the current model.
     */
    protected $table = "SegImages";

    protected $fillable = [
        "path",
        "validated",
        "available",
        "requested",
        "category",
        "set_id"
    ];


    /**
     * Get all of the areas of the image.
     */
    public function areas()
    {
        return $this->hasMany('UserFrosting\Sprinkle\Site\Model\SegArea','source');
    }
    
    /**
     * Get the group where the image belongs.
     */
    public function group()
    {
        return $this->belongsTo('UserFrosting\Sprinkle\Site\Model\Group','group');
    }
    /**
     * Get the group where the set belongs.
     */
    public function set()
    {
        return $this->belongsTo('UserFrosting\Sprinkle\Site\Model\SegSet');
    }
}
