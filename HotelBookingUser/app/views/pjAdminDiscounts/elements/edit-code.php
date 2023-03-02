<div class="panel-heading bg-completed">
	<p class="lead m-n"><?php __('discount_update_code');?></p>
</div><!-- /.panel-heading -->

<div class="panel-body">
	<form action="" method="post" id="frmUpdateCode">
		<input type="hidden" name="update_code" value="1" />
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
				?><label class="control-label"><?php echo $message;?></label><?php
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
			<label class="control-label"><?php __('discount_code');?></label>
		
			<input type="text" class="form-control required" name="promo_code" value="<?php echo stripslashes($tpl['arr']['promo_code']);?>" data-msg-required="<?php __('lblFieldRequired');?>" /> 
		</div>

		<div class="form-group">
			<label class="control-label"><?php __('discount_discount');?></label>
		
			<div class="row">
				<div class="col-sm-6">
					<input type="text" class="form-control" name="discount" value="<?php echo stripslashes($tpl['arr']['discount']);?>" data-msg-required="<?php __('lblFieldRequired');?>" /> 
				</div><!-- /.col-sm-6 -->

				<div class="col-sm-6">
					<select name="type" class="form-control required" data-msg-required="<?php __('lblFieldRequired');?>">
					<?php
					foreach (__('discount_types', true) as $k => $v)
					{
						?><option value="<?php echo $k; ?>"<?php echo $k == $tpl['arr']['type'] ? ' selected="selected"' : ''; ?>><?php echo $k == 'amount' ? $tpl['option_arr']['o_currency'] : $v; ?></option><?php
					}
					?>
					</select>
				</div><!-- /.col-sm-6 -->
			</div><!-- /.row -->
		</div>

		<div class="alert alert-danger pjCodeMessage" style="display: none;">
				
		</div>
		<div class="m-t-lg">
			<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
				<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
				<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
			</button>
			<button type="button" class="btn btn-white btn-lg pull-right pjBtnCancelUpdateCode"><?php __('btnCancel'); ?></button>
		</div><!-- /.m-b-lg -->
	</form>
</div><!-- /.panel-body -->