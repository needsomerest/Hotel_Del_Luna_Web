<div class="panel-heading bg-completed">
	<p class="lead m-n"><?php __('limit_update');?></p>
</div><!-- /.panel-heading -->

<div class="panel-body">
	<form action="" method="post" id="frmUpdate">
		<input type="hidden" name="update_limit" value="1" />
		<input type="hidden" name="id" value="<?php echo $tpl['arr']['id'];?>" />
		<div class="form-group">
			<label class="control-label"><?php __('limit_room');?></label>
		
			<select name="room_id" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
				<option value="">-- <?php __('lblChoose');?> --</option>
				<?php foreach ($tpl['room_arr'] as $room) { ?>
					<option value="<?php echo $room['id'];?>" <?php echo $tpl['arr']['room_id'] == $room['id'] ? 'selected="selected"' : null;?>><?php echo pjSanitize::clean($room['name']);?></option>
				<?php } ?>
			</select>
		</div>
	
		<div class="row">
			<div class="col-lg-12 col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_date_from');?></label>
				
					<div class="input-group"> 
						<input type="text" name="date_from" id="date_from" value="<?php echo date($tpl['option_arr']['o_date_format'], strtotime($tpl['arr']['date_from']));?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-lg-6 -->
	
			<div class="col-lg-12 col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_date_to');?></label>
				
					<div class="input-group"> 
						<input type="text" name="date_to" id="date_to" value="<?php echo date($tpl['option_arr']['o_date_format'], strtotime($tpl['arr']['date_to']));?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" />
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
	
		<div class="form-group">
			<label class="control-label"><?php __('limit_start_on');?></label>
		
			<select name="start_on" class="form-control">
				<option value="7"><?php __('limit_any_day');?></option>
				<?php foreach (__('days', true) as $k => $v) { ?>
					<option value="<?php echo $k;?>" <?php echo $tpl['arr']['start_on'] == $k ? 'selected="selected"' : null;?>><?php echo $v;?></option>
				<?php } ?>
			</select>
		</div>
	
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_min_nights');?></label>
				
					<input class="touchspin3" type="text" name="min_nights" value="<?php echo $tpl['arr']['min_nights'];?>" />
				</div>
			</div><!-- /.col-sm-6 -->
	
			<div class="col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_max_nights');?></label>
				
					<input class="touchspin3" type="text" name="max_nights" value="<?php echo $tpl['arr']['max_nights'];?>" />
				</div>
			</div><!-- /.col-sm-6 -->
		</div><!-- /.row -->
		
		<div class="m-t-sm">
			<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
				<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
				<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
			</button>
			<button type="button" class="btn btn-white btn-lg pull-right pjBtnCancelUpdateLimit"><?php __('btnCancel'); ?></button>
		</div><!-- /.m-b-lg -->
	</form>
</div>