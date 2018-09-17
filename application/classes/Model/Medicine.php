<?php defined('SYSPATH') or die('No direct script access.');


class Model_Medicine extends ORM {
    
    protected $_has_many = array(
				    'products' => array(
						'model'       => 'Product',
						'foreign_key' => 'medicine_id',
                				),
                	    );
}