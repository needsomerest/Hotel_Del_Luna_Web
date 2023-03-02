<?php
$theme =  $controller->_get->toInt('theme') ? : (int) $tpl['option_arr']['o_theme'];
$cid = $controller->_get->toInt('cid');
?>
<div style="max-width: 1060px; ">
	<div id="pjWrapperHotelBooking_<?php echo $theme;?>">
		<div id="hbContainer_<?php echo $cid; ?>" class="hbContainer container-fluid pjHbContainer"></div>
		<div class="modal fade" id="pjHbModalMaxOccupancy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
					<div class="modal-body"><div class="te"><?php __('front_max_occupancy_message')?></div></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('front_btn_close'); ?></button>
					</div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<div class="modal fade" id="pjHbModalWrongCaptcha" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		        	<div class="modal-body"><div class="text-danger"></div></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('front_btn_close'); ?></button>
					</div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		<div class="modal fade" id="pjHbModalAlreadyBooked" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		        	<div class="modal-body"><div class="text-danger"></div></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><?php __('front_btn_close'); ?></button>
					</div>
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
</div>
<div style="display: none" title="<?php echo pjSanitize::html(__('front_terms', true)); ?>" id="hbTerms_<?php echo $cid; ?>"></div>
<script type="text/javascript">
var pjQ = pjQ || {},
	HotelBooking_<?php echo $cid; ?>;
(function () {
	"use strict";
	var isSafari = /Safari/.test(navigator.userAgent) && /Apple Computer/.test(navigator.vendor),

	isMSIE = function() {
		var ua = window.navigator.userAgent,
        	msie = ua.indexOf("MSIE ");

        if (msie !== -1) {
            return true;
        }

		return false;
	},
	
	loadCssHack = function(url, callback){
		var link = document.createElement('link');
		link.type = 'text/css';
		link.rel = 'stylesheet';
		link.href = url;

		document.getElementsByTagName('head')[0].appendChild(link);

		var img = document.createElement('img');
		img.onerror = function(){
			if (callback && typeof callback === "function") {
				callback();
			}
		};
		img.src = url;
	},
	loadRemote = function(url, type, callback) {
		if (type === "css" && isSafari) {
			loadCssHack(url, callback);
			return;
		}
		var _element, _type, _attr, scr, s, element;
		
		switch (type) {
		case 'css':
			_element = "link";
			_type = "text/css";
			_attr = "href";
			break;
		case 'js':
			_element = "script";
			_type = "text/javascript";
			_attr = "src";
			break;
		}
		
		scr = document.getElementsByTagName(_element);
		s = scr[scr.length - 1];
		element = document.createElement(_element);
		element.type = _type;
		if (type == "css") {
			element.rel = "stylesheet";
		}
		if (element.readyState) {
			element.onreadystatechange = function () {
				if (element.readyState == "loaded" || element.readyState == "complete") {
					element.onreadystatechange = null;
					if (callback && typeof callback === "function") {
						callback();
					}
				}
			};
		} else {
			element.onload = function () {
				if (callback && typeof callback === "function") {
					callback();
				}
			};
		}
		element[_attr] = url;
		s.parentNode.insertBefore(element, s.nextSibling);
	},
	loadScript = function (url, callback) {
		loadRemote(url, "js", callback);
	},
	loadCss = function (url, callback) {
		loadRemote(url, "css", callback);
	},
	getSessionId = function () {
		return sessionStorage.getItem("session_id") == null ? "" : sessionStorage.getItem("session_id");
	},
	createSessionId = function () {
		if(getSessionId()=="") {
			sessionStorage.setItem("session_id", "<?php echo session_id(); ?>");
		}
	},
	options = {
		server: "<?php echo PJ_INSTALL_URL; ?>",
		folder: "<?php echo PJ_INSTALL_URL; ?>",
		cid: <?php echo $cid; ?>,
		locale: <?php echo $controller->_get->toInt('locale') ? : $controller->getLocaleId(); ?>,
		direction: "<?php echo $controller->_get->toString('dir') ? : $controller->getDirection(); ?>",
		theme: <?php echo $theme; ?>,
		hide: <?php echo $controller->_get->check('hide') && $controller->_get->toInt('hide') === 1 ? 1 : 0; ?>,
		price_based_on: "<?php echo $tpl['option_arr']['o_price_based_on']; ?>",
		accept_bookings: <?php echo (int) $tpl['option_arr']['o_accept_bookings']; ?>,
		week_start: <?php echo (int) $tpl['option_arr']['o_week_start']; ?>,
		date_format: "<?php echo $tpl['option_arr']['o_date_format']; ?>",
		thankyou_page: "<?php echo $tpl['option_arr']['o_thankyou_page']; ?>",
		momentDateFormat: "<?php echo pjUtil::toMomemtJS($tpl['option_arr']['o_date_format']); ?>",
		email_exiting_message: "<?php echo pjSanitize::clean(__('front_existing_email', true));?>"
	};
	
	<?php
	$dm = new pjDependencyManager(null, PJ_THIRD_PARTY_PATH);
	$dm->load(PJ_CONFIG_PATH . 'dependencies.php')->resolve();
	?>
	loadScript("<?php echo PJ_INSTALL_URL . $dm->getPath('storage_polyfill'); ?>storagePolyfill.min.js", function () {
		createSessionId();
		options.session_id = getSessionId();
		loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/pjQuery.min.js", function () {
			window.pjQ.$.browser = {
				msie: isMSIE()
			};
			loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/pjQuery.validate.min.js", function () {
				loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/bootstrap/js/moment-with-locales.min.js", function () {
					loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/bootstrap/js/bootstrap.min.js", function () {
						loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/fancybox/pjQuery.fancybox-1.3.4.min.js", function () {
							loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/pjQuery.ba-hashchange.min.js", function () {
								loadScript("<?php echo PJ_INSTALL_URL . PJ_LIBS_PATH; ?>pjQ/bootstrap/js/bootstrap-datetimepicker.min.js", function () {
									<?php if($tpl['option_arr']['o_captcha_type_front'] == 'google'): ?>
								    loadScript('https://www.google.com/recaptcha/api.js', function () {
		                            <?php endif; ?>
    		                            loadScript("<?php echo PJ_INSTALL_URL . PJ_JS_PATH; ?>pjHotelBooking.js", function () {
    										HotelBooking_<?php echo $cid; ?> = new HotelBooking(options);
    									});
									<?php if($tpl['option_arr']['o_captcha_type_front'] == 'google'): ?>
		                            });
								    <?php endif; ?>
								});
							});
						});
					});
				});
			});
		});
	});
})();
</script>