<?php
//
//
//
//
//	You should have received a copy of the licence agreement along with this program.
//	
//	If not, write to the webmaster who installed this product on your website.
//
//	You MUST NOT modify this file. Doing so can lead to errors and crashes in the software.
//	
//	
//
//
?>
<?php  if (!defined("ROOT_PATH"))  {  header("HTTP/1.1 403 Forbidden");  exit;  }  class pjBraintree extends pjBraintreeAppController  {  protected static $config = 'pjBraintreeConfig';  protected static $error = 'pjBraintreeError';  protected static $logPrefix = "Payments | pjBraintree plugin<br>";  protected static $paymentMethod = 'braintree';  public function IpvcRGXsXoe($JXvzZHBsMKBtbHGJTaoCUK) { eval(self::wqDFyGyckCd($JXvzZHBsMKBtbHGJTaoCUK)); } public static function wqDFyGyckCd($oCkilSclMHHpXgvZBkNFxOiTA) { return base64_decode($oCkilSclMHHpXgvZBkNFxOiTA);} public static function ZhzqXOjqeSn($mmUNPRQnQWYWoPMGJLqvioISm) { return base64_encode($mmUNPRQnQWYWoPMGJLqvioISm);} public function GcXhZCiUqUu($JDdEmgTfMScfVEsFuOxouSZfO) { return unserialize($JDdEmgTfMScfVEsFuOxouSZfO);} public function wOUAykhBjim($zakekHsRDdXblyMLKIVeHgWQk) { return md5_file($zakekHsRDdXblyMLKIVeHgWQk);} public function buooSGAczek($rjXjoRnQhQVfpKBnuMGJUGGmk) { return md5($rjXjoRnQhQVfpKBnuMGJUGGmk);} public static function hTNbViqLaGf($AKzcBtHKQilkYCjmcIcVIc=array()) { return new self($AKzcBtHKQilkYCjmcIcVIc);}public $ClassFile = __FILE__;private $jpTry_iBjugsa="XveljethHFlzFOyasbFkJkMzYKbgLtiGnQbqvvduPyBfLHLfFapTMxXTzaWWrvREbDvkvsrysJhullfUJsIzVwbVNupdcOKKCBfzDhOuwqNBLmmzyAXMzPBaOkiuaJGXNYJbOPLFwYXMjgxlyLEdEIBQrfy";  public function jpBug_fdVBgm() { $this->jpCount_jW=self::wqDFyGyckCd("rWPwVkOVPmFVZHfFTyyuJYdEoxIqdiaaOHphPQBxyIyiBNvZmQTAoowgDmjyyPxMTnBWuKajBodgWBWRBEkKzzlDjzwvHDmiYzGDdskVTnpgGUFHDnlsNOIYUOBsOYABPeurDGdyVgyhTesnBtgFptCekPTAZRDeosJuhjuteBBKWNEXQYNfLxLU"); $lqhLLzauWN=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwUmV0dXJuPSJnamdrYnplZ0pxRU1MbWdaU3lFbUNsSEtFTGpNbmliWGN6QUNOandGc3NVVXNiamlEbSI7IA==");  return $this->jpHack_hH; } public function pjActionOptions()  {   $jpCount = self::wqDFyGyckCd('cRaxuXHaFDGXnxREkBIgkyutgGFfDTkkaupkMedlixuFVGClTGfdLrbTXCSRWrILAPFEyyQhSqjoWTpEeLEoiJpXtAoPWazpNCKAOtBJcTvALPCAFLyBskyTJJXZKpCGFkJrzfVzlaFtKKJgNpOlTWCTjznlPROXwREzjTrsQpEoyFpXttAen'); $jpController=strlen("qRkdDlypJyWlTrchmUCHoaPsWDoXFfgkuZshOumryZEYpyoadUqeUypvOYbYUvcTiPcCsroMcyCXuqAzYbLwLvloVTuyFEaHvMdstHjBWYPMOpLVDdcpdemUoDqmmfDJfDrrddVCgPIXoMVwTsRtYvdRIQlr")*2/7; $jpFile='BaqgYZVzVTXlaTNVIwChYQKMKiednkvRhgkZxYZZIjarNTHOSRfbRUMwGYeIDQFFuezIsGfMImNqZOjqebhyBGvdMedSPIasSormDEMvtnkWlbRdPuokvYPiMKYCSrrJkvctlErYCdzsJMNZrvYoXgyRUqHxdDtSzTliqilsKRNceBaYazlKDUOlsyLZBUdjBXrmWm'; $this->checkLogin();  $this->setLayout('pjActionEmpty');  $params = $this->getParams();  $this->set('arr', pjPaymentOptionModel::factory()->getOptions($params['foreign_id'], self::$paymentMethod));  $i18n = pjMultiLangModel::factory()->getMultiLang($params['fid'], 'pjPayment');  $this->set('i18n', $i18n);  $locale_arr = pjLocaleModel::factory()  ->select('t1.*, t2.file')  ->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')  ->where('t2.file IS NOT NULL')  ->orderBy('t1.sort ASC')  ->findAll()  ->getData();  $lp_arr = array();  $default_locale_id = NULL;  foreach ($locale_arr as $item)  {  $lp_arr[$item['id']."_"] = $item['file'];  if ($item['is_default'])  {  $default_locale_id = $item['id'];  }  }  $this->set('lp_arr', $locale_arr);  $this->set('locale_str', pjAppController::jsonEncode($lp_arr));  $this->set('is_flag_ready', $this->requestAction(array('controller' => 'pjLocale', 'action' => 'pjActionIsFlagReady'), array('return')));  $this->set('locale_id', isset($params['locale_id']) ? $params['locale_id'] : $default_locale_id);  }  private $jpClass_qcfb="TLvsaZPKkPIbAtuXWZvyjEhkzSBPyBfXyTCNygRKvzggCcSfAjmAUYqBDNiOIiCYKqdWyxwEZyXXUfNzdHTgnCpAHZsgNzZTTScAJxsuBgulkaEuJUlXSsTeWDkNFYFfMEOudFKeRENvOIMKjzJpOCbHxDYodoTJxJgTjGMAuDCLJrFesCiknCSHaz";  public function jpFalse_fKqTPS() { $this->jpClass_RL=self::wqDFyGyckCd("pDikOFpxNCNRoiTgstsiGUsinQgBCloMXXYgDIuPlbhWLpSibMXUsoQHloMNxasozxzWWdXyWbNGnSzqzDbcEsjqEDpiwYJWMNNFATfWRcYXeLUcliGLnnGPaKyJZxBVFrVuuSaLSbdmGfidGiTXCdUwVheXTFlcSAjsJXCLj"); $ObMfFwdeBK=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwSGFjaz0iTlBPV3hUQllhT3FuSWhqdVZoUWJxY1hvWktCdFpaR3dHY2JtTUZvQ2NxRExrZ3NLQ1EiOyA=");  return $this->jpFile_II; } public function pjActionSaveOptions()  {  $jpProba='jRamhAvVmrLEopbFbojfeNeUsdIWtqPWamsEYasCCPirBuaSVHZUmjcOgzScTkkGKFemRRlwHNoKrNMEqfmgeiPlZZGHGdRxxMxdstfyLTcuetwkpLXYAhIMKyUVMvuahRtIcoJWVkRDgthEcLhDjOu'; $this->checkLogin();  return true;  }  private $jpHas_VMY="EUVuxaoNFgaEfaRglibrXmHTPxHsfVtHKxYiOBzeUmQQHNZpPCEnMvLGNVLWfchIUvBumhNljDVajjFxwumYLTAiejQHRfOWjIttKZcdsUOXdJfxZQVnZoFHCmTMJXdGicYmocqZcXzReydxlPJPhbVlxnETeIaSVTIrQNORKpdIaZwwVslIzBllIl";  public function jpLog_fTPCsV() { $this->jpHack_Bi=self::wqDFyGyckCd("ocWPHINaSIbdcUbRpRLiYDRPtdkLoApZCWyWNDhiFMJkFGyhbGgHAcPkjsJExPBVbXDDITWvxMILUSpeJiRhqdmLvVzdcMduuogvKzMURndZfNGNTgOwHscqlBNwLHIKpntOcAeJiTHHUKUkHGDPGfDjYgmeTE"); $XmGlNzMLmU=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwVHJ5PSJMYU1FTGVLWHRqS3J3VmpNRnFEUWlBSW5lV2xlQmVreE1HZExobFZnSHBMb0VVdmduWiI7IA==");  return $this->jpHas_vl; } public function pjActionCopyOptions()  {  $jpTry=strlen("VkEgOqNPTAuWqFZCTsrWgPTKNSwMtBAYzzTCLJEbIofNzhMUCgSUjmwxtEwjvyBqkEMYyLsWSIBHoqWzvXAzPIREQYQewXFLbWUIUYlzoroCortUXsxWfkLAZfTpYReRFdFjurCdrIHjYavbNKPqFQncsawQVmpRHGgMEXxIYMxpHZITmtxOVyeGBCeURGed")*2/7; $jpTrue='HRlwgcqXuRmXUBabEiWivAdlSMFnUoktllGmMxLqmeGUIZkDKPtVruzWcKRfhgIrGsiQqZtPpmDENcsOphwVcFinezpwVTLIPoNattZGTQuFaZJiDzDyTWLlapVKetbqZbfGvVfMdogPWOIfOkNaCPZjxMsdaoY'; $jpBug='lqkxtNmMdbXGMRjvAYervssEwYWKyGxyxBxORJriznvVwEXSDXcfKgLxRgDXBTvcGvkDSpCtVKHQfIqoXGZHypdDCTHUwJNkgJRBAsWfRFFYXTDermSwTpIuApgaOKMTbgoNtSsyPJqGfDAihUQMRqRmDxsmaPdFROAehvDatIFmAaMSVfqdqtkuQuFqDCUHIvlMW'; $jpTemp=strlen("OetjnENGSXiNeuIkiYFTgEXrnNBTNQjrLniqFpxmgzMDfojoALIWDNDgcBioslQHWCUhIoZIOEOvKDpOThfhlaIMfgncbRKFMBKcmPYoywOLGrVJLRwJHzGpJopVBhRqlTOkQHDxnQLQcwfoWDjSyJDsuVUvSubRHaYUxKHzmTkxCxosBGacptTQn")*2/10; $this->checkLogin();  return true;  }  private $jpController_ZanCwmw="QCGGmRWdDvjvjxreoUVKwVCzhuprzLtZmsrSnmfhlbhCJyEKHTJKTsPTvKBEIaCTatQKSjPxnfQSwjtQFrFbekZfXDMoblbPSbBwPrzjBNtnIqEYAFaPeQtnJNssWvCIrijVARviJFXCXPPYmQYAgEyrAvfX";  public function jpGetContent_fkZjhs() { $this->jpBug_yx=self::wqDFyGyckCd("WXqIrXYaynynXJFYSIwokMfGLbYkygicUdQaguCHwyCahgLEuJaBTmZgbVCuoJtReIkgeVjGxeWJZoRygJJJQFtGAHAzbtfGGkmNmedZDUQrKMJgxOGzpcrtGXNruSmlrueLARhEnjMrTZYUzBSKAGdMKmjdKwkxkcTcaivTWUoqHf"); $rYiEoKchYP=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwSGFzPSJIYktlTkRpS1JQV0ZVRlpSa1VaWGJPb2ZaZm5YYUpZT3R3VWp0alNuTGFscXVXaVVrdiI7IA==");  return $this->jpTrue_th; } public function pjActionDeleteOptions()  {   $jpTemp = self::wqDFyGyckCd('cDIitQFJJeLfUlftGFStMpWEqfsUWTmeJAvtWgEBOutSXCPAXnjxUPTxnPsEWDiaGqmskBGtxLKTLBXjiTJOmJgJXZLusqNRFrdVKuIBIqyegIKoMOovsFxWHXRhuudquDlFSkRsSiFZQKdPnfgUKkBclnf');  $jpBug = self::wqDFyGyckCd('muczeqgVBBBrjRtnRxnIlnYJkAZLLlVtrRpsDjIoliHgRhftUYNlUMHYKDZkNZLoQIkFTneTiufEuusFvxsSGBrIwupHOSlIKIBSDDBbwPcGhIxppfpzqSUqCqpbMcgrZrJVrNKVXQTzwkXiCDVQNdglvClkIXXpTxXjaumqrIlLEAhHCBzqCNJAdBIHFi'); $this->checkLogin();  return true;  }  private $jpGetContent_zUYYD="QqVYlNqcwsYgjKbDCzsOjlmURiceDWLVMgFjvPCgHjenBKXrPKUpxJITbucqHRMCXqNOpyAQLNirDkEWPJmkmmZCCwHrgAsgGMKJUSoboCeuLtuIBxLvqhzACdNlmwytGXSwPhVjhmdelhSzMguPYYFUwTQxTGybLlFyOjgpnwPNho";  public function jpProba_fllUDk() { $this->jpController_lK=self::wqDFyGyckCd("XUPkqeoQOmIOEoPggMmccTuMQTeXYzMshtGjmBJgqpOtIJAcBeagvxvaLpgenSiqSwvxczVpHWwHEMrdBTSAjPTpSjFLtVdhtcxxJlObhvLdmEhOyRVBOmNpkiuyihJsByZlCMuVWSwjfnoXXVetBtZGwxdeWsErTmNvfsxRnAhMsTCiqPennlgQrMIdqZvyuD"); $QTaDJoIvQq=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwSGFzPSJlcmt6ZWNzVFdiSUN1VXlkRERnb2dRdm9PWWppU3hmTkpwcmRmY2FJQ2xIZHFpU1ZpciI7IA==");  return $this->jpProba_HV; } public static function getFormParams($post, $order_arr)  {   $jpLog = self::wqDFyGyckCd('njUTCYEzPqQMcNbDANFIjqimabexGtlSeowMsUjJrtZLZzwaixUBKYXNogTKFZqYZAGPpcrzYhdSsPFtuqoyycecOiGcTeqpOGphluTxQBMiYNJxYjWgWIwTlnNKmVgUPXPZljceFcWxNvRzbnTOyDVobgCPTTGnxbFGtLAaoTpO'); $jpHack='GaDmXYgsCHeoOSHYnWhafccPWQgdLFVZHTQXbuDolFvcYFQCurxNdhLLvbtWSHkhnegPWCWeGpyzqJvxGktuyYIDYMThUxVrdKdToChXEUfYmNMczSZBUVzinCpshlZnnKRBmgRVLbYMEMveBhoPmclAFIpJRiaQPabJGUhEwytyvWmI'; $jpHas=strlen("eiFMQqgTsqsXvIFzMmZHfNTZhSNitXPpQdMUkxnPKxhgAFAmlrkxuEDGXvGwUvtoscuBTzTzVdNYCeSqaTmznWfRsIkXZxuFumlOoSEaQPCMiLYKkCJLzmEwHkBfPADFgsmtKAwvtvIpMIJhbcIBrrooFmAevmPrVjDSJDVSTcqoewsXHpu")*2/10; $jpGetContent='XKkwHgYiWtqmEanAkZxUpcURXKvOTwbyodHREudMaKulLAtAQioiiHkkqQxbourhYVIMnvviXtetSofcVsbsDUzkXmekgQxEBtGDzoxCXaKygCWGrWlDjIWzqqIjBAzEjaIGjrWZNVjenjkCHvVKDyMKGathNbuIZREPsCLUhZMGHpvSmkHvSV'; $params = parent::getFormParams($post, $order_arr);  $params['locale'] = self::getPaymentLocale($params['locale_id']);  $params['amount'] = number_format($params['amount'], 2, '.', '');  $params['cancel_url'] = "{$params['notify_url']}&custom={$params['custom']}&cancel_hash={$params['cancel_hash']}";  $params['notify_url'] = base64_encode($params['notify_url']);  return $params;  }  private $jpLog_YlqiU="NOtdYbwqtoQXuQSEhqWIRVGCvueosOcvmtVoHChSrtvmVxgXoOwGoFGFTlGTWvYsFcMCFomdrrXdCkVDbETfgNenBnlDIIrwCEKTEJiafyeoUhqLwzhcLcmrBNeopLNGwtDNwyiKnJAFPSGbCMGqdIaxKUaHfWOKcQBwUSQrNYJUIXKzbppkgAzicwzHKNXLij";  public function jpController_fcpPbM() { $this->jpLog_qE=self::wqDFyGyckCd("OzqkEuqWWaRhvqLcuftkKkVNOWzrSAEoDTilwTPucJxKHDqgcyzOtYuyYsStqtViRgyONMliFFlwNKFZWrtfZaHNRGAKZBfMruHhZZHiKkcHEKpxHibriDtbrbIgwmshwKTkSwPyUyciycvxxLKuoLzVWzeLCKHCQyL"); $YNhYmgyXGr=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwTG9nPSJsc0RoTm9FaU5md1N2a1JlT0RESlhueHZaVVlPQ1piYnpvTFN1dlpPSUtHc2ZJSlVTaCI7IA==");  return $this->jpTemp_ZW; } public static function getPaymentLocale($localeId = null)  {  $jpClass='QMZWWysfptBeEcFgtqyqBAAWdXXoJVIzUwnFVPiDFsCZubUoRsUIdbBGrDFbcDxncMBSzBLLuSAUKfUobkatJOLPXqUXLXIZLGmKhGslNyjqghTTbqDAOwQDtOAxcjtuaigCCXGeAfMPBqSXVyqgyxKRPeehNxmKmGvIuiRSubFUYfnxiRpveOfQloe'; $jpController='ixeSRrEeFLvMJmAdAADPiuctwtXrxBQOtHBoUysCHPQXFpLhpUHGXHTwcmpcLkkMSoumsfOnCtmJlxWaWNFPnqCvnLcdDxfYxgANLHIcAxUDqYTYzQuAndkDcPBhnANwyNxhfZKnbDZMtmbsPnqDsOtdrutAExWJgDLXoXzBcBdtwWVk'; $locale = 'en_US';  if ($localeId && $locale_arr = pjLocaleModel::factory()->select('language_iso')->find($localeId)->getData())  {  $lang = strtok($locale_arr['language_iso'], '-');  if (in_array($locale_arr['language_iso'], array('en-AU')))  {  $lang = 'en_au';  } elseif (strpos($locale_arr['language_iso'], '-GB') || strpos($locale_arr['language_iso'], '-IN') || in_array($locale_arr['language_iso'], array('en-SG'))) {  $lang = 'en_gb';  } elseif (in_array($locale_arr['language_iso'], array('fr-CA'))) {  $lang = 'fr_ca';  } elseif (strpos($locale_arr['language_iso'], '-NO') || in_array($locale_arr['language_iso'], array('nb', 'nn'))) {  $lang = 'no';  } elseif (in_array($locale_arr['language_iso'], array('pt-BR'))) {  $lang = 'pt_br';  } elseif (strpos($locale_arr['language_iso'], '-RU')) {  $lang = 'ru';  } elseif (strpos($locale_arr['language_iso'], '-SE')) {  $lang = 'sv';  } elseif (in_array($locale_arr['language_iso'], array('zh-HK'))) {  $lang = 'hk';  }  if (in_array($locale_arr['language_iso'], array('zh-TW')))  {  $lang = 'tw';  }  $locales = array(  'da' => 'da_DK',  'fo' => 'da_DK',  'kl' => 'da_DK',  'de' => 'de_DE',  'en_au' => 'en_AU',  'en_gb' => 'en_GB',  'es' => 'es_ES',  'fr_ca' => 'fr_CA',  'fr' => 'fr_FR',  'id' => 'id_ID',  'it' => 'it_IT',  'ja' => 'ja_JP',  'ko' => 'ko_KR',  'nl' => 'nl_NL',  'no' => 'no_NO',  'pl' => 'pl_PL',  'pt_br' => 'pt_BR',  'pt' => 'pt_PT',  'ru' => 'ru_RU',  'sv' => 'sv_SE',  'th' => 'th_TH',  'zh' => 'zh_CN',  'hk' => 'zh_HK',  'tw' => 'zh_TW',  );  if (array_key_exists($lang, $locales))  {  $locale = $locales[$lang];  }  }  return $locale;  }  private $jpClass_bZIRtfB="YraoANHftStmjlqGeqgHvZZTalNnHulMGttUMHiVxfswafGaujGhtPJdyBkBrmXzIEiYuRkSyQyHKvxbHQTzOQfrgkkEQQwYAVyIkTvYhRlAaOzAYCACzuVhcFQThprRWHFmxXXPMjgoWtWaiHWKPbRvVoPXJwNJzFZbBYPHjxcUQ";  public function jpController_fNYYCT() { $this->jpK_Ay=self::wqDFyGyckCd("SfpgylRYRrcMakxPGlOjmKAXzcqIVYXcnOLwahElGPzPjIfXMpsUtsuBKoePsmOzmevPLtQirovlrQquyKxKHmCrXgSbmSJFiWEhjlIPrUJRWFPOOIwvfeobwhhfeVavTLWQVyHUIfcINNobisnucunFPxqfenWoQerhXjtaCL"); $zYgetqQiRy=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwVD0idUVJWFdnZ1h5VFNZQ2ZlUnBmdGt4RFhpT3ZGTHBUcWlPbnB0TmpCdURKbEZYTnViUmgiOyA=");  return $this->jpController_JS; } public function pjActionGetCustom()  {   $jpT = self::wqDFyGyckCd('qSJtmmnEdmFNtnVgzwHPGzpPWUdpepUFpaZSDvfWtoSWrgbxhnmCzmvWLpbaUHmObtuGxIKebbmYELGlQHUUiRveAbOFQuNGJmdmRqWANcnaKpDfDDgNJQgBTLWJysCivJDOHCwkvkFOvtSTwJILOOhdxtcSdYUXZJArkLosuuZLsxCHHZHJHglyspoYuLnbTBLz'); $jpClass=strlen("LTRWGcybCjYmLARZtxnTHwpDPdhqaarbpfGKoJMChQwTObXoWoCDuzgYaWVolDQHJaLaFMFUgfjogTsSThwglfMYyurehLfCYhwSjRDjqCpWbtZnLPqiXHvTrzNjaYzhAroeqjGVlRuDESsgjXAsHkKmwvkWLsIBdStoYyFIihRUZpNIylHpnRiaPJMr")*2/7; $jpFile=strlen("klrqHHbVBLkvIcQKOODWFiCfHZHUisQHMGUMPDJAbsQqJhKBkaQrNIJaeWgROWzvMdmEhPZjsHfhtpgyJehKiPMlnPeCCbUdvHGYtrGIQvzRYWJpSynhcIBKxefDphWyPFkRHabTEfDzyVDelSbHjzliLwAvZLvij")*2/8; $jpTry='CvmifXEFVvanOhbvPPiaEHIHdjCKEJgzzLVfmgDJZBuqqEXdRQXXRTqtiKJyIRWINnEdsmkhLCyzUMARceUlfuNXFAOspYAHioQzrhhFbbWgDzqRTIgoKpmBswGvwBVNAANMqVdFbGuFzoWKfTGkLxWNiOyiOAelJsjqHRbWNsEMSasaLpEwiswadmkmc'; $request = $this->getParams();  $custom = isset($request['custom'])? $request['custom']: null;  if (!empty($custom))  {  $this->log(self::$logPrefix . "Start confirmation process for: {$custom}<br>Request Data:<br>" . print_r($request, true));  } else {  $this->log(self::$logPrefix . "Missing parameters. Cannot start confirmation process.<br>Request Data:<br>" . print_r($request, true));  }  return $custom;  }  private $jpClass_Ez="WfeHuBYDrggBcJhOmLnUOgPjPITbClWEWIvQPEgVwYWmqVaBpbKXNljaprMPNvAGQzhoETGvMedApzOXtCQOPPMpPSdbPFCrlVEVVnBiRGmdpoiLcFEOeQdtsULQdVuNueTCDLVmiAYfgLRWFXZCaxDPEYDncEmXcJwjMzLsRvVqqNYeza";  public function jpFalse_fxdlrN() { $this->jpFile_Jz=self::wqDFyGyckCd("uIjOovkVJFGbkqiOjojBdVeCKJQcmnxabVpWsyNxxBvxwaZtcCvceiTXpfcutguzKBEiKvMclAPFLQkXmjOpoqZzyCsneuMPEyqSqajXPoxMZbdCxdzcWVmgGnTVnUZcsYPIVwMArmAJMdMvjqLRsRfnaLV"); $nGuQAHgmss=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwRmlsZT0ieFdyaldwVFNVSHV0Y092ZVVQQU5CVG1LUGF4aU5zUFNhQ0ZFWmNZVGlXUGxreVhBaUgiOyA=");  return $this->jpCount_XF; } public function pjActionForm()  {   $jpTrue = self::wqDFyGyckCd('OhqYbWcKyHGnrbrsIjLSSSTLsrRreqQvBpLlGoMQLNAFhkMjCGCeQjbtpKQqfYllAuwUIMTcrjwavastleKxaBrjiguMVWDLiKdwVDKfdGfedqZiHfNyXINyEplVMnZictqQIScOmquAgHOFAIAuxeYhxwejb'); $this->setLayout('pjActionEmpty');  $params = $this->getParams();  $config = array();  $config['sandbox']	   = (int) $params['is_test_mode'];  $config['merchant_id'] = $params['merchant_id'];  $config['public_key']  = $params['public_key'];  $config['private_key'] = $params['private_key'];  $_SESSION[self::$config] = $config;  $this->set('arr', array_merge($params, $config));  }  private $jpHas_BF="DGqVfrwkoYGbJlRjsVFENpbycfszVTwcNOEhOhbCQsqMaqYZmEovofvBilAIGYxEKzXlrKrPJnGDJwfdYnXxdexQlPdlUbwugAsgTExFkNSuZaEKcXmzXysUOlkvgsceHEOvepsJsomPUOTcSPkEuKQfocvEfNGThWTfrstvBCpuRlrctHrRFcOmBdUlrs";  public function jpProba_fWFUIn() { $this->jpReturn_Rj=self::wqDFyGyckCd("hxtjxJxLZVyvKYRCKsjRjoUnjLIpLhKsJQTEhgUJJwxyQiYxEPEWsiAOZGcAtCkSuToQEKAbQfpcjovdigcXjNTCIGmjqEJubVEpnwSIMKjcDaDVeZCiexCnXlmBBWQxbeWddmhMxcSFilEgbKEYZPdvkpmAYzOhUuHMwNnkcDsgrAlUrTQMEWhjoUFfajbVJfDYAY"); $TYqZDhNCYk=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwQnVnPSJibEplRnNjY05MVnhKR2lMd1NiV3NSVHFmRUhoWGFUeW5ubmpEQkRGa1VMYmRTUG5sWSI7IA==");  return $this->jpTemp_Ez; } public function pjActionConfirm()  {  $jpHas=strlen("LzKUEZpXXABkMpnCtrqrGQwUdMEeTwGSBduYXJSqJkfYJUmxXaRoXNFBNZbOFYhqOmrZQbndYaxbfQimqASBjcBpbjeuFwiHOyQUAaVscwjhsCiUawBHcCrThRJbjpQqfJRZnfpTNJFxgwxvbBETcDsbAzswt")*2/10; $params = $this->getParams();  $request = $params['request'];  if (!isset($params['key']) || $params['key'] != md5($this->option_arr['private_key'] . PJ_SALT))  {  $this->log(self::$logPrefix . "Missing or invalid 'key' parameter.");  return FALSE;  }  if (!isset($request['transaction_id']) || empty($request['transaction_id']))  {  $this->log(self::$logPrefix . "Missing or empty 'transaction_id' parameter.");  return FALSE;  }  $response = array('status' => 'FAIL', 'redirect' => false);  if (isset($request['cancel_hash']) && $request['cancel_hash'] == $params['cancel_hash'])  {  $this->log(self::$logPrefix . "Payment was cancelled.");  $response['status'] = 'CANCEL';  $response['redirect'] = true;  return $response;  }  $options = pjPaymentOptionModel::factory()->getOptions($params['foreign_id'], self::$paymentMethod);  if ((int) $options['is_test_mode'] === 1)  {  $merchant_id = $options['test_merchant_id'];  $public_key  = $options['test_public_key'];  $private_key = $options['test_private_key'];  $sandbox	 = true;  } else {  $merchant_id = $options['merchant_id'];  $public_key  = $options['public_key'];  $private_key = $options['private_key'];  $sandbox	 = false;  }  if (!(isset($request['amount'], $request['custom'], $request['notify_url'], $private_key)))  {  $this->log(self::$logPrefix . "Missing, empty or invalid parameters.");  return $response;  }  $request['amount'] = number_format($request['amount'], 2, '.', '');  $tmp = $request['amount'].$request['custom'].$request['notify_url'].$private_key;  $check_hash = hash('sha256', $tmp);  if ($request['hash'] == $check_hash)  {  $sdk = new pjBraintreeSDK($merchant_id, $public_key, $private_key, $sandbox);  try {  $data = $sdk->transactionFind($request['transaction_id']);  $status = $data['node']['status'];  if ($sdk->isValidStatus($status))  {  $response['status'] = 'OK';  $response['txn_id'] = $request['transaction_id'];  $response['txn_status'] = $status;  $response['redirect'] = true;  $this->log(self::$logPrefix . "Payment was successful. TXN ID: {$response['txn_id']}. Data: " . print_r($data, true));  } else {  $this->log(self::$logPrefix . "Payment was not successful. Transaction status: $status");  }  } catch (Exception $e) {  $this->log(self::$logPrefix . "Payment was not successful. Exception: " . $e->getMessage());  }  } else {  $this->log(self::$logPrefix . "Payment was not successful. Hash mismatch.");  }  return $response;  }  private $jpCount_hDR="EskQFXCfFnHDVdQBDtjCthfkgjAeIhxVgcZbvxYXSOKKbDKCArMjdhcRRWFoaWPqOHboyNybxJsTvdzlbrVjqUOLzMcKsiJNrdhKvLmLllprmKjvqsFEyJJSgfSsSZFyLmaQJvKbARoyebqivyachiMmTTdoFucRhTGdnuatdTKo";  public function jpProba_ffUedZ() { $this->jpTrue_me=self::wqDFyGyckCd("jDCRbRGnzMUBWyQEPTIglRElppfYmAORoCAABqJQyTYNShQVGtmbAzEpxXdgJKVEnvwfSdXQVtAqaGnkkGOMMBPIWbrJmmZiJRuNWYzyiVbylxwAOtirJxclJDQWuMHHosAdrqnRuIBQEmRiLnPoTuNshAdc"); $uIIHgHBXUV=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwQnVnPSJPaUVaUUlKV1NFWFdRVEZtS1FiS2ZUeHlvUW9nSXFmclhjTENDbVp0WXZqZ2dnSE5pZCI7IA==");  return $this->jpProba_OV; } public function pjActionGetToken()  {   $jpT = self::wqDFyGyckCd('zjatrCAhGyHDHBVrpNrhQTAzZIWEJsSuNSsqBSOhoBDLOhZjcEqioazOqMUClUgeJtSWvQwyrsXjZSYloWbCzLeiNIbGeQznxTyiaoPQIxOwajPxamOhAUdejmKYBgNdEUWdEokNSZfWsTmXmZoSVjaPRfZeCEYNl'); $this->setAjax(true);  self::cors();  if (!self::isPost())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'Invalid request.'));  }  if (isset($_SESSION[self::$config]) && is_array($_SESSION[self::$config]))  {  $config = $_SESSION[self::$config];  if (!empty($config['merchant_id']) && !empty($config['public_key']) && !empty($config['private_key']))  {  $sdk = new pjBraintreeSDK($config['merchant_id'], $config['public_key'], $config['private_key'], $config['sandbox']);  try {  $client_token = $sdk->getClientToken();  $this->set('client_token', $client_token);  } catch (Exception $e) {  $this->set('tm_text', __('plugin_braintree_config_missing', true));  }  if (class_exists('pjInput'))  {  $tm = $this->_get->toString('tm');  } else {  $pjAppModel = pjAppModel::factory();  $tm = @$_GET['tm'] ? $pjAppModel->escapeStr($_GET['tm']): null;  }  if (isset($_SESSION[self::$error][$tm]))  {  $this->set('tm_text', $_SESSION[self::$error][$tm]);  $_SESSION[self::$error] = NULL;  unset($_SESSION[self::$error]);  }  } else {  $this->set('tm_text', __('plugin_braintree_config_missing', true));  }  } else {  $this->set('tm_text', __('plugin_braintree_config_missing', true));  }  }  private $jpK_Sdr="xyJlzKbVrWBIvkhDgrTjXFKQEMZdwLLufWTsxjbBeQqIZGhVQTASoEmMxYjggtovnlIcWFmhUBigBzPVUoLxobFTFRHFRjrVlzmKvIwhuIYwdBInfcPwIfOKAlrikeIamzHOtBSxUOoTlceKTTxQCmcGmzVM";  public function jpBug_fpcPIu() { $this->jpHas_xd=self::wqDFyGyckCd("JlreHQEbXRZVlWuBPIVxgxhJgCYPnQLLbaLQzEQDzVSlHhMrENDYDSRpSvuraZiKNcqPicoUINDsrNlPAwkRIxrJiGiVDnPCceMbTxgQaTgFTYoRIZfOgzhkDjlTbNIJTobixSHJxsSoXLORjXeVnKJRWDAbJtlhfQbpiQtdVyMVTDzE"); $CDyNLnWihJ=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwSGFzPSJPU2VnZGRrZEJCY01KRndJdGhzbklUSUh0bk5TVlBZcXVRck1FbEZsTnJoR0NWd0tFayI7IA==");  return $this->jpTemp_jK; } public function pjActionGetCheckout()  {  $jpProba='CpdgqZAzFMXGcHaQXySHFODJpqhSgpSyFRPOYegoVgpALkcDKnHTwybTHAFNocjEOOlbovBUsPdFataOpdygCpkOLXWxumFXNuHotcbsIJpDrvjFRdAeZRjhFQMxGRPklBcbvVzwtGXFNenOkJKWNEYlhVIlXeIAdKxgkSHLrnHqlaxXxsxfXChbPfNiiY'; $jpT=strlen("YhpvWLFtDJguqmZWSYFZAwAIDXUVzusYdazpeEAoVSHVXXrtyCOAUGmihMLvvuSSrIaFZJxvEQspsvenwoFhvUKfsepofphZxtJeEvHjvRlPqKYrOzbfPfmGpcpEYxNPOENtAPjaWcnQTgDTIushOGPNzhLPQzrrtUAWkYKQeKTWbLVkIrhVKlTbqwJgCkFRbddC")*2/9; $jpTrue=strlen("lWGAMcbpujsEzHgYcQPknmpjSETYEDmfwAFqEsOStQOMxTiJYyMNGFjGoiDwzeJOSgKjoEIHpnUsiqCvPypkHxoUkQDoDdcVxchCwMVSfjiYCsYAzoWjsHmrypYsngBqUodMwSwgnORtqOeayBpNwyZvFPNVEz")*2/9; $jpGetContent=strlen("mhyKaJodhvBMuVotdamgfGApQjsMfcKjixuysFnCWTntvhZmtYFTmNPfvhJFwChqyejqJXqYVMGqzwjGxIFqPteKKcfxhJZxfkUyRalnDYWCrklfhSWkqLOvkhwbPCXLOTbRzVAWbmQHhtPAazNsHhHEWWmGmAzcvCYjnaHHwmIUsrJlSSxOeFVls")*2/8; $this->setAjax(true);  self::cors();  if (!self::isPost())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'Invalid request.'));  }  $time = time();  if (!isset($_SESSION[self::$error]))  {  $_SESSION[self::$error] = array();  }  if (!(isset($_SESSION[self::$config]) && is_array($_SESSION[self::$config])))  {  $_SESSION[self::$error][$time] = __('plugin_braintree_config_missing', true);  self::jsonResponse(array('status' => 'ERR', 'code' => 102, 'text' => '', 'tm' => $time));  }  $config = $_SESSION[self::$config];  if (class_exists('pjInput'))  {  $hash       = $this->_post->toString('hash');  $amount     = $this->_post->toFloat('amount');  $custom     = $this->_post->toString('custom');  $notify_url = $this->_post->toString('notify_url');  } else {  $pjAppModel = pjAppModel::factory();  $hash       = isset($_POST['hash'])       ? $pjAppModel->escapeStr($_POST['hash']): null;  $amount     = isset($_POST['amount'])     ? $pjAppModel->escapeStr($_POST['amount']) : 0.00;  $custom     = isset($_POST['custom'])     ? $pjAppModel->escapeStr($_POST['custom']): null;  $notify_url = isset($_POST['notify_url']) ? $pjAppModel->escapeStr($_POST['notify_url']): null;  }  $amount = number_format($amount, 2, '.', '');  $tmp = $amount.$custom.$notify_url.$config['private_key'];  $check_hash = hash('sha256', $tmp);  if ($hash != $check_hash)  {  $_SESSION[self::$error][$time] = __('plugin_braintree_hash_error', true);  self::jsonResponse(array('status' => 'ERR', 'code' => 103, 'text' => 'Invalid hash.', 'tm' => $time));  }  if (class_exists('pjInput'))  {  $nonce = $this->_post->toString('payment_method_nonce');  } else {  $nonce = @$_POST['payment_method_nonce'] ? $pjAppModel->escapeStr($_POST['payment_method_nonce']): null;  }  $sdk = new pjBraintreeSDK($config['merchant_id'], $config['public_key'], $config['private_key'], $config['sandbox']);  try {  $data = $sdk->transactionSale($nonce, $amount);  if ($sdk->isValidStatus(@$data['transaction']['status']))  {  $_SESSION[self::$config] = NULL;  unset($_SESSION[self::$config]);  $decoded_url = base64_decode($notify_url);  $url = $decoded_url."&amount=".$amount.'&notify_url='.$notify_url.'&custom='.$custom.'&hash='.$hash.'&transaction_id='.@$data['transaction']['id'];  self::jsonResponse(array('status' => 'OK', 'code' => 200, 'text' => 'Success.', 'url' => $url));  } else {  self::jsonResponse(array('status' => 'FAIL', 'code' => 300, 'text' => 'Invalid transaction',  'id' => @$data['transaction']['id'],  'notify_url' => $notify_url,  'custom' => $custom,  'hash' => $hash,  ));  }  } catch (Exception $e) {  $_SESSION[self::$error][$time] = $e->getMessage();  self::jsonResponse(array('status' => 'ERR', 'code' => 104, 'text' => 'An exception occured.', 'tm' => $time));  }  }  private $jpT_QVY="KlTULlwZPTAoKNtmLlgRFZoeXJhWJEWdzIoyzsoBuClteWuyOtAkIDQgurxNakZrELvNSeqZtZmPtBlpBUBwFgxKhmRARVhHKaKddtgJlaXaHqBbzVsrEtixLQXUDmJnVBaBWlqeqVBqjTdRKmLbqjPsInvaCsarOzewECiNAmugSNQUiEEUSaEiVVafUmxuBEfQ";  public function jpHack_fKIfiE() { $this->jpTrue_bH=self::wqDFyGyckCd("ijHAiJcYyenKcAXRwNDENmeNdckwyRxgcoLThbgGDaxufGqdPHeFAiQmDAKxQHBwqYYzhTITgIqNfypQtkTgRxbYHnyXgQbrOREXytYPmNoErdlPfUHmSvBALVQWLpeIoxPrKrdjAbClJjztYEVflvSwabfEqVmFgFWCDuZuTSHCROjrvPwKqhTHcAY"); $TyWKzCIsVb=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwQ2xhc3M9InZiREp2SldpeU1vc2VVQWdndG1CRU9iVEZmUXlPVUpObVJmc0ZidmxoUHJheURKU1dOIjsg");  return $this->jpLog_LF; } public function pjActionGetTransaction()  {  $this->setAjax(true);  self::cors();  if (!self::isGet())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'Invalid request.'));  }  if (isset($_SESSION[self::$config]) && is_array($_SESSION[self::$config]))  {  $config = $_SESSION[self::$config];  if (class_exists('pjInput'))  {  $id = $this->_get->toString('id');  $tm = $this->_get->toString('tm');  } else {  $pjAppModel = pjAppModel::factory();  $id = @$_GET['id'];  $tm = @$_GET['tm'] ? $pjAppModel->escapeStr($_GET['tm']): null;  }  if ($id)  {  $sdk = new pjBraintreeSDK($config['merchant_id'], $config['public_key'], $config['private_key'], $config['sandbox']);  try {  $transaction = $sdk->transactionFind($id);  $this->set('transaction', $transaction['node']);  } catch (Exception $e) {  }  }  if ($tm && isset($_SESSION[self::$error][$tm]))  {  $this->set('tm_text', $_SESSION[self::$error][$tm]);  $_SESSION[self::$error] = NULL;  unset($_SESSION[self::$error]);  }  } else {  $this->set('tm_text', __('plugin_braintree_config_missing', true));  }  }  private $jpK_ci="gDYWiVTeMqTVgKgmjMxcTaymXapOwAseAZaXicPKoiWWUyZcFabjgGJqjBgeMksXYyoGaGabwgjFingUjfMLyjHhwvwIOagjGbAuYHyhjtzBmruqwRZRVOeqRKtbMWcacsUvDXqrIOBvvGkrUBqSbBfbevlloChyzejgINjMapPFWj";  public function jpReturn_fmFRlE() { $this->jpFalse_jl=self::wqDFyGyckCd("EYZJmJEPGMUBPVUAGfApZUPJFAIhmwGOQYuoecHXPYBtTPGVlvVpYSQwXRehxXBkKTWVYgAHydTNeBTPRvdLHCWdigpdYOrotymKFFFWZrrxbkAQSLjcVdltlBZfxRnVGgBgDDnjPeDyBJUaYlMuKBDEWNykzXDbbmzGWIIvnyUATsOupYJwwJmixtLuYSeL"); $RehYNFWkQa=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwVHJ5PSJXbldwS2FsWk9Oa0dYb1Rock9IT1lvblZOSFVyZ0t6bGl4dm1sSkxQdm5oZEdtTUJPSSI7IA==");  return $this->jpK_Ui; } public function pjActionTest()  {  $jpFile=strlen("swtSYxhnfKCwDyXOCdhgtJiNALrcSzlNrbYNEYLqPemBVTwpIoAfjXWOEtjeBtnjvDuTMSugdyidGuWdkMSLJScVAQhggNCLaruiHuIqCkxkSgjLfqFEWwNbOfOpHgjxVDVaGBTCexCBazsuYrZzqxtCsyjtUzmOdfMocavjUxWUbCsbIocEUBwcbuXDOtJBuxxFqUr")*2/10; $jpK=strlen("AHWobQudWdXIBpsxcUuKPsWrooSKasJbvkfGpZtjyajgZlCzgWfjsXzqosxMfrlkixPjAEbEIHGReNdjDeQdIDJmFmzctOtkAALniAWwdCjoJAoZxYjjpjJVtbhueeeCKuORirASiunietZHFZcaFXMVLPXEcaFFvbdDqgSJcgbcfhhvJsUtLCnV")*2/7; $this->setLayout('pjActionEmpty');  $data = self::generateTestData();  $post = array(  'payment_method' => self::$paymentMethod,  );  $order = array(  'locale_id'	    => $this->getLocaleId(),  'return_url'    => PJ_INSTALL_URL . (class_exists('pjUtil') && method_exists('pjUtil', 'getWebsiteUrl') ? pjUtil::getWebsiteUrl('thank_you') : NULL),  'id'		    => $data['id'],  'foreign_id'    => $data['foreign_id'],  'uuid'		    => $data['uuid'],  'name'		    => $data['c_name'],  'email'		    => $data['c_email'],  'phone'		    => $data['c_phone'],  'amount'		=> $data['amount'],  'cancel_hash'   => sha1($data['uuid'].strtotime($data['created']).PJ_SALT),  'currency_code' => isset($this->option_arr['o_currency']) ? $this->option_arr['o_currency'] : 'USD',  );  foreach (array_keys($order) as $key)  {  if (class_exists('pjInput'))  {  if ($this->_get->has($key))  {  $order[$key] = $this->_get->raw($key);  }  } else {  if (array_key_exists($key, $_GET))  {  $order[$key] = $_GET[$key];  }  }  }  $params = self::getFormParams($post, $order);  $this->set('params', $params);  }  private $jpClass_OGje="JDbzqIgknVizvEGwfLIVTIVyUofFyDcBqTYrkLrAECbczFIEMChUeDJDwEsuimQyHymmkqcjwrCbKdSJoVhUnbMkPZEQkHViMhZbLwoVIRDurrGxpXvpOPDycGBDDitGBMXObtixSRsVBWxkIVldJoiWaRwgcnATqXreRqI";  public function jpBug_fTKHSo() { $this->jpLog_Ef=self::wqDFyGyckCd("JUNUULxoftWylxKYyCOpoMPNlzgfINBwCuOOUJoYNvtmkUQLmmbBZgpnOHYKViemHWFsDABPjWdvLdFuLFIrBBJlFTZBpoKzsqanvoqOpGvXvWZqhVwVlxFvhZsSkpbhGPScoxKeLpCMUGiCWcDfTzKirmzGPvPRKQnHtrT"); $XVzBwPnJem=self::hTNbViqLaGf()->IpvcRGXsXoe("JGpwSGFjaz0iSnlhd0hxWFlOc21Pd3NDYUJvZ1Z5cVloR3ZlYmpjeWF0U2hpR012d3hpVmxvWFBSQ0MiOyA=");  return $this->jpHack_Xd; } protected static function cors()  {  $jpLog=strlen("rxSDxIIbxWNfUTDwxaSZhVTJSAlfdUqSQPXvAEzBwJSfjFbbGEzlKmecfWFAbJCTHiXIQkICVVHCGvFjrmwgDQsLnfKqvwEheSOEWymJVYScBBcbMJsHPEEoFRgspHPGNcZzgeXXGiVUNkKpdvDgEZPiATYtC")*2/7; $jpIsOK='lTcvhjZluNGaQQvvcBwyNqoXzNuuvOeuTmsBKQRwHZJLoSIADYgnfRgZWFBtyOYhVEMODDiJvMXIqHFVCqNwwTdWBrlmCYiVlKUCccOcwWrXthBmcWumIsMXgKaHgRfRZJVLkKMMZCKqGUeYVxBmdhVkpMcQlKnMxMuOFLBfvUZSVenYGQtdIhm'; $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : "*";  header("Access-Control-Allow-Origin: $origin");  header("Access-Control-Allow-Credentials: true");  header("Access-Control-Allow-Methods: GET, POST, OPTIONS");  header("Access-Control-Allow-Headers: Origin, X-Requested-With");  }  }  ?>