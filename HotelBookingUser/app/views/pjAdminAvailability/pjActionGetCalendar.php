<?php 
$week_start_date = $tpl['week_start_date'];
$week_end_date = $tpl['week_end_date']; 
$selected_date = pjDateTime::formatDate(date('Y-m-d'), 'Y-m-d', $tpl['option_arr']['o_date_format']);
if ($controller->_get->check('selected_date') && !$controller->_get->isEmpty('selected_date'))
{
    $selected_date = $controller->_get->toString('selected_date');
}
$br = __('restriction_types', true);
?>
<label class="control-label"><?php __('availability_jump_to');?></label>
				
<div class="m-b-sm">
	<div class="row">
		<div class="col-lg-3 col-md-3 col-xs-12">
			<div class="form-group" id="data_1">
				<div class="input-group date">
					<input type="text" class="form-control datepick" id="selected_date" name="selected_date" value="<?php echo pjSanitize::html($selected_date); ?>" readonly="readonly">
			
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
			</div>
		</div>

		<div class="col-lg-2 col-md-2 col-xs-6">
			<button class="btn btn-primary btn-outline" id="hb_prev_week" data-week_start="<?php echo date('Y-m-d', strtotime($week_start_date . " -7 days")) ?>"><i class="fa fa-angle-double-left"></i></button>
			<button class="btn btn-primary btn-outline" id="hb_prev_date" data-week_start="<?php echo date('Y-m-d', strtotime($week_start_date . " -1 days")) ?>"><i class="fa fa-angle-left"></i></button>
		</div>

		<div class="col-lg-2 col-md-2 col-xs-6 text-right pull-right">
			<button class="btn btn-primary btn-outline" id="hb_next_date" data-week_start="<?php echo date('Y-m-d', strtotime($week_start_date . " +1 days")) ?>"><i class="fa fa-angle-right"></i></button>
			<button class="btn btn-primary btn-outline" id="hb_next_week" data-week_start="<?php echo date('Y-m-d', strtotime($week_end_date . " +1 days")) ?>"><i class="fa fa-angle-double-right"></i></button>
		</div><!-- /.col-lg-3 -->

		<div class="col-lg-5 col-md-5 col-xs-12 text-center">
			<h2 class="calendar-title"><?php echo $tpl['month_label'];?></h2>
		</div> 
	</div>
