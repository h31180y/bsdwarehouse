<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption"></div>
		<div class="tools">
		</div>
	</div>
	
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<form action="#" class="form-horizontal form-bordered">
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

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-bar-chart font-green-haze"></i>
			<span class="caption-subject bold uppercase font-green-haze"> Raport okresowy magazynowanych pudeł</span>
		</div>
		<div class="tools">
		</div>
	</div>
	<div class="portlet-body">
		<table class="table table-striped table-bordered table-hover" id="datatable_ajax">
			<thead>
			<tr role="row" class="heading">
				<th width="2%">
					<input type="checkbox" class="group-checkable">
				</th>
				<th width="5%">
					 Numer&nbsp;#
				</th>
				<th width="5%">
					 Kod kreskowy&nbsp;#
				</th>
				<th width="15%">
					 Opis
				</th>
			</tr>

			</thead>
			<tbody>
			</tbody>
			</table>
	
	
	</div>
</div>