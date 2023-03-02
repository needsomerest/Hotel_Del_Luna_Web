<?php
?>
<div class="alert alert-info">
	<?php
	if(isset($tpl['params']['plugin']) && !empty($tpl['params']['plugin']))
	{
	    $payment_messages = __('payment_plugin_messages');
	    $message = isset($payment_messages[$tpl['payment_method']]) ? $payment_messages[$tpl['payment_method']]: "";
	    ?>
        <?php echo $message; ?>
        <?php
        if (pjObject::getPlugin($tpl['params']['plugin']) !== NULL)
        {
            $controller->requestAction(array('controller' => $tpl['params']['plugin'], 'action' => 'pjActionForm', 'params' => $tpl['params']));
        }
	}else{
	    switch ($tpl['payment_method'])
	    {
	        case 'bank':
	            ?>
				<?php echo nl2br(pjSanitize::html($tpl['option_arr']['o_bank_account'])); ?>
				<?php
				break;
			case 'cash':
			default:
	    }
	}
	?>
</div>