<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET-->
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-shopping-cart"></i>Historia zamówienia
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse">
					</a>
					<a href="javascript:;" class="reload">
					</a>
				</div>
			</div>
			<div class="portlet-body">
									
				<table class="table table-striped table-hover table-bordered" id="orders_realized_list">
				<thead>
				<tr>
					<th>
						 Użytkownik
					</th>
					<th>
						Data
					</th>
					<th>
						Status
					</th>
				</tr>
				</thead>
				<tbody>
				
				<?php foreach (ORM::factory("OrderHistory")->where('order_id','=',$order->order->id)->find_all() as $history_rec):?>
				<tr>
					<td>
						 <?php echo $history_rec->user->firstname." ".$history_rec->user->lastname;?>
					</td>
					<td>
						 <?php echo $history_rec->change_date;?>
					</td>								
					<td>
						 <?php echo $history_rec->last_status." > ".$history_rec->current_status;?>
					</td>
				</tr>
				<?php endforeach;?>
				</tbody>
				</table>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
			