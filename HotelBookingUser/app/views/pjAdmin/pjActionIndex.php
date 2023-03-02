<?php
$today = pjDateTime::formatDate(date('Y-m-d'), 'Y-m-d', $tpl['option_arr']['o_date_format']);
$avail_room_arr = array();
$avail_today = 0;
if (isset($tpl['avail_room_arr']))
{
    foreach ($tpl['avail_room_arr'] as $v)
    {
        $cnt = $v['cnt']- $v['booked_rooms'] - $v['pending_rooms'];
        if(isset($tpl['restrictions']) && isset($tpl['restrictions'][$v['id']]) && (int) $tpl['restrictions'][$v['id']] > 0)
        {
            $cnt = $cnt - (int) $tpl['restrictions'][$v['id']];
        }
        $avail_today += $cnt;
        $avail_room_arr[] = '<p class="clearfix"><span class="pull-left">'.pjSanitize::clean($v['name']).'</span><span class="pull-right">'.$cnt.'</span></p>';
    }
}
?>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
         <div class="col-lg-3 col-sm-6">
         	<div class="ibox float-e-margins">
         		<div class="ibox-content">
         			<p class="clearfix"><span class="pull-left"><?php __('dash_room_booked_today'); ?></span><span class="pull-right"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionIndex&amp;today=<?php echo date('Y-m-d');?>&amp;status=confirmed"><?php echo (int) @$tpl['arr']['booked_today'];?></a></span></p>
         			<p class="clearfix"><span class="pull-left"><?php __('dash_pending_rooms_today'); ?></span><span class="pull-right"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionIndex&amp;today=<?php echo date('Y-m-d');?>&amp;status=pending"><?php echo (int) @$tpl['arr']['pending_today'];?></a></span></p>
         			<p class="clearfix"><span class="pull-left"><?php __('dash_available_rooms_today'); ?></span><span class="pull-right"><?php echo $avail_today;?></span></p>
         			
         			<hr />
         			
         			<p class="h4"><?php __('dash_available_rooms_type'); ?></p>
         			<?php
					echo implode("", $avail_room_arr); 
					?>
         			
         			<p class="h5"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminAvailability&action=pjActionIndex"><i class="fa fa-calendar" aria-hidden="true"></i> <?php __('dash_view_calendar'); ?></a></p>
         			
         			<hr />
         			
         			<p class="h4"><?php __('dash_guests'); ?></p>
         			<p class="clearfix"><span class="pull-left"><?php __('dash_staying_tonight'); ?></span><span class="pull-right"><?php echo !empty($tpl['sleeping']['guests']) ? $tpl['sleeping']['guests'] : 0;?></span></p>
         			<p class="clearfix"><span class="pull-left padding-sm"><?php __('dash_adults'); ?></span><span class="pull-right"><?php echo !empty($tpl['sleeping']['total_adults']) ? $tpl['sleeping']['total_adults'] : 0;?></span></p>
         			<p class="clearfix"><span class="pull-left padding-sm"><?php __('dash_children'); ?></span><span class="pull-right"><?php echo !empty($tpl['sleeping']['total_children']) ? $tpl['sleeping']['total_children'] : 0;?></span></p>
         			
         			<hr />
         			
         			<p class="clearfix"><span class="pull-left"><?php __('dash_arriving_today'); ?></span><span class="pull-right"><?php echo !empty($tpl['arrive_today'][0]['guests']) ? $tpl['arrive_today'][0]['guests'] : 0;?></span></p>
         			<p class="clearfix"><span class="pull-left padding-sm"><?php __('dash_adults'); ?></span><span class="pull-right"><?php echo !empty($tpl['arrive_today'][0]['total_adults']) ? $tpl['arrive_today'][0]['total_adults'] : 0;?></span></p>
         			<p class="clearfix"><span class="pull-left padding-sm"><?php __('dash_children'); ?></span><span class="pull-right"><?php echo !empty($tpl['arrive_today'][0]['total_children']) ? $tpl['arrive_today'][0]['total_children'] : 0;?></span></p>
         			
         			<hr />
         			
         			<p class="clearfix"><span class="pull-left"><?php __('dash_leaving_today'); ?></span><span class="pull-right"><?php echo !empty($tpl['leave_today'][0]['guests']) ? $tpl['leave_today'][0]['guests'] : 0;?></span></p>
         			<p class="clearfix"><span class="pull-left padding-sm"><?php __('dash_adults'); ?></span><span class="pull-right"><?php echo !empty($tpl['leave_today'][0]['total_adults']) ? $tpl['leave_today'][0]['total_adults'] : 0;?></span></p>
         			<p class="clearfix"><span class="pull-left padding-sm"><?php __('dash_children'); ?></span><span class="pull-right"><?php echo !empty($tpl['leave_today'][0]['total_children']) ? $tpl['leave_today'][0]['total_children'] : 0;?></span></p>
         			
         		</div><!-- /.ibox-content -->
         	</div><!-- /.ibox float-e-margins -->
         </div><!-- /.col-lg-3 col-sm-6 -->
         <div class="col-lg-5 col-sm-6">
         	<div class="tabs-container tabs-reservations m-b-lg">
             	<ul class="nav nav-tabs" role="tablist">
             		<li role="presentation" class="active"><a class="nav-tab-bookings-1" href="#tab-bookings-1" aria-controls="bookings-1" role="tab" data-toggle="tab"><?php __('dash_tab_arrivals');?></a></li>
    				<li role="presentation"><a class="nav-tab-bookings-2" href="#tab-bookings-2" aria-controls="bookings-2" role="tab" data-toggle="tab"><?php __('dash_tab_departures');?></a></li>
    				<li role="presentation"><a class="nav-tab-bookings-3" href="#tab-bookings-3" aria-controls="bookings-3" role="tab" data-toggle="tab"><?php __('dash_tab_latest');?></a></li>
    			</ul>
    			<div class="tab-content">
    				<div role="tabpanel" class="tab-pane active" id="tab-bookings-1">
    					<div class="panel-body">
    						<?php
    						if (isset($tpl['arrivals_arr']) && !empty($tpl['arrivals_arr']))
    						{
    						    foreach ($tpl['arrivals_arr'] as $k => $v)
    						    {
    						        ?>
    						        <p><?php __('dash_id'); ?>: <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionUpdate&amp;id=<?php echo $v['id']; ?>"><?php echo pjSanitize::html($v['uuid']);?></a></p>
    						        <p><?php echo pjSanitize::clean($v['c_name']);?></p>
    						        <?php
    						        if(!empty($v['c_phone']))
    						        {
    						            ?><p><?php echo pjSanitize::clean($v['c_phone']);?></p><?php
    						        }
    						        ?>
    						        <p><strong><?php __('dash_stay'); ?></strong>: <?php __('dash_to'); ?> <?php echo pjDateTime::formatDate($v['date_to'], 'Y-m-d', $tpl['option_arr']['o_date_format']);?>, <?php echo $v['nights'] . ' '; $v['nights'] != 1 ? __('dash_nights') : __('dash_night');?></p>
    						        <p><strong><?php __('dash_rooms'); ?></strong>:</p>
    						        <p><?php echo pjSanitize::clean($v['rooms']);?></p>
    						        <hr/>
    						        <?php
    						    }
    						    ?>
    						    <p class="h5"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionIndex&amp;date_from=<?php echo $today; ?>&amp;status=confirmed"><i class="fa fa-list" aria-hidden="true"></i> <?php __('dash_view_all_arrivals'); ?></a></p>
    						    <?php
    						}else{
    						    ?><p><?php __('dash_no_arrivals'); ?></p><?php 
    						}
    						?>
    					</div>
    				</div>
    				<div role="tabpanel" class="tab-pane" id="tab-bookings-2">
    					<div class="panel-body">
    						<?php
    						if (isset($tpl['departure_arr']) && !empty($tpl['departure_arr']))
    						{
    						    foreach ($tpl['departure_arr'] as $k => $v)
    						    {
    						        ?>
    						        <p><?php __('dash_id'); ?>: <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionUpdate&amp;id=<?php echo $v['id']; ?>&amp;status=confirmed"><?php echo pjSanitize::html($v['uuid']);?></a></p>
    						        <p><?php echo pjSanitize::clean($v['c_name']);?></p>
    						        <?php
    						        if(!empty($v['c_phone']))
    						        {
    						            ?><p><?php echo pjSanitize::clean($v['c_phone']);?></p><?php
    						        }
    						        ?>
    						        <p><strong><?php __('dash_rooms'); ?></strong>:</p>
    						        <p><?php echo pjSanitize::clean($v['rooms']);?></p>
    						        <hr/>
    						        <?php
    						    }
    						    ?>
    						    <p class="h5"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionIndex&amp;date_to=<?php echo $today; ?>"><i class="fa fa-list" aria-hidden="true"></i> <?php __('dash_view_all_departures'); ?></a></p>
    						    <?php
    						}else{
    						    ?><p><?php __('dash_no_departures'); ?></p><?php 
    						}
    						?>
    					</div>
    				</div>
    				<div role="tabpanel" class="tab-pane" id="tab-bookings-3">
    					<div class="panel-body">
    						<?php
    						if (isset($tpl['latest_booking_arr']) && !empty($tpl['latest_booking_arr']))
    						{
    						    $bs = __('booking_statuses', true);
    						    foreach ($tpl['latest_booking_arr'] as $k => $v)
    						    {
    						        $fa_class = '';
    						        $bg_class = '';
    						        if($v['status'] == 'cancelled' || $v['status'] == 'not_confirmed')
    						        {
    						            $fa_class = ' fa-times';
    						            $bg_class = ' bg-canceled';
    						        }else if($v['status'] == 'pending'){
    						            $fa_class = ' fa-exclamation-triangle';
    						            $bg_class = ' bg-pending';
    						        }else if($v['status'] == 'confirmed'){
    						            $fa_class = ' fa-check';
    						            $bg_class = ' bg-confirmed';
    						        }
    						        ?>
    						        <p><?php __('dash_id'); ?>: <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionUpdate&amp;id=<?php echo $v['id']; ?>"><?php echo pjSanitize::html($v['uuid']);?></a></p>
    						        <p><?php echo pjSanitize::clean($v['c_name']);?></p>
    						        <?php
    						        if(!empty($v['c_phone']))
    						        {
    						            ?><p><?php echo pjSanitize::clean($v['c_phone']);?></p><?php
    						        }
    						        ?>
    						        <p><span class="<?php echo $bg_class;?> btn-xs no-margin"><i class="fa<?php echo $fa_class;?>"></i> <?php echo $bs[$v['status']];?></span></p>
    						        <p><strong><?php __('dash_stay'); ?></strong>: <?php __('dash_from'); ?> <?php echo pjDateTime::formatDate($v['date_from'], 'Y-m-d', $tpl['option_arr']['o_date_format']);?> <?php __('dash_to'); ?> <?php echo pjDateTime::formatDate($v['date_to'], 'Y-m-d', $tpl['option_arr']['o_date_format']);?>, <?php echo $v['nights'] . ' '; $v['nights'] != 1 ? __('dash_nights') : __('dash_night'); ?></p>
    						        <p><strong><?php __('dash_rooms'); ?></strong>:</p>
    						        <p><?php echo pjSanitize::clean($v['rooms']);?></p>
    						        <hr/>
    						        <?php
    						    }
    						    ?>
    						    <p class="h5"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionIndex"><i class="fa fa-list" aria-hidden="true"></i> <?php __('dash_view_all_bookings'); ?></a></p>
    						    <?php
    						}else{
    						    ?><p><?php __('dash_no_bookings'); ?></p><?php 
    						}
    						?>
    					</div>
    				</div>
    			</div><!-- /.tab-content -->
    		</div><!-- /.tabs-container tabs-reservations m-b-lg -->
         </div><!-- /.col-lg-3 col-sm-6 -->
         <div class="col-lg-4 col-sm-12">
         	<div class="tabs-container tabs-reservations m-b-lg">
             	<ul class="nav nav-tabs" role="tablist">
             		<li role="presentation" class="active"><a class="nav-tab-charts-1" href="#tab-charts-1" aria-controls="charts-1" role="tab" data-toggle="tab"><?php __('dash_tab_upcoming');?></a></li>
    				<li role="presentation"><a class="nav-tab-charts-2" href="#tab-charts-2" aria-controls="charts-2" role="tab" data-toggle="tab"><?php __('dash_tab_past');?></a></li>
    			</ul>
    			<div class="tab-content">
    				<div role="tabpanel" class="tab-pane active" id="tab-charts-1">
    					<div class="panel-body">
    						<div id="chart-1" style="height: 450px">
        						<?php
        						if(!isset($tpl['avail_room_arr']))
        						{ 
        						    ?><p><?php __('lblNoData');?></p><?php
        						} 
        						?>
        					</div>
        					<div id="chart-2" style="height: 450px"></div>
    					</div>
    				</div>
    				<div role="tabpanel" class="tab-pane" id="tab-charts-2">
    					<div class="panel-body">
    						<div id="chart-2-container">
        						
        					</div>
    					</div>
    				</div>
    			</div><!-- /.tab-content -->
    		</div><!-- /.tabs-container tabs-reservations m-b-lg -->
         </div><!-- /.col-lg-6 col-sm-12 -->
    </div><!-- /.row -->
</div><!-- /.wrapper wrapper-content -->

<script type="text/javascript">
var myLabel = myLabel || {};
myLabel.room_avail = "<?php echo isset($tpl['avail_room_arr']) ? 'true' : 'false'; ?>";
</script>