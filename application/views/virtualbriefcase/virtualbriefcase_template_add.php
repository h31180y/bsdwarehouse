<div class="row profile-account">	
	<div class="col-md-3">
		<ul class="ver-inline-menu tabbable margin-bottom-10">
			<li class="active">
				<a data-toggle="tab" href="#tab_1-1">
				<i class="fa fa-cog"></i>Nowy szablon wirtualnej teczki</a>
				<span class="after">
				</span>
			</li>

		</ul>
	</div>
	<div class="col-md-9">
		<form role="form" action="/virtualbriefcase/virtualbriefcase_template_add" method="POST" id="add_virtualbriefcase_form">
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
							<input type="text" placeholder="Nazwa szablonu wirtualnej teczki" class="form-control" name="name" value="" />
							<span class="help-block"></span>
						</div>
					</div>
					
					<div id="dok_template" style="display: none" >
						<div class="form-group" id="id_XX">
							<label class="control-label">Dokument
								<span class="required" aria-required="true"> * </span>
							</label>
								<input type="text" placeholder="Nazwa dokumentu" class="form-control" name="document_XX" value="" />
								<span class="help-block"></span>
						
							<button class="btn btn-sm red division-delete margin-bottom" id="remove_document_XX">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						
					</div>
					
					<div id="dok_holder">
					<br />
					
					</div>
					
					<div class="margin-bottom-5">
									<button class="btn btn-sm green division-delete margin-bottom" id="add_document">
										<i class="fa fa-plus"></i>
									</button>
									
					</div>
					
					<br/>
					<div class="margiv-top-10">
						<a href="/virtualbriefcase/virtualbriefcase_template_add" class="btn green" id="submit">
						Zapisz zmiany</a>
						<a href="/virtualbriefcase/virtualbriefcase_template" class="btn default" id="cancel">
						Anuluj</a>
					</div>
				</div>	
			</div>
		</form>
	</div>
	<!--end col-md-9-->
</div>