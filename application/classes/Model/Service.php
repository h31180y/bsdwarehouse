<?php
 
/**
 * include the library files and the model
 */
 
class Model_Service extends Model
{
    /**
     * doCheck this is a ping method
     * @param   string $params
     *
     * @return  bool
     */
    public function doCheck($params)
    {
        return (bool) true;
    }


    /**
     * getCompanyRegions get company regions
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyRegions($company_id)
    {

        $regions = ORM::factory('Region')->where('company_id','=',$company_id)->find_all();


        $result_array = array();

	foreach($regions as $region) {
    		array_push($result_array, $region->as_array());
        }

        return $result_array;
    }

    /**
     * getCompanyStockChanges get company stock changes
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyStockChanges($company_id)
    {

        $stock_changes = ORM::factory('StockChange')->where('company_id','=',$company_id)->find_all();


        $result_array = array();

	foreach($stock_changes as $sc) {
    		array_push($result_array, $sc->as_array());
        }

        return $result_array;
    }
    

    /**
     * getCompanyVirtualStockChanges get company virtual stock changes
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyVirtualStockChanges($company_id)
    {

        $virtual_stock_users = ORM::factory('User')->where('company_id','=',$company_id)->find_all();


        $result_array = array();

	foreach($virtual_stock_users as $vsu) {
	    $virtual_stock_changes = $vsu->virtual_stock_changes->find_all();
	    
	    foreach($virtual_stock_changes as $vsc) {
    		array_push($result_array, $vsc->as_array());
    	    }
        }

        return $result_array;
    }
    

    /**
     * virtualStockMove do a virtual stock move
     * @param   string $company_id
     * @param   string $rep_id
     * @param	array $rep_stock
     * @param	string $pm_id
     *
     * @return  array
     */
    public function virtualStockMove($company_id,$rep_id,$rep_stock,$pm_id) {
	
	$stock_updated = true;
	
	try {
	    
	    Log::instance()->add(Log::DEBUG,"--Virtual stock move");

	    Log::instance()->add(Log::DEBUG,"RepId:".$rep_id);
	    Log::instance()->add(Log::DEBUG,"PMId:".$pm_id);
	    Log::instance()->add(Log::DEBUG,"Stock:".serialize($rep_stock));
	    
	    if($company_id && $rep_id && $rep_stock) {
        
    	        $user = ORM::factory('User',$rep_id);
		
    	        if($user->loaded()) {
        
		    foreach($rep_stock as $rs) {
    		        $stock_data = $rs->string;

			Log::instance()->add(Log::DEBUG,"Stock Data:".serialize($stock_data));

			//Wycofanie z magazynu - stock równy 0 

		        if($stock_data[0] > 0 && $stock_data[1] < 0) {
		    	    
		    	    $stock_data[1] = 0;
		    	    
		    	    $product = ORM::factory('Product')->where('id','=',$stock_data[0])->find();
			    $virtual_stock = ORM::factory('VirtualStock')->where('user_id','=',$rep_id)->and_where('product_id','=',$stock_data[0])->find();
    			    $stockChange = $virtual_stock->stock;
    			    Log::instance()->add(Log::DEBUG,"Move from Virtual to Central:".$product->current_stock);

    			    Log::instance()->add(Log::DEBUG,"--Product stock 1:".$product->current_stock);
    			    Log::instance()->add(Log::DEBUG,"--Stock change 1:".$stockChange);

    			    $currentStock = $product->current_stock+$stockChange;
		    
		    	    if($virtual_stock->loaded()) {
			        if($virtual_stock->stock > $stock_data[1]) {

    				    $stock_change = ORM::factory('StockChange');
	    
    				    $stock_change->product_id		= $stock_data[0];
	    	    		    $stock_change->company_id		= $company_id;
				    $stock_change->stock_change_date 	= date('Y-m-d H:i:s');
				    $stock_change->user_id			= $pm_id;
				    $stock_change->stock_change 		= $stockChange;
				    $stock_change->current_stock		= $currentStock;
		    		    $stock_change->stock_change_description	= "Przesunięcie z: " . $user->name." ".$user->surname." do magazynu centralnego";
				    
				    DB::query('START TRANSACTION');
		        
		    		    if($stock_change->save() ) {

				        $virtual_stock_change = ORM::factory('VirtualStockChange');
				        $virtual_stock_change->product_id		= $stock_data[0];
				        $virtual_stock_change->product_count	= $virtual_stock->stock * -1;
				        $virtual_stock_change->product_add_date	= date('Y-m-d H:i:s');
				        $virtual_stock_change->user_id		= $pm_id;
				        
				        DB::query('START TRANSACTION');
			    	        if($virtual_stock_change->save()) {
			    		    $virtual_stock->stock = $stock_data[1];
				
					    $product->current_stock = $currentStock;
				    	    Log::instance()->add(Log::DEBUG,"--Current Stock:".$currentStock);
			    
					    $product->last_stock_change = $stock_change->stock_change_date;
					    $product->value = $product->current_stock*$product->price;
					    
					    DB::query('START TRANSACTION');
					    if($product->update()) {
			    			DB::query('COMMIT');    
			    			DB::query('START TRANSACTION');
			    			if($virtual_stock->update()) {
			    			    DB::query('COMMIT');    
			    		    	    Log::instance()->add(Log::DEBUG,"--Virtual stock move end");
			    			}else {
			    			    DB::query('ROLLBACK');
			    		    	    return array("error"=>"Could not move the stock");        
			    			}
			    		    }else {
			    			DB::query('ROLLBACK');
			    		        return array("error"=>"Could not move the stock");        
			    		    }
			    	        }else {
			    	    	    DB::query('ROLLBACK');
			    		    return array("error"=>"Could not move the stock");        
			    	        }		
				    }else{
					DB::query('ROLLBACK');
				        return array("error"=>"Could not move the stock");        
				    }
			        }else {
			    	    $stock_updated = false;
			        }
			    }
		        }
		        
		        
		        if($stock_data[0] > 0 && $stock_data[1] > 0) {
		    	    $product = ORM::factory('Product')->where('id','=',$stock_data[0])->find();
			    $virtual_stock = ORM::factory('VirtualStock')->where('user_id','=',$rep_id)->and_where('product_id','=',$stock_data[0])->find();
    			
    			    $stockChange = $virtual_stock->stock+($stock_data[1]*-1);

    			    Log::instance()->add(Log::DEBUG,"Move from Central to user Virtual Warehouse:".$rep_id);

    			    Log::instance()->add(Log::DEBUG,"--Product stock 2:".$product->current_stock);
    			    Log::instance()->add(Log::DEBUG,"--Stock change 2:".$stockChange);
    			    
    			    $currentStock = $product->current_stock+$stockChange;

			    if($virtual_stock->loaded()) {
    				$stock_change = ORM::factory('StockChange');
	    
    				$stock_change->product_id		= $stock_data[0];
	    	    		$stock_change->company_id		= $company_id;
				$stock_change->stock_change_date 	= date('Y-m-d H:i:s');
				$stock_change->user_id			= $pm_id;
				$stock_change->stock_change 		= $stockChange;
				$stock_change->current_stock		= $currentStock;
		    		$stock_change->stock_change_description	= "Przesunięcie do: ". $user->name." ".$user->surname;
				    
				DB::query('START TRANSACTION');
		        
		    		if($stock_change->save() ) {

				    $virtual_stock_change = ORM::factory('VirtualStockChange');
				    $virtual_stock_change->product_id		= $stock_data[0];
				    $virtual_stock_change->product_count	= $stock_data[1];
				    $virtual_stock_change->product_add_date	= date('Y-m-d H:i:s');
				    $virtual_stock_change->user_id		= $pm_id;
				        
				    DB::query('START TRANSACTION');
			    	    if($virtual_stock_change->save()) {
			    		$virtual_stock->stock = $stock_data[1];
					$product->current_stock = $currentStock;
					$product->last_stock_change = $stock_change->stock_change_date;
					$product->value = $product->current_stock*$product->price;
					    
					DB::query('START TRANSACTION');
					if($product->update()) {
			    	    	    DB::query('COMMIT');    
			    		    DB::query('START TRANSACTION');
			    		    if($virtual_stock->update()) {
			    		        DB::query('COMMIT');    
			    			    
			    		        Log::instance()->add(Log::DEBUG,"--Current Stock:".$currentStock);
			    		        Log::instance()->add(Log::DEBUG,"--Virtual stock move end");
			    		    	    
			    		    }else {
			    		        DB::query('ROLLBACK');
			    			return array("error"=>"Could not move the stock");        
			    		    }
			    		}else {
			    		    DB::query('ROLLBACK');
			    		    return array("error"=>"Could not move the stock");        
			    		}
			    	    }else {
			    		DB::query('ROLLBACK');
			    		return array("error"=>"Could not move the stock");        
			    	    }		
				}else{
				    DB::query('ROLLBACK');
				    return array("error"=>"Could not move the stock");        
				}
			    }else{
    			        $stock_change = ORM::factory('StockChange');
	    
    			        $stock_change->product_id		= $stock_data[0];
	    	    	        $stock_change->company_id		= $company_id;
			        $stock_change->stock_change_date 	= date('Y-m-d H:i:s');
			        $stock_change->user_id		= $pm_id;
			        $stock_change->stock_change 	= $stockChange;
			        $stock_change->current_stock		= $currentStock;
		    	        $stock_change->stock_change_description	= "Przesunięcie do: " . $user->name." ".$user->surname;
		    		
		    		DB::query('START TRANSACTION');    
		    	        if($stock_change->save() ) {
			            $virtual_stock_change = ORM::factory('VirtualStockChange');
			            $virtual_stock_change->product_id	= $stock_data[0];
			            $virtual_stock_change->product_count	= $stock_data[1];
			            $virtual_stock_change->product_add_date	= date('Y-m-d H:i:s');
			            $virtual_stock_change->user_id		= $pm_id;
				    
				    DB::query('START TRANSACTION');
				    if($virtual_stock_change->save()) {
				    
				        $stockChange = $stock_data[1] * -1;
			    	    
			    	        $virtual_stock->stock = $stock_data[1];
			    	        $virtual_stock->product_id = $product->id;
			    	        $virtual_stock->user_id = $rep_id;
			    	        
	        			Log::instance()->add(Log::DEBUG,"--Product stock 3:".$product->current_stock);
    				        Log::instance()->add(Log::DEBUG,"--Stock change 3:".$stockChange);

    					$currentStock = $product->current_stock+$stockChange;
			    	        
			    	        $product->current_stock = $currentStock;
					$product->last_stock_change = $stock_change->stock_change_date;
					$product->value = $product->current_stock*$product->price;
					    
					DB::query('START TRANSACTION');
					if($product->update()) {
			    		    DB::query('COMMIT');    
			    		    DB::query('START TRANSACTION');
			    		    if($virtual_stock->save()) {
			    		        DB::query('COMMIT');    
		    				
		    				Log::instance()->add(Log::DEBUG,"--Current Stock:".$currentStock);
			    			Log::instance()->add(Log::DEBUG,"--Virtual stock move end");
			    			
			    		    }else {
			    		        DB::query('ROLLBACK');
			    			return array("error"=>"Could not move the stock");        
			    		    }
			    	        }else {
			    	    	    DB::query('ROLLBACK');
			    	            return array("error"=>"Could not move the stock");        
			    	        }
			    	    }else {
			    		DB::query('ROLLBACK');
			    	        return array("error"=>"Could not move the stock");        
			    	    }		
			        }else{
			    	    DB::query('ROLLBACK');
				    return array("error"=>"Could not move the stock");        
			        }
			    }
		        }
		    }

		    return array("result"=>"stock_moved");        

	        }else{
	    	    DB::query('ROLLBACK');
		    return array("error"=>"Virtual Stock user not found.");        
	        }    
	    }else {
		DB::query('ROLLBACK');
	        return array("error"=>"Wrong parameters passed to the service");    
	    }
	    if(!$stock_update) {
	        return array("error"=>"No changes to stock needed.");    
	    }else {
		DB::query('ROLLBACK');
	        return array("error"=>"Too far...");    
	    }

	}catch(Exception $e) {
	    DB::query('ROLLBACK');
	    Log::instance()->add(Log::DEBUG,$e->getMessage());
	    Log::instance()->add(Log::DEBUG,$e->getLine());
	    Log::instance()->add(Log::DEBUG,$e->getTraceAsString());
	}
    }

