
START TRANSACTION;

ALTER TABLE `plugin_extra_payments` ADD COLUMN `created` datetime DEFAULT NULL;

COMMIT;