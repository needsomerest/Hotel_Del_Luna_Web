<div class="panel panel-default clearfix pjHbPanel">
	<?php include dirname(__FILE__) . '/elements/head.php'; ?>
	
</div><!-- /.panel panel-default clearfix pjHbPanel -->
<br/>
<form action="" class="pjHbFormCheckOut hbSelectorFormCheckout" role="form" method="post">
	<input type="hidden" name="hb_forgot" value="1" />
	<h3 class="pjHbFormCheckOutTitle"><?php __('front_forgot_password'); ?></h3>
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="form-group">
			<label class="control-label"><?php __('front_email'); ?><span class="text-danger">*</span></label>
			
			<input type="email" class="form-control email required" name="email" data-msg-required="<?php __('front_validate_email', false, true); ?>" data-msg-email="<?php __('front_validate_email_invalid', false, true); ?>">
		</div>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12" style="display: none;">
		<div id="pjForgotMessage_<?php echo $controller->_get->toInt('cid');?>" class="alert"></div>
	</div>
	
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="text-center">
			<button type="submit" class="btn btn-default"><?php __('front_btn_send'); ?></button>
			<br/>
			<a href="#" class="pjHbBtnLogin"><?php __('front_btn_login'); ?></a>
		</div>
	</div>
	
</form>