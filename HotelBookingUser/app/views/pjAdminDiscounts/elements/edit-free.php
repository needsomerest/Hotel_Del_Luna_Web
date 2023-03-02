<div class="panel-heading bg-completed">
	<p class="lead m-n"><?php __('discount_update_free');?></p>
</div><!-- /.panel-heading -->

<div class="panel-body">
	<form action="" method="post" id="frmUpdateFreeNight">
		<input type="hidden" name="update_free" value="1" />
		<input type="hidden" name="id" value="<?php echo $tpl['arr']['id'];?>" />
		<div class="form-group">
			<label class="control-label"><?php __('limit_room');?></label>
			<?php if(!empty($tpl['room_arr'])) { ?>
				<select name="room_id" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
					<option value="">-- <?php __('lblChoose'); ?> --</option>
					<?php
					foreach ($tpl['room_arr'] as $item)
					{
						?><option value="<?php echo $item['id']; ?>" <?php echo $tpl['arr']['room_id'] == $item['id'] ? 'selected="selected"' : null;?>><?php echo pjSanitize::clean($item['name']); ?></option><?php
					}
					?>
				</select>
			<?php } else { 
				$message = __('lblNoRoomMessage', true);
				$message = str_replace("{STAG}", '<a href="'.$_SERVER['PHP_SELF'] . '?controller=pjAdminRooms&amp;action=pjActionCreate">', $message);
				$message = str_replace("{ETAG}", '</a>', $message);
				?><label class="block t5"><?php echo $message;?></label><?php
			} ?>
		</div>

		<div class="form-group">
			<label class="control-label"><?php __('limit_date_from');?></label>
		
			<div class="input-group"> 
				<input type="text" name="date_from" id="date_from" value="<?php echo date($tpl['option_arr']['o_date_format'], strtotime($tpl['arr']['date_from']));?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" /> 
				<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label"><?php __('limit_date_to');?></label>
		
			<div class="input-group"> 
				<input type="text" name="date_to" id="date_to" value="<?php echo date($tpl['option_arr']['o_date_format'], strtotime($tpl['arr']['date_to']));?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" />
				<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label"><?php __('discount_min_length');?></label>
		
			<input class="touchspin3 " type="text" value="<?php echo $tpl['arr']['min_length'];?>" name="min_length">
		</div>

		<div class="form-group">
			<label class="control-label"><?php __('discount_max_length');?></label>
		
			<input class="touchspin3 " type="text" value="<?php echo $tpl['arr']['max_length'];?>" name="max_length">
		</div>

		<div class="form-group">
			<label class="control-label"><?php __('discount_free_nights');?></label>
		
			<input class="touchspin3 " type="text" value="<?php echo $tpl['arr']['free_nights'];?>" name="free_nights">
		</div>

		<div class="m-t-lg">
			<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
				<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
				<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
			</button>
			<button type="button" class="btn btn-white btn-lg pull-right pjBtnCancelUpdateFree"><?php __('btnCancel'); ?></button>
		</div><!-- /.m-b-lg -->
	</form>
</div><!-- /.panel-body -->