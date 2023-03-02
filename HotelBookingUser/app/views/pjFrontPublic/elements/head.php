<div class="panel-heading pjHbPanelHead">
	<div class="row">
		<div class="col-md-1 col-sm-1 col-xs-2">
			<a href="#" class="btn btn-default pjHbBtnHome hbSelectorSearch">
				<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			</a>
		</div><!-- /.col- -->
		<div class="col-md-6 col-sm-6 col-xs-10">
		<?php include PJ_VIEWS_PATH . 'pjFront/elements/steps.php'; ?>
		</div><!-- /.col- -->
		<div class="col-md-5 col-sm-5 col-xs-12">
		<?php include PJ_VIEWS_PATH . 'pjFront/elements/locale.php'; ?>
		<?php
		if($controller->isFrontLogged())
		{
    		?>
    		<button type="button" class="btn btn-default pjHbBtnNav pjHbBtnClient pjHbBtnLogout">
    			<span class="title"><?php __('front_btn_logout');?></span>
    		</button>
    		<button type="button" class="btn btn-default pjHbBtnNav pjHbBtnClient pjHbBtnProfile">
    			<span class="title"><?php __('front_btn_profile');?></span>
    		</button>
    		<?php
		}else{
		    ?>
    		<button type="button" class="btn btn-default pjHbBtnNav pjHbBtnClient pjHbBtnLogin">
    			<span class="title"><?php __('front_btn_login');?></span>
    		</button>
    		<?php
		}
    	?>
		</div><!-- /.col- -->
	</div><!-- /.row -->
</div><!-- /.panel-heading pjHbPanelHead -->