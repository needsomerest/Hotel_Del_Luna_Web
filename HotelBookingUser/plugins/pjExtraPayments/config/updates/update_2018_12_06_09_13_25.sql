
START TRANSACTION;

SET @id := (SELECT `id` FROM `plugin_base_fields` WHERE `key` = 'plugin_ep_payment');
UPDATE `plugin_base_multi_lang` SET `content` = 'Payment for' WHERE `foreign_id` = @id AND `model` = "pjBaseField" AND `field` = "title";

COMMIT;