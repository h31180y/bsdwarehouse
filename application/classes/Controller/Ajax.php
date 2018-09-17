<?php defined('SYSPATH') or die('No direct script access.');
/**
 * @author     Maciej Kowalczyk - Tepfer <maciekk@bsdterminal.pl>
 * @copyright  BSDterminal 2014
 * @version    1.0
 */
 
class Controller_Ajax extends Controller_Welcome {
	
	public function before() {
		parent::before ();

		$this->auto_render=FALSE;
	}

	public function action_synchronizeDocuments() {
		$content ="<p style=\"margin-left:1em;\">Ta opcja jest wyłączona</p>";
		echo $content;
		die;
	}
	
	public function action_synchronizeCategories(){
		$content .="<p style=\"margin-left:1em;\">Ta opcja jest wyłączona</p>";
		echo $content;
		die;
		
	}
	
	public function action_synchronizeBoxes() {
		
		set_time_limit(0);
		
		if($this->request->method()!==HTTP_Request::POST) {
			$content = "<div class=\"scroller\" style=\"height:300px\" data-always-visible=\"1\" data-rail-visible=\"1\" data-rail-color=\"blue\" data-handle-color=\"red\">
		<div style=\"font-size:70%;\">";
			
			$query = DB::select('*')->from('tblBazaOpak')->where('IdRodzOpak', 'IN', array('23','24','25','26'))->and_where('StatusOpak','!=',0)->order_by('Klucz')->as_object();
			
			$old_boxes = $query->execute('archdep');
			
			foreach ($old_boxes as $ob) {
				
				$ob_details = $query = DB::select('*')->from('tblOpakJedn')->where('Klucz', '=', $ob->Klucz)->limit(1)->as_object()->execute('archdep')[0]; 
				
				$content .="<div class=\"alert alert-success\"><p>Znaleziono pudło klienta ".$ob->Klucz." </p>";
				
				$box=Box::instance($ob->Klucz);
				
				if($ob->KluczOpakZewn != 0) {
				
					$place = ORM::factory('Place')->where('id','=',$ob->KluczOpakZewn)->find();
				
					$box->box->place_id = $place->id;
				}


				$box->box->date_from = $ob_details->RokDokumentu."-12-31";
				$box->box->date_to = $ob_details->DataBrakowania;
				
				if($box->box->storage_category_id == NULL) {
					$okres = date('Y',strtotime($ob_details->DataBrakowania))-$ob_details->RokDokumentu ;
					if($okres > 0 || $okres < 2000) {
						$storage_category = ORM::factory('StorageCategory')->where('period', '=', $okres)->limit(1)->find();
						$box->box->storage_category_id = $storage_category->id;						
					}
				}
				
				if($ob_details->OstatniePrzyj != "") {
					$box->box->date_reception = date('Y-m-d',strtotime($ob_details->OstatniePrzyj));
				}else {
				
					$box->box->date_reception = $ob_details->RokDokumentu."-12-31";
				}
				
				$ob_properties = $query = DB::select('*')->from('tblOpakJednCechyDok')->where('KluczOpakJedn', '=', $ob_details->Klucz)->as_object()->execute('archdep');


				$description="";
					
				foreach ($ob_properties as $obp) {
					$ob_properties_name = $query = DB::select('*')->from('tblCechyGrupyDokKlientow')->where('IdCechy', '=', $obp->IdCechy)->as_object()->execute('archdep')[0];
					
					if(preg_match('/.*plomb.*/i', $ob_properties_name->Nazwa)) {
						
						$box->box->seal = 1;
						
						if($box->box->seal1 == "") {
							$box->box->seal1 = $obp->Wartosc;
						}else {
							$box->box->seal2 = $obp->Wartosc;
						}
					}
							
					$description .=$ob_properties_name->Nazwa.": ".$obp->Wartosc."\n";
				}
				
				$box->box->description = $description;

				
				if($ob->StatusOpak = 0) {
					$box->box->status = "Nowe";
						
				}elseif($ob->StatusOpak = 10) {
					$box->box->status = "Na magazynie";
						
				}elseif($ob->StatusOpak = 20) {
					$box->box->status = "Wypożyczone";
						
				}elseif($ob->StatusOpak = 90) {
					$box->box->status = "Usunięte";
				}else {
					$box->box->status = NULL;
				}
				

				
				if($box->box->loaded()) {
					$box->box->barcode = sprintf('%012d',$box->box->barcode);
					$content .="<p style=\"margin-left:1em;\">Pudło znalezione w systemie - aktualizuje właściwości</p>";
					$box->box->update();
				}else {
					
					$box->box->barcode = sprintf('%012d',$ob_details->KodKreskowy);
					$box->box->save();
					
					if($ob->KluczOpakZewn != 0 && $place->loaded()) {
						$place->capacity++;
						$place->update();
					}
						
				}
				
				$content .="</div>";
			}
		}
		echo $content."</div></div>";
		die;
		
	}
	
