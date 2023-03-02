<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-10">
                <h2><?php __('infoInstallTitle') ?></h2>
            </div>
        </div><!-- /.row -->

        <p class="m-b-none"><i class="fa fa-info-circle"></i> <?php __('infoInstallDesc') ?></p>
    </div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
    <div class="col-lg-12">
    	<div class="tabs-container tabs-reservations m-b-lg">
    		<ul class="nav nav-tabs" role="tablist">
				<li role="presentation"<?php echo $controller->_get->check('err') ? : ' class="active"'; ?>><a class="nav-tab-install-code" href="#tab-install-code" aria-controls="install-code" role="tab" data-toggle="tab"><?php __('install_tab_install_code');?></a></li>
				<li role="presentation"<?php echo $controller->_get->check('err') ? ' class="active"' : '' ; ?>><a class="nav-tab-additional" href="#tab-additional" aria-controls="additional" role="tab" data-toggle="tab"><?php __('install_tab_additional');?></a></li>
			</ul>
			<div class="tab-content">
        		<div role="tabpanel" class="tab-pane<?php echo $controller->_get->check('err') ? '' : ' active'; ?>" id="tab-install-code">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <form action="" method="get" class="form-horizontal">
                                <?php if (count($tpl['menu_locale_arr']) > 1) : ?>
                                    <div class="m-b-lg">
                                        <h2 class="no-margins"><?php __('lblInstallConfig');?></h2>
                                    </div>
            
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label class="col-lg-3 col-md-4 control-label"><?php __('lblInstallConfigLocale');?></label>
            
                                                <div class="col-lg-5 col-md-8">
                                                    <select name="install_locale" id="install_locale" class="form-control">
                                                        <option value="">-- <?php __('plugin_base_choose'); ?> --</option>
                                                        <?php
                                                        foreach ($tpl['menu_locale_arr'] as $locale)
                                                        {
                                                            ?><option value="<?php echo $locale['id']; ?>"><?php echo pjSanitize::html($locale['title']); ?></option><?php
                                                        }
                                                        ?>
                                                    </select>
                                                </div>
                                            </div>
            
                                            <div class="form-group">
                                                <label class="col-lg-3 col-md-4 control-label"><?php __('lblInstallConfigHide');?></label>
            
                                                <div class="col-lg-5 col-md-8">
                                                    <div class="clearfix">
                                                        <div class="switch onoffswitch-data pull-left">
                                                            <div class="onoffswitch">
                                                                <input type="checkbox" class="onoffswitch-checkbox" id="install_hide" name="install_hide">
                                                                <label class="onoffswitch-label" for="install_hide">
                                                                    <span class="onoffswitch-inner" data-on="<?php __('plugin_base_yesno_ARRAY_T', false, true); ?>" data-off="<?php __('plugin_base_yesno_ARRAY_F', false, true); ?>"></span>
                                                                    <span class="onoffswitch-switch"></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
            
                                    <div class="hr-line-dashed"></div>
                                <?php endif; ?>
            
                                <div class="m-b-lg">
                                    <h2 class="no-margins"><?php __('infoInstallCodeTitle');?></h2>
                                </div>
            
                                <p class="alert alert-info alert-with-icon m-t-xs"><i class="fa fa-info-circle"></i> <?php __('lblInstallJs1_body') ?></p>
            
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <div class="col-lg-12 col-md-12">
                                                <textarea class="form-control textarea_install" id="install_code" rows="8">
&lt;link href="<?php echo PJ_INSTALL_URL.PJ_FRAMEWORK_LIBS_PATH . 'pj/css/'; ?>pj.bootstrap.min.css" type="text/css" rel="stylesheet" /&gt;
&lt;link href="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjFront&action=pjActionLoadCss&cid=<?php echo $controller->getForeignId(); ?>&theme=<?php echo $tpl['option_arr']['o_theme']; ?>" type="text/css" rel="stylesheet" /&gt;
&lt;script type="text/javascript" src="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjFront&action=pjActionLoad&cid=<?php echo $controller->getForeignId(); ?>&theme=<?php echo $tpl['option_arr']['o_theme']; ?>"&gt;&lt;/script&gt;</textarea>
                                            </div>
                                        </div>
                                    </div>
            						<div style="display:none" id="hidden_code">&lt;link href="<?php echo PJ_INSTALL_URL.PJ_FRAMEWORK_LIBS_PATH . 'pj/css/'; ?>pj.bootstrap.min.css" type="text/css" rel="stylesheet" /&gt;
