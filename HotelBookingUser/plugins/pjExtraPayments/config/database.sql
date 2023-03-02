
DROP TABLE IF EXISTS `plugin_extra_payments`;
CREATE TABLE IF NOT EXISTS `plugin_extra_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `foreign_id` int(10) unsigned DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL,
  `payment_status` enum('paid','not_paid') DEFAULT NULL,
  `title` VARCHAR (255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_id` (`foreign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `plugin_extra_payments_config`;
CREATE TABLE IF NOT EXISTS `plugin_extra_payments_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `plugin_extra_payments_config` VALUES
(1);

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_add_new', 'backend', 'Plugin / Button / Add new', 'plugin', '2018-10-01 09:56:30');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Add new', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_extra_payments', 'backend', 'Plugin / Label / Additional payments', 'plugin', '2018-10-01 10:08:39');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Additional payments', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_add_new_payment', 'backend', 'Plugin / Label / Add new payment', 'plugin', '2018-10-01 11:09:52');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Add new payment', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_cancel', 'backend', 'Plugin / Button / Cancel', 'plugin', '2018-10-01 11:10:40');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Cancel', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_add', 'backend', 'Plugin / Button / Add', 'plugin', '2018-10-01 11:10:51');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Add', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_amount', 'backend', 'Plugin / Label / Amount', 'plugin', '2018-10-01 11:18:27');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Amount', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_title', 'backend', 'Plugin / Label / Title', 'plugin', '2018-10-01 11:18:40');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Title', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_description', 'backend', 'Plugin / Label / Description', 'plugin', '2018-10-01 11:19:02');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Description', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_status', 'backend', 'Plugin / Label / Status', 'plugin', '2018-10-02 07:29:06');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Status', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_payment_statuses_ARRAY_paid', 'arrays', 'plugin_ep_payment_statuses_ARRAY_paid', 'plugin', '2018-10-02 07:31:00');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Paid', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_payment_statuses_ARRAY_not_paid', 'arrays', 'plugin_ep_payment_statuses_ARRAY_not_paid', 'plugin', '2018-10-02 07:31:19');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Not paid', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_save', 'backend', 'Plugin / Button / Save', 'plugin', '2018-10-02 07:32:28');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Save', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_payment', 'backend', 'Plugin / Label / Payment', 'plugin', '2018-10-02 08:02:25');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Payment', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_send_email', 'backend', 'Plugin / Button / Send Additional Payments Email', 'plugin', '2018-10-08 07:18:50');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Send Additional Payments Email', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_send_payments_email', 'backend', 'Plugin / Label / Send Additional Payments Email', 'plugin', '2018-10-08 07:22:56');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Send Additional Payments Email', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_send', 'backend', 'Plugin / Button / Send', 'plugin', '2018-10-08 07:23:38');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Send', 'plugin');
