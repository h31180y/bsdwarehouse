<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */

class Controller_Api extends Controller_Welcome {
	
	public $types_short = array('Zamówienie pustych pudeł i kodów kreskowych'=>'ZPPiKK',
			'Zamówienie odbioru i magazynowania pudeł'=>'ZOiMP',
			'Zamówienie zniszczenie magazynowanych pudeł'=>'ZZMP',
			'Zamówienie skanowania, kopii dokumentów'=>'ZSKD',
			'Zamówienie kopii notarialnej dokumentów'=>'ZKND',
			'Wypożyczenie pudeł'=>'WP');
			
	
	public function before() {
		parent::before ();
		$log=Kohana_Log::instance();
		//$log->add(Log::DEBUG,'================SESSION===============>: '.serialize($this->_session->id()).' '.Auth::instance()->get_user()->username);
		$this->auto_render=FALSE;
	}
	

	public function action_ping() {
			$result = array();
			$result['content']=array();
			$result['status'] = "OK";
			echo json_encode($result);
	}
	
		
	public function action_getAcceptOrders() {
		$log=Kohana_Log::instance();
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
	
	
		if($this->request->method()===HTTP_Request::POST) {
				
			$result = array();
				
			$orders=ORM::factory('Order')->where('status', '=', 'W doręczeniu')->and_where('type', '!=', 'Zamówienie pustych pudeł i kodów kreskowych')->and_where('type', '!=', 'Zamówienie ogólne')->order_by('create_date','DESC')->find_all();
			//$log->add(Log::DEBUG,"Success:".serialize($orders)."\n");
	
			$result['content']=array();
				
			foreach ($orders as $order) {
	
				array_push($result['content'], array('id'=>$order->id,
				'type'=>$order->type,
				'warehouse_id'=>$order->warehouse_id,
				'quantity'=>$order->quantity,
				'pickup_date'=>$order->pickup_date,
				'create_date'=>$order->create_date,
				'pin'=>$order->pin,
				//'display_name'=>" Typ:".$this->types_short[$order->type]." Zam.:".$order->id." Data:".date("Y-m-d", strtotime($order->create_date))));
				'display_name'=>" #".$order->id." Data:".date("Y-m-d", strtotime($order->create_date))." Typ:".$this->types_short[$order->type]));
			}
	
			//if(Auth::instance()->login($_POST['user'], $_POST['password'])) {
			if(TRUE){
				$result['status'] = "OK";
			} else {
				$result['status'] = "ERROR";
				$result['content'] = "Incorrect credentials";
			}
				
			echo json_encode($result);
		}else {
			$result = array();
			$result['status'] = "ERROR";
			$result['content'] = "Only POST requests allowed";
			echo json_encode($result);
		}
	}
		
	public function action_signInvoice() {
		$log=Kohana_Log::instance();
		
		if($this->request->method()===HTTP_Request::POST) {
			
			copy(PDF.DIRECTORY_SEPARATOR.$_POST['invoice_file'],APPPATH.DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.$_POST['invoice_file']);
			
			$pdf = EasyRSA::signFile(APPPATH.DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.$_POST['invoice_file']);
			
			copy(APPPATH.DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR.$_POST['invoice_file'], PDF.DIRECTORY_SEPARATOR.$_POST['invoice_file']);
			
			$log->add(Log::DEBUG,ucfirst(__('Faktura podpisana.')));
			
			$pdf->Output(PDF.$_POST['invoice_file'],'F');
			
			//$request = Request::factory('http://example.com/post_api')->method(Request::POST)->post(array('foo' => 'bar', 'bar' => 'baz'));
				
			echo "OK";
			die;
		}
	}
	
	public function action_uploadInvoice() {
		$log=Kohana_Log::instance();
		
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		$log->add(Log::DEBUG,"Success:".serialize($_FILES)."\n");
		
		if($this->request->method()===HTTP_Request::POST) {
			if(isset($_FILES['invoice']['size']) && $_FILES['invoice']['size'] > 0) {
				$filename = isset($_FILES["invoice"]) ? $_FILES["invoice"] : '';
			
				$path_parts = pathinfo($_FILES["invoice"]["name"]);
				$extension = $path_parts['extension'];
			
				if ( ! Upload::valid($filename) OR ! Upload::not_empty($filename) OR ! Upload::type($filename, array('pdf', 'tif', 'tiff', 'png','jpg','jpeg'))) {
					$log->add(Log::ERROR,ucfirst(__('Nie udało się zaktualizować faktury.')));
					echo "NOK";
					die;
				}
			
				if ($file = Upload::save($filename, $_FILES["invoice"]["name"], PDF)) {
					$log->add(Log::DEBUG,ucfirst(__('Faktura dodana.')));
					echo "OK";
					die;
				}else {
					$log->add(Log::ERROR,ucfirst(__('Nie udało się zaktualizować faktury.')));
					echo "NOK";
					die;
				}
			}
		}
		
	}
	
