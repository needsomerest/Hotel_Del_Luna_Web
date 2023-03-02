
START TRANSACTION;

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_delete', 'backend', 'Plugin / Button / Delete', 'plugin', '2018-10-11 09:30:24');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Delete', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_delete_payment_title', 'backend', 'Plugin / Label / Delete payment', 'plugin', '2018-10-11 09:31:24');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Delete payment', 'plugin');

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_delete_payment_text', 'backend', 'Plugin / Label / Delete payment desc', 'plugin', '2018-10-11 09:31:46');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Are you sure that you want to delete this payment record?', 'plugin');

COMMIT;