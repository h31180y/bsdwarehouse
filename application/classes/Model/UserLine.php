<?php defined('SYSPATH') or die('No direct script access.');


class Model_UserLine extends ORM {

	protected $_table_name = 'user_to_line';

	protected $_blongs_to = array(
			'user'		=> array('model' => 'User','foreign_key' => 'user_id'),
			'line'		=> array('model' => 'Line','foreign_key' => 'line_id'),

	);
}