&lt;link href="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjFront&action=pjActionLoadCss&cid=<?php echo $controller->getForeignId(); ?>&theme=<?php echo $tpl['option_arr']['o_theme']; ?>" type="text/css" rel="stylesheet" /&gt;
&lt;script type="text/javascript" src="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjFront&action=pjActionLoad&cid=<?php echo $controller->getForeignId(); ?>&theme=<?php echo $tpl['option_arr']['o_theme']; ?>{LOCALE}{HIDE}"&gt;&lt;/script&gt;</div>
                                </div>
                            </form>
                            
                            <div class="hr-line-dashed"></div>
                            
                            <div class="m-b-lg">
                                <h2 class="no-margins"><?php __('install_method_2'); ?></h2>
                            </div>
                            <div class="install-hint"><?php __('install_method_2_hint'); ?></div>
                			<div class="install-code">
                		 		<a target="_blank" href="<?php echo PJ_INSTALL_URL; ?>book.html"><?php echo PJ_INSTALL_URL; ?>book.html</a>
                			</div>
                			
                			<div class="hr-line-dashed"></div>
                			
                			<div class="m-b-lg">
                                <h2 class="no-margins"><?php __('install_method_3'); ?></h2>
                            </div>
                			<div class="install-hint"><?php __('install_method_3_hint'); ?></div>
                			<div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                						<textarea class="form-control textarea_install" style="overflow: auto; height:65px">&lt;a href="<?php echo PJ_INSTALL_URL; ?>book.html"&gt;<?php __('install_link'); ?>&lt/a&gt;</textarea>
                					</div>
                				</div>
                			</div>
                			
                        </div>
                    </div>
               	</div><!-- /.tab-pane active -->
               	<div role="tabpanel" class="tab-pane<?php echo $controller->_get->check('err') ? ' active' : '' ; ?>" id="tab-additional">
               		<div class="ibox float-e-margins">
                        <div class="ibox-content">
                        	<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionUpdate" method="post" class="form-horizontal">
                        		<input type="hidden" name="options_update" value="1" />
                    			<input type="hidden" name="next_action" value="pjActionInstall" />
                    			
                            	<div class="m-b-lg">
                                    <h2 class="no-margins"><?php __('install_for_extra_payments');?></h2>
                                </div>
                                <p class="alert alert-info alert-with-icon m-t-xs"><i class="fa fa-info-circle"></i> <?php __('install_for_extra_payments_info') ?></p>
                                
                                <div class="col-lg-8">
                                    <div class="form-group">
                                    	<textarea class="form-control textarea_install" id="install_code" rows="3">&lt;link href="<?php echo PJ_INSTALL_URL.PJ_FRAMEWORK_LIBS_PATH . 'pj/css/'; ?>pj.bootstrap.min.css" type="text/css" rel="stylesheet" /&gt;
&lt;script type="text/javascript" src="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjFront&action=pjActionLoadExtraPayments&cid=<?php echo $controller->getForeignId(); ?>"&gt;&lt;/script&gt;</textarea>
                                    </div>
                                </div>
                               <div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label class="col-lg-3 col-md-4 control-label"><?php __('install_page_url');?></label>
        
                                            <div class="col-lg-9 col-md-8">
                                                <div class="input-group">
                    								<span class="input-group-addon"><i class="fa fa-globe"></i></span> 
                    								<input type="text" name="value-string-o_extra_payment_url" value="<?php echo pjSanitize::html($tpl['option_arr']['o_extra_payment_url']);?>" class="form-control" maxlength="255">
                    							</div>
                    							<small><?php __('install_for_extra_payments_text');?></small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="hr-line-dashed"></div>
                                
                                <div class="m-b-lg">
                                    <h2 class="no-margins"><?php __('install_for_cancellation');?></h2>
                                </div>
                                <p class="alert alert-info alert-with-icon m-t-xs"><i class="fa fa-info-circle"></i> <?php __('install_for_cancellation_info') ?></p>
                                
                                <div class="col-lg-8">
                                    <div class="form-group">
                                     	<textarea class="form-control textarea_install" id="install_code" rows="3">&lt;link href="<?php echo PJ_INSTALL_URL.PJ_FRAMEWORK_LIBS_PATH . 'pj/css/'; ?>pj.bootstrap.min.css" type="text/css" rel="stylesheet" /&gt;
&lt;script type="text/javascript" src="<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjFront&action=pjActionLoadCancel&cid=<?php echo $controller->getForeignId(); ?>"&gt;&lt;/script&gt;</textarea>
                                    </div>
                                </div>
                                
                            	<div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label class="col-lg-3 col-md-4 control-label"><?php __('install_page_url');?></label>
        
                                            <div class="col-lg-9 col-md-8">
                                                <div class="input-group">
                    								<span class="input-group-addon"><i class="fa fa-globe"></i></span> 
                    								<input type="text" name="value-string-o_cancel_booking_url" value="<?php echo pjSanitize::html($tpl['option_arr']['o_cancel_booking_url']);?>" class="form-control" maxlength="255">
                    							</div>
                    							<small><?php __('install_for_cancellation_text');?></small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="hr-line-dashed"></div>
                                <div class="clearfix">
                                    <button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
                                        <span class="ladda-label"><?php __('plugin_base_btn_save'); ?></span>
                                        <?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
                                    </button>
                                </div><!-- /.clearfix -->
                            </form>
                        </div>
                    </div>
               	</div>
           </div><!-- /.tab-content -->
    	</div><!-- /.tabs-container tabs-reservations m-b-lg -->
    </div><!-- /.col-lg-12 -->
</div>