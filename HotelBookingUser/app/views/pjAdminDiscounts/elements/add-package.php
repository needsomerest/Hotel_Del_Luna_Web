
<div class="panel no-borders">
	<div class="panel-heading bg-completed">
		<p class="lead m-n"><?php __('discount_add_package');?></p>
	</div><!-- /.panel-heading -->

	<div class="panel-body">
		<form action="" method="post" id="frmAddPackage">
			<input type="hidden" name="add_package" value="1" />
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
					?><label class="control-label"><?php echo $message;?></label><?php
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
				<label class="control-label"><?php __('discount_start_day');?></label>
			
				<select name="start_day" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
					<option value="">-- <?php __('lblChoose'); ?> --</option>
					<?php
					foreach (__('days', true) as $k => $v)
					{
						?><option value="<?php echo $k; ?>"><?php echo $v;?></option><?php
					}
					?>
				</select>
			</div>
			
			<div class="form-group">
				<label class="control-label"><?php __('discount_end_day');?></label>
			
				<select name="end_day" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
					<option value="">-- <?php __('lblChoose'); ?> --</option>
					<?php
					foreach (__('days', true) as $k => $v)
					{
						?><option value="<?php echo $k; ?>"><?php echo $v;?></option><?php
					}
					?>
				</select>
			</div>
			
			<div class="form-group">
				<label class="control-label"><?php __('discount_total_price');?></label>
			
				<div class="input-group"> 
					<input type="text" name="total_price" id="total_price" class="form-control number required" data-msg-required="<?php __('lblFieldRequired');?>" data-msg-number="<?php __('required_number_field');?>" />
					<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false);?></span>
				</div>
			</div>	
			
			<div class="m-t-lg">
				<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
					<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
					<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
				</button>
			</div><!-- /.m-b-lg -->
			
		</form>
	</div><!-- /.panel-body -->
</div><!-- /.panel panel-primary -->
