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
        	<div class="col-sm-10"><h2><?php echo $titles['AD11']; ?></h2></div>
        </div><!-- /.row -->
		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['AD11']; ?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<div class="col-lg-9">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div id="grid_codes"></div>
			</div>
		</div>
	</div><!-- /.col-lg-9 -->

	<div class="col-lg-3">
		<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
		<div class="panel no-borders boxFormPromoCode">
			<?php
			if(pjAuth::factory('pjAdminDiscounts', 'pjActionAddCode')->hasAccess())
			{
			    include_once dirname(__FILE__) . '/elements/add-code.php';
			}
			?>
		</div><!-- /.panel panel-primary -->
	</div><!-- /.col-lg-3 -->
</div>

<script type="text/javascript">

var pjGrid = pjGrid || {};
pjGrid.hasAccessCreate = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionAddCode')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionUpdateCode')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionDeleteCode')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionDeleteCodeBulk')->hasAccess() ? 'true' : 'false';?>;

var myLabel = myLabel || {};
myLabel.prices_invalid_input = "<?php __('discount_invalid_input');?>";
myLabel.rooms = <?php echo $tpl['rooms']; ?>;
myLabel.room = "<?php __('limit_room', false, true); ?>";
myLabel.date_from = "<?php __('limit_date_from', false, true); ?>";
myLabel.date_to = "<?php __('limit_date_to', false, true); ?>";
myLabel.promo_code = "<?php __('discount_code', false, true); ?>";
myLabel.type = "<?php __('discount_type', false, true); ?>";
myLabel.discount = "<?php __('discount_discount', false, true); ?>";
myLabel.types = <?php echo $tpl['types']; ?>;
myLabel.code_existed = "<?php __('discount_code_exists', false, true); ?>";
myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;
myLabel.discount_invalid_input = "<?php __('discount_invalid_input');?>";
</script>