    /**
     * getCompanyRepGroups get existing representatives groups
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyRepGroups($company_id)
    {
	$rep_groups = ORM::factory('RepGroup')->where('company_id','=',$company_id)->find_all();
	
	$result_array = array();
        
        foreach($rep_groups as $rg) {
    	    $group = $rg->as_array();
    	    $group['reps'] = array();
    	    $group['users'] = array();
    	    
    	    $reps = $rg->reps->find_all();

    	    $users = $rg->users->find_all();
    	    
    	    foreach($reps as $rep) {
    		array_push($group['reps'], $rep->as_array());
    	    }

    	    foreach($users as $user_id) {
    		$user = ORM::factory('User')->where('id','=',$user_id)->find();
    		
    		array_push($group['users'], $user->as_array());
    	    }
    	    
    	    array_push($result_array, $group);
        }
        
        return $result_array;
    }
        
    /**
     * getRepVirtualStock get existing rep virtual stock
     * @param   string $company_id
     * @param   string $rep_id
     *
     * @return  array
     */
    public function getRepVirtualStock($company_id,$rep_id)
    {

        $virtual_stock = ORM::factory('VirtualStock')->where('user_id','=',$rep_id)->find_all();

        $result_array = array();

	foreach($virtual_stock as $vs) {
    	    array_push($result_array, $vs->as_array());
        }
        
        return $result_array;
    }