</div>
<div class="table-responsive table-car-availability">
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>
					<label class="control-label"><?php __('availability_filter');?></label>

					<select class="form-control" id="room_id" name="room_id">
						<option value="">-- <?php __('lblAll'); ?> --</option>
						<?php
						if (isset($tpl['room_arr']) && !empty($tpl['room_arr']))
						{
							foreach ($tpl['room_arr'] as $v)
							{
								?><option value="<?php echo $v['id']; ?>"<?php echo $v['id'] != @$controller->_get->toInt('room_id') ? NULL : ' selected="selected"'; ?>><?php echo pjSanitize::html($v['type']); ?></option><?php
							}
						}
						?>
					</select>
				</th>
				<?php
				$days = __('days', true);
				$current_date = date('Y-m-d');
				$selected_date = date('Y-m-d');
				if ($controller->_get->check('selected_date') && !$controller->_get->isEmpty('selected_date'))
				{
				    $selected_date = pjDateTime::formatDate($controller->_get->toString('selected_date'), $tpl['option_arr']['o_date_format']);
				}
				$_columns = array();
				for ($i = 0; $i < 7; $i++)
				{
					$week_date_timestamp = strtotime($tpl['week_start_date'] . " +$i days");
					?><th class="<?php echo $week_date_timestamp == strtotime($selected_date) ? ' day-focus' : null; ?> <?php echo $week_date_timestamp == strtotime($current_date) ? ' day-today' : null; ?>"><strong><?php echo date('d', $week_date_timestamp); ?></strong> <?php echo $days[date('w', $week_date_timestamp)]; ?></th><?php
					$_columns[$i] = $week_date_timestamp;
				} 
				?>
			</tr>
		</thead>

		<tbody>
			<?php
			$start_timestamp = strtotime($tpl['week_start_date']);
			$end_timestamp = strtotime($tpl['week_end_date']);
			foreach($tpl['room_number_arr'] as $v)
			{ 
				?>
				<tr>
					<td><strong><?php echo pjSanitize::clean($v['number']); ?></strong> <?php echo pjSanitize::clean($v['type']); ?></td>
					<?php
					$kept = array();
					for ($i = 0; $i < 7; $i++)
					{
					    $wday_timestamp = strtotime($tpl['week_start_date'] . " +$i days");
					    $wday_iso = date('Y-m-d', $wday_timestamp);
					    if(isset($tpl['br_arr'][$v['id']][$wday_iso]))
					    {
					        $booking = $tpl['br_arr'][$v['id']][$wday_iso];
					        if($booking['first'] == 1)
					        {
					            $night_minus = 0;
					            $extra = 0;
    					        $left = 50;
    					        $date_from_ts = strtotime($booking['date_from']);
    					        $date_to_ts = strtotime($booking['date_to']);
    					        if($date_from_ts < $wday_timestamp)
    					        {
    					            $date_from_ts = $wday_timestamp;
    					            $extra = 50;
    					            $left = 0;
    					        }
    					        if($date_to_ts >= $end_timestamp && $tpl['option_arr']['o_price_based_on'] == 'nights')
    					        {
    					            $date_to_ts = $end_timestamp;
    					            $extra = 50;
    					        }
    					        if($booking['date_to'] >= $tpl['week_end_date'])
    					        {
    					            $booking['date_to'] = $tpl['week_end_date'];
    					            $night_minus = 1;
    					        }
    					        
    					        $dateFrom = new DateTime($booking['date_from']);
    					        $dateTo = new DateTime($booking['date_to']);
    					        $_nights= $dateTo->diff($dateFrom)->format("%a"); 
    					        $_nights = $_nights - $night_minus;
    					        if ($tpl['option_arr']['o_price_based_on'] == 'days')
    					        {
    					            $_nights += 1;
    					            $left = 0;
    					        }else{
    					            if($booking['over'] == 1)
    					            {
    					                $left = 0;
    					                $extra = 50;
    					            }
    					        }
    					        ?>
        					    <td class="<?php echo date('Ymd') == date('Ymd', $wday_timestamp) ? 'day-today' : '';?> <?php echo $_nights;?>">
        					    	<?php
        					    	if(isset($booking['uuid']))
        					    	{
        					    	    $tooltip_arr = array();
        					    	    if (!empty($booking['c_email']))
        					    	    {
        					    	        $tooltip_arr[] = pjSanitize::clean($booking['c_email']);
        					    	    }
        					    	    if (!empty($booking['c_phone']))
        					    	    {
        					    	        $tooltip_arr[] = __('booking_c_phone', true) . ': '.pjSanitize::clean($booking['c_phone']);
        					    	    }
        					    	    $tooltip_arr[] = __('booking_adults', true) . ': '.pjSanitize::clean($booking['adults']) . ', ' . __('booking_children', true) . ': '.pjSanitize::clean($booking['children']);
        					    	    $tooltip_arr[] = __('booking_id', true) . ': '.pjSanitize::clean($booking['uuid']);
        					    	    if (isset($tpl['other_rooms'][$booking['id']]))
        					    	    {
        					    	        $other_arr = array();
        					    	        $other_rooms = $tpl['other_rooms'][$booking['id']];
        					    	        unset($tpl['other_rooms'][$booking['id']]);
        					    	        foreach($other_rooms as $r)
        					    	        {
        					    	            list($rid, $number) = explode("~:~", $r);
        					    	            $other_arr[] = $number;
        					    	        }
        					    	    }
        					    	    $tooltip_arr[] = __('booking_rooms', true) . ': ' . (!empty($other_arr) ? join(', ', $other_arr) : 'no');
            					    	?>
            					    	<div class="car-reservation-outer tooltip-demo">
        									<a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionUpdate&amp;id=<?php echo $booking['id']; ?>" class="car-reservation" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo join("<br/>", $tooltip_arr);?>" style="width: <?php echo ($_nights * 100) + $extra;?>%; left: <?php echo $left;?>%;">
        										<div class="car-reservation-inner <?php echo $booking['status'] == 'confirmed' ? 'bg-confirmed' : 'bg-pending';?>"><strong><?php echo pjSanitize::clean($booking['c_name']);?></strong></div>
        									</a>
        								</div>
        								<?php
        					    	}else{
        					    	    ?>
            					    	<div class="car-reservation-outer tooltip-demo">
        									<a href="#" class="car-reservation" data-toggle="tooltip" data-html="true" data-placement="bottom" title="<?php echo @$br[$booking['restriction_type']]; ?>" style="width: <?php echo ($_nights * 100) + $extra;?>%; left: <?php echo $left;?>%; cursor: default;">
        										<div class="car-reservation-inner bg-danger"><strong><?php echo pjSanitize::clean($booking['restriction_type']);?></strong></div>
        									</a>
        								</div>
        								<?php
        					    	}
        							?>
        					    </td>
        					    <?php
					        }else{
					            ?>
					            <td class="<?php echo date('Ymd') == date('Ymd', $wday_timestamp) ? 'day-today' : '';?>"></td>
					            <?php
					        }
					    }else{
    					    ?>
    					    <td class="<?php echo date('Ymd') == date('Ymd', $wday_timestamp) ? 'day-today' : '';?>">
    					    	<a title="<?php __('avail_booking_add', false, true); ?>" class="booking-add" href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionCreate&amp;date_from=<?php echo $wday_iso; ?>&amp;room_id=<?php echo $v['room_id']; ?>&amp;room_number_id=<?php echo $v['id']; ?>"></a>
    					    </td>
    					    <?php
					    }
					}
					?>
				</tr>
				<?php
			} 
			?>
		</tbody>
	</table>
</div>