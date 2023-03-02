<div class="panel-heading bg-completed">
	<p class="lead m-n"><?php __('restriction_add');?></p>
</div><!-- /.panel-heading -->

<div class="panel-body">
	<form action="" method="post" id="frmCreate">
		<input type="hidden" name="add_restriction" value="1" />
		<div class="form-group">
			<label class="control-label"><?php __('restriction_rooms');?></label>
			<?php if(!empty($tpl['room_number_arr'])) { ?>
				<select name="room_number_id[]" class="select-rooms form-control required" data-placeholder="-- <?php __('lblChoose'); ?> --" multiple="multiple" data-msg-required="<?php __('lblFieldRequired');?>">
					<?php
					foreach ($tpl['room_number_arr'] as $item)
					{
						?><option value="<?php echo $item['id']; ?>"><?php echo pjSanitize::html($item['name'] . " - " . $item['number']); ?></option><?php
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
		
		<div class="row">
			<div class="col-lg-12 col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('restriction_date_from');?></label>
				
					<div class="input-group"> 
						<input type="text" name="date_from" id="date_from" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-6 -->
		
			<div class="col-lg-12 col-sm-6">
				<div class="form-group">
					<label class="control-label"><?php __('restriction_date_to');?></label>
				
					<div class="input-group"> 
						<input type="text" name="date_to" id="date_to" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" class="form-control datepick required" readonly="readonly" data-msg-required="<?php __('lblFieldRequired');?>" />
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-6 -->
		</div><!-- /.row -->
		
		<div class="form-group">
			<label class="control-label"><?php __('restriction_type');?></label>
		
			<select class="form-control required" name="restriction_type" data-msg-required="<?php __('lblFieldRequired');?>">
				<option value="">-- <?php __('lblChoose');?> --</option>
				<?php foreach (__('restriction_types', true) as $k => $v) { ?>
					<option value="<?php echo $k;?>"><?php echo $v;?></option>
				<?php } ?>        
			</select>
		</div>
		
		<div class="m-t-lg">
			<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
				<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
				<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
			</button>
		</div><!-- /.m-b-lg -->
	</form>
</div><!-- /.panel-body -->