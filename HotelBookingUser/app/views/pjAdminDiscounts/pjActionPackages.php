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
        	<div class="col-sm-10"><h2><?php echo $titles['AD12']; ?></h2></div>
        </div><!-- /.row -->
		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['AD12']; ?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="row wrapper wrapper-content animated fadeInRight">
	<div class="col-lg-9">
		<div class="ibox float-e-margins">
			<div class="ibox-content">
				<div id="grid_packages"></div>
			</div>
		</div>
	</div><!-- /.col-lg-9 -->

	<div class="col-lg-3">
		<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
		<div class="panel no-borders boxFormPackage">
			<?php
			if(pjAuth::factory('pjAdminDiscounts', 'pjActionAddPackage')->hasAccess())
			{
			    include_once dirname(__FILE__) . '/elements/add-package.php';
			}
			?>
		</div><!-- /.panel panel-primary -->
	</div><!-- /.col-lg-3 -->
</div>


<div class="modal inmodal fade" id="modalAddMorePrices" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            
        </div>
    </div>
</div>

<script type="text/javascript">

var pjGrid = pjGrid || {};
pjGrid.hasAccessCreate = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionAddPackage')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionUpdatePackage')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionDeletePackage')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminDiscounts', 'pjActionDeletePackageBulk')->hasAccess() ? 'true' : 'false';?>;

var myLabel = myLabel || {};
myLabel.days = <?php echo $tpl['days']; ?>;
myLabel.rooms = <?php echo $tpl['rooms']; ?>;
myLabel.room = "<?php __('limit_room', false, true); ?>";
myLabel.date_from = "<?php __('limit_date_from', false, true); ?>";
myLabel.date_to = "<?php __('limit_date_to', false, true); ?>";
myLabel.start_day = "<?php __('discount_start_day', false, true); ?>";
myLabel.end_day = "<?php __('discount_end_day', false, true); ?>";
myLabel.total_price = "<?php __('discount_total_price', false, true); ?>";
myLabel.more_price = "<?php __('more_prices', false, true); ?>";

myLabel.adults = "<?php __('rooms_adults', false, true); ?>";
myLabel.children = "<?php __('rooms_children', false, true); ?>";
myLabel.price = "<?php __('discount_price', false, true); ?>";

myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;
myLabel.prices_invalid_input = "<?php __('prices_invalid_input');?>";
</script>