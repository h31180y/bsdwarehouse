<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */

class Model_Document extends ORM {
	
	protected $_belongs_to = array(
			'bulkpackaging'=> array('model' => 'BulkPackaging', 'foreign_key' => 'bulkpackaging_id'),
			'documentlist'=> array('model' => 'DocumentList', 'foreign_key' => 'documentlist_id'),
			'box'=> array('model' => 'Box', 'foreign_key' => 'box_id')
	);
	
	protected $_has_one = array(
			'scan' => array('model'=>'DocumentScan'),
			'attachment'=> array('model' => 'Attachment', 'foreign_key' => 'attachment_id')
			
	);
	
			
	protected $_has_many = array(
			'viritualbriefcases'=> array('model' => 'ViritualBriefcase', 'through' => 'virtualbriefcases_documents'),
			'files' => array ('model'=>'DocumentScan')
	);
	
	public function save(Validation $validation = NULL) {
		
		$log=Kohana_Log::instance();
		
		$result = parent::save($validation);
		
		try {
			$log->add(Log::DEBUG,"Document index ok: \n");
			Solr::instance()->index(array('id'=>"document".$this->id,'archidox_id'=>$this->id,'type'=>'document','name'=>$this->name,'description'=>$this->description));
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
			Solr::instance()->index(array('id'=>"document".$this->id,'archidox_id'=>$this->id,'type'=>'document','name'=>$this->name,'description'=>$this->description));
		}catch (Exception $e) {
			$log->add(Log::DEBUG,"Index server not avalivable: ".$e->getMessage()."\n");
		}
		
		return $this;
	}
}


?>
