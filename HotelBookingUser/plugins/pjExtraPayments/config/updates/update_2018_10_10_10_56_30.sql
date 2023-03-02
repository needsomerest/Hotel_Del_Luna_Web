
START TRANSACTION;

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_i_description', 'backend', 'Plugin / Description', 'plugin', '2018-10-10 07:22:35');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Description', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_total', 'backend', 'Plugin / Total', 'plugin', '2018-10-10 07:28:21');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Total', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_warning_notification_not_set', 'backend', 'Plugin / Email notification is not set.', 'plugin', '2018-10-10 07:47:16');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Email notification is not set.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_subject', 'backend', 'Plugin / Subject', 'plugin', '2018-10-10 07:49:17');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Subject', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_message', 'backend', 'Plugin / Message', 'plugin', '2018-10-10 07:49:29');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Message', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_send_to', 'backend', 'Plugin / Send to', 'plugin', '2018-10-10 07:50:27');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Send to', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_error_ARRAY_100', 'arrays', 'plugin_ep_error_ARRAY_100', 'plugin', '2018-10-10 09:15:00');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Parameters are missing.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_error_ARRAY_101', 'arrays', 'plugin_ep_error_ARRAY_101', 'plugin', '2018-10-10 09:15:26');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'We could not find out any payments for such booking ID.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_error_ARRAY_102', 'arrays', 'plugin_ep_error_ARRAY_102', 'plugin', '2018-10-10 09:17:29');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'All of payments for this booking were already paid.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_error_ARRAY_103', 'arrays', 'plugin_ep_error_ARRAY_103', 'plugin', '2018-10-10 09:26:46');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Hash value does not match.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_select_payment_method', 'backend', 'Plugin / Select available payment methods to make the payment.', 'plugin', '2018-10-10 09:33:11');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Select available payment methods to make the payment.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_payment_method', 'backend', 'Plugin / Payment method', 'plugin', '2018-10-10 09:44:42');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Payment method', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_field_required', 'backend', 'Plugin / This field is required.', 'plugin', '2018-10-10 09:46:36');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'This field is required.', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_choose', 'backend', 'Plugin / Choose', 'plugin', '2018-10-10 09:46:55');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Choose', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_bank_account', 'backend', 'Plugin / Bank account', 'plugin', '2018-10-10 09:48:38');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Bank account', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_pay', 'backend', 'Plugin / Pay', 'plugin', '2018-10-10 09:49:50');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Pay', 'plugin');

COMMIT;