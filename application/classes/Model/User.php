<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */

class Model_User extends Model_Auth_User {
	
	protected $_has_many = array(
			'user_tokens'=> array('model' => 'User_Token'),
			'roles'=> array('model' => 'Role', 'through' => 'roles_users'),
			'divisions'=> array('model' =>  'Division', 'through' => 'divisions_users'),
			'orders'=> array('model' =>  'Order', 'foreign_key' => 'user_id'),
			'notifications' => array('model'=>'Notification','foreign_key'=>'user_id'),
			'lines' 	=> array('model' => 'Line','through'=>'user_to_line','foreign_key' => 'user_id','far_key'=>'line_id'),
			'medicines' 	=> array('model' => 'Medicine','through'=>'user_to_medicine','foreign_key' => 'user_id','far_key'=>'medicine_id'),
			'repgroups'	=> array('model' => 'RepGroup','through'=>'user_to_pm','foreign_key' => 'user_id','far_key'=>'pm_group_id'),
			'virtual_stock_changes' => array('model' => 'VirtualStockChange','foreign_key' => 'user_id'),

	);
	
	protected $_has_one = array(
			'user_rights'=>array('model'=>'UserRight')
	);
	
	protected $_belongs_to = array(
			'customer'=> array('model' => 'Customer', 'foreign_key' => 'customer_id'),
			'company'=> array('model' => 'Company','foreign_key' => 'company_id'),
	);
}


?>
