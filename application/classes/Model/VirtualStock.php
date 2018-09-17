<?php defined('SYSPATH') or die('No direct script access.');


class Model_VirtualStock extends ORM {

	protected $_blongs_to = array(
			'user'		=> array('model' => 'User','foreign_key' => 'user_id'),
			'product'	=> array('model' => 'Product','foreign_key' => 'product_id'),
	);

	
}