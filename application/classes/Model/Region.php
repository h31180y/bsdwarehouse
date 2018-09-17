<?php defined('SYSPATH') or die('No direct script access.');


class Model_Region extends ORM {

    protected $_blongs_to = array(
		'company'=> array('model' => 'Company','foreign_key' => 'company_id'),
    );
    
}