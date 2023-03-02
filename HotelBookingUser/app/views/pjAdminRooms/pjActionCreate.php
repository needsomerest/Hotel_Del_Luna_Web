<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
?>	
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-lg-9 col-md-8 col-sm-6">
					<h2><?php echo $titles['AR06']; ?></h2>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 btn-group-languages">
                    <?php if ($tpl['is_flag_ready']) : ?>
					<div class="multilang"></div>
					<?php endif; ?>    
            	</div>
			</div>
			<p class="m-b-none"><i class="fa fa-info-circle"></i><?php echo $bodies['AR06']; ?></p>
		</div>
	</div>
        
	<div class="row wrapper wrapper-content animated fadeInRight">
		<div class="col-lg-12">
		
			<div class="ibox float-e-margins">
				<div class="ibox-content">
					<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminRooms&amp;action=pjActionCreate" method="post" id="frmCreate">
						<input type="hidden" name="action_create" value="1" />
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="control-label"><?php __('rooms_name'); ?></label>

                                                <?php
												foreach ($tpl['lp_arr'] as $v)
												{
													?>
													<div class="<?php echo $tpl['is_flag_ready'] ? 'input-group' : '';?> pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 1 ? NULL : 'none'; ?>">
														<input type="text" class="form-control field-name <?php echo (int) $v['is_default'] === 0 ? NULL : ' required'; ?>" name="i18n[<?php echo $v['id']; ?>][name]" data-msg-required="<?php __('lblFieldRequired');?>" />	
														<?php if ($tpl['is_flag_ready']) : ?>
														<span class="input-group-addon pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="<?php echo pjSanitize::html($v['name']); ?>"></span>
														<?php endif; ?>
													</div>
													<?php 
												}
												?>
                                            </div>
                                        </div><!-- /.col-sm-6 -->
                                    </div>    
									<div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label"><?php __('rooms_adults');?></label>

                                                <input class="touchspin3" type="text" name="adults" id="adults" readonly="readonly" />
                                            </div>
                                        </div><!-- /.col-sm-6 -->    

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label"><?php __('rooms_children');?></label>

                                                <input class="touchspin3" type="text" name="children" id="children" readonly="readonly" />
                                            </div>
                                        </div><!-- /.col-sm-6 -->    

                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label"><?php __('rooms_cnt');?></label>

                                                <input class="touchspin3" type="text" name="cnt" id="cnt" readonly="readonly" />
                                                <small><?php __('room_count_note');?></small>
                                            </div>
                                        </div><!-- /.col-sm-6 -->    
                                        
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="control-label"><?php __('rooms_max_occupancy');?></label>

                                                <input class="touchspin3" type="text" name="max_people" id="max_people" readonly="readonly" />
                                                <small><?php __('room_max_occupancy_note');?></small>
                                            </div>
                                        </div><!-- /.col-sm-6 -->  
                                        
                                        <div class="room-no" style="display: none;">
											<div class="col-sm-12">
												<div class="hr-line-dashed"></div>
		
												<label class="control-label"><?php __('room_numbers');?></label>
												<p><small><?php __('room_numbers_note');?></small></p>
												<div class="row" id="hbRoomNumber" data-numbers="<?php __('room_numbers', false, true); ?>" data-enter="<?php __('room_numbers_enter', false, true); ?>" data-note="<?php __('room_numbers_note', false, true); ?>">
													
												</div><!-- /.row -->
											</div><!-- /.col-sm-12 -->
										</div>
										
                                    </div><!-- /.row -->
                                </div><!-- /.col-md-3 -->

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="control-label"><?php __('rooms_description');?></label>

                                        <?php
										foreach ($tpl['lp_arr'] as $v)
										{
											?>
											<div class="<?php echo $tpl['is_flag_ready'] ? 'input-group' : '';?> pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 1 ? NULL : 'none'; ?>">
												<textarea name="i18n[<?php echo $v['id']; ?>][description]" class="form-control" cols="30" rows="10"></textarea>	
												<?php if ($tpl['is_flag_ready']) : ?>
												<span class="input-group-addon pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="<?php echo pjSanitize::html($v['name']); ?>"></span>
												<?php endif; ?>
											</div>
											<?php 
										}
										?>
                                    </div><!-- /.form-group -->
                                </div><!-- /.col-md-3 -->
                            </div><!-- /.row -->
                           
                            <div class="hr-line-dashed"></div>
                            
                            <div class="clearfix">
                                <button type="submit" class="ladda-button btn btn-primary btn-lg btn-phpjabbers-loader pull-left" data-style="zoom-in">
									<span class="ladda-label"><?php __('btnSave', false, true); ?></span>
									<?php include $controller->getConstant('pjBase', 'PLUGIN_VIEWS_PATH') . 'pjLayouts/elements/button-animation.php'; ?>
								</button>
                                <button type="button" class="btn btn-white btn-lg pull-right" onclick="window.location.href='<?php echo PJ_INSTALL_URL; ?>index.php?controller=pjAdminRooms&action=pjActionIndex';"><?php __('btnCancel'); ?></button>
                            </div><!-- /.clearfix -->
                        </form>
				</div>
			</div>
		
		</div><!-- /.col-sm-12 -->
		
	</div>

<script type="text/javascript">
var myLabel = myLabel || {};
myLabel.isFlagReady = "<?php echo $tpl['is_flag_ready'] ? 1 : 0;?>";
<?php if ($tpl['is_flag_ready']) : ?>
	var pjLocale = pjLocale || {};
	pjLocale.langs = <?php echo $tpl['locale_str']; ?>;
	pjLocale.flagPath = "<?php echo PJ_FRAMEWORK_LIBS_PATH; ?>pj/img/flags/";
<?php endif; ?>
</script>