    /**
     * getCompanyVirtualStocks get existing virtual stocks
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyVirtualStocks($company_id)
    {

        
        $users = ORM::factory('User')->where('company_id','=',$company_id)->find_all();


        $virtual_stocks = ORM::factory('VirtualStock')->where('user_id','IN',$users->as_array())->find_all();

//        Log::instance()->add(Log::DEBUG,serialize($virtual_stocks));

        $result_array = array();
        
        foreach($virtual_stocks as $vs) {
		
	    $products_in_orders = ORM::factory('OrderProduct')->where('product_id','=',$vs->product_id)->and_where('product_state','=',1)->and_where('product_user_id','=',$vs->user_id)->find_all();
		
	    $in_orders_stock = 0;
		
	    foreach($products_in_orders as $pio) {
	        $in_orders_stock += $pio->product_stock_change;
	    }
	    if($in_orders_stock > 0) {
		continue;	
		//$vs->stock -= $in_orders_stock;
	    }else {
    		array_push($result_array, $vs->as_array());
    	    }
        }
        
//        Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }
    
    
    /**
     * getCompanyVirtualStockParents get existing virtual stocks
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyVirtualStockParents($company_id)
    {

        
        $users = ORM::factory('User')->where('company_id','=',$company_id)
    				    ->and_where('lilly_manager','=','0')
    				    ->and_where_open()
    				    ->where('lilly_manager_id','>','0')
    				    ->or_where('lilly_manager_id_2','>','0')
    				    ->or_where('lilly_manager_id_3','>','0')
    				    ->or_where('lilly_manager_id_4','>','0')
    				    ->or_where('lilly_manager_id_5','>','0')
    				    ->or_where('lilly_manager_id_6','>','0')
    				    ->or_where('lilly_manager_id_7','>','0')
    				    ->or_where('lilly_manager_id_8','>','0')
    				    ->or_where('lilly_manager_id_9','>','0')
    				    ->or_where('lilly_manager_id_10','>','0')
    				    ->or_where('lilly_manager_id_11','>','0')
    				    ->and_where_close()
    				    ->find_all();

        $result_array = array();
        
//        Log::instance()->add(Log::DEBUG,serialize($users));
        
        foreach($users as $u) {
	    
    	    array_push($result_array, array(
    					$u->as_array()['id'] => array(
    							'lilly_manager_id' => $u->as_array()['lilly_manager_id'],
    							'lilly_manager_id_2' => $u->as_array()['lilly_manager_id_2'],
    							'lilly_manager_id_3' => $u->as_array()['lilly_manager_id_3'], 
    							'lilly_manager_id_4' => $u->as_array()['lilly_manager_id_4'], 
    							'lilly_manager_id_5' => $u->as_array()['lilly_manager_id_5'], 
    							'lilly_manager_id_6' => $u->as_array()['lilly_manager_id_6'], 
    							'lilly_manager_id_7' => $u->as_array()['lilly_manager_id_7'], 
    							'lilly_manager_id_8' => $u->as_array()['lilly_manager_id_8'], 
    							'lilly_manager_id_9' => $u->as_array()['lilly_manager_id_9'], 
    							'lilly_manager_id_10' => $u->as_array()['lilly_manager_id_10'], 
    							'lilly_manager_id_11' => $u->as_array()['lilly_manager_id_11'],
    					)
    				    )
    			);
        }
        
//        Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }
    
    /**
     * getCompanyProducts get existing products
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyProducts($company_id)
    {

        
        $products = ORM::factory('Product')->where('company_id','=',$company_id)->find_all();
        $result_array = array();
        
        foreach($products as $product) {
    	    array_push($result_array, $product->as_array());
        }
        
        //Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }

    /**
     * getProductData get existing product
     * @param   string $product_id
     *
     * @return  array
     */
    public function getProductData($product_id)
    {
        $product = ORM::factory('Product')->where('id','=',$product_id)->find();
        return $product->as_array();
    }


