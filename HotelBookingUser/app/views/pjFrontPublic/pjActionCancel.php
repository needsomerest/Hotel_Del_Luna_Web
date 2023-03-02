<?php
$cancel_err = __('cancel_err', true);
$cid = $controller->_get->check('cid') && $controller->_get->toInt('cid') > 0 ? $controller->_get->toInt('cid')  : 1;
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
<br/><br/>
<div class="panel panel-default">
    <div class="panel-body">
    <?php
    if (isset($tpl['status']))
    {
        ?>
        <p class="alert alert-warning">
        <?php
        switch ($tpl['status'])
        {
            case 1:
                echo $cancel_err[1];
                break;
            case 2:
                echo $cancel_err[2];
                break;
            case 3:
                echo $cancel_err[3];
                break;
            case 4:
                echo $cancel_err[4];
                break;
        }
        ?>
        </p>
        <?php
    }else{
        ?>
        <h3><?php __('front_booking_details'); ?></h3>
        <?php
        if (isset($tpl['arr']['date_from']) && isset($tpl['arr']['date_to']))
        {
            ?>
            <table class="table table-striped table-hover no-margins">
            	<tbody>
            		<tr>
            			<td><strong><?php __('front_check_in'); ?></strong></td>
            			<td><?php echo pjDateTime::formatDate($tpl['arr']['date_from'], 'Y-m-d', $tpl['option_arr']['o_date_format']); ?></td>
            		</tr>
            		<tr>
    					<td><strong><?php __('front_check_out'); ?></strong></td>
    					<td><?php echo pjDateTime::formatDate($tpl['arr']['date_to'], 'Y-m-d', $tpl['option_arr']['o_date_format']); ?></td>
    				</tr>
    				<tr>
    					<td><strong><?php __('front_for'); ?></strong></td>
    					<td><?php
    					printf("%u %s, %u %s",
    						$tpl['arr']['_rooms'],
    						(int) $tpl['arr']['_rooms'] === 1 ? __('front_room_singular', true) : __('front_room_plural', true),
    						$tpl['arr']['_nights'],
    						(int) $tpl['arr']['_nights'] === 1 ? __('front_night_singular', true) : __('front_night_plural', true)
    					);
    					?></td>
    				</tr>
            	</tbody>
            </table>
            <?php
        }
        if (isset($tpl['arr']['room_arr']) && !empty($tpl['arr']['room_arr']))
        {
            foreach ($tpl['arr']['room_arr'] as $item)
            {
                ?>
				<table class="table table-striped table-hover no-margins">
					<thead>
						<tr>
							<th><?php echo pjSanitize::html($item[0]['name']); ?></th>
						</tr>
					</thead>
					<tbody>
					<?php
					foreach ($item as $index => $info)
					{
						?>
						<tr>
							<td><?php printf("%u %s, %u %s",
								$info['adults'],
								$info['adults'] != 1 ? pjMultibyte::strtolower(__('front_adults', true)) : pjMultibyte::strtolower(__('front_adult', true)),
								$info['children'],
								$info['children'] != 1 ? pjMultibyte::strtolower(__('front_children', true)) : pjMultibyte::strtolower(__('front_child', true))
							); ?></td>
						</tr>
						<?php
					}
					?>
					</tbody>
				</table>
				<?php
			}
		}
        if (isset($tpl['arr']['extra_arr']) && !empty($tpl['arr']['extra_arr']))
        {
            ?>
			<table class="table table-striped table-hover no-margins">
				<thead>
					<tr>
						<th><?php __('front_extras'); ?></th>
					</tr>
				</thead>
				<tbody>
        			<?php
        			$extra_per = __('extra_per', true);
        			foreach ($tpl['arr']['extra_arr'] as $extra)
        			{
        				?>
        				<tr>
        					<td><?php printf("%s (%s)", $extra['name'], @$extra_per[$extra['per']]); ?></td>
        				</tr>
        				<?php
        			}
        			?>
				</tbody>
			</table>
			<?php
		}
		?>
		<table class="table table-striped table-hover no-margins">
			<tbody>
				<tr>
					<td><strong><?php __('front_room_price'); ?></strong></td>
					<td><?php echo pjCurrency::formatPrice($tpl['arr']['room_price']); ?></td>
				</tr>
				<?php if ($tpl['arr']['extra_price'] > 0) : ?>
				<tr>
					<td><strong><?php __('front_extras_price'); ?></strong></td>
					<td><?php echo pjCurrency::formatPrice($tpl['arr']['extra_price']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ($tpl['arr']['tax'] > 0) : ?>
				<tr>
					<td><strong><?php __('front_tax'); ?></strong></td>
					<td><?php echo pjCurrency::formatPrice($tpl['arr']['tax']); ?></td>
				</tr>
				<?php endif; ?>
				<tr>
					<td><strong><?php __('front_total'); ?></strong></td>
					<td><?php echo pjCurrency::formatPrice($tpl['arr']['total']); ?></td>
				</tr>
				<?php if ($tpl['arr']['security'] > 0) : ?>
				<tr>
					<td><strong><?php __('front_security'); ?></strong></td>
					<td><?php echo pjCurrency::formatPrice($tpl['arr']['security']); ?></td>
				</tr>
				<?php endif; ?>
				<tr>
					<td><strong><?php __('front_deposit'); ?></strong></td>
					<td><?php echo pjCurrency::formatPrice($tpl['arr']['deposit']); ?></td>
				</tr>
			</tbody>
		</table>
		
		<h3><?php __('front_personal'); ?></h3>
		
		<table class="table table-striped table-hover no-margins">
			<tbody>
				<?php if ((int) $tpl['option_arr']['o_bf_title'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_title'); ?></strong></td>
					<td><?php $pt = __('personal_titles', true); echo @$pt[$tpl['client']['c_title']]; ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_name'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_name'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['auth_client']['name']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_phone'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_phone'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['auth_client']['phone']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_email'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_email'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['auth_client']['email']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_arrival'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_arrival'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['arr']['c_arrival']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_notes'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_notes'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['arr']['c_notes']); ?></td>
				</tr>
				<?php endif; ?>
			</tbody>
		</table>
		
		<h3><?php __('front_billing'); ?></h3>
		
		<table class="table table-striped table-hover no-margins">
			<tbody>
				<?php if ((int) $tpl['option_arr']['o_bf_company'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_company'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['client']['c_company']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_address'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_address'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['client']['c_address']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_city'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_city'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['client']['c_city']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_state'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_state'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['client']['c_state']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_zip'] !== 1) : ?>
				<tr>
					<td><strong><?php __('booking_c_zip'); ?></strong></td>
					<td><?php echo pjSanitize::html(@$tpl['client']['c_zip']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_bf_country'] !== 1 && isset($tpl['country'])) : ?>
				<tr>
					<td><strong><?php __('booking_c_country'); ?></strong></td>
					<td><?php echo pjSanitize::html($tpl['country']); ?></td>
				</tr>
				<?php endif; ?>
				<?php if ((int) $tpl['option_arr']['o_disable_payments'] === 0) : ?>
				<tr>
					<td><strong><?php __('booking_payment_method'); ?></strong></td>
					<td><?php echo @$tpl['payment_titles'][$tpl['arr']['payment_method']];?></td>
				</tr>
				<?php endif; ?>
			</tbody>
		</table>
		<form id="pjCancelBookingForm_<?php echo $cid;?>" action="#" method="post" class="hbForm">
			<input type="hidden" name="booking_cancel" value="1" />
			<input type="hidden" name="id" value="<?php echo $tpl['arr']['id']; ?>" />
			<input type="hidden" name="cid" value="<?php echo $cid; ?>" />
			<input type="hidden" name="hash" value="<?php echo $controller->_get->toString('hash'); ?>" />
			<button type="submit" class="btn btn-primary"><?php __('cancel_confirm'); ?></button>
		</form>
		
		<p id="pjCancelBookingAlert" class="alert alert-warning" style="display:none;"></p>
		<?php
    }
    ?>
	</div><!-- /.panel-body -->
</div><!-- /.panel panel-default -->