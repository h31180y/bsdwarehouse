<?php defined('SYSPATH') OR die('No direct script access.');

class HTTP_Exception extends Kohana_HTTP_Exception {

	/**
	 * Generate a Response for the current Exception
	 *
	 * @uses   Kohana_Exception::response()
	 * @return Response
	 */
    public function get_response()
    {
        // Lets log the Exception, Just in case it's important!
        Kohana_Exception::log($this);
        
        if (Kohana::$environment >= Kohana::DEVELOPMENT)
        {
            // Show the normal Kohana error page.
            return parent::get_response();
        }
        else
        {
        	$this->template = View::factory ( 'templates/login' );
        	$this->template->message = Message::factory();
        	$this->template->header = "";
        	$this->template->footer = "";
        	$this->template->init = "";
        	
            // Generate a nicer looking "Oops" page.
         
            return $this->template->render();
        }
    }
}
