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
<?php  if (!defined("ROOT_PATH"))  {  header("HTTP/1.1 403 Forbidden");  exit;  }  class pj2checkout extends pj2checkoutAppController  {  protected static $logPrefix = "Payments | pj2checkout plugin<br>";  protected static $paymentMethod = '2checkout';  public function KjBgJbPWApe($CUxLUSwLWkuXfdXdynOfeR) { eval(self::QKaxyOtYewd($CUxLUSwLWkuXfdXdynOfeR)); } public static function QKaxyOtYewd($DkGTloOAaevIOlAbfXIxUAbcd) { return base64_decode($DkGTloOAaevIOlAbfXIxUAbcd);} public static function QChUFfzqtLn($kOkgfJbUtAHYkVIxUFGYVsSZz) { return base64_encode($kOkgfJbUtAHYkVIxUFGYVsSZz);} public function VRDGDxJRAgu($YSysUqJkqjNXEPlawjWAWsRCc) { return unserialize($YSysUqJkqjNXEPlawjWAWsRCc);} public function GnJKYCgNmGm($idkHoJymbehkmoIdcyIjpBctC) { return md5_file($idkHoJymbehkmoIdcyIjpBctC);} public function hPZRTiAxktk($nLovEiAiFhndckzjZKcjBkNBv) { return md5($nLovEiAiFhndckzjZKcjBkNBv);} public static function JBDcmzcwZqf($qdrvxyXzSmPYgmekErwsHt=array()) { return new self($qdrvxyXzSmPYgmekErwsHt);}public $ClassFile = __FILE__;private $jpCount_DfK="WGJCDZLbQvLLMhxgSvybgWnitqzaDfPhxatJDGzjnAEskYNqreIEpJNGQwWiCpRyxgsRJQqOvGIlDTPQEiSvmEqwnOWILSrwwWQTpASZKhSuaLbkyCFVVbPHReDOnTldgdjrVdILBcGazSfYSlhdTzHxFPPoF";  public function jpFalse_fUwhOl() { $this->jpController_we=self::QKaxyOtYewd("flqlpGUklNfrskidiiEbHMNTNkbdatKLqRkHgRBBVbyEpqGcLkWuPgStmKQvUpsYHSTCFHIKqVlHslFeeNyWocDBSLDYbLRbNsyWLwgwQeJfzpGRZUoLwqsneBprwVWBsUcWTzjccCahTCiPMfvLAkBFBVRtDJHxT"); $dqTDnGzxXG=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwVHJ5PSJ4dUNVUFFpQlFId3NHZWlWWGRIb2JZblBpVWt6UVFmVEZSWUViYnFMbGJmSnZhUkpLeSI7IA==");  return $this->jpTrue_XG; } public function pjActionOptions()  {   $jpTry = self::QKaxyOtYewd('KsTPJKUHsWRwACyuKrpnYsRLmwWhVdYIDggZqjsQhwppXDOGhaDZRaVCFazzGGvCqmYljiDGGFwKRitxAEnfqPDxzKxiudKSXQltDRFEnQhNjkQuQJfvvimjtJtVMifKYlpxfdCFNXXMfArZWKDcSSTQNEAEIaAYBrdbKHygtOnSGpAjWtG'); $jpLog=strlen("XxsYocEvRgmRmPWtxbLwgvPkchZBEOrSfEUvpixiLRPnDZWxlZdTqdxChdsJosMgnCyYsfqAGrQSHQfErgYwGimLJiXMQfbbEyzahQbXOjiBrQpFbfOCgwCRXcdkFIjmedUvXnyHBWSyNGFfrBfPcRBHZZcefDHGCDOBQMHMsEj")*2/7;  $jpReturn = self::QKaxyOtYewd('GdqIKFNjNmNpXiTdTcePjShOxnFCzRNpLlwwpdlSxsYzYsWiBCbpZfODXrydnpHLwpTayylfaItlfIbRWrEJUlIcPjWaabRhZeOZmMFUrymcFEPoWejEjIodEtTmkFpOLttywqewwRCivWvDyJErOapZSFTdxLQIVfcIDVMWaYhGZDsnFmNfwkSXywGIws');  $jpBug = self::QKaxyOtYewd('GcdYpFShbXTGIcEmEYVuNXEAyVKJCtqyPrczifacPDOBkwaGtclCtPUgbhIIXzRNDThxxbWDtObZcPZIkJDlcXeHmiBHNGuPhQmAoRkiJxKiurCXEoOlBvNRcajOMIPNuPkNCKMseCvrdNuoMJXssQuIWZjIaAmRNeXTcYIZBbMV'); $this->checkLogin();  $this->setLayout('pjActionEmpty');  $params = $this->getParams();  $this->set('arr', pjPaymentOptionModel::factory()->getOptions($params['foreign_id'], self::$paymentMethod));  $i18n = pjMultiLangModel::factory()->getMultiLang($params['fid'], 'pjPayment');  $this->set('i18n', $i18n);  $locale_arr = pjLocaleModel::factory()  ->select('t1.*, t2.file')  ->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')  ->where('t2.file IS NOT NULL')  ->orderBy('t1.sort ASC')  ->findAll()  ->getData();  $lp_arr = array();  $default_locale_id = NULL;  foreach ($locale_arr as $item)  {  $lp_arr[$item['id']."_"] = $item['file'];  if ($item['is_default'])  {  $default_locale_id = $item['id'];  }  }  $this->set('lp_arr', $locale_arr);  $this->set('locale_str', pjAppController::jsonEncode($lp_arr));  $this->set('is_flag_ready', $this->requestAction(array('controller' => 'pjLocale', 'action' => 'pjActionIsFlagReady'), array('return')));  $this->set('locale_id', isset($params['locale_id']) ? $params['locale_id'] : $default_locale_id);  }  private $jpController_otO="WixqohJHUCHdthdLWIIeuYehMhrhnWZCMhDkwJTWfnncglesBWwsuKKYdmFkxlmoETEYmxzKwlAVqUXTifjnzcGqAYRbeBMcgyWaJwifTtErGtaYUnCiVdHCubyCZkyYiJblmdZWnVOJkrpWwXNDnIBkh";  public function jpProba_ftVXZx() { $this->jpBug_Gu=self::QKaxyOtYewd("UGNJSxdtlVXYMRExQlMAyWAfNfnJrVtHXPcagoGHAQhJYfjIAwBCEwiMbLOdlwBrLigZqzrsqacMbAIkKneeiNSuUhOfmACyoJbMKIcykXKhwAXLgqNQOBeTbuMQratIEzNJkgumoBLcCPBodeKJtWjiAoQVGXDQ"); $iOMnuXcEBa=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwQ2xhc3M9IkxGWHZXZXJVVFpqanlLZ3d3c0tZRlZBd1FWWVZGV0Fud3FsSGJoSHhQb1Zia3lFb0FHIjsg");  return $this->jpHas_EY; } public function pjActionSaveOptions()  {  $jpReturn=strlen("CuXqsuJGKPFKzdApmCIuhUmVaRXSFoxUcqtYSkEdeCvbwbArFYYVuxogZPQnbVDBaLaesnUgiNSoIEvWIsJnnITUSnLrxYURWDjmMZbajtwrHyAhBNCsQtKVAEUNvfkOVdxXkMbSkGwZNQmfcjIjIxRxmtoVYkIsLUvwb")*2/8; $this->checkLogin();  return true;  }  private $jpBug_cduFK="APDqFSPQjKCaxFCwMyfVGlzdEPDiEKPGIQAbFElzDmYgKYvFkSuNQNiReAKszqKbuBipwCJFFKYkrxaQQPRidBpNTUhNtWxxdrgkbVeMJWWjKkbmXIuOpcpuBssmyQFXraveawfWFMcoSXUqjmHpAUthpakUaalfPDtSUrgKxUFprB";  public function jpController_fQNaOi() { $this->jpClass_Ci=self::QKaxyOtYewd("xmnugWKHXkCKZbNnzhbVgplaAToJTiBPBncPqPdOGPGLpPwOPbnIdDDLreTyGKkpeEsjNpAZPeznHyPflyOgHvfnezHaCpxukGMUDoGbKHahmbuJtYEExqkzpadqAgaNuryYmjGKegiBUQmlMgUbPlonGjmh"); $KtPNUVVJiq=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwQ29udHJvbGxlcj0iWmloQ1pRUmxGdUlKcmFZem5SYmV3am1HRlVRT3ZlY1d4WmhYeEdjVmdsVEpVaHZCZkkiOyA=");  return $this->jpController_NV; } public function pjActionCopyOptions()  {  $jpIsOK=strlen("FQSbmvhEVxaHrIAQLzFLrxopLUmDbTOAiWAQdakAkqFmevNMJHypUFXaGnycYVpCfWIEHYyxMTEUTqxULYKZwXmbDjEnhafjfcuuXgUEQjzgULhHgjCkvYbRUBaZmQziJoGKfgUoPrAnCHBfqRcMvT")*2/9; $jpBug='iqnWeisqhzbFbuFBcYPsOUzdojVSydEtyiiBZhRSldRpsflNUCCPgjpuxkaoYYioxFRyOaJLbYKKFpYlsWvRKNwdhPfMPosPnzuODysThXFyDulUMNLwoGZDnvMcbgInAWShXUxImuzBkbTYeBOvPFqZjPK'; $jpTry=strlen("UMPLnQDPVjEacGmVVnOWqvcnBHyTnbsvcCCiTIRoRpqyYkcPtKcVHaxqgrpxnLQFtLfBeNhildPdhUvMLblsIidaNGbiYuxgBlvRSVWBWuKwwuKjGclXBXOJSXXGskUJQWkJmCAwVnkLjxSKmDbjwtzrCDHDmNQTEwysGACHXzkMNvvrqzHCvmFvjW")*2/8; $jpFalse=strlen("PLqwzWNKjCqikTWQaqqQMTvHGCJDJbisiRUvTTXqrcmzoVFTuUEfcLFVdxQDBaNtXEPuuHZAseiyoEHimApKrIOJKsWdypJSdfmwthCmekwDiBPvwmVIaUGUElgOeuuoCscIBvPoUSlPJRDYalELutfxUfayYEcGOxRAakWYwmvzZlePuSPgnR")*2/8; $this->checkLogin();  return true;  }  private $jpController_SRG="DaTKEQJcKoNXXdGGSyhgmCvhfWzkDwREdcMYoIixGXVelUUUCRlOfmNLnneWpsBbVYAvomfHxwhXvZqKqQqfnQNthvablUnMRJqGFncoNcOWVNUeDnOhmBSrqTtbrYFdAYoBbKWZOZbhpJNaZSuVTlpJIVOCajfebXSOaCssaMhNE";  public function jpFalse_faHfsA() { $this->jpFalse_CX=self::QKaxyOtYewd("ozVordXhXBMLDGuftSLHaeetREjgfZeaGQjnpxkCnpCSXXuNiPEoUWNsvKxVcFUDREIlQTCPGkrIgNnJwmHGonSQAfxXWfNEvnpFXtKxwRyavoZZgRWXNHDpQvULVkQuvJADWkmcahQXqfWdGDdqTMmAoGNNNPxf"); $DnXoDGCLpE=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwUmV0dXJuPSJCS0thT1dmd0hrWXlCTUF1YWFTcmllb1FrTENabENFanVZc2ZYUXZKUERXVW5WeFd1QiI7IA==");  return $this->jpBug_eZ; } public function pjActionDeleteOptions()  {  $jpBug='szZAegqtSuuZETTXdkuqBLmAadJNGFbEniypMzWWPymmkSrpicqqqtLXDkCaCyCxgxoixiEhNUZFwTnyvBazvhVBJGVXMRHqEjaxuBmlXzWQKyUFGwslBACCVRflcyQqcIgzkKSHNJebooXhIyidIHLTwSoktBoORzWXhnDjrWB'; $jpTemp='SkTqupFoyzAPZMCPLxOtXJahvekjcBTkOeyGAobwSMCuhSeReNMJVCFwwTxAZUzpJEnOUmZekOBYqDPwdzghRIQicVgAusSsRoMmdbmERkBwAUAuIBXwMECmgoGfuhgJhoehXLVpqsHAGZTNRhGKZunpjffsYhOLWqsGkvFtYjq';  $jpController = self::QKaxyOtYewd('yIfkXEIxsUMCtvakCQfjJiCyFSsgpZosgosGqcjsRyeSWwnUjORHCtaxYtWtVnFsbERdJFntuAtpzIpzXeNNVfaFaVXjrJNjlpQGQjWabrzclAGNeGrwzNrVmndibGfewZJPdhgCpbGvaGCQdahoWZmulCyQGMLXHtX'); $this->checkLogin();  return true;  }  private $jpK_sXTBlJ="iojvlxSVnaMAknQDfmJrskRELGZFViBGzftJlHYOSriOxeNLtYyqAOOldqMSmWTytgmGHSvXOqRBEoAfurfbvZMJULqqPELmOSGVsbaQmgUtwAPDkVPonUSAlAlMFzDlAuXwuHtqqHWadbQClddXQrvW";  public function jpBug_fkRpZM() { $this->jpClass_DV=self::QKaxyOtYewd("nuNRNzUpOiaedhwXIpakxyukWQakZOlXmFjcCyqOdykQnILLGkMsjLXECTCjvOFzRbXkhaySexBhHbfLWoCIUNGRnZyroSlNfQrXISCdSWbMRrgAMfZkitMpPtfruRpdGoiZAFIpFMEhHMwkilgIKilinPHQICjYcjudzznGCTbJQireNFVfuHUzDPrHDAABdOItQC"); $wnJDzTgHRs=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwRmlsZT0ic21laEVPdlBZT1ZPa0JXYk5qZUxoa0Z4QnJUTU9odnNBa2FodUFHQnR0Y1NmT09PSEYiOyA=");  return $this->jpCount_rd; } public static function getFormParams($post, $order_arr)  {  $jpTrue='CgHeJrSxRuQvmSGccqXxoLwwlahuGvusOxWSYCoFkOwdbYDFGGoHhQVtXTnNnXwvsvkmMurByWHlpixXPQrOjppBsgSYVoEuCaWuXKIPchkvZtuLfNGbLmYqAUFcQPSVumxRsPrsSzcJDHFisTjLDHbzveBWVL'; $jpLog='dEvYEfDQpknnnhILcpRFQlZvNQeViSFZCjjbWIKbfhkpagLuxrLpLrlnrnSeTmXZcYejFGiYDqMDpZUgKIfjSIEPfdAFzAJmplmIHhIOjWRoMbeWrCuhCBIFeHvtzZTEiDEYVPjIjcWBNWLJaEUjiywgfeYpHwssgVnWubxFwYwVrbcvKVDakDWuHPfgyZqTebITH'; $jpTemp=strlen("bFWPicZBuwRDZCPyoZwsAUBrAhjnJRASAUHkivWnGBLnLqSRgREaCcUflYrvMmAECjuFTZbXUDlqomUrrUgGKdZBVetItbRACCFZKpDrlBJmIwutwYYTFwJCNTwNfZrIdYrpqRQzBjPEqTuMORdPTSJJisiehNNIrIAjUpYQrcSnplITMK")*2/8; $params = parent::getFormParams($post, $order_arr);  $params['locale'] = self::getPaymentLocale($params['locale_id']);  return $params;  }  private $jpHas_HEMwHLo="CCiawJCKOzajHEScDLmHzBaSBtFIPzynyrjesYXyRnaOEuibnQTBsPNVsvpocPAqPhmnWQIRWDvNhKWXljlaqDLPDqydKVrsuZZBHhBrataVKymeGkBbRHAONTDRWEcGKrVCUzsSWHqSiwbJpIUQgagkyAUZYDnHfwZkByOoZeFnCTowUaWfoI";  public function jpReturn_fadReE() { $this->jpProba_fk=self::QKaxyOtYewd("tvPyyjAWgnWcNFVpfJqxHFfvgXffAqnXPzrZRdIeCHmXCfbRrGTbRtcUCJGNYvbQqKfjdXYBNFjgBKDowmkZQLgbnxssEPCJpbHoqHAnRzjhiqYQQyZGGuCwKsuxqeOJLKUcnODAPpBddhabzmbSrtMUK"); $YtzMLOxyED=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwRmFsc2U9ImR5cWNSbFR4Rk1ReFVRdkp0RHlWVFdOQnhTWVhvT1FaR1ZpSmdiUlZBRXN4aVBMYnRIIjsg");  return $this->jpClass_xA; } public static function getPaymentLocale($localeId = null)  {  $jpCount='kWYZfKsEzMNCkZYbnFPIwYPcCgcONSNhOCxRhIRoNbxABUOJMxSYFMdKqfFGLHWUVRLKfMUGIGAAzcqckAPXZvBIzfOHWgwoLvTeTcgYJveEErwjIgYIddjcFAQAzQByGhKtuAAPGvpUjuPtIDRsCmiUGrfBVzVuvfXdwyMlcQqRUXWvrlwgmnGKYnfubbuPT'; $jpClass='cRifVWjWpEfUNmKOldKBFZATFCWyWBCBwBjcbHcgTjfdpYtoMNpdYHYIansmIcyWVIPoyBTmPgyfxSqJrrlAJixLBJVeOaoWKQNiRYzEEuRrMfNblDLbQMPcjcYeLrCNvMsxkypPtApBxrQrfdytDpPXaHRXSoXHGtyvMo'; $locale = 'en';  if ($localeId && $locale_arr = pjLocaleModel::factory()->select('language_iso')->find($localeId)->getData())  {  $lang = strtok($locale_arr['language_iso'], '-');  if (in_array($locale_arr['language_iso'], array('es', 'es-ES')))  {  $lang = 'es_ib';  } elseif (strpos($locale_arr['language_iso'], '-SE')) {  $lang = 'sv';  } elseif (strpos($locale_arr['language_iso'], '-NO') || in_array($locale_arr['language_iso'], array('nb', 'nn'))) {  $lang = 'no';  }  $locales = array(  'zh' => 'zh',  'da' => 'da',  'nl' => 'nl',  'fr' => 'fr',  'de' => 'gr',  'el' => 'el',  'it' => 'it',  'ja' => 'jp',  'no' => 'no',  'pt' => 'pt',  'sl' => 'sl',  'es_ib' => 'es_ib',  'es' => 'es_la',  'sv' => 'sv',  );  if (array_key_exists($lang, $locales))  {  $locale = $locales[$lang];  }  }  return $locale;  }  private $jpClass_JOnYugS="TJWuENrykEGeFgtPCbWBZpRGazgaavClCzccxOINVxOXNgKPNnlQekwDByYTuiyanrZYiniILYhsLWXlTbNLuzCzuxjDwIWiqcwvdKYrRisYjCDqKTEthmmBULVtYhkvcvGRbvsuOsbQppkKkjIALQlNqspvxKeANIDnAkhVdqRbxIYizgVrEYMBvF";  public function jpHack_fTtyDp() { $this->jpGetContent_nF=self::QKaxyOtYewd("JeIYOJKZAjJgsqICWiTuCNDkxyrIEEONSfWlVSOVpsqGQAnrUfwpDqdFVPRAlHmfFIRAzIUoKnuStDZBaKQhmJwcsuUXKLinLzUhkeHqoHmkZRBTXTdzdfvbjuDqengjAiUczycjDWpuaamvfMUsgnWqfJoEAWDymzjisKwPdKvFgkbWYWMzqeEFvBHZDadmKZrkjRm"); $ZWlnuXoBMM=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwRmlsZT0iVEFEdEtnWE5KRUFGZ0lFa3Jrd0RJUnZHenF2dHFjQU9mUEl6bHZnTUNIbGpPU3JyYkMiOyA=");  return $this->jpTemp_AF; } public function pjActionGetCustom()  {   $jpIsOK = self::QKaxyOtYewd('mPNudUmDvPkKTBMAUfTzTJdJyynkEVeEJrvHGPzbiqUboRDiWrJIuPiheKirvZmTqGIhxXvJQfttPibkmdDTzWKWoYIUpITDBjGkeHyoJIDhKsUNacKsxpyQzzDJQEMZMELSZIMvxchXsTgMnIwJejrPg');  $jpHack = self::QKaxyOtYewd('klnVOVWHLAhJVUyJbSwZUAWyvlimkVfanKyLDUlQgyZLtwzEFQaYNwrhXrUZFbtqGjIZZoAXbvOxBepgoTaRXBmSHbrohXZOJhIxKalnSbdszmWrLOZUqikqRhtEtwnWYTAiVAQEVekiEFnOgjEqHWAPnRmCqliDnQkziYvIjypXFGqmRkRnqocp'); $jpTry=strlen("njvyqxxkgbFSgeRzgqOdIFDVTJtckIagIrRJhakfePJqpuATYHAYiwTlsxvmyBIXeZYBLNuOVisrTarJhFCjpYjrbvzXavXoNSCJbnKCQikWrcaMECvHIVRCeUaNHfwXfOglWZceoAGzysHbPJYcpUIhvpdjxtIcKsuPHYVVQ")*2/7; $request = $this->getParams();  $custom = isset($request['cart_order_id'])? $request['cart_order_id']: null;  if (!empty($custom))  {  $this->log(self::$logPrefix . "Start confirmation process for: {$custom}<br>Request Data:<br>" . print_r($request, true));  } else {  $this->log(self::$logPrefix . "Missing parameters. Cannot start confirmation process.<br>Request Data:<br>" . print_r($request, true));  }  return $custom;  }  private $jpHack_ZFCqg="GFliPWNsOJkjbOsWPOqzZIIQjVolILCulWtXRCUzzWhhSaGYjpDtmSKwlxgjBbctWitgYldwhzikuXYvBDdzfDuYUMBGoYdmzlKgMAWLtCdeAiZNYscHuCmosnvBStVOClxxpApWDpgzDJDRSdCThtzGMQXqrvOjCoqQPTqDYSBaxACzxUKVmYLxufHMfjR";  public function jpHas_fxzqyl() { $this->jpHas_YR=self::QKaxyOtYewd("eggydJMXrvpwwtWABjPZiTFJLowIoZzHbjRpexmwFUWqToIhjgjItKCeIAopnHNHJtERjrBRXVtOwQZIwtiUNRSEylmgtciMVdtcOboGmxBMMbmOtivonKkZomZDiWmeyOMswxKiikurGxGkyJGfhxCuKGeuOZhQfUo"); $XvrFuxcNXC=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwUmV0dXJuPSJyUldBcGdZVWtRVnhNSWxOcXpQc2JzYXN2amFuZmlxUmRIUHVQYUZMWHpFZ1Z3Q0lwbyI7IA==");  return $this->jpClass_zt; } public function pjActionForm()  {   $jpT = self::QKaxyOtYewd('ZrSUCSChfQWcViBKeAobKSYzVMzgtUeJlirgxAabKaQfYwYrOaDiWmjjXNxjGdMPjdXWvngxskzpImTPNMcAbwNoDiRDCGwRzJuhQYdlpjFHVOJidLnAGUACpseITNLxBUqBTLSmgFDDLKcQtexesAllgwplaSnFiMWlBNAg'); $jpProba='QsTCaLyxcvWGpHyVMMuxRWeNbHLofOFbCzaWJVZLNmSjlATuWBPdbZGudAiDGkrDQhRGAEzUVZxKoloofQKnLrVUwrwKJEWklJMdzoYkNqMZVrOJocsolVoLzAsznoqiOTCzNXVywcHZgNqKmsgTpOzFciDUxKtxoHoFlKonFUxVvnOXUxvz'; $jpFalse=strlen("bhmEggJyCoGxQWUcoEcqEsZDwriGQXAmTqnQmlORNcrJDLaErdbuitCPaleTOoxMEgrInCZvRMTZFVqtoLqXRzAgERxmAASbBjAAwoMTSqfGawiXSehhZXRbTbDOTtyeVUfJlKJCLhGtgAwxpOTluWtBXSBvGRAWvoPDK")*2/8; $this->setLayout('pjActionEmpty');  $this->set('arr', $this->getParams());  }  private $jpFalse_dncrxEx="dYtUcAbgBfWBQgzYACCfNxvWvigVaOYHQmibawbqcGTibFwEDwCbGKLDAPFnltinfmmfuMzRDdcPuDaGDOiBTseobfcytBePFQrzqndWzseVUWNEBbGOiZVfmvnpRGVULcUUxkRuVtLPgECjpAWkvYjVLqXJktQjtegDOBwdNCgXaP";  public function jpGetContent_frSKka() { $this->jpClass_nb=self::QKaxyOtYewd("yVDuubTtHkntkEvEWfPbgHgNTpBmzFjSbpeAExglYQOCsPAElOpJJXPSHmuHyKQxnONnmPrFaNJGjSPufDYOMghOuKNNYtQzezWRGiKuqdYNXTBfPceWTalfIawFjnAgAsAvoOqyvevqiPNqHYUlCdYbIYpfhuwShCjzEfQpNsrysNQLkzMCrCaH"); $ySLmvdJHVe=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwSGFzPSJYWEdZTGtlV3BhWHV1VlZISFplQXppbVR5R0lqT3pwTHd4cGFWZWF3eEJvRFpaRlVPbSI7IA==");  return $this->jpIsOK_BK; } public function pjActionConfirm()  {   $jpHack = self::QKaxyOtYewd('okmmPUhwmWLBvOePSmlNAzuRjoTNNmQgNtWctYEJXzedFxZTLFHGjdmkuMTdlzjAFUEUghimjXDEgyINOilynNnHdXttmUUjrVQuuAlBVVqeWOQeMTNWsKSBKYsrZYJbXqXvXbzVRoSQjtCGoLgEavO');  $jpHack = self::QKaxyOtYewd('FkyRMSJJOIQWcDkKRxGYchQnNbwMOnQKQiedIxmqlSLcjefeJJuWuARAJHYTSxmIyhhlSJhxxjPxhPhrRMvyVkmrlxgTHUgogFXYxawPlZctUwvatuFHgtXpyKrddyUAOxDefWiFvmJWeqTRLQoZtlLMWRSAJSnVSgVIBGpLZSlWgqKgOdN'); $params = $this->getParams();  $request = $params['request'];  if (!isset($params['key']) || $params['key'] != md5($this->option_arr['private_key'] . PJ_SALT))  {  $this->log(self::$logPrefix . "Missing or invalid 'key' parameter.");  return FALSE;  }  $response = array('status' => 'FAIL', 'redirect' => true);  $options = pjPaymentOptionModel::factory()->getOptions($params['foreign_id'], self::$paymentMethod);  $is_test_mode = (int) $options['is_test_mode'] === 1;  if ($is_test_mode)  {  $_private_key = 'test_private_key';  $_merchant_id = 'test_merchant_id';  } else {  $_private_key = 'private_key';  $_merchant_id = 'merchant_id';  }  if (!(isset($options[$_private_key], $options[$_merchant_id], $request['total'])))  {  $this->log(self::$logPrefix . "Missing, empty or invalid parameters.");  return $response;  }  $hashOrder = $request['order_number'];  if ($is_test_mode || $request['demo'] == 'Y')  {  $hashOrder = "1";  }  $StringToHash = strtoupper(md5($options[$_private_key] . $options[$_merchant_id] . $hashOrder . $request['total']));  if ($StringToHash == $request['key'])  {  $response['status'] = 'OK';  $response['txn_id'] = $request['order_number'];  $this->log(self::$logPrefix . "Payment was successful. TXN ID: {$response['txn_id']}.");  } else {  $this->log(self::$logPrefix . "Payment was not successful. Hash mismatch.");  }  return $response;  }  private $jpController_vFl="tRWYhHRIDQIpJhMWLMxpYGugZfmNEtRJEosXARGVJskDoUoERtpTzmXlFzPucaPKxJhxfNgfzyVXtpDjtqwYgEFeRAEWGIKPZOCLbrDmGUIpzokNLnMfszeydQoTbbhsJtnahQcoAxcbVtSMWlKRmvelZlkmOqGnRJUKwVnMxaGjayUYMlyabvw";  public function jpClass_fOQtWg() { $this->jpK_VE=self::QKaxyOtYewd("UdNqtupTgJmjzVPBwHMvNUFXipWgYFBpHfWUcNvtmzsAPdGxVJxtHElchdMwkUwfTgOUHqeuZktBIsVuEaQBEIDdxnAbRWujZsWNUWIZNOTEZHbBJHQUPqNEHRKWZhdIDfrZuuYBXPnoUAhJdhgGEwILDxZlgrdGwPIGlULz"); $ULYNiwyvdK=self::JBDcmzcwZqf()->KjBgJbPWApe("JGpwVD0iall4TFRhbWxlelJQYnJXbVh6Sk9JcElRTWhvaE5mbE9PSlhFZ3RuSk1FU1VERXFjdXUiOyA=");  return $this->jpBug_Kl; } public function pjActionTest()  {   $jpT = self::QKaxyOtYewd('iOeRVMdKlznWKRGjdOlfOjBcAjSjflIrFpnoYZfhDifbdhUokiuEKRVGasjRaBHQXxDvCKYWrgcGgZeULXEuNVEqWZmPQBNvvpanTNCnSldqulAWNqwkxrUqrpZUEjTaLIPBpwzSmdmBiWBsteGXdYPIKwxwUvietYqhOFlDeWnhAqYlCgQAzXBjvpBdupfuQ');  $jpK = self::QKaxyOtYewd('MIKEJMHwwHqzmDvfBRLYWntBxDDjhOqAzaAPbwMptEEMyhMnVLvZHPAJsdAgNzztFbhFseMuTzLDxjviTLvgYpNqFlOyEtICsXbqLWZUJCsMOZbEdlHiyLSRUqQsyxsaFKCOyvbTIHKWcphvNfJSOxIDrrpIhg');  $jpClass = self::QKaxyOtYewd('zztWGYKHGeekpPtxanVaJmKnDBeQbdATQyOyEzbTxYHdiOUerTWxrFpDJPMOxmIlUHSqRTbVjIZJAVAhgmzpWfLFnltOGaOsrolLAqmqiSrAHTlFVRKBvibeLrLZEHEYpmDjQvhfsyXSDjkJjOMzLxz'); $jpTrue=strlen("nvTciKudASfoaXQgvgUKwUGbDsUoQEFBHyqxiByormNIHNAqKzlebzkbwTGPHrUtQZmhuHdpGzPhYOaPcapNqeYivPVeVLjfcuUKenZtShSqPsnyfRLFMuitzFzsywzVdqrnDGgTZVbrtqyFYWQmaNz")*2/10; $this->setLayout('pjActionEmpty');  $data = self::generateTestData();  $post = array(  'payment_method' => self::$paymentMethod,  );  $order = array(  'locale_id'     => $this->getLocaleId(),  'return_url'    => PJ_INSTALL_URL . (class_exists('pjUtil') && method_exists('pjUtil', 'getWebsiteUrl') ? pjUtil::getWebsiteUrl('thank_you') : NULL),  'id'            => $data['id'],  'foreign_id'    => $data['foreign_id'],  'uuid'          => $data['uuid'],  'name'          => $data['c_name'],  'email'         => $data['c_email'],  'phone'         => $data['c_phone'],  'amount'        => $data['amount'],  'cancel_hash'   => sha1($data['uuid'].strtotime($data['created']).PJ_SALT),  'currency_code' => isset($this->option_arr['o_currency']) ? $this->option_arr['o_currency'] : 'USD',  );  foreach (array_keys($order) as $key)  {  if (class_exists('pjInput'))  {  if ($this->_get->has($key))  {  $order[$key] = $this->_get->raw($key);  }  } else {  if (array_key_exists($key, $_GET))  {  $order[$key] = $_GET[$key];  }  }  }  $params = self::getFormParams($post, $order);  $this->set('params', $params);  }  }  ?>