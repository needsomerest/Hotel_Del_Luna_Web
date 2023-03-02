<div class="panel no-borders">
	<div class="panel-heading bg-completed">
		<p class="lead m-n"><?php __('extra_update_title')?></p>
	</div><!-- /.panel-heading -->

	<div class="panel-body">
		<form action="" method="post" id="frmUpdate">
			<input type="hidden" name="update_extra" value="1" />
			<input type="hidden" name="id" value="<?php echo $tpl['arr']['id'];?>" />
			<div class="form-group">
				<label class="control-label"><?php __('extra_name');?></label>
			
				<?php
				foreach ($tpl['lp_arr'] as $v)
				{
					?>
					<div class="<?php echo $tpl['is_flag_ready'] ? 'input-group' : '';?> pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 1 ? NULL : 'none'; ?>">
						<input type="text" class="form-control<?php echo (int) $v['is_default'] === 0 ? NULL : ' required'; ?>" name="i18n[<?php echo $v['id']; ?>][name]" value="<?php echo pjSanitize::html(@$tpl['arr']['i18n'][$v['id']]['name']); ?>"  data-msg-required="<?php __('lblFieldRequired');?>">	
						<?php if ($tpl['is_flag_ready']) : ?>
						<span class="input-group-addon pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="<?php echo pjSanitize::html($v['name']); ?>"></span>
						<?php endif; ?>
					</div>
					<?php 
				}
				?>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-6">
					<div class="form-group">
						<label class="control-label"><?php __('extra_price');?></label>
					
						<div class="input-group"> 
							<input type="text" name="price" value="<?php echo (float) $tpl['arr']['price']; ?>" class="form-control number" data-msg-number="<?php __('prices_invalid_price', false, true);?>"/> 
						
							<span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-md-6">
					<div class="form-group">
						<label class="control-label"><?php __('extra_per_lbl');?></label>
					
						<select class="form-control" name="per">
							<?php foreach (__('extra_per', true) as $k => $v) { ?>
								<option value="<?php echo $k;?>"<?php echo $tpl['arr']['per'] != $k ? NULL : ' selected="selected"'; ?>><?php echo $v;?></option>
							<?php } ?>
						</select>
					</div>
				</div>
			</div>
			
			<div class="m-t-sm">
				<button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
					<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
					<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
				</button>
				<button type="button" class="btn btn-white btn-lg pull-right pjBtnCancelUpdateExtra"><?php __('btnCancel'); ?></button>
			</div><!-- /.m-b-lg -->
		</form>
	</div><!-- /.panel-body -->
</div><!-- /.panel panel-primary -->