	public function action_checkLogin() {
		$log=Kohana_Log::instance();
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		
		
		if($this->request->method()===HTTP_Request::POST) {
			
			$result = array();
			
			if(Auth::instance()->login($this->request->post('user'), $this->request->post('password'),1)) {
				$result['status'] = "OK";
				$result['content'] = NULL;
			} else {
				$result['status'] = "ERROR";
				$result['content'] = "Incorrect credentials";
			} 
			echo json_encode($result);
		}else {
			$result = array();
			$result['status'] = "ERROR";
			$result['content'] = "Only POST requests allowed";
			echo json_encode($result);
		}
	}
	
	public function action_getInProgressOrders() {
		$log=Kohana_Log::instance();
		$log->add(Log::DEBUG,"Success:getInProgressOrders\n");
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
	
	
		if($this->request->method()===HTTP_Request::POST) {
				
			$result = array();
				
			$orders=ORM::factory('Order')->where('status', '=', 'W dostarczeniu na magazyn')->and_where('type', '!=', 'Zamówienie pustych pudeł i kodów kreskowych')->and_where('type', '!=', 'Zamówienie ogólne')->order_by('create_date','DESC')->find_all();
			//$log->add(Log::DEBUG,"Success:".serialize($orders)."\n");
	
			$result['content']=array();
				
			foreach ($orders as $order) {
	
				array_push($result['content'], array('id'=>$order->id,
				'type'=>$order->type,
				'warehouse_id'=>$order->warehouse_id,
				'quantity'=>$order->quantity,
				'pickup_date'=>$order->pickup_date,
				'create_date'=>$order->create_date,
				//'display_name'=>" Typ:".$this->types_short[$order->type]." Zam.:".$order->id." Data:".date("Y-m-d", strtotime($order->create_date))));
				'display_name'=>" #".$order->id." Data:".date("Y-m-d", strtotime($order->create_date))." Typ:".$this->types_short[$order->type]));
			}
	
			//if(Auth::instance()->login($_POST['user'], $_POST['password'])) {
			if(TRUE){
				$result['status'] = "OK";
			} else {
				$result['status'] = "ERROR";
				$result['content'] = "Incorrect credentials";
			}
				
			echo json_encode($result);
		}else {
			$result = array();
			$result['status'] = "ERROR";
			$result['content'] = "Only POST requests allowed";
			echo json_encode($result);
		}
	}
	
	public function action_getOrders() {
		$log=Kohana_Log::instance();
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		
		
		if($this->request->method()===HTTP_Request::POST) {
			
			$result = array();
			
			$orders=ORM::factory('Order')->where('status', '=', 'Nowe')->or_where('status', '=', 'W trakcie realizacji')->or_where('status', '=', 'Przyjęte do realizacji')->and_where('type', '!=', 'Zamówienie pustych pudeł i kodów kreskowych')->and_where('type', '!=', 'Zamówienie ogólne')->order_by('create_date','DESC')->find_all();
			
						
			$result['content']=array();
			
			foreach ($orders as $order) {
				
				array_push($result['content'], array('id'=>$order->id,
													'type'=>$order->type,
													'warehouse_id'=>$order->warehouse_id,
													'quantity'=>$order->quantity,
													'pickup_date'=>$order->pickup_date,
													'create_date'=>$order->create_date,
													//'display_name'=>" Typ:".$this->types_short[$order->type]." Zam.:".$order->id." Data:".date("Y-m-d", strtotime($order->create_date))));
													'display_name'=>" #".$order->id." Data:".date("Y-m-d", strtotime($order->create_date))." Typ:".$this->types_short[$order->type]));
			}
		
			//if(Auth::instance()->login($_POST['user'], $_POST['password'])) {
			if(TRUE){
				$result['status'] = "OK";
			} else {
				$result['status'] = "ERROR";
				$result['content'] = "Incorrect credentials";
			} 
			
			echo json_encode($result);
		}else {
			$result = array();
			$result['status'] = "ERROR";
			$result['content'] = "Only POST requests allowed";
			echo json_encode($result);
		}		
	}
	
	public function action_getOrderDetails() {
		$log=Kohana_Log::instance();
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		
		if($this->request->method()===HTTP_Request::POST) {
				
			$result = array();
			$order=ORM::factory('Order')->where('id', '=', $_POST['order_id'])->find();
			
			if ($order->type=='Zamówienie pustych pudeł i kodów kreskowych' || $order->type=='Zamówienie odbioru i magazynowania pudeł') {
				$result['scan'] = TRUE;
			}else {
				$result['scan'] = FALSE;
			}
				
			$order_boxes=$order->boxes->where('status','!=','Zdjęte z pozycji')->find_all();
			
			$content = array();
			$result['content'] = array();
			
			foreach ($order_boxes as $ob) {
				$content['id'] = $ob->barcode;
				$content['date_from'] = $ob->date_from;
				$content['status'] = $ob->lock;
				$content['warehouse_id'] = $ob->warehouse_id;
				$content['display_name'] = "Pudło:".$ob->barcode ." Mag.:". $ob->warehouse_id." Lok:".$ob->place->description;
				array_push($result['content'],$content);
			}
			
			$result['status'] = "OK";
			echo json_encode($result);
		}else {
			$result = array();
			$result['status'] = "ERROR";
			$result['content'] = "Only POST requests allowed";
			echo json_encode($result);
		}	
	}
	
