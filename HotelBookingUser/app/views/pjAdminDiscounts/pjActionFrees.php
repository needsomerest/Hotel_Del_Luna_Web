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
        	<div class="col-sm-10"><h2><?php echo $titles['AD10']; ?></h2></div>
        </div><!-- /.row -->
		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['AD10']; ?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<div class="col-lg-9">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div id="grid_frees"></div>
			</div>
		</div>
	</div><!-- /.col-lg-9 -->

	<div class="col-lg-3">
		<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
		<div class="panel no-borders boxFormFreeNight">
			<?php
			if(pjAuth::factory('pjAdminDiscounts', 'pjActionAddFree')->hasAccess())
			{
			    include_once dirname(__FILE__) . '/elements/add-free.php';
			}
			?>
		</div><!-- /.panel panel-primary -->
	</div><!-- /.col-lg-3 -->
</div>

<script type="text/javascript">

var pjGrid = pjGrid || {};
pjGrid.hasAccessCreate = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionAddFree')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionUpdateFree')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionDeleteFree')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionDeleteFreeBulk')->hasAccess() ? 'true' : 'false';?>;

var myLabel = myLabel || {};
myLabel.rooms = <?php echo $tpl['rooms']; ?>;
myLabel.room = "<?php __('limit_room', false, true); ?>";
myLabel.date_from = "<?php __('limit_date_from', false, true); ?>";
myLabel.date_to = "<?php __('limit_date_to', false, true); ?>";
myLabel.min_length = "<?php __('discount_min_length', false, true); ?>";
myLabel.max_length = "<?php __('discount_max_length', false, true); ?>";
myLabel.free_nights = "<?php __('discount_free_nights', false, true); ?>";
myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;
myLabel.prices_invalid_input = "<?php __('prices_invalid_input');?>";
</script>