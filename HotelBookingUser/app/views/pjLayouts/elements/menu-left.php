<?php
$controller_name = $controller->_get->toString('controller');
$action_name = $controller->_get->toString('action');

// Dashboard
$isScriptDashboard = in_array($controller_name, array('pjAdmin')) && in_array($action_name, array('pjActionIndex'));

// Schedule
$isScriptAvailabilityController = in_array($controller_name, array('pjAdminAvailability'));

// Bookings
$isScriptBookingsController = in_array($controller_name, array('pjAdminBookings'));

// Clients
$isScriptClientsController = in_array($controller_name, array('pjAdminClients'));
$isScriptClientsIndex = $isScriptClientsController && in_array($action_name, array('pjActionIndex', 'pjActionCreate', 'pjActionUpdate'));

// Rooms
$isScriptRooms 			= in_array($controller_name, array('pjAdminRooms'));
$isScriptRestrictions 	= in_array($controller_name, array('pjAdminRestrictions'));
$isScriptPrices 		= in_array($controller_name, array('pjAdminPrices'));

// Discounts
$isScriptDiscountsController 	= in_array($controller_name, array('pjAdminDiscounts'));
$isScriptDiscountsPackages      = $isScriptDiscountsController && in_array($action_name, array('pjActionPackages'));
$isScriptDiscountsFrees         = $isScriptDiscountsController && in_array($action_name, array('pjActionFrees'));
$isScriptDiscountsCodes         = $isScriptDiscountsController && in_array($action_name, array('pjActionCodes'));

// Extra
$isScriptExtras     			= in_array($controller_name, array('pjAdminExtras'));

// Payments
$isScriptPaymentsController = in_array($controller_name, array('pjPayments'));

// Settings
$isScriptOptionsController = in_array($controller_name, array('pjAdminOptions')) && !in_array($action_name, array('pjActionPreview', 'pjActionInstall'));

$isScriptOptionsBooking         = $isScriptOptionsController && in_array($action_name, array('pjActionBooking'));
$isScriptOptionsBookingForm     = $isScriptOptionsController && in_array($action_name, array('pjActionBookingForm'));
$isScriptOptionsTerm            = $isScriptOptionsController && in_array($action_name, array('pjActionTerm'));
$isScriptOptionsNotifications   = $isScriptOptionsController && in_array($action_name, array('pjActionNotifications'));
$isScriptLimits       			= in_array($controller_name, array('pjAdminLimits'));

// Extra
$isScriptReports     			= in_array($controller_name, array('pjAdminReports'));

// Permissions - Dashboard
$hasAccessScriptDashboard = pjAuth::factory('pjAdmin', 'pjActionIndex')->hasAccess();

// Permissions - Schedule
$hasAccessScriptAvailability      = pjAuth::factory('pjAdminAvailability', 'pjActionIndex')->hasAccess();

// Permissions - Bookings
$hasAccessScriptBookings          = pjAuth::factory('pjAdminBookings')->hasAccess();

// Permissions - Clients
$hasAccessScriptClients            = pjAuth::factory('pjAdminClients')->hasAccess();
$hasAccessScriptClientsIndex       = pjAuth::factory('pjAdminClients', 'pjActionIndex')->hasAccess();

// Permissions - Rooms
$hasAccessScriptRooms          	  = pjAuth::factory('pjAdminRooms', 'pjActionIndex')->hasAccess();

// Permissions - Restrictions
$hasAccessScriptRestrictions      = pjAuth::factory('pjAdminRestrictions', 'pjActionIndex')->hasAccess();

// Permissions - Prices
$hasAccessScriptPrices            = pjAuth::factory('pjAdminPrices', 'pjActionIndex')->hasAccess();

// Permissions - Settings
$hasAccessScriptDiscounts           = pjAuth::factory('pjAdminDiscounts')->hasAccess();
$hasAccessScriptDiscountsPackages   = pjAuth::factory('pjAdminDiscounts', 'pjActionPackages')->hasAccess();
$hasAccessScriptDiscountsFrees   	= pjAuth::factory('pjAdminDiscounts', 'pjActionFrees')->hasAccess();
$hasAccessScriptDiscountsCodes   	= pjAuth::factory('pjAdminDiscounts', 'pjActionCodes')->hasAccess();

