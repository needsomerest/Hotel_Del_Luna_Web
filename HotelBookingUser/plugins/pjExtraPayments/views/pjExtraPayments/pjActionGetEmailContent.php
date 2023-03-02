<?php
if (isset($tpl['arr']) && !empty($tpl['arr']))
{
    ?>
	<form action="" method="post" class="">
		<input type="hidden" name="send_email" value="1" />
		<input type="hidden" name="id" value="<?php echo $tpl['arr']['id']; ?>" />
		<?php if (!empty($tpl['arr']['to'])) : ?>
		<div class="form-group">
			<label class="control-label"><?php __('plugin_ep_send_to'); ?></label>
	
			<input type="text" name="to" value="<?php echo pjSanitize::html($tpl['arr']['to']); ?>" class="form-control required email"/>
		</div>
		<?php endif; ?>
		<div class="form-group">
			<label class="control-label"><?php __('plugin_ep_subject');?></label>
			<input type="text" name="subject" id="confirm_subject" class="form-control required" value="<?php echo pjSanitize::html($tpl['arr']['subject']); ?>" />
		</div>
		<div class="form-group">
			<label class="control-label"><?php __('plugin_ep_message');?></label>
			<textarea name="message" id="mceEditor" class="form-control required"><?php echo stripslashes(str_replace(array('\r\n', '\n'), '&#10;', $tpl['arr']['message'])); ?></textarea>			
		</div>
	</form>
	<?php
}else{
    ?>
    <div class="alert alert-warning">
   		<?php __('plugin_ep_warning_notification_not_set')?>
    </div>
    <?php    
}
?>