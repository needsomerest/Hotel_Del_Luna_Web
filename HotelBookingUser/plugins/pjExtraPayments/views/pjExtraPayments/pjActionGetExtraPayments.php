<?php
if(isset($tpl['arr']))
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