<select name="add_room_number_id" class="form-control">
	<option value="">-- <?php __('plugin_hotel_label_choose'); ?> --</option>
	<?php
	if (isset($tpl['room_number_arr']) && !empty($tpl['room_number_arr'])) { 
		foreach ($tpl['room_number_arr'] as $item)
		{
			?><option value="<?php echo $item['id']; ?>" <?php echo isset($tpl['br_arr']) && $tpl['br_arr']['room_number_id'] == $item['id'] ? 'selected="selected"' : null;?>><?php echo pjSanitize::html($item['number']); ?></option><?php
		}
	}
	?>
</select>