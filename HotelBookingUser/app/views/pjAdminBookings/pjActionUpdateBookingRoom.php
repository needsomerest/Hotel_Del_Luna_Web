<form action="" method="post" class="">
	<input type="hidden" name="room_update" value="1" />
	<input type="hidden" name="id" value="<?php echo $tpl['arr']['id']; ?>" />
	<input type="hidden" name="room_id" value="<?php echo $tpl['arr']['room_id']; ?>" />
	<input type="hidden" name="hash" value="<?php echo $tpl['arr']['hash']; ?>" />
	<input type="hidden" name="date_from" value="<?php echo $controller->_get->toString('date_from'); ?>" />
	<input type="hidden" name="date_to" value="<?php echo $controller->_get->toString('date_to'); ?>" />
	
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-6">
			<div class="form-group">
				<label class="control-label"><?php __('booking_room');?></label>

				<p class="text-muted"><?php echo pjSanitize::html($tpl['arr']['name']); ?></p>
			</div>
		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3">
			<div class="form-group">
				<label class="control-label"><?php __('rooms_adults');?></label>

				<input type="text" name="adults" class="touchspin3" data-max="<?php echo (int) $tpl['arr']['max_adults']; ?>" value="<?php echo (int) $tpl['arr']['adults']; ?>"/>
			</div>
		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
		<div class="col-lg-3 col-md-3 col-sm-3">
			<div class="form-group">
				<label class="control-label"><?php __('rooms_children');?></label>

				<input type="text" name="children" class="touchspin3" data-max="<?php echo (int) $tpl['arr']['max_children']; ?>" value="<?php echo (int) $tpl['arr']['children']; ?>"/>
			</div>
		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
		<div class="col-lg-6 col-md-6 col-sm-6">
			<?php
			if (isset($tpl['room_number_arr']) && !empty($tpl['room_number_arr']))
			{
    			?>
    			<div class="form-group">
        			<label class="control-label"><?php __('rooms_number');?></label>
        			<div id="room_number_holder">
        				<select name="room_number_id" class="form-control" data-msg-required="<?php __('lblFieldRequired');?>">
            				<option value="">-- <?php __('lblChoose'); ?> --</option>
            				<?php
            				foreach ($tpl['room_number_arr'] as $item)
            				{
            					?><option value="<?php echo $item['id']; ?>"<?php echo $item['id'] != $tpl['arr']['room_number_id'] ? NULL : ' selected="selected"'; ?>><?php echo pjSanitize::html($item['number']); ?></option><?php
            				}
            				?>
        				</select>	
        			</div>
        		</div>
        		<?php
			}else{
			    __('booking_no_rooms');
			    ?><input type="hidden" name="rn_id" value="" class="required" data-msg-required="<?php __('lblFieldRequired');?>" /><?php
			}
        	?>
		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
	</div><!-- /.row -->
</form>