    /**
     * getCompanyUsers get existing users
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyUsers($company_id)
    {

        
        $users = ORM::factory('User')->where('company_id','=',$company_id)->and_where('deleted','=',0)->find_all();
        $result_array = array();
        
        foreach($users as $user) {
    	    array_push($result_array, $user->as_array());
        }
        
        //Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }


    /**
     * getCompanyProductsCount get existing products count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyProductsCount($company_id)
    {

        
        $products_count = ORM::factory('Product')->where('company_id','=',$company_id)->count_all();
        
        return $products_count;
    }


    /**
     * getCompanyAvailableProductsCount get existing products count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyAvailableProductsCount($company_id)
    {

        
        $products_count = ORM::factory('Product')->where('company_id','=',$company_id)->and_where('deleted','!=',1)->and_where('current_stock','>',0)->count_all();
        
        return $products_count;
    }


    /**
     * getCompanyOOSProductsCount get existing products count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyOOSProductsCount($company_id)
    {

        
        $products_count = ORM::factory('Product')->where('company_id','=',$company_id)->and_where('current_stock','<',1)->and_where('deleted','!=',1)->count_all();
        
        return $products_count;
    }


    /**
     * getCompanyDeletedProductsCount get existing products count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyDeletedProductsCount($company_id)
    {
        
        $products_count = ORM::factory('Product')->where('company_id','=',$company_id)->and_where('deleted','=',1)->count_all();
        
        return $products_count;
    }


    /**
     * getCompanyUserLines get exising lines
     * @param   string $user_id
     *
     * @return  array
     */
    public function getCompanyUserLines($line_id)
    {

        
        $user_lines = ORM::factory('UserLine')->where('line_id','=',$line_id)->find_all();
        $result_array = array();
        
        foreach($user_lines as $user_line) {
    	    array_push($result_array, $user_line->as_array());
        }
        
        Log::instance()->add(Log::DEBUG,$line_id.":".serialize($result_array));
        
        return $result_array;
    }

