<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-10">
                <h2><?php __('infoCreateClientTitle', false, true);?></h2>
            </div>
        </div><!-- /.row -->

        <p class="m-b-none"><i class="fa fa-info-circle"></i> <?php __('infoCreateClientDesc', false, true);?></p>
    </div><!-- /.col-md-12 -->
</div>
<?php
$u_statarr = __('u_statarr', true)
?>
<div class="row wrapper wrapper-content animated fadeInRight">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminClients&amp;action=pjActionCreate" method="post" id="frmCreateClient">
                	<input type="hidden" name="client_create" value="1" />
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblStatus'); ?></label>

                                <div class="clearfix">
                                    <div class="switch onoffswitch-data pull-left">
                                        <div class="onoffswitch">
                                            <input type="checkbox" class="onoffswitch-checkbox" id="status" name="status" checked>
                                            <label class="onoffswitch-label" for="status">
                                                <span class="onoffswitch-inner" data-on="<?php echo $u_statarr['T'];?>" data-off="<?php echo $u_statarr['F'];?>"></span>
                                                <span class="onoffswitch-switch"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div><!-- /.clearfix -->
                            </div><!-- /.form-group -->
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblTitle'); ?></label>

                                <select name="c_title" id="c_title" class="form-control required" data-msg-required="<?php __('lblFieldRequired', false, true);?>">
                					<option value="">-- <?php __('lblChoose'); ?>--</option>
                					<?php
                					$name_titles = __('personal_titles', true, false);
                					foreach ($name_titles as $k => $v)
                					{
                						?><option value="<?php echo $k; ?>"><?php echo $v; ?></option><?php
                					}
                					?>
                				</select>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblName'); ?></label>

                                <input type="text" id="c_name" name="c_name" class="form-control required" data-msg-required="<?php __('lblFieldRequired', false, true);?>">
                            </div>
                        </div><!-- /.col-md-3 -->
                    </div><!-- /.row -->

                    <div class="hr-line-dashed"></div>

                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblEmail'); ?></label>

                                <input type="text" name="c_email" id="email" class="form-control email required" placeholder="info@domain.com" data-msg-required="<?php __('lblFieldRequired', false, true);?>" data-msg-email="<?php __('lblEmailInvalid');?>"/>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('pass'); ?></label>

                                <input type="password" name="c_password" id="c_password" class="form-control required" data-msg-required="<?php __('lblFieldRequired', false, true);?>"/>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblPhone'); ?></label>

                                <input type="text" name="c_phone" id="phone" class="form-control" placeholder="(123) 456-7890"/>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblCompany'); ?></label>

                                <input type="text" name="c_company" id="c_company" class="form-control">
                            </div>
                        </div><!-- /.col-md-3 -->
                    </div><!-- /.row -->

                    <div class="hr-line-dashed"></div>
                    
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblAddress'); ?></label>

                                <input type="text" name="c_address" id="c_address" class="form-control">
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblCity'); ?></label>

                                <input type="text" name="c_city" id="c_city" class="form-control"/>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblState'); ?></label>

                                <input type="text" name="c_state" id="c_state" class="form-control"/>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblZip'); ?></label>

                                <input type="text" name="c_zip" id="c_zip" class="form-control"/>
                            </div>
                        </div><!-- /.col-md-3 -->

                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblCountry'); ?></label>

                                <select name="c_country" id="c_country" class="select-countries form-control" data-placeholder="-- <?php __('lblChoose'); ?> --">
                					<option value="">-- <?php __('lblChoose'); ?>--</option>
                					<?php
                					foreach ($tpl['country_arr'] as $v)
                					{
                						?><option value="<?php echo $v['id']; ?>"><?php echo stripslashes($v['country_title']); ?></option><?php
                					}
                					?>
                				</select>
                            </div>
                        </div><!-- /.col-md-3 -->
                        <div class="col-lg-6 col-md-8 col-sm-12">
                            <div class="form-group">
                                <label class="control-label"><?php __('lblNotes'); ?></label>

                                <textarea id="c_notes" name="c_notes" rows="4" class="form-control"></textarea>
                            </div>
                        </div><!-- /.col-md-3 -->
                    </div><!-- /.row -->

                    <div class="hr-line-dashed"></div>

                    <div class="clearfix">
                        <button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in" style="margin-right: 15px;">
                            <span class="ladda-label"><?php __('btnSave'); ?></span>
                            <?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
                        </button>
                        <button type="button" class="btn btn-white btn-lg pull-right" onclick="window.location.href='<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjAdminClients&action=pjActionIndex';"><?php __('btnCancel'); ?></button>
                    </div><!-- /.clearfix -->
                </form>
            </div>
        </div>
    </div><!-- /.col-lg-12 -->
</div>
<script type="text/javascript">
var myLabel = myLabel || {};
myLabel.email_exists = <?php x__encode('vr_email_taken'); ?>;
</script>