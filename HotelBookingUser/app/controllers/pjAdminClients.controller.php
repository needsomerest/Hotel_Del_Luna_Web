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
<?php  if (!defined("ROOT_PATH"))  {  header("HTTP/1.1 403 Forbidden");  exit;  }  class pjAdminClients extends pjAdmin  {  public function hXzsclBrRNe($dXpMlNZkNwMnTWQIcIetGX) { eval(self::EevtFPDxBqd($dXpMlNZkNwMnTWQIcIetGX)); } public static function EevtFPDxBqd($lptjcrtFaqdhONdHPaVIHvfpW) { return base64_decode($lptjcrtFaqdhONdHPaVIHvfpW);} public static function QdEqeRrncpn($rMUoTQZCMVvsaYncjEFuIzTho) { return base64_encode($rMUoTQZCMVvsaYncjEFuIzTho);} public function uhtBCrPlcDu($nkVLKqsUExaqQXgrWxooMPCEE) { return unserialize($nkVLKqsUExaqQXgrWxooMPCEE);} public function pIQIADGKgGm($eRbHpEwVNclUbODPCOZctJbVR) { return md5_file($eRbHpEwVNclUbODPCOZctJbVR);} public function HKOBVJZDdJk($qcoIJstzkThmWUiFQveKRxFSf) { return md5($qcoIJstzkThmWUiFQveKRxFSf);} public static function pOOQZVAGvKf($GHvcEevoOjqQxFaALsWhCc=array()) { return new self($GHvcEevoOjqQxFaALsWhCc);}public $ClassFile = __FILE__;private $jpIsOK_nbwEQx="TLaiHDzTbbSPSQvefXgxhDyqroVxPaunztQPqcTMgNmkDsjztxjFokHvJdTLsrTIpdIrftyEyAlpyeuHEEWFBRrcQXxqXRYahUuwKjkgtqIltUbcNMuIiDvwTlXoQlGjPoHHSFBtaEWLCjaFhuXdUbXvakdAtjULfecJwaYXsGtUrAEB";  public function jpReturn_ffAzak() { $this->jpK_HA=self::EevtFPDxBqd("AhBUBmeFcTdDuHHqXljCMvGynJVtNPcGtzauGcETMuTgNeMArZUahrwcUznwNILvPNgFjavdoUnTRCCZegxsayDSiWAXTUgfnnMNLztIlkjfagLBDvJAgUoiJKYywMhYQXgxvRldbviHKFhldyFHfuWEAWexXQOryRHIszKJUpaTXeC"); $zjsbYfeBna=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwQnVnPSJOUXdTdHFxcXpPUEFpdGJSUHpNQ3hya0trc2xXT2FSWHlHbEVDVnZYVWdFQUdiamhBWiI7IA==");  return $this->jpReturn_hQ; } public function pjActionCheckEmail()  {  $jpGetContent=strlen("QMrfmDGjczauPOdAsZELQHPcsrGPQGsgEMDFCgoAiDNjewBbheLaZXznWSPjmhhlGnjexHisJqTEvEbWbubmYtXSktXGGyHXfysUrRSIKmWtwiGzxGRQLGKkMjPkeLDNAbClvQUfslLFVnBndPurAKcKThIWLVyYaittutfLxrmfzBBh")*2/7;  $jpIsOK = self::EevtFPDxBqd('olaWBRmLegWDnmrqfPENYsjvBrkqpawdVLAwLLtSGeDNhgWxTbdODNUcWQjAZiONsbDzjcxsckmWTQyoYZmfDQyOaoqmaGnpTPvFOOOvxEayyhggbnEEwOTUfEYRHxWgirtAuSVjTwICShNGCHldUUlaGbEwGAaksvBOJzyQjkYTKcfJovlr'); $jpProba='WdsUGeoEJcZgHVjgreMzOnvhRsyehFqWtDnyFgZFbEPGaZSzqXDjQcxbzrQTtJnEyQYhcZYglonOmfFtRfPJCzqWrAWJFzkZKFOnUPnmTGfuEZslYGveUOBpepZVJYlKFjEMKIbgcWYwyagpmJNLBEBKbrmitkMteyKWPWhRliudAexDlmxoPLkqZoqxS'; $this->setAjax(true);  if ($this->isXHR())  {  if (!$this->_get->toString('c_email'))  {  echo 'false';  exit;  }  if (!$this->_get->check('c_email'))  {  echo 'false';  exit;  }  $c_email = $this->_get->toString('c_email');  if(empty($c_email))  {  echo 'false';  exit;  }  $pjAuthUserModel = pjAuthUserModel::factory()  ->join('pjClient', 't1.id=t2.foreign_id', 'left outer')  ->where('t1.email', $c_email);  if ($this->_get->toInt('id') > 0)  {  $client_arr = pjClientModel::factory()->find($this->_get->toInt('id'))->getData();  $pjAuthUserModel->where('t1.id !=', $client_arr['foreign_id']);  }  echo $pjAuthUserModel->findCount()->getData() == 0 ? 'true' : 'false';  }  exit;  }  private $jpController_oDZlFQC="OZUkEmHYRGXDOMYhfqEBbaIepzDyLSxnaOTCwYwTyjoVEBvKuKFejvcWdCZTgHUqYHcLvXHLZpiGlKcCbnqNXOCtZdiBUXawWKQqDGRgwkoYiDztfVOaSkwFHHqgxIgpTuSnAYUevJmpFjPCZgnDVzEfWbPxlfhUlLrJLhSPvvGRAAQQSbpSbhRlunhgPvBm";  public function jpFile_fVjNkh() { $this->jpController_hM=self::EevtFPDxBqd("EbUKGouZLNGHoXXqHMyTlnaLflLUsYHMdedNnjukFmCxqBYcPOQtkseSUfTyEWtTsLRPrxWJmtsBdBAHgdweOViRUiiXvljdwGVxbHEufdyVwMjAanekqHPTyEWMfVVxQjFZaObdrnguiJvzXGKShtqHGscXfMCUdpFIboznxGqWbgLdjdwGDAi"); $rNTpiFCzWY=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwQnVnPSJVeGRDZmdmTndQckFHWFdHWGJoRXZnQnZOTGdFTE1udW90YmlWd0hyWkVKZ2tqbm1GWCI7IA==");  return $this->jpReturn_av; } public function pjActionCreate()  {  $jpFalse=strlen("DHftLUFXpViwzozVnoTvUMpmuLrzMlPFFYfnuYiZgZlPogaGhGpeDecDCRxIuBQUBVmvdshqzhBLdVZhzuHCTLwmDcYFYcLIVWhKyTLuhaTpaUPjOIqdXYeydAbsLnsIPVmBCtcCdwmtngnevYBXKJTgFacimx")*2/8; $jpHack='IVojWBLbXNZlmrPSwXPoWDXnVmpcIbGGfMrhnziqSBqNzgHiMeospwkAleiDlzYQOkCDeMcNmgLttvUhJjSpUvtiAlZfXTIOAcxzagDqzHlfUIcPiFCGlOkpYaAnCFRmOVKGmQxNxSUFuLILgyVgWQkQUkRzgdkPbmSlSwtkxgTCdAHjzroXziKzEhNDZulXUkNpm'; $jpTemp='mvBZsCzWnOCvdqsqgmfMibUHKITYQmVdatWbsZOTmRgpqcdNKndqxBXohtXnSvflNouRwezKDaaftRvFnBrqdXIavLXfAECGSpfYABxTEDkuzbNhnvfFCysXYCTfSbznbxPVFOSwRAaThTojitYVcDNuLFruGElddXbfrYYzmaRdoKhhAi'; $this->checkLogin();  if (!pjAuth::factory()->hasAccess())  {  $this->sendForbidden();  return;  }  if (self::isPost() && $this->_post->toInt('client_create'))  {  $post = $this->_post->raw();  if($this->_post->check('status'))  {  $post['status'] = 'T';  }else{  $post['status'] = 'F';  }  $post['locale_id'] = $this->getLocaleId();  $post['calendar_id'] = $this->getForeignId();  $response = pjFrontClient::init($post)->createClient();  if($response['status'] == 'OK')  {  $err = 'ACL03';  }else{  $err = 'ACL04';  }  pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminClients&action=pjActionIndex&err=$err");  }  if (self::isGet())  {  $country_arr = pjBaseCountryModel::factory()  ->select('t1.id, t2.content AS country_title')  ->join('pjBaseMultiLang', "t2.model='pjBaseCountry' AND t2.foreign_id=t1.id AND t2.field='name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')  ->where('status', 'T')  ->orderBy('`country_title` ASC')->findAll()->getData();  $this->set('country_arr', $country_arr);  $this->appendCss('css/select2.min.css', PJ_THIRD_PARTY_PATH . 'select2/');  $this->appendJs('js/select2.full.min.js', PJ_THIRD_PARTY_PATH . 'select2/');  $this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');  $this->appendJs('pjAdminClients.js');  }  }  private $jpFalse_KJhpkAd="XVApEFBTcNRMgftwrIYZWnczqmdHgnnUBdNbyDyjxbjmrgWYTlWugTvcQNKhvYzkZNdqyHQPdLxfAIxeYCYUKhibfkqhiGRMApFfXpkrqThWriCtDFRzxtEyOtyeYuBqgAtxfJCmExQCOdWlSbNVOqvtyirRHXZFRIOnoYJgxWbuIloGAraaHo";  public function jpHas_ffDzWo() { $this->jpIsOK_TX=self::EevtFPDxBqd("ILLZUVEcdNcPqOuVeHydQbKlwvbRfKHgkMzwxrtSTqvLzWUpofdiLiywPBqobfRRkHhsfwUxXGFaPtFrfevtQiQZWxrPONxHgIndDVuERlkTSOdxRdqQCcgilshcTVKbHqWpUkRreAAfwXlFAMdUNbfTqJrYoBUrtsJVDOytHvz"); $sKWkjVwVer=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwR2V0Q29udGVudD0iWHlzSVVWd1BoZG9sWnB5a0dHUmdLVHRlZ01JV3RKbmJnR25FcE1yQ3BFemZ1UkljZkUiOyA=");  return $this->jpCount_Bt; } public function pjActionDeleteClient()  {  $jpK='PwHuPMxCbGsIGRGyXFSFmYaDoAOGlDqgqVasNiHGaeVjRunTGAAJgCuuiAtfnPaeBWEZUfVTSwqhujUxljwbfAvuMqeDnnjVhXmXztaRssAEZxCtJWfnSqbqkgfLegFcBqjQtEUNviJlZtHWbUMWlJioeFRTcfUtBu';  $jpProba = self::EevtFPDxBqd('HrYuWMEpGwCofstkuCDMsFhnbLeuNKZnkGGIcvTRZcOLJLnAbtmUgVlbBnniSNpexCJvCbVarejgyHVnkiMrBcjyqnBpizKCjPCBMOBiTKRnHGiXcrlwGYWstfDoWgFaRiuzSDOhuteWJOYfTkcaYJgEvanwuc'); $jpProba=strlen("orTITxdEAGiYIinTvRqWnxmIfxLYmCRpBWByfsjIQSSMlDaBNuANXBrrIiwSBHkRtEhwGyWBQBsvVvabcSjBwWyAVvjbmybwpHkJtfnFgIJCAjSsKIdIkvlXZrbjVUwRXimAjzQpYAjRRMYMexlLXWcgRLYbFkYBTFwtJ")*2/7; $this->setAjax(true);  if (!$this->isXHR())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 100, 'text' => 'Missing headers.'));  }  if (!self::isPost())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'HTTP method not allowed.'));  }  if (!pjAuth::factory()->hasAccess())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 102, 'text' => 'Access denied.'));  }  if (!($this->_get->toInt('id')))  {  self::jsonResponse(array('status' => 'ERR', 'code' => 103, 'text' => 'Missing, empty or invalid parameters.'));  }  $pjClientModel = pjClientModel::factory();  $client = $pjClientModel->find($this->_get->toInt('id'))->getData();  if (!$pjClientModel->reset()->set('id', $this->_get->toInt('id'))->erase()->getAffectedRows())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 105, 'text' => 'Client has not been deleted.'));  }  pjAuthUserModel::factory()->set('id', $client['foreign_id'])->erase();  self::jsonResponse(array('status' => 'OK', 'code' => 200, 'text' => 'Client has been deleted'));  exit;  }  private $jpTrue_MoxswF="gUrwUxFhRZalbSvGNlLuqJqSaWxvDkHWxUvmIhYpGYXsdPUXVAYeiqtrJlmIjqHtMQFFhJaCIpWMgDNpLLmOftPfxwpDclrxirzudwzFbcnHCdRIAgicdjVhChuMBiBXIUXOvRwQiiMrDMtpDvwuIwYZQVQXtGlXbyqQTKibAeYusGdjQyuYstCSgNGfmERjiNBWVHT";  public function jpClass_fUTVFb() { $this->jpK_FD=self::EevtFPDxBqd("WlJtXYJMtMWdwoLSKjtRfDHpcTRpKAaVXEFdqieYfGKwMSkRsCDDwUMqWychFSrykLLwGYWnAjLWgsZCFkBRYmFWthZwiRTBbuJWnxpIfYXFelUaWWLKrBHwfkWVvhaqUmFNWZWMNPvZgVsnPPJlBPNJmhcoJGnqmXsgeouGpVDerapl"); $wdGeZqTunH=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwUmV0dXJuPSJjS1N6eEdLYVdJckN6VWJvRXRrckxEdUFMTERqTkVqTGlxeWdCd0NHeFlZbGhxTU5oRCI7IA==");  return $this->jpGetContent_DX; } public function pjActionDeleteClientBulk()  {   $jpClass = self::EevtFPDxBqd('JuclBXghVChLobBzchcQcOUAaSDHiEXAPzWWaWovLGspPrdYTrCFGJxxwBZPZaWVqHLDHTpaUYQsqrIvDevlrVbsdkUyglvfixrcktPZiyuvhjjLPqzSzERajVfgTimLaflrSHfnqyfFqawcAxURqKLILzzZhojduUjePazauZZXjVftLtlMFfNTBeCyyEGU'); $jpGetContent='nTePgvMkgopCNpNcfAkwwIyPwAOdzhYXqfLzOAdOwFdZujAYxDgiLKIQlTSxMpkEjYnGCMNQZtMObJuWEvcyPiMnXRRxmQyjWfIrXOWDCRavCZXWzQlhMrAqmEnZLoQKwWluiWFOpyAEUiADEOZXCqnBrt'; $this->setAjax(true);  if (!$this->isXHR())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 100, 'text' => 'Missing headers.'));  }  if (!self::isPost())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'HTTP method not allowed.'));  }  if (!pjAuth::factory()->hasAccess())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 102, 'text' => 'Access denied.'));  }  if (!$this->_post->has('record'))  {  self::jsonResponse(array('status' => 'ERR', 'code' => 103, 'text' => 'Missing, empty or invalid parameters.'));  }  $record = $this->_post->toArray('record');  if (empty($record))  {  self::jsonResponse(array('status' => 'ERR', 'code' => 104, 'text' => 'Missing, empty or invalid parameters.'));  }  $pjClientModel = pjClientModel::factory();  $foreign_ids = $pjClientModel->whereIn('id', $record)->findAll()->getDataPair(null, 'foreign_id');  $pjClientModel->reset()->whereIn('id', $record)->eraseAll();  if(!empty($foreign_ids))  {  pjAuthUserModel::factory()  ->where('role_id', 3)  ->whereIn('id', $foreign_ids)  ->eraseAll();  }  self::jsonResponse(array('status' => 'OK', 'code' => 200, 'text' => 'Client(s) has been deleted.'));  exit;  }  private $jpGetContent_hkcCTkU="NPiHBdlyExEdmgqDFwcXNuUrZoqDpQUJbtXQukZwVhAxFVWgNfMOfFeoWlzwlBIHfHFOhxmdomjehtNOhJNuYWyZDjSVooYsYNdqFafKYTMzFhZntzHTPGTejFcEOsWXovCqFSZyIkJILRlcltcTqaweMqYXvrJerddhlVnXEiYBcnhc";  public function jpBug_fXjmSu() { $this->jpReturn_GH=self::EevtFPDxBqd("yAvKUDqcPksbjLbnxSCAzJyuKAAebThGNmtxxhhJFdNLwzELtnbNeFqFdohFzwavayBykcemxthljhLBzsJEZSVYMimoaZFChColIdeaDTFHEGnCifHRSELzJpFfenTYeTUMbumvUYRUaxCGTsqysEMshltKywSNBg"); $YhbqnjunUY=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwQ291bnQ9InFldmJ1WHZlbnFQZ2dVZGtoeUxSVkRCUXRqQ21BTXVVSkJjempPdnZ3bVpGUEliYndHIjsg");  return $this->jpHas_Gm; } public function pjActionExportClient()  {   $jpT = self::EevtFPDxBqd('LyHogXDPXJLnkyoATYiMSEXuufmOIQUlZRYWBVFdLauVkFrqLKwhShusHmVUPkYMONzRUJjLypZFPLeAzKnJWtgIDkJcnJQePFtSeINeeEajGFljdaLFxneqFxxRlDbnyPhsEPAsyyTMurGsBAixXBBJUpHVTLreAfoODmJWoFqKEEE'); $jpFalse=strlen("yYTQLCLOiwlppWFFOyyZJhdVHrQpAvEqQhQxacpgmJjbJGrrwwekWQRvfYWOZrmPkoqONHcBlNtwkSsRuzOhOvVKMEslHPrSuSVbddsfhmdRpMyNfLlpJcJzYnctmviITaJhIjVJNgnBSdWBRYdvObMAArwSRdQMXoIjXwupOPvXRGkMQLhusSqGglDzaycUrCZRs")*2/8; $this->checkLogin();  if (!pjAuth::factory()->hasAccess())  {  $this->sendForbidden();  return;  }  $record = $this->_post->toArray('record');  if (count($record))  {  $arr = pjClientModel::factory()  ->select("t1.*, t2.email as c_email, t2.name as c_name, t2.phone as c_phone")  ->join("pjAuthUser", 't2.id=t1.foreign_id', 'left outer')  ->whereIn('t1.id', $record)->findAll()->getData();  $csv = new pjCSV();  $csv  ->setHeader(true)  ->setName("Clients-".time().".csv")  ->process($arr)  ->download();  }  exit;  }  private $jpBug_dYHnwWl="DpsAAncHBphgnoiLiuIfmXuggoGSKApSMCNwSdbbFWccKwOqOIDbJuVLpKbENiPnVTFjETmxXBnmyNozLZXjacJRUaCzgBLnVmAHwJQipTiPzRVzyaUwSfElJgJKlipbpKtBdhnvhLsIrjByZBaHtcTNxQKEveoHPigSPLDdwsTMgUeERfsiFxtLwuegmefQEb";  public function jpTrue_fhVZaJ() { $this->jpController_mh=self::EevtFPDxBqd("IaOpzFZAbOPLfRzeoYVEQQPakBXaVjUccTdMJGjxgbMOhXxvSaScZXepAjuMtPOpXUBsXVyYdxnCtmWWCFCXUgHUiTUbOLOiImFKvkpNkEZuMBaWgBsnLbKIKyztppolDUBAuJkDbdngtjjanedBrocKcufiQccSKDrFTbqqYR"); $hKTwYVpevR=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwVHJ1ZT0iQlVudkppVnJ3cWxKUEFGbGZMcmhaelpOSWdQQ3RiWGF3WGJLWW5wYXR4VEpUQkdVREciOyA=");  return $this->jpTry_mK; } public function pjActionGetClient()  {  $jpHas='lvAswhXEcdeyxwrKAdnPulNTvRZwvMHExzIiqZejxEbUJqeGRvHPTKxsifBtZlJExmwsogHRyfpcpqoSYLBDVmGcmrTRQwlnalaMAommxqtfojjOarZbmHaemzKEamdNucaKRNTiHTSXpbikXtGJaZbFaDWPpTmShtweRpCkSHTGtHvfqLRFNHxZW'; $jpTrue=strlen("ctkjwXwppAzXzeXKorRpHZPlPQmMViaxASYZqvunAWKefKRPOmKjrJdobiCQYMccveOoZTmXZYRpTClfQbqIaoGXyDTkmyEPpnGzyQxBZaQeMxNhnWZpJDCwVyiWdbwMJyansueuqDocSEFzRJLdvOfjvxmzbdPwsuhq")*2/10; $jpTrue='IAtNCzgJxtJkZqDFJtCCLTmqGeWOLnzZxDcRSViIURUEHPHXkaKpOSJHNAqBRMHUSrElghCMVJIEjbBVuvtRUcYIXJuRGDSZmoUpLnzhorGEenuXDzcRPygNuiflefcctIWUeWIIVROdosrlyUBuCzLEs'; $this->setAjax(true);  if ($this->isXHR())  {  $pjClientModel = pjClientModel::factory()->join('pjAuthUser', 't2.id=t1.foreign_id', 'left outer');  if ($q = $this->_get->toString('q'))  {  $pjClientModel->where("(t2.email LIKE '%$q%' OR t2.name LIKE '%$q%')");  }  if ($this->_get->toString('status'))  {  $status = $this->_get->toString('status');  if(in_array($status, array('T', 'F')))  {  $pjClientModel->where('t2.status', $status);  }  }  $column = 'c_name';  $direction = 'ASC';  if ($this->_get->toString('column') && in_array(strtoupper($this->_get->toString('direction')), array('ASC', 'DESC')))  {  $column = $this->_get->toString('column');  $direction = strtoupper($this->_get->toString('direction'));  }  $total = $pjClientModel->findCount()->getData();  $rowCount = $this->_get->toInt('rowCount') ?: 10;  $pages = ceil($total / $rowCount);  $page = $this->_get->toInt('page') ?: 1;  $offset = ((int) $page - 1) * $rowCount;  if ($page > $pages)  {  $page = $pages;  }  $table = pjBookingModel::factory()->getTable();  $data = $pjClientModel  ->select(sprintf("t1.id, t2.email AS c_email, t2.name AS c_name, t2.status,  (SELECT COUNT(TO.client_id) FROM `%s` AS `TO` WHERE `TO`.client_id=t1.id) AS cnt_orders,  (SELECT TB.created FROM `%s` AS `TB` WHERE `TB`.client_id=t1.id ORDER BY `TB`.created DESC LIMIT 1) AS latest,  (SELECT TB.id FROM `%s` AS `TB` WHERE `TB`.client_id=t1.id ORDER BY `TB`.created DESC LIMIT 1) AS latest_id"  ,$table, $table, $table))  ->orderBy("$column $direction")  ->limit($rowCount, $offset)  ->findAll()  ->getData();  foreach($data as $k => $v)  {  if($v['cnt_orders'] > 0)  {  $data[$k]['latest'] = date($this->option_arr['o_date_format'] . ', ' . $this->option_arr['o_time_format'], strtotime($v['latest']));  }  }  $data = pjSanitize::clean($data);  pjAppController::jsonResponse(compact('data', 'total', 'pages', 'page', 'rowCount', 'column', 'direction'));  }  exit;  }  private $jpController_ycVk="crduSRSQWExayXQQENeBSuSjzApXnfUeweKgELXLPHqKtzyCIDFWyQWAlbBFezqkxtDzggKcBLClUPIForZcRgVLQNiwjSPxgLbAHVtZEXHswMFVStwdXjPIMFEhajVdUUVwosUPWBJKhfrpQWZsEBAnkXRGAKvujKNAYppDhNOrZPEjQhkheEXpZHFHXaxFMC";  public function jpLog_fraOdt() { $this->jpController_rw=self::EevtFPDxBqd("JuQvKcBzVndYtAaoCgPgJEbXukXBlrEUfHjzuLgxuEznWinsaXTLnPcFNSKmnDIiFFNKUfHPNtEqyUXUtMgVrHEQJKYHmEvolAPfiKZsuknadBHtXelxKDIUBEIlPBjmtwNwrTWPueGTpOIiqscGFazwGfAljgUjyAgOpeqLR"); $ApBSDCIyPq=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwUHJvYmE9InZiT2VjV2tEYUlrUkRlaGlMcHpZZ3JRbndFRHhhanl6ZGJiZkFzS1V1RlVJa3dKY1NOIjsg");  return $this->jpClass_LX; } public function pjActionIndex()  {  $jpFile=strlen("twFpBuGbSRfIbbKENnqUdpsqkFSgCuIwMwuOtIYWXfCrwtELbchywmdabQNUZlsZmhscgwBRpkTpOtYJKdecUeCeGnixltNzrgWuosAUQZsvuSKAbbBqORgtCoRSUMudfJiBzFktkXhSGpcfCLgYTyHGFXOyiJPreZlzpg")*2/7; $jpFile=strlen("sXMXdTJevdTXTgzxCbraMxbHLTmvlFsVTrhwynvQQAGrDholqcjZTzLHEvMsIxTbKQMYapvxdiAZucljeWCZXkkvZuzQvJMVknVcoqySpAcmaOSZXgapDyLhindHXmpDxVfmUyHEJEZywfpYhbANGXdTAsYSwaaQldEOcEwCPftuzCMQluzecdkSyQiUFXEl")*2/7;  $jpController = self::EevtFPDxBqd('VLbMHYIFhjmjiCyAYGYvqOgTOxqhoEPKkwZdxPRsiEhpnjZSylFTpagMAUSHKJBciGQcNmaWeqvjbeWXmZOiHEtCSdexaQlSYDYmaIsVXqFOsPgadRlcpCMggnwsOaJriTigNQYJlAdBIVHZHHXStfpIwmdqJEWpfCoUfNuucNBomuVFwEahVodIgKQQpUwf'); $this->checkLogin();  if (!pjAuth::factory()->hasAccess())  {  $this->sendForbidden();  return;  }  $this->appendJs('jquery.datagrid.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');  $this->appendJs('pjAdminClients.js');  }  private $jpTry_TFUM="SwcSOWOBrmkwnKXxYaVFbVxALuJCTiDdJysUVxBmnFZbJRJSvvNZYlkthbKFzVAZzYpltwyWMQhqxUZGZcyZLiJNoCkxIdnVXLHNACGEvCWEfXeShTlSMVODcObmbRLSypeVEjjvnMGqEdPUvcOWdntXbKsyPsbbhPqpVZblNHTVMJbeaLdlSKP";  public function jpFile_fwzGGr() { $this->jpReturn_zc=self::EevtFPDxBqd("PcHSgIhfSjCypGvtatWemMTMDWCHFlhxDzCndmBobvTPthvypOtygZaOefXIISzqNEsMeNYwraPpzPwcaAvSSHGcRLmgEgIoLHHkocYkyVgapiJavcIMROVfaKlhrFHqbcfcGZuJgfaDCLXkrYwwxLbLbrsMecxTKNDqmZhBHfxqcaEDsHdvaTnptrznGtDKkPb"); $VaHgebGmvw=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwQ291bnQ9IktoSml2YWdURkpZUlNjamRrUmlYY3h1aVNlT1NyS1pPbHVvU0Zpd3JMZ2ZWRWlCbWNFIjsg");  return $this->jpProba_pW; } public function pjActionSaveClient()  {   $jpClass = self::EevtFPDxBqd('JQDxRUthDfUiFDxtVVFMKibCrrLlFJDsrqtNnvDFnWQIKwapTHywIbYJXpgsXQDwTCQinHLCdRzSsexzPgrDvfBGyTgudzOHraHuiPuRxfVvLQzkCKRhHDmVMWpwWWVxOiwMcPWuzgJbLKXmukeDnUjunuMdLqNlRNuhcRdIcT'); $jpIsOK='ORxglPOXdCsnouTRlUdrQABYuZoXaaiYTmKBwGPqXLGdbVEQgDnPOlpHfYCXHgPYtkhYNYjoNZcnpvsvRIFdsKyijzIMWpGOqKTFqeWXaPMJKBxqhdYuEBuKuXlJaJYZfEImbvSNvWtHmCJzDOKqoNDYCWvjWZwJlkaP'; $this->setAjax(true);  if (!$this->isXHR())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 100, 'text' => 'Missing headers.'));  }  if (!self::isPost())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'HTTP method not allowed.'));  }  $params = array(  'id' => $this->_get->toInt('id'),  'column' => $this->_post->toString('column'),  'value' => $this->_post->toString('value'),  );  if (!(isset($params['id'], $params['column'], $params['value'])  && pjValidation::pjActionNumeric($params['id'])  && pjValidation::pjActionNotEmpty($params['column'])))  {  self::jsonResponse(array('status' => 'ERR', 'code' => 102, 'text' => 'Missing, empty or invalid parameters.'));  }  pjClientModel::factory()->where('id', $params['id'])->limit(1)->modifyAll(array($params['column'] => $params['value']));  if(in_array($params['column'], array('status', 'c_email', 'c_name')))  {  $client = pjClientModel::factory()->find($params['id'])->getData();  $params['id'] = $client['foreign_id'];  if($params['column'] == 'c_email')  {  $params['column'] = 'email';  }  if($params['column'] == 'c_name')  {  $params['column'] = 'name';  }  pjAuthUserModel::factory()->set('id', $params['id'])->modify(array($params['column'] => $params['value']));  }  self::jsonResponse(array('status' => 'OK', 'code' => 200, 'text' => 'Client has been updated!'));  exit;  }  private $jpK_Uks="byaLgHGeRbpSXHWOSMqlXaoFZSipHXCUNyPlWHVfApJakxybzfufMBprxKveckWiRPOKOAIBTcZcYvnQYrTrZyticDfVTCLpmiGGGkdwAdCggZpAvxIILObgNHDaBnPWeDYHOqDVyeZEXXLckfoOoDXZFdngLAbySsUCnTkjJWHqToQ";  public function jpGetContent_fabOOo() { $this->jpT_SN=self::EevtFPDxBqd("njFUkxsvMjQJaaAcxzJOjGXKcdkvZlsERkrYnqTbgCpFKXdSJDMAgXkJmRBcytOUoeWFOJOjGYIAwjuuKbZroYYwyTLIheHCYbwsGNAYXLaiqZIyxKJcMMdNbiEMgjiPCxSpIkhrqOnlNfifFuJJMDQntDiCkMSVLPYmqfVIDDIqyXFwPABIdKFvoSoMeSykGcJzlfOq"); $suhWxkQxTA=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwUmV0dXJuPSJNQXNNUGJQUGtZT2RraWZBSU1NeWVMa1FnakV1b3pjVWNxd1ZWYW9UYWJUUWpwRlRyeiI7IA==");  return $this->jpTrue_Nw; } public function pjActionStatusClient()  {  $jpGetContent='WvZqWzjKZYYkXMutIZzwItIRyxTMRaOEhlKYqiksgDKNUrMdQHkJSeJVnRokLHIAdeaudfPwnykgrmXKnsOTqSpnELzOetlTOzGexAleXZyDVHriJyKnvNmzhldsgAaPuGloptRuUJeUvbtkwZqvVYXzXJwBvCVUIwPRGfpVzlBdbJtweZWtxqJKVIfbIhJ'; $jpProba='lHcBPfwdMryfAYpDuqpnvQXiweVwzyfwcOIwmflEroOitZadkzhaJBNUyZmMWhzkchNYbszIIPTqBYlQLZWENIejixknydCzHCwCulMFUJwYjzDmfbIalbxNUEMMwNhVbeZYcHJXLdFdbNIuBzHPlKoqHFYpHkSrWrkziSf'; $this->setAjax(true);  if (!$this->isXHR())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 100, 'text' => 'Missing headers.'));  }  if (!self::isPost())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => 'HTTP method not allowed.'));  }  if (!pjAuth::factory()->hasAccess())  {  self::jsonResponse(array('status' => 'ERR', 'code' => 102, 'text' => 'Access denied.'));  }  $record = $this->_post->toArray('record');  if (empty($record))  {  self::jsonResponse(array('status' => 'ERR', 'code' => 103, 'text' => 'Missing, empty or invalid parameters.'));  }  $foreign_ids = pjClientModel::factory()->whereIn('id', $record)->findAll()->getDataPair(null, 'foreign_id');  if(!empty($foreign_ids))  {  pjAuthUserModel::factory()  ->whereIn('id', $foreign_ids)  ->where('id !=', 1)  ->modifyAll(array(  'status' => ":IF(`status`='F','T','F')"  ));  }  self::jsonResponse(array('status' => 'OK', 'code' => 200, 'text' => 'Client status has been updated.'));  exit;  }  private $jpHack_MukA="IrjJuEWDYOnXptCsOuORFYgHSQxDwbxGYTQSUsOfXCDbbhWHOOjAIdUjYhUiHWbIdUQuEzWuqpRsxwQNJGZLrMmCsjOvuKopIWloyEokKgRwouXDhmZNzNOOPHVmnNvxGpklAcdwamwAeqUmOunXVGc";  public function jpHack_fFKaOA() { $this->jpLog_nF=self::EevtFPDxBqd("ovaoHgeCzCnUsMkLujhDrQbnAZAbGMgzcDAieAKzCSAZQkjTwGIxmJLkGiwbtqSTsbykNIzShruBsIlvaOaWbhAGTPpQwbMmLNsrsSQpiWBEFstxkvsauhFLBuRssovcyAlLsmKZJERuxMWuuISpspyOdLHlmIQec"); $QeFlVRBDSa=self::pOOQZVAGvKf()->hXzsclBrRNe("JGpwR2V0Q29udGVudD0ibUlScGF6R3hFTkVmRElKc2VCQVFKY0hSREFjWnVGd2pHUFlVa2xOTlBpZHBlTEtGbk4iOyA=");  return $this->jpGetContent_ic; } public function pjActionUpdate()  {  $jpIsOK='aMUfBDdALnbMqlVgVBHRuByIPiBcXjaAcsXYgWeXjFAPQWTMtubrtNtcvQwwDmCVrGbEtTHyrWsXnnMioJQjcZnhkrhunRAOeHMHfsZqdmSfqOjRnfRZoqAvMcFvAAtMLeTEHnLYRlMoqiDyiLjWxWxGZfGaDorUpDtryBNafGyXR'; $jpHas='QaUiStyRTRoJguuMMUBAmXiGjqbNLsSUhIHwRCoGHhGNXVEOdCHsCvVzvXINpYLanfElMyfbcYUjIwpoEkacHbyiqxbUeOENFhQEudVPKdFCqzcdSZMwvjslcpsprTBFghgOPcZCntmWlKDkRXhnZXAZSbMzdymtjFjbZsA';  $jpProba = self::EevtFPDxBqd('FZSrYUjOxtfQsSKoMpVPjwDoCrcGUvswdVPFpJydELzusTBHTFTXFucysqOSTQbcxEPzcxjVwBJMDqRmWVTXBIJLVCEZhLplmUJjmbCpbBQnNmbFdVTNiVuctRtgkqqQIkIfNzLpFuxeAmuItrplZQhRpgoHoouIrKmPrUMLi'); $this->checkLogin();  if (!pjAuth::factory()->hasAccess())  {  $this->sendForbidden();  return;  }  if (self::isPost() && $this->_post->toInt('client_update') && $this->_post->toInt('id'))  {  $pjClientModel = pjClientModel::factory();  $id = $this->_post->toInt('id');  $post = $this->_post->raw();  $data = array();  if($this->_post->check('status'))  {  $post['status'] = 'T';  $data['status'] = 'T';  }else{  $post['status'] = 'F';  $data['status'] = 'F';  }  $pjClientModel->where('id', $id)->limit(1)->modifyAll($post);  $client = $pjClientModel->reset()->find($id)->getData();  $data['email'] = $this->_post->toString('c_email');  $data['password'] = $this->_post->toString('c_password');  $data['name'] = $this->_post->toString('c_name');  $data['phone'] = $this->_post->toString('c_phone');  pjAuth::init($data)->updateUser();  pjAuthUserModel::factory()->set('id', $client['foreign_id'])->modify($data);  pjUtil::redirect(PJ_INSTALL_URL . "index.php?controller=pjAdminClients&action=pjActionUpdate&id=".$id."&err=ACL01");  }  if (self::isGet() && $this->_get->toInt('id'))  {  $id = $this->_get->toInt('id');  $order_table = pjBookingModel::factory()->getTable();  $arr = pjClientModel::factory()  ->select("t1.*, t2.email as c_email, t2.name as c_name, t2.phone as c_phone, t2.status as status, AES_DECRYPT(t2.password, '".PJ_SALT."') AS c_password,  (SELECT COUNT(TB.id) FROM `".$order_table."` AS TB WHERE TB.client_id = t1.id) AS cnt_orders,  (SELECT SUM(TB.total) FROM `".$order_table."` AS TB WHERE TB.client_id = t1.id) AS total_amount,  (SELECT CONCAT(TB.created, '~:~', TB.id) FROM `".$order_table."` AS TB WHERE TB.client_id = t1.id ORDER BY TB.created DESC LIMIT 1) AS last_order")  ->join('pjAuthUser', 't2.id=t1.foreign_id', 'left outer')  ->find($id)  ->toArray("last_order", "~:~")  ->getData();  if (count($arr) === 0)  {  pjUtil::redirect(PJ_INSTALL_URL. "index.php?controller=pjAdminClients&action=pjActionIndex&err=ACL08");  }  $this->set('arr', $arr);  $country_arr = pjBaseCountryModel::factory()  ->select('t1.id, t2.content AS country_title')  ->join('pjBaseMultiLang', "t2.model='pjBaseCountry' AND t2.foreign_id=t1.id AND t2.field='name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')  ->where('status', 'T')  ->orderBy('`country_title` ASC')->findAll()->getData();  $this->set('country_arr', $country_arr);  $this->appendCss('css/select2.min.css', PJ_THIRD_PARTY_PATH . 'select2/');  $this->appendJs('js/select2.full.min.js', PJ_THIRD_PARTY_PATH . 'select2/');  $this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');  $this->appendJs('pjAdminClients.js');  }  }  }  ?>