<div class="panel no-borders">
    <div class="panel-heading bg-cancelled">
        <p class="lead m-n">
            <span class="pull-left"><?php __('plugin_ep_extra_payments'); ?></span>
        </p>
    </div>
    <div class="panel-body">
    	<p class="lead m-b-md">
            <a href="#" class="btn btn-primary btn-md btn-block btn-outline pj-plugin-ep-add-payment"><i class="fa fa-plus m-r-xs"></i> <?php __('plugin_ep_btn_add_new_payment'); ?></a>
        </p>
        
        <div id="pjPluginExtraPaymentBox" class="ibox-content">
        	<div class="sk-spinner sk-spinner-double-bounce"><div class="sk-double-bounce1"></div><div class="sk-double-bounce2"></div></div>
        	<div id="extraPaymentsTable" class="table-responsive table-responsive-secondary">
        	<?php
            if(!empty($tpl['arr']))
            {
                $statuses = __('plugin_ep_payment_statuses', true);
                ?>
            	<table class="table table-striped table-hover">
            		<thead>
						<tr>
							<th><?php __('plugin_ep_payment');?></th>
							<th><?php __('plugin_ep_status');?></th>
							<th><?php __('plugin_ep_amount');?></th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach($tpl['arr'] as $v)
						{
						    ?>
						    <tr>
						    	<td><?php echo pjSanitize::html($v['title']);?></td>
						    	<td><?php echo $statuses[$v['payment_status']];?></td>
						    	<td><?php echo pjCurrency::formatPrice($v['amount']);?></td>
						    	<td>
						    		<a href="#" data-id="<?php echo $v['id'];?>" data-foreign_id="<?php echo $v['foreign_id'];?>" class="btn btn-primary btn-md btn-sm m-l-xs btn-outline pj-plugin-ed-send-email"><i class="fa fa-envelope"></i></a>
						    		<a href="#" data-id="<?php echo $v['id'];?>" data-foreign_id="<?php echo $v['foreign_id'];?>" class="btn btn-primary btn-md btn-sm m-l-xs btn-outline pj-plugin-ed-edit-payment"><i class="fa fa-pencil"></i></a>
						    		<a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjExtraPayments&amp;action=pjActionDelete&amp;id=<?php echo $v['id'];?>" data-id="<?php echo $v['id'];?>" data-foreign_id="<?php echo $v['foreign_id'];?>" class="btn btn-danger btn-md btn-sm m-l-xs btn-outline pj-plugin-ed-delete-item"><i class="fa fa-trash"></i></a>
						    	</td>
						    </tr>
						    <?php
						}
						?>
					</tbody>
            	</table>
                <?php
                }
                ?>
            </div>
        </div>
            
    </div>
</div>

