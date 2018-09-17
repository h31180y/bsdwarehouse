<?php defined('SYSPATH') or die('No direct script access.');


class Model_VirtualStockChange extends ORM {

    protected $_blongs_to = array(
		'product'	=> array('model' => 'Product','foreign_key' => 'product_id'),
		'user'		=> array('model' => 'User','foreign_key' => 'user_id')
    );
    
}