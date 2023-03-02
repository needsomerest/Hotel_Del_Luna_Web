<?php 
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);
?>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-12">
    	<div class="row">
        	<div class="col-sm-10"><h2><?php echo $titles['AR09']; ?></h2></div>
        </div><!-- /.row -->
		<p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['AR09'];?></p>
	</div><!-- /.col-md-12 -->
</div>

<div class="wrapper wrapper-content animated fadeInRight">
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
    				<?php echo @$bodies[$error_code]; ?>
    			</div>
    			<?php 
    			break;
            case in_array($error_code, array('AR04', 'AR08')):	
    			?>
    			<div class="alert alert-danger">
    				<i class="fa fa-exclamation-triangle m-r-xs"></i>
    				<strong><?php echo @$titles[$error_code]; ?></strong>
    				<?php echo @$bodies[$error_code]; ?>
    			</div>
    			<?php
    			break;
    	}
    }
    ?>
	<div class="row">	
		<div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="row m-b-md">
                        <div class="col-sm-3">
                        	<a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminRooms&amp;action=pjActionCreate" class="btn btn-primary btnAddRoomType"><i class="fa fa-plus"></i> <?php __('room_add'); ?></a>
                        </div><!-- /.col-md-6 -->
						<?php
						if (pjAuth::factory('pjAdminRooms', 'pjActionIndex')->hasAccess())
						{
    						?>
                            <div class="col-md-4 col-md-offset-1 col-sm-5">
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
                            </div><!-- /.col-md-3 -->
                            <?php
						}
                        ?>
                    </div><!-- /.row -->
					<?php
					if (pjAuth::factory('pjAdminRooms', 'pjActionIndex')->hasAccess())
					{
    					?>
                        <div id="grid"></div>
                        <?php
					}
                    ?>
                </div>
            </div>
        </div><!-- /.col-lg-12 -->	
	</div>
</div><!-- /.wrapper wrapper-content animated fadeInRight -->

<script type="text/javascript">
var pjGrid = pjGrid || {};
pjGrid.hasAccessUpdate = <?php echo pjAuth::factory('pjAdminRooms', 'pjActionUpdate')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteSingle = <?php echo pjAuth::factory('pjAdminRooms', 'pjActionDelete')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessDeleteMulti = <?php echo pjAuth::factory('pjAdminRooms', 'pjActionDeleteBulk')->hasAccess() ? 'true' : 'false';?>;
pjGrid.hasAccessPrices = <?php echo pjAuth::factory('pjAdminPrices', 'pjActionIndex')->hasAccess() ? 'true' : 'false';?>;

var myLabel = myLabel || {};
myLabel.image = "<?php __('rooms_image', false, true); ?>";
myLabel.name = "<?php __('rooms_name', false, true); ?>";
myLabel.adults = "<?php __('rooms_adults', false, true); ?>";
myLabel.children = "<?php __('rooms_children', false, true); ?>";
myLabel.cnt = "<?php __('rooms_cnt', false, true); ?>";
myLabel.delete_selected = "<?php __('delete_selected', false, true); ?>";
myLabel.delete_confirmation = "<?php __('delete_confirmation', false, true); ?>";
</script>