    /**
     * getCompanyLines get exising lines
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyLines($company_id)
    {

        
        $lines = ORM::factory('Line')->where('company_id','=',$company_id)->find_all();
        $result_array = array();
        
        foreach($lines as $line) {
    	    array_push($result_array, $line->as_array());
        }
        
        //Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }

    /**
     * getCompanyLinesCount get exising lines count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyLinesCount($company_id)
    {

        
        $lines_count = ORM::factory('Line')->where('company_id','=',$company_id)->count_all();
        return $lines_count;
    }


    /**
     * getCompanyMedicines get exising medicines
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyMedicines($company_id)
    {

        
        $medicines = ORM::factory('Medicine')->where('company_id','=',$company_id)->find_all();
        $result_array = array();
        
        foreach($medicines as $medicine) {
    	    array_push($result_array, $medicine->as_array());
        }
        
        //Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }

    /**
     * getCompanyMedicinesCount get exising medicines count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyMedicinesCount($company_id)
    {

        
        $medicines_count = ORM::factory('Medicine')->where('company_id','=',$company_id)->count_all();
        
        return $medicines_count;
    }


    /**
     * getCompanyCategories get exising categories
     * @param   string $company_id
     *
     * @return  array
     */
    public function getCompanyCategories($company_id)
    {

        $categories = ORM::factory('Category')->where('company_id','=',$company_id)->find_all();
        $result_array = array();
        
        foreach($categories as $category) {
    	    array_push($result_array, $category->as_array());
        }
        
        //Log::instance()->add(Log::DEBUG,serialize($result_array));
        
        return $result_array;
    }

    /**
     * getCompanyCategoriesCount get exising categories count
     * @param   string $company_id
     *
     * @return  integer
     */
    public function getCompanyCategoriesCount($company_id)
    {

        $categories_count = ORM::factory('Category')->where('company_id','=',$company_id)->count_all();
        return $categories_count;
    }

