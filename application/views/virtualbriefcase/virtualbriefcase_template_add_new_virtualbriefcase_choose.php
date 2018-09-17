<div class="row profile-account">	
	<div class="col-md-3">
		<ul class="ver-inline-menu tabbable margin-bottom-10">
			<li class="active">
				<a data-toggle="tab" href="#tab_1-1">
				<i class="fa fa-cog"></i>Nowa wirtualna teczka</a>
				<span class="after">
				</span>
			</li>

		</ul>
	</div>
	<div class="col-md-9">
		<form role="form" action="/virtualbriefcase/virtualbriefcase_template_add_new_virtualbriefcase_choose/<?php echo $vb_template->id?>" method="POST" id="add_virtualbriefcase_form">
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>Popraw błędy w formularzu</span>
			</div>
			<div class="tab-content">
			
				<div id="tab_1-1" class="tab-pane active">
					<div class="form-group">
						<label class="control-label">Nazwa
							<span class="required" aria-required="true"> * </span>
						</label>
						<div class="input-icon right">
							<input type="text" placeholder="Nazwa wirtualnej teczki" class="form-control" name="name" value="" />
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label">Opis
							<span class="required" aria-required="true"> * </span>
						</label>
						<textarea class="form-control" placeholder="Opis wirtualnej teczki" name="description"></textarea>
						<span class="help-block"></span>
					</div>
					<div class="form-group">
						<label class="control-label">Dział
							<span class="required" aria-required="true"> * </span>
						</label>
						<div class="input-icon right">
							<select class="form-control" name="division_id">
								<option>-- Wybierz dział --</option>
								<?php foreach ($divisions as $division):?>
								<?php 
											echo "<option value=\"".$division->id."\">".$division->name."</option>";
								?>
								<?php endforeach;?>
							</select>
						</div>
					</div>
					<?php foreach(unserialize($vb_template->content) as $key=>$vbtc):?>
					
					<div class="form-group">
											
						<label class="control-label"><?php echo $vbtc['name'];?>
							<span class="required" aria-required="true"> * </span>
						</label>
						<div class="input-icon right">
							<select class="form-control input-large" name="doc[]">
								<option value="">-- Wybierz dokument --</option>
								<?php foreach ($documents as $doc):?>
								<?php 
									echo "<option value=\"".$doc->id."\">".$doc->id." - ".$doc->description."</option>";
								?>
								<?php endforeach;?>
							</select>
							<span class="help-block">Wybierz dokument do dodania.</span>
						</div>
						
					</div>
					<?php endforeach;?>
					
					
					<br/>
					<div class="margiv-top-10">
						<button href="#" class="btn green" id="submit" onClick="javascript:submit();">
						Zapisz zmiany</button>
					</div>
				</div>	
			</div>
		</form>
	</div>
	<!--end col-md-9-->
</div>