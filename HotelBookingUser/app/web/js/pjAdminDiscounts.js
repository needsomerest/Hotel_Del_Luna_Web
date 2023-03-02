var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmAddFreeNight = $("#frmAddFreeNight"),
			$frmAddCode = $("#frmAddCode"),
			$frmAddPackage = $("#frmAddPackage"),
			datepicker = ($.fn.datepicker !== undefined),
			validate = ($.fn.validate !== undefined),
			datagrid = ($.fn.datagrid !== undefined),
			$grid_items = null;
		
		if ($('#datePickerOptions').length) {
        	$.fn.datepicker.dates['en'] = {
        		days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
    		    daysMin: $('#datePickerOptions').data('days').split("_"),
    		    daysShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    		    months: $('#datePickerOptions').data('months').split("_"),
    		    monthsShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    		    format: $('#datePickerOptions').data('format'),
            	weekStart: parseInt($('#datePickerOptions').data('wstart'), 10),
    		};
        };
        
        if ($frmAddFreeNight.length > 0 && validate) {
			$frmAddFreeNight.validate({
				onkeyup: false,
				submitHandler: function (form) {
					var l = Ladda.create( $(form).find(":submit").get(0) );
					l.start();
					$.post("index.php?controller=pjAdminDiscounts&action=pjActionAddFree", $(form).serialize()).done(function (data) {
						var content = $grid_frees.datagrid("option", "content");
						$grid_frees.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetFrees", content.column, content.direction, content.page, content.rowCount);
						$('#date_from').data('datepicker').setDate(null);
						$('#date_to').data('datepicker').setDate(null);
						$(form)[0].reset();
						l.stop();
					}).always(function () {
						l.stop();
					});
					return false;
				}
			});
		}
        
        if ($frmAddCode.length > 0 && validate) {
        	$frmAddCode.validate({
				onkeyup: false,
				submitHandler: function (form) {
					var price = parseFloat($('input[name="discount"]').val());
					if(price <= 9999999.99)
					{
						var l = Ladda.create( $(form).find(":submit").get(0) );
						l.start();
						$.post("index.php?controller=pjAdminDiscounts&action=pjActionAddCode", $(form).serialize()).done(function (data) {
							if (data.status == 'OK') {
								var content = $grid_codes.datagrid("option", "content");
								$grid_codes.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetCodes", content.column, content.direction, content.page, content.rowCount);
								$('#date_from').data('datepicker').setDate(null);
								$('#date_to').data('datepicker').setDate(null);
								$(form)[0].reset();
								$(".pjCodeMessage").html('').hide();
							} else {
								$(".pjCodeMessage").html(myLabel.code_existed).show();
							}
							l.stop();
						}).always(function () {
							l.stop();
						});
					}else{
						swal({
			    			title: "",
							text: myLabel.prices_invalid_input,
							type: "warning",
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "OK",
							closeOnConfirm: false,
							showLoaderOnConfirm: false
						}, function () {
							swal.close();
						});
					}
					return false;
				}
			});
		}
        
        if ($frmAddPackage.length > 0 && validate) {
        	$frmAddPackage.validate({
				onkeyup: false,
				submitHandler: function (form) {
					var price = parseFloat($('#total_price').val());
					if(price <= 9999999.99)
					{
						var l = Ladda.create( $(form).find(":submit").get(0) );
						l.start();
						$.post("index.php?controller=pjAdminDiscounts&action=pjActionAddPackage", $(form).serialize()).done(function (data) {
							var content = $grid_packages.datagrid("option", "content");
							$grid_packages.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetPackages", content.column, content.direction, content.page, content.rowCount);
							$('#date_from').data('datepicker').setDate(null);
							$('#date_to').data('datepicker').setDate(null);
							$(form)[0].reset();
							l.stop();
						}).always(function () {
							l.stop();
						});
					}else{
						swal({
			    			title: "",
							text: myLabel.prices_invalid_input,
							type: "warning",
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "OK",
							closeOnConfirm: false,
							showLoaderOnConfirm: false
						}, function () {
							swal.close();
						});
					}
					return false;
				}
			});
		}
        
        initOptions();
        
        function initOptions() {
        	if ($('.datepick').length > 0) {
            	$('.datepick').datepicker({autoclose: true}).on('changeDate', function (selected) {
            		if($(this).attr('name') == 'date_from')
            		{
            			if($('input[name="date_to"]').length > 0)
            			{
            				var $to = $('input[name="date_to"]');
            				var date_to_value = $to.datepicker("getUTCDate");
            				if(date_to_value < selected.date)
        					{
            					$to.val($('input[name="date_from"]').val());
        					}
            			}
            		}
            		
            		if($(this).attr('name') == 'date_to')
            		{
            			if($('input[name="date_from"]').length > 0)
            			{
            				var $from = $('input[name="date_from"]');
            				var date_from_value = $from.datepicker("getUTCDate");
            				if(date_from_value > selected.date)
        					{
            					$from.val($('input[name="date_to"]').val());
        					}
            			}
            		}
                });
            }

    		if($(".touchspin3").length > 0)
    		{
    			$(".touchspin3").TouchSpin({
    				verticalbuttons: true,
    	            buttondown_class: 'btn btn-white',
    	            buttonup_class: 'btn btn-white',
    	            max: 4294967295
    	        });
    		}
        }
		
		function formatDateFrom (str, obj) {
			return obj.date_from_formated;
		}
		
		function formatDateTo (str, obj) {
			return obj.date_to_formated;
		}
		
		if ($("#grid_frees").length > 0 && datagrid) {
			
			var buttonsOpt = [];
			var actionsOpts = [];
			buttonsOpt.push({type: "edit", url: "index.php?controller=pjAdminDiscounts&action=pjActionUpdateFree&id={:id}"});
			buttonsOpt.push({type: "delete", url: "index.php?controller=pjAdminDiscounts&action=pjActionDeleteFree&id={:id}"});
			actionsOpts.push({text: myLabel.delete_selected, url: "index.php?controller=pjAdminDiscounts&action=pjActionDeleteFreeBulk", render: true, confirmation: myLabel.delete_confirmation});
			var $grid_frees = $("#grid_frees").datagrid({
				buttons: buttonsOpt,
		          columns: [
		                  {text: myLabel.room, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate,  options: myLabel.rooms},
				          {text: myLabel.date_from, type: "text", sortable: true, editable: false, renderer: formatDateFrom},
				          {text: myLabel.date_to, type: "text", sortable: true, editable: false, renderer: formatDateTo},
				          {text: myLabel.min_length, type: "text", sortable: true, editable: false},
				          {text: myLabel.max_length, type: "text", sortable: true, editable: false},
				          {text: myLabel.free_nights, type: "text", sortable: true, editable: false}
				          ],
				dataUrl: "index.php?controller=pjAdminDiscounts&action=pjActionGetFrees",
				dataType: "json",
				fields: ['room_id', 'date_from', 'date_to', 'min_length', 'max_length', 'free_nights'],
				paginator: {
					actions: actionsOpts,
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminDiscounts&action=pjActionSaveFree&id={:id}",
				select: {
					field: "id",
					name: "record[]",
					cellClass: 'cell-width-2'
				}
			});
			
			$grid_frees.on("click", ".pj-table-icon-edit", function (e) {
				var $url = $(this).attr("href");
				$.get($url).done(function (data) {
					$(".boxFormFreeNight").html(data);
					$("#frmUpdateFreeNight").validate({
	    				onkeyup: false,
	    				submitHandler: function (form) {
	    					var l = Ladda.create( $(form).find(":submit").get(0) );
	    					l.start();
	    					$.post("index.php?controller=pjAdminDiscounts&action=pjActionUpdateFree", $(form).serialize()).done(function (data) {
	    						var content = $grid_frees.datagrid("option", "content");
	    						$grid_frees.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetFrees", content.column, content.direction, content.page, content.rowCount);
	    						if(pjGrid.hasAccessCreate == true)
	    						{
	    							$(".pjBtnCancelUpdateFree").trigger("click");
	    						}else{
	    							$(".boxFormFreeNight").html("");
	    						}
	    						l.stop();
	    					});
	    					return false;
	    				}
	    			});
					initOptions();
				});
				return false;
			});
		}
		
		if ($("#grid_codes").length > 0 && datagrid) {
			var buttonsOpt = [];
			var actionsOpts = [];
			buttonsOpt.push({type: "edit", url: "index.php?controller=pjAdminDiscounts&action=pjActionUpdateCode&id={:id}"});
			buttonsOpt.push({type: "delete", url: "index.php?controller=pjAdminDiscounts&action=pjActionDeleteCode&id={:id}"});
			actionsOpts.push({text: myLabel.delete_selected, url: "index.php?controller=pjAdminDiscounts&action=pjActionDeleteCodeBulk", render: true, confirmation: myLabel.delete_confirmation});
			var $grid_codes = $("#grid_codes").datagrid({
				buttons: buttonsOpt,
				columns: [
							{text: myLabel.room, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate,  options: myLabel.rooms},
							{text: myLabel.date_from, type: "text", sortable: true, editable: false, renderer: formatDateFrom},
							{text: myLabel.date_to, type: "text", sortable: true, editable: false, renderer: formatDateTo},
							{text: myLabel.promo_code, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate},
							{text: myLabel.type, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate, options: myLabel.types},
							{text: myLabel.discount, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate}
				          ],
				dataUrl: "index.php?controller=pjAdminDiscounts&action=pjActionGetCodes",
				dataType: "json",
				fields: ['room_id', 'date_from', 'date_to', 'promo_code', 'type', 'discount'],
				paginator: {
					actions: actionsOpts,
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminDiscounts&action=pjActionSaveCode&id={:id}",
				select: {
					field: "id",
					name: "record[]"
				}
			});
			
			$grid_codes.on("click", ".pj-table-icon-edit", function (e) {
				var $url = $(this).attr("href");
				$.get($url).done(function (data) {
					$(".boxFormPromoCode").html(data);
					$("#frmUpdateCode").validate({
	    				onkeyup: false,
	    				submitHandler: function (form) {
	    					var l = Ladda.create( $(form).find(":submit").get(0) );
	    					l.start();
	    					$.post("index.php?controller=pjAdminDiscounts&action=pjActionUpdateCode", $(form).serialize()).done(function (data) {
	    						if (data.status == 'OK') {
		    						var content = $grid_codes.datagrid("option", "content");
		    						$grid_codes.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetCodes", content.column, content.direction, content.page, content.rowCount);
		    						if(pjGrid.hasAccessCreate == true)
		    						{
		    							$(".pjBtnCancelUpdateCode").trigger("click");
		    						}else{
		    							$(".boxFormPromoCode").html("");
		    						}
	    						} else {
	    							$(".pjCodeMessage").html(myLabel.code_existed).show();
	    						}
	    						l.stop();
	    					}).always(function () {
	    						l.stop();
	    					});
	    					return false;
	    				}
	    			});
					initOptions();
				});
				return false;
			});
		}
		
		if ($("#grid_packages").length > 0 && datagrid) {
			
			function formatItems(val, obj) {
				if(pjGrid.hasAccessUpdate == true)
				{
					return ['<a href="#" class="btn btn-primary btn-outline btn-sm m-t-xs pjBtnAddMorePrice" data-id="', obj.id, '"><i class="fa fa-plus"></i> '+myLabel.more_price+'</a>'].join("");
				}else{
					return '';
				}
			}
			
			var buttonsOpt = [];
			var actionsOpts = [];
			buttonsOpt.push({type: "edit", url: "index.php?controller=pjAdminDiscounts&action=pjActionUpdatePackage&id={:id}"});
			buttonsOpt.push({type: "delete", url: "index.php?controller=pjAdminDiscounts&action=pjActionDeletePackage&id={:id}"});
			actionsOpts.push({text: myLabel.delete_selected, url: "index.php?controller=pjAdminDiscounts&action=pjActionDeletePackageBulk", render: true, confirmation: myLabel.delete_confirmation});
			var $grid_packages = $("#grid_packages").datagrid({
				buttons: buttonsOpt,
				columns: [
							{text: myLabel.room, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate,  options: myLabel.rooms},
							{text: myLabel.date_from, type: "text", sortable: true, editable: false, renderer: formatDateFrom},
							{text: myLabel.date_to, type: "text", sortable: true, editable: false, renderer: formatDateTo},
							{text: myLabel.start_day, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate,  options: myLabel.days},
							{text: myLabel.end_day, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate,  options: myLabel.days},
							{text: myLabel.total_price, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate},
							 {text: "", type: "text", sortable: false, editable: false, renderer: formatItems}
				          ],
				dataUrl: "index.php?controller=pjAdminDiscounts&action=pjActionGetPackages",
				dataType: "json",
				fields: ['room_id', 'date_from', 'date_to', 'start_day', 'end_day', 'total_price', 'id'],
				paginator: {
					actions: actionsOpts,
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminDiscounts&action=pjActionSavePackage&id={:id}",
				select: {
					field: "id",
					name: "record[]"
				}
			});
			
			$grid_packages.on("click", ".pj-table-icon-edit", function (e) {
				var $url = $(this).attr("href");
				$.get($url).done(function (data) {
					$(".boxFormPackage").html(data);
					$("#frmUpdatePackage").validate({
	    				onkeyup: false,
	    				submitHandler: function (form) {
	    					var price = parseFloat($('#total_price').val());
	    					if(price <= 9999999.99)
	    					{
		    					var l = Ladda.create( $(form).find(":submit").get(0) );
		    					l.start();
		    					$.post("index.php?controller=pjAdminDiscounts&action=pjActionUpdatePackage", $(form).serialize()).done(function (data) {
		    						var content = $grid_packages.datagrid("option", "content");
		    						$grid_packages.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetPackages", content.column, content.direction, content.page, content.rowCount);
		    						if(pjGrid.hasAccessCreate == true)
		    						{
		    							$(".pjBtnCancelUpdatePackage").trigger("click");
		    						}else{
		    							$(".boxFormPackage").html("");
		    						}
		    						l.stop();
		    					}).always(function () {
		    						l.stop();
		    					});
	    					}else{
	    						swal({
					    			title: "",
									text: myLabel.prices_invalid_input,
									type: "warning",
									confirmButtonColor: "#DD6B55",
									confirmButtonText: "OK",
									closeOnConfirm: false,
									showLoaderOnConfirm: false
								}, function () {
									swal.close();
								});
	    					}
	    					return false;
	    				}
	    			});
					initOptions();
				});
				return false;
			}).on("click", ".pjBtnAddMorePrice", function (e) {
				var $package_id = $(this).attr("data-id");
				$.get('index.php?controller=pjAdminDiscounts&action=pjActionPackageItems&package_id=' + $package_id, function(data) {
					$('.modal-content').html(data);
					if($(".touchspin3").length > 0)
		    		{
		    			$(".touchspin3").TouchSpin({
		    				verticalbuttons: true,
		    	            buttondown_class: 'btn btn-white',
		    	            buttonup_class: 'btn btn-white',
		    	            max: 4294967295
		    	        });
		    		}					
					
					$('#modalAddMorePrices').find("form").validate({
	    				onkeyup: false
	    			});
					
					function formatPrice (str, obj) {
						return obj.price_formated;
					}
					
					$grid_items = $('#modalAddMorePrices').find("#grid_items").datagrid({
						buttons: [{type: "delete", url: "index.php?controller=pjAdminDiscounts&action=pjActionDeletePackageItem&id={:id}"}],
						columns: [
						          {text: myLabel.adults, type: "text", sortable: true, editable: false},
						          {text: myLabel.children, type: "text", sortable: true, editable: false},
						          {text: myLabel.price, type: "text", sortable: true, editable: false, renderer: formatPrice}
						          ],
						dataUrl: "index.php?controller=pjAdminDiscounts&action=pjActionGetPackageItems&package_id=" + $package_id,
						dataType: "json",
						fields: ['adults', 'children', 'price'],
						paginator: false
					});
					
					$('#modalAddMorePrices').modal({show:true});
					
	            });				
			});
		}
		
		$(document).on("click", ".pjBtnCancelUpdateFree", function (e) {
			if(pjGrid.hasAccessCreate == true)
			{
				var $url = 'index.php?controller=pjAdminDiscounts&action=pjActionAddFree';
				$.get($url).done(function (data) {
					$(".boxFormFreeNight").html(data);
					$("#frmAddFreeNight").validate({
						onkeyup: false,
						submitHandler: function (form) {
							var l = Ladda.create( $(form).find(":submit").get(0) );
							l.start();
							$.post("index.php?controller=pjAdminDiscounts&action=pjActionAddFree", $(form).serialize()).done(function (data) {
								var content = $grid_frees.datagrid("option", "content");
								$grid_frees.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetFrees", content.column, content.direction, content.page, content.rowCount);
								$('#date_from').data('datepicker').setDate(null);
								$('#date_to').data('datepicker').setDate(null);
								$(form)[0].reset();
								l.stop();
							}).always(function () {
	    						l.stop();
	    					});
							return false;
						}
					});
					initOptions();
				});
			}else{
				$('.boxFormFreeNight').html("");
			}
			return false;
		}).on("click", ".pjBtnCancelUpdateCode", function (e) {
			if(pjGrid.hasAccessCreate == true)
			{
				var $url = 'index.php?controller=pjAdminDiscounts&action=pjActionAddCode';
				$.get($url).done(function (data) {
					$(".boxFormPromoCode").html(data);
					$("#frmAddCode").validate({
						onkeyup: false,
						submitHandler: function (form) {
							var l = Ladda.create( $(form).find(":submit").get(0) );
							l.start();
							$.post("index.php?controller=pjAdminDiscounts&action=pjActionAddCode", $(form).serialize()).done(function (data) {
								if (data.status == 'OK') {
									var content = $grid_codes.datagrid("option", "content");
									$grid_codes.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetCodes", content.column, content.direction, content.page, content.rowCount);
									$('#date_from').data('datepicker').setDate(null);
									$('#date_to').data('datepicker').setDate(null);
									$(form)[0].reset();
									$(".pjCodeMessage").html('').hide();
								} else {
									$(".pjCodeMessage").html(myLabel.code_existed).show();
								}
								l.stop();
							}).always(function () {
	    						l.stop();
	    					});
							return false;
						}
					});
					initOptions();
				});
			}else{
				$(".boxFormPromoCode").html("");
			}
			return false;
		}).on("click", ".pjBtnCancelUpdatePackage", function (e) {
			if(pjGrid.hasAccessCreate == true)
			{
				var $url = 'index.php?controller=pjAdminDiscounts&action=pjActionAddPackage';
				$.get($url).done(function (data) {
					$(".boxFormPackage").html(data);
					$("#frmAddPackage").validate({
						onkeyup: false,
						submitHandler: function (form) {
							var l = Ladda.create( $(form).find(":submit").get(0) );
							l.start();
							$.post("index.php?controller=pjAdminDiscounts&action=pjActionAddPackage", $(form).serialize()).done(function (data) {
								var content = $grid_packages.datagrid("option", "content");
								$grid_packages.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetPackages", content.column, content.direction, content.page, content.rowCount);
								$('#date_from').data('datepicker').setDate(null);
								$('#date_to').data('datepicker').setDate(null);
								$(form)[0].reset();
								l.stop();
							}).always(function () {
	    						l.stop();
	    					});
							return false;
						}
					});
					initOptions();
				});
			}else{
				$(".boxFormPackage").html("");
			}
			return false;
		});
		
		$('#modalAddMorePrices').on("click", ".pjBtnAddPrice", function (e) {
	    	if (e && e.preventDefault) {
				e.preventDefault();
			}
	    	var clone_text = $('#pjMorePriceClone').html(),
				index = Math.ceil(Math.random() * 999999);
			clone_text = clone_text.replace(/\{INDEX\}/g, 'hb_' + index);
			$('#modalAddMorePrices').find('#pjMorePriceContainer').append(clone_text);
			$('#modalAddMorePrices').find(".touchspin3_hb_" + index).TouchSpin({
				verticalbuttons: true,
	            buttondown_class: 'btn btn-white',
	            buttonup_class: 'btn btn-white',
	            max: 4294967295
	        });
		}).on("click", ".pjBtnSavePackageItem", function (e) {
	    	if (e && e.preventDefault) {
				e.preventDefault();
			}
	    	var $package_id = $(this).attr("data-package_id"),
	    		$form = $('#modalAddMorePrices').find("form");
	    	if ($form.valid()) {
		    	var l = Ladda.create( $(this).get(0) );
				l.start();
				$.post("index.php?controller=pjAdminDiscounts&action=pjActionPackageAddItem", $form.serialize()).done(function (data) {
					$('#modalAddMorePrices').find("#pjMorePriceContainer").html('');
					$('#modalAddMorePrices').find(".pjBtnAddPrice").trigger("click");
					var content = $grid_items.datagrid("option", "content");
					$grid_items.datagrid("load", "index.php?controller=pjAdminDiscounts&action=pjActionGetPackageItems&package_id=" + $package_id, content.column, content.direction, content.page, content.rowCount);
					l.stop();
				}).always(function () {
					l.stop();
				});
	    	}
			return false;
		});
		
		$(document).ajaxStart(function() {
		  $(".sk-spinner").show();
		}).ajaxStop(function() {
		  $(".sk-spinner").hide();
		});
		
	});
})(jQuery);