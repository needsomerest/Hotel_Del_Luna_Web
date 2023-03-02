<?php 
$months = __('months', true);
ksort($months);
$short_days = __('short_days', true);
$bs = __('booking_statuses', true);
?>
<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-10">
				<h2><?php __('availability_title');?></h2>
			</div>
		</div><!-- /.row -->

		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php __('availability_desc');?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div id="boxCalendar"><?php include dirname(__FILE__) . '/pjActionGetCalendar.php'; ?></div>
				<div class="clearfix">
    				<div class="donut-chart-legend no-padding pull-left">
    					<strong class="donut-color-1"></strong>
    					<span><?php __('availability_confirmed');?></span>
    
    					<strong class="donut-color-2"></strong>
    					<span><?php __('availability_pending');?></span>
    					
    					<strong class="bg-danger"></strong>
    					<span><?php __('availability_unavailable');?></span>
    				</div>
    				<div class="pull-right">
    					<a data-href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminAvailability&action=pjActionPrintCalendar" id="hb_print_calendar" target="_blank" href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminAvailability&action=pjActionPrintCalendar&selected_date=<?php echo $selected_date;?>" class="btn btn-primary"><?php __('btnPrintCalendar'); ?></a>
    				</div>
    			</div>
			</div>
		</div>
	</div><!-- /.col-lg-12 -->
</div><!-- /.wrapper wrapper-content -->