	public function action_searchCode() {
		$result = array();
		$result['status'] = "OK";
		$result['content'] = NULL;
		echo json_encode($result);
		
	}
	public function action_deliverOrder() {
		$result = array();
		$order = Order::instance($_POST['order_id']);
	
		if($order->deliverOrder()) {
			$result['status'] = "OK";
			$result['content'] = NULL;
			echo json_encode($result);
		}else {
			$result['status'] = "ERROR";
			$result['content'] = "Update of the order went badly, im afraid, sir!";
			echo json_encode($result);
	
		}
	}
		
	public function action_confirmOrder() {
		$result = array();
		$order = Order::instance($_POST['order_id']);
		
		if($order->acceptOrder()) {
			$result['status'] = "OK";
			$result['content'] = NULL;
			echo json_encode($result);
		}else {
			$result['status'] = "ERROR";
			$result['content'] = "Update of the order went badly, im afraid, sir!";
			echo json_encode($result);
				
		}
	}
	
	public function action_completeOrder() {
		$result = array();
		$order = Order::instance($_POST['order_id']);
	
		if($order->completeOrder()) {
			$result['status'] = "OK";
			$result['content'] = NULL;
			echo json_encode($result);
		}else {
			$result['status'] = "ERROR";
			$result['content'] = "Update of the order went badly, im afraid, sir!";
			echo json_encode($result);
	
		}
	}	
	
	public function action_addOrderBox() {
		$result = array();
		
		$order = Order::instance($_POST['order_id']);
		
		$order_detail = ORM::factory('OrderDetail')->where('box_number', '=', $_POST['box_id'])->and_where('order_id', '=', $_POST['order_id'])->limit(1)->find();

		$box = ORM::factory('Box',$_POST['box_id']);
		$box->barcode=sprintf('%012d',$_POST['box_id']);
		$box->date_from=date('Y-m-d');
		$box->date_reception=date('Y-m-d');
		$box->status='W trakcie transportu';
		
		if($order_detail->loaded() == TRUE) {
			$box->description = $order_detail->box_description;
			$box->storage_category_id =$order_detail->box_storagecategory;
			$box->date_to =  $order_detail->box_date;
		}
		
		if($box->loaded() != TRUE) {

			if($box->save()) {
			
				$order->order->add('boxes',$box->id);
			
				$result['status'] = "OK";
			
				$content['id'] = $box->id;
				$content['date_from'] = $box->date_from;
				$content['status'] = $box->status;
				$content['warehouse_id'] = -1;
				$content['display_name'] = "Pudło:".$box->barcode ." Mag.: NW Data:".$box->date_from;
			
				$result['content']=$content;
					
				echo json_encode($result);
			}else {
				$result['status'] = "ERROR";
				$result['content'] = "Update of the order went badly, im afraid, sir!";
				echo json_encode($result);
			}	
		}else {
	
			if($box->update()) {
			
				$order->order->add('boxes',$box->id);
			
				$result['status'] = "OK";
			
				$content['id'] = $box->id;
				$content['date_from'] = $box->date_from;
				$content['status'] = $box->status;
				$content['warehouse_id'] = -1;
				$content['display_name'] = "Pudło:".$box->barcode ." Mag.: 0 Data:".$box->date_from;
			
				$result['content']=$content;
					
				echo json_encode($result);
			}else {
				$result['status'] = "ERROR";
				$result['content'] = "Update of the order went badly, im afraid, sir!";
				echo json_encode($result);
			}
		}
		
	
		

	}
	
	public function action_warehouseRecept() {
		$log=Kohana_Log::instance();

		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		
		$result = array();
		$order = Order::instance($_POST['order_id']);
	
		if($order->receptOrder($_POST)) {
			$result['status'] = "OK";
			$result['content'] = NULL;
			echo json_encode($result);
		}else {
			$result['status'] = "ERROR";
			$result['content'] = "Update of the order went badly, im afraid, sir!";
			echo json_encode($result);
	
		}
	}
	
	public function action_boxRecept() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
	
		$result = array();
		
		$box = Box::instance();
	
		if($box->receptBox($_POST)) {
			$result['status'] = "OK";
			$result['content'] = NULL;
			echo json_encode($result);
		}else {
			$result['status'] = "ERROR";
			$result['content'] = "Update of the order went badly, im afraid, sir!";
			echo json_encode($result);
	
		}
	}
	
	
	
	public function action_boxStatusChange() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
	
		$result = array();
	
		$box = Box::instance();
	
		if($box->changeStatus($_POST)) {
			$result['status'] = "OK";
			$result['content'] = NULL;
			echo json_encode($result);
		}else {
			$result['status'] = "ERROR";
			$result['content'] = "Update of the order went badly, im afraid, sir!";
			echo json_encode($result);
	
		}
	}
	public function action_index() {
		$result = array();
		$result['status'] = "ERROR";
		$result['content'] = "Ten serwis nie powinien być wywołany";
		echo json_encode($result);
		
	}
}