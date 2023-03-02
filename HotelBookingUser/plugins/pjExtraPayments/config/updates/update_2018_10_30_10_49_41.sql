
START TRANSACTION;

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_edit_extra_payment', 'backend', 'Plugin / Label / Edit extra payment', 'plugin', '2018-10-23 07:17:59');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Edit extra payment', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_payment_details_url', 'backend', 'Plugin / Label / Payment details URL', 'plugin', '2018-10-23 07:53:15');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Payment details URL', 'plugin');

COMMIT;