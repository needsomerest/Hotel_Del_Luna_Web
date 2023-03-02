<?php
$week_start_date = $tpl['week_start_date'];
$week_end_date = $tpl['week_end_date'];
$selected_date = pjDateTime::formatDate(date('Y-m-d'), 'Y-m-d', $tpl['option_arr']['o_date_format']);
if ($controller->_get->check('selected_date') && !$controller->_get->isEmpty('selected_date'))
{
    $selected_date = $controller->_get->toString('selected_date');
}
$br = __('restriction_types', true);
if ($controller->_get->toInt('room_id') > 0)
{
    ?>
    <div>
    	<h3><?php __('room_limit_select_room'); ?>: <?php echo $tpl['room_arr']['type'];?></h3>
    </div>
    <?php
}
?>
			
<div class="m-b-sm">
	<div class="row">
		<div class="col-lg-12 col-md-2col-xs-12 text-center">
			<h2 class="calendar-title"><?php echo $tpl['month_label'];?></h2>
		</div> 
	</div>
</div>

<div class="">
	<table class="table table-bordered" style="border-collapse: collapse">
		<thead>
			<tr>
				<th style="border: 1px solid #000 !important;width: 20%; vertical-align: top; padding: 0px;">
					<div style="margin: 5px 10px;">&nbsp;</div>
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
					?><th style="border: 1px solid #000 !important;width: 11.4286%; vertical-align: top; padding: 0px;" class="<?php echo $week_date_timestamp == strtotime($current_date) ? ' day-today' : null; ?>"><div style="margin: 5px 10px;"><strong><?php echo date('d', $week_date_timestamp); ?></strong> <br/><?php echo $days[date('w', $week_date_timestamp)]; ?></div></th><?php
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
					<td style="border: 1px solid #000 !important;width: 20%; vertical-align: top; padding: 0px;"><div style="margin: 5px 10px;"><strong><?php echo pjSanitize::clean($v['number']); ?></strong> <br/><?php echo pjSanitize::clean($v['type']); ?></div></td>
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
    					        }
    					        if($date_to_ts > $end_timestamp)
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
        					    <td class="" style="border: 1px solid #000 !important;width: 11.4286%; vertical-align: top; padding: 0px;">
        					    	<?php
        					    	if(isset($booking['uuid']))
        					    	{
        					    	    $tooltip_arr = array();
        					    	    if (!empty($booking['c_email']))
        					    	    {
        					    	        $tooltip_arr[] = stripslashes($booking['c_email']);
        					    	    }
        					    	    if (!empty($booking['c_phone']))
        					    	    {
        					    	        $tooltip_arr[] = __('booking_c_phone', true) . ': '.pjSanitize::clean($booking['c_phone']);
        					    	    }
        					    	    $tooltip_arr[] = __('booking_adults', true) . ': '.stripslashes($booking['adults']) . ', ' . __('booking_children', true) . ': '.stripslashes($booking['children']);
            					    	?>
            					    	<div class="car-reservation-outer tooltip-demo">
        									<a href="#" class="car-reservation" data-toggle="tooltip" data-html="true" data-placement="bottom" title="" style="border: 1px solid <?php echo $booking['status'] == 'confirmed' ? '#5ac5b6' : '#fbc994';?> !important;height: auto !important; background-color:<?php echo $booking['status'] == 'confirmed' ? '#5ac5b6' : '#fbc994';?> !important;width: <?php echo ($_nights * 100) + $extra;?>%; left: <?php echo $left;?>%;">
        										<strong style="color: #000;"><?php echo pjSanitize::clean($booking['c_name']);?></strong>
        									</a>
        								</div>
        								<?php
        					    	}else{
        					    	    ?>
            					    	<div class="car-reservation-outer tooltip-demo">
        									<a href="#" class="car-reservation" data-toggle="tooltip" data-html="true" data-placement="bottom" title="" style="border: 1px solid #ed5565 !important;height: auto !important; background-color:#ed5565 !important;width: <?php echo ($_nights * 100) + $extra;?>%; left: <?php echo $left;?>%;">
        										<strong style="color: #000;"><?php echo $booking['restriction_type'];?></strong>
        									</a>
        								</div>
        								<?php
        					    	}
        							?>
        					    </td>
        					    <?php
					        }else{
					            ?>
					            <td style="border: 1px solid #000 !important;width: 11.4286%; vertical-align: top; padding: 0px;"><div style="margin: 5px 10px;">&nbsp;</div></td>
					            <?php
					        }
					    }else{
    					    ?>
    					    <td style="border: 1px solid #000 !important;width: 11.4286%; vertical-align: top; padding: 0px;"><div style="margin: 5px 10px;">&nbsp;</div></td>
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