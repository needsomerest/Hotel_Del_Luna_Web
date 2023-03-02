
START TRANSACTION;

ALTER TABLE `plugin_extra_payments` ADD COLUMN `uuid` varchar(12) DEFAULT NULL AFTER `foreign_id`;

COMMIT;