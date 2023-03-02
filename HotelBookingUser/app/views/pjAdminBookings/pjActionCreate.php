<?php 
$months = __('months', true);
ksort($months);
$short_days = __('short_days', true);
$bs = __('booking_statuses', true);
$hash = md5(uniqid(rand(), true));

$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$date_from =  !$controller->_get->check('date_from') ? date($tpl['option_arr']['o_date_format'], time()) : pjDateTime::formatDate($controller->_get->toString('date_from'), 'Y-m-d', $tpl['option_arr']['o_date_format']);
if ($tpl['option_arr']['o_price_based_on'] == 'days') {
	$date_to = $date_from;
} else {
	$iso_date_from = pjDateTime::formatDate($controller->_get->toString('date_from'), $tpl['option_arr']['o_date_format'], 'Y-m-d');
	$date_to = date($tpl['option_arr']['o_date_format'], strtotime($iso_date_from.' +1 day'));
}
?>
<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-lg-9 col-md-8 col-sm-6">
				<h2><?php echo @$titles['ABK14'];?></h2>
			</div>
		</div><!-- /.row -->

		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo @$bodies['ABK14'];?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-8">
        	<div class="tabs-container tabs-reservations m-b-lg">
        		<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionCreate" method="post" id="frmCreate" class="form pj-form">
        			<input type="hidden" name="booking_create" value="1" />
        			<input type="hidden" name="hash" value="<?php echo $hash; ?>" />
        			
        			<input type="hidden" class="form-control number" name="room_price" id="room_price">
					<input type="hidden" class="form-control number" name="extra_price" id="extra_price">
					<input type="hidden" class="form-control number" name="total" id="total">
					<input type="hidden" class="form-control number" name="tax" id="tax">
					<input type="hidden" class="form-control number" name="security" id="security">
					<input type="hidden" class="form-control number" name="deposit" id="deposit">
					<input type="hidden" class="form-control number" name="discount" id="discount">
        			
        			<ul class="nav nav-tabs" role="tablist">
        				<li role="presentation" class="active"><a class="nav-tab-booking-details" href="#tab-booking-details" aria-controls="booking-details" role="tab" data-toggle="tab"><?php __('booking_tab_details');?></a></li>
        				<li role="presentation"><a class="nav-tab-client-details" href="#tab-client-details" aria-controls="client-details" role="tab" data-toggle="tab"><?php __('booking_tab_client');?></a></li>
        			</ul>
        
        			<div class="tab-content">
        				<div role="tabpanel" class="tab-pane active" id="tab-booking-details">
        					<div class="panel-body">					
        						<div class="m-b-md">
        							<h2 class="no-margins"><?php __('booking_tab_details');?></h2>
        						</div>
        	
        						<div class="row">
        							<div class="col-md-4 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_uuid');?></label>
        	
        									<input type="text" class="form-control required" name="uuid" id="uuid" value="<?php echo $tpl['uuid']; ?>" maxlength="12" data-msg-required="<?php __('lblFieldRequired');?>" data-msg-remote="<?php __('lblDuplicateBookingUUID');?>" />
        								</div>
        							</div><!-- /.col-md-3 -->
        	
        							<div class="col-md-4 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_status');?></label>
        	
        									<select class="form-control required" name="status" id="status" data-msg-required="<?php __('lblFieldRequired');?>">
        										<option value="">-- <?php __('lblChoose');?> --</option>
            									<?php foreach ($bs as $k => $v) { ?>
            										<option value="<?php echo $k;?>"><?php echo $v;?></option>
            									<?php } ?>
        									</select>
        								</div>
        							</div><!-- /.col-md-3 -->
        							<?php
                        			$plugins_payment_methods = pjObject::getPlugin('pjPayments') !== NULL? pjPayments::getPaymentMethods(): array();
                        			$haveOnline = $haveOffline = false;
                        			foreach ($tpl['payment_titles'] as $k => $v)
                        			{
                        			    if( $k != 'cash' && $k != 'bank' )
                        			    {
                        			        if( (int) $tpl['payment_option_arr'][$k]['is_active'] == 1)
                        			        {
                        			            $haveOnline = true;
                        			            break;
                        			        }
                        			    }
                        			}
                        			foreach ($tpl['payment_titles'] as $k => $v)
                        			{
                        			    if( $k == 'cash' || $k == 'bank' )
                        			    {
                        			        if( (int) $tpl['payment_option_arr'][$k]['is_active'] == 1)
                        			        {
                        			            $haveOffline = true;
                        			            break;
                        			        }
                        			    }
                        			}
                        			?>
        							<div class="col-md-4 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_payment_method');?></label>
        	
        									<select name="payment_method" id="payment_method" class="form-control<?php echo (int) $tpl['option_arr']['o_disable_payments'] == 0 ? ' required' : NULL;?>" data-msg-required="<?php __('lblFieldRequired', false, true);?>">
        										<option value="">-- <?php __('lblChoose'); ?>--</option>
        										<?php
                                				if ($haveOnline && $haveOffline)
                                				{
                                				    ?><optgroup label="<?php __('script_online_payment_gateway', false, true); ?>"><?php
                                                }
                                                foreach ($tpl['payment_titles'] as $k => $v)
                                                {
                                                    if($k == 'cash' || $k == 'bank' ){
                                                        continue;
                                                    }
                                                    if (array_key_exists($k, $plugins_payment_methods))
                                                    {
                                                        if(!isset($tpl['payment_option_arr'][$k]['is_active']) || (isset($tpl['payment_option_arr']) && $tpl['payment_option_arr'][$k]['is_active'] == 0) )
                                                        {
                                                            continue;
                                                        }
                                                    }
                                                    ?><option value="<?php echo $k; ?>"<?php echo isset($tpl['arr']['payment_method']) && $tpl['arr']['payment_method']==$k ? ' selected="selected"' : NULL;?>><?php echo $v; ?></option><?php
                                                }
                                                if ($haveOnline && $haveOffline)
                                                {
                                                    ?>
                                                	</optgroup>
                                                	<optgroup label="<?php __('script_offline_payment', false, true); ?>">
                                                	<?php 
                                                }
                                                foreach ($tpl['payment_titles'] as $k => $v)
                                                {
                                                    if( $k == 'cash' || $k == 'bank' )
                                                    {
                                                        if( (int) $tpl['payment_option_arr'][$k]['is_active'] == 1)
                                                        {
                                                            ?><option value="<?php echo $k; ?>"<?php echo isset($tpl['arr']['payment_method']) && $tpl['arr']['payment_method']==$k ? ' selected="selected"' : NULL;?>><?php echo $v; ?></option><?php
                                                        }
                                                    }
                                                }
                                                if ($haveOnline && $haveOffline)
                                                {
                                                    ?></optgroup><?php
                                                }
                                				?>
        									</select>
        								</div>
        							</div><!-- /.col-md-3 -->
        						</div><!-- /.row -->
        	
        						<div class="row">
        							<div class="col-md-4 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_arrival_date');?></label>
        	
        									<div class="input-group">
        										<input type="text" class="form-control required datepick" name="date_from" id="date_from" value="<?php echo $date_from; ?>" readonly="readonly" data-based="<?php echo $tpl['option_arr']['o_price_based_on'];?>" data-msg-required="<?php __('lblFieldRequired');?>">
        	
        										<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
        									</div>
        								</div>
        							</div><!-- /.col-md-3 -->
        	
        							<div class="col-md-8 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_arrival_time');?></label>
        	
        									<div class="row">
        										<div class="col-sm-6">
        											<?php
        											echo pjDateTime::factory()
        												->attr('name', 'hour')
        												->attr('id', 'hour')
        												->attr('class', 'form-control')
        												->hour();
        											?>
        										</div><!-- /.col-sm-6 -->
        	
        										<div class="col-sm-6">
        											<?php
        											echo pjDateTime::factory()
        												->attr('name', 'minute')
        												->attr('id', 'minute')
        												->attr('class', 'form-control')
        												->prop('step', 5)
        												->minute();
        											?>
        										</div><!-- /.col-sm-6 -->
        									</div><!-- /.row -->
        								</div>
        							</div><!-- /.col-md-3 -->
        						</div>
        						<div class="row">
        							<div class="col-md-4 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_departure_date');?></label>
        	
        									<div class="input-group">
        										<input type="text" class="form-control required datepick" name="date_to" id="date_to" value="<?php echo $date_to;?>" readonly="readonly" data-based="<?php echo $tpl['option_arr']['o_price_based_on'];?>" data-msg-required="<?php __('lblFieldRequired');?>">
        	
        										<span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
        									</div>
        								</div>
        							</div><!-- /.col-md-3 -->
        	
        							<div class="col-md-8 col-sm-6">
        								<div class="form-group">
        									<label class="control-label"><?php __('booking_departure_time');?></label>
        	
        									<div class="row">
        										<div class="col-sm-6">
        											<?php
        											echo pjDateTime::factory()
        												->attr('name', 'd_hour')
        												->attr('id', 'd_hour')
        												->attr('class', 'form-control')
        												->hour();
        											?>
        										</div><!-- /.col-sm-6 -->
        	
        										<div class="col-sm-6">
        											<?php
        											echo pjDateTime::factory()
        												->attr('name', 'd_minute')
        												->attr('id', 'd_minute')
        												->attr('class', 'form-control')
        												->prop('step', 5)
        												->minute();
        											?>
        										</div><!-- /.col-sm-6 -->
        									</div><!-- /.row -->
        								</div>
        							</div><!-- /.col-md-3 -->
        						</div>
        						<div class="row">
        							<div class="col-lg-6 col-md-8 col-sm-8">
										<div class="form-group">
        									<label class="control-label"><?php __('booking_voucher');?></label>
        									
        									<div class="row">
												<div class="col-lg-6 col-md-6 col-sm-6">
													<input type="text" class="form-control" name="voucher" id="voucher">
        										</div>
        										<div class="col-lg-6 col-md-6 col-sm-6">
            										<a href="javascript:void(0);" class="btn btn-primary btn-outline booking-recalc"><i class="fa fa-calculator"></i> <?php __('booking_recalc');?></a>
            									</div>
            								</div>
            								
    									</div>
        							</div><!-- /.col-md-3 -->
        						</div><!-- /.row -->
        	
        						<div class="hr-line-dashed"></div>
        	
        						<div class="m-b-md">
        							<h2 class="no-margins"><?php __('booking_rooms_extras');?></h2>
        						</div>
        						
        						<div class="row">
        							<div class="col-md-7">
        								<div id="boxRooms"></div>
        								
        								<div class="m-t-sm m-b-md">
                                        	<a href="javascript:void(0);" class="btn btn-primary btn-outline m-t-xs pjBtnAddRoom"><i class="fa fa-plus"></i> <?php __('booking_add_room');?></a>
                                        </div>
        							</div><!-- /.col-sm-6 -->
        															  
        							<div class="col-md-5">
        								<div class="form-group">
        									<div class="table-responsive table-responsive-secondary">
        										<table class="table table-striped table-hover">
        											<thead>
        												<tr>
        													<th class="cell-width-2"></th>
        													<th><?php __('booking_extras');?></th>
        												</tr>
        											</thead>
        	
        											<tbody>
        												<?php if (isset($tpl['extra_arr']) && $tpl['extra_arr']) { 
        													$extra_pers = __('extra_per', true);
        												?>
        													<?php foreach ($tpl['extra_arr'] as $extra) { ?>
        														<tr>
        															<td class="cell-width-2"><input type="checkbox" class="i-checks" name="extra_id[<?php echo $extra['id']; ?>]" value="<?php echo $extra['per']; ?>|<?php echo $extra['price']; ?>"></td>
        															<td><?php echo pjSanitize::html($extra['name']); ?> / <?php echo pjCurrency::formatPrice($extra['price']); ?> - <?php echo @$extra_pers[$extra['per']]; ?></td>
        														</tr>
        													<?php } ?>
        												<?php } ?>
        											</tbody>
        										</table>
        									</div>
        								</div><!-- /.form-group -->
        							</div><!-- /.col-sm-6 -->
        						</div><!-- /.row -->
        						
        						<div class="hr-line-dashed"></div>
        	
        						<div class="clearfix">
        							 <button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
                            			<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
                            			<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
                            		</button>
    	                             <button type="button" class="btn btn-white btn-lg pull-right" onclick="window.location.href='<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjAdminBookings&action=pjActionIndex';"><?php __('btnCancel'); ?></button>
        						</div><!-- /.clearfix -->
        						
        					</div>
        				</div>
        	
        				<div role="tabpanel" class="tab-pane" id="tab-client-details">
        					<div class="panel-body">
        						<div class="row">
        							<div class="col-lg-6 col-md-8 col-sm-12">
        								<div class="form-group">
                                            <label class="control-label"><?php __('lblClient'); ?></label>
                
                                            <div class="clearfix">
                                                <div class="switch onoffswitch-data pull-left">
                                                    <div class="onoffswitch onoffswitch-client">
                                                        <input type="checkbox" class="onoffswitch-checkbox" id="new_client" name="new_client" checked>
                
                                                        <label class="onoffswitch-label" for="new_client">
                                                            <span class="onoffswitch-inner" data-on="<?php __('lblNewClient'); ?>" data-off="<?php __('lblExistingClient'); ?>"></span>
                                                            <span class="onoffswitch-switch"></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div><!-- /.clearfix -->
                                        </div><!-- /.form-group -->
        							</div>
        						</div>
        						<div class="current-client-area" style="display:none;">
                                    	
                        			<div class="form-group">
                                        <label class="control-label"><?php __('lblExistingClient'); ?></label>
                                        <div class="row">
                                    		<div class="col-md-10">
                                                <select name="client_id" id="client_id" class="select-countries form-control hdRequired" data-msg-required="<?php __('lblFieldRequired', false, true);?>">
                									<option value="">-- <?php __('lblChoose'); ?>--</option>
                									<?php
                									foreach ($tpl['client_arr'] as $v)
                									{
                										$email_phone = array();
                										if(!empty($v['c_email']))
                										{
                											$email_phone[] = stripslashes($v['c_email']);
                										}
                										if(!empty($v['c_phone']))
                										{
                											$email_phone[] = stripslashes($v['c_phone']);
                										}
                										?><option value="<?php echo $v['id']; ?>"><?php echo pjSanitize::clean($v['c_name']); ?> (<?php echo join(" | ", $email_phone); ?>)</option><?php
                									}
                									?>
                								</select>
        									</div>
                							<div class="col-md-2">
                                    			<a id="pjFdEditClient" class="btn btn-primary btn-outline btn-sm m-l-xs" href="#" target="blank" data-href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminClients&amp;action=pjActionUpdate&id={ID}" style="display:none;"><i class="fa fa-pencil"></i></a>
                                    		</div>
                                       </div>
                                	</div>
                                </div><!-- /.hidden-area -->
                                <div class="new-client-area">
            						<div class="row">
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_title');?></label>
            
            									<select class="form-control" name="c_title" id="c_title">
            										<?php
            										foreach (__('personal_titles', true) as $k => $v)
            										{
            											?><option value="<?php echo $k; ?>"><?php echo stripslashes($v); ?></option><?php
            										}
            										?>
            									</select>
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_name');?></label>
            
            									<input type="text" class="form-control hdRequired required" name="c_name" id="c_name" data-msg-required="<?php __('lblFieldRequired');?>" >
            								</div>
            							</div><!-- /.col-md-3 -->
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_email');?></label>
            
            									<input type="text" class="form-control hdRequired required email" name="c_email" id="c_email" data-msg-required="<?php __('lblFieldRequired');?>" data-msg-email="<?php __('lblEmailInvalid');?>">
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_phone');?></label>
            
            									<input type="text" class="form-control" name="c_phone" id="c_phone">
            								</div>
            							</div><!-- /.col-md-3 -->
            						</div><!-- /.row -->
            
            						<div class="hr-line-dashed"></div>
        
            						<div class="row">
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_company');?></label>
            
            									<input type="text" class="form-control" name="c_company" id="c_company">
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_address');?></label>
            
            									<input type="text" class="form-control" name="c_address" id="c_address">
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_city');?></label>
            
            									<input type="text" class="form-control" name="c_city" id="c_city">
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_state');?></label>
            
            									<input type="text" class="form-control" name="c_state" id="c_state" >
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_zip');?></label>
            
            									<input type="text" class="form-control" name="c_zip" id="c_zip" >
            								</div>
            							</div><!-- /.col-md-3 -->
            
            							<div class="col-lg-3 col-md-4 col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('booking_c_country');?></label>
            
            									<select class="select-countries form-control" name="c_country" id="c_country" data-placeholder="-- <?php __('lblChoose'); ?> --">
            										<option value="">-- <?php __('lblChoose'); ?> --</option>
            										<?php
            										foreach ($tpl['country_arr'] as $item)
            										{
            											?><option value="<?php echo $item['id']; ?>"><?php echo stripslashes($item['name']); ?></option><?php
            										}
            										?>
            									</select>
            								</div>
            							</div><!-- /.col-md-3 -->
            						</div><!-- /.row -->
            
            						<div class="row">
            							<div class="col-sm-6">
            								<div class="form-group">
            									<label class="control-label"><?php __('opt_o_bf_notes');?></label>
            
            									<textarea class="form-control" name="c_notes" id="c_notes" cols="30" rows="10"></textarea>
            								</div>
            							</div><!-- /.col-md-3 -->
            						</div><!-- /.row -->
            					</div>
        
        						<div class="hr-line-dashed"></div>
        						
        						<div class="clearfix">
        							 <button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
                            			<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
                            			<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
                            		</button>
                                     <button type="button" class="btn btn-white btn-lg pull-right" onclick="window.location.href='<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjAdminBookings&action=pjActionIndex';"><?php __('btnCancel'); ?></button>
        						</div><!-- /.clearfix -->
        					</div>
        				</div>
        			</div>
        		</form>
        	</div>
        </div><!-- /.col-lg-8 -->
        <div class="col-lg-4">
            <div class="m-b-lg">
            	<?php
            	$bg_class = 'bg-pending';
            	?>
                <div id="pjFdPriceWrapper" class="panel no-borders">
                    <div class="panel-heading <?php echo $bg_class;?>">
                        <p class="lead m-n">
                            <i class="fa fa-check"></i> <?php __('booking_status');?>: <span class="pull-right status-text"></span>
                        </p>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        
                        <p class="lead m-b-md">
                            <?php __('booking_room_price');?>: <span id="booking_room_price" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                        <p class="lead m-b-md">
                            <?php __('booking_extra_price');?>: <span id="booking_extra_price" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                        <p class="lead m-b-md">
                            <?php __('booking_discount');?>: <span id="booking_discount" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                        <p class="lead m-b-md">
                            <?php __('booking_total');?>: <span id="booking_total" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                        <p class="lead m-b-md">
                            <?php __('booking_tax');?>: <span id="booking_tax" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                        <p class="lead m-b-md">
                            <?php __('booking_security');?>: <span id="booking_security" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                        <p class="lead m-b-md">
                            <?php __('booking_deposit');?>: <span id="booking_deposit" class="pull-right"><?php echo pjCurrency::formatPrice(0);?></span>
                        </p>
                    </div><!-- /.panel-body -->
            	</div>
       		</div>
       	</div>
	</div><!-- /.row -->
