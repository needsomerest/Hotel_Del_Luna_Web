<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjExtraPaymentConfigModel extends pjExtraPaymentsAppModel
{
	protected $primaryKey = 'id';
	
	protected $table = 'plugin_extra_payments_config';
	
	protected $schema = array(
		array('name' => 'id', 'type' => 'int', 'default' => ':NULL'),
	);
	
	protected $i18n = array('template');
	
	public static function factory($attr=array())
	{
	    return new pjExtraPaymentConfigModel($attr);
	}
	
	public function getConfigData($locale_id, $pk=1)
	{
		$arr = $this->find($pk)->getData();
		
		$i18n = pjMultiLangModel::factory()
			->where('t1.model', 'pjExtraPaymentConfig')
			->where('t1.foreign_id', $pk)
			->where('t1.locale', $locale_id)
			->whereIn('t1.field', $this->getI18n())
			->findAll()
			->getDataPair('field', 'content');
		
		return array_merge($arr, $i18n);
	}
}
?>