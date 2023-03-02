<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$info = __('info', true);
?>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-lg-9 col-md-8 col-sm-6">
				<h2><?php echo $titles['AR07']; ?></h2>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 btn-group-languages">
            	<?php if ($tpl['is_flag_ready']) : ?>
					<div class="multilang"></div>
				<?php endif; ?>    
           	</div>
		</div>

		<p class="m-b-none"><i class="fa fa-info-circle"></i><?php echo sprintf(@$bodies['AR07'], 'index.php?controller=pjPrice&action=pjActionIndex&room_id='.$tpl['arr']['id']); ?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="tabs-container tabs-reservations m-b-lg">
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#room" aria-controls="room" role="tab" data-toggle="tab"><?php __('menuRooms');?></a></li>
			<li role="presentation"><a href="#photos" aria-controls="photos" role="tab" data-toggle="tab"><?php echo $info['room_photos_title'];?></a></li>
			<li role="presentation"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminPrices&amp;action=pjActionIndex&amp;room_id=<?php echo $tpl['arr']['id'];?>" ><?php __('menuPrice');?></a></li>
		</ul>

		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="room">
				<div class="panel-body">
					<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminRooms&amp;action=pjActionUpdate" method="post" id="frmUpdate">
						<input type="hidden" name="action_update" value="1" />
						<input type="hidden" name="id" value="<?php echo $tpl['arr']['id'];?>" />
						<div class="row">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
                                                <label class="control-label"><?php __('rooms_name');?></label>

                                                <?php
												foreach ($tpl['lp_arr'] as $v)
												{
													?>
													<div class="<?php echo $tpl['is_flag_ready'] ? 'input-group' : '';?> pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 1 ? NULL : 'none'; ?>">
														<input type="text" class="form-control field-name <?php echo (int) $v['is_default'] === 0 ? NULL : ' required'; ?>" name="i18n[<?php echo $v['id']; ?>][name]" data-msg-required="<?php __('lblFieldRequired');?>" value="<?php echo htmlspecialchars(stripslashes(@$tpl['arr']['i18n'][$v['id']]['name'])); ?>" />	
														<?php if ($tpl['is_flag_ready']) : ?>
														<span class="input-group-addon pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="<?php echo pjSanitize::html($v['name']); ?>"></span>
														<?php endif; ?>
													</div>
													<?php 
												}
												?>
                                            </div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
                                                <label class="control-label"><?php __('rooms_adults');?></label>

                                                <input class="touchspin3" type="text" name="adults" id="adults" readonly="readonly" value="<?php echo (int) $tpl['arr']['adults']; ?>" />
                                            </div>
									</div><!-- /.col-sm-6 -->    

									<div class="col-sm-6">
										<div class="form-group">
                                                <label class="control-label"><?php __('rooms_children');?></label>

                                                <input class="touchspin3" type="text" name="children" id="children" readonly="readonly" value="<?php echo (int) $tpl['arr']['children']; ?>" />
                                            </div>
									</div><!-- /.col-sm-6 -->    

									<div class="col-sm-6">
										<div class="form-group">
                                                <label class="control-label"><?php __('rooms_cnt');?></label>

                                                <input class="touchspin3" type="text" name="cnt" id="cnt" readonly="readonly" value="<?php echo (int) $tpl['arr']['cnt']; ?>" />
                                                <small><?php __('room_count_note');?></small>
                                            </div>
									</div><!-- /.col-sm-6 -->    
									
									<div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="control-label"><?php __('rooms_max_occupancy');?></label>

                                            <input class="touchspin3" type="text" name="max_people" id="max_people" readonly="readonly" value="<?php echo (int) $tpl['arr']['max_people']; ?>" />
                                            <small><?php __('room_max_occupancy_note');?></small>
                                        </div>
                                    </div><!-- /.col-sm-6 --> 

									<div class="room-no" style="display: <?php echo (int) $tpl['arr']['cnt'] > 0 ? NULL : 'none'; ?>">
										<div class="col-sm-12">
											<div class="hr-line-dashed"></div>
	
											<label class="control-label"><?php __('room_numbers');?></label>
											<p><small><?php __('room_numbers_note');?></small></p>
											<div class="row" id="hbRoomNumber" data-numbers="<?php __('room_numbers', false, true); ?>" data-enter="<?php __('room_numbers_enter', false, true); ?>" data-note="<?php __('room_numbers_note', false, true); ?>">
												<?php 
												if (isset($tpl['number_arr']) && !empty($tpl['number_arr'])) { 
													foreach($tpl['number_arr'] as $k => $v) {
												?>
													<div class="col-lg-3 col-md-4 col-xs-6 room-number-item">
														<div class="form-group">
															<input class="form-control number-field" type="text" name="number[<?php echo $v['id'];?>]" value="<?php echo $v['number'];?>" data-index="<?php echo $k + 1;?>" maxlength="50" />
														</div><!-- /.form-group -->
													</div><!-- /.col-sm-4 -->
												<?php } 
												}
												?>
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
												<textarea name="i18n[<?php echo $v['id']; ?>][description]" class="form-control" cols="30" rows="10"><?php echo htmlspecialchars(stripslashes(@$tpl['arr']['i18n'][$v['id']]['description'])); ?></textarea>	
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

			<div role="tabpanel" class="tab-pane" id="photos">
				<div class="panel-body">
					<div id="gallery"></div>
				</div>
			</div>
		</div>
	</div>
</div><!-- /.wrapper wrapper-content -->

<script type="text/javascript">
	var myGallery = myGallery || {};
	myGallery.foreign_id = <?php echo $tpl['arr']['id']; ?>;
	myGallery.hash = "";
	var myLabel = myLabel || {};
	myLabel.isFlagReady = "<?php echo $tpl['is_flag_ready'] ? 1 : 0;?>";
	<?php if ($tpl['is_flag_ready']) : ?>
		var pjLocale = pjLocale || {};
		pjLocale.langs = <?php echo $tpl['locale_str']; ?>;
		pjLocale.flagPath = "<?php echo PJ_FRAMEWORK_LIBS_PATH; ?>pj/img/flags/";
	<?php endif; ?>
</script>