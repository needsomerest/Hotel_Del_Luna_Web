var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmCreate = $("#frmCreate"),
			select2 = ($.fn.select2 !== undefined),
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
					$.post("index.php?controller=pjAdminRestrictions&action=pjActionAddRestriction", $(form).serialize()).done(function (data) {
						var content = $grid.datagrid("option", "content");
						$grid.datagrid("load", "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions", content.column, content.direction, content.page, content.rowCount);
						$(".select-rooms").val('').trigger('change');
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

            if (select2 && $(".select-rooms").length) {
                $(".select-rooms").select2({
                    allowClear: true
                });
            };
        }
		
        function formatRooms(str, obj) {
			if (obj.rooms.length) {
				return obj.rooms.join("<br>");
			}
			return "";
		}
		
		if ($("#grid").length > 0 && datagrid) {
			
			var $grid = $("#grid").datagrid({
				buttons: [{type: "edit", url: "index.php?controller=pjAdminRestrictions&action=pjActionUpdate&id={:id}"},
				          {type: "delete", url: "index.php?controller=pjAdminRestrictions&action=pjActionDelete&id={:id}"}
				          ],
		          columns: [
		                  {text: myLabel.date_from, type: "text", sortable: true, editable: false},
				          {text: myLabel.date_to, type: "text", sortable: true, editable: false},
				          {text: myLabel.rooms, type: "text", sortable: true, editable: false, renderer: formatRooms},
				          {text: myLabel.type, type: "select", sortable: true, editable: pjGrid.hasAccessUpdate, options: myLabel.types}
				          ],
				dataUrl: "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions",
				dataType: "json",
				fields: ['date_from', 'date_to', 'id', 'restriction_type'],
				paginator: {
					actions: [
					   {text: myLabel.delete_selected, url: "index.php?controller=pjAdminRestrictions&action=pjActionDeleteBulk", render: true, confirmation: myLabel.delete_confirmation},
					],
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminRestrictions&action=pjActionSaveRestriction&id={:id}",
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
			$grid.datagrid("load", "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions", content.column, content.direction, content.page, content.rowCount);
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
			$grid.datagrid("load", "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions", content.column, content.direction, content.page, content.rowCount);
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
			$grid.datagrid("load", "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("click", ".pj-table-icon-edit", function (e) {
			var $url = $(this).attr("href");
			$.get($url).done(function (data) {
				$(".boxFormRestriction").html(data);
				$("#frmUpdate").validate({
    				onkeyup: false,
    				submitHandler: function (form) {
    					var l = Ladda.create( $(form).find(":submit").get(0) );
    					l.start();
    					$.post("index.php?controller=pjAdminRestrictions&action=pjActionUpdate", $(form).serialize()).done(function (data) {
    						var content = $grid.datagrid("option", "content");
    						$grid.datagrid("load", "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions", content.column, content.direction, content.page, content.rowCount);
    						if(pjGrid.hasAccessCreate == true)
    						{
    							$(".pjBtnCancelUpdateRestriction").trigger("click");
        						$(".select-rooms").val('').trigger('change');
    						}else{
    							$(".boxFormRestriction").html("");
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
		}).on("click", ".pjBtnCancelUpdateRestriction", function (e) {
			if(pjGrid.hasAccessCreate == true)
			{
				var $url = 'index.php?controller=pjAdminRestrictions&action=pjActionCreate';
				$.get($url).done(function (data) {
					$(".boxFormRestriction").html(data);
					$("#frmCreate").validate({
						onkeyup: false,
						submitHandler: function (form) {
							var l = Ladda.create( $(form).find(":submit").get(0) );
							l.start();
							$.post("index.php?controller=pjAdminRestrictions&action=pjActionAddRestriction", $(form).serialize()).done(function (data) {
								var content = $grid.datagrid("option", "content");
								$grid.datagrid("load", "index.php?controller=pjAdminRestrictions&action=pjActionGetRestrictions", content.column, content.direction, content.page, content.rowCount);
								$(".select-rooms").val('').trigger('change');
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
				$(".boxFormRestriction").html("");
			}
			return false;
		});
	});
})(jQuery);