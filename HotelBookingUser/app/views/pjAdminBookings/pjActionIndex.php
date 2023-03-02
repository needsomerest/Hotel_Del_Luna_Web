<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$months = __('months', true);
ksort($months);
$short_days = __('short_days', true);
$bs = __('booking_statuses', true);
?>
<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-10">
				<h2><?php echo $titles['ABK16']; ?></h2>
			</div>
		</div><!-- /.row -->

		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['ABK16']; ?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<?php
	$error_code = $controller->_get->toString('err');
	if (!empty($error_code))
	{
		switch (true)
		{
			case in_array($error_code, array('AR01', 'AR03')):
				?>
				<div class="alert alert-success">
					<i class="fa fa-check m-r-xs"></i>
					<strong><?php echo @$titles[$error_code]; ?></strong>
					<?php echo @$bodies[$error_code]?>
				</div>
				<?php 
				break;
			case in_array($error_code, array('ABK04', 'ABK08', 'ABK10', 'ABK17')):	
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
	<div class="col-lg-12">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="row m-b-md">
					<form action="" method="get" class="frm-filter">
						<div class="col-sm-3">
						<a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionCreate" class="btn btn-primary"><i class="fa fa-plus"></i> <?php __('btn_add_booking');?></a>
    					</div><!-- /.col-md-6 -->
	
						<div class="col-md-3 col-sm-5">
							<div class="input-group">
								<input type="text" name="q" placeholder="<?php __('btnSearch', false, true); ?>" class="form-control">
	
								<div class="input-group-btn">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div><!-- /.col-md-3 -->
	
						<div class="col-lg-2 col-md-3 col-sm-4">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="btn btn-primary btn-outline btn-advance-search"><?php __('advance_search');?></a>
						</div><!-- /.col-md-2 -->
	
						<div class="col-lg-2 col-lg-offset-2 col-md-3 col-sm-12 text-right">
							<select class="form-control pj-filter-status" name="status">
								<option value="">-- <?php __('lblAll');?> --</option>
								<?php foreach (__('booking_statuses', true) as $k => $v) { ?>
									<option value="<?php echo $k;?>"><?php echo $v;?></option>
								<?php } ?>
							</select>
						</div><!-- /.col-md-6 -->
					</form>
				</div><!-- /.row -->

				<div id="collapseOne" class="collapse">
					<div class="m-b-lg">
						<ul class="agile-list no-padding">
							<li class="success-element b-r-sm">
								<div class="panel-body">
									<form action="" method="get" class="frm-filter-advanced">
										<div class="row">
											<div class="col-lg-4 col-md-6">
												<h3 class="m-b-md"><?php __('booking_search_arrival');?></h3>
												
												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label class="control-label"><?php __('booking_search_time_from');?></label>

															<div class="input-group">
																<input type="text" class="form-control datepick" value="" name="arrival_from" readonly="readonly" />

																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															</div>
														</div><!-- /.form-group -->
													</div><!-- /.col-md-4 -->

													<div class="col-sm-6">
														<div class="form-group">
															<label class="control-label"><?php __('booking_search_time_to');?></label>

															<div class="input-group">
																<input type="text" class="form-control datepick" value="" name="arrival_to" readonly="readonly" />

																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															</div>
														</div><!-- /.form-group -->
													</div><!-- /.col-md-4 -->
												</div><!-- /.row -->
											</div><!-- /.col-md-4 -->

											<div class="col-lg-4 col-md-6">
												<h3 class="m-b-md"><?php __('booking_search_departure');?></h3>
												
												<div class="row">
													<div class="col-sm-6">
														<div class="form-group">
															<label class="control-label"><?php __('booking_search_time_from');?></label>

															<div class="input-group">
																<input type="text" class="form-control datepick" value="" name="departure_from" readonly="readonly" />

																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															</div>
														</div><!-- /.form-group -->
													</div><!-- /.col-md-4 -->

													<div class="col-sm-6">
														<div class="form-group">
															<label class="control-label"><?php __('booking_search_time_to');?></label>

															<div class="input-group">
																<input type="text" class="form-control datepick" value="" name="departure_to" readonly="readonly" />

																<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															</div>
														</div><!-- /.form-group -->
													</div><!-- /.col-md-4 -->
												</div><!-- /.row -->
											</div><!-- /.col-md-4 -->
										</div><!-- /.row -->

										<div class="hr-line-dashed"></div>

										<div class="row">
											<div class="col-lg-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_status');?></label>

													<select class="form-control" name="status">
														<option value="">-- <?php __('lblAll');?> --</option>
														<?php foreach (__('booking_statuses', true) as $k => $v) { ?>
															<option value="<?php echo $k;?>"<?php echo isset($_GET['status']) && $_GET['status'] == $k ? ' selected="selected"' : NULL; ?>><?php echo $v;?></option>
														<?php } ?>
													</select>
												</div><!-- /.form-group -->
											</div><!-- /.col-lg-4 col-md-6 -->

											<div class="col-lg-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_room');?></label>

													<select class="form-control" name="room_id">
														<option value="">-- <?php __('lblAll');?> --</option>
														<?php foreach ($tpl['room_arr'] as $k => $v) { ?>
															<option value="<?php echo $v['id'];?>" <?php echo isset($_GET['room_id']) && $_GET['room_id'] == $room['id'] ? ' selected="selected"' : NULL; ?>><?php echo pjSanitize::clean($v['name']);?></option>
														<?php } ?>
													</select>
												</div><!-- /.form-group -->
											</div><!-- /.col-lg-4 col-md-6 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_uuid');?></label>

													<input type="text" class="form-control" name="uuid" />
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->
										</div><!-- /.row -->   

										<div class="hr-line-dashed"></div>

										<div class="row">
											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_payment_method');?></label>

													<select class="form-control" name="payment_method">
														<option value="">-- <?php __('lblAll');?> --</option>
														<?php
														foreach (__('booking_payments', true) as $k => $v)
														{
															?><option value="<?php echo $k; ?>"<?php echo isset($_GET['payment_method']) && $_GET['payment_method'] == $k ? ' selected="selected"' : NULL; ?>><?php echo pjSanitize::html($v); ?></option><?php
														}
														?>
													</select>
												</div><!-- /.form-group -->
											</div><!-- /.col-lg-4 col-md-6 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_price_range_from');?></label>

													<div class="input-group">
														<input type="text" class="form-control" name="total_from" />

														<span class="input-group-addon"><i class="fa fa-euro"></i></span>
													</div>
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_price_range_to');?></label>

													<div class="input-group">
														<input type="text" class="form-control" name="total_to" />

														<span class="input-group-addon"><i class="fa fa-euro"></i></span>
													</div>
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_promo_code');?></label>

													<input type="text" class="form-control" name="voucher" />
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->
										</div><!-- /.row -->   

										<div class="hr-line-dashed"></div>

										<div class="row">
											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_c_name');?></label>

													<input type="text" class="form-control" name="c_name" />
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_c_email');?></label>

													<input type="text" class="form-control" name="c_email" />
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_created_from');?></label>

													<div class="input-group">
														<input type="text" class="form-control datepick" name="created_from" readonly="readonly" />

														<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
													</div>
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->

											<div class="col-md-3 col-md-4 col-sm-6">
												<div class="form-group">
													<label class="control-label"><?php __('booking_search_created_to');?></label>

													<div class="input-group">
														<input type="text" class="form-control datepick" name="created_to" readonly="readonly" />

														<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
													</div>
												</div><!-- /.form-group -->
											</div><!-- /.col-md-4 -->
										</div><!-- /.row -->  

										<div class="hr-line-dashed"></div>

										<button class="btn btn-primary" type="submit"><?php __('btnSearch');?></button>

										<button class="btn btn-primary btn-outline" type="reset"><?php __('btnCancel');?></button>
									</form>
								</div><!-- /.panel-body -->
							</li><!-- /.panel panel-primary -->
						</ul>
					</div><!-- /.m-b-lg -->
				</div>

				<div id="grid"></div>												
				
			</div>
		</div>
	</div><!-- /.col-lg-12 -->
</div><!-- /.wrapper wrapper-content -->

<script type="text/javascript">
var pjGrid = pjGrid || {};
pjGrid.queryString = "";
<?php
if ($controller->_get->check('client_id'))
{
    ?>pjGrid.queryString += "&client_id=<?php echo $controller->_get->toInt('client_id'); ?>";<?php
}
?>
pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminBookings', 'pjActionUpdate')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminBookings', 'pjActionDeleteBooking')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminBookings', 'pjActionDeleteBookingBulk')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessExport = <?php echo pjAuth::factory('pjAdminBookings', 'pjActionExportBooking')->hasAccess() ? 'true' : 'false';?>;
var pjGrid = pjGrid || {};
var myLabel = myLabel || {};
myLabel.id = "<?php __('booking_id', false, true); ?>";
myLabel.stay = "<?php __('booking_stay', false, true); ?>";
myLabel.client = "<?php __('booking_client', false, true); ?>";
myLabel.rooms = "<?php __('booking_rooms', false, true); ?>";
myLabel.status = "<?php __('booking_status', false, true); ?>";
myLabel.cancelled = "<?php echo $bs['cancelled']; ?>";
myLabel.pending = "<?php echo $bs['pending']; ?>";
myLabel.confirmed = "<?php echo $bs['confirmed']; ?>";
myLabel.not_confirmed = "<?php echo $bs['not_confirmed']; ?>";
myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;
myLabel.exported = "<?php __('lblExport', false, true); ?>";
</script>