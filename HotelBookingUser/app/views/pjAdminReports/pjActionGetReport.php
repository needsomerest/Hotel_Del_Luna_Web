<?php
if($controller->_get->check('from') && $controller->_get->check('to'))
{
	?>
    <div class="hr-line-dashed"></div>

    <div class="row">
        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php echo __('report_total_bookings_received');?>:</label>

                <div><?php echo (int) @$tpl['received_arr']['bookings']?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php echo __('report_total_guests');?>:</label>

                <div><?php echo (int) @$tpl['received_arr']['guests']?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php echo __('report_total_nights');?>:</label>

                <div><?php echo (int) @$tpl['received_arr']['nights']?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php echo __('report_total_amount');?>:</label>

                <div><?php echo pjCurrency::formatPrice(@$tpl['received_arr']['total']);?></div>
            </div><!-- /.form-group -->
        </div>
    </div><!-- /.row -->

    <div class="hr-line-dashed"></div>

    <div class="row">
        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_total_confirmed_bookings');?>:</label>

                <div><?php echo (int) @$tpl['confirmed_arr']['bookings'];?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_total_confirmed_guests');?>:</label>

                <div><?php echo (int) @$tpl['confirmed_arr']['guests'];?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_total_confirmed_nights');?>:</label>

                <div><?php echo (int) @$tpl['confirmed_arr']['nights'];?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php echo __('report_total_amount');?>:</label>

                <div><?php echo pjCurrency::formatPrice(@$tpl['confirmed_arr']['total']);?></div>
            </div><!-- /.form-group -->
        </div>
    </div><!-- /.row -->

    <div class="hr-line-dashed"></div>

    <div class="row">
        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_total_cancelled_bookings');?>:</label>

                <div><?php echo (int) @$tpl['cancelled_arr']['bookings'];?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_total_cancelled_guests');?>:</label>

                <div><?php echo (int) @$tpl['cancelled_arr']['guests'];?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_total_cancelled_nights');?>:</label>

                <div><?php echo (int) @$tpl['cancelled_arr']['nights'];?></div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php echo __('report_total_amount');?>:</label>

                <div><?php echo pjCurrency::formatPrice(@$tpl['cancelled_arr']['total']);?></div>
            </div><!-- /.form-group -->
        </div>
    </div><!-- /.row -->

    <div class="hr-line-dashed"></div>

    <div class="row">
        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_adults_guests'); ?>:</label>
				<?php
				$percent = '0%';
				if($tpl['total_guests'] > 0)
				{
				    $percent = round($tpl['total_adults'] * 100 / $tpl['total_guests']) . '%';
				}
				?>
                <div><?php echo (int) $tpl['total_adults'];?> (<?php echo $percent;?>)</div>
            </div><!-- /.form-group -->
        </div>

        <div class="col-lg-3 col-md-4 col-xs-6">
            <div class="form-group">
                <label class="control-label"><?php __('report_children_guests'); ?>:</label>
				<?php
				$percent = '0%';
				if($tpl['total_guests'] > 0)
				{
				    $percent = round($tpl['total_children'] * 100 / $tpl['total_guests']) . '%';
				} 
				?>
                <div><?php echo (int) $tpl['total_children'];?> (<?php echo $percent;?>)</div>
            </div><!-- /.form-group -->
        </div>
    </div><!-- /.row -->

    <div class="hr-line-dashed"></div>

    <div class="table-responsive table-responsive-secondary">
        <table class="table table-striped table-hover">
           
            <tbody>
                <tr>
            		<td rowspan="2" class="title-column h4"><strong><?php __('report_rooms'); ?></strong></td>
            		<td colspan="4" class="text-muted"><strong><?php __('report_bookings_received'); ?></strong></td>
            		<td colspan="4" class="text-muted"><strong><?php __('report_confirmed_bookings'); ?></strong></td>
            		<td colspan="4" class="text-muted"><strong><?php __('report_cancelled_bookings'); ?></strong></td>
            	</tr>
                <tr class="separator">
            		<td><?php __('report_booked'); ?></td>
            		<td><?php __('report_guests'); ?></td>
            		<td><?php __('report_nights'); ?></td>
            		<td class="split"><?php __('report_amount'); ?></td>
            		<td><?php __('report_booked'); ?></td>
            		<td><?php __('report_guests'); ?></td>
            		<td><?php __('report_nights'); ?></td>
            		<td class="split"><?php __('report_amount'); ?></td>
            		<td><?php __('report_booked'); ?></td>
            		<td><?php __('report_guests'); ?></td>
            		<td><?php __('report_nights'); ?></td>
            		<td><?php __('report_amount'); ?></td>
            	</tr>
            	
            	<?php
                	foreach($tpl['room_arr'] as $k => $v)
                	{
                		?>
                		<tr class="<?php echo $k < count($tpl['room_arr']) - 1 ? ' separator' : NULL;?>">
                			<td class="title-column"><span><?php echo $v['type'];?></span></td>
                			<td class="content-cell"><?php echo !empty($v['bookings']) ? $v['bookings'] : 0;?></td>
                			<td class="content-cell"><?php echo !empty($v['guests']) ? $v['guests'] : 0;?></td>
                			<td class="content-cell"><?php echo !empty($v['nights']) ? $v['nights'] : 0;?></td>
                			<td class="content-cell split"><?php echo pjCurrency::formatPrice(!empty($v['total']) ? round($v['total']) : 0);?></td>
                			<td class="content-cell"><?php echo !empty($tpl['room_confirmed_arr'][$k]['bookings']) ? $tpl['room_confirmed_arr'][$k]['bookings'] : 0;?></td>
                			<td class="content-cell"><?php echo !empty($tpl['room_confirmed_arr'][$k]['guests']) ? $tpl['room_confirmed_arr'][$k]['guests'] : 0;?></td>
                			<td class="content-cell"><?php echo !empty($tpl['room_confirmed_arr'][$k]['nights']) ? $tpl['room_confirmed_arr'][$k]['nights'] : 0;?></td>
                			<td class="content-cell split"><?php echo pjCurrency::formatPrice(!empty($tpl['room_confirmed_arr'][$k]['total']) ? round($tpl['room_confirmed_arr'][$k]['total']) : 0);?></td>
                			<td class="content-cell"><?php echo !empty($tpl['room_cancelled_arr'][$k]['bookings']) ? $tpl['room_cancelled_arr'][$k]['bookings'] : 0;?></td>
                			<td class="content-cell"><?php echo !empty($tpl['room_cancelled_arr'][$k]['guests']) ? $tpl['room_cancelled_arr'][$k]['guests'] : 0;?></td>
                			<td class="content-cell"><?php echo !empty($tpl['room_cancelled_arr'][$k]['nights']) ? $tpl['room_cancelled_arr'][$k]['nights'] : 0;?></td>
                			<td class="content-cell split"><?php echo pjCurrency::formatPrice(!empty($tpl['room_cancelled_arr'][$k]['total']) ? round($tpl['room_cancelled_arr'][$k]['total']) : 0);?></td>
                		</tr>
                		<?php
                	} 
                	?>
            </tbody>
        </table>
    </div>

    <div class="hr-line-dashed"></div>

    <div class="table-responsive table-responsive-secondary">
        <table class="table table-striped table-hover">
            <tbody>
                <tr>
            		<td style="width: 60%;"><strong><?php __('report_rooms_per_booking'); ?></strong></td>
            		<td><span class="normal"><strong><?php __('report_bookings'); ?></strong></span></td>
            		<td><span class="normal"><strong>%</strong></span></td>
            	</tr>
            	<?php
            	$total = $tpl['room_per_arr'][0]['one_room'] + $tpl['room_per_arr'][0]['two_room'] + $tpl['room_per_arr'][0]['more_room'];
            	$one_percent = $two_percent = $more_percent = '0%';
            	if($total > 0)
            	{
            		$one_percent = round($tpl['room_per_arr'][0]['one_room'] * 100 / $total) . '%';
            		$two_percent = round($tpl['room_per_arr'][0]['two_room'] * 100 / $total) . '%';
            		$more_percent = round($tpl['room_per_arr'][0]['more_room'] * 100 / $total) . '%';
            	}
            	?>
            	<tr>
            		<td><span><?php __('report_one_room'); ?></span></td>
            		<td><span class="normal"><?php echo $tpl['room_per_arr'][0]['one_room'];?></span></td>
            		<td><span class="normal"><?php echo $one_percent;?></span></td>
            	</tr>
            	<tr>
            		<td><span><?php __('report_two_room'); ?></span></td>
            		<td><span class="normal"><?php echo $tpl['room_per_arr'][0]['two_room'];?></span></td>
            		<td><span class="normal"><?php echo $two_percent;?></span></td>
            	</tr>
            	<tr>
            		<td><span><?php __('report_more_room'); ?></span></td>
            		<td><span class="normal"><?php echo $tpl['room_per_arr'][0]['more_room'];?></span></td>
            		<td><span class="normal"><?php echo $more_percent;?></span></td>
            	</tr>
            </tbody>
        </table>
    </div>
    <div class="table-responsive table-responsive-secondary">
        <table class="table table-striped table-hover">
            <tbody>
                <tr>
            		<td style="width: 60%;"><strong><?php __('report_nights_per_booking'); ?></strong></td>
            		<td><span class="normal"><strong><?php __('report_bookings'); ?></strong></span></td>
            		<td><span class="normal"><strong>%</strong></span></td>
            	</tr>
            	<?php
            	foreach(__('report_nights_arr', true) as $k => $v)
            	{
            	    $percent = '0%';
            	    if ($tpl['total_nights'] > 0)
            	    {
            	        $percent = round(@$tpl['night_arr'][$k] * 100 / $tpl['total_nights']) . '%';
            	    }
            	    ?>
            		<tr>
            			<td><span><?php echo $v;?></span></td>
            			<td><span class="normal"><?php echo isset($tpl['night_arr'][$k]) ? $tpl['night_arr'][$k] : 0;?></span></td>
            			<td><span class="normal"><?php echo $percent;?></span></td>
            		</tr>
            		<?php
            	} 
            	?>
            </tbody>
        </table>
    </div>
    <div class="table-responsive table-responsive-secondary">
        <table class="table table-striped table-hover">
            <tbody>
                <tr>
            		<td style="width: 60%;"><strong><?php __('report_guests_per_booking'); ?></strong> <small class="text-muted"><?php __('report_only_adults');?></small></td>
            		<td><span class="normal"><strong><?php __('report_bookings'); ?></strong></span></td>
            		<td><span class="normal"><strong>%</strong></span></td>
            	</tr>
            	<?php
            	foreach(__('report_guests_arr', true) as $k => $v)
            	{
            		$percent = '0%';
            		if ($tpl['total_bookings'] > 0)
            		{
            			$percent = round(@$tpl['guest_arr'][$k] * 100 / $tpl['total_bookings']) . '%';
            		}
            		?>
            		<tr>
            			<td><span><?php echo $v;?></span></td>
            			<td><span class="normal"><?php echo isset($tpl['guest_arr'][$k]) ? $tpl['guest_arr'][$k] : 0;?></span></td>
            			<td><span class="normal"><?php echo $percent;?></span></td>
            		</tr>
            		<?php
            	} 
            	?>
            </tbody>
        </table>
    </div>
    <?php
    if($controller->_get->toString('action') != 'pjActionPrintReport')
    {
        ?>
        <a target="_blank" href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminReports&action=pjActionPrintReport&from=<?php echo $controller->_get->check('from') ? $controller->_get->toString('from') : $created_date; ?>&to=<?php echo $controller->_get->check('to') ? $controller->_get->toString('to') : $current_date; ?>" class="btn btn-primary btn-md btn-outline"><i class="fa fa-print"></i> <?php __('btnPrint'); ?></a>
    	<?php
    }
}
?>