// Permissions - Extras
$hasAccessScriptExtras          	  = pjAuth::factory('pjAdminExtras')->hasAccess();

// Permissions - Payments
$hasAccessScriptPayments = pjAuth::factory('pjPayments', 'pjActionIndex')->hasAccess();

// Permissions - Settings
$hasAccessScriptOptions                 = pjAuth::factory('pjAdminOptions')->hasAccess();
$hasAccessScriptOptionsBooking          = pjAuth::factory('pjAdminOptions', 'pjActionBooking')->hasAccess();
$hasAccessScriptOptionsBookingForm      = pjAuth::factory('pjAdminOptions', 'pjActionBookingForm')->hasAccess();
$hasAccessScriptOptionsTerm             = pjAuth::factory('pjAdminOptions', 'pjActionTerm')->hasAccess();
$hasAccessScriptOptionsNotifications    = pjAuth::factory('pjAdminOptions', 'pjActionNotifications')->hasAccess();
$hasAccessScriptLimits         			= pjAuth::factory('pjAdminLimits', 'pjActionIndex')->hasAccess();

// Permissions - Reports
$hasAccessScriptReports            	= pjAuth::factory('pjAdminReports', 'pjActionIndex')->hasAccess();

?>

<?php if ($hasAccessScriptDashboard): ?>
    <li<?php echo $isScriptDashboard ? ' class="active"' : NULL; ?>>
        <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdmin&amp;action=pjActionIndex"><i class="fa fa-th-large"></i> <span class="nav-label"><?php __('plugin_base_menu_dashboard');?></span></a>
    </li>
<?php endif; ?>

<?php if ($hasAccessScriptAvailability): ?>
    <li<?php echo $isScriptAvailabilityController ? ' class="active"' : NULL; ?>>
        <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminAvailability&amp;action=pjActionIndex"><i class="fa fa-calendar"></i> <span class="nav-label"><?php __('menuCalendar');?></span></a>
    </li>
<?php endif; ?>

<?php if ($hasAccessScriptBookings): ?>
    <li<?php echo $isScriptBookingsController ? ' class="active"' : NULL; ?>>
        <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminBookings&amp;action=pjActionIndex"><i class="fa fa-list"></i> <span class="nav-label"><?php __('menuBookings');?></span></a>
    </li>
<?php endif; ?>

<?php if ($hasAccessScriptClients): ?>
    <li<?php echo $isScriptClientsIndex ? ' class="active"' : NULL; ?>>
        <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminClients&amp;action=pjActionIndex"><i class="fa fa-user"></i> <span class="nav-label"><?php __('menuClients');?></span></a>
    </li>
<?php endif; ?>

<?php if ($hasAccessScriptRooms || $hasAccessScriptRestrictions || $hasAccessScriptPrices): ?>
	<li<?php echo $isScriptRooms || $isScriptRestrictions || $isScriptPrices || $isScriptLimits ? ' class="active"' : NULL; ?>>
		<a href="#"><i class="fa fa-th-large"></i> <span class="nav-label"><?php __('menuRooms');?></span><span class="fa arrow"></span></a>
		<ul class="nav nav-second-level collapse">
			<?php if ($hasAccessScriptRooms): ?>
				<li<?php echo $isScriptRooms ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminRooms&amp;action=pjActionIndex"><?php __('menuRooms');?></a></li>
			<?php endif; ?>
			<?php if ($hasAccessScriptRestrictions): ?>
				<li<?php echo $isScriptRestrictions ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminRestrictions&amp;action=pjActionIndex"><?php __('menuRestrictions');?></a></li>
			<?php endif; ?>
			<?php if ($hasAccessScriptPrices): ?>
				<li<?php echo $isScriptPrices ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminPrices&amp;action=pjActionIndex"><?php __('menuPrice');?></a></li>
			<?php endif; ?>
			<?php if ($hasAccessScriptLimits): ?>
                <li<?php echo $isScriptLimits ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminLimits&amp;action=pjActionIndex"><?php __('menuLimits');?></a></li>
            <?php endif; ?>
		</ul>
	</li>
