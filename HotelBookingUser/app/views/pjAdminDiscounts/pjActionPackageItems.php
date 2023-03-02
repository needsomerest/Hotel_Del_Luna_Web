
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><?php __('btn_close');?></span></button>

	<h2 class="no-margins"><?php __('prices_based_on_adults_children');?></h2>
</div>

<div class="panel-body">
	<?php $index = 'bs_' . rand(1, 999999);?>
	<form action="" method="post" id="frmAddPackageItem">
		<input type="hidden" name="add_item" value="1" />
		<input type="hidden" name="package_id" value="<?php echo $controller->_get->toInt('package_id');?>" />
		<div id="pjMorePriceContainer">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label"><?php __('rooms_adults');?></label>
					
						<input class="touchspin3 touchspin3_<?php echo $index;?> required" type="text" name="adults[<?php echo $index;?>]" id="audlts_<?php echo $index;?>" data-msg-required="<?php __('lblFieldRequired');?>" />
					</div>
				</div><!-- /.col-md-4 -->
	
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label"><?php __('rooms_children');?></label>
					
						<input class="touchspin3 touchspin3_<?php echo $index;?> required" type="text" name="children[<?php echo $index;?>]" id="children_<?php echo $index;?>" data-msg-required="<?php __('lblFieldRequired');?>" />
					</div>
				</div><!-- /.col-md-4 -->
	
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label"><?php __('discount_price');?></label>
					
						<div class="input-group"> 
							<span class="input-group-addon"><i class="fa fa-euro"></i></span>
	
							<input type="text" class="form-control required" name="price[<?php echo $index;?>]" id="price_<?php echo $index;?>" data-msg-required="<?php __('lblFieldRequired');?>" data-msg-number="<?php __('required_number_field');?>" /> 
						</div>
					</div>
				</div><!-- /.col-md-4 -->
			</div><!-- /.row -->
		</div>
	</form>
	<a href="javascript:void(0);" class="btn btn-primary btn-outline pjBtnAddPrice"><i class="fa fa-plus"></i> <?php __('btnAdd');?></a>

	<div class="hr-line-dashed"></div>

	<div id="grid_items"></div>
</div><!-- /.panel-body -->

<div class="modal-footer">
	<a href="javascript:void(0);" class="btn btn-primary pjBtnSavePackageItem" data-package_id="<?php echo $controller->_get->toInt('package_id'); ?>"><?php __('btnSave'); ?></a>
	<a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal"><?php __('btnCancel'); ?></a>
</div>

<div id="pjMorePriceClone" style="display:none;">
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label class="control-label"><?php __('rooms_adults');?></label>
			
				<input class="touchspin3_{INDEX} required" type="text" name="adults[{INDEX}]" id="audlts_{INDEX}" data-msg-required="<?php __('lblFieldRequired');?>" />
			</div>
		</div><!-- /.col-md-4 -->

		<div class="col-md-4">
			<div class="form-group">
				<label class="control-label"><?php __('rooms_children');?></label>
			
				<input class="touchspin3_{INDEX} required" type="text" name="children[{INDEX}]" id="children_{INDEX}" data-msg-required="<?php __('lblFieldRequired');?>" />
			</div>
		</div><!-- /.col-md-4 -->

		<div class="col-md-4">
			<div class="form-group">
				<label class="control-label"><?php __('discount_price');?></label>
			
				<div class="input-group"> 
					<span class="input-group-addon"><i class="fa fa-euro"></i></span>

					<input type="text" class="form-control required" name="price[{INDEX}]" id="price_{INDEX}" data-msg-required="<?php __('lblFieldRequired');?>" data-msg-number="<?php __('required_number_field');?>" /> 
				</div>
			</div>
		</div><!-- /.col-md-4 -->
	</div><!-- /.row -->
</div>