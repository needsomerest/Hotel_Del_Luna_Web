<input type="hidden" name="booking_room_id" value="<?php echo isset($tpl['br_arr']['id']) ? (int)$tpl['br_arr']['id'] : 0;?>" />
<div class="row">
	<div class="col-lg-6 col-md-6 col-sm-6">
		<div class="form-group">
			<label class="control-label"><?php __('booking_room');?></label>

			<select class="form-control" name="add_room_id" id="add_room_id">
				<option value="" data-adults="0" data-children="0">-- <?php __('lblChoose');?> --</option>
				<?php
				foreach ($tpl['room_arr'] as $item)
				{
					if ((int) $item['max_bookings'] >= (int) $item['cnt'])
					{
						continue;
					}
					$selected = NULL;
					if (isset($tpl['br_arr']) && $tpl['br_arr']['room_id'] == $item['id']) {
						$selected = ' selected="selected"';
					} elseif ($item['id'] == @$_GET['room_id'])
					{
						$selected = ' selected="selected"';
					}
					?><option value="<?php echo $item['id']; ?>" data-adults="<?php echo (int) $item['adults']; ?>" data-children="<?php echo (int) $item['children']; ?>"<?php echo $selected; ?>><?php echo pjSanitize::html($item['name']); ?></option><?php
				}
				?>
			</select>
		</div>
	</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
</div>
<div class="row">
	
	<div class="col-lg-3 col-md-3 col-sm-3">
		<div class="form-group">
			<label class="control-label"><?php __('rooms_adults');?></label>

			<input class="touchspin3" type="text" value="<?php echo isset($tpl['br_arr']['adults']) ? $tpl['br_arr']['adults'] : '';?>" name="add_adults" id="add_adults">
		</div>
	</div><!-- /.col-md-3 -->

	<div class="col-lg-3 col-md-3 col-sm-3">
		<div class="form-group">
			<label class="control-label"><?php __('rooms_children');?></label>

			<input class="touchspin3" type="text" value="<?php echo isset($tpl['br_arr']['children']) ? $tpl['br_arr']['children'] : '';?>" name="add_children" id="add_children">
		</div>
	</div><!-- /.col-md-3 -->

	<div class="col-lg-6 col-md-6 col-sm-6">
		<div class="form-group">
			<label class="control-label"><?php __('rooms_number');?></label>
			<div id="room_number_holder">
				<select class="form-control" name="add_room_number_id">
					<option value="">-- <?php __('lblChoose');?> --</option>
					<?php
					if (isset($tpl['room_number_arr']) && !empty($tpl['room_number_arr'])) { 
						foreach ($tpl['room_number_arr'] as $item)
						{
							?><option value="<?php echo $item['id']; ?>" <?php echo isset($tpl['br_arr']) && $tpl['br_arr']['room_number_id'] == $item['id'] ? 'selected="selected"' : null;?>><?php echo pjSanitize::html($item['number']); ?></option><?php
						}
					}
					?>
				</select>
			</div>
		</div>
	</div><!-- /.col-md-3 -->
</div><!-- /.row -->
<div class="alert alert-danger addRoomMsg" style="display: none;"><?php __('booking_add_room_msg');?></div>