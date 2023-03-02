	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-lg-9 col-md-8 col-sm-6">
					<h2><?php __('prices_title');?></h2>
				</div>
			</div><!-- /.row -->
	
			<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php __('prices_desc');?></p>
		</div><!-- /.col-md-12 -->
	</div>
	
	<div class="wrapper wrapper-content animated fadeInRight p-b-sm">
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<label class="control-label"><?php __('prices_select_room');?></label>
	
				<select class="form-control" name="ch_room_id" data-url="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjAdminPrices&action=pjActionIndex&room_id=">
					<option value="">-- <?php __('lblChoose'); ?> --</option>
					<?php
					$room_id = ($controller->_get->check('room_id') && $controller->_get->toInt('room_id') > 0) ? $controller->_get->toInt('room_id') : $controller->getForeignIdPrice();
					foreach ($tpl['room_arr'] as $item)
					{
						?><option value="<?php echo $item['id']; ?>"<?php echo $room_id != $item['id'] ? NULL : ' selected="selected"'; ?>><?php echo pjSanitize::clean($item['name']); ?></option><?php
					}
					?>
				</select><!-- /.row m-b-md -->
			</div><!-- /.col-sm-6 -->
		</div><!-- /.row -->
	</div>
	<?php if ((int)$controller->getForeignIdPrice() > 0) { ?>
		<div class="wrapper wrapper-content animated fadeInRight">
			<?php 
			$months = __('months', true);
			ksort($months);
			$short_days = __('short_days', true);
			?>
			<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
			<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjHotelPrices&amp;action=pjActionCreate" method="post" class="form" id="frmCreatePrice">
				<input type="hidden" name="price_create" value="1" />
				<div class="tabs-container tabs-reservations tabs-prices m-b-lg">
					<a class="btn btn-primary btn-outline btnAddSeasonPrice" data-toggle="modal" data-target="#modalAddSeasonPrice" href="javascript:void(0);" type="submit"><i class="fa fa-plus"></i> <?php __('prices_add_seasonal_price');?></a>
					<ul class="nav nav-tabs" role="tablist">
						<?php
						$count = count($tpl['arr']);
						if ($count > 0)
						{
							$idx = array();
							foreach ($tpl['arr'] as $season => $season_arr)
							{
								$idx[] = $season_arr[0]['tab_id'];
							}
							$idx = array_unique($idx);
							sort($idx, SORT_NUMERIC);
						
							$br = 0;
							foreach ($tpl['arr'] as $season => $season_arr)
							{
								$index = $br > 0 ? $idx[$br] : 1;
								?>
								<li role="presentation" class="<?php echo $index == 1 ? 'active' : null;?>">
									<a href="#tab-content-<?php echo $index; ?>" id="tab-nav-<?php echo $index;?>" aria-controls="tabs-<?php echo $index; ?>" role="tab" data-toggle="tab"><?php echo pjSanitize::html($season); ?>
									<?php
									if ($br > 0)
									{
										?><span aria-hidden="true" class="lnkRemoveTabPrice" data-idx="<?php echo $index;?>" style="display:none;">&times;</span><?php
									}
									?>
									</a>
								</li>
								<?php
								$br++;
							}
						} else {
							?><li role="presentation" class="active"><a href="#tab-content-1" id="tab-nav-1" aria-controls="tabs-1" role="tab" data-toggle="tab"><?php __('prices_price_default'); ?></a></li><?php
						}
						?>
					</ul>
					<?php 
					$tmp = __('price_days', true);
					$days = array(
						'monday' => $tmp['monday'],
						'tuesday' => $tmp['tuesday'],
						'wednesday' => $tmp['wednesday'],
						'thursday' => $tmp['thursday'],
						'friday' => $tmp['friday'],
						'saturday' => $tmp['saturday'],
						'sunday' => $tmp['sunday']
					);
					?>
					<div class="tab-content">
						<?php 
						if ($count > 0)
						{
							$br = 0;
							foreach ($tpl['arr'] as $season => $season_arr)
							{
								$index = $br > 0 ? $idx[$br] : 1;
								?>
								<div role="tabpanel" class="tab-pane tab-price-panel <?php echo $index == 1 ? 'active' : null;?>" id="tab-content-<?php echo $index; ?>" data-idx="<?php echo $index; ?>">
									<?php
									$prices_include = $index == 1 ? 'default' : 'season';
									include dirname(__FILE__) . '/elements/prices_tpl.php';
									?>
								</div> <!-- tabs-x -->
								<?php
								//$index++;
								$br++;
							}
						} else {
							$rand = 'x_' . rand(100000, 999999);
							?>
							<div role="tabpanel" class="tab-pane tab-price-panel active" id="tab-content-1" data-idx="1">
								<div class="panel-body">
									<div class="form-inline">
                                		<div class="form-group">
                                            <label class="control-label"><?php __('prices_set_prices_for'); ?></label>
                                
                                            <div class="clearfix pull-left">
                                                <div class="switch onoffswitch-data">
                                                    <div class="onoffswitch onoffswitch-prices">
                                                        <input type="checkbox" class="onoffswitch-checkbox" id="1_set_different_prices_<?php echo $rand; ?>" checked="checked" name="1_set_different_prices_<?php echo $rand; ?>" data-tab="1" data-type="default">
                                
                                                        <label class="onoffswitch-label" for="1_set_different_prices_<?php echo $rand; ?>">
                                                            <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                                            <span class="onoffswitch-switch"></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row" id="default_single_price_1" style="display:none;">
                            			<div class="col-lg-3 col-md-4 col-sm-6">
                                			<div class="form-group">
                                				<label class="control-label"><?php __('prices_single_price'); ?></label>
                                				<div class="input-group">
                                					<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false); ?></span>	
                                					<input type="text" class="form-control single-price price-form-field" value="" name="single_price_1"  data-msg-number="<?php __('prices_invalid_price', false, true);?>">
                                				</div>
                                			</div>
                            			</div>
                            		</div>
                                    <div id="default_weekday_price_1">
    									<div class="tab-price-item">
    										<input type="hidden" name="1_adults[<?php echo $rand; ?>]" value="0" />
    										<input type="hidden" name="1_children[<?php echo $rand; ?>]" value="0" />
    										<input type="hidden" name="1_date_from[<?php echo $rand; ?>]" value="<?php echo pjDateTime::formatDate('0000-00-00', 'Y-m-d', $tpl['option_arr']['o_date_format']); ?>" />
    										<input type="hidden" name="1_date_to[<?php echo $rand; ?>]" value="<?php echo pjDateTime::formatDate('0000-00-00', 'Y-m-d', $tpl['option_arr']['o_date_format']); ?>" />
    									</div>
    									<div class="table-responsive table-responsive-secondary">
    										<table class="table table-striped table-hover">
    											<thead>
    												<tr>
    													<?php
    													foreach ($days as $k => $v)
    													{
    														?><th><?php echo $v; ?></th><?php
    													}
    													?>
    												</tr>
    											</thead>
    											<tbody>
    												<tr class="tab-price-item">
    													<?php
    													$i = 1;
    													foreach ($days as $k => $v)
    													{
    														if ($i > 6)
    														{
    															$i = 0;
    														}
    														?><td>
    															<div class="form-group">
    																<div class="input-group">
    				                                                    <span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span>	
    				                                                    <input type="text" class="form-control price-form-field required number" name="1_day_<?php echo $i; ?>[<?php echo $rand; ?>]" data-msg-number="<?php __('prices_invalid_price', false, true);?>">
    				                                                </div>
    			                                                </div>
    														</td><?php
    														$i++;
    													}
    													?>
    												</tr>
    											</tbody>
    									   </table>
    									</div>
    								</div>
									<input type="hidden" name="tabs[1]" value="<?php __('prices_price_default', false, true); ?>" />
									
									<div class="hr-line-dashed"></div>
		
		                            <div class="m-b-md">
		                                <h2 class="no-margins"><?php __('prices_price_adults_children')?></h2>
		                            </div>
		                            
		                            <div class="form-inline">
                                		<div class="form-group">
                                            <label class="control-label"><?php __('prices_set_prices_based_on'); ?></label>
                                
                                            <div class="clearfix pull-left">
                                                <div class="switch onoffswitch-data">
                                                    <div class="onoffswitch onoffswitch-prices-based-on">
                                                        <input type="checkbox" class="onoffswitch-checkbox" id="1_set_different_prices_based_on_<?php echo $rand;?>" name="1_set_different_prices_based_on_<?php echo $rand;?>" checked="checked" data-tab="1" data-index="<?php echo $rand;?>">
                                
                                                        <label class="onoffswitch-label" for="1_set_different_prices_based_on_<?php echo $rand;?>">
                                                            <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                                            <span class="onoffswitch-switch"></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
		                            <div id="guests_weekday_price_1_<?php echo $rand;?>" style="display:;">
		                            	<div class="alert alert-info"><?php __('prices_number_of_guests_info'); ?></div>
    		                            <div class="table-responsive table-responsive-secondary">
    		                                <table class="table table-striped table-hover pj-table pj-tbl-adults-children-price-<?php echo $rand;?>" data-idx="<?php echo $rand;?>">
    		                                    <thead>
    		                                        <tr>
    		                                            <th width="90px"><?php __('prices_adults');?></th>
    		                                            <th width="90px"><?php __('prices_children');?></th>
    		                                            <?php
    													foreach ($days as $k => $v)
    													{
    														?><th><?php echo $v; ?></th><?php
    													}
    													?>
    		                                            <th></th>
    		                                        </tr>
    		                                    </thead>	                            
    		                                    <tbody>
    		                                        
    		                                    </tbody>
    		                                </table>
    		                            </div>
    		                            
    		                            <div class="m-b-md">
    		                                <a href="javascript:void(0);" class="btn btn-primary btn-outline lnkAddPrice" rel="1" data-idx="<?php echo $rand;?>"><i class="fa fa-plus"></i> <?php __('prices_add_price_adults_children');?></a>
    		                            </div>
    		                        </div>
		                            
		                            <div class="hr-line-dashed"></div>
	
		                            <div class="clearfix">
		                            	<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
                                			<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
                                			<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
                                		</button>	 
		                            </div><!-- /.clearfix -->
		                            <br/>
		                            <div class="alert alert-success bxPriceStatusStart" style="display: none"><?php __('prices_price_status_start'); ?></div>
		                            <div class="alert alert-success bxPriceStatusEnd" style="display: none"><?php __('prices_price_status_end'); ?></div>
		                            <div class="alert alert-danger bxPriceStatusFail" style="display: none"><?php __('prices_price_status_fail'); ?></div>
		                            <div class="alert alert-danger bxPriceStatusDuplicate" style="display: none"><?php __('prices_price_status_duplicate'); ?></div>
	                            </div>
							</div>
							<?php
						}
						?>			
					</div>
				</div>
			</form>
		</div><!-- /.wrapper wrapper-content -->
	<?php } ?>
	<div class="bxPriceErrors" style="height: 0 !important; display: none; overflow: hidden"></div>
	<div class="modal inmodal fade" id="modalAddSeasonPrice" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	             <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <h2 class="no-margins"><?php __('prices_add_seasonal_price_title');?></h2>
                </div>

                <div class="panel-body bg-light">
                    <input type="text" name="tab_title" value="Season Title" class="form-control" placeholder="Season Title">
                </div><!-- /.panel-body -->
                
                <div class="modal-footer">
                    <a href="javascript:void(0);" class="btn btn-primary pjBtnAddSeasonalPrice"><?php __('btnAdd'); ?></a>
                    <a href="javascript:void(0);" class="btn btn-default pjBtnCloseModalSeasonalPrice" data-dismiss="modal"><?php __('btnCancel'); ?></a>
                </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal inmodal fade" id="modalDeleteSeasonPrices" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>

                    <h2 class="no-margins"><?php __('prices_delete_seasonal_price_title');?></h2>
                </div>

                <div class="panel-body">
                    <p><?php __('prices_delete_seasonal_price_desc');?></p>
                </div><!-- /.panel-body -->
                
                <div class="modal-footer">
                    <a href="javascript:void(0);" class="btn btn-primary pjBtnDeleteSeasonalPrice"><?php __('btnDelete'); ?></a>
                    <a href="javascript:void(0);" class="btn btn-default" data-dismiss="modal"><?php __('btnCancel'); ?></a>
                </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade" id="modalInvalidPrices" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                </div>
                <div class="panel-body">
                    <p class="text-danger">sss<?php __('prices_invalid_input');?></p>
                </div><!-- /.panel-body -->
	        </div>
	    </div>
	</div>

	<div id="tmplSeason" style="display: none;">
	<?php
	include dirname(__FILE__) . '/elements/prices_season.php';
	?>
	</div>
	<div id="tmplDefault" style="display: none;">
	<?php
	include dirname(__FILE__) . '/elements/prices_default.php';
	?>
	</div>
	
	<script type="text/javascript">
	var myLabel = myLabel || {};
	myLabel.prices_invalid_input = "<?php __('prices_invalid_input');?>";
	myLabel.duplicated_special_prices = "<?php __('prices_duplicated_special_prices');?>";
	</script>