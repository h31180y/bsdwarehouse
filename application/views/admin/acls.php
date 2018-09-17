<div class="row">
				<form role="form" action="/admin/acls" method="POST" id="acls_form">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-edit"></i>Użytkownicy
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
									<button class="btn green" onClick="javascript:window.location='/admin/acl_add'">
									Dodaj <i class="fa fa-plus"></i>
									</button>
									<button class="btn blue" onClick="submit();">
									Zapisz <i class="fa fa-check"></i>
									</button>
									
									
									</div>
							</div>
							<table class="table table-striped table-hover table-bordered" id="acl_list">
							<thead>
							<tr>
								<th>
									 Sekcja
								</th>							
								<th>
									 Akcja
								</th>
								<th>
									 Uprawnienia / Rola
								</th>

							</tr>
							</thead>
							<tbody>
							<?php foreach ($acls as $acl):?>
							<tr>
								<td>
									 <?php echo ucfirst($acl->controller). ($acl->description !='' ? " (".$acl->description.")":"" )?>
								</td>															
								<td>
									 <?php echo ucfirst($acl->action);?>
								</td>															
								
								<td>
									<ul style="list-style:none;">
										<?php foreach($roles as $role):
										
										if($acl->has('roles',$role->id)) $checked = "checked";
										else $checked = "";
										
										?>
										<li>
											<input <?php echo $checked?> class="form-control" name="acls[<?php echo $acl->id?>][<?php echo $role->id?>]" type="checkbox" value="<?php echo $role->id?>">
											<label class="control-label" for="acls[<?php echo $acl->id?>][<?php echo $role->id?>]"><?php echo $role->name;?></label>
										</li>
										<?php endforeach;?>
										
									</ul>
								</td>															
								
							</tr>
							<?php endforeach;?>
							</tbody>
							</table>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
				</form>
			</div>
			<!-- END PAGE CONTENT -->
		</div>
	</div>