	public function action_synchronizeCustomers() {
		if($this->request->method()===HTTP_Request::POST) {
			$content = "<div class=\"scroller\" style=\"height:300px\" data-always-visible=\"1\" data-rail-visible=\"1\" data-rail-color=\"blue\" data-handle-color=\"red\">
		<div style=\"font-size:70%;\">";
			$query = DB::select('*')->from('tblKlienci')->as_object();
			
			$old_customers = $query->execute('archdep');
			
			foreach ($old_customers as $old_customer) {
					
				$params = array();
			
				if($old_customer->IdKlienta == NULL) continue;
			
				$customer = Customer::instance($old_customer->IdKlienta);
			
				if(!$customer->customer->loaded()) {
			
					$content .="<div class=\"alert alert-success\"><p>Znaleziono nowego klienta -".$old_customer->NazwaKlienta." </p>";
			
					$customer->id = $old_customer->IdKlienta;
					$customer->customer->code = $old_customer->KodKlienta;
					$customer->name =$old_customer->NazwaKlienta;
					$customer->nip =$old_customer->NIP;
					$customer->comments = "Klient importowany";
					$customer->create_date = date('Y-m-d');
					$customer->parent_customer=$old_customer->KlientNadrz;
			
					$params['street'] =str_replace('\N', NULL,  explode(' ',$old_customer->Ulica)[0]);
					$params['number'] =str_replace('\N', NULL,  explode(' ',$old_customer->Ulica)[1]);
					$params['city'] =str_replace('\N', NULL,  $old_customer->Miejscowosc);
					$params['postal'] =str_replace('\N', NULL,  $old_customer->KodPocztowy);
					$params['telephone']  =str_replace('\N', NULL,  $old_customer->Telefon);
			
					$params['name'] =str_replace('\N', NULL,  $old_customer->NazwaKlienta);
					$params['nip'] =str_replace('\N', NULL,  $old_customer->NIP);
					$params['comments'] = "Klient importowany";
					$params['parent_customer'] = $old_customer->KlientNadrz;
			
					$customer->customer->id=$old_customer->IdKlienta;
						
					if($customer->addCompany($params)) {
						$content .= "<p style=\"margin-left:1em;\">Klient dodany</p></div>";
					}
				}else {
					$content .= "<div class=\"alert alert-info\">Klient ".$old_customer->NazwaKlienta." pominięty, już jest w bazie.</div>";
				}
			}
			echo $content."</div></div>";
			die;
		}
	}
	
	public function action_getUtilisationReportTable() {
	
		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
		
		if(Auth::instance()->logged_in('admin')) {
			$boxes = ORM::factory('Box')->where('date_to','<',date('Y-m-d'))->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
			$iTotalRecords = ORM::factory('Box')->where('date_to','<',date('Y-m-d'))->count_all();
		}else {
			$boxes = ORM::factory('Box')->where('date_to','<',date('Y-m-d'))->and_where('division_id','IN',Auth::instance()->get_user()->customer->divisions->find_all()->as_array())->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
			$iTotalRecords = ORM::factory('Box')->where('date_to','<',date('Y-m-d'))->and_where('division_id','IN',Auth::instance()->get_user()->customer->divisions->find_all()->as_array())->count_all();
		}

			
		$records = array();
		$records["data"] = array();
			
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
		$i=$iDisplayStart+1;
		foreach ($boxes as $box) {
				
			$records["data"][] = array(
						sprintf('%012d',$box->barcode),
						($box->place_id != '' ? $box->place->description : sprintf('%012d',0) ),
						$box->warehouse->name,
						$box->division->customer->name,
						$box->date_from,
						$box->date_to,
						$box->status
			);
			$i++;
		}
		
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
		
		$log=Kohana_Log::instance();
		
		$log->add(Log::DEBUG,"Success:".serialize($boxes)."\n");
		
		echo json_encode($records);
		die;
	
	}
	
	public function action_getOrdersReportTable() {

		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
				
		$report=array();
		
		if($this->request->method()===HTTP_Request::POST) {
		
			if(Auth::instance()->logged_in('admin')) {
				$orders = ORM::factory('Order')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
				$iTotalRecords = ORM::factory('Order')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
			}else {
				$orders = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
				$iTotalRecords = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
			}
		}else {
			if(Auth::instance()->logged_in('admin')) {
				$orders = ORM::factory('Order')->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
				$iTotalRecords = ORM::factory('Order')->count_all();
			}else {
				$orders = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
				$iTotalRecords = ORM::factory('Order')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->count_all();
			}
		}
			
		$records = array();
		$records["data"] = array();
			
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
		$i=$iDisplayStart+1;
		
		foreach ($orders as $order) {

			
			$boxes = $order->boxes->find_all();
			$boxes_html = "";
			
			foreach ($boxes as $box) {
				$boxes_html.="<p>".sprintf('%012d',$box->barcode)."</p>";
			}
			
			$records["data"][] = array($i,$order->id,$order->type,$order->boxes->count_all(),$boxes_html,
					"<center><a href=\"/order/view_order/".$order->id."\" target=\"_blank\" class=\"btn blue\"><i class=\"fa fa-shopping-cart\"></i> <span>Zamówienie</span></a></center>");
			$i++;
		}
		
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
		
		echo json_encode($records);
		die;		
		
	}
	
	public function action_getOrdersReport() {
		
		$report=array();
		
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
		
		//		var_dump($orders);
		
		$orders_sum = 0.00;
		
		foreach ($orders as $order) {
				
				
			$orders_sum += $order->final_price;
		}
		
		
		$report['orders_sum'] = $orders_sum;
		$report['orders_count'] = $orders_count;
		
		echo json_encode($report);
		die;
	}
	
