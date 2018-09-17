<?php defined('SYSPATH') or die('No direct script access.');


class Model_OrderProduct extends ORM {
	protected $_table_name = "orders_products";
	
	protected $_has_one = array(
			'company'		=> array('model' => 'Company','foreign_key' => 'product_company_id'),
			'order'			=> array('model' => 'Order','foreign_key' => 'order_id'),
			'product'		=> array('model' => 'Product','foreign_key' => 'product_id'),
	);
	
}