<div class="row">

<div class="col-md-12">
		<form role="form" action="/warehouse/box_edit/<?php echo $box->id ?>" method="POST" id="edit_box_form">
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>Popraw błędy w formularzu</span>
			</div>
			<div class="tab-content">
			
				<div id="tab_1-1" class="tab-pane active">
					
					<div class="form-group">
						<label class="control-label">Kategoria przechowywania
							<span class="required" aria-required="true"> * </span>
						</label>
						<div class="input-icon right">
							<select class="form-control" name="storage_category_id" disabled>
								<option>-- Wybierz kategorię --</option>
								<?php foreach ($storagecategories as $storagecategory):?>
								<?php 
										if ($box->storage_category_id == $storagecategory->id) $checked=" selected=\"true\"";
										else $checked="";
										
										echo "<option value=\"".$storagecategory->id."\"".$checked." >".$storagecategory->name."</option>";

								?>
								<?php endforeach;?>
							</select>
							<span class="help-block"></span>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label">Regał
						</label>
						<div class="input-icon">
							<i class="fa fa-lock fa-fw"></i>
							<input disabled id="seal" class="form-control" type="text" name="place" value="<?php echo sprintf('%012d',$box->place->barcode);?>">
						</div>
						<span class="help-block"></span>
					</div>
					
					<div class="form-group">
						<label class="control-label">Data początku magazynowania
							<span class="required" aria-required="true"> * </span>
						</label>
							<div class="input-group input-medium date date-picker margin-bottom-5" data-date-format="yyyy-mm-dd">
								<input disabled type="text" class="form-control form-filter input-sm" readonly name="date_from" value="<?php echo $box->date_from;?>">
								<span class="input-group-btn">
								<button disabled class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						<span class="help-block"></span>
					</div>
					<div class="form-group">
						<label class="control-label">Data końca magazynowania
							<span class="required" aria-required="true"> * </span>
						</label>
							<div class="input-group input-medium date date-picker margin-bottom-5" data-date-format="yyyy-mm-dd" data-date-start-date="+0d">
								<input disabled type="text" class="form-control form-filter input-sm" readonly name="date_to" value="<?php echo $box->date_to;?>">
								<span class="input-group-btn">
								<button disabled class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
						<span class="help-block"></span>
					</div>					
					<div class="form-group">
						<label class="control-label">Data odbioru
							<span class="required" aria-required="true"> * </span>
						</label>
							<div class="input-group input-medium date date-picker margin-bottom-5" data-date-format="yyyy-mm-dd">
								<input disabled type="text" class="form-control form-filter input-sm" readonly name="date_reception" value="<?php echo $box->date_reception;?>">
								<span class="input-group-btn">
								<button disabled class="btn btn-sm default" type="button"><i class="fa fa-calendar"></i></button>
								</span>
							</div>
							<span class="help-block"></span>
						</div>
					</div>		
					<div class="form-group">
						<label class="control-label">Dział					
						</label>
						<div class="input-icon right">
							<select class="form-control" name="division_id" disabled>
								<option>-- Wybierz dział --</option>
								<?php foreach ($divisions as $division):?>
								<?php 
										if ($box->box->division_id == $division->id) $checked=" selected=\"true\"";
										else $checked="";
										
										echo "<option value=\"".$division->id."\"".$checked." >".$division->name."</option>";

								?>
								<?php endforeach;?>
							</select>
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">Opis
						</label>
						<textarea class="form-control" name="description" disabled><?php echo $box->box->description; ?></textarea>
						<span class="help-block"></span>
					</div>
					
					<div class="form-group">
						<label class="control-label">Blokada 
							<span class="required" aria-required="true"> * </span>
						</label>
						<div class="checkbox-list">
											<label class="checkbox-inline">
											<input disabled type="checkbox" id="lock" name="lock" value="1" <?php echo ($box->lock == 1 ? "checked='true'":"");?> > Tak </label>
											<label class="checkbox-inline">
											<input disabled type="checkbox" id="lock" name="lock" value="0" <?php echo ($box->lock == 0 ? "checked='true'":"");?> > Nie </label>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label">Kod kreskowy
						</label>
						<div class="input-icon">
							<i class="fa fa-lock fa-fw"></i>
							<input disabled id="barcode" class="form-control" type="text" name="barcode" placeholder="" value="<?php echo sprintf('%012d',$box->box->barcode);?>">
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label">Kod plomby 1
						</label>
						<div class="input-icon">
							<i class="fa fa-lock fa-fw"></i>
							<input disabled id="seal" class="form-control" type="text" name="seal1" value="<?php echo $box->seal1;?>">
						</div>
						<span class="help-block"></span>
					</div>
					<div class="form-group">
						<label class="control-label">Kod plomby 2
						</label>
						<div class="input-icon">
							<i class="fa fa-lock fa-fw"></i>
							<input disabled id="seal" class="form-control" type="text" name="seal2" value="<?php echo $box->seal2;?>">
						</div>
						<span class="help-block"></span>
					</div>
					<br/>

				</div>	
			</div>
		</form>

	
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption">
								<i class="glyphicon glyphicon-inbox"></i>Pudło <?php echo $box->id ?> - Historia
							</div>
							<div class="tools">
								<a href="javascript:;" class="expand">
								</a>
								<a href="javascript:;" class="reload">
								</a>
							</div>
						</div>
						<div class="portlet-body" style="display: none;">
							<table class="table table-striped table-hover table-bordered" id="documents_list">
							<thead>
							<tr>
								<th>
									 ID
								</th>
								<th>
									 Typ operacji
								</th>							
								<th>
									 Opis
								</th>
								<th>
									 Magazyn
								</th>
								<th>
									 Użytkownik
								</th>
								<th>
									 Data
								</th>
							</tr>
							</thead>
							<tbody>
							<?php foreach ($wh as $bh):?>
							<tr>
								<td style="width:10%">
									 <?php echo $bh->id;?>
								</td>
								
								<td style="width:20%">
									 <?php echo $bh->operation_type;?>
								</td>
															
								<td>
									 <?php echo $bh->operation_description;?>
								</td>
								<td>
									 <?php echo $bh->warehouse->name;?>
								</td>
								<td>
									 <?php echo $bh->user->username;?>
								</td>
								<td>
									 <?php echo $bh->change_date;?>
								</td>
								
							</tr>
							<?php endforeach;?>
							</tbody>
							</table>
						</div>
					</div>
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption">
								<i class="glyphicon glyphicon-inbox"></i>Pudło <?php echo $box->id ?> - Dokumenty
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="javascript:;" class="reload">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="btn-group">
									<button class="btn green" onClick="javascript:window.location='/warehouse/document_add/<?php echo $box->id; ?>'">
									Dodaj <i class="fa fa-plus"></i>
									</button>
								</div>
							</div>						
							<table class="table table-striped table-hover table-bordered" id="documents_list">
							<thead>
							<tr>
								<th>
									 ID
								</th>
								<th>
									 Nazwa
								</th>							
								<th>
									 Opis
								</th>
								<th>
									 Opcje
								</th>
							</tr>
							</thead>
							<tbody>
							<?php foreach ($documents as $document):?>
							<tr>
								<td style="width:10%">
									 <?php echo $document->id;?>
								</td>
								
								<td style="width:20%">
									 <?php echo $document->name;?>
								</td>
															
								<td style="width:50%">
									 <?php echo $document->description;?>
								</td>
								<td style="width:20%">
									<div class="margin-bottom-5">
											<button class="btn btn-xs yellow division-edit margin-bottom" onClick="javascript:window.location='/warehouse/document_edit/<?php echo $document->id ;?>';"><i class="fa fa-user"></i> Edytuj</button>
											<button class="btn btn-xs red division-delete margin-bottom" onClick="javascript:window.location='/warehouse/document_delete/<?php echo $document->id ;?>';"><i class="fa fa-recycle"></i> Usuń</button>
									</div>
								</td>
							</tr>
							<?php endforeach;?>
							</tbody>
							</table>
						</div>
					</div>					
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption">
								<i class="glyphicon glyphicon-inbox"></i>Pudło <?php echo $box->id ?> - Listy Dokumentów
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="javascript:;" class="reload">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="btn-group">
									<button class="btn green" onClick="javascript:window.location='/warehouse/documentlist_add/<?php echo $box->id; ?>'">
									Dodaj <i class="fa fa-plus"></i>
									</button>
								</div>
							</div>						
							<table class="table table-striped table-hover table-bordered" id="documentlists_list">
							<thead>
							<tr>
								<th>
									 ID
								</th>
								<th>
									 Nazwa
								</th>							
								<th>
									 Opis
								</th>
								<th>
									 Opcje
								</th>
							</tr>
							</thead>
							<tbody>
							<?php foreach ($documentlists as $documentlist):?>
							<tr>
								<td style="width:10%">
									 <?php echo $documentlist->id;?>
								</td>
								<td style="width:20%">
									 <?php echo $documentlist->name;?>
								</td>
															
								<td style="width:50%">
									 <?php echo $documentlist->description;?>
								</td>
								<td style="width:20%">
									<div class="margin-bottom-5">
											<button class="btn btn-xs yellow division-edit margin-bottom" onClick="javascript:window.location='/warehouse/documentlist_edit/<?php echo $documentlist->id ;?>';"><i class="fa fa-user"></i> Edytuj</button>
											<button class="btn btn-xs red division-delete margin-bottom" onClick="javascript:window.location='/warehouse/documentlist_delete/<?php echo $documentlist->id ;?>';"><i class="fa fa-recycle"></i> Usuń</button>
									</div>
								</td>
							</tr>
							<?php endforeach;?>
							</tbody>
							</table>
						</div>
					</div>
					<div class="portlet box grey">
						<div class="portlet-title">
							<div class="caption">
								<i class="glyphicon glyphicon-inbox"></i>Pudło <?php echo $box->id ?> - Teczki
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<a href="javascript:;" class="reload">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="btn-group">
									<button class="btn green" onClick="javascript:window.location='/warehouse/bulkpackaging_add/<?php echo $box->id; ?>'">
									Dodaj <i class="fa fa-plus"></i>
									</button>
								</div>
							</div>						
							<table class="table table-striped table-hover table-bordered" id="documentlists_list">
							<thead>
							<tr>
								<th>
									 ID
								</th>
								<th>
									 Nazwa
								</th>							
								<th>
									 Opis
								</th>
								<th>
									 Opcje
								</th>
							</tr>
							</thead>
							<tbody>
							<?php foreach ($bulkpackagings as $bulkpackaging):?>
							<tr>
								<td style="width:10%">
									 <?php echo $bulkpackaging->id;?>
								</td>
								<td style="width:20%">
									 <?php echo $bulkpackaging->name;?>
								</td>
															
								<td style="width:50%">
									 <?php echo $bulkpackaging->description;?>
								</td>
								<td style="width:20%">
									<div class="margin-bottom-5">
											<button class="btn btn-xs yellow division-edit margin-bottom" onClick="javascript:window.location='/warehouse/bulkpackaging_edit/<?php echo $bulkpackaging->id ;?>';"><i class="fa fa-user"></i> Edytuj</button>
											<button class="btn btn-xs red division-delete margin-bottom" onClick="javascript:window.location='/warehouse/bulkpackaging_delete/<?php echo $bulkpackaging->id ;?>';"><i class="fa fa-recycle"></i> Usuń</button>
									</div>
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
			<!-- END PAGE CONTENT -->

