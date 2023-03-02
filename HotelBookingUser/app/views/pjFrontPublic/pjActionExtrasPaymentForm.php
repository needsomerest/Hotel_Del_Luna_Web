<?php
if (isset($tpl['params']['plugin']) && !empty($tpl['params']['plugin']))
{
    $payment_messages = __('payment_plugin_messages');
    $message = isset($payment_messages[$tpl['payment_method']]) ? $payment_messages[$tpl['payment_method']]: "";
    ?>
	<div class="alert alert-info"><?php echo $message; ?></div>
	<?php
	if (pjObject::getPlugin($tpl['params']['plugin']) !== NULL)
	{
		$controller->requestAction(array('controller' => $tpl['params']['plugin'], 'action' => 'pjActionForm', 'params' => $tpl['params']));
	}
} else {
	switch ($tpl['payment_method'])
	{
		case 'bank':
			?>
			<div class="alert alert-info"><?php echo nl2br(pjSanitize::html($tpl['option_arr']['o_bank_account'])); ?></div>
			<?php
			break;
	}
}
?>