<?php
$titles = __('error_titles', true);
$bodies = __('error_bodies', true);

$months = __('months', true);
ksort($months);
$short_days = __('short_days', true);

$current_user = $_SESSION[$controller->defaultUser];
$created_date = pjDateTime::formatDate(date('Y-m-d', strtotime($current_user['created'])), 'Y-m-d', $tpl['option_arr']['o_date_format']);
$current_date = pjDateTime::formatDate(date('Y-m-d'), 'Y-m-d', $tpl['option_arr']['o_date_format']);
?>
<div id="datePickerOptions" style="display:none;" data-wstart="<?php echo (int) $tpl['option_arr']['o_week_start']; ?>" data-format="<?php echo $tpl['date_format']; ?>" data-months="<?php echo implode("_", $months);?>" data-days="<?php echo implode("_", $short_days);?>"></div>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-12">
        <div class="row">
            <div class="col-sm-10">
                <h2><?php echo $titles['ART01'];?></h2>
            </div>
        </div><!-- /.row -->

        <p class="m-b-none"><i class="fa fa-info-circle"></i> <?php echo $bodies['ART01'];?></p>
    </div><!-- /.col-md-12 -->
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                	<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get" class="form">
                		<input type="hidden" name="controller" value="pjAdminReports" />
						<input type="hidden" name="action" value="pjActionIndex" />
                        <div class="row m-b-md">
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <label><?php __('booking_arrival_date'); ?></label>
    
                                <div class="input-group">
                                    <input type="text" name="from" id="from" value="<?php echo $controller->_get->check('from') ? $controller->_get->toString('from') : $created_date; ?>" class="form-control datepick">
    
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                </div>
                            </div><!-- /.col-sm-3 -->
    
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <label><?php __('booking_departure_date'); ?></label>
    
                                <div class="input-group">
                                    <input type="text" name="to" id="to" value="<?php echo $controller->_get->check('to') ? $controller->_get->toString('to') : $current_date; ?>" class="form-control datepick">
    
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                </div>
                            </div><!-- /.col-sm-3 -->
    
                            <div class="col-lg-3 col-md-3">
                                <label>&nbsp;</label>
    
                                <div class="form-group">
                                	<input type="submit" value="<?php __('btnGenerate', false, true); ?>" class="btn btn-primary" />
                                </div><!-- /.form-group -->
                            </div><!-- /.col-md-6 -->
                        </div><!-- /.row -->
                    </form>
					<?php
					include dirname(__FILE__) . '/pjActionGetReport.php';
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>