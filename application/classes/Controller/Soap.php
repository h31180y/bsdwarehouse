<?php defined('SYSPATH') or die('No direct script access.');

/**
 * include the library files and the model
 */
ini_set('include_path', ini_get('include_path').PATH_SEPARATOR.APPPATH.'vendor/');
include Kohana::find_file('vendor','Zend/Soap/AutoDiscover');
include Kohana::find_file('vendor','Zend/Soap/Server');
include Kohana::find_file('classes','Model/Service');
 
class Controller_Soap extends Controller
{
    /**
     * Soap controller
     *
     * @param void
     * @return void
     */
    public function __construct(Request $request, Response $response)
    {
	// Assign the request to the controller
	$this->request = $request;

	$response->headers('Content-Type','text/xml; charset='.Kohana::$charset);

	// Assign a response to the controller
	$this->response = $response;

    }
 
    /**
     * Soap service
     *
     * @param void
     * @return void
     */
    public function action_service()
    {
        // disable wsdl cache
        ini_set('soap.wsdl_cache_enabled', '0');
 
        $wsdl = 'https://' . $_SERVER['HTTP_HOST'] . '/soap/wsdl';
        //$server = new SoapServer($wsdl);
        $server = new Zend_Soap_Server($wsdl);
        $server->setClass('Model_Service');
        $server->handle();
	
//	$request = $server->getLastRequest();
//	Log::instance()->add(Log::DEBUG, "REQUEST:".$request);
        
//        $response = $server->getLastResponse();
//        Log::instance()->add(Log::DEBUG, "RESPONSE".$response);
 
    }
 
    /**
     * Soap wsdl
     *
     * @param void
     * @return void
     */
    public function action_wsdl()
    {  
        // disable wsdl cache
        ini_set('soap.wsdl_cache_enabled', '0');
 
        $wsdl = new Zend_Soap_AutoDiscover();
        $wsdl->setOperationBodyStyle(array('use' => 'literal','namespace' => 'http://framework.zend.com'));
        $wsdl->setUri('https://' . $_SERVER['HTTP_HOST'] . '/soap/service');
        $wsdl->setClass('Model_Service');
        $wsdl->handle();
     }
}
