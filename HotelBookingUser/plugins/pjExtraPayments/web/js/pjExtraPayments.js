var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
(function ($, undefined) {
	$(function () {
		var validator,
			validate = ($.fn.validate !== undefined),
			$pjPluginAddPaymentForm = $("#pjPluginAddPaymentForm"),
			$pjPluginEditPaymentForm = $('#pjPluginEditPaymentForm');
		
		if ($pjPluginAddPaymentForm.length > 0 && validate) {
			$pjPluginAddPaymentForm.validate({
				onkeyup: false,
				ignore: "",
				submitHandler: function (form) {
					var $form = $(form),
						l = Ladda.create( $('.pj-plugin-ep-save-payment').get(0) );
					l.start();
					$.post("index.php?controller=pjExtraPayments&action=pjActionCreatePayment", $form.serialize()).done(function (data) {
						$('#pjPluginAddPaymentModal').modal('hide');
						$pjPluginAddPaymentForm.find('input[name="amount"]').val("");
						$pjPluginAddPaymentForm.find('select[name="payment_status"]').val("not_paid");
						$pjPluginAddPaymentForm.find('input[name="title"]').val("");
						$pjPluginAddPaymentForm.find('textarea[name="description"]').val("");
						l.stop();
						if(data.status == 'OK')
						{
							var foreign_id = data.foreign_id;
							$('#pjPluginExtraPaymentBox').addClass('sk-loading');
							$.get("index.php?controller=pjExtraPayments&action=pjActionGetExtraPayments", {foreign_id: foreign_id}).done(function (data) {
								$('#extraPaymentsTable').html(data);
								$('#pjPluginExtraPaymentBox').removeClass('sk-loading');
							});	
						}
					});	
					return false;
				}
			});
		}
		if ($pjPluginEditPaymentForm.length > 0 && validate) {
			$pjPluginEditPaymentForm.validate({
				onkeyup: false,
				ignore: "",
				submitHandler: function (form) {
					var $form = $(form),
						l = Ladda.create( $('.pj-plugin-ep-edit-extra-payment').get(0) );
					l.start();
					$.post("index.php?controller=pjExtraPayments&action=pjActionUpdatePayment", $form.serialize()).done(function (data) {
						$('#pjPluginEditPaymentModal').modal('hide');
						l.stop();
						if(data.status == 'OK')
						{
							var foreign_id = data.foreign_id;
							$('#pjPluginExtraPaymentBox').addClass('sk-loading');
							$.get("index.php?controller=pjExtraPayments&action=pjActionGetExtraPayments", {foreign_id: foreign_id}).done(function (data) {
								$('#extraPaymentsTable').html(data);
								$('#pjPluginExtraPaymentBox').removeClass('sk-loading');
							});	
						}
					});	
					return false;
				}
			});
		}
		$(document).on('click', '.pj-plugin-ep-add-payment', function(e){
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$('#pjPluginAddPaymentModal').modal('show');
		}).on('click', '.pj-plugin-ep-edit-extra-payment', function(e){
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$pjPluginEditPaymentForm.submit();
		}).on('click', '.pj-plugin-ep-save-payment', function(e){
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$pjPluginAddPaymentForm.submit();
		}).on('click', '#pj_plugin_ep_send_email', function(e){
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this);
			var $emailContentWrapper = $('#pjPluginEpContentWrapper');
			if (validator.form()) {
				$('#mceEditor').html( tinymce.get('mceEditor').getContent() );
				$(this).attr("disabled", true);
				var l = Ladda.create(this);
			 	l.start();
				$.post("index.php?controller=pjExtraPayments&action=pjActionSendPaymentEmail", $emailContentWrapper.find("form").serialize()).done(function (data) {
					$('#pjPluginSendExtraPaymentModal').modal('hide');
					$this.attr("disabled", false);
					l.stop();
				});
			}
			return false;
		}).on('click', '.pj-plugin-ed-delete-item', function(e){
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var id = $(this).attr('data-id');
			var foreign_id = $(this).attr('data-foreign_id');
			var $this = $(this);
			swal({
				title: myLabel.alert_plugin_ep_delete_payment_title,
				text: myLabel.alert_plugin_ep_delete_payment_text,
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: myLabel.alert_plugin_ep_btn_delete,
				cancelButtonText: myLabel.alert_plugin_ep_btn_cancel,
				closeOnConfirm: false,
				showLoaderOnConfirm: true
			}, function () {
				$.post($this.attr("href"), {id: id}).done(function (data) {
					swal.close();
					$('#pjPluginExtraPaymentBox').addClass('sk-loading');
					$.get("index.php?controller=pjExtraPayments&action=pjActionGetExtraPayments", {foreign_id: foreign_id}).done(function (data) {
						$('#extraPaymentsTable').html(data);
						$('#pjPluginExtraPaymentBox').removeClass('sk-loading');
					});	
				});
			});
		}).on("click", ".pj-plugin-ed-send-email", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var id = $(this).attr('data-id');
			var $emailContentWrapper = $('#pjPluginEpContentWrapper');
			$('#pj_plugin_ep_send_email').attr('data-id', id);
			
			$emailContentWrapper.html("");
			$.get("index.php?controller=pjExtraPayments&action=pjActionGetEmailContent", {
				"id": id
			}).done(function (data) {
				$emailContentWrapper.html(data);
				pluginTinyMceInit.call(null, 'textarea#mceEditor', 'mceEditor');
				validator = $emailContentWrapper.find("form").validate({
					
				});
				$('#pj_plugin_ep_send_email').show();	
				$('#pjPluginSendExtraPaymentModal').modal('show');
			});
			return false;
		}).on("click", ".pj-plugin-ed-edit-payment", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var id = $(this).attr('data-id');
			$.get("index.php?controller=pjExtraPayments&action=pjActionGetExtraPaymentDetails", {
				"id": id
			}).done(function (data) {
				$pjPluginEditPaymentForm.find('input[name="id"]').val(data.arr.id);
				$pjPluginEditPaymentForm.find('input[name="amount"]').val(data.arr.amount);
				$pjPluginEditPaymentForm.find('select[name="payment_status"]').val(data.arr.payment_status);
				$pjPluginEditPaymentForm.find('input[name="title"]').val(data.arr.title);
				$pjPluginEditPaymentForm.find('textarea[name="description"]').val(data.arr.description);
				$('#pjPluginExtraPaymentURL').html(data.url);
				$('#pjPluginExtraPaymentURL').parent().parent().parent().show();
				$('#pjPluginEditPaymentModal').modal('show');
			});
			return false;
		});
		
		$("#pjPluginSendExtraPaymentModal").on("hidden.bs.modal", function () {
        	if (tinymce.editors.length > 0) 
			{
		        tinymce.execCommand('mceRemoveEditor',true, "mceEditor");
		    }
        });
		function pluginTinyMceInit(pSelector, pValue) {
			tinymce.init({
				relative_urls : false,
				remove_script_host : false,
				convert_urls : true,
				browser_spellcheck : true,
			    contextmenu: false,
			    selector: pSelector,
			    theme: "modern",
			    height: 300,
			    plugins: [
			         "advlist autolink link image lists charmap print preview hr anchor pagebreak",
			         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
			         "save table contextmenu directionality emoticons template paste textcolor"
			    ],
			    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
			    image_advtab: true,
			    menubar: "file edit insert view table tools",
			    setup: function (editor) {
			    	editor.on('change', function (e) {
			    		editor.editorManager.triggerSave();
			    	});
			    }
			});
			if (tinymce.editors.length) {							
				tinymce.execCommand('mceAddEditor', true, pValue);
			}
		}
	});
})(jQuery_1_8_2);