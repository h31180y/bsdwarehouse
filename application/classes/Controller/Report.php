<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */
 
class Controller_Report extends Controller_Welcome {
	
	public function before() {
		parent::before ();
		
		$this->template->_controller = strtolower ( $this->request->controller () );
		$this->template->_action = strtolower ( $this->request->action () );
		array_push($this->_bread, ucfirst($this->request->action ()));
		$this->template->message = Message::factory();
	}
	
	protected function load_content() {
		
		$this->add_fjs ( ASSETS_GLOBAL_PLUGINS.'jquery-validation/js/jquery.validate.min.js');
		
		if($this->request->action() == 'boxes_per_division_report' || $this->request->action() == 'warehouse_period_report' || $this->request->action() == 'orders_per_box_report' || $this->request->action() == 'utilisation_report') {
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.resize.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.pie.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.stack.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.crosshair.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.categories.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'datatables/media/js/jquery.dataTables.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'datatables/plugins/bootstrap/dataTables.bootstrap.js');
			$this->add_fjs( ASSETS_GLOBAL_SCRIPTS.'datatable.js');
				
				
		}

		if($this->request->action() == 'warehouse_period_report' || $this->request->action() == 'orders_report') {
			
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'clockface/css/clockface.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-datepicker/css/datepicker3.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-timepicker/css/bootstrap-timepicker.min.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-colorpicker/css/colorpicker.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/daterangepicker-bs3.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css');

			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-datepicker/js/bootstrap-datepicker.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-timepicker/js/bootstrap-timepicker.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'clockface/js/clockface.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/moment.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/locale/pl.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/daterangepicker.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-colorpicker/js/bootstrap-colorpicker.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.pl.js');
			
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.resize.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'flot/jquery.flot.categories.js');
				
				
		}
		
		if($this->request->action() == 'orders_per_box_report') {
				
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-datepicker/css/datepicker3.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-timepicker/css/bootstrap-timepicker.min.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-colorpicker/css/colorpicker.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/daterangepicker-bs3.css');
			$this->add_css(ASSETS_GLOBAL_PLUGINS.'bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css');
		
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-datepicker/js/bootstrap-datepicker.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-timepicker/js/bootstrap-timepicker.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/moment.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/locale/pl.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-daterangepicker/daterangepicker.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-colorpicker/js/bootstrap-colorpicker.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js');
			$this->add_fjs( ASSETS_GLOBAL_PLUGINS.'bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.pl.js');
		}
		
		$this->class='page-header-fixed page-quick-sidebar-over-content';
		
		
		if (Kohana::find_file ( 'views', $this->_req )) {

			$this->content = View::factory ( $this->_req );
				
			if (file_exists ( CSS . DIRECTORY_SEPARATOR. $this->_req . '.css' )) {
				$this->add_css ( CSS . DIRECTORY_SEPARATOR.  $this->_req . '.css' );
			}
				
			if (file_exists ( DOCROOT. ASSETS_ADMIN_PAGES_SCRIPTS . $this->_req . '.js' )) {
				
				$this->add_fjs( ASSETS_ADMIN_PAGES_SCRIPTS .  $this->_req . '.js' );
			}
		}
		
		if($this->request->action() == 'boxes_per_division_report') $this->add_init("\n\tReportChart.init();
				\n\tReportChart.initPieCharts();");
		if($this->request->action() == 'warehouse_period_report') $this->add_init("\n\tReportDate.init();");
		if($this->request->action() == 'orders_report') $this->add_init("\n\tReportDate.init();");
		if($this->request->action() == 'orders_per_box_report') $this->add_init("\n\tReportDate.init();");
		if($this->request->action() == 'utilisation_report') $this->add_init("\n\tReport.init();");
	}
	
	public function action_index() {
	
	}
	
	
	public function action_warehouse_period_report() {
	
	}
	
	public function action_boxes_per_division_report() {
	
	}
	
	public function action_orders_report() {
		if($this->request->method()===HTTP_Request::POST) {
			
			if(Auth::instance()->logged_in('admin')) {
				$orders = ORM::factory('Order')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->find_all();
				$orders_count = ORM::factory('Order')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
			}else {
				$orders = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->find_all();
				$orders_count = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
			}
		}else {
			if(Auth::instance()->logged_in('admin')) {
				$orders = ORM::factory('Order')->find_all();
				$orders_count = ORM::factory('Order')->count_all();
			}else {
				$orders = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->find_all();
				$orders_count = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->count_all();
			}
		}
			
		$orders_sum = 0.00;
		
		foreach ($orders as $order) {
			
			
			$orders_sum += $order->final_price;
		}
		
		$this->content->bind('orders', $orders);
		$this->content->bind('orders_count', $orders_count);
		$this->content->bind('orders_sum', $orders_sum);
		
		
	}
	public function action_orders_per_box_report() {
		
		/*if($this->request->method()===HTTP_Request::POST) {
				
			if(Auth::instance()->logged_in('admin')) {
				$orders = ORM::factory('Order')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->find_all();
				$orders_count = ORM::factory('Order')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
			}else {
				$orders = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->find_all();
				$orders_count = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
			}
		}else {
			if(Auth::instance()->logged_in('admin')) {
				$orders = ORM::factory('Order')->find_all();
				$orders_count = ORM::factory('Order')->count_all();
			}else {
				$orders = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->find_all();
				$orders_count = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->count_all();
			}
		}
		
		$this->content->bind('orders', $orders);
		$this->content->bind('orders_count', $orders_count); */
	
	}
	public function action_utilisation_report() {
	
	}
	
}