<?php use Zend\Filter\Null;
defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */

class DpdWebService {

	public $_instance = NULL;
	public $_dpd = NULL;
	private $_config = "";

	
	public $shipToDpd = array("Company"=> "",
			"Name"=> "",
			"Surname"=> "",
			"Street"=> "",
			"Number"=> "",
			"City"=> "",
			"CountryCode"=> "",
			"PostalCode"=> "",
			"Phone"=> "",
			"Phone2"=> "",
			"Email"=> "");
	
	public static function instance() {
			
			if($_instance != NULL) return DpdWebService::$_instance;
			else return new DpdWebService();
	}

	public function __construct() {
		
		$_config = Kohana::$config->load('dpd');

		
		$shipFromDpd["Company"] = $_config->company;
		$shipFromDpd["Name"] = $_config->name;
		$shipFromDpd["Street"] = $_config->street;
		$shipFromDpd["City"] = $_config->city;
		$shipFromDpd["PostalCode"] = str_replace('-','',$_config->postal);
		$shipFromDpd["CountryCode"] = $_config->country_code;
		$shipFromDpd["Phone"] = $_config->phone;
		$shipFromDpd["Email"] = $_config->email;
		
		
		$dpd = new DpdApi();
		
		$dpd->setLang("pl_PL");
		
		$dpd->setHost($_config->hostname);
		$dpd->setFolder($_config->files);
		$dpd->setLogin($_config->username);
		$dpd->setPassword($_config->password);
		$dpd->setMasterfid($_config->fid);
		$dpd->setShipFrom($shipFromDpd);
		
		$this->_dpd = $dpd;
		
		$this->_instance = $this;
		
	}
	
	public function test() {
		

		$this->_dpd->setShipTo($this->shipToDpd);
		
		$this->_dpd->setConnection();
		
		
		
		var_dump($this->_dpd->getProtocol(array("0040992801495A")));
	}
}


?>
