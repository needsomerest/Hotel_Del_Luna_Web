<?php
$response = $tpl['response'];
if($response['status'] == 'OK')
{
    $statuses = __('plugin_ep_payment_statuses', true);
    ?>
    <br/>
    <div class="btn-group pjHbLanguage">
    	<button type="button" class="btn btn-default dropdown-toggle pjHbBtnNav" data-toggle="dropdown" aria-expanded="false">
    		<?php
    		$selected_title = null;
    		$selected_src = NULL;
    		foreach ($tpl['locale_arr'] as $locale)
    		{
    			if ($controller->getLocaleId() == $locale['id'])
    			{
    				$selected_title = $locale['language_iso'];
    				$lang_iso = explode("-", $selected_title);
    				if(isset($lang_iso[1]))
    				{
    					$selected_title = $lang_iso[1];
    				}
    				if (!empty($locale['flag']) && is_file(PJ_INSTALL_PATH . $locale['flag']))
    				{
    					$selected_src = PJ_INSTALL_URL . $locale['flag'];
    				} elseif (!empty($locale['file']) && is_file(PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $locale['file'])) {
    					$selected_src = PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $locale['file'];
    				}
    				break;
    			}
    		}
    		?> 
    		<img src="<?php echo $selected_src; ?>" alt="">
    		<span class="title"><?php echo mb_strtoupper($selected_title, 'UTF-8'); ?></span>
    		<span class="caret"></span>
    	</button>
    	<ul class="dropdown-menu" role="menu">
    	<?php
    	foreach ($tpl['locale_arr'] as $locale)
    	{
    		$selected_src = NULL;
    		if (!empty($locale['flag']) && is_file(PJ_INSTALL_PATH . $locale['flag']))
    		{
    			$selected_src = PJ_INSTALL_URL . $locale['flag'];
    		} elseif (!empty($locale['file']) && is_file(PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $locale['file'])) {
    			$selected_src = PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $locale['file'];
    		}
    		?>
    		<li>
    			<a href="#" class="hbSelectorLocale<?php echo $controller->getLocaleId() == $locale['id'] ? ' pjHbBtnActive' : NULL; ?>" data-id="<?php echo $locale['id']; ?>" data-dir="<?php echo $locale['dir']; ?>">
    				<img src="<?php echo $selected_src; ?>" alt="">
    				<?php echo pjSanitize::html($locale['name']); ?>
    			</a>
    		</li>
    		<?php
    	}
    	?>
    	</ul>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
    		<label class="col-sm-3 col-xs-12 control-label"><?php __('plugin_ep_payment'); ?></label>
    		<div class="col-sm-9 col-xs-12">
    			<p class="form-control-static"><?php echo pjSanitize::html($tpl['arr']['title']);?></p>
    		</div>
    	</div>
    	<div class="form-group">
    		<label class="col-sm-3 col-xs-12 control-label"><?php __('plugin_ep_status'); ?></label>
    		<div class="col-sm-9 col-xs-12">
    			<p class="form-control-static"><?php echo $statuses[$tpl['arr']['payment_status']];?></p>
    		</div>
    	</div>
    	<div class="form-group">
    		<label class="col-sm-3 col-xs-12 control-label"><?php __('plugin_ep_amount'); ?></label>
    		<div class="col-sm-9 col-xs-12">
    			<p class="form-control-static"><?php echo pjCurrency::formatPrice($tpl['arr']['amount']);?></p>
    		</div>
    	</div>
    	<div class="form-group">
    		<label class="col-sm-3 col-xs-12 control-label"><?php __('plugin_ep_description'); ?></label>
    		<div class="col-sm-9 col-xs-12">
    			<p class="form-control-static"><?php echo nl2br(pjSanitize::html($tpl['arr']['description']));?></p>
    		</div>
    	</div>
	</div>
	<?php
	if($tpl['arr']['payment_status'] == 'not_paid')
	{
    	?>
    	<p class="alert alert-info"><i class="fa fa-info-circle"></i> <?php __('plugin_ep_select_payment_method');?></p>
    	
    	<form action="" class="form-horizontal pjHbFormCheckOut hbSelectorFormCheckout" data-toggle="validator" role="form" method="post">
    		<input type="hidden" name="id" value="<?php echo $tpl['arr']['id'];?>"/>
    		<input type="hidden" name="client_id" value="<?php echo $tpl['client_id'];?>"/>
    		<input type="hidden" name="locale_id" value="<?php echo $tpl['locale_id'];?>"/>
    		<input type="hidden" name="amount" value="<?php echo $tpl['arr']['amount'];?>"/>
    		
    		<div class="form-group">
    			<label class="col-sm-3 col-xs-12 control-label"><?php __('plugin_ep_payment_method'); ?> <span class="text-danger">*</span></label>
    			<?php
    			$plugins_payment_methods = pjObject::getPlugin('pjPayments') !== NULL? pjPayments::getPaymentMethods(): array();
    			$haveOnline = $haveOffline = false;
    			foreach ($tpl['payment_titles'] as $k => $v)
    			{
    			    if($k == 'creditcard') continue;
    			    if (array_key_exists($k, $plugins_payment_methods))
    			    {
    			        if(!isset($tpl['payment_option_arr'][$k]['is_active']) || (isset($tpl['payment_option_arr']) && $tpl['payment_option_arr'][$k]['is_active'] == 0) )
    			        {
    			            continue;
    			        }
    			    }else if( (isset($tpl['option_arr']['o_allow_'.$k]) && (int) $tpl['option_arr']['o_allow_'.$k] == 0) || $k == 'cash' || $k == 'bank' ){
    			        continue;
    			    }
    			    $haveOnline = true;
    			    break;
    			}
    			foreach ($tpl['payment_titles'] as $k => $v)
    			{
    			    if($k == 'creditcard') continue;
    			    if( $k == 'cash' || $k == 'bank' )
    			    {
    			        if( (isset($tpl['option_arr']['o_allow_'.$k]) && (int )$tpl['option_arr']['o_allow_'.$k] == 1))
    			        {
    			            $haveOffline = true;
    			            break;
    			        }
    			    }
    			}
    			?>
    			<div class="col-sm-9 col-xs-12">
    				<select class="form-control required" name="payment_method" data-msg-required="<?php __('plugin_ep_field_required', false, true); ?>">
    					<option value="">-- <?php __('plugin_ep_choose'); ?> --</option>
    					<?php
                        foreach ($tpl['payment_titles'] as $k => $v)
                        {
                            if($k == 'creditcard') continue;
                            if (array_key_exists($k, $plugins_payment_methods))
                            {
                                if(!isset($tpl['payment_option_arr'][$k]['is_active']) || (isset($tpl['payment_option_arr']) && $tpl['payment_option_arr'][$k]['is_active'] == 0) )
                                {
                                    continue;
                                }
                            }else if( (isset($tpl['option_arr']['o_allow_'.$k]) && (int) $tpl['option_arr']['o_allow_'.$k] == 0) || $k == 'cash' || $k == 'bank' ){
                                continue;
                            }
                            ?><option value="<?php echo $k; ?>"<?php echo isset($FORM['payment_method']) && $FORM['payment_method']==$k ? ' selected="selected"' : NULL;?>><?php echo $v; ?></option><?php
                        }
    					?>
    				</select>
    			</div><!-- /.col-sm-10 -->
    		</div>
    
    		<div class="pj-plugin-ep-bank-acocunt" style="display: none">
    			<div class="form-group">
    				<label class="col-sm-3 col-xs-12 control-label"><?php __('plugin_ep_bank_account'); ?></label>
    				<div class="col-sm-9 col-xs-12">
    					<p class="form-control-static"><?php echo nl2br(pjSanitize::html($tpl['option_arr']['o_bank_account'])); ?></p>
    				</div>
    			</div>
    		</div>
    		<div class="form-group">
    			<label class="col-sm-3 col-xs-12 control-label">&nbsp;</label>
    			<div class="col-sm-9 col-xs-12">
    				<button type="submit" class="btn btn-primary"><?php __('plugin_ep_btn_pay'); ?></button>
    			</div>
    		</div>
    	</form>
    	<div id="pjPluginExtraPaymentForm" ></div>
        <?php
	}
}else{
    $errors = __('plugin_ep_error', true);
    ?><div class="alert alert-danger"><?php echo $errors[$response['code']]; ?></div><?php
}
?>