</div><!-- /.wrapper wrapper-content -->

<div class="modal fade" id="editBookingRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog modal-md" role="document">
	    <div class="modal-content">
		      <div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        	<h4 class="modal-title"><?php __('booking_room_edit');?></h4>
		      </div>
		      <div id="editBookingRoomBody" class="modal-body"></div>
		      <div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('btnCancel');?></button>
		        	<button id="btnUpdateBookingRoom" type="button" class="btn btn-primary"><?php __('btnUpdate');?></button>
		      </div>
	    </div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="addBookingRoomModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog modal-md" role="document">
	    <div class="modal-content">
		      <div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        	<h4 class="modal-title"><?php __('booking_room_add_title');?></h4>
		      </div>
		      <div id="addBookingRoomBody" class="modal-body"></div>
		      <div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('btnCancel');?></button>
		        	<button id="btnAddBookingRoom" type="button" class="btn btn-primary"><?php __('btnAdd');?></button>
		      </div>
	    </div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
	
var myLabel = myLabel || {};
myLabel.alert_btn_delete = "<?php __('btnDelete', false, true); ?>";
myLabel.alert_btn_cancel = "<?php __('btnCancel', false, true); ?>";
myLabel.alert_delete_booking_room_title = "<?php __('booking_room_delete', false, true); ?>";
myLabel.alert_delete_booking_room_text = "<?php __('delete_confirmation', false, true); ?>";
	
</script>