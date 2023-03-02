<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$enum_arr = __('enum_arr', true);
$discount_types = __('discount_types', true);
?>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <h2><?php echo @$titles['AO23']; ?></h2>
            </div>
        </div>

        <p class="m-b-none"><i class="fa fa-info-circle"></i><?php echo @$bodies['AO23']; ?></p>
    </div>
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<?php
	$error_code = $controller->_get->toString('err');
	if (!empty($error_code))
    {
    	switch (true)
    	{
    		case in_array($error_code, array('AO03')):
    			?>
    			<div class="alert alert-success">
    				<i class="fa fa-check m-r-xs"></i>
    				<strong><?php echo @$titles[$error_code]; ?></strong>
    				<?php echo @$bodies[$error_code]?>
    			</div>
    			<?php
    			break;
    		case in_array($error_code, array('')):
    			?>
    			<div class="alert alert-danger">
    				<i class="fa fa-exclamation-triangle m-r-xs"></i>
    				<strong><?php echo @$titles[$error_code]; ?></strong>
    				<?php echo @$bodies[$error_code]?>
    			</div>
    			<?php
    			break;
    	}
    }
		?>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionUpdate" method="post" id="frmUpdateOptions">
			<input type="hidden" name="options_update" value="1" />
			<input type="hidden" name="tab" value="1" />
			<input type="hidden" name="next_action" value="pjActionBooking" />
			<div class="col-lg-6">
				<div class="ibox float-e-margins settings-box">
					<div class="ibox-content ibox-heading">
						<h3><?php echo @$titles['AO21']; ?></h3>
		
						<small><?php echo @$bodies['AO21']; ?></small>
					</div>

					<div class="ibox-content">
						<div class="m-b-md">
                            <h3><?php __('opt_o_accept_bookings'); ?></h3>

                            <small class="help-block m-b-none"><?php __('opt_o_accept_bookings_desc'); ?></small>
                        </div>

                        <div class="switch">
                            <div class="onoffswitch onoffswitch-yn">
                                <input class="onoffswitch-checkbox" id="value-bool-o_accept_bookings" name="value-bool-o_accept_bookings" type="checkbox"<?php echo $tpl['option_arr']['o_accept_bookings'] == 1 ? ' checked="checked"' : NULL; ?> value="1|0::1">
                                <label class="onoffswitch-label" for="value-bool-o_accept_bookings">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        
						<div class="m-b-md">
							<h3><?php __('opt_o_status_if_paid'); ?>:</h3>
		
							<small><?php __('opt_o_status_if_paid_desc'); ?></small>
						</div>

                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                        <input value="confirmed|pending|cancelled::confirmed" name="value-enum-o_status_if_paid"<?php echo $tpl['option_arr']['o_status_if_paid'] == 'confirmed' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_status_if_paid"><?php echo $enum_arr['confirmed']; ?></label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                        <input value="confirmed|pending|cancelled::pending" name="value-enum-o_status_if_paid"<?php echo $tpl['option_arr']['o_status_if_paid'] == 'pending' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_status_if_paid"><?php echo $enum_arr['pending']; ?></label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                       <input value="confirmed|pending|cancelled::cancelled" name="value-enum-o_status_if_paid"<?php echo $tpl['option_arr']['o_status_if_paid'] == 'cancelled' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_status_if_paid"><?php echo $enum_arr['cancelled']; ?></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="m-b-md">
							<h3><?php __('opt_o_status_if_not_paid'); ?>:</h3>
		
							<small><?php __('opt_o_status_if_not_paid_desc'); ?></small>
						</div>

                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                        <input value="confirmed|pending|cancelled::confirmed" name="value-enum-o_status_if_not_paid"<?php echo $tpl['option_arr']['o_status_if_not_paid'] == 'confirmed' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_status_if_not_paid"><?php echo $enum_arr['confirmed']; ?></label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                        <input value="confirmed|pending|cancelled::pending" name="value-enum-o_status_if_not_paid"<?php echo $tpl['option_arr']['o_status_if_not_paid'] == 'pending' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_status_if_not_paid"><?php echo $enum_arr['pending']; ?></label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                       <input value="confirmed|pending|cancelled::cancelled" name="value-enum-o_status_if_not_paid"<?php echo $tpl['option_arr']['o_status_if_not_paid'] == 'cancelled' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_status_if_not_paid"><?php echo $enum_arr['cancelled']; ?></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

						<div class="m-b-md">
							<h3><?php __('opt_o_price_based_on'); ?>:</h3>
		
						</div>

                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                        <input value="days|nights::days" name="value-enum-o_price_based_on"<?php echo $tpl['option_arr']['o_price_based_on'] == 'days' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_price_based_on"><?php echo $enum_arr['days']; ?></label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-6">
                                <div class="form-group">
                                    <div class="radio radio-primary">
                                        <input value="days|nights::nights" name="value-enum-o_price_based_on"<?php echo $tpl['option_arr']['o_price_based_on'] == 'nights' ? ' checked="checked"' : NULL; ?> type="radio">
                                        <label for="value-enum-o_price_based_on"><?php echo $enum_arr['nights']; ?></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="hr-line-dashed"></div>
                        <div class="row">
                        	<div class="col-sm-12">
	                        	<div class="m-b-md">
		                            <h3><?php __('opt_o_allow_pending_time'); ?>:</h3>
		                        </div>
	
		                        <div class="switch">
		                            <div class="onoffswitch onoffswitch-allow-pending-time">
		                                <input class="onoffswitch-checkbox" id="value-bool-o_allow_pending_time" name="value-bool-o_allow_pending_time" type="checkbox"<?php echo $tpl['option_arr']['o_allow_pending_time'] == 1 ? ' checked="checked"' : NULL; ?> value="1|0::1">
		                                <label class="onoffswitch-label" for="value-bool-o_allow_pending_time">
		                                    <span class="onoffswitch-inner"></span>
		                                    <span class="onoffswitch-switch"></span>
		                                </label>
		                            </div>
		                        </div>
		                	</div>
                        </div>
                        <div class="row set-pending-time" style="display: <?php echo (int)$tpl['option_arr']['o_allow_pending_time'] == 1 ? NULL : 'none';?>;">
                            <div class="col-sm-12">
                                <div class="m-b-md">
                                    <p><small class="help-block m-b-none"><?php __('opt_o_pending_time_desc'); ?></small></p>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                           	<input class="allowMaxPendingTime form-control" value="<?php echo $tpl['option_arr']['o_pending_time']?>" name="value-int-o_pending_time" style="display: block;" type="text">
                                        </div><!-- /.form-group -->
                                    </div><!-- /.col-sm-6 -->
                        
                                </div><!-- /.row -->
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        
                        <button class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
							<span class="ladda-label"><?php __('plugin_base_btn_save'); ?></span>
							<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
						</button>
                    </div>
                </div>
            </div><!-- /.col-lg-6 -->

            <div class="col-lg-6">
                <div class="ibox float-e-margins settings-box">
                    <div class="ibox-content ibox-heading">
                        <h3><?php echo @$titles['AO37']; ?></h3>

                        <small><?php echo @$bodies['AO37']; ?></small>
                    </div>

                    <div class="ibox-content">
                        <div class="m-b-md">
                            <h3><?php __('opt_o_disable_payments'); ?></h3>

                            <small class="help-block m-b-none"><?php __('opt_o_disable_payments_desc'); ?></small>
                        </div>

                        <div class="switch">
                            <div class="onoffswitch onoffswitch-yn">
                                <input class="onoffswitch-checkbox" id="value-bool-o_disable_payments" name="value-bool-o_disable_payments" type="checkbox"<?php echo $tpl['option_arr']['o_disable_payments'] == 1 ? ' checked="checked"' : NULL; ?> value="1|0::1">
                                <label class="onoffswitch-label" for="value-bool-o_disable_payments">
                                    <span class="onoffswitch-inner"></span>
                                    <span class="onoffswitch-switch"></span>
                                </label>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="m-b-md">
                                    <h3><?php __('opt_o_deposit'); ?>:</h3>

                                    <p><small class="help-block m-b-none"><?php __('opt_o_deposit_desc'); ?></small></p>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                           	<input class="touchspin3 field-int form-control" value="<?php echo $tpl['option_arr']['o_deposit']?>" name="value-int-o_deposit" style="display: block;" type="text">
                                        </div><!-- /.form-group -->
                                    </div><!-- /.col-sm-6 -->
                        
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <select class="form-control" name="value-enum-o_deposit_type">
                                                <option value="amount|percent::amount"<?php echo $tpl['option_arr']['o_deposit_type'] == 'amount' ? ' selected="selected"' : NULL; ?>><?php echo $discount_types['amount']; ?></option>
                                                <option value="amount|percent::percent"<?php echo $tpl['option_arr']['o_deposit_type'] == 'percent' ? ' selected="selected"' : NULL; ?>><?php echo $discount_types['percent']; ?></option>
                                            </select>
                                        </div><!-- /.form-group -->
                                    </div><!-- /.col-sm-6 -->
                                </div><!-- /.row -->
                            </div>

                            <div class="col-sm-6">
                                <div class="m-b-md">
                                    <h3><?php __('opt_o_security'); ?>:</h3>

                                    <p><small class="help-block m-b-none"><?php __('opt_o_security_desc'); ?></small></p>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="value-int-o_security" value="<?php echo (int) $tpl['option_arr']['o_security']; ?>" /> 
                        
                                            <span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span> 
                                        </div>
                                    </div><!-- /.col-sm-6 -->
                                </div><!-- /.row -->
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="m-b-md">
                                        <h3><?php __('opt_o_tax'); ?>:</h3>

                                        <p><small class="help-block m-b-none"><?php __('opt_o_tax_desc'); ?></small></p>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <input class="form-control" type="text" name="value-int-o_tax" value="<?php echo (int) $tpl['option_arr']['o_tax']; ?>" />
                                
                                                    <span class="input-group-addon"><i class="fa fa-percent"></i></span> 
                                                </div>
                                            </div><!-- /.form-group -->
                                        </div><!-- /.col-sm-6 -->
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="m-b-md">
                                        <h3><?php __('opt_o_require_all_within')?>:</h3>

                                        <small><?php __('opt_o_require_all_within_desc')?></small>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6 col-sm-7 col-xs-8">
                                           	<input class="touchspin3 field-int form-control" value="<?php echo $tpl['option_arr']['o_require_all_within']?>" name="value-int-o_require_all_within" style="display: block;" type="text">
                                        </div>

                                        <div class="col-lg-6 col-sm-5 col-xs-4">
                                            <div class="form-control-static">
                                                <label class="control-label"><?php echo strtolower($enum_arr['days']); ?></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="hr-line-dashed"></div>
                        
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="m-b-md">
                                    <h3><?php __('opt_o_thankyou_page_label'); ?>:</h3>

                                    <p><small class="help-block m-b-none"><?php __('opt_o_thankyou_page_desc'); ?></small></p>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-12">
                                    	<div class="input-group">
            								<span class="input-group-addon"><i class="fa fa-globe"></i></span> 
            								<input class="form-control" value="<?php echo $tpl['option_arr']['o_thankyou_page']?>" name="value-int-o_thankyou_page" type="text">
            							</div>
                                    </div><!-- /.col-sm-6 -->
                        
                                </div><!-- /.row -->
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <button class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
							<span class="ladda-label"><?php __('plugin_base_btn_save'); ?></span>
							<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
						</button>
                    </div>
                </div>
            </div><!-- /.col-lg-6 -->
		</form>
</div>