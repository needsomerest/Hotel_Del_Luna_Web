
START TRANSACTION;

INSERT INTO `plugin_base_fields` VALUES (NULL, 'plugin_ep_btn_add_new_payment', 'backend', 'Plugin / Button / Add new payment', 'plugin', '2018-10-12 09:31:29');
SET @id := (SELECT LAST_INSERT_ID());
INSERT INTO `plugin_base_multi_lang` VALUES (NULL, @id, 'pjBaseField', '::LOCALE::', 'title', 'Add new payment', 'plugin');

COMMIT;