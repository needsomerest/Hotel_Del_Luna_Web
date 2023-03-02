DROP TABLE IF EXISTS `hotel_booking_bookings`;
CREATE TABLE IF NOT EXISTS `hotel_booking_bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `uuid` varchar(12) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `room_price` decimal(15,2) unsigned DEFAULT NULL,
  `extra_price` decimal(15,2) unsigned DEFAULT NULL,
  `total` decimal(15,2) unsigned DEFAULT NULL,
  `deposit` decimal(15,2) unsigned DEFAULT NULL,
  `tax` decimal(15,2) unsigned DEFAULT NULL,
  `security` decimal(15,2) unsigned DEFAULT NULL,
  `discount` decimal(15,2) unsigned DEFAULT NULL,
  `voucher` varchar(50) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` enum('confirmed','cancelled','pending','not_confirmed') DEFAULT 'pending',
  `txn_id` varchar(255) DEFAULT NULL,
  `processed_on` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `c_arrival` time DEFAULT NULL,
  `c_departure` time DEFAULT NULL,
  `c_notes` text,
  `c_title` varchar(255) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_phone` varchar(255) DEFAULT NULL,
  `c_email` varchar(255) DEFAULT NULL,
  `c_company` varchar(255) DEFAULT NULL,
  `c_address` varchar(255) DEFAULT NULL,
  `c_city` varchar(255) DEFAULT NULL,
  `c_state` varchar(255) DEFAULT NULL,
  `c_zip` varchar(255) DEFAULT NULL,
  `c_country` int(10) unsigned DEFAULT NULL,
  `cc_type` blob,
  `cc_num` blob,
  `cc_exp_month` blob,
  `cc_exp_year` blob,
  `cc_code` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `calendar_id` (`calendar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_bookings_extras`;
CREATE TABLE IF NOT EXISTS `hotel_booking_bookings_extras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned DEFAULT NULL,
  `extra_id` int(10) unsigned DEFAULT NULL,
  `price` decimal(15,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`,`extra_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_bookings_rooms`;
CREATE TABLE IF NOT EXISTS `hotel_booking_bookings_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned DEFAULT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  `room_number_id` int(10) unsigned DEFAULT NULL,
  `adults` smallint(5) unsigned DEFAULT NULL,
  `children` smallint(5) unsigned DEFAULT NULL,
  `price` decimal(15,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `room_id` (`room_id`),
  KEY `room_number_id` (`room_number_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_bookings_rooms_temp`;
CREATE TABLE IF NOT EXISTS `hotel_booking_bookings_rooms_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned DEFAULT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  `room_number_id` int(10) unsigned DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `adults` smallint(5) unsigned DEFAULT NULL,
  `children` smallint(5) unsigned DEFAULT NULL,
  `price` decimal(15,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `room_id` (`room_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_calendars`;
CREATE TABLE IF NOT EXISTS `hotel_booking_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_clients`;
CREATE TABLE IF NOT EXISTS `hotel_booking_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foreign_id` int(10) unsigned DEFAULT NULL,
  `calendar_id` int(10) unsigned DEFAULT NULL,
  `c_title` varchar(255) DEFAULT NULL,
  `c_company` varchar(255) DEFAULT NULL,
  `c_address` varchar(255) DEFAULT NULL,
  `c_country` varchar(255) DEFAULT NULL,
  `c_state` varchar(255) DEFAULT NULL,
  `c_city` varchar(255) DEFAULT NULL,
  `c_zip` varchar(255) DEFAULT NULL,
  `c_notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_discount_codes`;
CREATE TABLE IF NOT EXISTS `hotel_booking_discount_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `type` enum('amount','percent') DEFAULT NULL,
  `discount` decimal(15,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_id` (`room_id`,`promo_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_discount_frees`;
CREATE TABLE IF NOT EXISTS `hotel_booking_discount_frees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `min_length` tinyint(3) unsigned DEFAULT NULL,
  `max_length` tinyint(3) unsigned DEFAULT NULL,
  `free_nights` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_discount_packages`;
CREATE TABLE IF NOT EXISTS `hotel_booking_discount_packages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `start_day` tinyint(1) unsigned DEFAULT NULL,
  `end_day` tinyint(1) unsigned DEFAULT NULL,
  `total_price` decimal(15,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_discount_packages_items`;
CREATE TABLE IF NOT EXISTS `hotel_booking_discount_packages_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(10) unsigned DEFAULT NULL,
  `adults` smallint(5) unsigned DEFAULT NULL,
  `children` smallint(5) unsigned DEFAULT NULL,
  `price` decimal(15,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_extras`;
CREATE TABLE IF NOT EXISTS `hotel_booking_extras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` int(10) unsigned DEFAULT NULL,
  `price` decimal(15,2) unsigned DEFAULT NULL,
  `per` enum('booking','day','person','day_person') DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `status` enum('T','F') DEFAULT 'T',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `calendar_id` (`calendar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_limits`;
CREATE TABLE IF NOT EXISTS `hotel_booking_limits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `start_on` tinyint(1) unsigned DEFAULT NULL,
  `min_nights` tinyint(3) unsigned DEFAULT NULL,
  `max_nights` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_notifications`;
CREATE TABLE IF NOT EXISTS `hotel_booking_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recipient` enum('client','admin') DEFAULT NULL,
  `transport` enum('email','sms') DEFAULT NULL,
  `variant` varchar(30) DEFAULT NULL,
  `is_active` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `recipient` (`recipient`,`transport`,`variant`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_options`;
CREATE TABLE IF NOT EXISTS `hotel_booking_options` (
  `foreign_id` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL DEFAULT '',
  `tab_id` tinyint(3) unsigned DEFAULT NULL,
  `value` text,
  `label` text,
  `type` enum('string','text','int','float','enum','bool') NOT NULL DEFAULT 'string',
  `order` int(10) unsigned DEFAULT NULL,
  `is_visible` tinyint(1) unsigned DEFAULT '1',
  `style` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`foreign_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_prices`;
CREATE TABLE IF NOT EXISTS `hotel_booking_prices` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `foreign_id` INT(10) UNSIGNED NOT NULL,
  `tab_id` INT(10) UNSIGNED DEFAULT NULL,
  `season` VARCHAR(255) DEFAULT NULL,
  `date_from` DATE DEFAULT NULL,
  `date_to` DATE DEFAULT NULL,
  `adults` TINYINT(3) UNSIGNED DEFAULT NULL,
  `children` TINYINT(3) UNSIGNED DEFAULT NULL,
  `mon` decimal(15,2) UNSIGNED DEFAULT NULL,
  `tue` decimal(15,2) UNSIGNED DEFAULT NULL,
  `wed` decimal(15,2) UNSIGNED DEFAULT NULL,
  `thu` decimal(15,2) UNSIGNED DEFAULT NULL,
  `fri` decimal(15,2) UNSIGNED DEFAULT NULL,
  `sat` decimal(15,2) UNSIGNED DEFAULT NULL,
  `sun` decimal(15,2) UNSIGNED DEFAULT NULL,
  `set_different_prices` enum('T','F') DEFAULT 'T',
  `set_different_prices_based_on_guests` enum('T','F') DEFAULT 'T',
  PRIMARY KEY (`id`),
  UNIQUE KEY `season` (`foreign_id`,`tab_id`,`season`,`adults`,`children`),
  UNIQUE KEY `dates` (`foreign_id`,`date_from`,`date_to`,`tab_id`,`adults`,`children`)
) ENGINE=INNODB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_restrictions`;
CREATE TABLE IF NOT EXISTS `hotel_booking_restrictions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `restriction_type` enum('unavailable','web','external') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_restrictions_rooms`;
CREATE TABLE IF NOT EXISTS `hotel_booking_restrictions_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restriction_id` int(10) unsigned DEFAULT NULL,
  `room_number_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restriction_room` (`restriction_id`,`room_number_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_rooms`;
CREATE TABLE IF NOT EXISTS `hotel_booking_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` int(10) unsigned DEFAULT NULL,
  `adults` smallint(5) unsigned DEFAULT NULL,
  `children` smallint(5) unsigned DEFAULT NULL,
  `max_people` smallint(5) unsigned DEFAULT NULL,
  `cnt` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_id` (`calendar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `hotel_booking_rooms_numbers`;
CREATE TABLE IF NOT EXISTS `hotel_booking_rooms_numbers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `hotel_booking_options` (`foreign_id`, `key`, `tab_id`, `value`, `label`, `type`, `order`, `is_visible`, `style`) VALUES
(1, 'o_theme', 1, '0|1|2|3|4|5|6|7|8|9|10::1', 'Default|Theme 1|Theme 2|Theme 3|Theme 4|Theme 5|Theme 6|Theme 7|Theme 8|Theme 9|Theme 10', 'enum', 5, 1, NULL),
(1, 'o_max_nights', 1, '30', NULL, 'int', 1, 0, NULL),
(1, 'o_accept_bookings', 1, '1|0::1', NULL, 'bool', 2, 1, NULL),
(1, 'o_status_if_paid', 1, 'confirmed|pending|cancelled::confirmed', 'Confirmed|Pending|Cancelled', 'enum', 3, 1, NULL),
(1, 'o_status_if_not_paid', 1, 'confirmed|pending|cancelled::pending', 'Confirmed|Pending|Cancelled', 'enum', 4, 1, NULL),
(1, 'o_price_based_on', 1, 'days|nights::days', 'Days|Nights', 'enum', 11, 1, NULL),
(1, 'o_disable_payments', 1, '1|0::0', NULL, 'bool', 5, 1, NULL),
(1, 'o_deposit', 1, '10', NULL, 'float', 6, 1, NULL),
(1, 'o_deposit_type', 1, 'amount|percent::percent', 'Amount|Percent', 'enum', NULL, 0, NULL),
(1, 'o_security', 1, '0', NULL, 'float', 7, 1, NULL),
(1, 'o_tax', 1, '0', NULL, 'float', 8, 1, NULL),
(1, 'o_require_all_within', 1, '0', NULL, 'int', 9, 1, NULL),
(1, 'o_allow_pending_time', 1, '1|0::1', NULL, 'bool', 12, 1, NULL),
(1, 'o_pending_time', 1, '60', NULL, 'int', 13, 1, NULL),
(1, 'o_allow_bank', 2, '1|0::0', NULL, 'bool', 1, 1, NULL),
(1, 'o_bank_account', 2, 'Bank of America', NULL, 'text', 2, 1, NULL),
(1, 'o_allow_creditcard', 2, '1|0::0', NULL, 'bool', 3, 1, NULL),
(1, 'o_allow_cash', 2, '1|0::1', NULL, 'bool', 4, 1, NULL),
(1, 'o_thankyou_page', 2, 'http://www.phpjabbers.com/', NULL, 'string', 5, 1, NULL),
(1, 'o_bf_title', 3, '1|2|3::3', 'No|Yes|Yes (Required)', 'enum', 1, 1, NULL),
(1, 'o_bf_name', 3, '1|2|3::3', 'No|Yes|Yes (Required)', 'enum', 2, 1, NULL),
(1, 'o_bf_email', 3, '1|2|3::3', 'No|Yes|Yes (Required)', 'enum', 4, 0, NULL),
(1, 'o_bf_phone', 3, '1|2|3::3', 'No|Yes|Yes (Required)', 'enum', 5, 1, NULL),
(1, 'o_bf_arrival', 3, '1|2|3::3', 'No|Yes|Yes (Required)', 'enum', 6, 1, NULL),
(1, 'o_bf_notes', 3, '1|2|3::3', 'No|Yes|Yes (Required)', 'enum', 7, 1, NULL),
(1, 'o_bf_company', 3, '1|2|3::2', 'No|Yes|Yes (Required)', 'enum', 10, 1, NULL),
(1, 'o_bf_address', 3, '1|2|3::2', 'No|Yes|Yes (Required)', 'enum', 11, 1, NULL),
(1, 'o_bf_city', 3, '1|2|3::2', 'No|Yes|Yes (Required)', 'enum', 12, 1, NULL),
(1, 'o_bf_state', 3, '1|2|3::2', 'No|Yes|Yes (Required)', 'enum', 13, 1, NULL),
(1, 'o_bf_zip', 3, '1|2|3::2', 'No|Yes|Yes (Required)', 'enum', 14, 1, NULL),
(1, 'o_bf_country', 3, '1|2|3::2', 'No|Yes|Yes (Required)', 'enum', 15, 1, NULL),
(1, 'o_bf_captcha', 3, '1|3::3', 'No|Yes (Required)', 'enum', 16, 1, NULL),
(1, 'o_bf_terms', 3, '1|3::3', 'No|Yes (Required)', 'enum', 17, 1, NULL),
(1, 'o_welcome_done_1', 99, '1|0::0', NULL, 'bool', NULL, 0, NULL),
(1, 'o_welcome_done_2', 99, '1|0::0', NULL, 'bool', NULL, 0, NULL),
(1, 'o_welcome_done_3', 99, '1|0::0', NULL, 'bool', NULL, 0, NULL),
(1, 'o_welcome_done_4', 99, '1|0::0', NULL, 'bool', NULL, 0, NULL),
(1, 'o_welcome_done_5', 99, '1|0::0', NULL, 'bool', NULL, 0, NULL),
(1, 'o_welcome_done_6', 99, '1|0::0', NULL, 'bool', NULL, 0, NULL),
(1, 'o_extra_payment_url', 99, '', NULL, 'string', NULL, 0, NULL),
(1, 'o_cancel_booking_url', 99, '', NULL, 'string', NULL, 0, NULL),
(1, 'o_last_usage_time', 99, '1400000000', NULL, 'string', NULL, 0, NULL),
(1, 'o_multi_lang', 99, '1|0::1', NULL, 'bool', NULL, 0, NULL),
(1, 'o_fields_index', 99, 'd874fcc5fe73b90d770a544664a3775d', NULL, 'string', NULL, 0, NULL);

--
-- Do not remove below
--

INSERT INTO `hotel_booking_calendars` (`id`, `user_id`) VALUES
(1, 1);

INSERT IGNORE INTO `hotel_booking_notifications` (`id`, `recipient`, `transport`, `variant`, `is_active`) VALUES
(1, 'client', 'email', 'confirmation', 1),
(2, 'client', 'email', 'payment', 1),
(3, 'client', 'email', 'cancel', 1),
(4, 'admin', 'email', 'confirmation', 1),
(5, 'admin', 'email', 'payment', 1),
(6, 'admin', 'email', 'cancel', 1),
(7, 'client', 'email', 'account', 1),
(8, 'client', 'email', 'forgot', 1),
(9, 'client', 'sms', 'confirmation', 1),
(10, 'admin', 'sms', 'payment', 1),
(11, 'client', 'email', 'extra_payments', 1);

INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES
(NULL, '1', 'pjCalendar', '1', 'terms_url', '', 'data'),
(NULL, '1', 'pjCalendar', '1', 'terms_body', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin bibendum euismod odio non cursus. Vivamus cursus turpis neque. Integer semper varius eros eu congue. Quisque eu tortor lectus. Vivamus tristique sem a tellus dictum posuere. Curabitur ultrices pharetra est, facilisis tempus nibh suscipit id. Nulla dignissim placerat ipsum. Etiam mattis varius purus, eu posuere sapien condimentum eu. Etiam quam odio, suscipit eget egestas id, ultrices a nisi. Vivamus facilisis sem nec purus dapibus, vel molestie massa hendrerit. Cras accumsan gravida quam, sit amet ornare erat condimentum sed. Fusce adipiscing imperdiet imperdiet. Praesent commodo consectetur suscipit.\r\n\r\nAenean nec leo aliquet dui tristique porta eget quis lectus. Aliquam id pharetra felis. Vestibulum suscipit tellus elit, vitae imperdiet nulla ornare ac. Integer non nibh vitae justo aliquet faucibus. Suspendisse pulvinar tempor dui, porttitor elementum turpis adipiscing non. Nulla massa tellus, suscipit sit amet velit ac, viverra lobortis est. Sed sit amet tristique diam. Duis vel nisi vel dolor euismod feugiat. Proin porttitor eros mi, sed ultrices eros egestas sit amet. Curabitur lacinia euismod nisi et malesuada.\r\n\r\nAliquam scelerisque iaculis nunc nec dictum. Aliquam quis mollis purus. Donec vitae urna mi. Donec quis molestie purus, et condimentum erat. Suspendisse sed enim semper, pretium lorem ut, aliquam metus. Donec aliquam dignissim volutpat. Aenean purus arcu, fermentum sit amet nunc id, venenatis sodales sapien. Nunc non tellus iaculis massa suscipit ullamcorper faucibus a odio. Integer bibendum, nisl vel ullamcorper semper, augue risus lobortis quam, et semper eros sem facilisis lectus. Quisque convallis euismod porta. Duis interdum, nibh vel faucibus varius, odio nulla molestie leo, sed ornare massa odio non lectus. Etiam ornare mi eu sapien scelerisque tempus.', 'data'),
(NULL, '1', 'pjCalendar', '1', 'confirm_subject_client', 'Booking Confirmation {BookingID}', 'data'),
(NULL, '1', 'pjCalendar', '1', 'confirm_tokens_client', '<p>Dear&nbsp;{Name},</p><p>&nbsp;</p><p>thank you for your booking. Your&nbsp;reservation ID is:&nbsp;{BookingID}</p><p>&nbsp;</p><p><em>Reservation details</em></p><p>From:&nbsp;{DateFrom}</p><p>To:&nbsp;{DateTo}</p><p>Rooms:&nbsp;{Rooms}</p><p>Total price: {Total}</p><p>&nbsp;</p><p>If you wish to cancel your booking, please go to&nbsp;{CancelURL}</p><p>&nbsp;</p><p>Regards,</p><p>Hotel Management</p>', 'data'),
(NULL, '1', 'pjCalendar', '1', 'payment_subject_client', 'Payment Confirmation | Booking {BookingID}', 'data'),
(NULL, '1', 'pjCalendar', '1', 'payment_tokens_client', '<p>Dear&nbsp;{Name},</p><p>&nbsp;</p><p>thank you for your payment for reservation&nbsp; {BookingID}</p><p>&nbsp;</p><p>Regards,</p><p>Hotel Management</p>', 'data'),
(NULL, '1', 'pjCalendar', '1', 'confirm_subject_admin', 'New Reservation | Booking {BookingID}', 'data'),
(NULL, '1', 'pjCalendar', '1', 'confirm_tokens_admin', '<p>New booking has been received.</p><p>&nbsp;</p><p><em>Reservation details</em></p><p>Client:&nbsp;{Name}</p><p>Phone:&nbsp;{Phone}</p><p>Email: {Email}</p><p>From: {DateFrom}</p><p>To: {DateTo}</p><p>Rooms: {Rooms}</p><p>Total price: {Total}</p><p>&nbsp;</p>', 'data'),
(NULL, '1', 'pjCalendar', '1', 'payment_subject_admin', 'New Payment | Booking {BookingID}', 'data'),
(NULL, '1', 'pjCalendar', '1', 'payment_tokens_admin', '<p>Payment for booking&nbsp;{BookingID} has been recieved.</p><p>Amount:&nbsp;{Total}</p>', 'data'),
(NULL, '1', 'pjCalendar', '1', 'confirm_sms_admin', 'New booking received {BookingID}', 'data'),
(NULL, '1', 'pjCalendar', '1', 'payment_sms_admin', 'New payment received {BookingID}', 'data'),
(NULL, '1', 'pjCalendar', '1', 'cancel_subject_admin', 'Reservation cancelled: Booking {BookingID}', 'script'),
(NULL, '1', 'pjCalendar', '1', 'cancel_tokens_admin', '<p>Booking has been canceled.</p><p>&nbsp;</p><p><em>Reservation details</em></p><p>From: {DateFrom}</p><p>To: {DateTo}</p><p>Rooms: {Rooms}</p><p>&nbsp;</p>', 'script'),
(NULL, '1', 'pjCalendar', '1', 'cancel_subject_client', 'Reservation Cancellation | Booking {BookingID}', 'script'),
(NULL, '1', 'pjCalendar', '1', 'cancel_tokens_client', '<p>Dear&nbsp;{Name},</p><p>&nbsp;</p><p>Your reservation {BookingID} has been cancelled.</p><p>&nbsp;</p><p><em>Reservation details</em></p><p>From:&nbsp;{DateFrom}</p><p>To:&nbsp;{DateTo}</p><p>Rooms:&nbsp;{Rooms}</p><p>&nbsp;</p><p>Hope to see you again!</p><p>&nbsp;</p><p>Regards,</p><p>Hotel Management</p>', 'script'),
(NULL, '1', 'pjCalendar', '1', 'account_subject_client', 'Account confirmation', 'script'),
(NULL, '1', 'pjCalendar', '1', 'account_tokens_client', '<p>Dear&nbsp;{Name},</p><p>&nbsp;</p><p>your account has been created.</p><p>&nbsp;</p><p>Regards,</p><p>Hotel Management</p>', 'script'),
(NULL, '1', 'pjCalendar', '1', 'forgot_subject_client', 'Forgot password', 'script'),
(NULL, '1', 'pjCalendar', '1', 'forgot_tokens_client', '<p>Dear&nbsp;{Name},</p><p>&nbsp;</p><p>your account password is:&nbsp;{Password}</p><p>&nbsp;</p><p>Regards,</p><p>Hotel Management</p>', 'script'),
(NULL, '1', 'pjCalendar', '1', 'confirmation_sms_tokens_client', 'New payment received. Booking  {BookingID}', 'script'),
(NULL, '1', 'pjCalendar', '1', 'extra_payments_subject_client', 'Payment received', 'script'),
(NULL, '1', 'pjCalendar', '1', 'extra_payments_tokens_client', '<p>Dear {Name},</p><p>&nbsp;</p><p>thank you for your payment.&nbsp;</p><p>&nbsp;</p><p><strong>{PaymentTitle}</strong><br />{PaymentDescription}<br />Total amount: {PaymentAmount}</p><p>&nbsp;</p><p>Regards,</p><p>Hotel Management</p>', 'script'),

(NULL, '1', 'pjPayment', '1', 'cash', 'Cash', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'user', 'backend', 'Username', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Username', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pass', 'backend', 'Password', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'email', 'backend', 'E-Mail', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'url', 'backend', 'URL', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'URL', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'created', 'backend', 'Created', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'DateTime', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnSave', 'backend', 'Save', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Save', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnReset', 'backend', 'Reset', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Reset', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'addLocale', 'backend', 'Add language', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add language', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuLang', 'backend', 'Menu Multi lang', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Multi Lang', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuPlugins', 'backend', 'Menu Plugins', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Plugins', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuUsers', 'backend', 'Menu Users', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Users', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuOptions', 'backend', 'Menu Options', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Options', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuLogout', 'backend', 'Menu Logout', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Logout', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnUpdate', 'backend', 'Update', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblChoose', 'backend', 'Choose', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Choose', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnSearch', 'backend', 'Search', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Search', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'backend', 'backend', 'Backend titles', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Back-end titles', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'frontend', 'backend', 'Front-end titles', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Front-end titles', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'locales', 'backend', 'Languages', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'adminLogin', 'backend', 'Admin Login', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Admin Login', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnLogin', 'backend', 'Login', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Login', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuDashboard', 'backend', 'Menu Dashboard', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Dashboard', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblOptionList', 'backend', 'Option list', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Option list', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnAdd', 'backend', 'Button Add', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add +', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDelete', 'backend', 'Delete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblType', 'backend', 'Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblName', 'backend', 'Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblRole', 'backend', 'Role', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Role', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblStatus', 'backend', 'Status', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Status', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblIsActive', 'backend', 'Is Active', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Is confirmed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblUpdateUser', 'backend', 'Update user', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update user', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblAddUser', 'backend', 'Add user', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add user', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblValue', 'backend', 'Value', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Value', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblOption', 'backend', 'Option', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Option', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDays', 'backend', 'Days', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuLocales', 'backend', 'Menu Languages', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblYes', 'backend', 'Yes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Yes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNo', 'backend', 'No', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblError', 'backend', 'Error', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Error', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnBack', 'backend', 'Button Back', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '&laquo; Back', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnCancel', 'backend', 'Button Cancel', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancel', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblForgot', 'backend', 'Forgot password', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Forgot password', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'adminForgot', 'backend', 'Forgot password', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password reminder', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnSend', 'backend', 'Button Send', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'emailForgotSubject', 'backend', 'Email / Forgot Subject', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password reminder', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'emailForgotBody', 'backend', 'Email / Forgot Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Dear {Name},Your password: {Password}', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuProfile', 'backend', 'Menu Profile', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Profile', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesTitle', 'backend', 'Infobox / Locales Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesBody', 'backend', 'Infobox / Locales Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesBackendTitle', 'backend', 'Infobox / Locales Backend Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Backend Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesBackendBody', 'backend', 'Infobox / Locales Backend Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Backend Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesFrontendTitle', 'backend', 'Infobox / Locales Frontend Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Frontend Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesFrontendBody', 'backend', 'Infobox / Locales Frontend Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Frontend Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingPricesTitle', 'backend', 'Infobox / Listing Prices Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Prices Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingPricesBody', 'backend', 'Infobox / Listing Prices Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Prices Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingBookingsTitle', 'backend', 'Infobox / Listing Bookings Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Bookings Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingBookingsBody', 'backend', 'Infobox / Listing Bookings Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Bookings Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingContactTitle', 'backend', 'Infobox / Listing Contact Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Contact Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingContactBody', 'backend', 'Infobox / Listing Contact Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Contact Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingAddressTitle', 'backend', 'Infobox / Listing Address Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Address Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingAddressBody', 'backend', 'Infobox / Listing Address Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Listing Address Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingExtendTitle', 'backend', 'Infobox / Extend exp.date Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extend exp.date Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoListingExtendBody', 'backend', 'Infobox / Extend exp.date Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extend exp.date Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuBackup', 'backend', 'Menu Backup', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnBackup', 'backend', 'Button Backup', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblBackupDatabase', 'backend', 'Backup / Database', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup database', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblBackupFiles', 'backend', 'Backup / Files', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup files', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridChooseAction', 'backend', 'Grid / Choose Action', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Choose Action', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridGotoPage', 'backend', 'Grid / Go to page', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Go to page:', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridTotalItems', 'backend', 'Grid / Total items', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total items:', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridItemsPerPage', 'backend', 'Grid / Items per page', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Items per page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridPrevPage', 'backend', 'Grid / Prev page', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prev page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridPrev', 'backend', 'Grid / Prev', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '&laquo; Prev', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridNextPage', 'backend', 'Grid / Next page', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Next page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridNext', 'backend', 'Grid / Next', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Next &raquo;', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridDeleteConfirmation', 'backend', 'Grid / Delete confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridConfirmationTitle', 'backend', 'Grid / Confirmation Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Are you sure you want to delete selected record?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridActionTitle', 'backend', 'Grid / Action Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Action confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridBtnOk', 'backend', 'Grid / Button OK', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'OK', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridBtnCancel', 'backend', 'Grid / Button Cancel', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancel', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridBtnDelete', 'backend', 'Grid / Button Delete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridEmptyResult', 'backend', 'Grid / Empty resultset', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No records found', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'multilangTooltip', 'backend', 'MultiLang / Tooltip', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select a language by clicking on the corresponding flag and update existing translation.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblIp', 'backend', 'IP address', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'IP address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblUserCreated', 'backend', 'User / Registration Date & Time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Registration date/time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_currency', 'backend', 'Options / Currency', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Currency', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_date_format', 'backend', 'Options / Date format', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date format', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_timezone', 'backend', 'Options / Timezone', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Timezone', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_week_start', 'backend', 'Options / First day of the week', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'First day of the week', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'u_statarr_ARRAY_T', 'arrays', 'u_statarr_ARRAY_T', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Active', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'u_statarr_ARRAY_F', 'arrays', 'u_statarr_ARRAY_F', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Inactive', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'filter_ARRAY_active', 'arrays', 'filter_ARRAY_active', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Active', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'filter_ARRAY_inactive', 'arrays', 'filter_ARRAY_inactive', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Inactive', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, '_yesno_ARRAY_T', 'arrays', '_yesno_ARRAY_T', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Yes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, '_yesno_ARRAY_F', 'arrays', '_yesno_ARRAY_F', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_mr', 'arrays', 'personal_titles_ARRAY_mr', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Mr.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_mrs', 'arrays', 'personal_titles_ARRAY_mrs', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Mrs.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_miss', 'arrays', 'personal_titles_ARRAY_miss', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Miss', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_ms', 'arrays', 'personal_titles_ARRAY_ms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Ms.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_dr', 'arrays', 'personal_titles_ARRAY_dr', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Dr.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_prof', 'arrays', 'personal_titles_ARRAY_prof', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prof.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_rev', 'arrays', 'personal_titles_ARRAY_rev', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rev.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'personal_titles_ARRAY_other', 'arrays', 'personal_titles_ARRAY_other', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Other', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-43200', 'arrays', 'timezones_ARRAY_-43200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-12:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-39600', 'arrays', 'timezones_ARRAY_-39600', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-11:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-36000', 'arrays', 'timezones_ARRAY_-36000', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-10:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-32400', 'arrays', 'timezones_ARRAY_-32400', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-09:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-28800', 'arrays', 'timezones_ARRAY_-28800', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-08:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-25200', 'arrays', 'timezones_ARRAY_-25200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-07:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-21600', 'arrays', 'timezones_ARRAY_-21600', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-06:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-18000', 'arrays', 'timezones_ARRAY_-18000', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-05:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-14400', 'arrays', 'timezones_ARRAY_-14400', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-04:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-10800', 'arrays', 'timezones_ARRAY_-10800', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-03:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-7200', 'arrays', 'timezones_ARRAY_-7200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-02:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_-3600', 'arrays', 'timezones_ARRAY_-3600', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT-01:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_0', 'arrays', 'timezones_ARRAY_0', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_3600', 'arrays', 'timezones_ARRAY_3600', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+01:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_7200', 'arrays', 'timezones_ARRAY_7200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+02:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_10800', 'arrays', 'timezones_ARRAY_10800', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+03:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_14400', 'arrays', 'timezones_ARRAY_14400', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+04:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_18000', 'arrays', 'timezones_ARRAY_18000', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+05:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_21600', 'arrays', 'timezones_ARRAY_21600', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+06:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_25200', 'arrays', 'timezones_ARRAY_25200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+07:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_28800', 'arrays', 'timezones_ARRAY_28800', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+08:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_32400', 'arrays', 'timezones_ARRAY_32400', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+09:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_36000', 'arrays', 'timezones_ARRAY_36000', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+10:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_39600', 'arrays', 'timezones_ARRAY_39600', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+11:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_43200', 'arrays', 'timezones_ARRAY_43200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+12:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'timezones_ARRAY_46800', 'arrays', 'timezones_ARRAY_46800', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GMT+13:00', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU01', 'arrays', 'error_titles_ARRAY_AU01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU03', 'arrays', 'error_titles_ARRAY_AU03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User added!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU04', 'arrays', 'error_titles_ARRAY_AU04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU08', 'arrays', 'error_titles_ARRAY_AU08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AB01', 'arrays', 'error_titles_ARRAY_AB01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AB02', 'arrays', 'error_titles_ARRAY_AB02', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup complete!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AB03', 'arrays', 'error_titles_ARRAY_AB03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup failed!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AB04', 'arrays', 'error_titles_ARRAY_AB04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup failed!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA10', 'arrays', 'error_titles_ARRAY_AA10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Account not found!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA11', 'arrays', 'error_titles_ARRAY_AA11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password send!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA12', 'arrays', 'error_titles_ARRAY_AA12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password not send!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA13', 'arrays', 'error_titles_ARRAY_AA13', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Profile updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU01', 'arrays', 'error_bodies_ARRAY_AU01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this user have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU03', 'arrays', 'error_bodies_ARRAY_AU03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this user have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU04', 'arrays', 'error_bodies_ARRAY_AU04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the user has not been added.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU08', 'arrays', 'error_bodies_ARRAY_AU08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User your looking for is missing.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ALC01', 'arrays', 'error_bodies_ARRAY_ALC01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to titles have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AB01', 'arrays', 'error_bodies_ARRAY_AB01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We recommend you to regularly back up your database and files to prevent any loss of information.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AB02', 'arrays', 'error_bodies_ARRAY_AB02', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All backup files have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AB03', 'arrays', 'error_bodies_ARRAY_AB03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No option was selected.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AB04', 'arrays', 'error_bodies_ARRAY_AB04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Backup not performed.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA10', 'arrays', 'error_bodies_ARRAY_AA10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Given email address is not associated with any account.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA11', 'arrays', 'error_bodies_ARRAY_AA11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'For further instructions please check your mailbox.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA12', 'arrays', 'error_bodies_ARRAY_AA12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We\'re sorry, please try again later.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA13', 'arrays', 'error_bodies_ARRAY_AA13', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to your profile have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_1', 'arrays', 'months_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'January', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_2', 'arrays', 'months_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'February', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_3', 'arrays', 'months_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'March', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_4', 'arrays', 'months_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'April', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_5', 'arrays', 'months_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'May', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_6', 'arrays', 'months_ARRAY_6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'June', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_7', 'arrays', 'months_ARRAY_7', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'July', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_8', 'arrays', 'months_ARRAY_8', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'August', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_9', 'arrays', 'months_ARRAY_9', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'September', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_10', 'arrays', 'months_ARRAY_10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'October', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_11', 'arrays', 'months_ARRAY_11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'November', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'months_ARRAY_12', 'arrays', 'months_ARRAY_12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'December', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_0', 'arrays', 'days_ARRAY_0', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sunday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_1', 'arrays', 'days_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Monday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_2', 'arrays', 'days_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tuesday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_3', 'arrays', 'days_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Wednesday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_4', 'arrays', 'days_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Thursday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_5', 'arrays', 'days_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Friday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'days_ARRAY_6', 'arrays', 'days_ARRAY_6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Saturday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_0', 'arrays', 'day_names_ARRAY_0', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'S', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_1', 'arrays', 'day_names_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'M', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_2', 'arrays', 'day_names_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'T', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_3', 'arrays', 'day_names_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'W', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_4', 'arrays', 'day_names_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'T', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_5', 'arrays', 'day_names_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'F', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_names_ARRAY_6', 'arrays', 'day_names_ARRAY_6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'S', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_1', 'arrays', 'short_months_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Jan', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_2', 'arrays', 'short_months_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Feb', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_3', 'arrays', 'short_months_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Mar', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_4', 'arrays', 'short_months_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Apr', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_5', 'arrays', 'short_months_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'May', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_6', 'arrays', 'short_months_ARRAY_6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Jun', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_7', 'arrays', 'short_months_ARRAY_7', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Jul', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_8', 'arrays', 'short_months_ARRAY_8', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Aug', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_9', 'arrays', 'short_months_ARRAY_9', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sep', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_10', 'arrays', 'short_months_ARRAY_10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Oct', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_11', 'arrays', 'short_months_ARRAY_11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Nov', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_months_ARRAY_12', 'arrays', 'short_months_ARRAY_12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Dec', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_1', 'arrays', 'status_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You are not loged in.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_2', 'arrays', 'status_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Access denied. You have not requisite rights to.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_3', 'arrays', 'status_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Empty resultset.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_7', 'arrays', 'status_ARRAY_7', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'The operation is not allowed in demo mode.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_123', 'arrays', 'status_ARRAY_123', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your hosting account does not allow uploading such a large image.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_999', 'arrays', 'status_ARRAY_999', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No permisions to edit the property', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_998', 'arrays', 'status_ARRAY_998', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No permisions to edit the reservation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_997', 'arrays', 'status_ARRAY_997', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No reservation found', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_996', 'arrays', 'status_ARRAY_996', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No property for the reservation found', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_9999', 'arrays', 'status_ARRAY_9999', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your registration was successfull.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_9998', 'arrays', 'status_ARRAY_9998', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your registration was successfull. Your account needs to be approved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'status_ARRAY_9997', 'arrays', 'status_ARRAY_9997', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'E-Mail address already exist', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'login_err_ARRAY_1', 'arrays', 'login_err_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Wrong username or password', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'login_err_ARRAY_2', 'arrays', 'login_err_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Access denied', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'login_err_ARRAY_3', 'arrays', 'login_err_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Account is disabled', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'localeArrays', 'backend', 'Locale / Arrays titles', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrays titles', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesArraysTitle', 'backend', 'Locale / Languages Array Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Arrays Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoLocalesArraysBody', 'backend', 'Locale / Languages Array Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Languages Array Body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lnkBack', 'backend', 'Link Back', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Back', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'locale_order', 'backend', 'Locale / Order', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Order', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'locale_is_default', 'backend', 'Locale / Is default', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Is default', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'locale_flag', 'backend', 'Locale / Flag', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Flag', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'locale_title', 'backend', 'Locale / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnDelete', 'backend', 'Button Delete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnContinue', 'backend', 'Button Continue', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Continue', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'vr_email_taken', 'backend', 'Users / Email already taken', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email address is already in use', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'revert_status', 'backend', 'Revert status', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Revert status', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblExport', 'backend', 'Export', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Export', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_send_email', 'backend', 'opt_o_send_email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_smtp_host', 'backend', 'opt_o_smtp_host', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMTP Host', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_smtp_port', 'backend', 'opt_o_smtp_port', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMTP Port', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_smtp_user', 'backend', 'opt_o_smtp_user', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMTP Username', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_smtp_pass', 'backend', 'opt_o_smtp_pass', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMTP Password', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuSms', 'backend', 'Menu Sms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMS', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuInvoice', 'backend', 'Menu Invoice', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Invoice', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuBookings', 'backend', 'Menu Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuRooms', 'backend', 'Menu Rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuPrice', 'backend', 'Menu Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prices', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuExtras', 'backend', 'Menu Extras', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuLimits', 'backend', 'Menu Limits', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Limits', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuDiscounts', 'backend', 'Menu Discounts', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Discounts', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_per_ARRAY_day', 'arrays', 'Extras / Per', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Per day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_per_ARRAY_booking', 'arrays', 'Extras / Per', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Per booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_per_ARRAY_person', 'arrays', 'Extras / Per', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Per person', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_per_ARRAY_day_person', 'arrays', 'Extras / Per', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Per day / per person', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_price', 'backend', 'Extras / Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_name', 'backend', 'Extras / Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_index_title', 'backend', 'Extras / Index title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Manage extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_index_body', 'backend', 'Extras / Index body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'These are special items and/or services which your clients can book. For example a breakfast, airport pickup, or anything else that you offer.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_create_title', 'backend', 'Extras / Create title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add an extra', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_create_body', 'backend', 'Extras / Create body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add name and price for the extra. You can also set how the price to be calculated - once for the whole booking, per day only, per day and per person or just per person.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_update_title', 'backend', 'Extras / Update title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update an extra', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_update_body', 'backend', 'Extras / Update body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update an extra and click Save.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_per_lbl', 'backend', 'Extras / Per label', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Per', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'delete_selected', 'backend', 'Delete selected', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete selected', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'delete_confirmation', 'backend', 'Delete confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Are you sure you want to delete selected items?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AE01', 'arrays', 'error_titles_ARRAY_AE01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AE01', 'arrays', 'error_bodies_ARRAY_AE01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this extra have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AE03', 'arrays', 'error_titles_ARRAY_AE03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra added!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AE03', 'arrays', 'error_bodies_ARRAY_AE03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this extra have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AE04', 'arrays', 'error_titles_ARRAY_AE04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AE04', 'arrays', 'error_bodies_ARRAY_AE04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the extra has not been added.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AE02', 'arrays', 'error_titles_ARRAY_AE02', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra failed to update.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AE02', 'arrays', 'error_bodies_ARRAY_AE02', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the extra has not been updated.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AE08', 'arrays', 'error_titles_ARRAY_AE08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AE08', 'arrays', 'error_bodies_ARRAY_AE08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra your looking for is missing.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AC01', 'arrays', 'error_titles_ARRAY_AC01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AC03', 'arrays', 'error_titles_ARRAY_AC03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country added!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AC04', 'arrays', 'error_titles_ARRAY_AC04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AC08', 'arrays', 'error_titles_ARRAY_AC08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AC01', 'arrays', 'error_bodies_ARRAY_AC01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this country have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AC03', 'arrays', 'error_bodies_ARRAY_AC03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this country have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AC04', 'arrays', 'error_bodies_ARRAY_AC04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the country has not been added.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AC08', 'arrays', 'error_bodies_ARRAY_AC08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country your looking for is missing.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_name', 'backend', 'Rooms / Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_adults', 'backend', 'Rooms / Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_children', 'backend', 'Rooms / Children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_cnt', 'backend', 'Rooms / Count', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room count', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_add', 'backend', 'Rooms / Add room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_update', 'backend', 'Rooms / Update room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_description', 'backend', 'Rooms / Description', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Description', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR01', 'arrays', 'error_titles_ARRAY_AR01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR03', 'arrays', 'error_titles_ARRAY_AR03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room added!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR04', 'arrays', 'error_titles_ARRAY_AR04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR08', 'arrays', 'error_titles_ARRAY_AR08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR01', 'arrays', 'error_bodies_ARRAY_AR01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room details have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR03', 'arrays', 'error_bodies_ARRAY_AR03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room details have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR04', 'arrays', 'error_bodies_ARRAY_AR04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the room has not been added.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR08', 'arrays', 'error_bodies_ARRAY_AR08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room your looking for is missing.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuInstall', 'backend', 'Menu Install', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuPreview', 'backend', 'Menu Preview', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Preview', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'info_ARRAY_room_photos_title', 'arrays', 'info_ARRAY_room_photos_title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Photos', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'info_ARRAY_room_photos_body', 'arrays', 'info_ARRAY_room_photos_body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Upload as many images as you want for this property. You can resize, crop, rotate, watermark and complress the uploaded images. Drag & drop to change their order.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_add', 'backend', 'Bookings / Add booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_update', 'backend', 'Bookings / Update booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_statuses_ARRAY_confirmed', 'arrays', 'Bookings / Booking status \'confirmed\'', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_statuses_ARRAY_pending', 'arrays', 'Bookings / Booking status \'pending\'', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Pending', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_statuses_ARRAY_cancelled', 'arrays', 'Bookings / Booking status \'cancelled\'', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancelled', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_dates', 'backend', 'Bookings / Dates', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking dates', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_client', 'backend', 'Bookings / Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_rooms', 'backend', 'Bookings / Rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_fname', 'backend', 'Bookings / First Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'First Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_lname', 'backend', 'Bookings / Last Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Last Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_title', 'backend', 'Bookings / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_email', 'backend', 'Bookings / Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_phone', 'backend', 'Bookings / Phone', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Phone', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_company', 'backend', 'Bookings / Company Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Company Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_zip', 'backend', 'Bookings / Zip', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Postcode/Zip', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_city', 'backend', 'Bookings / City', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'City', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_state', 'backend', 'Bookings / State', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'County/Region/State', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_country', 'backend', 'Bookings / Country', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_address_1', 'backend', 'Bookings / Address Line 1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address Line 1', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_arrival', 'backend', 'Bookings / Arrival Time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival Time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_notes', 'backend', 'Bookings / Notes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Additional requirements', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_status', 'backend', 'Bookings / Status', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Status', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_deposit', 'backend', 'Bookings / Deposit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Deposit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_tax', 'backend', 'Bookings / Tax', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tax', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_total', 'backend', 'Bookings / Total', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payment_method', 'backend', 'Bookings / Payment method', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment method', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_date_from', 'backend', 'Bookings / Date from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_date_to', 'backend', 'Bookings / Date to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room', 'backend', 'Bookings / Room type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payments_ARRAY_paypal', 'arrays', 'Bookings / Payment with Paypal', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Paypal', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payments_ARRAY_authorize', 'arrays', 'Bookings / Payment with Authorize.NET', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Authorize.NET', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payments_ARRAY_bank', 'arrays', 'Bookings / Payment with Bank Account', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bank Account', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payments_ARRAY_creditcard', 'arrays', 'Bookings / Payment with Credit card', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Credit card', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_client_details', 'backend', 'Bookings / Client details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_booking_details', 'backend', 'Bookings / Booking details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payment_details', 'backend', 'Bookings / Payment details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_exp', 'backend', 'Bookings / CC Exp.date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Exp.date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_num', 'backend', 'Bookings / CC Number', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Number', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_code', 'backend', 'Bookings / CC Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_type', 'backend', 'Bookings / CC Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_types_ARRAY_visa', 'arrays', 'Bookings / CC Type Visa', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Visa', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_types_ARRAY_mastercard', 'arrays', 'Bookings / CC Type MasterCard', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'MasterCard', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_types_ARRAY_amex', 'arrays', 'Bookings / CC Type American Express', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'AmericanExpress', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_cc_types_ARRAY_maestro', 'arrays', 'Bookings / CC Type Maestro', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Maestro', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room_details', 'backend', 'Bookings / Room details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_add_room', 'backend', 'Bookings / Add room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_recalc', 'backend', 'Bookings / Recalculate the price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Recalculate the price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room_edit', 'backend', 'Bookings / Edit booking room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Edit booking room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room_delete', 'backend', 'Bookings / Delete booking room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete booking room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room_add', 'backend', 'Bookings / Add booking room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add booking room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK06', 'arrays', 'error_titles_ARRAY_ABK06', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No rooms found', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK06', 'arrays', 'error_bodies_ARRAY_ABK06', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are not rooms added to this booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_extra_details', 'backend', 'Bookings / Extra details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra\'s details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK01', 'arrays', 'error_titles_ARRAY_ABK01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK03', 'arrays', 'error_titles_ARRAY_ABK03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking added!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK04', 'arrays', 'error_titles_ARRAY_ABK04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK08', 'arrays', 'error_titles_ARRAY_ABK08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK01', 'arrays', 'error_bodies_ARRAY_ABK01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this booking have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK03', 'arrays', 'error_bodies_ARRAY_ABK03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this booking have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK04', 'arrays', 'error_bodies_ARRAY_ABK04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the booking has not been added.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK08', 'arrays', 'error_bodies_ARRAY_ABK08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking your looking for is missing.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_date_from', 'backend', 'Limits / Date from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_date_to', 'backend', 'Limits / Date to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_start_on', 'backend', 'Limits / Start on', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Start on', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_min_nights', 'backend', 'Limits / Min nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Min nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_max_nights', 'backend', 'Limits / Max nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_any_day', 'backend', 'Limits / Any day', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Any day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_select', 'backend', 'Rooms / Select a room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select a Room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_add', 'backend', 'Limits / + Add Limit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Limit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuPackage', 'backend', 'Menu Package', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Package', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuFreeNight', 'backend', 'Menu Free Night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Free night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuPromoCode', 'backend', 'Menu Promo Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_add_code', 'backend', 'Discounts / Add Promo code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_update_code', 'backend', 'Discounts / Update Promo code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update Promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_add_free', 'backend', 'Discounts / Add Free night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Free night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_update_free', 'backend', 'Discounts / Update Free night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update Free night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_add_package', 'backend', 'Discounts / Add Package', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Package', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_update_package', 'backend', 'Discounts / Update Package', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update Package', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_types_ARRAY_amount', 'arrays', 'Discounts / Type amount', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Amount', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_types_ARRAY_percent', 'arrays', 'Discounts / Type percent', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Percent', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_type', 'backend', 'Discounts / Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_discount', 'backend', 'Discounts / Discount', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Discount', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_code', 'backend', 'Discounts / Promo code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_code_exists', 'backend', 'Discounts / Promo code existed', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code existed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_min_length', 'backend', 'Discounts/ Min length', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Min length', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_max_length', 'backend', 'Discounts/ Max length', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max length', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_free_nights', 'backend', 'Discounts / Free nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Free nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_start_day', 'backend', 'Discounts / Start day', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Start day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_end_day', 'backend', 'Discounts / End day', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'End day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_total_price', 'backend', 'Discounts / Total price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuGeneral', 'backend', 'Menu General', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'General', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuPayments', 'backend', 'Menu Payments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuBookingForm', 'backend', 'Menu Booking form', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Form', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuTerms', 'backend', 'Menu Terms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuConfirmation', 'backend', 'Menu Confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_address', 'backend', 'Options / Address', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_captcha', 'backend', 'Options / Captcha', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Captcha', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_city', 'backend', 'Options / City', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'City', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_email', 'backend', 'Options / Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_fname', 'backend', 'Options / First Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'First Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_notes', 'backend', 'Options / Notes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_phone', 'backend', 'Options / Phone', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Phone', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_state', 'backend', 'Options / State', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'State', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_terms', 'backend', 'Options / Terms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_zip', 'backend', 'Options / Zip', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Zip', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_country', 'backend', 'Options / Country', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_paypal_address', 'backend', 'Options / Paypal address', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Paypal address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_accept_bookings', 'backend', 'Options / Accept Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check this if you want people to be able to make reservations.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_allow_authorize', 'backend', 'Options / Allow Authorize.net', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Allow payments with Authorize.net', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_allow_bank', 'backend', 'Options / Allow Bank', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Provide Bank account details for wire transfers', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_allow_creditcard', 'backend', 'Options / Allow Credit Card', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Collect Credit Card details for offline processing', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_allow_paypal', 'backend', 'Options / Allow Paypal', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Allow payments with PayPal', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_authorize_key', 'backend', 'Options / Authorize.net transaction key', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Authorize.net transaction key', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_authorize_mid', 'backend', 'Options / Authorize.net merchant ID', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Authorize.net merchant ID', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bank_account', 'backend', 'Options / Bank account', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bank account', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_deposit', 'backend', 'Options / Deposit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set deposit amount to be collected for each reservation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_disable_payments', 'backend', 'Options / Disable payments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check if you want to disable payments and only collect reservation details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_price_based_on', 'backend', 'Options / Calculate price based on number of booked days or nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Reservations and prices will be based on', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_require_all_within', 'backend', 'Options / Require 100% if the reservations is within X days', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Require 100% if the reservations is within X days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_security', 'backend', 'Options / Security deposit payment', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set a security deposit payment to be collected with each reservation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_status_if_not_paid', 'backend', 'Options / Default status for booked dates if not paid', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set the status for new reservations when reservation form is saved', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_status_if_paid', 'backend', 'Options / Default status for booked dates if paid', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set the status for new reservations if payment has been made for it', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_tax', 'backend', 'Options / Tax payment', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tax amount to be collected for each reservation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_thankyou_page', 'backend', 'Options / \"Thank you\" page location', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'URL for the web page where your clients will be redirected after PayPal or Authorize.net payment', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_authorize_tz', 'backend', 'Options / Authorize.net Time zone', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Authorize.net time zone', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_email_new_reservation', 'backend', 'Options / New booking received', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'New reservation received', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_email_reservation_cancelled', 'backend', 'Options / Booking cancelled', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Reservation cancelled', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_email_password_reminder', 'backend', 'Notifications / Password reminder', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password reminder', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblOptionsTermsURL', 'backend', 'Options / Booking terms URL', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking terms URL', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblOptionsTermsContent', 'backend', 'Options / Booking terms content', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking terms content', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO24', 'arrays', 'error_titles_ARRAY_AO24', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking form', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO25', 'arrays', 'error_titles_ARRAY_AO25', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO26', 'arrays', 'error_titles_ARRAY_AO26', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms and Confirmations', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO24', 'arrays', 'error_bodies_ARRAY_AO24', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Choose the fields that should be available on the booking form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO25', 'arrays', 'error_bodies_ARRAY_AO25', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email notifications will be sent to people who make a reservation after reservation form is completed or/and payment is made. If you leave subject field blank no email will be sent.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO26', 'arrays', 'error_bodies_ARRAY_AO26', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Enter booking terms and conditions. You can also include a link to external web page where your terms and conditions page is.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO27', 'arrays', 'error_titles_ARRAY_AO27', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO27', 'arrays', 'error_bodies_ARRAY_AO27', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Here you can choose your payment methods and set payment gateway accounts and payment preferences. Note that for cash payments the system will not be able to collect deposit amount online.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblMaxValue', 'backend', 'Options / Max value', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max value', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO01', 'arrays', 'error_titles_ARRAY_AO01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'General options updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO03', 'arrays', 'error_titles_ARRAY_AO03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking options updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO01', 'arrays', 'error_bodies_ARRAY_AO01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to general options have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO03', 'arrays', 'error_bodies_ARRAY_AO03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to booking options have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO04', 'arrays', 'error_titles_ARRAY_AO04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking form options updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO05', 'arrays', 'error_titles_ARRAY_AO05', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmation options updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO06', 'arrays', 'error_titles_ARRAY_AO06', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms options updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO04', 'arrays', 'error_bodies_ARRAY_AO04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to booking form options have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO05', 'arrays', 'error_bodies_ARRAY_AO05', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to confirmation options have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO06', 'arrays', 'error_bodies_ARRAY_AO06', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to terms options have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO07', 'arrays', 'error_titles_ARRAY_AO07', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment options updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO07', 'arrays', 'error_bodies_ARRAY_AO07', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to payment options have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblReservationCreateInvoice', 'backend', 'Create Invoice', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Create Invoice', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblReservationFindInvoices', 'backend', 'Find Invoices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Find Invoices', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblReservationInvoiceDetails', 'backend', 'Invoice Details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Invoice Details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_uuid', 'backend', 'Bookings / Unique ID', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unique ID', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_room', 'backend', 'Limits / Room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_package_items', 'backend', 'Discounts / Package Items', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Package Items', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_price', 'backend', 'Discounts / Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_package_items_add', 'backend', 'Discounts / Add item', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add item', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_title', 'frontend', 'Search / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter the dates of your stay to check availability', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_check', 'frontend', 'Search / Button check', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check Availability', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_check_in', 'frontend', 'Search / Check-in date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check-in date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_check_out', 'frontend', 'Search / Check-out date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check-out date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_adults', 'frontend', 'Search / Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_children', 'frontend', 'Search / Children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_people', 'frontend', 'Frontend / People', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'People', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_rooms', 'frontend', 'Frontend / Rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price', 'frontend', 'Frontend / Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_na', 'frontend', 'Frontend / Not available', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Not available', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_from', 'frontend', 'Frontend / From', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_available_rooms', 'frontend', 'Frontend / Available rooms from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Available rooms from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_change_dates', 'frontend', 'Frontend / Change dates', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'change dates', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_book', 'frontend', 'Frontend / Book', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Book', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_back', 'frontend', 'Frontend / Back', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Back', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_not_found', 'frontend', 'Frontend / Rooms not found', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms not found', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_room', 'frontend', 'Frontend / Room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_continue', 'frontend', 'Frontend / Continue', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Continue', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_selected_rooms', 'frontend', 'Frontend / Selected rooms accommodate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'selected room(s) can accommodate {X} person(s)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price_note', 'frontend', 'Frontend / Price note', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select number of adults and children for each room. Price may change and will be calculated based on your selection.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_personal', 'frontend', 'Frontend / Personal Details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Personal Details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_billing', 'frontend', 'Frontend / Billing Address', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Billing Address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_payment', 'frontend', 'Frontend / Payment Method', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment Method', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_terms', 'frontend', 'Frontend / Terms and Conditions', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms and Conditions', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_select_title', 'frontend', 'Frontend / Select Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_select_country', 'frontend', 'Frontend / Select Country', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select Country', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_select_payment', 'frontend', 'Frontend / Select Payment method', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select Payment method', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_terms_note', 'frontend', 'Frontend / Terms note', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'I have read and agree to the Booking Conditions', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_terms_link', 'frontend', 'Frontend / Terms link', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Read terms and conditions', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_preview', 'frontend', 'Frontend / Preview Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Preview Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_confirm', 'frontend', 'Frontend / Confirm Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirm Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_lname', 'backend', 'Options / Last Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Last Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_title', 'backend', 'Options / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_arrival', 'backend', 'Options / Arrival Time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival Time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_company', 'backend', 'Options / Company', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Company', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_select_cc_type', 'frontend', 'Bookings / Select CC Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select CC Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_human_verification', 'frontend', 'Frontend / Human Verification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Human Verification', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_captcha', 'frontend', 'Frontend / Captcha', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Captcha', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_checkout', 'frontend', 'Frontend / Checkout', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Checkout', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_your_booking', 'frontend', 'Frontend / Your Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_extras', 'frontend', 'Frontend / Extras', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_change', 'frontend', 'Frontend / Change', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'change', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_booking_conditions', 'frontend', 'Frontend / Booking conditions', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking conditions', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_for', 'frontend', 'Frontend / For', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'For', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_max_persons', 'frontend', 'Frontend / Max persons per room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max persons per room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_room_price', 'frontend', 'Frontend / Room(s) Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room(s) Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_extras_price', 'frontend', 'Frontend / Extras Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extras Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_tax', 'frontend', 'Frontend / Tax', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tax', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_total', 'frontend', 'Frontend / Total', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_deposit', 'frontend', 'Frontend / Deposit required', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Deposit required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_night_singular', 'frontend', 'Frontend / Night (singular)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_room_singular', 'frontend', 'Frontend / Room (singular)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_room_plural', 'frontend', 'Frontend / Room (plural)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_night_plural', 'frontend', 'Frontend / Night (plural)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_suffix_ARRAY_st', 'arrays', 'Day suffix (1st)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'st', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_suffix_ARRAY_nd', 'arrays', 'Day suffix (2nd)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'nd', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_suffix_ARRAY_rd', 'arrays', 'Day suffix (3rd)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'rd', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_suffix_ARRAY_th', 'arrays', 'Day suffix (4th)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'th', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_to', 'frontend', 'Frontend / To', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room_price', 'backend', 'Bookings / Room(s) price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room(s) price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_extra_price', 'backend', 'Bookings / Extra(s) price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra(s) price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_100', 'backend', 'System / Rooms / Missing parameters', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sorry, but the Room\'s list can\'t be displayed because there are missing or incorrect parameters. Please return back to the Search form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_101', 'backend', 'System / Extras / Missing parameters', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sorry, but extras can\'t be displayed because there are missing or incorrect parameters. Please return back to our room list.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_102', 'backend', 'System / Checkout / Missing parameters', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sorry, but the Checkout form can\'t be displayed because there are missing or incorrect parameters. Please return back to the Extra\'s page.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_103', 'backend', 'System / Preview / Missing parameters', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sorry, but the Preview form can\'t be displayed because there are missing or incorrect parameters. Please return back to the Checkout form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_200', 'backend', 'System / Checkout / Submitted', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Checkout form has been submitted.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_104', 'backend', 'System / Booking / Missing parameters', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Missing parameters.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_105', 'backend', 'System / Booking / Missing or wrong captcha', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Missing or wrong captcha.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_106', 'backend', 'System / Booking / Invalid data', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking contains invalid data.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_107', 'backend', 'System / Booking / Booking not stored', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking has not been stored.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_201', 'backend', 'System / Booking / Booking stored', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking has been stored.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_202', 'backend', 'System / Booking / Booking sent', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your booking has been stored and sent successfully. Thank you.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_203', 'backend', 'System / Booking / Booking redirect', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please wait while redirect to secure payment processor webpage complete. If your browser does not redirect in 3 seconds, click on the button below.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_payment_paypal_title', 'backend', 'Frontend / Paypal title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Hotel Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_payment_authorize_title', 'frontend', 'Frontend / Authorize.NET title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Hotel Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_payment_paypal_submit', 'frontend', 'Frontend / Paypal submit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Go to PayPal Secure page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_payment_authorize_submit', 'frontend', 'Frontend / Authorize.NET submit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Go to Authorize.NET Secure page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_rooms_accommodate', 'frontend', 'Frontend / Rooms accommodate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'selected rooms for', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_bank_account', 'frontend', 'Frontend / Bank account', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bank account', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR06', 'arrays', 'error_titles_ARRAY_AR06', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add a Room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR06', 'arrays', 'error_bodies_ARRAY_AR06', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Enter name and description for the room (e.g. Single room, Double room, Studio). You can also specify number of adults and children the room can accommodate plus the number of  available rooms from this room type. Once you add the room you will be able to upload photos.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_apply', 'frontend', 'Search / Button apply code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Apply Code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashLastLogin', 'backend', 'Dashboard / Last login', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Last login', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNights', 'backend', 'Nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNight', 'backend', 'Night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDay', 'backend', 'Day', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashBookings', 'backend', 'Dashboard / Bookings today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'client bookings<br>today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashBooking', 'backend', 'Dashboard / Booking today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'client booking<br>today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashAvailableRooms', 'backend', 'Dashboard / Available rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'rooms available<br>today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashAvailableRoom', 'backend', 'Dashboard / Available room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'room available<br>today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashBookedRooms', 'backend', 'Dashboard / Booked rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'booked rooms<br>today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashBookedRoom', 'backend', 'Dashboard / Booked room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'booked room<br>today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_discount', 'frontend', 'Frontend / Discount', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Discount', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_voucher', 'backend', 'Bookings / Promo code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_discount', 'backend', 'Bookings / Discount', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Discount', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_cancel', 'frontend', 'Room / Button Cancel', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancel', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_child', 'frontend', 'Search / Child', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Child', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_adult', 'frontend', 'Search / Adult', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adult', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_edit_room', 'frontend', 'Room / Edit room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'edit room(s)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_change_rooms', 'frontend', 'Room / Change rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'change rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_security', 'frontend', 'Frontend / Security', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Security', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_booking_details', 'frontend', 'Frontend / Booking Details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallJs1_1', 'backend', 'Install / Step 1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 1 (Required)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallJs1_2', 'backend', 'Install / Step 2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 2 (Optional) - for SEO purposes and better ranking you need to put next meta tag into the HEAD part of your page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallJs1_3', 'backend', 'Install / Step 3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 3 (Optional) - In the text box below enter the page file name where the booking engine is placed. Then grab the generated code and put it in your .htaccess file. You need to put the .htaccess file in the same folder where your web page is. ', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallJs1_title', 'backend', 'Install / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallJs1_body', 'backend', 'Install / Body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Copy the code below and put it on your web page. It will show the front end booking engine.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallConfig', 'backend', 'Install / Config', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Language options', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallConfigLocale', 'backend', 'Install / Locale', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Language', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_security', 'backend', 'Bookings / Security', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Security', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR10', 'arrays', 'error_bodies_ARRAY_AR10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'In order to manage prices, please select a room.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR10', 'arrays', 'error_titles_ARRAY_AR10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select a room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AL10', 'arrays', 'error_bodies_ARRAY_AL10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You can use the Limits feature to define certain limits for all the bookings made by your clients. For example you may want to limit \"Double room\" bookings to be at least 2 nights long if booking start on Friday during summer season. Or you may want to allow maximum 30 days long bookings. Just click on the \"Add limit\" button and fill in the form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AL10', 'arrays', 'error_titles_ARRAY_AL10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set booking limites', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AD10', 'arrays', 'error_titles_ARRAY_AD10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Free night offers', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AD10', 'arrays', 'error_bodies_ARRAY_AD10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You can create a free night promotion for bookings made during a specific period and with a certain length. Just click on the \"Add Free night\" button and fill in the form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AD11', 'arrays', 'error_titles_ARRAY_AD11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo codes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AD11', 'arrays', 'error_bodies_ARRAY_AD11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Create different promo codes for any room during a certain time of the year. The promo code discount can be either in % or fixed amount. Just click on the "Add Promo code" button and fill in the form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AD12', 'arrays', 'error_titles_ARRAY_AD12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Packages', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AD12', 'arrays', 'error_bodies_ARRAY_AD12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You can create different packages and set custom prices for them. For example, make a weekend "Double room" package with a fixed price during high season. Just click on the "Add package" button and fill in the form.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR07', 'arrays', 'error_titles_ARRAY_AR07', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR07', 'arrays', 'error_bodies_ARRAY_AR07', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update name and description for the room (e.g. Single room, Double room, Studio). You can also specify number of adults and children the room can accommodate plus the number of  available rooms from this room type. Below you can upload photos for your room.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO21', 'arrays', 'error_titles_ARRAY_AO21', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'General options', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO21', 'arrays', 'error_bodies_ARRAY_AO21', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Configure general option for your booking system.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO23', 'arrays', 'error_titles_ARRAY_AO23', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Оptions', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO23', 'arrays', 'error_bodies_ARRAY_AO23', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set different booking options for your Hotel Booking engine.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO37', 'arrays', 'error_titles_ARRAY_AO37', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO37', 'arrays', 'error_bodies_ARRAY_AO37', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set different payment options for your booking engine.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashNoBookingsToday', 'backend', 'lblDashNoBookingsToday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No client bookings today.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashNoAvailableRoomsToday', 'backend', 'lblDashNoAvailableRoomsToday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No available rooms today.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashNoBookedRoomsToday', 'backend', 'lblDashNoBookedRoomsToday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No booked rooms today.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblAll', 'backend', 'All', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_c_name', 'backend', 'Booking Search / Client Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_c_email', 'backend', 'Booking Search / Client Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_room', 'backend', 'Booking Search / Room Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_dates', 'backend', 'Booking Search / Booking from/to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking from / to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_created', 'backend', 'Booking Search / Booking made between', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking made between', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_price', 'backend', 'Booking Search / Price range', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price range', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_subject', 'backend', 'Confirmation / Email subject', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Subject', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_body', 'backend', 'Confirmation / Email body', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email body', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_client_confirmation', 'backend', 'Confirmation / Client confirmation title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client - booking confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_client_payment', 'backend', 'Confirmation / Client payment title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client - payment confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_admin_confirmation', 'backend', 'Confirmation / Admin confirmation title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Admin - booking confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_admin_payment', 'backend', 'Confirmation / Admin payment title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Admin - payment confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_authorize_hash', 'backend', 'Options / Authorize.net hash value', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Authorize.net MD5 Hash value', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_invoice_details', 'backend', 'Bookings / Invoice', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Invoice Details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_invoice', 'backend', 'Bookings / Invoice', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Invoice', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_balance_payment', 'backend', 'Bookings / Balance payment', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Balance payment', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridInvalidDate', 'backend', 'Grid / Invalid date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '(invalid date)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridInvalidDatetime', 'backend', 'Grid / Invalid datetime', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '(invalid date/time)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridEmptyDatetime', 'backend', 'Grid / Empty datetime', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '(empty date/time)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridEmptyDate', 'backend', 'Grid / Empty date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '(empty date)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_currency', 'backend', 'Bookings / Currency', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Currency', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AR09', 'arrays', 'error_titles_ARRAY_AR09', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AR09', 'arrays', 'error_bodies_ARRAY_AR09', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Below you can view available room types and their count. Use the Add Room button to add a new room type. To Edit a room just click on the edit icon.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuAvailability', 'backend', 'Menu Availability', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Availability', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK09', 'arrays', 'error_titles_ARRAY_ABK09', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Availability', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK09', 'arrays', 'error_bodies_ARRAY_ABK09', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Below you can see room availability. In each date field you can see booked rooms and available rooms for each room type. (2/8 means that you have 2 booked and 8 available rooms). Click on any date box and bookings for selected date will be loaded below.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_prev30', 'backend', 'Bookings / Previous 30 days', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Previous 30 days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_next30', 'backend', 'Bookings / Next 30 days', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Next 30 days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_created', 'backend', 'Bookings / Date & Time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date/Time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_ip', 'backend', 'Bookings / IP', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'IP address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_confirmation', 'backend', 'Bookings / Email confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_confirmation_title', 'backend', 'Bookings / Email confirmation (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_subject', 'backend', 'Bookings / Subject', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Subject', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_message', 'backend', 'Bookings / Message', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Message', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuSeo', 'backend', 'Menu SEO', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SEO', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallConfigHide', 'backend', 'Install / Config hide', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Hide language selector', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO30', 'arrays', 'error_titles_ARRAY_AO30', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'To better optimize your shopping cart please follow the steps below', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO30', 'arrays', 'error_titles_ARRAY_AO30', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SEO Optimization', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallSeo_2', 'backend', 'Install / SEO Step 2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 2. Put the meta tag below between <head> and </head>tags on your web page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallSeo_1', 'backend', 'Install / SEO Step 1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 1. Webpage where your front end shopping cart is', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblInstallSeo_3', 'backend', 'Install / SEO Step 3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 3. Create .htaccess file (or update existing one) in the folder where your web page is and put the data below in it', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_voucher_error', 'frontend', 'Frontend / Voucher error', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_allow_cash', 'backend', 'Options / Allow Cash payments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Allow Cash payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_payments_ARRAY_cash', 'arrays', 'Bookings / Payment with Cash', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cash', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA14', 'arrays', 'error_titles_ARRAY_AA14', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Profile settings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA14', 'arrays', 'error_bodies_ARRAY_AA14', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use form below to update your profile details.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashLatestBookings', 'backend', 'Dashboard / Latest bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Latest bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashAvailableRoomsToday', 'backend', 'Dashboard / Available rooms today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Available rooms today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDashBookedRoomsToday', 'backend', 'Dashboard / Booked rooms today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booked rooms today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK10', 'arrays', 'error_titles_ARRAY_ABK10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room(s) overlap', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK10', 'arrays', 'error_bodies_ARRAY_ABK10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms that you are trying to book are already occupied.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA15', 'arrays', 'error_titles_ARRAY_AA15', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email is already taken', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA15', 'arrays', 'error_bodies_ARRAY_AA15', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sorry but the email address is already taken.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AA16', 'arrays', 'error_bodies_ARRAY_AA16', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Missing or invalid data.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AA16', 'arrays', 'error_titles_ARRAY_AA16', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Profile update error', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU09', 'arrays', 'error_titles_ARRAY_AU09', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User update error', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU09', 'arrays', 'error_bodies_ARRAY_AU09', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sorry but the email address is already taken.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU10', 'arrays', 'error_titles_ARRAY_AU10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'User error', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU10', 'arrays', 'error_bodies_ARRAY_AU10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Missing or invalid data.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'tabEmails', 'backend', 'Tabs / Emails', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Emails', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'tabSms', 'backend', 'Tabs / Sms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMS', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirm_sms_admin', 'backend', 'Confirmation / Admin - booking confirmation sms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Admin - booking confirmation sms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'payment_sms_admin', 'backend', 'Confirmation / Admin - payment confirmation sms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Admin - payment confirmation sms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'sms_body', 'backend', 'Confirmation / SMS content', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMS content', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_layout', 'backend', 'Options / Layout', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Layout', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_i_want_this', 'frontend', 'Frontend / I want this?', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'I want this?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_more_extras', 'frontend', 'Frontend / More Extras', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'More Extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_thumb', 'backend', 'Extras / Image', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Image', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_del_title', 'backend', 'Extras / Delete confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_del_body', 'backend', 'Extras / Delete confirmation (body)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Are you sure you want to delete selected image?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_show_week_numbers', 'backend', 'Options / Show week numbers', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Show week numbers', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_0', 'arrays', 'day_abbr_ARRAY_0', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sun', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_6', 'arrays', 'day_abbr_ARRAY_6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sat', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_1', 'arrays', 'day_abbr_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Mon', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_2', 'arrays', 'day_abbr_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tue', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_3', 'arrays', 'day_abbr_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Wed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_4', 'arrays', 'day_abbr_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Thu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'day_abbr_ARRAY_5', 'arrays', 'day_abbr_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Fri', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_prev_month', 'frontend', 'Frontend / Prev month', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prev month', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_next_month', 'frontend', 'Frontend / Next month', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Next month', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_more_rooms', 'frontend', 'Frontend / More Rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'More Rooms +', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_cal_note', 'frontend', 'Frontend / Calendar note', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Click on the calendar above to select arrival date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_combo_nights', 'frontend', 'Frontend / Nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_combo_children', 'frontend', 'Frontend / Children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_combo_adults', 'frontend', 'Frontend / Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_combo_arrival', 'frontend', 'Frontend / Arrival', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check in date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_max_nights', 'backend', 'Options / Max.nights (Layout 2)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max.nights (Layout 2)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_promo_code', 'frontend', 'Frontend / Promo Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo Code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_promo_apply', 'frontend', 'Frontend / Button Apply', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Apply', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_na_short', 'frontend', 'Frontend / Not available', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'N/A', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_tab_details', 'backend', 'Bookings / Details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_tab_client', 'backend', 'Bookings / Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK11', 'arrays', 'error_titles_ARRAY_ABK11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking update', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK11', 'arrays', 'error_bodies_ARRAY_ABK11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use form below to update booking details.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK12', 'arrays', 'error_titles_ARRAY_ABK12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK12', 'arrays', 'error_bodies_ARRAY_ABK12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use form below to update client related data.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK13', 'arrays', 'error_titles_ARRAY_ABK13', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Invoice details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK13', 'arrays', 'error_bodies_ARRAY_ABK13', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use grid below to organize your invoices.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK14', 'arrays', 'error_titles_ARRAY_ABK14', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add a booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK14', 'arrays', 'error_bodies_ARRAY_ABK14', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Fill in the form below to add a new booking. Under Clients tab you can enter information about the client.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK15', 'arrays', 'error_titles_ARRAY_ABK15', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK15', 'arrays', 'error_bodies_ARRAY_ABK15', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use the form below to enter details about your client.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price_night', 'frontend', 'Frontend / Night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price_day', 'frontend', 'Frontend / Day', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_layout', 'backend', 'Install / Layout', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Layout', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_legend', 'backend', 'Install / Legend', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install config', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuInstallPreview', 'backend', 'Menu Install & Preview', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install &amp; Preview', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_err_ARRAY_1', 'arrays', 'cancel_err_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Missing, empty or invalid parameters.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_err_ARRAY_2', 'arrays', 'cancel_err_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking with such an ID did not exists.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_err_ARRAY_3', 'arrays', 'cancel_err_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Security hash did not match.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_err_ARRAY_4', 'arrays', 'cancel_err_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking is already cancelled.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_err_ARRAY_5', 'arrays', 'cancel_err_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking has been cancelled successfully.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_confirm', 'frontend', 'Cancel / Cancel button', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancel booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'cancel_title', 'frontend', 'Cancel / Page title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Cancellation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'confirmation_admin_cancel', 'backend', 'Confirmation / Admin cancellation title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Admin - booking cancellation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_combo_departure', 'frontend', 'Frontend / Departure', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check out date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_combo_days', 'frontend', 'Frontend / Days', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_day_plural', 'frontend', 'Frontend / Day (plural)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_day_singular', 'frontend', 'Frontend / Day (singular)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_108', 'backend', 'System / Checkout / Haven\'t selected room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You have not selected room. Please, return back.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_109', 'backend', 'System / Checkout / Bookings not accepted', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings are not accepted. Please, return back.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_110', 'backend', 'System / Checkout / Rooms not available', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Selected rooms are not available. Please, return back.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price_per_day', 'frontend', 'Frontend / Per day', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'per day', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price_per_night', 'frontend', 'Frontend / Per night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'per night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests', 'backend', 'Reports / Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guest', 'backend', 'Reports / Guest', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Guest', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights', 'backend', 'Reports / Nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_night', 'backend', 'Reports / Night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total', 'backend', 'Reports / Total', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_confirmed_bookings', 'backend', 'Reports / Confirmed Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmed Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_cancelled_bookings', 'backend', 'Reports / Cancelled Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancelled Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_rooms_per_booking', 'backend', 'Reports / Rooms Per Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms Per Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_per_booking', 'backend', 'Reports / Nights Per Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Nights Per Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_bookings', 'backend', 'Reports / Total bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_people', 'backend', 'Reports / Total people stayed', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total people stayed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_nights', 'backend', 'Reports / Total nights booked', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total nights booked', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_1', 'arrays', 'Reports / 1 Night Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '1 Night Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_2', 'arrays', 'Reports / 2 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '2 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_3', 'arrays', 'Reports / 3 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '3 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_4', 'arrays', 'Reports / 4 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '4 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_5', 'arrays', 'Reports / 5 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '5 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_6', 'arrays', 'Reports / 6 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '6 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_nights_arr_ARRAY_7', 'arrays', 'Reports / More Than 6 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'More Than 6 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_per_booking', 'backend', 'Reports / Guests Per Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Guests Per Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_only_adults', 'backend', 'Reports / (only adults guest counting)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '(only adults guest counting)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_1', 'arrays', 'Reports / 1 Guest Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '1 Guest Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_2', 'arrays', 'Reports / 2 Guests Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '2 Guests Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_3', 'arrays', 'Reports / 3 Guests Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '3 Guests Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_4', 'arrays', 'Reports / 4 Guests Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '4 Guests Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_5', 'arrays', 'Reports / 5 Guests Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '5 Guests Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_6', 'arrays', 'Reports / 6 Guests Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '6 Guests Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_guests_arr_ARRAY_7', 'arrays', 'Reports / More Than 6 Nights Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'More Than 6 Nights Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_adults_vs_children', 'backend', 'Reports / Adults vs Chidren', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults vs Chidren', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_count', 'backend', 'Reports / Count', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Count', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_adults_guests', 'backend', 'Reports / Adults Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults Guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_children_guests', 'backend', 'Reports / Children Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children Guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnPrint', 'backend', 'Button / Print', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Print', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnGenerate', 'backend', 'Button / Generate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Generate', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_print', 'backend', 'Reports / Print Report', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Print Report', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_adults', 'backend', 'Bookings / Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_children', 'backend', 'Bookings / Children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_limit_select_room', 'backend', 'Bookings / Select room type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select room type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_select_date', 'backend', 'Bookings / Select date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK20', 'arrays', 'error_titles_ARRAY_ABK20', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No rooms found and availability calendar is not available.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK20', 'arrays', 'error_bodies_ARRAY_ABK20', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You need to have at least one room type added before you can see availability calendar. Click <a href=\"index.php?controller=pjAdminRooms&action=pjActionCreate\">here</a> and follow the instructions to add a new room type.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK21', 'arrays', 'error_titles_ARRAY_ABK21', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms Availability Calendar', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK21', 'arrays', 'error_bodies_ARRAY_ABK21', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use the calendar below to easily see room availability. Use the date picker to quickly jump to a specific date or scroll back and forth using the navigation controls. Click on a booking to view it and use the \"Print\" button to print the whole calendar.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_legend_pending', 'backend', 'Bookings / Legend: Pending Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Pending Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_legend_confirmed', 'backend', 'Bookings / Legend: Confirmed Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmed Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuCalendar', 'backend', 'Menu Calendar', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Calendar', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_statuses_ARRAY_not_confirmed', 'arrays', 'Bookings / Booking status \'not_confirmed\'', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Not confirmed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_stay', 'backend', 'Bookings / Stay', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Stay', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_id', 'backend', 'Bookings / ID', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'ID', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_search', 'frontend', 'Frontend / Search', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Search', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_extra_note', 'backend', 'Bookings / Extras note', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No extras found.<br>Click <a href=\"index.php?controller=pjAdminExtras&amp;action=pjActionCreate\">here</a> and follow the instructions to add an extra.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_numbers', 'backend', 'Rooms / Room numbers', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room numbers', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_numbers_note', 'backend', 'Rooms / Room numbers (Note)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Enter actual room numbers for all the rooms that you have of this type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_numbers_enter', 'backend', 'Rooms / Room numbers enter', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Enter amount of rooms to set actual room numbers.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_number', 'backend', 'Rooms / Number', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room number', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_pending_time', 'backend', 'Options / Pending time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room pending reservation time (minutes)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_pending_time_desc', 'backend', 'Options / Pending time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set the time while the system will keep as reserved the room assigned to a Pending booking. After the time expires, if booking is not paid meanwhile, the booking status will become \"Not Confirmed\" and rooms will be available to be booked again by other visitors.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuReports', 'backend', 'Menu Reports', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Reports', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_amount', 'backend', 'Reports / Amount', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Amount', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_cancelled', 'backend', 'Reports / Cancelled bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancelled bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_one_room', 'backend', 'Reports / One room bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'One room bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_two_room', 'backend', 'Reports / Two room bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Two room bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_more_room', 'backend', 'Reports / Two+ room bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Two+ room bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_rooms', 'backend', 'Reports / Rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_bookings', 'backend', 'Reports / Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_booking', 'backend', 'Reports / Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_booked', 'backend', 'Reports / Booked', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booked', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_bookings_received', 'backend', 'Reports / Bookings Received', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings Received', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_steps_ARRAY_search', 'arrays', 'Frontend / Step 1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 1 - When and Who', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_steps_ARRAY_rooms', 'arrays', 'Frontend / Step 2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 2 - Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_steps_ARRAY_extras', 'arrays', 'Frontend / Step 3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 3 - Extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_steps_ARRAY_checkout', 'arrays', 'Frontend / Step 4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 4 - Checkout', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_steps_ARRAY_preview', 'arrays', 'Frontend / Step 5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 5 - Preview', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_steps_ARRAY_booking', 'arrays', 'Frontend / Step 6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Step 6 - Finish', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_booking_contact', 'backend', 'Frontend / Booking contact', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'If you have any questions, please contact us.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_booking_success', 'backend', 'Frontend / Booking success', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your reservation has been successfully sent to the administrator.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_booking_uid', 'backend', 'Frontend / Booking success', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your reservation ID is %s.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_theme', 'backend', 'Options / Theme', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Theme', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_theme', 'backend', 'Install / Theme', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Theme', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_select_theme', 'backend', 'Install / Select theme', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select theme', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_add', 'backend', 'Extras / Add Extra', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Extra', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_image', 'backend', 'Rooms / Room image', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Picture', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_add', 'backend', 'Rooms / Add room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_today_arrivals', 'backend', 'Dashboard / Today Arrivals', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Today Arrivals', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_rooms', 'backend', 'Dashboard / Rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_stay', 'backend', 'Dashboard / Stay', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Stay', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_no_bookings', 'backend', 'Dashboard / No bookings found', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No bookings found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_to', 'backend', 'Dashboard / to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_today_departures', 'backend', 'Dashboard / Today Departures', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Today Departures', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_view_all_bookings', 'backend', 'Dashboard / View All Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'View All Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_from', 'backend', 'Dashboard / from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_room_booked_today', 'backend', 'Dashboard / Rooms Booked Today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms Booked Today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_pending_rooms_today', 'backend', 'Dashboard / Pending Rooms Today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Pending Rooms Today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_available_rooms_today', 'backend', 'Dashboard / Available Rooms Today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Available Rooms Today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_available_rooms_type', 'backend', 'Dashboard / AVAILABLE ROOMS BY TYPE', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'AVAILABLE ROOMS BY TYPE', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_guests', 'backend', 'Dashboard / GUESTS', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'GUESTS', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_staying_tonight', 'backend', 'Dashboard / Staying tonight', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Staying tonight', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_adults', 'backend', 'Dashboard / Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_children', 'backend', 'Dashboard / Children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_arriving_today', 'backend', 'Dashboard / Arriving today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arriving today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_leaving_today', 'backend', 'Dashboard / Leaving today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Leaving today', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_view_calendar', 'backend', 'Dashboard / View Calendar', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'View Calendar', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_nights', 'backend', 'Dashboard / nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_night', 'backend', 'Dashboard / night', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_lastest_bookings', 'backend', 'Dashboard / Latest Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Latest Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_id', 'backend', 'Dashboard / ID', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'ID', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_arrival_date', 'backend', 'Bookings / Arrival date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_departure_date', 'backend', 'Bookings / Departure date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Departure date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_arrival_departure', 'backend', 'Booking Search / Arrival / Departure', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival / Departure', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO40', 'arrays', 'error_titles_ARRAY_AO40', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Preview front end', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO40', 'arrays', 'error_bodies_ARRAY_AO40', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Click on the thumbnail below to see available color themes. To put the booking engine on your website go to <a href=\"index.php?controller=pjAdminOptions&action=pjActionInstall\">Install</a> page.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK22', 'arrays', 'error_bodies_ARRAY_ABK22', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You need to select Arrival and Departure dates first.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK22', 'arrays', 'error_titles_ARRAY_ABK22', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'What\'s first?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ART01', 'arrays', 'error_titles_ARRAY_ART01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Generate a report', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ART01', 'arrays', 'error_bodies_ARRAY_ART01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select a date range and click on the GENERATE button to view information about all bookings made for the selected period.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_extras', 'backend', 'Bookings / Extras', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_jump_to', 'backend', 'Bookings / Jump to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Jump to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_filter', 'backend', 'Bookings / Filter', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Filter', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnPrintCalendar', 'backend', 'Button / Print Calendar', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Print Calendar', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'preview_use_theme', 'backend', 'Preview / Use this theme', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use this theme', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'preview_theme_current', 'backend', 'Preview / Currently in use', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Currently in use', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_tab_arrivals', 'backend', 'Dashboard / Tab Arrivals', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrivals', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_tab_departures', 'backend', 'Dashboard / Tab Departures', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Departures', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_tab_latest', 'backend', 'Dashboard / Tab Latest', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Latest', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_tab_upcoming', 'backend', 'Dashboard / Tab Upcoming Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Upcoming Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_tab_past', 'backend', 'Dashboard / Tab Past Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Past Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_no_arrivals', 'backend', 'Dashboard / No arrivals today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No arrivals today.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_no_departures', 'backend', 'Dashboard / No departures today', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No departures today.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU11', 'arrays', 'error_titles_ARRAY_AU11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Users', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU11', 'arrays', 'error_bodies_ARRAY_AU11', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Below you can view system users. Under the Add user tab you can add a new user. To Edit a user just click on the edit icon next to it.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU12', 'arrays', 'error_titles_ARRAY_AU12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add an User', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU12', 'arrays', 'error_bodies_ARRAY_AU12', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Enter role (e.g. admin or editor), email and password for the user. You can also specify the name and phone of the user.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AU13', 'arrays', 'error_titles_ARRAY_AU13', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update an User', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AU13', 'arrays', 'error_bodies_ARRAY_AU13', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update role (e.g. admin or editor), email, password and status of the user. You can also specify the name and phone of the user.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_rooms_extras', 'backend', 'Bookings / Rooms & Extras', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms and extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_arrival_date_time', 'backend', 'Bookings / Arrival date & time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival date / time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_price', 'backend', 'Rooms / Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_amount_tooltip', 'backend', 'Bookings / Amount tooltip', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '{AMOUNT} is the correct amount according to the lastest changes you have made to this reservation. If you wish to update the amount, please click on \'{BUTTON}\' button.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_example_title', 'backend', 'Install / Example', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Example', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_method_2_hint', 'backend', 'Install / Method 2 (hint)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use the following URL which will open your online hotel booking software.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_method_3', 'backend', 'Install / Method 3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Insert a link to your Hotel Booking Software front-end', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_method_3_hint', 'backend', 'Install / Method 3 (Hint)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Copy and paste the code below into your website content and it will open your online hotel booking software.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_method_2', 'backend', 'Install / Method 2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking URL', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_method_1', 'backend', 'Install / Method 1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Embed the software front-end directly into your website', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_method_1_hint', 'backend', 'Install / Method 1 (Hint)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Copy and paste this code into the web page HTML where you wish the Hotel Booking Software front-end to show.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_review', 'backend', 'Install / Review', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Review an example', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_review_hint', 'backend', 'Install / Review (Hint)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'of how to embed the front-end code into your web page', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_request', 'backend', 'Install / Request help', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Request integration help for free', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_request_hint', 'backend', 'Install / Request help (Hint)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We\'ll integrate the Food Ordering System into your website for free.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_contact', 'backend', 'Install / Contact Us', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Contact Us', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_empty', 'backend', 'Rooms / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_empty', 'backend', 'Extras / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no extras set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_empty', 'backend', 'Bookings / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no bookings set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_add_plus', 'backend', 'Bookings / Add booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'users_empty', 'backend', 'Users / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no users set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'users_add', 'backend', 'Users / Add user', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add User', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_empty', 'backend', 'Limits / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no booking limits to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_packages_empty', 'backend', 'Discounts / Packages Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no discount packages to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_free_empty', 'backend', 'Discounts / Free night (Empty)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no free night to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_code_empty', 'backend', 'Discounts / Promo code (Empty)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no promo codes to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_extras_text', 'frontend', 'Frontend / Extras text', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est et excepturi aliquid impedit, reprehenderit soluta obcaecati dolor quasi saepe ducimus tempora perferendis iure totam ratione ipsa eaque cupiditate voluptatum quod, officiis placeat sapiente praesentium delectus. Dolorum quasi voluptate maxime odio ex, molestiae deleniti iusto eos totam ab illo recusandae sint?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_client_add', 'backend', 'Bookings / Add client details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add client details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_AO35', 'arrays', 'error_titles_ARRAY_AO35', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_AO35', 'arrays', 'error_bodies_ARRAY_AO35', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email notifications will be sent to people who make a reservation after reservation form is completed or/and payment is made. If you leave subject field blank no email will be sent. You can use tokens in the email messages to personalize them.
<br /><br /><br />
<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">  
<tbody><tr>    
<td width=\"33%\" valign=\"top\">{Title} - customer title;<br />{FirstName} - customer first name;<br />{LastName} - customer last name; <br />{Phone} - customer phone number; <br />{Email} - customer e-mail address; <br />{ArrivalTime} - arrival time; <br />{Notes} - additional notes; <br />{Company} - company; <br />{Address} - address; <br />{City} - city; <br />{State} - state;</td>
<td width=\"33%\" valign=\"top\">{Zip} - zip code; <br />{Country} - country; <br />{BookingID} - Booking ID; <br />{DateFrom} - Booking start date; <br />{DateTo} - Booking end date; <br />{Rooms} - selected rooms; <br />{Extras} - selected room extras;<br />{CCType} - CC type; <br />{CCNum} - CC number; <br />{CCExpMonth} - CC exp.month; <br />{CCExpYear} - CC exp.year;</td>
<td width=\"33%\" valign=\"top\">{CCSec} - CC sec. code; <br />{PaymentMethod} - selected payment method; <br />{Deposit} - Deposit amount; <br />{SecurityDeposit} - Security deposit amount; <br />{Tax} - Tax amount; <br />{Total} - Total amount; <br />{RoomPrice} - Room(s) price; <br />{ExtraPrice} - Rooms extras price; <br />{Discount} - Discount amount; <br />{CancelURL} - Link for booking cancellation;</td>
</tr></tbody></table>', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK16', 'arrays', 'error_titles_ARRAY_ABK16', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK16', 'arrays', 'error_bodies_ARRAY_ABK16', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Below you can find out all the bookings and their statuses. Use the Add Booking button to create a booking. To Edit a booking just click on the edit icon.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_link', 'backend', 'Install / Link', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Link', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_example_tab_1', 'backend', 'Install / Example Tab 1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'JavaScript', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_example_tab_2', 'backend', 'Install / Example Tab 2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'URL', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_example_tab_3', 'backend', 'Install / Example Tab 3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Link', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_rooms_select', 'frontend', 'Frontend / Select number of rooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select number of rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_rooms_accommodate_text', 'frontend', 'Frontend / Rooms accommodate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You\'ve selected room(s) for {XA} {ADULTS} and {XC} {CHILDREN}.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_status_hint', 'backend', 'Bookings / Status (Hint)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking status depends on the deposit payment status for the reservation. If deposit is paid status become \"Confirmed\". New bookings which have not been paid instantly, have status \"Pending\" by default. The system will keep as reserved the rooms assigned to a pending booking. After pending reservation time expires, bookings which haven\'t been paid yet become with a status \"Not confirmed\". Rooms assigned to a not confirmed booking are available to be booked by other customers. You can manage booking statuses at Options menu / Bookings Tab / Options sub-tab.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_view_all_arrivals', 'backend', 'Dashboard / View All Arrivals', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'View All Arrivals', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'dash_view_all_departures', 'backend', 'Dashboard / View All Departures', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'View All Departures', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_close', 'frontend', 'Search / Button close', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Close', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_terms_label', 'frontend', 'Frontend / Terms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_title', 'frontend', 'Frontend / Validate: Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Title is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_fname', 'frontend', 'Frontend / Validate: First Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'First Name is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_lname', 'frontend', 'Frontend / Validate: Last Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Last Name is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_phone', 'frontend', 'Frontend / Validate: Phone', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Phone is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_email', 'frontend', 'Frontend / Validate: Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_notes', 'frontend', 'Frontend / Validate: Requirements', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Additional requirements are required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_company', 'frontend', 'Frontend / Validate: Company', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Company name is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_address', 'frontend', 'Frontend / Validate: Address', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_city', 'frontend', 'Frontend / Validate: City', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'City is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_state', 'frontend', 'Frontend / Validate: State', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'County/Region/State is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_zip', 'frontend', 'Frontend / Validate: Zip', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Postcode/Zip is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_country', 'frontend', 'Frontend / Validate: Country', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_email_invalid', 'frontend', 'Frontend / Validate: Email invalid', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Valid email is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_captcha', 'frontend', 'Frontend / Validate: Captcha', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Captcha is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_captcha_remote', 'frontend', 'Frontend / Validate: Captcha remote', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Captcha doesn\'t match', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_terms', 'frontend', 'Frontend / Validate: Terms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please confirm that you\'ve read and agree to the Booking Conditions', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_arrival', 'frontend', 'Frontend / Validate: Arrival Time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival Time is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_payment', 'frontend', 'Frontend / Validate: Payment method', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment method is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_cc_num', 'frontend', 'Frontend / Validate: CC Number', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Number is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_cc_code', 'frontend', 'Frontend / Validate: CC Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Code is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_cc_type', 'frontend', 'Frontend / Validate: CC Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Type is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_cc_exp_month', 'frontend', 'Frontend / Validate: CC Exp. month', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Expire month is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_cc_exp_year', 'frontend', 'Frontend / Validate: CC Exp. year', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'CC Expire year is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_promo', 'frontend', 'Frontend / Validate: Promo code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_date_from', 'frontend', 'Frontend / Validate: Check-in date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check-in date is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_date_to', 'frontend', 'Frontend / Validate: Check-out date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check-out date is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_adults', 'frontend', 'Frontend / Validate: Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_start_new_booking', 'backend', 'Frontend / Start new reservation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'start new reservation', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuRestrictions', 'backend', 'Menu Unavailable', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_rooms', 'backend', 'Restrictions / Room(s)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Room(s)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_date_from', 'backend', 'Restrictions / Date from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_date_to', 'backend', 'Restrictions / Date to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_type', 'backend', 'Restrictions / Type', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_types_ARRAY_unavailable', 'arrays', 'Restrictions / Types (Unavailable)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_types_ARRAY_web', 'arrays', 'Restrictions / Types (Stop from Web)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Stop from Web', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_types_ARRAY_external', 'arrays', 'Restrictions / Types (External Booking)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'External Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_add', 'backend', 'Restrictions / + Add Unavailable', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_empty', 'backend', 'Restrictions / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no unavailable rooms set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_update', 'backend', 'Restrictions / Update Unavailable', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update Unavailable', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ART10', 'arrays', 'error_titles_ARRAY_ART10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set unavailable rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ART10', 'arrays', 'error_bodies_ARRAY_ART10', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Here you can set selected rooms as unavailable for a predefined period of time. There are 3 different statuses that you can choose from to mark the reason for a room being unavailable. \"External booking\" - set a room with that status if it\'s booked via another channel (OTA). \"Stop from web\" - rooms with this status will not be available for booking via the hotel booking engine front end. You, being administrator, will still be able to make bookings via the back-end. \"Unavailable\" - set this status if room is unavailable for any other reason - for example renovation or maintenance. Rooms with \"Unavailable\" status won\'t be available for booking both through the front-end and the back-end.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_legend_unavailable', 'backend', 'Bookings / Legend: Unavailable', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_restrictions_ARRAY_unavailable', 'arrays', 'Bookings / Restrictions (Unavailable)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_restrictions_ARRAY_web', 'arrays', 'Bookings / Restrictions (Stop from Web)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Stop from Web', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_restrictions_ARRAY_external', 'arrays', 'Bookings / Restrictions (External Booking)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'External Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'calendar_out_of_order', 'backend', 'Calendar / Out of order', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Out of order', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_accommodation', 'backend', 'Frontend / Accommodation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This room accommodates:', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_no_rooms', 'backend', 'Bookings / No room available', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No room available', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_0', 'arrays', 'short_days_ARRAY_0', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Su', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_1', 'arrays', 'short_days_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Mo', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_2', 'arrays', 'short_days_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_3', 'arrays', 'short_days_ARRAY_3', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_4', 'arrays', 'short_days_ARRAY_4', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Th', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_5', 'arrays', 'short_days_ARRAY_5', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Fr', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'short_days_ARRAY_6', 'arrays', 'short_days_ARRAY_6', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sa', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_mail', 'arrays', 'enum_arr_ARRAY_mail', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'PHP mail()', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_smtp', 'arrays', 'enum_arr_ARRAY_smtp', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMTP', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_confirmed', 'arrays', 'enum_arr_ARRAY_confirmed', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_pending', 'arrays', 'enum_arr_ARRAY_pending', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Pending', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_cancelled', 'arrays', 'enum_arr_ARRAY_cancelled', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancelled', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_Yes', 'arrays', 'enum_arr_ARRAY_Yes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Yes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_No', 'arrays', 'enum_arr_ARRAY_No', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_0', 'arrays', 'enum_arr_ARRAY_0', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_1', 'arrays', 'enum_arr_ARRAY_1', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Yes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_2', 'arrays', 'enum_arr_ARRAY_2', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Yes (required)', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_required_field', 'frontend', 'Label / This field is required.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This field is required.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblBookingDeposit', 'backend', 'Label / Booking deposit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking deposit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblSecurityDeposit', 'backend', 'Label / Security deposit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Security deposit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_email_invalid', 'frontend', 'Label / Email is invalid.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email is invalid.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_captcha_incorrect', 'frontend', 'Label / Captcha is incorrect.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Captcha is incorrect.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_captcha_minlength', 'frontend', 'Label / Please enter at least 6 characters.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter at least 6 characters.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_ok', 'frontend', 'Button / OK', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'OK', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'more_prices', 'backend', 'Label / More prices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'More prices', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_based_on_adults_children', 'backend', 'Label / Price based on adults & children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price based on adults & children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_enter_price', 'backend', 'Label / Enter price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Enter price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNoData', 'backend', 'Label / There is no data.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no data.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNoRoomMessage', 'backend', 'Label / No room message', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No rooms found. Click {STAG}here{ETAG} to add one.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblFieldRequired', 'backend', 'Label / This field is required.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This field is required.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblEmailInvalid', 'backend', 'Label / Email is invalid.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email is invalid.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblPreviousWeek', 'backend', 'Label / Previous week', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Previous week', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblPreviousDate', 'backend', 'Label / Previous date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Previous date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNextDate', 'backend', 'Label / Next date', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Next date', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNextWeek', 'backend', 'Label / Next week', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Next week', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridActionEmpty', 'backend', 'Grid / No records selected', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'No records selected', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'gridActionEmptyBody', 'backend', 'Grid / You need to select at least a single record', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You need to select at least a single record.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblCheckAll', 'backend', 'Label / Check all', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check all', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblUnCheckAll', 'backend', 'Label / Uncheck all', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Uncheck all', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_130', 'backend', 'Label / Restriction has not been added.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Restriction has not been added because there are some existing booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_131', 'backend', 'Label / Restriction has not been updated.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Restriction has not been updated because there are some existing booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblRestrictionNotAdded', 'backend', 'Label / Restriction not added', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Restriction not added', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblRestrictionNotUpdated', 'backend', 'Label / Restriction not updated', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Restriction not updated', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_update', 'backend', 'Label / Update limit', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update limit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNightsValidation', 'backend', 'Label / Max nights cannot be less than min nights.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max nights cannot be less than min nights.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_min_booking_nights', 'frontend', 'Label / Minimum booking nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Minimum booking nights are %u.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_max_booking_nights', 'frontend', 'Label / Maximum booking nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Maximum booking nights are %u.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_time_format', 'backend', 'Options / Time format', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Time format', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_days', 'arrays', 'enum_arr_ARRAY_days', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Days', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'enum_arr_ARRAY_nights', 'arrays', 'enum_arr_ARRAY_nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_max_occupancy', 'backend', 'Label / Max occupancy', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Max occupancy', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_accommodation_up_to_guests', 'backend', 'Frontend / Accommodation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This room accommodates up to {MAX} guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_accommodation_up_to_guest', 'backend', 'Frontend / Accommodation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This room accommodates up to 1 guest', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_max_occupancy_message', 'backend', 'Frontend / Accommodation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Summary of adults and children should not exceed maximum occupancy.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_existing_client', 'backend', 'Label / Existing client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Existing client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_hint', 'backend', 'Label / Search by First name, Last name, Phone, and Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Search by First name, Last name, Phone, and Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_language', 'backend', 'Lable / Language', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Language', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_all_languages', 'backend', 'Lable / All languages', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All languages', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_hide_language', 'backend', 'Lable / Hide language selector', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Hide language selector', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_guests', 'frontend', 'Label / Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_guests', 'frontend', 'Frontend / Validate: Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Guests is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_price_from', 'frontend', 'Label / Price from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_132', 'backend', 'Label / Reservations are based on nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Reservations are based on nights, so you cannot select the same date.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_empty_msg', 'backend', 'Bookings / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no bookings set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'rooms_empty_msg', 'backend', 'Rooms / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'limit_empty_msg', 'backend', 'Limits / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no booking limits to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'extra_empty_msg', 'backend', 'Extras / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no extras set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_packages_empty_msg', 'backend', 'Discounts / Packages Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no discount packages to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_code_empty_msg', 'backend', 'Discounts / Promo code (Empty)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no promo codes to any of your room types set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'restriction_empty_msg', 'backend', 'Restrictions / Empty', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There are no unavailable rooms set yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_menu_settings', 'backend', 'Menu / Settings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Settings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_menu_notifications', 'backend', 'Menu / Notifications', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notifications', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_emails', 'backend', 'Label / Emails', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Emails', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_sms', 'backend', 'Label / SMS', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMS', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_notifications', 'backend', 'Label / Notifications', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notifications', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_send_this_notifications', 'backend', 'Label / Send this notification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send this notification', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_subject', 'backend', 'Label / Subject', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Subject', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_message', 'backend', 'Label / Message', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Message', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_change_labels', 'backend', 'Label / Change Labels', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Change Labels', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_menu_payments', 'backend', 'Menu / Payments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoPaymentsTitle', 'backend', 'Infobox / Payment options', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment Options', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoPaymentsDesc', 'backend', 'Infobox / Payments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Here you can choose your payment methods and set payment gateway accounts and payment preferences. Note that for cash payments the system will not be able to collect deposit amount online.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_offline_payment_methods', 'backend', 'Label / Offline Payment Methods', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Offline Payment Methods', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_request_antoher_payment', 'backend', 'Label / Request Another Payment Gateway', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Request Another Payment Gateway', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_online_payment_gateway', 'backend', 'Label / Online payment gateway', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Online payment gateway', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_offline_payment', 'backend', 'Label / Offline payment', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Offline payment', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_email_confirmation', 'arrays', 'Notifications / Client email confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_email_payment', 'arrays', 'Notifications / Client email payment', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send payment confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_email_cancel', 'arrays', 'Notifications / Client email cancel', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send cancellation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_admin_email_confirmation', 'arrays', 'Notifications / Admin email confirmation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_admin_email_payment', 'arrays', 'Notifications / Admin email payment', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send payment confirmation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_admin_email_cancel', 'arrays', 'Notifications / Admin email cancel', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send cancellation email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_email_confirmation', 'arrays', 'Notifications / Client email confirmation (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Confirmation email sent to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_email_payment', 'arrays', 'Notifications / Client email payment (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment Confirmation email sent to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_email_cancel', 'arrays', 'Notifications / Client email cancel (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Cancellation email sent to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_admin_email_confirmation', 'arrays', 'Notifications / Admin email confirmation (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'New Booking Received email sent to Admin', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_admin_email_payment', 'arrays', 'Notifications / Admin email payment (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send Payment Confirmation email sent to Admin', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_admin_email_cancel', 'arrays', 'Notifications / Admin email cancel (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send Cancellation email sent to Admin', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_email_confirmation', 'arrays', 'Notifications / Client email confirmation (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This is the email sent to client when they make a new booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_email_payment', 'arrays', 'Notifications / Client email payment (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This is the email sent to client when they make a payment for their booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_email_cancel', 'arrays', 'Notifications / Client email cancel (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This is the email sent to client when they manually cancel their booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_admin_email_confirmation', 'arrays', 'Notifications / Admin email confirmation (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This is the email sent to the administrator when a client makes a new booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_admin_email_payment', 'arrays', 'Notifications / Admin email payment (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This is the email sent to the administrator when a client makes a payment for their booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_admin_email_cancel', 'arrays', 'Notifications / Admin email cancel (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This is the email sent to the administrator when a client manually cancels their booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subject', 'backend', 'Subject', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Subject', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_message', 'backend', 'Message', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Message', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_is_active', 'backend', 'Send this message', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send this message', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_sms_na', 'backend', 'SMS not available', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'SMS notifications are currently not available for your website. See details', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_sms_na_here', 'backend', 'here', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'here', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_send', 'backend', 'Notifications / Send', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_do_not_send', 'backend', 'Notifications / Do not send', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Do not send', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_status', 'backend', 'Notifications / Status', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Status', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_msg_to_client', 'backend', 'Notifications / Messages sent to Clients', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Messages sent to Clients', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_msg_to_admin', 'backend', 'Notifications / Messages sent to Admin', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Messages sent to Admin', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_msg_to_default', 'backend', 'Notifications / Messages sent to Default', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Messages sent', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_main_title', 'backend', 'Notifications', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notifications', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_main_subtitle', 'backend', 'Notifications (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Automated messages are sent both to client and administrator on specific events. Select message type to edit it - enable/disable or just change message text. For SMS notifications you need to enable SMS service. See more <a href=\"https://www.phpjabbers.com/web-sms/\" target=\"_blank\">here</a>.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_recipient', 'backend', 'Notifications / Recipient', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Recipient', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_tokens_note', 'backend', 'Notifications / Tokens (note)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Personalize the message by including any of the available tokens and it will be replaced with corresponding data.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_tokens', 'backend', 'Notifications / Tokens', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Available tokens:', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'recipients_ARRAY_client', 'arrays', 'Recipients / Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'recipients_ARRAY_admin', 'arrays', 'Recipients / Administrator', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Administrator', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'recipient_admin_note', 'backend', 'Recipients / Administrator (note)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Go to <a href=\"index.php?controller=pjBaseUsers&action=pjActionIndex\">Users menu</a> and edit each administrator profile to select if they should receive \"Admin notifications\" or not.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_email_body_text', 'backend', 'Options / Email body text', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '<div class=\"col-xs-12\">
<div><small>{Title} - customer title;</small></div>
<div><small>{Name} - customer name;</small></div>
<div><small>{Phone} - customer phone number;</small></div>
<div><small>{Email} - customer e-mail address;</small></div>
<div><small>{ArrivalTime} - arrival time;</small></div>
<div><small>{Notes} - additional notes;</small></div>
<div><small>{Company} - company;</small></div>
<div><small>{Address} - address;</small></div>
<div><small>{City} - city;</small></div>
<div><small>{State} - state;</small></div>
<div><small>{Zip} - zip code;</small></div>
<div><small>{Country} - country;</small></div>
<div><small>{BookingID} - Booking ID;</small></div>
<div><small>{DateFrom} - Booking start date;</small></div>
<div><small>{DateTo} - Booking end date;</small></div>
<div><small>{Rooms} - selected rooms;</small></div>
<div><small>{Extras} - selected room extras;</small></div>
<div><small>{PaymentMethod} - selected payment method;</small></div>
<div><small>{Deposit} - Deposit amount;</small></div>
<div><small>{SecurityDeposit} - Security deposit amount;</small></div>
<div><small>{Tax} - Tax amount;</small></div>
<div><small>{Total} - Total amount;</small></div>
<div><small>{RoomPrice} - Room(s) price;</small></div>
<div><small>{ExtraPrice} - Rooms extras price;</small></div>
<div><small>{Discount} - Discount amount;</small></div>
<div><small>{CancelURL} - Link for booking cancellation;</small></div>
 </div>', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuNotifications', 'backend', 'Options / Notifications', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notifications', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_status_if_paid_desc', 'backend', 'Options / Set the status for new reservations if payment has been made for it', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set status for new reservations if payment has been made for it.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_status_if_not_paid_desc', 'backend', 'Options / Set the status for new reservations when reservation form is saved', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set status for new reservations when reservation form is saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_price_based_on_desc', 'backend', 'Options / Reservations and prices will be based on', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set the length of time the system will keep a room as reserved when the booking is pending. After the time expires, if the booking hasn\'t been paid meanwhile, the booking status will become \"Not Confirmed\" and the room will be available for other bookings.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_disable_payments_desc', 'backend', 'Options / Check if you want to disable payments and only collect reservation details', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Check if you want to disable payments and collect reservation details only.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_deposit_desc', 'backend', 'Options / Set deposit amount to be collected for each reservation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set deposit amount to be collected for each reservation.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_security_desc', 'backend', 'Options / Set a security deposit payment to be collected with each reservation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'If you do not want the system to collect security deposit, just enter 0.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_tax_desc', 'backend', 'Options / Tax amount to be collected for each reservation', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tax amount to be collected for each reservation.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_personal_field_title', 'backend', 'Options / Personal Info fields', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Personal Info fields', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_personal_field_desc', 'backend', 'Options / Personal Info fields', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Personal details fields.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_address_field_title', 'backend', 'Options / Address fields', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address fields', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_address_field_desc', 'backend', 'Options / Address fields', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address details fields.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_extra_field_title', 'backend', 'Options / Extra fields', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra fields', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_extra_field_desc', 'backend', 'Options / Extra fields', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extra fields.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_title', 'backend', 'Hotel / Prices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set prices', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_desc', 'backend', 'Hotel / Prices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set a default price for each day/night of the week. You can also set different prices based on the number of guests (adults and children) making the reservation. Click on \"Add Seasonal Prices\" to define different seasonal prices for specific periods of the year.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_select_room', 'backend', 'Hotel / Select a Room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Select a Room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_price_default', 'backend', 'Hotel / Default Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Default Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_monday', 'arrays', 'Plugin Hotel / Price plugin / Days - Monday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Monday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_tuesday', 'arrays', 'Plugin Hotel / Price plugin / Days - Tuesday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Tuesday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_wednesday', 'arrays', 'Plugin Hotel / Price plugin / Days - Wednesday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Wednesday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_thursday', 'arrays', 'Plugin Hotel / Price plugin / Days - Thursday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Thursday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_friday', 'arrays', 'Plugin Hotel / Price plugin / Days - Friday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Friday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_saturday', 'arrays', 'Plugin Hotel / Price plugin / Days - Saturday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Saturday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'price_days_ARRAY_sunday', 'arrays', 'Plugin Hotel / Price plugin / Days - Sunday', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Sunday', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_price_adults_children', 'backend', 'Hotel / Special Price Based on Number of Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Special Price Based on Number of Guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_add_price_adults_children', 'backend', 'Hotel / Add Number of Guests Special Price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Number of Guests Special Price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_add_seasonal_price', 'backend', 'Hotel / Add Seasonal Prices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add New Season', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btn_add', 'backend', 'Hotel / Add', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_add_seasonal_price_title', 'backend', 'Hotel / Add seasonal prices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add New Season', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_season_title', 'backend', 'Hotel / Season Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Season Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_date_range_from', 'backend', 'Hotel / Date range from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date range from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_date_range_to', 'backend', 'Hotel / Date range to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Date range to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_adults', 'backend', 'Hotel / Adults', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Adults', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_children', 'backend', 'Hotel / Children', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Children', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_default_season_price', 'backend', 'Hotel / Default Season price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Default Season price', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_price_status_start', 'backend', 'Hotel / Saving start notification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please wait while prices are saved...', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_price_status_end', 'backend', 'Hotel / Saving start notification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prices have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_price_status_fail', 'backend', 'Hotel / Saving start notification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'The season date range overlap with another season.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'advance_search', 'backend', 'Label / Advance Search', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Advance Search', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_arrival', 'backend', 'Label / Arrival', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_departure', 'backend', 'Label / Departure', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Departure', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_time_from', 'backend', 'Label / From', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'From', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_time_to', 'backend', 'Label / To', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'To', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdmin_pjActionIndex', 'backend', 'pjAdmin_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Dashboard', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminAvailability_pjActionIndex', 'backend', 'pjAdminAvailability_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Calendar Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings', 'backend', 'pjAdminBookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings_pjActionIndex', 'backend', 'pjAdminBookings_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings List', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings_pjActionCreate', 'backend', 'pjAdminBookings_pjActionCreate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings_pjActionUpdate', 'backend', 'pjAdminBookings_pjActionUpdate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings_pjActionDeleteBooking', 'backend', 'pjAdminBookings_pjActionDeleteBooking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings_pjActionDeleteBookingBulk', 'backend', 'pjAdminBookings_pjActionDeleteBookingBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delele multiple bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminBookings_pjActionExportBooking', 'backend', 'pjAdminBookings_pjActionExportBooking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Export bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRooms', 'backend', 'pjAdminRooms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRooms_pjActionIndex', 'backend', 'pjAdminRooms_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Rooms List', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRooms_pjActionCreate', 'backend', 'pjAdminRooms_pjActionCreate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRooms_pjActionUpdate', 'backend', 'pjAdminRooms_pjActionUpdate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRooms_pjActionDelete', 'backend', 'pjAdminRooms_pjActionDelete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRooms_pjActionDeleteBulk', 'backend', 'pjAdminRooms_pjActionDeleteBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete mulitple rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRestrictions', 'backend', 'pjAdminRestrictions', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRestrictions_pjActionIndex', 'backend', 'pjAdminRestrictions_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable List', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRestrictions_pjActionCreate', 'backend', 'pjAdminRestrictions_pjActionCreate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add unavailable room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRestrictions_pjActionUpdate', 'backend', 'pjAdminRestrictions_pjActionUpdate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update unavailable room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRestrictions_pjActionDelete', 'backend', 'pjAdminRestrictions_pjActionDelete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single unavailable room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminRestrictions_pjActionDeleteBulk', 'backend', 'pjAdminRestrictions_pjActionDeleteBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple unavailable rooms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminPrices', 'backend', 'pjAdminPrices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prices List', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminPrices_pjActionIndex', 'backend', 'pjAdminPrices_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Prices Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts', 'backend', 'pjAdminDiscounts', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Discounts Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionCodes', 'backend', 'pjAdminDiscounts_pjActionCodes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo codes list', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionAddCode', 'backend', 'pjAdminDiscounts_pjActionAddCode', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionUpdateCode', 'backend', 'pjAdminDiscounts_pjActionUpdateCode', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionDeleteCode', 'backend', 'pjAdminDiscounts_pjActionDeleteCode', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionDeleteCodeBulk', 'backend', 'pjAdminDiscounts_pjActionDeleteCodeBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple promo codes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionPackages', 'backend', 'pjAdminDiscounts_pjActionPackages', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Packages list', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionAddPackage', 'backend', 'pjAdminDiscounts_pjActionAddPackage', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add package', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionUpdatePackage', 'backend', 'pjAdminDiscounts_pjActionUpdatePackage', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update package', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionDeletePackage', 'backend', 'pjAdminDiscounts_pjActionDeletePackage', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single package', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionDeletePackageBulk', 'backend', 'pjAdminDiscounts_pjActionDeletePackageBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple packages', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionFrees', 'backend', 'pjAdminDiscounts_pjActionFrees', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Free night list', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionAddFree', 'backend', 'pjAdminDiscounts_pjActionAddFree', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add free night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionUpdateFree', 'backend', 'pjAdminDiscounts_pjActionUpdateFree', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update free night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionDeleteFree', 'backend', 'pjAdminDiscounts_pjActionDeleteFree', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single free night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminDiscounts_pjActionDeleteFreeBulk', 'backend', 'pjAdminDiscounts_pjActionDeleteFreeBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple free nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminExtras', 'backend', 'pjAdminExtras', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extras Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminExtras_pjActionIndex', 'backend', 'pjAdminExtras_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Extras List', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminExtras_pjActionCreate', 'backend', 'pjAdminExtras_pjActionCreate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add extra', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminExtras_pjActionUpdate', 'backend', 'pjAdminExtras_pjActionUpdate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update extra', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminExtras_pjActionDelete', 'backend', 'pjAdminExtras_pjActionDelete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single extra', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminExtras_pjActionDeleteBulk', 'backend', 'pjAdminExtras_pjActionDeleteBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple extras', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions', 'backend', 'pjAdminOptions', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Options Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionBooking', 'backend', 'pjAdminOptions_pjActionBooking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Settings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionPayments', 'backend', 'pjAdminOptions_pjActionPayments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionBookingForm', 'backend', 'pjAdminOptions_pjActionBookingForm', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Form', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionTerm', 'backend', 'pjAdminOptions_pjActionTerm', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Terms', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionNotifications', 'backend', 'pjAdminOptions_pjActionNotifications', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notifications', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminLimits', 'backend', 'pjAdminLimits', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Limits Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminLimits_pjActionIndex', 'backend', 'pjAdminLimits_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Limits', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminLimits_pjActionCreate', 'backend', 'pjAdminLimits_pjActionCreate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add limit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminLimits_pjActionUpdate', 'backend', 'pjAdminLimits_pjActionUpdate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update limit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminLimits_pjActionDelete', 'backend', 'pjAdminLimits_pjActionDelete', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single limit', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminLimits_pjActionDeleteBulk', 'backend', 'pjAdminLimits_pjActionDeleteBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple limits', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionPreview', 'backend', 'pjAdminOptions_pjActionPreview', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Preview Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminOptions_pjActionInstall', 'backend', 'pjAdminOptions_pjActionInstall', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminReports_pjActionIndex', 'backend', 'pjAdminReports_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Reports Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btn_add_booking', 'backend', 'Button / Add booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_arrival_time', 'backend', 'Bookings / Arrival time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Arrival time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_departure_time', 'backend', 'Bookings / Departure time', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Departure time', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblFieldNumber', 'backend', 'Label / Please enter a valid number.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter a valid number.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_add_room_msg', 'backend', 'Label / Please select room type, adults and room number.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please select room type, adults and room number.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_price_range_from', 'backend', 'Label / Price range from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price range from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_price_range_to', 'backend', 'Label / Price range to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Price range to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_promo_code', 'backend', 'Label / Promo code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Promo code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_created_from', 'backend', 'Label / Booking made from', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking made from', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_search_created_to', 'backend', 'Label / Booking made to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking made to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_title', 'backend', 'Label / Availability', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Availability', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_desc', 'backend', 'Label / Availability desc', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Use the calendar below to easily see room availability. Use the date picker to quickly jump to a specific date or scroll back and forth using the navigation controls. Click on a booking to view it.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_confirmed', 'backend', 'Label / Confirmed', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Confirmed', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_pending', 'backend', 'Label / Pending', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Pending', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_unavailable', 'backend', 'Label / Unavailable', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Unavailable', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_jump_to', 'backend', 'Label / Jump to', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Jump to', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'availability_filter', 'backend', 'Label / Filter', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Filter', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'avail_booking_add', 'backend', 'Label / Add Booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add Booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_name', 'backend', 'Label / Hotel Booking System', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Hotel Booking System', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblChooseTheme', 'backend', 'Label / Choose color theme', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Choose color theme', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_preview_your_website', 'backend', 'Label / Open in new window', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Open in new window', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'script_install_your_website', 'backend', 'Label / Install your website', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install your website', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoInstallTitle', 'backend', 'Infobox / Integration Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Integration Code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoInstallDesc', 'backend', 'Infobox / Integration Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Follow the instructions below to install the script on your website.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoInstallCodeTitle', 'backend', 'Install / Install Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install Code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'payment_methods_ARRAY_paypal', 'arrays', 'payment_methods_ARRAY_paypal', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'PayPal', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_bookings_received', 'backend', 'Button / Total bookings received', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total bookings received', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_guests', 'backend', 'Button / Total Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total Guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_amount', 'backend', 'Button / Total Amount', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total Amount', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_confirmed_bookings', 'backend', 'Button / Total confirmed bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total confirmed bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_confirmed_guests', 'backend', 'Button / Total confirmed guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total confirmed guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_confirmed_nights', 'backend', 'Button / Total confirmed nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total confirmed nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_cancelled_bookings', 'backend', 'Button / Total cancelled bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total cancelled bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_cancelled_guests', 'backend', 'Button / Total cancelled guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total cancelled guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'report_total_cancelled_nights', 'backend', 'Button / Total cancelled nights', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total cancelled nights', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients', 'backend', 'pjAdminClients', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Clients Menu', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients_pjActionCreate', 'backend', 'pjAdminClients_pjActionCreate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add clients', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients_pjActionDeleteClient', 'backend', 'pjAdminClients_pjActionDeleteClient', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete single client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients_pjActionDeleteClientBulk', 'backend', 'pjAdminClients_pjActionDeleteClientBulk', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete multiple clients', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients_pjActionIndex', 'backend', 'pjAdminClients_pjActionIndex', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Clients List', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients_pjActionStatusClient', 'backend', 'pjAdminClients_pjActionStatusClient', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Revert clients status', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminClients_pjActionUpdate', 'backend', 'pjAdminClients_pjActionUpdate', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Edit clients', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_email_account_tokens', 'backend', 'Options / Account tokens', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '<div class=\"col-xs-12\">
<div><small>{Title} - client title;</small></div>
<div><small>{Name} - client name;</small></div>
<div><small>{Phone} - client phone number;</small></div>
<div><small>{Email} - client e-mail address;</small></div>
<div><small>{Password} - client password;</small></div>
<div><small>{Notes} - additional notes;</small></div>
<div><small>{Company} - company;</small></div>
<div><small>{Address} - address;</small></div>
<div><small>{City} - city;</small></div>
<div><small>{State} - state;</small></div>
<div><small>{Zip} - zip code;</small></div>
<div><small>{Country} - country;</small></div>
 </div>
', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_email_forgot', 'arrays', 'Notifications / This message is sent to client when he requests for password recovery.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This message is sent to client when he requests for password recovery.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'menuClients', 'backend', 'Menu Clients', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Clients', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_bf_name', 'backend', 'Options / Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_name', 'backend', 'Bookings / Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Name', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_name', 'frontend', 'Frontend / Validate: Name', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Name is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_email_account', 'arrays', 'Notifications / New client account email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'New client account email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_email_forgot', 'arrays', 'Notifications / Send forgot password email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send forgot password email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_email_account', 'arrays', 'Notifications / New client account email sent to Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'New client account email sent to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_email_account', 'arrays', 'Notifications / This message is sent to the client when new account is created.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This message is sent to the client when new account is created.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_email_forgot', 'arrays', 'Notifications / Send forgot password email to Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send forgot password email to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoClientsTitle', 'backend', 'Infobox / Client list', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client list', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoClientsDesc', 'backend', 'Infobox / Client list desc', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Below is a list of the people who have used the system to make the bookings. Click on the pencil icon of each row to see and edit client details.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'btnAddClient', 'backend', 'Button / Add client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblBookings', 'backend', 'Label / Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoCreateClientTitle', 'backend', 'Infobox / New client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'New client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoCreateClientDesc', 'backend', 'Infobox / New client desc', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Fill in the form below and \"save\" to create new client.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblTitle', 'backend', 'Label / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Title', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblEmail', 'backend', 'Label / Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblPhone', 'backend', 'Label / Phone', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Phone', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblCompany', 'backend', 'Label / Company', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Company', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblAddress', 'backend', 'Label / Address', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblCity', 'backend', 'Label / City', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'City', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblState', 'backend', 'Label / State', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'State', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblZip', 'backend', 'Label / Zip', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Zip', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblCountry', 'backend', 'Label / Country', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Country', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNotes', 'backend', 'Label / Notes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ACL01', 'arrays', 'error_titles_ARRAY_ACL01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client updated!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ACL03', 'arrays', 'error_titles_ARRAY_ACL03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client added!', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ACL04', 'arrays', 'error_titles_ARRAY_ACL04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ACL08', 'arrays', 'error_titles_ARRAY_ACL08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client not found.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ACL01', 'arrays', 'error_bodies_ARRAY_ACL01', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this client have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ACL03', 'arrays', 'error_bodies_ARRAY_ACL03', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'All the changes made to this client have been saved.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ACL04', 'arrays', 'error_bodies_ARRAY_ACL04', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'We are sorry, but the client has not been added.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ACL08', 'arrays', 'error_bodies_ARRAY_ACL08', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client your looking for is missing.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblClientTotalBookings', 'backend', 'Label / Total Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Total Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblClientLastBooking', 'backend', 'Label / Last booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Last booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoUpdateClientTitle', 'backend', 'Infobox / Update Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'infoUpdateClientDesc', 'backend', 'Infobox / Update Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You can make any changes on the form below and click \"Save\" button to update client information.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblClient', 'backend', 'Label / Client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblNewClient', 'backend', 'Label / New client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'New client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblExistingClient', 'backend', 'Label / Existing client', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Existing client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_address', 'backend', 'Bookings / Address Line', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Address', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_login', 'frontend', 'Button / Login', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Login', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_logout', 'frontend', 'Button / Logout', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Logout', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_profile', 'frontend', 'Button / Profile', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Profile', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_login', 'frontend', 'Label / Login', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Login', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_email', 'frontend', 'Label / Email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_password', 'frontend', 'Label / Password', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_validate_password', 'frontend', 'Frontend / Validate: Password', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password is required', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_forgot_password', 'frontend', 'Label / Forgot password?', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Forgot password?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_c_password', 'backend', 'Bookings / Password', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Password', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_profile_notes', 'frontend', 'Profile / Notes', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Notes', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_profile', 'frontend', 'Profile / Profile', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Profile', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_save', 'frontend', 'Frontend / Save', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Save', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_update_profile_msg', 'frontend', 'Profile / Your profile has been updated.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your profile has been updated.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_btn_send', 'frontend', 'Frontend / Send', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'forgot_messages_ARRAY_100', 'arrays', 'forgot_messages_ARRAY_100', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is no such account in the system.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'forgot_messages_ARRAY_101', 'arrays', 'forgot_messages_ARRAY_101', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Your account is not active yet.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'forgot_messages_ARRAY_200', 'arrays', 'forgot_messages_ARRAY_200', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'The password was sent to your mail box.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_sms_confirmation', 'arrays', 'Notifications / Booking confirmation sms', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking confirmation SMS', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_admin_sms_payment', 'arrays', 'Notifications / Payment confirmation SMS', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment confirmation SMS', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_sms_confirmation', 'arrays', 'Notifications / Client sms confirmation (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking Confirmation SMS to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_sms_confirmation', 'arrays', 'Notifications / Client sms confirmation (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This SMS is sent to client when a booking is made.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_admin_sms_payment', 'arrays', 'Notifications / Admin sms confirmation (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Payment Confirmation SMS to Admin', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_admin_sms_payment', 'arrays', 'Notifications / Client sms confirmation (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This SMS is sent to administrator when a payment is made for a new booking.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'payment_methods_ARRAY_cash', 'arrays', 'payment_methods_ARRAY_cash', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cash', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'payment_methods_ARRAY_bank', 'arrays', 'payment_methods_ARRAY_bank', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Bank account', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_ARRAY_client_email_extra_payments', 'arrays', 'Notifications / Send additional payments email', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Send additional payment email', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_titles_ARRAY_client_email_extra_payments', 'arrays', 'Notifications / Client additional payments email (title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Additional Payments email sent to Client', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_subtitles_ARRAY_client_email_extra_payments', 'arrays', 'Notifications / Client additional payments email (sub-title)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'This email will be sent to client to pay for Additional payments.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_email_extra_payments_tokens', 'backend', 'Options / Additional payments tokens', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', '<div class=\"col-xs-12\">
<div><small>{PaymentTitle} - Payment title;</small></div>
<div><small>{PaymentDescription} - Payment description;</small></div>
<div><small>{PaymentAmount} - Payment amount;</small></div>
<div><small>{PaymentURL} - URL to the page to make payment</small></div>
<div><small>{Title} - client title;</small></div>
<div><small>{Name} - client name;</small></div>
<div><small>{Phone} - client phone number;</small></div>
<div><small>{Email} - client e-mail address;</small></div>
<div><small>{Notes} - additional notes;</small></div>
<div><small>{Company} - company;</small></div>
<div><small>{Address} - address;</small></div>
<div><small>{City} - city;</small></div>
<div><small>{State} - state;</small></div>
<div><small>{Zip} - zip code;</small></div>
<div><small>{Country} - country;</small></div>
 </div>', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_tab_install_code', 'backend', 'Install / Install Code', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Install Code', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_tab_additional', 'backend', 'Install / Additional', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Additional', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'system_133', 'backend', 'Label / You already made a booking with this email in our system. Please try to login.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You already made a booking with this email in our system. Please try to login.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_for_extra_payments', 'backend', 'Install / Additional payments', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Additional Payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_for_extra_payments_info', 'backend', 'Install / Additional payments info', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Copy the code below and put it on your web page. It will show the front end for  Additional payments.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_page_url', 'backend', 'Install / Page URL', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Page URL', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_for_extra_payments_text', 'backend', 'Install / Additional payments text', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter the URL that you will put the install code for Additional payments.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_for_cancellation', 'backend', 'Install / Cancel Bookings', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Cancel Bookings', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_for_cancellation_info', 'backend', 'Install / Cancellation info', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Copy the code below and put it on your web page. It will show the front end for cancelling bookings.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'install_for_cancellation_text', 'backend', 'Install / Cancellation text', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter the URL that you will put the install code for cancelling bookings.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_thankyou_page_label', 'backend', 'Options / \"Thank you\" page location', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'URL for the web page where your clients will be redirected after making online payments', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_delete_booking_room_title', 'backend', 'Label / Delete booking room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete booking room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking__delete_booking_room_text', 'backend', 'Label / Delete booking room desc', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Are you sure that you want to delete this room?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'booking_room_add_title', 'backend', 'Labe / Add booking room', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Add booking room', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_count_note', 'backend', 'Rooms / Lorem ipsum dolor sit amet', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set number of rooms of this type', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'room_max_occupancy_note', 'backend', 'Rooms / Lorem ipsum dolor sit amet', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Maximum number of guests the room can accomodate', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_default_info', 'backend', 'Rooms / Lorem ipsum dolor sit amet', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Default price. Lorem ipsum dolor sit amet13', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_season_info', 'backend', 'Rooms / Lorem ipsum dolor sit amet', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Default season price. Lorem ipsum dolor sit amet14', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_set_prices_for', 'backend', 'Rooms / Set different prices', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set different price for each day of the week', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_number_of_guests_info', 'backend', 'Rooms / Special Price Based on Number of Guests', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'You can add different price based on number of guests that room accommodates. Add as many adults & children combinations as you have.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_single_price', 'backend', 'Rooms / Single price', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Default price per night', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_set_prices_based_on', 'backend', 'Rooms / Set different prices based on', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set different prices based on number of guests', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_delete_seasonal_price_title', 'backend', 'Prices / Delete season', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Delete season', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_delete_seasonal_price_desc', 'backend', 'Prices / Delete season', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Do you really want to delete this season price?', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblLatestBooking', 'backend', 'Label / Latest booking', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Latest booking', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_invalid_input', 'backend', 'Label / The price value cannot be greater than 9999999.99', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'The price value cannot be greater than 9999999.99', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_invalid_price', 'backend', 'Label / Please enter a valid price.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter a valid price.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_price_status_duplicate', 'backend', 'Hotel / Saving start notification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Duplicated session prices.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'front_existing_email', 'frontend', 'Search / Title', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'There is client account for your email address. {STAG}Login{ETAG}.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'discount_invalid_input', 'backend', 'Label / The discount value cannot be greater than 9999999.99', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'The discount value cannot be greater than 9999999.99', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblFieldDigits', 'backend', 'Label / Please enter valid value.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Please enter valid value.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'pjAdminPrices_pjActionSave', 'backend', 'pjAdminPrices_pjActionSave', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Update Prices', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'prices_duplicated_special_prices', 'backend', 'Hotel / Saving start notification', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Special prices are duplicated.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'notifications_sms_na_desc', 'backend', 'Label / To use SMS notification, please add you SMS key', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'To use SMS notification, please add you SMS key', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'lblDuplicateBookingUUID', 'backend', 'Label / Duplicated Unique ID.', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Duplicated Unique ID.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK17', 'arrays', 'error_titles_ARRAY_ABK17', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking failed to add.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK17', 'arrays', 'error_bodies_ARRAY_ABK17', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Duplicated Unique ID.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_titles_ARRAY_ABK18', 'arrays', 'error_titles_ARRAY_ABK18', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Booking failed to update.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'error_bodies_ARRAY_ABK18', 'arrays', 'error_bodies_ARRAY_ABK18', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Duplicated Unique ID.', 'script');

INSERT INTO `hotel_booking_plugin_base_fields` VALUES (NULL, 'opt_o_allow_pending_time', 'backend', 'Options / Set room pending reservation time (minutes)', 'script', '2015-03-20 11:37:44');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `hotel_booking_plugin_base_multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'Set room pending reservation time (minutes)', 'script');


INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdmin_pjActionIndex');
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminAvailability_pjActionIndex');
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminBookings');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminBookings_pjActionIndex');
  SET @level_2_id := (SELECT LAST_INSERT_ID());
  
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminBookings_pjActionCreate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminBookings_pjActionUpdate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminBookings_pjActionDeleteBooking');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminBookings_pjActionDeleteBookingBulk');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminBookings_pjActionExportBooking');  

INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminRooms');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminRooms_pjActionIndex');
  SET @level_2_id := (SELECT LAST_INSERT_ID());

    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRooms_pjActionCreate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRooms_pjActionUpdate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRooms_pjActionDelete');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRooms_pjActionDeleteBulk');
    
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminRestrictions');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminRestrictions_pjActionIndex');
  SET @level_2_id := (SELECT LAST_INSERT_ID());
  
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRestrictions_pjActionCreate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRestrictions_pjActionUpdate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRestrictions_pjActionDelete');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminRestrictions_pjActionDeleteBulk');
 
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminLimits');
SET @level_1_id := (SELECT LAST_INSERT_ID());
    
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminLimits_pjActionIndex');
  SET @level_2_id := (SELECT LAST_INSERT_ID());
  	
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminLimits_pjActionCreate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminLimits_pjActionUpdate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminLimits_pjActionDelete');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminLimits_pjActionDeleteBulk');
    
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminPrices');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminPrices_pjActionIndex');
  
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminDiscounts');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminDiscounts_pjActionCodes');
  SET @level_2_id := (SELECT LAST_INSERT_ID());
  
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionAddCode');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionUpdateCode');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionDeleteCode');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionDeleteCodeBulk');
    
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminDiscounts_pjActionPackages');
  SET @level_2_id := (SELECT LAST_INSERT_ID());
  
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionAddPackage');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionUpdatePackage');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionDeletePackage');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionDeletePackageBulk');
    
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminDiscounts_pjActionFrees');
  SET @level_2_id := (SELECT LAST_INSERT_ID());
  
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionAddFree');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionUpdateFree');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionDeleteFree');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminDiscounts_pjActionDeleteFreeBulk');
    
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminExtras');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminExtras_pjActionIndex');
  SET @level_2_id := (SELECT LAST_INSERT_ID());

    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminExtras_pjActionCreate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminExtras_pjActionUpdate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminExtras_pjActionDelete');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminExtras_pjActionDeleteBulk');

INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminOptions');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminOptions_pjActionBooking'); 
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminOptions_pjActionPayments');
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminOptions_pjActionBookingForm'); 
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminOptions_pjActionTerm');
  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminOptions_pjActionNotifications');
  
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminOptions_pjActionPreview');
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminOptions_pjActionInstall');
INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminReports_pjActionIndex');


INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, NULL, 'pjAdminClients');
SET @level_1_id := (SELECT LAST_INSERT_ID());

  INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_1_id, 'pjAdminClients_pjActionIndex');
  SET @level_2_id := (SELECT LAST_INSERT_ID());

    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminClients_pjActionCreate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminClients_pjActionUpdate');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminClients_pjActionDeleteClient');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminClients_pjActionDeleteClientBulk');
    INSERT INTO `hotel_booking_plugin_auth_permissions` (`id`, `parent_id`, `key`) VALUES (NULL, @level_2_id, 'pjAdminClients_pjActionStatusClient');

SET @level_1_id := (SELECT `id` FROM `hotel_booking_plugin_auth_permissions` WHERE `key` = 'pjAdminRooms');
UPDATE `hotel_booking_plugin_auth_permissions` SET `parent_id`=@level_1_id WHERE `key`='pjAdminRestrictions';
UPDATE `hotel_booking_plugin_auth_permissions` SET `parent_id`=@level_1_id WHERE `key`='pjAdminPrices';

UPDATE `hotel_booking_plugin_auth_permissions` SET `key`='pjAdminPrices_pjActionSave' WHERE `key`='pjAdminPrices_pjActionIndex';
UPDATE `hotel_booking_plugin_auth_permissions` SET `key`='pjAdminPrices_pjActionIndex' WHERE `key`='pjAdminPrices';


SET @level_1_id := (SELECT `id` FROM `hotel_booking_plugin_auth_permissions` WHERE `key` = 'pjAdminRooms');
UPDATE `hotel_booking_plugin_auth_permissions` SET `parent_id`=@level_1_id WHERE `key`='pjAdminRestrictions_pjActionIndex';
UPDATE `hotel_booking_plugin_auth_permissions` SET `parent_id`=@level_1_id WHERE `key`='pjAdminLimits_pjActionIndex';

DELETE FROM `hotel_booking_plugin_auth_permissions` WHERE `key`='pjAdminRestrictions';
DELETE FROM `hotel_booking_plugin_auth_permissions` WHERE `key`='pjAdminLimits';
