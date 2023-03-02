var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmCreate = $("#frmCreate"),
			datepicker = ($.fn.datepicker !== undefined),
			validate = ($.fn.validate !== undefined),
			datagrid = ($.fn.datagrid !== undefined);
		
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
        
        if ($frmCreate.length > 0 && validate) {
			$frmCreate.validate({
				onkeyup: false,
				submitHandler: function (form) {
					var l = Ladda.create( $(form).find(":submit").get(0) );
					l.start();
					$.post("index.php?controller=pjAdminLimits&action=pjActionAddLimit", $(form).serialize()).done(function (data) {
						var content = $grid.datagrid("option", "content");
						$grid.datagrid("load", "index.php?controller=pjAdminLimits&action=pjActionGetLimits", content.column, content.direction, content.page, content.rowCount);
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
		
		function formatStartOn (str, obj) {
			return obj.start_on_formated;
		}
		
		if ($("#grid").length > 0 && datagrid) {
			var buttonsOpt = [];
			var actionsOpts = [];
			buttonsOpt.push({type: "edit", url: "index.php?controller=pjAdminLimits&action=pjActionUpdate&id={:id}"});
			buttonsOpt.push({type: "delete", url: "index.php?controller=pjAdminLimits&action=pjActionDelete&id={:id}"});
			actionsOpts.push({text: myLabel.delete_selected, url: "index.php?controller=pjAdminLimits&action=pjActionDeleteBulk", render: true, confirmation: myLabel.delete_confirmation});
			var $grid = $("#grid").datagrid({
				buttons: buttonsOpt,
		          columns: [{text: myLabel.room, type: "text", sortable: true, editable: false},
				          {text: myLabel.date_from, type: "text", sortable: true, editable: false, renderer: formatDateFrom},
				          {text: myLabel.date_to, type: "text", sortable: true, editable: false, renderer: formatDateTo},
				          {text: myLabel.start_on, type: "text", sortable: true, editable: false, renderer: formatStartOn},
				          {text: myLabel.min_nights, type: "text", sortable: true, editable: false},
				          {text: myLabel.max_nights, type: "text", sortable: true, editable: false}
				          ],
				dataUrl: "index.php?controller=pjAdminLimits&action=pjActionGetLimits",
				dataType: "json",
				fields: ['room_name', 'date_from', 'date_to', 'start_on', 'min_nights', 'max_nights'],
				paginator: {
					actions: actionsOpts,
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminLimits&action=pjActionSave&id={:id}",
				select: {
					field: "id",
					name: "record[]",
					cellClass: 'cell-width-2'
				}
			});
		}
		
		
		$(document).on("submit", ".frm-filter", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this),
				content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache");
			$.extend(cache, {
				q: $this.find("input[name='q']").val()
			});
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "index.php?controller=pjAdminLimits&action=pjActionGetLimits", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("click", ".btn-all", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$(this).addClass("active").siblings(".btn").removeClass("active");
			var content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache");
			$.extend(cache, {
				status: "",
				q: ""
			});
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "index.php?controller=pjAdminLimits&action=pjActionGetLimits", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("click", ".btn-filter", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this),
				content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache"),
				obj = {};
			$this.addClass("active").siblings(".btn").removeClass("active");
			obj.status = "";
			obj[$this.data("column")] = $this.data("value");
			$.extend(cache, obj);
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "index.php?controller=pjAdminLimits&action=pjActionGetLimits", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("click", ".pj-table-icon-edit", function (e) {
			var $url = $(this).attr("href");
			$.get($url).done(function (data) {
				$(".boxFormLimit").html(data);
				$("#frmUpdate").validate({
    				onkeyup: false,
    				submitHandler: function (form) {
    					var l = Ladda.create( $(form).find(":submit").get(0) );
    					l.start();
    					$.post("index.php?controller=pjAdminLimits&action=pjActionUpdate", $(form).serialize()).done(function (data) {
    						var content = $grid.datagrid("option", "content");
    						$grid.datagrid("load", "index.php?controller=pjAdminLimits&action=pjActionGetLimits", content.column, content.direction, content.page, content.rowCount);
    						if(pjGrid.hasAccessCreate == true)
    						{
    							$(".pjBtnCancelUpdateLimit").trigger("click");
    						}else{
    							$(".boxFormLimit").html("");
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
		}).on("click", ".pjBtnCancelUpdateLimit", function (e) {
			if(pjGrid.hasAccessCreate == true)
			{
				var $url = 'index.php?controller=pjAdminLimits&action=pjActionCreate';
				$.get($url).done(function (data) {
					$(".boxFormLimit").html(data);
					$("#frmCreate").validate({
						onkeyup: false,
						submitHandler: function (form) {
							var l = Ladda.create( $(form).find(":submit").get(0) );
							l.start();
							$.post("index.php?controller=pjAdminLimits&action=pjActionAddLimit", $(form).serialize()).done(function (data) {
								var content = $grid.datagrid("option", "content");
								$grid.datagrid("load", "index.php?controller=pjAdminLimits&action=pjActionGetLimits", content.column, content.direction, content.page, content.rowCount);
								$('#date_from').data('datepicker').setDate(null);
								$('#date_to').data('datepicker').setDate(null);
								$(form)[0].reset();
								l.stop();
							});
							return false;
						}
					});
					initOptions();
				});
			}else{
				$(".boxFormLimit").html("");
			}
			return false;
		});
	});
})(jQuery);