<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjExtraPaymentModel extends pjExtraPaymentsAppModel
{
	protected $primaryKey = 'id';

	protected $table = 'plugin_extra_payments';

	protected $schema = array(
		array('name' => 'id', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'foreign_id', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'uuid', 'type' => 'varchar', 'default' => ':NULL'),
	    array('name' => 'client_id', 'type' => 'int', 'default' => ':NULL'),
	    array('name' => 'locale_id', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'amount', 'type' => 'decimal', 'default' => ':NULL'),
		array('name' => 'payment_status', 'type' => 'enum', 'default' => ':NULL'),
		array('name' => 'title', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'description', 'type' => 'varchar', 'default' => ':NULL'),
	    array('name' => 'created', 'type' => 'datetime', 'default' => 'NOW()')
	);

    public static function factory($attr=array())
    {
        return new pjExtraPaymentModel($attr);
    }
}
?>