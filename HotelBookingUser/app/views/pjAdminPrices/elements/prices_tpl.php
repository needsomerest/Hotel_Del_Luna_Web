<div class="panel-body">
	<?php
	if ($prices_include == 'default') 
	{
	    ?>
		<div class="form-inline">
    		<div class="form-group">
                <label class="control-label"><?php __('prices_set_prices_for'); ?></label>
    
                <div class="clearfix pull-left">
                    <div class="switch onoffswitch-data">
                        <div class="onoffswitch onoffswitch-prices">
                            <input type="checkbox" class="onoffswitch-checkbox" id="1_set_different_prices_<?php echo $season_arr[0]['id']; ?>" name="1_set_different_prices_<?php echo $season_arr[0]['id']; ?>"<?php echo $season_arr[0]['set_different_prices'] == 'T' ? ' checked="checked"' : NULL; ?> data-tab="1" data-type="default">
    
                            <label class="onoffswitch-label" for="1_set_different_prices_<?php echo $season_arr[0]['id']; ?>">
                                <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
				
		<div class="row" id="default_single_price_1" style="display:<?php echo $season_arr[0]['set_different_prices'] == 'T' ? ' none' : ''; ?>;">
			<div class="col-lg-3 col-md-4 col-sm-6">
    			<div class="form-group">
    				<label class="control-label"><?php __('prices_single_price'); ?></label>
    				<div class="input-group">
    					<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false); ?></span>	
    					<input type="text" class="form-control single-price price-form-field<?php echo $season_arr[0]['set_different_prices'] == 'T' ? '' : ' required number'; ?>" value="<?php echo $season_arr[0]['set_different_prices'] == 'T' ? '' : $season_arr[0]['mon']; ?>" name="single_price_1"  data-msg-number="<?php __('prices_invalid_price', false, true);?>">
    				</div>
    			</div>
			</div>
		</div>
		
		<div id="default_weekday_price_1" style="display:<?php echo $season_arr[0]['set_different_prices'] == 'T' ? '' : 'none'; ?>;">
    		<div class="tab-price-item">
    			<input type="hidden" name="1_adults[<?php echo $season_arr[0]['id']; ?>]" value="0" />
    			<input type="hidden" name="1_children[<?php echo $season_arr[0]['id']; ?>]" value="0" />
    			<input type="hidden" name="1_date_from[<?php echo $season_arr[0]['id']; ?>]" value="<?php echo pjDateTime::formatDate('0000-00-00', 'Y-m-d', $tpl['option_arr']['o_date_format']); ?>" />
    			<input type="hidden" name="1_date_to[<?php echo $season_arr[0]['id']; ?>]" value="<?php echo pjDateTime::formatDate('0000-00-00', 'Y-m-d', $tpl['option_arr']['o_date_format']); ?>" />
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
    										<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false); ?></span>	
    										<input type="text" class="form-control price-form-field<?php echo $season_arr[0]['set_different_prices'] == 'T' ? ' required number' : ''; ?>" value="<?php echo $season_arr[0][substr($k, 0, 3)];?>" name="1_day_<?php echo $i; ?>[<?php echo $season_arr[0]['id']; ?>]"  data-msg-number="<?php __('prices_invalid_price', false, true);?>">
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
		<input type="hidden" name="tabs[<?php echo $season_arr[0]['tab_id']; ?>]" value="<?php echo htmlspecialchars(stripslashes($season)); ?>" />
		
		<div class="hr-line-dashed"></div>
		
		<div class="m-b-md">
			<h2 class="no-margins"><?php __('prices_price_adults_children')?></h2>
		</div>
		
		
	<?php } else { ?>
		<div class="row tab-price-item">
			<div class="col-sm-4">
				<div class="form-group">
					<label class="control-label"><?php __('prices_season_title');?></label>
					<input type="text" class="form-control required" id="tab_<?php echo $season_arr[0]['tab_id'];?>" name="tabs[<?php echo $season_arr[0]['tab_id'];?>]" value="<?php echo stripslashes($season_arr[0]['season']);?>" />
				</div>
			</div><!-- /.col-sm-4 -->    

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label"><?php __('prices_date_range_from');?></label>
	
					<div class="input-group"> 
						<input type="text" name="<?php echo $season_arr[0]['tab_id'];?>_date_from[<?php echo $season_arr[0]['id']; ?>]" id="date_from_<?php echo $season_arr[0]['tab_id'];?>_<?php echo $season_arr[0]['id']; ?>" value="<?php echo !empty($season_arr[0]['date_from']) && $season_arr[0]['date_from'] != '0000-00-00' ? pjDateTime::formatDate($season_arr[0]['date_from'], 'Y-m-d', $tpl['option_arr']['o_date_format']) : NULL; ?>" class="form-control datepick required" readonly="readonly" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-4 -->    

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label"><?php __('prices_date_range_to');?></label>
	
					<div class="input-group"> 
						<input type="text" name="<?php echo $season_arr[0]['tab_id'];?>_date_to[<?php echo $season_arr[0]['id']; ?>]" id="date_to_<?php echo $season_arr[0]['tab_id'];?>_<?php echo $season_arr[0]['id']; ?>" value="<?php echo !empty($season_arr[0]['date_to']) && $season_arr[0]['date_to'] != '0000-00-00' ? pjDateTime::formatDate($season_arr[0]['date_to'], 'Y-m-d', $tpl['option_arr']['o_date_format']) : NULL; ?>" class="form-control datepick required" readonly="readonly" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-4 -->    
			<div class="col-sm-2">
				<div class="form-group">
					<label class="control-label" style="display:block;">&nbsp;</label>
	
					<a href="#" class="btn btn-danger btn-outline btn-sm btn-delete-season" data-index="<?php echo $season_arr[0]['tab_id'];?>"><i class="fa fa-trash"></i> <?php __('btnDelete');?></a>
				</div>
			</div><!-- /.col-sm-2 -->    
		</div><!-- /.row -->

		<div class="hr-line-dashed"></div>

		<div class="form-inline">
    		<div class="form-group">
                <label class="control-label"><?php __('prices_set_prices_for'); ?></label>
    
                <div class="clearfix pull-left">
                    <div class="switch onoffswitch-data">
                        <div class="onoffswitch onoffswitch-prices">
                            <input type="checkbox" class="onoffswitch-checkbox" id="<?php echo $season_arr[0]['tab_id'];?>_set_different_prices_<?php echo $season_arr[0]['id']; ?>" name="<?php echo $season_arr[0]['tab_id'];?>_set_different_prices_<?php echo $season_arr[0]['id']; ?>"<?php echo $season_arr[0]['set_different_prices'] == 'T' ? ' checked="checked"' : NULL; ?> data-tab="<?php echo $season_arr[0]['tab_id']; ?>" data-type="season">
    
                            <label class="onoffswitch-label" for="<?php echo $season_arr[0]['tab_id'];?>_set_different_prices_<?php echo $season_arr[0]['id']; ?>">
                                <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
		<div class="row" id="season_single_price_<?php echo $season_arr[0]['tab_id'];?>" style="display:<?php echo $season_arr[0]['set_different_prices'] == 'T' ? ' none' : ''; ?>;">
			<div class="col-lg-3 col-md-4 col-sm-6">
    			<div class="form-group">
    				<label class="control-label"><?php __('prices_single_price'); ?></label>
    				<div class="input-group">
    					<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false); ?></span>	
    					<input type="text" class="form-control single-price price-form-field<?php echo $season_arr[0]['set_different_prices'] == 'T' ? '' : ' required number'; ?>" value="<?php echo $season_arr[0]['set_different_prices'] == 'T' ? '' : $season_arr[0]['mon']; ?>" name="single_price_<?php echo $season_arr[0]['tab_id'];?>"  data-msg-number="<?php __('prices_invalid_price', false, true);?>">
    				</div>
    			</div>
			</div>
		</div>
		
		<div id="season_weekday_price_<?php echo $season_arr[0]['tab_id'];?>" style="display:<?php echo $season_arr[0]['set_different_prices'] == 'T' ? '' : 'none'; ?>;">
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
    								<?php if ($i == 1) { ?>
    									<input type="hidden" name="<?php echo $season_arr[0]['tab_id'];?>_adults[<?php echo $season_arr[0]['id']; ?>]" value="0" />
    									<input type="hidden" name="<?php echo $season_arr[0]['tab_id'];?>_children[<?php echo $season_arr[0]['id']; ?>]" value="0" />
    								<?php } ?>
    								<div class="form-group">
    									<div class="input-group">
    										<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span>	
    										<input type="text" class="form-control price-form-field<?php echo $season_arr[0]['set_different_prices'] == 'T' ? ' required number' : ''; ?>" value="<?php echo $season_arr[0][substr($k, 0, 3)];?>" name="<?php echo $season_arr[0]['tab_id'];?>_day_<?php echo $i; ?>[<?php echo $season_arr[0]['id']; ?>]" data-msg-number="<?php __('prices_invalid_price', false, true);?>">
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
		
		<div class="hr-line-dashed"></div>

		<div class="m-b-md">
			<h2 class="no-margins"><?php __('prices_price_adults_children');?></h2>
		</div>
		
	<?php } ?>
	
	<div class="form-inline">
		<div class="form-group">
            <label class="control-label"><?php __('prices_set_prices_based_on'); ?></label>

            <div class="clearfix pull-left">
                <div class="switch onoffswitch-data">
                    <div class="onoffswitch onoffswitch-prices-based-on">
                        <input type="checkbox" class="onoffswitch-checkbox" id="<?php echo $season_arr[0]['tab_id'];?>_set_different_prices_based_on_<?php echo $season_arr[0]['id']; ?>" name="<?php echo $season_arr[0]['tab_id'];?>_set_different_prices_based_on_<?php echo $season_arr[0]['id']; ?>"<?php echo $season_arr[0]['set_different_prices_based_on_guests'] == 'T' ? ' checked="checked"' : ''; ?> data-tab="<?php echo $season_arr[0]['tab_id']; ?>" data-index="<?php echo $season_arr[0]['id']; ?>">

                        <label class="onoffswitch-label" for="<?php echo $season_arr[0]['tab_id'];?>_set_different_prices_based_on_<?php echo $season_arr[0]['id']; ?>">
                            <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                            <span class="onoffswitch-switch"></span>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<div id="guests_weekday_price_<?php echo $season_arr[0]['tab_id'];?>_<?php echo $season_arr[0]['id'];?>" style="display:<?php echo $season_arr[0]['set_different_prices_based_on_guests'] == 'T' ? '' : 'none'; ?>;">
		<div class="alert alert-info"><?php __('prices_number_of_guests_info'); ?></div>
    	<div class="table-responsive table-responsive-secondary">
    		<table class="table table-striped table-hover pj-table pj-tbl-adults-children-price-<?php echo $season_arr[0]['id']; ?>" data-idx="<?php echo $season_arr[0]['id']; ?>">
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
    					<th>&nbsp;</th>
    					<th>&nbsp;</th>
    				</tr>
    			</thead>	                            
    			<tbody>
    				<?php foreach ($season_arr as $key => $price) { ?>
    					<?php if ($key > 0) { ?>
    						<tr class="tab-price-item">
    							<td>
    								<select class="form-control" name="<?php echo $price['tab_id'];?>_adults[<?php echo $price['id'];?>~:~<?php echo $season_arr[0]['id'];?>]">
    									<?php
    									foreach (range(1, $tpl['option_arr']['o_bf_adults_max']) as $i)
    									{
    										?><option value="<?php echo $i; ?>" <?php echo $price['adults'] == $i ? 'selected="selected"' : null;?>><?php echo $i; ?></option><?php
    									}
    									?>
    								</select>
    							</td>
    						
    							<td>
    								<select class="form-control" name="<?php echo $price['tab_id'];?>_children[<?php echo $price['id'];?>~:~<?php echo $season_arr[0]['id'];?>]">
    									<?php
    									foreach (range(0, $tpl['option_arr']['o_bf_children_max']) as $i)
    									{
    										?><option value="<?php echo $i; ?>" <?php echo $price['children'] == $i ? 'selected="selected"' : null;?>><?php echo $i; ?></option><?php
    									}
    									?>
    								</select>
    							</td>
    						
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
    											<input type="text" class="form-control price-form-field required number" value="<?php echo $price[substr($k, 0, 3)]; ?>" name="<?php echo $price['tab_id'];?>_day_<?php echo $i; ?>[<?php echo $price['id']; ?>~:~<?php echo $season_arr[0]['id'];?>]" data-msg-number="<?php __('prices_invalid_price', false, true);?>">
    										</div>
    									</div>
    								</td><?php
    								$i++;
    							}
    							?>
    							<td>
    								<div class="text-right">
    									<a href="javascript:void(0);" class="btn btn-primary btn-outline btn-sm btn-primary lnkCopyRow"><i class="fa fa-copy"></i></a>
    								</div>
    							</td>
    							<td>
    								<div class="text-right">
    									<a href="javascript:void(0);" class="btn btn-danger btn-outline btn-sm btn-delete lnkRemoveRow"><i class="fa fa-trash"></i></a>
    								</div>
    							</td>
    						</tr>
    					<?php } ?>
    				<?php } ?>
    			</tbody>
    		</table>
    	</div>
    	<div class="m-b-md">
    		<a href="javascript:void(0);" class="btn btn-primary btn-outline lnkAddPrice" rel="<?php echo $season_arr[0]['tab_id'];?>" data-idx="<?php echo $season_arr[0]['id'];?>"><i class="fa fa-plus"></i> <?php __('prices_add_price_adults_children');?></a>
    	</div>
	</div>
	
	<div class="hr-line-dashed"></div>
	
	<div class="clearfix">
		<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader" data-style="zoom-in">
			<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
			<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
		</button>	                            
	</div><!-- /.clearfix -->
	
</div>