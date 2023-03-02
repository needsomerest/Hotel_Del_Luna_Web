<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
?>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-12">
		<h2><?php echo @$titles['AO24']; ?></h2>
        <p class="m-b-none"><i class="fa fa-info-circle"></i><?php echo @$bodies['AO24']; ?></p>
    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <?php
	$error_code = $controller->_get->toString('err');
	if (!empty($error_code))
    {
    	$titles = __('error_titles', true);
    	$bodies = __('error_bodies', true);
    	switch (true)
    	{
    		case in_array($error_code, array('AO04')):
    			?>
    			<div class="alert alert-success">
    				<i class="fa fa-check m-r-xs"></i>
    				<strong><?php echo @$titles[$error_code]; ?></strong>
    				<?php echo @$bodies[$error_code]?>
    			</div>
    			<?php
    			break;
    		case in_array($error_code, array('')):
    			?>
    			<div class="alert alert-danger">
    				<i class="fa fa-exclamation-triangle m-r-xs"></i>
    				<strong><?php echo @$titles[$error_code]; ?></strong>
    				<?php echo @$bodies[$error_code]?>
    			</div>
    			<?php
    			break;
    	}
    }
    ?>
    <div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <?php
    				if (isset($tpl['arr']) && is_array($tpl['arr']) && !empty($tpl['arr']))
    				{
                    ?>
                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionUpdate" method="post" id="frmUpdateOptions">
                        <input type="hidden" name="options_update" value="1" />
                        <input type="hidden" name="tab" value="3" />
                        <input type="hidden" name="next_action" value="pjActionBookingForm" />

						<div class="m-b-md">
							<h2><?php __('opt_personal_field_title'); ?></h2>

							<p><small><?php __('opt_personal_field_desc'); ?></small></p>
						</div>
						
						<div class="row">
                            <?php
                            foreach ($tpl['arr'] as $option)
                            {
                                if(in_array($option['key'], array('o_bf_title','o_bf_name','o_bf_email','o_bf_phone','o_bf_company'))) 
                                {
                                    if( (int) $option['is_visible'] === 0) continue;
	                                ?>
	                                <div class="col-md-3 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                        <label class="control-label"><?php __('opt_' . $option['key']); ?></label>
	
	                                        <?php include dirname(__FILE__) . '/elements/enum.php'; ?>
	                                    </div>
	                                </div><!-- /.col-md-3 -->
	                                <?php
                                }
                            }
                            ?>
                        </div>

                        <div class="hr-line-dashed"></div>

						<div class="m-b-md">
							<h2><?php __('opt_address_field_title'); ?></h2>

							<p><small><?php __('opt_address_field_desc'); ?></small></p>
						</div>
						
						<div class="row">
                            <?php
                            foreach ($tpl['arr'] as $option)
                            {
                                if(in_array($option['key'], array('o_bf_address','o_bf_country','o_bf_state','o_bf_city','o_bf_zip'))) 
                                {
                                    if( (int) $option['is_visible'] === 0) continue;
	                                ?>
	                                <div class="col-md-3 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                        <label class="control-label"><?php __('opt_' . $option['key']); ?></label>
	
	                                        <?php include dirname(__FILE__) . '/elements/enum.php'; ?>
	                                    </div>
	                                </div><!-- /.col-md-3 -->
	                                <?php
                                }
                            }
                            ?>
                        </div>

                        <div class="hr-line-dashed"></div>
                        
                        <div class="m-b-md">
							<h2><?php __('opt_extra_field_title'); ?></h2>

							<p><small><?php __('opt_extra_field_desc'); ?></small></p>
						</div>
						
						<div class="row">
                            <?php
                            foreach ($tpl['arr'] as $option)
                            {
                                if(in_array($option['key'], array('o_bf_arrival','o_bf_notes','o_bf_terms','o_bf_captcha'))) 
                                {
                                    if( (int) $option['is_visible'] === 0) continue;
	                                ?>
	                                <div class="col-md-3 col-sm-4 col-xs-6">
	                                    <div class="form-group">
	                                        <label class="control-label"><?php __('opt_' . $option['key']); ?></label>
	
	                                        <?php include dirname(__FILE__) . '/elements/enum.php'; ?>
	                                    </div>
	                                </div><!-- /.col-md-3 -->
	                                <?php
                                }
                            }
                            ?>
                        </div>

                        <div class="hr-line-dashed"></div>
                        
                        <div class="clearfix">
                            <button class="ladda-button btn btn-primary btn-lg pull-left btn-phpjabbers-loader" data-style="zoom-in">
                                <span class="ladda-label"><?php __('plugin_base_btn_save'); ?></span>
                                <?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
                            </button>
                        </div>
                    </form>
                    <?php
                }
                ?>
            </div>
        </div>
    </div><!-- /.col-lg-12 -->
    </div>
</div>