<?php endif; ?>

<?php if ($hasAccessScriptDiscountsPackages || $hasAccessScriptDiscountsFrees || $hasAccessScriptDiscountsCodes): ?>
	<li<?php echo $isScriptDiscountsController ? ' class="active"' : NULL; ?>>
		<a href="#"><i class="fa fa-tag"></i> <span class="nav-label"><?php __('menuDiscounts');?></span><span class="fa arrow"></span></a>
		<ul class="nav nav-second-level collapse">
			<?php if ($hasAccessScriptDiscountsPackages): ?>
				<li<?php echo $isScriptDiscountsPackages ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminDiscounts&amp;action=pjActionPackages"><?php __('menuPackage');?></a></li>
			<?php endif; ?>
			<?php if ($hasAccessScriptDiscountsFrees): ?>
				<li<?php echo $isScriptDiscountsFrees ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminDiscounts&amp;action=pjActionFrees"><?php __('menuFreeNight');?></a></li>
			<?php endif; ?>
			<?php if ($hasAccessScriptDiscountsCodes): ?>
				<li<?php echo $isScriptDiscountsCodes ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminDiscounts&amp;action=pjActionCodes"><?php __('menuPromoCode');?></a></li>
			<?php endif; ?>
			
		</ul>
	</li>
<?php endif; ?>

<?php if ($hasAccessScriptExtras): ?>
    <li<?php echo $isScriptExtras ? ' class="active"' : NULL; ?>>
    	<a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminExtras&amp;action=pjActionIndex"><i class="fa fa-star"></i> <span class="nav-label"><?php __('menuExtras');?></span></a>
    </li>
<?php endif; ?>

<?php if ($hasAccessScriptOptionsBooking || $hasAccessScriptPayments || $hasAccessScriptOptionsBookingForm || $hasAccessScriptOptionsNotifications || $hasAccessScriptOptionsTerm): ?>
    <li<?php echo $isScriptOptionsController || $isScriptPaymentsController ? ' class="active"' : NULL; ?>>
        <a href="#"><i class="fa fa-cog"></i> <span class="nav-label"><?php __('menuOptions');?></span><span class="fa arrow"></span></a>
        <ul class="nav nav-second-level collapse">
            <?php if ($hasAccessScriptOptionsBooking): ?>
                <li<?php echo $isScriptOptionsBooking ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionBooking"><?php __('plugin_base_sms_tab_settings');?></a></li>
            <?php endif; ?>

            <?php if ($hasAccessScriptPayments): ?>
                <li<?php echo $isScriptPaymentsController ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjPayments&amp;action=pjActionIndex"><?php __('menuPayments');?></a></li>
            <?php endif; ?>

            <?php if ($hasAccessScriptOptionsBookingForm): ?>
                <li<?php echo $isScriptOptionsBookingForm ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionBookingForm"><?php __('menuBookingForm');?></a></li>
            <?php endif; ?>

            <?php if ($hasAccessScriptOptionsNotifications): ?>
                <li<?php echo $isScriptOptionsNotifications ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionNotifications"><?php __('menuNotifications');?></a></li>
            <?php endif; ?>

            <?php if ($hasAccessScriptOptionsTerm): ?>
                <li<?php echo $isScriptOptionsTerm ? ' class="active"' : NULL; ?>><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminOptions&amp;action=pjActionTerm"><?php __('menuTerms');?></a></li>
            <?php endif; ?>

        </ul>
    </li>
<?php endif; ?>


<?php if ($hasAccessScriptReports): ?>
    <li<?php echo $isScriptReports ? ' class="active"' : NULL; ?>>
    	<a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminReports&amp;action=pjActionIndex"><i class="fa fa-files-o"></i> <span class="nav-label"><?php __('menuReports');?></span></a>
    </li>
<?php endif; ?>