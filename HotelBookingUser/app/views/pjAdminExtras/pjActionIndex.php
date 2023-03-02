<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
$filter = __('filter', true);
?>
	<div class="row wrapper border-bottom white-bg page-heading">
		<div class="col-sm-12">
			<div class="row">
				<div class="col-lg-9 col-md-8 col-sm-6">
					<h2><?php __('extra_index_title'); ?></h2>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 btn-group-languages">
                    <?php if ($tpl['is_flag_ready']) : ?>
					<div class="multilang"></div>
					<?php endif; ?>    
            	</div>
			</div>
			<p class="m-b-none"><i class="fa fa-info-circle"></i><?php __('extra_index_body'); ?></p>
		</div>
	</div>
	
	<div class="row wrapper wrapper-content animated fadeInRight">
		<div class="col-lg-9">
			<div class="ibox float-e-margins">
				<div class="ibox-content">
					<div class="row">
						<div class="col-lg-6">
							<form action="" method="get" class="form-horizontal frm-filter">
                                <div class="input-group">
									<input type="text" name="q" placeholder="<?php __('btnSearch', false, true); ?>" class="form-control">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary" type="submit">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
						</div><!-- /.col-lg-6 -->
					
						<div class="col-lg-6">
							<div class="m-b-md m-t-xs text-right">
								<button class="btn btn-xs btn-primary btn-all active" type="button"><span class="p-w-xs"><?php __('lblAll');?></span></button>
								<button class="btn btn-xs btn-default btn-filter" type="button" data-column="status" data-value="T"><i class="fa fa-check"></i> <?php echo $filter['active']; ?></button>
								<button class="btn btn-xs btn-default btn-filter" type="button" data-column="status" data-value="F"><i class="fa fa-times"></i> <?php echo $filter['inactive']; ?></button>
							</div>
						</div><!-- /.col-lg-6 -->
					</div><!-- /.row -->
					<div id="grid"></div>
				</div>
			</div>
		</div><!-- /.col-lg-8 -->
	
		<div class="col-lg-3">
			<div class="panel no-borders boxFormExtra">
				<?php 
				if(pjAuth::factory('pjAdminExtras', 'pjActionCreate')->hasAccess())
				{
				    include_once dirname(__FILE__) . '/elements/add-extra.php';
				}
				?>
			</div><!-- /.panel panel-primary -->
		</div><!-- /.col-lg-4 -->
	</div>
	
	<script type="text/javascript">
	
	var pjGrid = pjGrid || {};
	pjGrid.hasAccessCreate = <?php echo pjAuth::factory('pjAdminExtras', 'pjActionCreate')->hasAccess() ? 'true' : 'false';?>;
	pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminExtras', 'pjActionUpdate')->hasAccess() ? 'true' : 'false';?>;
	pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminExtras', 'pjActionDelete')->hasAccess() ? 'true' : 'false';?>;
	pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminExtras', 'pjActionDeleteBulk')->hasAccess() ? 'true' : 'false';?>;
	var myLabel = myLabel || {};
	myLabel.extra_name = "<?php __('extra_name', false, true); ?>";
	myLabel.extra_per = "<?php __('extra_per_lbl', false, true); ?>";
	myLabel.extra_price = "<?php __('extra_price', false, true); ?>";
	myLabel.extra_status = "<?php __('lblStatus', false, true); ?>";
	myLabel.active = <?php x__encode('extra_statuses_ARRAY_T', true); ?>;
	myLabel.inactive = <?php x__encode('extra_statuses_ARRAY_F', true); ?>;
	myLabel.delete_selected = <?php x__encode('delete_selected', true); ?>;
	myLabel.delete_confirmation = <?php x__encode('delete_confirmation', true); ?>;
	myLabel.prices_invalid_input = "<?php __('prices_invalid_input');?>";
	var myLabel = myLabel || {};
	myLabel.isFlagReady = "<?php echo $tpl['is_flag_ready'] ? 1 : 0;?>";
	<?php if ($tpl['is_flag_ready']) : ?>
		var pjLocale = pjLocale || {};
		pjLocale.langs = <?php echo $tpl['locale_str']; ?>;
		pjLocale.flagPath = "<?php echo PJ_FRAMEWORK_LIBS_PATH; ?>pj/img/flags/";
	<?php endif; ?>
	</script>