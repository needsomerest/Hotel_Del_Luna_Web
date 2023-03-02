
START TRANSACTION;

UPDATE `plugin_auth_permissions` SET `key`='pjPayments_pjActionIndex' WHERE `key`='pjAdminOptions_pjActionPayments';
UPDATE `plugin_base_fields` SET `key`='pjPayments_pjActionIndex' WHERE `key`='pjAdminOptions_pjActionPayments';

COMMIT;