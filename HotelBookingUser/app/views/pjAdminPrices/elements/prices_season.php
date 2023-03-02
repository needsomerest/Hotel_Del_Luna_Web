<div role="tabpanel" class="tab-pane tab-price-panel" id="tab-content-{INDEX}" data-idx="{INDEX}">
	<div class="panel-body">
		<div class="row tab-price-item">
			<div class="col-sm-4">
				<div class="form-group">
					<label class="control-label"><?php __('prices_season_title');?></label>
					<input type="text" class="form-control required" id="tab_{INDEX}" name="tabs[{INDEX}]" value="{TAB_TITLE}" />
				</div>
			</div><!-- /.col-sm-4 -->    

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label"><?php __('prices_date_range_from');?></label>
	
					<div class="input-group"> 
						<input type="text" name="{INDEX}_date_from[{RAND}]" id="date_from_{INDEX}_{RAND}" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" class="form-control datepick required" readonly="readonly" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-4 -->    

			<div class="col-sm-3">
				<div class="form-group">
					<label class="control-label"><?php __('prices_date_range_to');?></label>
	
					<div class="input-group"> 
						<input type="text" name="{INDEX}_date_to[{RAND}]" id="date_to_{INDEX}_{RAND}" value="<?php echo date($tpl['option_arr']['o_date_format'], time());?>" class="form-control datepick required" readonly="readonly" /> 
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					</div>
				</div>
			</div><!-- /.col-sm-4 -->
			<div class="col-sm-2">
				<div class="form-group">
					<label class="control-label" style="display:block;">&nbsp;</label>
	
					<a href="#" class="btn btn-danger btn-outline btn-sm btn-delete-season" data-index="{INDEX}"><i class="fa fa-trash"></i> <?php __('btnDelete');?></a>
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
                            <input type="checkbox" class="onoffswitch-checkbox" id="{INDEX}_set_different_prices_{RAND}" name="{INDEX}_set_different_prices_{RAND}" checked="checked" data-tab="{INDEX}" data-type="season">
    
                            <label class="onoffswitch-label" for="{INDEX}_set_different_prices_{RAND}">
                                <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

		<div class="m-b-md">
			<h2 class="no-margins"><?php __('prices_default_season_price');?></h2>
		</div>
		
		<div class="row" id="season_single_price_{INDEX}" style="display:none;">
			<div class="col-lg-3 col-md-4 col-sm-6">
    			<div class="form-group">
    				<label class="control-label"><?php __('prices_single_price'); ?></label>
    				<div class="input-group">
    					<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false); ?></span>	
    					<input type="text" class="form-control single-price price-form-field" value="" name="single_price_{INDEX}">
    				</div>
    			</div>
			</div>
		</div>
		<div id="season_weekday_price_{INDEX}" style="display:;">
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
    								<input type="hidden" name="{INDEX}_adults[{RAND}]" value="0" />
    								<input type="hidden" name="{INDEX}_children[{RAND}]" value="0" />
    								<?php } ?>
    								<div class="form-group">
    									<div class="input-group">
    										<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span>	
    										<input type="text" class="form-control price-form-field required number" name="{INDEX}_day_<?php echo $i; ?>[{RAND}]" data-msg-number="<?php __('prices_invalid_price', false, true);?>">
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
		
		<div class="form-inline">
    		<div class="form-group">
                <label class="control-label"><?php __('prices_set_prices_based_on'); ?></label>
    
                <div class="clearfix pull-left">
                    <div class="switch onoffswitch-data">
                        <div class="onoffswitch onoffswitch-prices-based-on">
                            <input type="checkbox" class="onoffswitch-checkbox" id="{INDEX}_set_different_prices_based_on_{RAND}" name="{INDEX}_set_different_prices_based_on_{RAND}" checked="checked" data-tab="{INDEX}" data-index="{RAND}">
    
                            <label class="onoffswitch-label" for="{INDEX}_set_different_prices_based_on_{RAND}">
                                <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<div id="guests_weekday_price_{INDEX}_{RAND}" style="display:;">
		
    		<div class="alert alert-info"><?php __('prices_number_of_guests_info'); ?></div>
    		<div class="table-responsive table-responsive-secondary">
    			<table class="table table-striped table-hover pj-table pj-tbl-adults-children-price-{RAND}" data-idx="{RAND}">
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
    			<a href="javascript:void(0);" class="btn btn-primary btn-outline lnkAddPrice" rel="{INDEX}" data-idx="{RAND}"><i class="fa fa-plus"></i> <?php __('prices_add_price_adults_children');?></a>
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
	</div>
</div>