    /**
     * placeOrder place order
     * @param   string $company_id
     * @param   string $user_id
     * @param   array $items
     * @param	array $address
     * @param	string $order_remarks
     *
     * @return  array
     */
    public function placeOrder($company_id,$user_id,$items,$address,$order_remarks)
    {

	$errors = array();
	$store_products = array();
	$order_products = array();
	$store_order_increment_id = 0;
	$store_order_id = 0;
	$store_user_id = $user_id;

	foreach($items as $item) {
	    foreach($item->item as $it) {
		if($it->key == "product_id") $store_products['product_id']=$it->value;
		if($it->key == "qty") $store_products['quantity']=number_format($it->value, 0, '', '');
		if($it->key == "order_id") $store_order_id=$it->value;
		if($it->key == "order_increment_id") $store_order_increment_id=$it->value;	
	    }
	    array_push($order_products,$store_products);
	}	                  
	try {
	    $order = ORM::factory('Order');
	    $order->order_key = md5(time());
	    $order->order_user_id = $store_user_id;
	    $order->increment_id = $store_order_increment_id;
	    $order->order_status = 1;
	    
	    if($order_remarks) {
		$order->order_remarks = "Uwagi klienta: \n";
		
		$order->order_remarks .= $order_remarks;
		
		$order->order_remarks .= "\nDostawa do: \n";
	    
	    }else {

		$order->order_remarks = "Dostawa do: \n";
	    }
	    
	    Log::instance()->add(Log::DEBUG, "Received order:".$store_order_increment_id);
		    
	    $address = array_filter($address, 'trim');
	    
	    foreach($address as $addr) {
		if(strlen($addr) > 1) {
		    $order->order_remarks .= $addr."\n";
		}
	    }
	    
	    $order->order_company_id = $company_id;
    	    $order->order_archived = 0;
	    $order->order_type = 0;
	    $order->order_date = date('Y-m-d H:i:s');
	
	
	    if(!$order->save()) {
		return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
	    }
	
	    $order->order_number = $order->id."/".date("Y");


	    if(!$order->save()) {
		return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
	    }
	
	    foreach($order_products as $op) {
		$order_product = ORM::factory('OrderProduct');
		$order_product->order_id = $order->id;
		$order_product->product_id = $op['product_id'];
		$order_product->product_stock_change = $op['quantity'];
		$order_product->product_user_id = $store_user_id;
	        $order_product->product_company_id = $company_id;
	        $order_product->order_key = $order->order_key;
		
		$product = ORM::factory('Product',$op['product_id']);
		
		Log::instance()->add(Log::DEBUG, $product->loaded()."->".$product->current_stock."<>".$op['quantity']);


		$products_in_orders = ORM::factory('OrderProduct')->where('product_id','=',$op['product_id'])->and_where('product_state','=',1)->and_where('product_user_id','=',$store_user_id)->find_all();
		
		$in_orders_stock = 0;
		
		foreach($products_in_orders as $pio) {
		    $in_orders_stock += $pio->product_stock_change;
		}
		
		Log::instance()->add(Log::DEBUG, "In orders stock:".$in_orders_stock);
				
		if($product->loaded()==1 && $product->current_stock >= ($op['quantity']+$in_orders_stock)) {
		    if($op['quantity'] > 0) {
			if(!$order_product->save()) {
			    $order->delete();
			    return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
			}
		    }
		}else {
		    $order->delete();
		    return array("error"=>"Quantity on order for ".$product->name." is more than it's stock, please lower down the quantity and place new order");

		}
	    }
	    Log::instance()->add(Log::DEBUG, "Order placed sucessfully:".$store_order_increment_id);
	    return array("result"=>"order_placed");
	}catch(Exception $e) {
	    if($order->loaded()) $order->delete();
	    return array("error"=>$e->getMessage());
	}
    }

    /**
     * placeVirtualStockOrder place virtual stock order
     * @param   string $company_id
     * @param   string $user_id
     * @param   array $items
     * @param	array $address
     * @param	string $order_remarks
     *
     * @return  array
     */
    public function placeVirtualStockOrder($company_id,$user_id,$items,$address,$order_remarks)
    {

	$errors = array();
	$store_products = array();
	$order_products = array();
	$store_order_increment_id = 0;
	$store_order_id = 0;
	$store_user_id = $user_id;

	foreach($items as $item) {
	    foreach($item->item as $it) {
		if($it->key == "product_id") $store_products['product_id']=$it->value;
		if($it->key == "qty") $store_products['quantity']=number_format($it->value, 0, '', '');
		if($it->key == "order_id") $store_order_id=$it->value;
		if($it->key == "order_increment_id") $store_order_increment_id=$it->value;	
	    }
	    array_push($order_products,$store_products);
	}	                  
	try {
	    $order = ORM::factory('Order');
	    $order->order_key = md5(time());
	    $order->order_user_id = $store_user_id;
	    $order->increment_id = $store_order_increment_id;
	    $order->order_status = 1;
	    
	    if($order_remarks) {
		$order->order_remarks = "Uwagi klienta: \n";
		
		$order->order_remarks .= $order_remarks;
		
		$order->order_remarks .= "\n\nDostawa do: \n";
	    
	    }else {

		$order->order_remarks = "Dostawa do: \n";
	    }
	    
	    Log::instance()->add(Log::DEBUG, "Received Virtual order:".$store_order_increment_id);
		    
	    $address = array_filter($address, 'trim');
	    
	    foreach($address as $addr) {
		if(strlen($addr) > 1) {
		    $order->order_remarks .= $addr."\n";
		}
	    }
	    
	    $order->order_company_id = $company_id;
    	    $order->order_archived = 0;
	    $order->order_type = 0;
	    $order->order_date = date('Y-m-d H:i:s');
	
	
	    if(!$order->save()) {
		return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
	    }
	
	    $order->order_number = $order->id."/".date("Y");


	    if(!$order->save()) {
		return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
	    }
	
	    foreach($order_products as $op) {
		$order_product = ORM::factory('OrderProduct');
		$order_product->order_id = $order->id;
		$order_product->product_id = $op['product_id'];
		$order_product->product_stock_change = $op['quantity'];
		$order_product->product_user_id = $store_user_id;
	        $order_product->product_company_id = $company_id;
	        $order_product->order_key = $order->order_key;
		
		$product = ORM::factory('Product',$op['product_id']);
	
	
		$virtual_stock = $product->virtualstocks->where('user_id','=',$store_user_id)->find();
		
		Log::instance()->add(Log::DEBUG,"VirtualStock:".$virtual_stock->id.":".$virtual_stock->stock);
		
		Log::instance()->add(Log::DEBUG, $product->loaded()."->".$product->current_stock."<>".$op['quantity']);

		Log::instance()->add(Log::DEBUG, "Store user id:".$store_user_id);

		$products_in_orders = ORM::factory('OrderProduct')->where('product_id','=',$op['product_id'])->and_where('product_state','=',1)->and_where('product_user_id','=',$store_user_id)->find_all();
		
		$in_orders_stock = 0;
		
		foreach($products_in_orders as $pio) {

		    Log::instance()->add(Log::DEBUG, "Check for:".$pio->order_key);
		    
		    $check_order=ORM::factory('Order')->where('order_key','=',$pio->order_key)->find();
		    
		    if($check_order->loaded()) {    
    			$in_orders_stock += $pio->product_stock_change;
    		    }else {
			Log::instance()->add(Log::DEBUG, "No order for:".$pio->id);
    		    }
		}
		
		Log::instance()->add(Log::DEBUG, "In orders stock:".$in_orders_stock);
		
		
		if($product->loaded()==1 && $virtual_stock->stock >= ($op['quantity']+$in_orders_stock)) {
		    if($op['quantity'] > 0) {
			if(!$order_product->save()) {
			    $order->delete();
			    return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
			}
		    }
		}else {
		    $order->delete();
		    return array("error"=>"Quantity on order for ".$product->name." is more than it's stock, please lower down the quantity and place new order");

		}
	    }
	    Log::instance()->add(Log::DEBUG, "Order placed sucessfully:".$store_order_increment_id);
	    return array("result"=>"order_placed");
	}catch(Exception $e) {
	    if($order->loaded()) $order->delete();
	    return array("error"=>$e->getMessage());
	}
    }

