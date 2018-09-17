<?php defined('SYSPATH') or die('No direct script access.');


class Model_Rep extends ORM {
    protected $_table_name = 'productmanagers';

    protected $_blongs_to = array(
		'company'		=> array('model' => 'Company','foreign_key' => 'company_id'),
		'repgroup'		=> array('model' => 'RepGroup','foreign_key' => 'category_id')
    );
    
}