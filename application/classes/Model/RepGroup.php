<?php defined('SYSPATH') or die('No direct script access.');


class Model_RepGroup extends ORM {
    protected $_table_name = 'productmanagers_groups';
    
    protected $_has_many = array(
			    'reps' => array(
					'model'       => 'Rep',
					'foreign_key' => 'group_id',
            				),
        		    'users'	=> array(
        				'model' => 'User',
        				'through'=>'user_to_pm',
        				'foreign_key' => 'pm_group_id',
        				'far_key'=>'user_id'
        				)
        
	        	    );

}