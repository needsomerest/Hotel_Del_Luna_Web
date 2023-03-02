<?php
if (isset($tpl['arr']) && !empty($tpl['arr']))
{
    ?>
	<form action="" method="post" class="">
		<input type="hidden" name="send_email" value="1" />
		<input type="hidden" name="id" value="<?php echo $tpl['arr']['id']; ?>" />
		<?php if (!empty($tpl['arr']['to'])) : ?>
		<div class="form-group">
			<label class="control-label"><?php __('booking_c_email'); ?></label>
	
			<input type="text" name="to" class="form-control required email" value="<?php echo pjSanitize::html($tpl['arr']['to']); ?>"/>
		</div>
		<?php endif; ?>
		<div class="form-group">
			<label class="control-label"><?php __('booking_subject');?></label>
			<input type="text" name="subject" id="confirm_subject" class="form-control required" value="<?php echo pjSanitize::html(stripslashes($tpl['arr']['subject'])); ?>" />
		</div>
		<div class="form-group">
			<label class="control-label"><?php __('booking_message');?></label>
			<div id="crMessageEditorWrapper">
				<textarea name="message" id="mceEditor" class="form-control required"><?php echo stripslashes(str_replace(array('\r\n', '\n'), '&#10;', $tpl['arr']['message'])); ?></textarea>
			</div>			
		</div>
	</form>
	<?php
}else{
    ?>
    <div id="pjResendAlert" class="alert alert-warning">
   		<?php __('lblEmailNotificationNotSet')?>
    </div>
    <?php    
}
?>