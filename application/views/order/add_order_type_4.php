								<h3 class="block">Zamówienie kopii notarialnej dokumentów</h3>
								
								<div class="form-group">
									<label class="control-label col-md-3">Numer pudła (kod kreskowy)</label>
									<div class="col-md-4">
										<div class="input-group">
									
											<input id="box_code_4" class="form-control" type="text" name="box_code_4" placeholder="Kod pudła"/>
											<span class="input-group-btn">
												<button id="add_box_to_order_4" class="btn btn-success" type="button"><i class="fa fa-arrow-left fa-fw"/></i> Dodaj</button>
											</span>
										
											<span class="help-block"></span>
										</div>
									</div>
								</div>
																							
								<div class="form-group">
									<label class="control-label col-md-3">Pudła</label>
									<div class="col-md-4">
										<select multiple class="form-control" name="boxes_4[]" id="boxes_list">
											<?php foreach($boxes as $box):?>
											<option value="<?php echo $box->id;?>"><?php echo sprintf('%012d',$box->barcode);?></option>
											<?php endforeach;?>
										
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-md-3">Zawartość</label>
									<div class="col-md-4">
										<select multiple class="form-control" name="contents_4[]">
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3">Uwagi
										<span class="required" aria-required="true"> * </span>
									</label>
									<div class="col-md-4">
										<div class="input-group">
											<textarea cols="80" rows="10" class="form-control" name="order_description_4" id="order_description_4"></textarea>
											<span class="help-block"></span>
										</div>
									</div>
								</div>								