    /**
     * placeVirtualStockPMOrder place virtual stock order
     * @param   string $company_id
     * @param   string $user_id
     * @param   array $items
     * @param	array $address
     * @param	string $order_remarks
     * @param	string $pmorder
     *
     * @return  array
     */
    public function placeVirtualStockPMOrder($company_id,$user_id,$items,$address,$order_remarks,$pmorder)
    {

	$errors = array();
	$store_products = array();
	$order_products = array();
	$store_order_increment_id = 0;
	$store_order_id = 0;
	$store_user_id = $user_id;

	foreach($items as $item) {
	    foreach($item->item as $it) {
		if($it->key == "product_id") $store_products['product_id']=$it->value;
		if($it->key == "qty") $store_products['quantity']=number_format($it->value, 0, '', '');
		if($it->key == "order_id") $store_order_id=$it->value;
		if($it->key == "order_increment_id") $store_order_increment_id=$it->value;	
	    }
	    array_push($order_products,$store_products);
	}	          
	
	$pm_order = unserialize($pmorder);
	    
        Log::instance()->add(Log::DEBUG, "Received Virtual PM order:".$store_order_increment_id);
	
	Log::instance()->add(Log::DEBUG, "Order Products:". serialize($order_products));
	Log::instance()->add(Log::DEBUG, "PM Order:". $pmorder);
	
	try {
	    $order = ORM::factory('Order');
	    $order->order_key = md5(time());
	    $order->order_user_id = $store_user_id;
	    $order->increment_id = $store_order_increment_id;
	    $order->order_status = 1;
	    
	    
	    
	    if($order_remarks) {
		$order->order_remarks = "Uwagi klienta: \n";
		
		$order->order_remarks .= $order_remarks;
		if((is_array($pm_order['repGroup']) && count($pm_order['repGroup']) > 0) || (is_array($pm_order['repManual']) && count($pm_order['repManual']) > 0)) {
		    $order->order_remarks .= "\nDostawa zgodnie z adresami przedstawicieli. \n";
		}else {	
		    $order->order_remarks .= "\n\nDostawa do: \n";
		}
		
	    }else {
		if((is_array($pm_order['repGroup']) && count($pm_order['repGroup']) > 0) || (is_array($pm_order['repManual']) && count($pm_order['repManual']) > 0)) {
		    $order->order_remarks .= "\nDostawa zgodnie z adresami przedstawicieli. \n";
		}else {	
		    $order->order_remarks .= "\n\nDostawa do: \n";
		}
	    }
		    
	    $address = array_filter($address, 'trim');
	    
	    foreach($address as $addr) {
		if(strlen($addr) > 1) {
		    if((is_array($pm_order['repGroup']) && count($pm_order['repGroup']) > 0) || (is_array($pm_order['repManual']) && count($pm_order['repManual']) > 0)) {
			$order->order_remarks .= "";
		    }else {
		    	$order->order_remarks .= $addr."\n";
		    }
		}
	    }
	    
	    $order->order_company_id = $company_id;
    	    $order->order_archived = 0;
	    $order->order_type = 0;
	    $order->order_date = date('Y-m-d H:i:s');
	
	
	    if(!$order->save()) {
		return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
	    }
	
	    $order->order_number = $order->id."/".date("Y");


	    if(!$order->save()) {
		return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
	    }
	
	    foreach($order_products as $op) {
	    
		$group_product_quantity = 0;
		$product_pm = array();
	
		$update_quantity = false;
		
		if(is_array($pm_order)) {
		    foreach($pm_order as $order_type=>$group_order) {
			if($order_type == "repGroup") {
			    if(is_array($group_order)) {
		    		foreach($group_order as $group_id=>$group) {
				    if(is_array($group)) {
					foreach($group as $rep_id => $group_products) {
					    if(is_array($group_products)) {
						foreach($group_products as $group_product_id => $qty) {
						    if($group_product_id == $op['product_id']) {
							$group_product_quantity += $qty['qty'];
							$product_pm[$rep_id] += $qty['qty'];
							$update_quantity = true;
						    }
						}
					    }
					}
				    } 
				}
			    }
			}elseif($order_type == "repManual") {
			    if(is_array($group_order)) {
				foreach($group_order as $rep_id => $group_products) {
				    if(is_array($group_products)) {
					foreach($group_products as $group_product_id => $qty) {
			    		    if($group_product_id == $op['product_id']) {
			    			$group_product_quantity += $qty['qty'];
					        $product_pm[$rep_id] += $qty['qty'];
						$update_quantity = true;
					    }
					}
				    } 
				}
			    }
			}
		    }
		}
		
		Log::instance()->add(Log::DEBUG, "Product PM:".serialize($product_pm));		
		Log::instance()->add(Log::DEBUG, "Group Quantity:".serialize($group_product_quantity));
		Log::instance()->add(Log::DEBUG, "On Order Product Quantity:".$op['quantity']);
	
		$order_product = ORM::factory('OrderProduct');
		$order_product->order_id = $order->id;
		$order_product->product_id = $op['product_id'];
		$order_product->product_stock_change = ($update_quantity == true ? $group_product_quantity : $op['quantity']);
		$order_product->product_user_id = $store_user_id;
	        $order_product->product_company_id = $company_id;
	        $order_product->order_key = $order->order_key;
		$order_product->product_pm = serialize($product_pm);
		
		Log::instance()->add(Log::DEBUG, "Stock change Order Product Quantity:".$order_product->product_stock_change);
		Log::instance()->add(Log::DEBUG, "Store user id:".$store_user_id);
		
		$product = ORM::factory('Product',$op['product_id']);
	

		$products_in_orders = ORM::factory('OrderProduct')->where('product_id','=',$op['product_id'])->and_where('product_state','=',1)->and_where('product_user_id','=',$store_user_id)->find_all();
		
		$in_orders_stock = 0;
		
		foreach($products_in_orders as $pio) {
		    Log::instance()->add(Log::DEBUG, "Check for:".$pio->order_key);
		    
		    $check_order=ORM::factory('Order')->where('order_key','=',$pio->order_key)->find();
		    
		    if($check_order->loaded()) {    
    			$in_orders_stock += $pio->product_stock_change;
    		    }else {
			Log::instance()->add(Log::DEBUG, "No order for:".$pio->id);
    		    }
		}
		
		Log::instance()->add(Log::DEBUG, "In orders stock:".$in_orders_stock);

		Log::instance()->add(Log::DEBUG, "Product central stock:".$product->current_stock);

		if($product->loaded()==1 && $product->current_stock < 1) {
		    $order->delete();
		    return array("error"=>"Quantity on order for ".$product->name." is more than it's stock, please lower down the quantity and place new order");		
		}elseif($product->loaded()==1 && $product->current_stock >= ($group_product_quantity+$in_orders_stock)) {
		    if($op['quantity'] > 0 || $group_product_quantity > 0) {
			if(!$order_product->save()) {
			    $order->delete();
			    return array("error"=>"There was problem saving the order in Warehouse System it will not be processed.");
			}
		    }
		}else {
		    $order->delete();
		    return array("error"=>"Ilość na zmówieniu dla ".$product->name." jest większa niż stan magazynu centralnego.");

		}
	    }
	    
	    Log::instance()->add(Log::DEBUG, "Order placed sucessfully:".$store_order_increment_id);
	    
	    return array("result"=>"order_placed");
	}catch(Exception $e) {
	    if($order->loaded()) $order->delete();
	    return array("error"=>$e->getMessage());
	}
    }


}
 
?>
