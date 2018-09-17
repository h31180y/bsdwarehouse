
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption"></div>
		<div class="tools">
		</div>
	</div>
	
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<form action="/report/orders_report" class="form-horizontal form-bordered" method="POST">
			<div class="form-body">			
				<div class="form-group ">
					<label class="control-label col-md-3"><?php echo __('Wybierz okres raportu');?></label>
					<div class="col-md-4">
						<div id="reportrange" class="btn default">
							<i class="fa fa-calendar"></i>
							&nbsp; <span>
							</span>
							<b class="fa fa-angle-down"></b>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- Begin: life time stats -->
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption" style="margin-right: 20px;">
			<i class="fa fa-bar-chart-o"></i>Raport zamówień
		</div>
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="#portlet_tab2" data-toggle="tab" id="statistics_amounts_tab">
				<?php echo __("Wartości");?></a>
			</li>
			<li >
				<a href="#portlet_tab1" data-toggle="tab">
				<?php echo __("Zamówienia");?></a>
			</li>
		</ul>
	</div>
	<div class="portlet-body">
		<div class="tab-content">
			<div class="tab-pane" id="portlet_tab1">
				<div id="statistics_1" class="chart" style="width:100%;">
				</div>
			</div>
			<div class="tab-pane active" id="portlet_tab2">
				<div id="statistics_2" class="chart" style="width:100%;">
				</div>
			</div>
		</div>
		<div class="well no-margin no-border">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-6 text-stat">
					<span class="label label-success">
					Wartość zamówień: </span>
					<h3 id="orders_sum"><?php echo number_format($orders_sum, 2, ',', ' ');?> PLN</h3>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6 text-stat">
					<span class="label label-info">
					Podatek VAT: </span>
					<h3 id="orders_tax"><?php echo number_format($orders_sum-($orders_sum/VAT), 2, ',', ' ');?> PLN</h3>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6 text-stat">
					<span class="label label-warning">
					Ilość zamówień: </span>
					<h3 id="orders_count"><?php echo $orders_count ?></h3>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End: life time stats -->