<div class="modal fade" id="pjPluginAddPaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog modal-md" role="document">
	    <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title"><?php __('plugin_ep_add_new_payment');?></h4>
        </div>
        <div class="modal-body">
        	<form id="pjPluginAddPaymentForm" action="" method="post" class="">
            	<input type="hidden" name="add_payment" value="1" />
            	<input type="hidden" name="foreign_id" value="<?php echo $tpl['params']['foreign_id']; ?>" />
            	<input type="hidden" name="client_id" value="<?php echo $tpl['params']['client_id']; ?>" />
            	<input type="hidden" name="locale_id" value="<?php echo $controller->getLocaleId(); ?>" />
            	<div class="row">
            		<div class="col-lg-6 col-md-6 col-sm-6">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_amount');?></label>
            
            				<div class="input-group">
                                <span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span>	
                                <input type="text" class="form-control required number" name="amount" max="9999999.99" />
                            </div>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            		<div class="col-lg-6 col-md-6 col-sm-6">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_status');?></label>
            
            				<select name="payment_status" class="form-control">
            					<?php
            					foreach(__('plugin_ep_payment_statuses', true) as $k => $v)
            					{
            					    ?><option value="<?php echo $k;?>"><?php echo $v;?></option><?php
            					}
            					?>
            				</select>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            	<div class="row">
            		<div class="col-lg-12 col-md-12 col-sm-12">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_title');?></label>
            
            				<input type="text" class="form-control required" name="title">
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            	<div class="row">
            		<div class="col-lg-12 col-md-12 col-sm-12">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_description');?></label>
            
            				<textarea name="description" rows="3" cols="" class="form-control"></textarea>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            </form>
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('plugin_ep_btn_cancel');?></button>
        	<button type="button" class="btn btn-primary pj-plugin-ep-save-payment"><?php __('plugin_ep_btn_save');?></button>
        </div>
	    </div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="pjPluginEditPaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog modal-md" role="document">
	    <div class="modal-content">
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        	<h4 class="modal-title"><?php __('plugin_ep_edit_extra_payment');?></h4>
        </div>
        <div class="modal-body">
        	<form id="pjPluginEditPaymentForm" action="" method="post" class="">
            	<input type="hidden" name="edit_payment" value="1" />
            	<input type="hidden" name="id" value="<?php echo $tpl['arr']['id']; ?>" />
            	<div class="row">
            		<div class="col-lg-6 col-md-6 col-sm-6">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_amount');?></label>
            
            				<div class="input-group">
                                <span class="input-group-addon"><?php echo pjCurrency::getCurrencySign($tpl['option_arr']['o_currency'], false) ?></span>	
                                <input type="text" class="form-control required number" max="9999999.99" name="amount"/>
                            </div>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            		<div class="col-lg-6 col-md-6 col-sm-6">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_status');?></label>
            
            				<select name="payment_status" class="form-control">
            					<?php
            					foreach(__('plugin_ep_payment_statuses', true) as $k => $v)
            					{
            					    ?><option value="<?php echo $k;?>"><?php echo $v;?></option><?php
            					}
            					?>
            				</select>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            	<div class="row">
            		<div class="col-lg-12 col-md-12 col-sm-12">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_title');?></label>
            
            				<input type="text" class="form-control required" name="title">
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            	<div class="row">
            		<div class="col-lg-12 col-md-12 col-sm-12">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_description');?></label>
            
            				<textarea name="description" rows="3" cols="" class="form-control"></textarea>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            	<div class="row">
            		<div class="col-lg-12 col-md-12 col-sm-12">
            			<div class="form-group">
            				<label class="control-label"><?php __('plugin_ep_payment_details_url');?></label>
            
            				<p id="pjPluginExtraPaymentURL" class="control-label-static"></p>
            			</div>
            		</div><!-- /.col-lg-6 col-md-6 col-sm-6 -->
            	</div>
            </form>
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('plugin_ep_btn_cancel');?></button>
        	<button type="button" class="btn btn-primary pj-plugin-ep-edit-extra-payment"><?php __('plugin_ep_btn_save');?></button>
        </div>
	    </div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="pjPluginSendExtraPaymentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
		      <div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        	<h4 class="modal-title"><?php __('plugin_ep_send_payments_email'); ?></h4>
		      </div>
		      <div id="pjPluginEpContentWrapper" class="modal-body"></div>
		      <div class="modal-footer">
		        	<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('plugin_ep_btn_cancel');?></button>
		        	<button id="pj_plugin_ep_send_email" type="button" class="btn btn-primary"><?php __('plugin_ep_btn_send');?></button>
		      </div>
	    </div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<style type="text/css">
	#pjPluginExtraPaymentBox.ibox-content{
	   padding: 0px !important;
	   border-top: none !important;
	}
</style>

<script type="text/javascript">
	
var myLabel = myLabel || {};
myLabel.alert_plugin_ep_btn_delete = "<?php __('plugin_ep_btn_delete', false, true); ?>";
myLabel.alert_plugin_ep_btn_cancel = "<?php __('plugin_ep_btn_cancel', false, true); ?>";
myLabel.alert_plugin_ep_delete_payment_title = "<?php __('plugin_ep_delete_payment_title', false, true); ?>";
myLabel.alert_plugin_ep_delete_payment_text = "<?php __('plugin_ep_delete_payment_text', false, true); ?>";
	
</script>
