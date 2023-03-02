<div class="panel panel-default clearfix pjHbPanel">
	<?php 
	include dirname(__FILE__) . '/elements/head.php'; 
	$FORM =  @$_SESSION[$controller->defaultClient];
	?>
	
</div><!-- /.panel panel-default clearfix pjHbPanel -->
<br/>
<form action="" class="form-horizontal pjHbFormCheckOut hbSelectorFormCheckout" data-toggle="validator" role="form" method="post">
	<input type="hidden" name="hb_profile" value="1" />
	<input type="hidden" name="foreign_id" value="<?php echo @$FORM['foreign_id'];?>" />
	<h3 class="pjHbPanelTitle"><?php __('front_profile'); ?></h3>
	<br/>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_title'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<select class="form-control<?php echo (int) $tpl['option_arr']['o_bf_title'] === 3 ? ' required' : NULL; ?>" name="c_title">
				<option value="">-- <?php __('front_select_title'); ?> --</option>
				<?php
				foreach (__('personal_titles', true) as $k => $v)
				{
					?><option value="<?php echo $k; ?>"<?php echo @$FORM['c_title'] != $k ? NULL : ' selected="selected"'; ?>><?php echo $v; ?></option><?php
				}
				?>
			</select>
		</div><!-- /.col-sm-10 -->
	</div>
	
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_name'); ?><span class="text-danger">*</span></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_name'] === 3 ? ' required' : NULL; ?>" name="c_name" value="<?php echo pjSanitize::html(@$FORM['name']); ?>" data-msg-required="<?php __('front_validate_name', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	
	
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_email'); ?><span class="text-danger">*</span></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="email" class="form-control email<?php echo (int) $tpl['option_arr']['o_bf_email'] === 3 ? ' required' : NULL; ?>" name="c_email" value="<?php echo pjSanitize::html(@$FORM['email']); ?>"data-msg-required="<?php __('front_validate_email', false, true); ?>" data-msg-email="<?php __('front_validate_email_invalid', false, true); ?>" data-msg-remote="<?php __('vr_email_taken', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_password'); ?><span class="text-danger">*</span></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="password" class="form-control required" name="c_password" value="<?php echo pjSanitize::html(@$FORM['password']); ?>"data-msg-required="<?php __('front_validate_password', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_phone'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_phone'] === 3 ? ' required' : NULL; ?>" name="c_phone" value="<?php echo pjSanitize::html(@$FORM['phone']); ?>" data-msg-required="<?php __('front_validate_phone', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_company'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" name="c_company" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_company'] === 3 ? ' required' : NULL; ?>" value="<?php echo pjSanitize::html(@$FORM['c_company']); ?>" data-msg-required="<?php __('front_validate_company', false, true); ?>" />
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_address'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_address'] === 3 ? ' required' : NULL; ?>" name="c_address" value="<?php echo pjSanitize::html(@$FORM['c_address']); ?>"data-msg-required="<?php __('front_validate_address', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_city'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_city'] === 3 ? ' required' : NULL; ?>" name="c_city" value="<?php echo pjSanitize::html(@$FORM['c_city']); ?>" data-msg-required="<?php __('front_validate_city', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_state'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_state'] === 3 ? ' required' : NULL; ?>" name="c_state" value="<?php echo pjSanitize::html(@$FORM['c_state']); ?>" data-msg-required="<?php __('front_validate_state', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_zip'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<input type="text" class="form-control<?php echo (int) $tpl['option_arr']['o_bf_zip'] === 3 ? ' required' : NULL; ?>" name="c_zip" value="<?php echo pjSanitize::html(@$FORM['c_zip']); ?>"data-msg-required="<?php __('front_validate_zip', false, true); ?>">
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('booking_c_country'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<select class="form-control<?php echo (int) $tpl['option_arr']['o_bf_country'] === 3 ? ' required' : NULL; ?>" name="c_country"data-msg-required="<?php __('front_validate_country', false, true); ?>">
				<option value="">-- <?php __('front_select_country'); ?> --</option>
				<?php
				foreach ($tpl['country_arr'] as $country)
				{
					?><option value="<?php echo $country['id']; ?>"<?php echo @$FORM['c_country'] != $country['id'] ? NULL : ' selected="selected"'; ?>><?php echo pjSanitize::html($country['name']); ?></option><?php
				}
				?>
			</select>
		</div><!-- /.col-sm-10 -->
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label"><?php __('front_profile_notes'); ?></label>
		
		<div class="col-sm-9 col-xs-12">
			<textarea class="form-control<?php echo (int) $tpl['option_arr']['o_bf_notes'] === 3 ? ' required' : NULL; ?>" name="c_notes" rows="4" data-msg-required="<?php __('front_validate_notes', false, true); ?>"><?php echo pjSanitize::html(@$FORM['c_notes']); ?></textarea>
		</div>
	</div>
	<div class="form-group" style="display: none;">
		<label class="col-sm-3 col-xs-12 control-label">&nbsp;</label>
		
		<div class="col-sm-9 col-xs-12">
			<div id="pjProfileMessage_<?php echo $controller->_get->toInt('cid');?>" class="alert"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 col-xs-12 control-label">&nbsp;</label>
		
		<div class="col-sm-9 col-xs-12">
			<button type="submit" class="btn btn-default"><?php __('front_btn_save'); ?></button>
		</div>
	</div>
</form>