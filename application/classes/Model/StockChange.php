<?php defined('SYSPATH') or die('No direct script access.');


class Model_StockChange extends ORM {

    protected $_blongs_to = array(
		'company'		=> array('model' => 'Company','foreign_key' => 'company_id'),
		'product'		=> array('model' => 'Product','foreign_key' => 'product_id')
    );
    
}