	<div class="panel-heading bg-completed">
		<p class="lead m-n"><?php __('discount_add_free');?></p>
	</div><!-- /.panel-heading -->

	<div class="panel-body">
		<form action="" method="post" id="frmAddFreeNight">
			<input type="hidden" name="add_free" value="1" />
			<div class="form-group">
				<label class="control-label"><?php __('limit_room');?></label>
				<?php if(!empty($tpl['room_arr'])) { ?>
					<select name="room_id" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
						<option value="">-- <?php __('lblChoose'); ?> --</option>
						<?php
						foreach ($tpl['room_arr'] as $item)
						{
							?><option value="<?php echo $item['id']; ?>"><?php echo pjSanitize::clean($item['name']); ?></option><?php
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
					<input type="text" name="date_from" id="date_from" class="form-control datepick required" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" /> 
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
			</div>
	
			<div class="form-group">
				<label class="control-label"><?php __('limit_date_to');?></label>
			
				<div class="input-group"> 
					<input type="text" name="date_to" id="date_to" class="form-control datepick required" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" />
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
			</div>
	
			<div class="form-group">
				<label class="control-label"><?php __('discount_min_length');?></label>
			
				<input class="touchspin3 " type="text" name="min_length">
			</div>
	
			<div class="form-group">
				<label class="control-label"><?php __('discount_max_length');?></label>
			
				<input class="touchspin3 " type="text" name="max_length">
			</div>
	
			<div class="form-group">
				<label class="control-label"><?php __('discount_free_nights');?></label>
			
				<input class="touchspin3 " type="text" name="free_nights">
			</div>
	
			<div class="m-t-lg">
				<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
					<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
					<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
				</button>
			</div><!-- /.m-b-lg -->
		</form>
	</div><!-- /.panel-body -->