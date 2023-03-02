<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$months = __('months', true);
ksort($months);
$short_days = __('short_days', true);
?>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-12">
        	<div class="row">
            	<div class="col-sm-10"><h2><?php echo $titles['ART10']; ?></h2></div>
            </div><!-- /.row -->
			<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['ART10']; ?></p>
    	</div><!-- /.col-md-12 -->
	</div>
	
	<div class="row wrapper wrapper-content animated fadeInRight">
		<div class="col-lg-9">
			<div class="ibox float-e-margins">
				<div class="ibox-content">
					<div class="row">
						<div class="col-lg-6 col-lg-offset-3">
							<form action="" method="get" class="form-horizontal frm-filter">
								<div class="input-group m-b-md">
									<input type="text" name="q" placeholder="<?php __('btnSearch', false, true); ?>" class="form-control">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
								</div>
							</form>
						</div><!-- /.col-lg-6 -->
					</div><!-- /.row -->

					<div id="grid"></div>
				</div>
			</div>
		</div><!-- /.col-lg-12 -->
		<div class="col-lg-3">
			<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
			<div class="panel no-borders boxFormRestriction">
				<?php 
				if(pjAuth::factory('pjAdminRestrictions', 'pjActionCreate')->hasAccess())
				{
				    include_once dirname(__FILE__) . '/elements/add-restriction.php';
				}
				?>							
			</div><!-- /.panel panel-primary -->
		</div><!-- /.col-lg-3 -->
	</div>
	
	<script type="text/javascript">
	
	var pjGrid = pjGrid || {};
	pjGrid.hasAccessCreate = <?php echo pjAuth::factory('pjAdminRestrictions', 'pjActionCreate')->hasAccess() ? 'true' : 'false';?>;
	pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminRestrictions', 'pjActionUpdate')->hasAccess() ? 'true' : 'false';?>;
	pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminRestrictions', 'pjActionDelete')->hasAccess() ? 'true' : 'false';?>;
	pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminRestrictions', 'pjActionDeleteBulk')->hasAccess() ? 'true' : 'false';?>;
	var myLabel = myLabel || {};
	myLabel.date_from = "<?php __('restriction_date_from', false, true); ?>";
	myLabel.date_to = "<?php __('restriction_date_to', false, true); ?>";
	myLabel.rooms = "<?php __('restriction_rooms', false, true); ?>";
	myLabel.type = "<?php __('restriction_type', false, true); ?>";
	myLabel.types = <?php echo $tpl['types']; ?>;
	myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
	myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;
	
	</script>