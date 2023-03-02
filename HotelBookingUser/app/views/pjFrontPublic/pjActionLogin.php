<div class="panel panel-default clearfix pjHbPanel">
	<?php include dirname(__FILE__) . '/elements/head.php'; ?>
</div><!-- /.panel-body pjHbPanelBody pjHbPanelBooking -->
<br/>
<form action="" class="pjHbFormCheckOut hbSelectorFormCheckout" role="form" method="post">
	<input type="hidden" name="hb_login" value="1" />
	<h3 class="pjHbFormCheckOutTitle"><?php __('front_login'); ?></h3>
	<div class="row">
    	<div class="col-lg-6 col-md-6 col-sm-6">
    		<div class="form-group">
    			<label class="control-label"><?php __('front_email'); ?><span class="text-danger">*</span></label>
    			
    			<input type="email" class="form-control email required" name="login_email" data-msg-required="<?php __('front_validate_email', false, true); ?>" data-msg-email="<?php __('front_validate_email_invalid', false, true); ?>">
    		</div>
    	</div>
    	<div class="col-lg-6 col-md-6 col-sm-6">
    		<div class="form-group">
    			<label class="control-label"><?php __('front_password'); ?><span class="text-danger">*</span></label>
    			
    			<input type="password" class="form-control required" name="login_password" data-msg-required="<?php __('front_validate_password', false, true); ?>">
    		</div>
    	</div>
    	<div class="col-lg-12 col-md-12 col-sm-12" style="display: none;">
    		<div id="pjLoginMessage_<?php echo $controller->_get->toInt('cid');?>" class="alert alert-danger text-center"></div>
    	</div>
    	<div class="col-lg-12 col-md-12 col-sm-12">
    		<div class="text-center">
    			<button type="submit" class="btn btn-default"><?php __('front_btn_login'); ?></button>
    			<br/>
    			<a href="#" class="pjHbBtnForgot"><?php __('front_forgot_password'); ?></a>
    		</div>
    	</div>
	</div>
</form>
