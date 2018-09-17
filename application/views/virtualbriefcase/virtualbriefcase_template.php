<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET-->
		<div class="portlet box blue">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-briefcase"></i>Wirtualne teczki - Szablony
				</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"> </a> <a
						href="javascript:;" class="reload"> </a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-toolbar">
					<div class="btn-group">
						<button class="btn green"
							onClick="javascript:window.location='/virtualbriefcase/virtualbriefcase_template_add'">
							Dodaj szablon <i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<table class="table table-striped table-hover table-bordered"
					id="documentlists_list">
					<thead>
						<tr>
							<th>Numer</th>
							<th>Nazwa szablonu</th>
							<th>Zawartość</th>
							<th>Opcje</th>
						</tr>
					</thead>
					<tbody>
							<?php foreach ($vb_templates as $vbt):?>
							<tr>
							<td>
									 <?php echo $vbt->id;?>
							</td>
							<td>
									 <?php echo $vbt->name;?>
							</td>

							<td><ol><?php if(is_array(unserialize($vbt->content))):?>
									 <?php foreach(unserialize($vbt->content) as $key=>$vbtc):?>
									 	<?php echo "<li>".$vbtc['name']."</li>";?> 
									 <?php endforeach;?>
									 <?php endif;?>
								</ol>
							</td>
							<td>
								<div class="margin-bottom-5">
									<button class="btn btn-xs red division-delete margin-bottom"
										onClick="javascript:window.location='/virtualbriefcase/virtualbriefcase_template_remove/<?php echo $vbt->id ;?>';">
										<i class="fa fa-recycle"></i> Usuń
									</button>
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
<div></div>
<div></div>