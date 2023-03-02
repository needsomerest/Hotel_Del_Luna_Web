<div class="form-group">
	<div class="table-responsive">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th><?php __('booking_room');?></th>
					<th><?php __('rooms_number');?></th>
					<th><?php __('rooms_adults');?></th>
					<th><?php __('rooms_children');?></th>
					<th><?php __('rooms_price');?></th>
					<th></th>
				</tr>
			</thead>							  
			<tbody>
				<?php if (isset($tpl['arr']) && !empty($tpl['arr'])) { ?>
					<?php foreach ($tpl['arr'] as $item) { ?>
						<tr>
							<td><?php echo pjSanitize::html($item['name']); ?></td>
							<td><?php echo pjSanitize::html($item['number']); ?></td>
							<td><?php echo $item['adults']; ?></td>
							<td><?php echo $item['children']; ?></td>
							<td><?php echo pjCurrency::formatPrice($item['price']); ?></td>
							<td>
								<div class="m-t-xs text-right">
									<a href="javascript:void(0);" class="btn btn-primary btn-outline btn-sm pjBtnEditBookingRoom" data-id="<?php echo $item['id']; ?>"><i class="fa fa-pencil"></i></a>
									<a href="javascript:void(0);" class="btn btn-danger btn-outline btn-sm btn-delete pjBtnDeleteBookingRoom" data-id="<?php echo $item['id']; ?>"><i class="fa fa-trash"></i></a>
								</div>
							</td>
						</tr>
					<?php } ?>
				<?php } else {
				    $titles = __('error_titles', true);
				    $bodies = __('error_bodies', true);
				    ?>
					<tr><td colspan="6"><?php echo @$bodies['ABK06']; ?></td></tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
</div>