	public function action_getOrdersCountReport() {
		
		$report=array();
		
		if($this->request->method()===HTTP_Request::POST) {
				
			if(Auth::instance()->logged_in('admin')) {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('COUNT(id) as count'))-> from('orders')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->group_by(DB::expr('DATE(create_date)'))->execute();
			}else {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('COUNT(id) as count'))-> from('orders')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->group_by(DB::expr('DATE(create_date)'))->execute();
			}
		}else {
			if(Auth::instance()->logged_in('admin')) {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('COUNT(id) as count'))-> from('orders')->group_by(DB::expr('DATE(create_date)'))->execute();
			}else {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('COUNT(id) as count'))-> from('orders')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->group_by(DB::expr('DATE(create_date)'))->execute();
			}
		}
		
		$i=0;
		
		foreach ($orders_count as $count) {
			$report[$i]['date'] = $count['order_date'];
			$report[$i]['count'] = $count['count'];
			$i++;
		}
		
		echo json_encode($report);
		die;
	}
	public function action_getOrdersValueReport() {
	
		$report=array();
	
		if($this->request->method()===HTTP_Request::POST) {
	
			if(Auth::instance()->logged_in('admin')) {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('SUM(final_price) as value'))-> from('orders')->where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->group_by(DB::expr('DATE(create_date)'))->execute();
			}else {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('SUM(final_price) as value'))-> from('orders')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->and_where('create_date','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->group_by(DB::expr('DATE(create_date)'))->execute();
			}
		}else {
			if(Auth::instance()->logged_in('admin')) {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('SUM(final_price) as value'))-> from('orders')->group_by(DB::expr('DATE(create_date)'))->execute();
			}else {
				$orders_count = DB::select(DB::expr('DATE(create_date) as order_date'),DB::expr('SUM(final_price) as value'))-> from('orders')->where('user_id', 'IN', Auth::instance()->get_user()->customer->users->find_all()->as_array())->group_by(DB::expr('DATE(create_date)'))->execute();
			}
		}
	
		$i=0;

	
		foreach ($orders_count as $count) {
			$report[$i]['date'] = $count['order_date'];
			$report[$i]['value'] = $count['value'];
			$i++;
		}
		
		echo json_encode($report);
		die;
	}	
	public function action_getWareHousePeriodTable() {

		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
		
		if(Auth::instance()->logged_in('admin')) {
			$boxes = ORM::factory('Box')->where('date_from','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
			$iTotalRecords = ORM::factory('Box')->where('date_from','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->count_all();
		}else {
			$boxes = ORM::factory('Box')->where('date_from','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->and_where('division_id','IN',Auth::instance()->get_user()->customer->divisions->find_all()->as_array())->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
			$iTotalRecords = ORM::factory('Box')->where('date_from','BETWEEN',DB::expr('"'.date('Y-m-d',strtotime($_POST['date_start'])).'" AND "'.date('Y-m-d',strtotime($_POST['date_end'])).'"'))->and_where('division_id','IN',Auth::instance()->get_user()->customer->divisions->find_all()->as_array())->count_all();
		}

			
		$records = array();
		$records["data"] = array();
			
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
		$i=$iDisplayStart+1;
		foreach ($boxes as $box) {
				
			$records["data"][] = array($i,$box->id,sprintf('%012d',$box->barcode),$box->description,$box->description);
			$i++;
		}
		
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
		
		$log=Kohana_Log::instance();
		
		$log->add(Log::DEBUG,"Success:".serialize($boxes)."\n");
		
		echo json_encode($records);
		die;
	}
	
	public function action_getBoxesPerDivisionTable() {
		/*
		 * data[i] = {
		label: "Series" + (i + 1),
		data: Math.floor(Math.random() * 100) + 1
		};
		*/
		
		
	
		if(Auth::instance()->logged_in('admin')) {
			$divisions = ORM::factory('Division')->find_all();
			$iTotalRecords = ORM::factory('Division')->count_all();
		}else {
			$divisions = Auth::instance()->get_user()->customer->divisions->find_all();
			$iTotalRecords = Auth::instance()->get_user()->customer->divisions->count_all();
		}

		
		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
			
		$records = array();
		$records["data"] = array();
			
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
		
		if(Auth::instance()->logged_in('admin')) {
			$divisions = ORM::factory('Division')->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
		}else {
			$divisions = Auth::instance()->get_user()->customer->divisions->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
		}
		$i=$iDisplayStart+1;
		foreach ($divisions as $division) {
			
			$records["data"][] = array($i,$division->id,$division->name,ORM::factory('Box')->where('division_id','=',$division->id)->count_all());
			$i++;
		}
		
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
		
		echo json_encode($records);
		die;
	}
	
	public function action_getBoxesPerDivisionReport() {
		/*
		 * data[i] = {
                    label: "Series" + (i + 1),
                    data: Math.floor(Math.random() * 100) + 1
                };
		 */
		$report = array();
		$i = 0;
		
		if(Auth::instance()->logged_in('admin')) {
			$divisions = ORM::factory('Division')->find_all();
		}else {
			$divisions = Auth::instance()->get_user()->customer->divisions->find_all();
		}
		
		foreach ($divisions as $division) {
			$report[$i] = array("label"=>"Dział ".$division->name,"data"=>ORM::factory('Box')->where('division_id','=',$division->id)->count_all());
			$i++;
		}
		
		echo json_encode($report);
	}
	
	public function action_check_bulkpacking() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			$user=Auth::instance()->get_user();
			if($user->id > 0) {
				$bulckpackaging = ORM::factory('BulkPackaging')->where('id', '=', (int) $_POST['id'])->find();
				if($bulckpackaging->loaded()) {
					echo json_encode(array('status'=>'OK','id'=>$bulckpackaging->id));
					die;
				}else {
					echo json_encode(array('status'=>'NOTOK'));
					die;
				}
			}else {
				echo json_encode(array('status'=>'NOTOK'));
				die;
			}
		}
	}
	
	public function action_check_virtualbriefcase() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			$user=Auth::instance()->get_user();
			if($user->id > 0) {
				$virtualbriefcase = ORM::factory('VirtualBriefcase')->where('id', '=', (int) $_POST['id'])->find();
				if($virtualbriefcase->loaded()) {
					echo json_encode(array('status'=>'OK','id'=>$virtualbriefcase->id));
					die;
				}else {
					echo json_encode(array('status'=>'NOTOK'));
					die;
				}
			}else {
				echo json_encode(array('status'=>'NOTOK'));
				die;
			}
		}
	}
	
	public function action_choose_box() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			Session::instance()->set('chosen_box', $_POST['id']);
			echo json_encode(array('status'=>'OK'));
		}
	}
	
	public function action_clear_chosen_box() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			Session::instance()->delete('chosen_box');
			echo json_encode(array('status'=>'OK'));
		}
	}
	
	public function action_choose_bulkpacking() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			Session::instance()->set('chosen_bulkpacking', $_POST['id']);
			echo json_encode(array('status'=>'OK'));
		}
	}
	
	public function action_clear_chosen_bulkpacking() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			Session::instance()->delete('chosen_bulkpacking');
			echo json_encode(array('status'=>'OK'));
		}
	}
	
	public function action_choose_virtualbriefcase() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			Session::instance()->set('chosen_virtualbriefcase', $_POST['id']);
			echo json_encode(array('status'=>'OK'));
		}
	}
	
	public function action_clear_chosen_virtualbriefcase() {
		$log=Kohana_Log::instance();
	
		$log->add(Log::DEBUG,"Success:".serialize($_POST)."\n");
		if($this->request->method()===HTTP_Request::POST) {
			Session::instance()->delete('chosen_virtualbriefcase');
			echo json_encode(array('status'=>'OK'));
		}
	}
		
	
	public function action_get_boxes_file() {

		$user = Auth::instance()->get_user();
		$order=Order::instance();
		$customer=$user->customer;
		$divisions = $customer->divisions->find_all();
		$divisions_ids= array();
		$virtualbriefcases = array();
		$warehouses = $customer->warehouses->find_all();
		$warehouses_ids = array();
		$storagecategories = ORM::factory('StorageCategory')->find_all();
			
		foreach ($divisions as $division) {
			array_push($divisions_ids, $division->id);
	
		}
	
		$virtualbriefcases = ORM::factory('VirtualBriefcase')->where('division_id','IN',$divisions_ids)->find_all();
	
		foreach ($warehouses as $warehouse) {
			array_push($warehouses_ids, $warehouse->id);
		}
		$spreadsheet = Spreadsheet::factory( array(
												'path'=>APPPATH."cache".DIRECTORY_SEPARATOR,
												'name'=>'pudla_'.date('Y-m-d'),
												'format'=>'CSV',
		));

		$spreadsheet->set_active_worksheet(0);
	
		$as = $spreadsheet->get_active_worksheet();
		
				
		$data = array (
				'columns' => array (UTF8::strtoupper("Kod pudła")),
				'rows'=>array(),
		);
		
		if(Auth::instance()->logged_in('admin')) {
			$boxes = ORM::factory('Box')->where('lock', '=', 0)->and_where('status','=','Na magazynie')->find_all();
		}else {
			$boxes = ORM::factory('Box')->where('division_id','IN',$divisions_ids)->and_where('status','=','Na magazynie')->and_where('lock', '=', 0)->find_all();
		}
		
	
		foreach ($boxes as $box) {
			array_push ( $data['rows'], array (sprintf('%012d',$box->barcode)));
		}
				
		//$data['formats']=array(0=>'############');
		
		$spreadsheet->set_data( $data, FALSE );
		$spreadsheet->send();
		die;

	}
	
	public function action_get_events() {
		
		$user=Auth::instance()->get_user();
		
		$orders = array();
		
		if(Auth::instance()->logged_in('admin') || Auth::instance()->logged_in('manager')) {
			
			$orders = ORM::factory('Order');
			
			if($_GET['start']) {
				$orders = $orders->where('create_date', '>=', $_GET['start']);
			}
			
			if($_GET['end']) {
				$orders = $orders->and_where('create_date', '<=', $_GET['end']);
			}
			
			$orders = $orders->find_all();
			
			
			
		}else {
			$orders = $user->orders;
				
			if($_GET['start']) {
				$orders = $orders->where('create_date', '>=', $_GET['start']);
			}
				
			if($_GET['end']) {
				$orders = $orders->and_where('create_date', '<=', $_GET['end']);
			}
				
			$orders = $orders->find_all();
			
		}
		
		$events = array();
		
		foreach ($orders as $order) {
			$e = array();
			$e['title'] = $order->type;
			$e['start'] = $order->create_date;
			$e['url'] = URL::site('order/view_order').'/'.$order->id;
			array_push($events, $e);
		}
		
		echo json_encode($events);
		die;
	}
	
	public function action_divisions_list() {
	
		$divisions = NULL;
		$divisions_count = 0;
	
		$columns = array(
				'name',
				'description',
				'id',
				'customer_id',);
	
		if(Auth::instance()->logged_in('admin') || Auth::instance()->logged_in('operator')) {
			$divisions = ORM::factory('Division');
			$divisions_count = ORM::factory('Division');
		}else {
			$customer=Auth::instance()->get_user()->customer;
			$divisions = $customer->divisions;
			$divisions_count = $customer->divisions;
		}
	
		if($_POST['action'] == 'filter' ) {
	
			$divisions = $divisions->where('Division.id','>','0');
			
			if($_POST['customer'] != NULL) {
				$divisions = $divisions->join('customers')->on('customers.id','=','Division.customer_id')->where('customers.name','LIKE',"%".$_POST['customer']."%")->or_where('customers.nip','LIKE',"%".$_POST['customer']."%")->or_where('customers.regon','LIKE',"%".$_POST['customer']."%")->or_where('customers.code','LIKE',"%".$_POST['customer']."%");
				$divisions_count = $divisions_count->join('customers')->on('customers.id','=','Division.customer_id')->where('customers.name','LIKE', "%".$_POST['customer']."%")->or_where('customers.nip','LIKE',"%".$_POST['customer']."%")->or_where('customers.regon','LIKE',"%".$_POST['customer']."%")->or_where('customers.code','LIKE',"%".$_POST['customer']."%");
			}
				
			if($_POST['name'] != NULL) {
				$divisions = $divisions->and_where('name','LIKE','%'.$_POST['name'].'%');
				$divisions_count = $divisions_count->and_where('name','LIKE','%'.$_POST['name'].'%');
			}
	
			if($_POST['description'] != NULL) {
				$divisions = $divisions->and_where('description','LIKE',"%".$_POST['description']."%");
				$divisions_count = $divisions_count->and_where('description','LIKE',"%".$_POST['description']."%");
			}
			
		}
	
		if($_POST['order'][0]['column'] != NULL) {
			$divisions = $divisions->order_by($columns[$_POST['order'][0]['column']], $_POST['order'][0]['dir']);
	
		}
		/*
		 * Paging
		*/
		$divisions_count = $divisions_count->count_all();
	
		$iTotalRecords = $divisions_count;
		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
	
		$records = array();
		$records["data"] = array();
	
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
	
		$divisions = $divisions->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
	
		foreach ($divisions as $division) {
			$id = $division->id;
	
			$actions =" <div class=\"margin-bottom-5\">
											<button class=\"btn btn-xs green margin-bottom\" onClick=\"javascript:window.location='/customer/division_view/".$division->id."';\"><i class=\"glyphicon glyphicon-info-sign\"></i> Przegląd</button>
											<button class=\"btn btn-xs yellow division-edit margin-bottom\" onClick=\"javascript:window.location='/customer/division_edit/".$division->id."';\"><i class=\"fa fa-user\"></i> Edytuj</button>
									</div>";
			
	
			$records["data"][] = array(
					$division->name,
					$division->description,
					$division->boxes->count_all(),
					(Auth_ORM::instance()->logged_in('admin') ? $division->customer->name ."<br />NIP: ". $division->customer->nip: NULL),
					$actions
			);
		}
	
		if (isset($_REQUEST["customActionType"]) && $_REQUEST["customActionType"] == "group_action") {
			$records["customActionStatus"] = "OK"; // pass custom message(useful for getting status of group actions)
			$records["customActionMessage"] = "Group action successfully has been completed. Well done!"; // pass custom message(useful for getting status of group actions)
		}
	
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
	
		echo json_encode($records);
		die;
	
	}
	
	public function action_places_list() {
	
		$places = NULL;
		$places_count = 0;
		
		$columns = array(
				'id',
				'barcode',
				'description',
				'status',);
	
		if(Auth::instance()->logged_in('admin') || Auth::instance()->logged_in('operator')) {
			$places = ORM::factory('Place');
			$places_count = ORM::factory('Place');
		}

		


		if($_POST['action'] == 'filter' ) {
				
			$places = $places->where('id','>','0');
				
			if($_POST['id'] != NULL) {
				$places = $places->and_where('id','=',$_POST['id']);
				$places_count = $places_count->and_where('id','=',$_POST['id']);
			}
				
			if($_POST['barcode'] != NULL) {
				$places = $places->and_where('barcode','=',$_POST['barcode']);
				$places_count = $places_count->and_where('barcode','=',$_POST['barcode']);
			}
				
			if($_POST['description'] != NULL) {
				$places = $places->and_where('description','LIKE',"%".$_POST['description']."%");
				$places_count = $places_count->and_where('description','LIKE',"%".$_POST['description']."%");
			}
			
				
			if($_POST['status'] != NULL) {
				$places = $places->and_where('status','=',$_POST['status']);
				$places_count = $places_count->and_where('status','=',$_POST['status']);
			}
		}		
		
		if($_POST['order'][0]['column'] != NULL) {
			$places = $places->order_by($columns[$_POST['order'][0]['column']], $_POST['order'][0]['dir']);
		
		}
		/*
		 * Paging
		*/
		$places_count = $places_count->count_all();
		
		$iTotalRecords = $places_count;
		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
	
		$records = array();
		$records["data"] = array();
	
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
		
		$places = $places->limit($iDisplayLength)->offset($iDisplayStart)->find_all();
	
		foreach ($places as $place) {
			$id = $place->id;
	
			$actions = "<div class=\"margin-bottom-5\">".
					"<button class=\"btn btn-xs green margin-bottom\" onClick=\"javascript:window.location='/warehouse/place_view/".$place->id."'\">".
					"<i class=\"glyphicon glyphicon-info-sign\"></i> Przegląd	</button><br />".
					"<button class=\"btn btn-xs yellow margin-bottom\"	onClick=\"javascript:window.location='/warehouse/place_edit/".$place->id."'\">".
					"<i class=\"fa fa-user\"></i> Edytuj	</button><br />".
					"<!-- <button class=\"btn btn-xs red place-delete margin-bottom\" id=\"".$place->id."\">	<i class=\"fa fa-recycle\"></i> Usuń </button> -->".
					"</div>";
				
			$records["data"][] = array(
					sprintf('%012d',$place->id),
					//"<img alt=\"barcode\" src=\"/barcode/get/".$place->barcode."\"/>",
					$place->description,
					$place->status,
					$place->boxes->count_all(),
					$place->capacity,
					$actions
			);
		}
	
		if (isset($_REQUEST["customActionType"]) && $_REQUEST["customActionType"] == "group_action") {
			$records["customActionStatus"] = "OK"; // pass custom message(useful for getting status of group actions)
			$records["customActionMessage"] = "Group action successfully has been completed. Well done!"; // pass custom message(useful for getting status of group actions)
		}
	
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
	
		echo json_encode($records);
		die;
	
	}
	
	public function action_boxes_list() {
		
		$customer=Auth::instance()->get_user()->customer;
		$storagecategory = ORM::factory('StorageCategory');
		$storagecategories = $storagecategory->find_all();

		$boxes = NULL;
		$boxes_count = 0;
		
		if(Auth::instance()->logged_in('admin') || Auth::instance()->logged_in('manager')) {
			$boxes = ORM::factory('Box');
			$boxes_count = ORM::factory('Box');
		}
		elseif(Auth::instance()->logged_in('operator')){
			$warehouses = $customer->warehouses->find_all();
			$warehouses_ids= array();
			$boxes = array();
			foreach ($warehouses as $warehouse) {
				array_push($warehouses_ids, $warehouse->id);
			}
			$boxes = ORM::factory('Box')->where('warehouse_id','IN', $warehouses_ids);
			$boxes_count = ORM::factory('Box')->where('warehouse_id','IN', $warehouses_ids);
		}
		elseif(Auth::instance()->logged_in('login')) {
			$user = Auth::instance()->get_user();
			$divisions = $user->divisions->find_all();
			$divisions_ids= array();
			$boxes = array();
			foreach ($divisions as $division) {
				array_push($divisions_ids, $division->id);
					
			}
			$boxes = ORM::factory('Box')->where('division_id','IN', $divisions_ids);
			$boxes_count = ORM::factory('Box')->where('division_id','IN', $divisions_ids);
		}	
		/*
		 * Paging
		*/
		$columns = array(
			'id',
			'barcode',
			'place_id',
			'warehouse_id',
			'division_id',
			'date_from',
			'date_to',
			'status');
		
		if($_POST['action'] == 'filter' ) {
			
			$boxes = $boxes->where('id','>','0');
			
			if($_POST['id'] != NULL) {
				$boxes = $boxes->and_where('id','=',$_POST['id']);
				$boxes_count = $boxes_count->and_where('id','=',$_POST['id']);
			}
			
			if($_POST['barcode'] != NULL) {
				$boxes = $boxes->and_where('barcode','=',$_POST['barcode']);
				$boxes_count = $boxes_count->and_where('barcode','=',$_POST['barcode']);
			}
			
			if($_POST['place_id'] != NULL) {
				$boxes = $boxes->and_where('place_id','IN',DB::expr("(SELECT id FROM places WHERE barcode='".str_replace("-","",$_POST['place_id']."')")));
				$boxes_count = $boxes_count->and_where('place_id','IN',DB::expr("(SELECT id FROM places WHERE barcode='".str_replace("-","",$_POST['place_id']."')")));
			}
			if($_POST['warehouse_name'] != NULL) {
				$boxes = $boxes->and_where('warehouse_id','=',ORM::factory('Warehouse')->where('name','LIKE','%'.$_POST['warehouse_name'].'%')->find()->id);
				$boxes_count = $boxes_count->and_where('warehouse_id','=',ORM::factory('Warehouse')->where('name','LIKE','%'.$_POST['warehouse_name'].'%')->find()->id);
			}
			
			if($_POST['customer'] != NULL) {
				$customers = ORM::factory('Customer')->where('name','LIKE','%'.$_POST['customer'].'%')->find_all();
				$divisions_ids_filter = array();
				
				foreach ($customers as $customer) {
					foreach ($customer->divisions->find_all() as $division) {
						array_push($divisions_ids_filter , $division->id);
					}
				}
				
				$boxes = $boxes->and_where('division_id','IN',$divisions_ids_filter);
				$boxes_count = $boxes_count->and_where('division_id','IN',$divisions_ids_filter);
			}
			
			if($_POST['date_from'] != NULL) {
				$boxes = $boxes->and_where('date_from','=',$_POST['date_from']);
				$boxes_count = $boxes_count->and_where('date_from','=',$_POST['date_from']);
			}
			
			if($_POST['date_to'] != NULL) {
				$boxes = $boxes->and_where('date_to','=',$_POST['date_to']);
				$boxes_count = $boxes_count->and_where('date_to','=',$_POST['date_to']);
			}
			
			if($_POST['status'] != NULL) {
				$boxes = $boxes->and_where('status','=',$_POST['status']);
				$boxes_count = $boxes_count->and_where('status','=',$_POST['status']);
			}
		}
		
		if($_POST['order'][0]['column'] != NULL) {
			$boxes = $boxes->order_by($columns[$_POST['order'][0]['column']], $_POST['order'][0]['dir']);
			
		}
		

		$boxes_count = $boxes_count->count_all();
		
		$iTotalRecords = $boxes_count;
		$iDisplayLength = intval($_REQUEST['length']);
		$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
		$iDisplayStart = intval($_REQUEST['start']);
		$sEcho = intval($_REQUEST['draw']);
		
		$records = array();
		$records["data"] = array();
		
		$end = $iDisplayStart + $iDisplayLength;
		$end = $end > $iTotalRecords ? $iTotalRecords : $end;
		
		$boxes = $boxes->limit($iDisplayLength)->offset($iDisplayStart);
		
		$boxes = $boxes->find_all();
		
		
		foreach ($boxes as $box) {			
			$id = $box->id;
		
			$actions = "<div class=\"margin-bottom-5\">".
				"<button class=\"btn btn-xs green margin-bottom\" onClick=\"javascript:window.location='/warehouse/box_view/".$box->id."'\">".
				"<i class=\"glyphicon glyphicon-info-sign\"></i> Przegląd	</button><br />".
				"<button class=\"btn btn-xs yellow margin-bottom\"	onClick=\"javascript:window.location='/warehouse/box_edit/".$box->id."'\">".
				"<i class=\"fa fa-user\"></i> Edytuj	</button><br />".
				"<!-- <button class=\"btn btn-xs red box-delete margin-bottom\" id=\"".$box->id."\">	<i class=\"fa fa-recycle\"></i> Usuń </button> -->".
				"</div>";
			
			$records["data"][] = array(
						//$box->id,
						sprintf('%012d',$box->barcode),
						//($box->place_id != '' ? '<img alt="barcode" src="/barcode/get/'.$box->place->barcode.'"/>':''),
						($box->place_id != '' ? $box->place->description : sprintf('%012d',0) ),
						$box->warehouse->name,
						$box->division->customer->name,
						$box->date_from,
						$box->date_to,
						$box->status,
						$actions
			);
		}
		
		if (isset($_REQUEST["customActionType"]) && $_REQUEST["customActionType"] == "group_action") {
			$records["customActionStatus"] = "OK"; // pass custom message(useful for getting status of group actions)
			$records["customActionMessage"] = "Group action successfully has been completed. Well done!"; // pass custom message(useful for getting status of group actions)
		}
		
		$records["draw"] = $sEcho;
		$records["recordsTotal"] = $iTotalRecords;
		$records["recordsFiltered"] = $iTotalRecords;
		
		echo json_encode($records);
		die;
	}
	
	
