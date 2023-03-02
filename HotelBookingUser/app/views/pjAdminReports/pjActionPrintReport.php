<?php
if (isset($tpl['status']))
{
	$status = __('status', true);
	switch ($tpl['status'])
	{
		case 2:
			pjUtil::printNotice(NULL, $status[2]);
			break;
	}
} else {	
	
    if ($controller->_get->check('from') && $controller->_get->check('to'))
    {
		?>
		<div class="printHeading">
			<h1><?php __('report_print'); ?></h1>
			<p><?php __('booking_arrival_date'); ?>: <?php echo $controller->_get->toString('from'); ?></p>
			<p><?php __('booking_departure_date'); ?>: <?php echo $controller->_get->toString('to'); ?></p>
		</div>
		<?php 
		include dirname(__FILE__) . '/pjActionGetReport.php';
	}
}	
?>