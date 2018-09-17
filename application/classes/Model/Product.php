<?php defined('SYSPATH') or die('No direct script access.');


class Model_Product extends ORM {

	protected $_blongs_to = array(
			'company'		=> array('model' => 'Company','foreign_key' => 'company_id'),
			'category'		=> array('model' => 'Category','foreign_key' => 'category_id'),
			'line'			=> array('model' => 'Line','foreign_key' => 'line_id'),
			'medicine'		=> array('model' => 'Medicine','foreign_key' => 'medicine_id')

	);

	protected $_has_many = array(
			'virtualstocks' => array(
				'model'       => 'VirtualStock',
				'foreign_key' => 'product_id',
                	),
        );

	
}