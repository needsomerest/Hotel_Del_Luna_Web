<div class="panel-heading bg-completed">
	<p class="lead m-n"><?php __('limit_add');?></p>
</div><!-- /.panel-heading -->

<div class="panel-body">
	<form action="" method="post" id="frmCreate">
		<input type="hidden" name="add_limit" value="1" />
		<div class="form-group">
			<label class="control-label"><?php __('limit_room');?></label>
		
			<select name="room_id" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
				<option value="">-- <?php __('lblChoose');?> --</option>
				<?php foreach ($tpl['room_arr'] as $room) { ?>
					<option value="<?php echo $room['id'];?>"><?php echo pjSanitize::clean($room['name']);?></option>
				<?php } ?>
			</select>
		</div>
	
		<div class="row">
			<div class="col-lg-12 col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_date_from');?></label>
				
					<div class="input-group"> 
						<input type="text" name="date_from" id="date_from" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-6 -->
	
			<div class="col-lg-12 col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_date_to');?></label>
				
					<div class="input-group"> 
						<input type="text" name="date_to" id="date_to" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" />
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-6 -->
		</div><!-- /.row -->
	
		<div class="form-group">
			<label class="control-label"><?php __('limit_start_on');?></label>
		
			<select name="start_on" class="form-control">
				<option value="7"><?php __('limit_any_day');?></option>
				<?php foreach (__('days', true) as $k => $v) { ?>
					<option value="<?php echo $k;?>"><?php echo $v;?></option>
				<?php } ?>
			</select>
		</div>
	
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_min_nights');?></label>
				
					<input class="touchspin3" type="text" name="min_nights">
				</div>
			</div><!-- /.col-sm-6 -->
	
			<div class="col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('limit_max_nights');?></label>
				
					<input class="touchspin3" type="text" name="max_nights">
				</div>
			</div><!-- /.col-sm-6 -->
		</div><!-- /.row -->
		
		<div class="m-t-sm">
			<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
				<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
				<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
			</button>
		</div><!-- /.m-b-lg -->
	</form>
</div>