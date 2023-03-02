<div class="panel panel-default clearfix pjHbPanel">
	<?php include dirname(__FILE__) . '/elements/head.php'; ?>

	<div class="panel-body text-center pjHbPanelBody pjHbPanelBodyLast">
	<?php
	if (isset($tpl['booking_arr']) && !empty($tpl['booking_arr']))
	{
	    if(isset($tpl['params']['plugin']) && !empty($tpl['params']['plugin']))
	    {
	        $payment_messages = __('payment_plugin_messages');
	        $message = isset($payment_messages[$tpl['booking_arr']['payment_method']]) ? $payment_messages[$tpl['booking_arr']['payment_method']]: __('front_booking_success', true);
	        ?>
	        <div class="alert alert-info" role="alert" data-payment="<?php echo $tpl['booking_arr']['payment_method']; ?>"><?php echo $message; ?></div>
	        <?php
	        if (pjObject::getPlugin($tpl['params']['plugin']) !== NULL)
	        {
	            $controller->requestAction(array('controller' => $tpl['params']['plugin'], 'action' => 'pjActionForm', 'params' => $tpl['params']));
	        }
	    }else{
	        switch ($tpl['booking_arr']['payment_method'])
	        {
    			case 'bank':
    				?>
    				<p><?php __('front_booking_success'); ?></p>
    				<p><?php printf(__('front_booking_uid', true), $tpl['booking_arr']['uuid']); ?></p>
    				<p><?php __('front_booking_contact'); ?></p>
    				
    				<div class="alert alert-info" role="alert">
    				<?php echo nl2br(pjSanitize::html($tpl['bank_account'])); ?>
    				</div>
    				<p><button type="button" class="btn btn-default text-capitalize hbSelectorSearch"><?php __('front_start_new_booking'); ?></button></p>
    				<?php
    				break;
    			case 'cash':
    			default:
    				?>
    				<p><?php __('front_booking_success'); ?></p>
    				<p><?php printf(__('front_booking_uid', true), $tpl['booking_arr']['uuid']); ?></p>
    				<p><?php __('front_booking_contact'); ?></p>
    				<p><button type="button" class="btn btn-default text-capitalize hbSelectorSearch"><?php __('front_start_new_booking'); ?></button></p>
    				<?php
    		}
	    }
	}
	?>
	</div><!-- /.panel-body pjHbPanelBody -->
</div><!-- /.panel pjHbPanel -->