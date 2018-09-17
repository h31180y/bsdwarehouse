<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */

class Model_Box extends ORM {

	protected $_belongs_to = array(
			'warehouse'=> array('model' => 'Warehouse', 'foreign_key' => 'warehouse_id'),
			'storagecategory'=> array('model' => 'StorageCategory',	'foreign_key' => 'storage_category_id'),
			'division'=> array('model' => 'Division', 'foreign_key' => 'division_id'),
			'place' => array('model' => 'Place', 'foreign_key' => 'place_id')
	);
	
	protected $_has_many = array(
			'bulkpackagings'=> array('model' => 'BulkPackaging', 'foreign_key' => 'box_id'),
			'documents'=> array('model' => 'Document', 'foreign_key' => 'box_id'),
			'documentlists'=> array('model' => 'DocumentList', 'foreign_key' => 'box_id'),
			'viritualbriefcases'=> array('model' => 'ViritualBriefcase', 'through' => 'virtualbriefcases_boxes')
			
	);
	
	protected $_has_one = array(
			'boxbarcode'=> array('model' => 'BoxBarcode',	'foreign_key' => 'box_id')

	);
	
	public function save(Validation $validation = NULL) {
	
		$log=Kohana_Log::instance();
	
		$result = parent::save($validation);
	
		try {
			$log->add(Log::DEBUG,"Document index ok: \n");
			Solr::instance()->index(array('id'=>"box".$this->id,'archidox_id'=>$this->id,'status'=>$this->status,'type'=>'box','description'=>$this->description,'date_from'=>gmdate('Y-m-d\TH:i:s\Z',strtotime($this->date_from)),'date_to'=>gmdate('Y-m-d\TH:i:s\Z',strtotime($this->date_to))));			
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
			Solr::instance()->index(array('id'=>"box".$this->id,'archidox_id'=>$this->id,'status'=>$this->status,'type'=>'box','description'=>$this->description,'date_from'=>gmdate('Y-m-d\TH:i:s\Z',strtotime($this->date_from)),'date_to'=>gmdate('Y-m-d\TH:i:s\Z',strtotime($this->date_to))));
		}catch (Exception $e) {
			$log->add(Log::DEBUG,"Index server not avalivable: ".$e->getMessage()."\n");
		}
		
		return $this;
	}
}


?>