public function action_division_boxes_list() {
		
		$customer=Auth::instance()->get_user()->customer;
		$storagecategory = ORM::factory('StorageCategory');
		$storagecategories = $storagecategory->find_all();

		$boxes = NULL;
		$boxes_count = 0;
		
		if($this->request->param('id') > 0) {
			
			$divisions_id = $this->request->param('id');
			
			
			$boxes = ORM::factory('Box')->where('division_id','=',$divisions_id);
			$boxes_count = ORM::factory('Box')->where('division_id','=',$divisions_id);
			
	
			/*
			 * Paging
			*/
			$columns = array(
				'id',
				'barcode',
				'place_id',
				'warehouse_id',
				'division_id',
				'date_from',
				'date_to',
				'status');
			
				
			
			if($_POST['action'] == 'filter' ) {
				
				
				if($_POST['id'] != NULL) {
					$boxes = $boxes->and_where('id','=',$_POST['id']);
					$boxes_count = $boxes_count->and_where('id','=',$_POST['id']);
				}
				
				if($_POST['barcode'] != NULL) {
					$boxes = $boxes->and_where('barcode','=',$_POST['barcode']);
					$boxes_count = $boxes_count->and_where('barcode','=',$_POST['barcode']);
				}
				
				if($_POST['place_id'] != NULL) {
					$boxes = $boxes->and_where('place_id','=',$_POST['place_id']);
					$boxes_count = $boxes_count->and_where('place_id','=',$_POST['place_id']);
				}
				
				if($_POST['date_from'] != NULL) {
					$boxes = $boxes->and_where('date_from','=',$_POST['date_from']);
					$boxes_count = $boxes_count->and_where('date_from','=',$_POST['date_from']);
				}
				
				if($_POST['date_to'] != NULL) {
					$boxes = $boxes->and_where('date_to','=',$_POST['date_to']);
					$boxes_count = $boxes_count->and_where('date_to','=',$_POST['date_to']);
				}
				
				if($_POST['status'] != NULL) {
					$boxes = $boxes->and_where('status','=',$_POST['status']);
					$boxes_count = $boxes_count->and_where('status','=',$_POST['status']);
				}
			}
			
			if($_POST['order'][0]['column'] != NULL) {
				$boxes = $boxes->order_by($columns[$_POST['order'][0]['column']], $_POST['order'][0]['dir']);
				
			}
			
	
			$boxes_count = $boxes_count->count_all();
			
			$iTotalRecords = $boxes_count;
			$iDisplayLength = intval($_REQUEST['length']);
			$iDisplayLength = $iDisplayLength < 0 ? $iTotalRecords : $iDisplayLength;
			$iDisplayStart = intval($_REQUEST['start']);
			$sEcho = intval($_REQUEST['draw']);
			
			$records = array();
			$records["data"] = array();
			
			$end = $iDisplayStart + $iDisplayLength;
			$end = $end > $iTotalRecords ? $iTotalRecords : $end;
			
			$boxes = $boxes->limit($iDisplayLength)->offset($iDisplayStart);
			
			$boxes = $boxes->find_all();
			
			
			foreach ($boxes as $box) {			
				$id = $box->id;
			
				$actions = "<div class=\"margin-bottom-5\">".
					"<button class=\"btn btn-xs green margin-bottom\" onClick=\"javascript:window.location='/warehouse/box_view/".$box->id."'\">".
					"<i class=\"glyphicon glyphicon-info-sign\"></i> Przegląd	</button><br />".
					"<button class=\"btn btn-xs yellow margin-bottom\"	onClick=\"javascript:window.location='/warehouse/box_edit/".$box->id."'\">".
					"<i class=\"fa fa-user\"></i> Edytuj	</button><br />".
					"<!-- <button class=\"btn btn-xs red box-delete margin-bottom\" id=\"".$box->id."\">	<i class=\"fa fa-recycle\"></i> Usuń </button> -->".
					"</div>";
				
				$records["data"][] = array(
							$box->id,
							'<img alt="barcode" src="/barcode/get/'.$box->barcode.'"/>',
							($box->place_id != '' ? '<img alt="barcode" src="/barcode/get/'.$box->place->barcode.'"/>':''),
							$box->date_from,
							$box->date_to,
							$box->status,
							$actions
				);
			}
			
			if (isset($_REQUEST["customActionType"]) && $_REQUEST["customActionType"] == "group_action") {
				$records["customActionStatus"] = "OK"; // pass custom message(useful for getting status of group actions)
				$records["customActionMessage"] = "Group action successfully has been completed. Well done!"; // pass custom message(useful for getting status of group actions)
			}
			
			$records["draw"] = $sEcho;
			$records["recordsTotal"] = $iTotalRecords;
			$records["recordsFiltered"] = $iTotalRecords;
			
			echo json_encode($records);
			die;
		}
	}
	
	
	
	public function action_index() {
		
	}
	
	public function action_get_utilisation_document_pdf() {

		//TODO Szablon dokumentu utylizacji / wypełnianie treścią
		
		if($this->request->method()===HTTP_Request::POST) {

			$order=Order::instance($_POST['order_id']);
			
			$document_css .= file_get_contents(DOCROOT.ASSETS_GLOBAL_PLUGINS."bootstrap/css/bootstrap.min.css");
			$document_css .= file_get_contents(DOCROOT.ASSETS_GLOBAL_PLUGINS."bootstrap-switch/css/bootstrap-switch.min.css");
			$document_css .= file_get_contents(DOCROOT.ASSETS_GLOBAL_CSS."components.css");
			$document_css .= file_get_contents(DOCROOT.ASSETS_GLOBAL_PLUGINS.'datatables/plugins/bootstrap/dataTables.bootstrap.css');
			$document_css .= file_get_contents(DOCROOT.ASSETS_GLOBAL_CSS."plugins.css");
			$document_css .= file_get_contents(DOCROOT.ASSETS_ADMIN_LAYOUT_CSS."layout.css");
			$document_css .= file_get_contents(DOCROOT.ASSETS_ADMIN_PAGES_CSS.'order_document.css');
			
			$document_template = View_MPDF::factory('templates/utilisation_document_template');
			$document_template->bind('order',$order);
			$document_filename=time()."-".Auth_ORM::instance()->get_user()->id."-".$_POST['order_id'].".pdf";
			
			$document_template->get_mpdf()->SetDisplayMode('fullpage');
			$document_template->get_mpdf()->WriteHTML($document_css,1);
			
			$document_template->write_to_disk(PDF.$document_filename);
			
			$pdf = EasyRSA::signFile(PDF.$document_filename);
				
			$pdf->Output(PDF.$document_filename,F);
				
			echo json_encode(array('status'=>'OK','url'=>URL::base().'public/pdf/'.$document_filename));
		die;
		}else  {
			echo json_encode(array('status'=>'OK','body'=>'<br><br>Dokument<br><br>'));
			die;
		}
		
	
	}
	
	public function action_get_utilisation_document() {
		
		
		if($this->request->method()===HTTP_Request::POST) {
			
			$order=Order::instance($_POST['order_id']);
			
			$document_template = View::factory('templates/utilisation_document_template');
			
			$document_template->bind('order',$order);
			
			
			$document = $document_template->render();
			
			echo json_encode(array('status'=>'OK','body'=>base64_encode($document)));
			die;
			
		}else {
			echo json_encode(array('status'=>'OK','body'=>'<br><br>Dokument<br><br>'));
			die;
		}

	}
	
	public function action_get_user_notifications() {
		$user=Auth_ORM::instance()->get_user();
		
		if($user) {
			$notification=$user->notifications->where('status','=','0')->find();
		
			if($notification->loaded()) {
				$notification->status=1;
				if($notification->update()) {
					echo json_encode(array('status'=>'OK',
							   'message'=>$notification->message));
					die;
				}
			}else {
				echo json_encode(array('status'=>'EMPTY'));
				die;
			}
		}
	}
	
	public function action_check_box() {
		if($this->request->method()===HTTP_Request::POST) {
			$user=Auth::instance()->get_user();
			if($user->id > 0) {
				$box = ORM::factory('Box')->where('barcode', '=', (int) $_POST['id'])->and_where('status','=','Na magazynie')->find();
				if($box->loaded()) {
					echo json_encode(array('status'=>'OK','id'=>$box->id));
					die;
				}else {
					echo json_encode(array('status'=>'NOTOK'));
					die;
				}	
			}else {
				echo json_encode(array('status'=>'NOTOK'));
				die;
			}
		}
	}
	
	public function action_check_box_barcode() {
		if($this->request->method()===HTTP_Request::POST) {
			$user=Auth::instance()->get_user();
			if($user->id > 0) {
					$box = ORM::factory('Box')->where('barcode', '=', $_POST['barcode'])->find();
					if($box->loaded()) {
						echo json_encode(array('status'=>'OK','id'=>$box->id));
						die;
					}else {
						echo json_encode(array('status'=>'NOTOK'));
						die;
					}	
			}else {
					echo json_encode(array('status'=>'NOTOK'));
					die;
			}
		}
	}
	
	public function action_get_box_content() {
		if($this->request->method()===HTTP_Request::POST) {
			$user=Auth::instance()->get_user();
			if($user->id > 0) {
				$box = ORM::factory('Box')->where('id', '=', $_POST['id'])->find();
				$result = array();
				if($box->warehouse->customer == $user->customer) {
					
					foreach ($box->documents->find_all() as $doc) {
						array_push($result, array("doc_id"=>$doc->id,"doc_name"=>$doc->name));
					}
				
					echo json_encode(array('status'=>'OK','id'=>$box->id,'result'=>$result));
					die;
				}else {
					echo json_encode(array('status'=>'NOTOK'));
					die;
				}
			}else {
				echo json_encode(array('status'=>'NOTOK'));
				die;
			}
		}
	}
	public function action_generate_password() {
		echo json_encode(array('status'=>'OK',
							   'password'=>Text::random()));
		die;	
	}
	
	public function action_check_user_availability() {
		
		$user=(ORM::factory('User')->where('username','=',$this->request->post('username'))->find());
				
		if($user->loaded()===TRUE) {
				echo json_encode(array('status'=>'NOTOK'));
				die;
		}else {
			echo json_encode(array('status'=>'OK'));
			die;
		}
	}
	
	public function action_check_email_availability() {
		$user=(ORM::factory('User')->where('email','=',$this->request->post('email'))->find());
		if($user->loaded()===TRUE) {
			echo json_encode(array('status'=>'NOTOK'));
			die;
		}
		else {
			echo json_encode(array('status'=>'OK'));
			die;
		}
	}
}