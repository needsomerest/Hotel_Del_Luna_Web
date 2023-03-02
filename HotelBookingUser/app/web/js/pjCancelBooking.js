(function (window, undefined){
	"use strict";

	pjQ.$.ajaxSetup({
		xhrFields: {
			withCredentials: true
		}
	});
	
	pjQ.$.validator.setDefaults({
	    highlight: function(element) {
	        pjQ.$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
	    },
	    unhighlight: function(element) {
	    	pjQ.$(element).closest('.form-group').removeClass('has-error').addClass("has-success");
	    },
	    errorElement: 'span',
	    errorClass: 'help-block',
	    errorPlacement: function(error, element) {
	        if(element.parent('.input-group').length || element.prop('type') === 'checkbox') {
	            error.insertAfter(element.parent());
	        } else {
	            error.insertAfter(element);
	        }
	    }
	});
	
	var document = window.document,
		validate = (pjQ.$.fn.validate !== undefined),
		routes = [
			{pattern: /^#!\/Cancel\/id:(\d+)?\/hash:(.*)?$/, eventName: "loadCancel"}
	    ],
	    defaults = {
	    	scrollOffset: 80,
	    	scrollTop: true,
	    	scrollSpeed: 1000,
	    	scrollCounter: 0
	    };
	
	function log() {
		if (window && window.console && window.console.log) {
			window.console.log.apply(window.console, arguments);
		}
	}
	
	function assert() {
		if (window && window.console && window.console.assert) {
			window.console.assert.apply(window.console, arguments);
		}
	}
	
	function hashBang(value) {
		if (value !== undefined && value.match(/^#!\//) !== null) {
			if (window.location.hash == value) {
				return false;
			}
			window.location.hash = value;
			return true;
		}
		
		return false;
	}
	
	function onHashChange() {
		var i, iCnt, m;
		for (i = 0, iCnt = routes.length; i < iCnt; i++) {
			m = window.location.hash.match(routes[i].pattern);
			if (m !== null) {
				pjQ.$(window).trigger(routes[i].eventName, m.slice(1));
				break;
			}
		}
		if (m === null) {
			pjQ.$(window).trigger("loadInit");
		}
	}
	
	pjQ.$(window).on("hashchange", function (e) {
    	onHashChange.call(null);
    });
	
	function CancelBooking(opts) {
		if (!(this instanceof CancelBooking)) {
			return new CancelBooking(opts);
		}
		this.reset.call(this);
		this.init.call(this, opts);
		return this;
	}
	
	CancelBooking.timeToISO = function (time) {
		var dt = new Date(time),
			m = (dt.getMonth() + 1).toString(),
			d = dt.getDate().toString();
		m = m.length === 1 ? "0" + m : m;
		d = d.length === 1 ? "0" + d : d;
		
		return [dt.getFullYear(), m, d].join("-");
	};
	CancelBooking.prototype = {
		reset: function () {
			this.opts = null;
			this.$body = pjQ.$("html, body");
			this.$container = null;
			this.container = null;
			this.id = null;
			this.hash = null;
			return this;
		},
		init: function (opts) {
			var self = this;
			this.opts = pjQ.$.extend({}, defaults, opts);
			
			this.container = document.getElementById("pjCancelBookingContainer_" + this.opts.cid);
			this.$container = pjQ.$(this.container);
			
			pjQ.$("html").attr('dir',self.opts.direction);
			
			// Event delegation
			this.$container.on("click.hb", ".hbSelectorLocale", function (e) {
				if (e && e.preventDefault) {
					e.preventDefault();
				}
				var locale = pjQ.$(this).data("id");
				var dir = pjQ.$(this).data("dir");
				self.opts.direction = dir;
				self.opts.locale = locale;
				pjQ.$(this).addClass("hbLocaleFocus").parent().parent().find("a.hbSelectorLocale").not(this).removeClass("hbLocaleFocus");
				
				self.disableButtons.call(self);
				var qs = {
						"cid": self.opts.cid,
						"locale_id": locale
					};
				if(self.opts.session_id != '')
				{
					qs.session_id = self.opts.session_id;
				}
				pjQ.$.get([self.opts.folder, "index.php?controller=pjFront&action=pjActionLocale"].join(""), qs).done(function (data) {
					pjQ.$("html").attr('dir',dir);
					onHashChange.call(null);
				}).fail(function () {
					self.enableButtons.call(self);
				});
				return false;
			});
			
			//Custom events
			pjQ.$(window).on("loadCancel", this.container, function (e, id, hash) {
				self.id = id;
				self.hash = hash;
				self.loadCancel.call(self);
			});
			if (window.location.hash.length === 0) {
				this.loadCancel.call(this);
			} else {
				onHashChange.call(null);
			}
		},
		disableButtons: function () {
			var $el;
			this.$container.find(".btn").each(function (i, el) {
				$el = pjQ.$(el).prop("disabled", true);
			});
		},
		enableButtons: function () {
			this.$container.find(".btn").prop("disabled", false);
		},
		loadCancel: function () {
			var self = this;
			var ajax_url = [self.opts.folder, "index.php?controller=pjFrontPublic&action=pjActionCancel"].join("");
			if(self.opts.session_id != '')
			{
				ajax_url = [self.opts.folder, "index.php?controller=pjFrontPublic&action=pjActionCancel", "&session_id=", self.opts.session_id].join("");
			}
			pjQ.$.get(ajax_url, {
				"cid": this.opts.cid,
				"locale": this.opts.locale,
				"hide": this.opts.hide,
				"id": self.id,
				"hash": self.hash
			}).done(function (data) {
				self.$container.html(data);
				if (validate) 
				{
					var $form = self.$container.find("form");
					$form.validate({
						ignore: ".ignore",
						onkeyup: false,
						submitHandler: function (form) {
							self.disableButtons.call(self);
							pjQ.$.post([self.opts.folder, "index.php?controller=pjFrontPublic&action=pjActionCancel", "&session_id=", self.opts.session_id].join(""), $form.serialize()).done(function (data) {
								var $alert_message = pjQ.$('#pjCancelBookingAlert');
								$alert_message.html(data.text).removeClass('alert-warning alert-success');
								if(data.status == 'OK')
								{
									$alert_message.addClass('alert-success');
									$form.hide();
								}else{
									$alert_message.addClass('alert-warning');
									self.enableButtons.call(self);
								}
								$alert_message.show();
							}).fail(function () {
								self.enableButtons.call(self);
							});
							return false;
						}
					});
				}
			}).fail(function () {
				self.enableButtons.call(self);
			});
		},
	};
	
	// expose
	window.CancelBooking = CancelBooking;
})(window);