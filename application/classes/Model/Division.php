<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */

class Model_Division extends ORM {

	protected $_has_many = array(
			'users'=> array('model' =>  'User', 'through' => 'divisions_users'),
			'virtualbriefcases'=> array('model' => 'VirtualBriefcase'),
			'boxes'=> array('model' => 'Box')
			
	);
		
	protected $_belongs_to = array(
			'customer'=> array('model' => 'Customer', 'foreign_key' => 'customer_id')
	);
	
	public function save(Validation $validation = NULL) {
	
		$log=Kohana_Log::instance();
	
		$result = parent::save($validation);
	
		try {
			$log->add(Log::DEBUG,"Document index ok: \n");
			Solr::instance()->index(array('id'=>"division".$this->id,'archidox_id'=>$this->id,'type'=>'division','name'=>$this->name,'description'=>$this->description));
		}catch (Exception $e) {
			$log->add(Log::DEBUG,"Index server not avalivable: ".$e->getMessage()."\n");
		}
		return $result;
	}
	
	public function update(Validation $validation = NULL) {
	
		$log=Kohana_Log::instance();
	
		parent::update($validation);
	
		try {
			$log->add(Log::DEBUG,"Document index ok: \n");
			Solr::instance()->index(array('id'=>"division".$this->id,'archidox_id'=>$this->id,'type'=>'division','name'=>$this->name,'description'=>$this->description));
		}catch (Exception $e) {
			$log->add(Log::DEBUG,"Index server not avalivable: ".$e->getMessage()."\n");
		}
		
		return $this;
	}
}


?>
