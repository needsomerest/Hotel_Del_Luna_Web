<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$filter = __('filter', true);
$months = __('months', true);
ksort($months);
$short_days = __('short_days', true);
?>
	
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-12">
    	<div class="row">
        	<div class="col-sm-10"><h2><?php echo $titles['AL10']; ?></h2></div>
        </div><!-- /.row -->
		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['AL10']; ?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<div class="col-lg-9">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div class="row">
					<div class="col-lg-6">
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
	</div><!-- /.col-lg-8 -->

	<div class="col-lg-3">
		<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
    		<div class="panel no-borders boxFormLimit">
			<?php 
			include_once dirname(__FILE__) . '/elements/add-limit.php';
			?>
		</div><!-- /.panel panel-primary -->
	</div><!-- /.col-lg-3 -->
</div>

<script type="text/javascript">
var pjGrid = pjGrid || {};
pjGrid.hasAccessCreate = <?php echo pjAuth::factory('pjAdminLimits', 'pjActionCreate')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminLimits', 'pjActionUpdate')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminLimits', 'pjActionDelete')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminLimits', 'pjActionDeleteBulk')->hasAccess() ? 'true' : 'false';?>;

var myLabel = myLabel || {};
myLabel.room = "<?php __('limit_room', false, true); ?>";
myLabel.date_from = "<?php __('limit_date_from', false, true); ?>";
myLabel.date_to = "<?php __('limit_date_to', false, true); ?>";
myLabel.start_on = "<?php __('limit_start_on', false, true); ?>";
myLabel.min_nights = "<?php __('limit_min_nights', false, true); ?>";
myLabel.max_nights = "<?php __('limit_max_nights', false, true); ?>";
myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;

</script>