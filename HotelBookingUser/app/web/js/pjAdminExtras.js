var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmCreate = $("#frmCreate"),
			validate = ($.fn.validate !== undefined),
			multilang = ($.fn.multilang !== undefined),
			datagrid = ($.fn.datagrid !== undefined);
		
		if (multilang && myLabel.isFlagReady == 1) {
			$(".multilang").multilang({
				langs: pjLocale.langs,
				flagPath: pjLocale.flagPath,
				tooltip: "",
				select: function (event, ui) {
					$("input[name='locale_id']").val(ui.index);					
				}
			});
		}
		
		if ($frmCreate.length > 0 && validate) {
			$frmCreate.validate({
				onkeyup: false,
				submitHandler: function (form) {
					var price = parseFloat($('input[name="price"]').val());
					if(price <= 9999999.99)
					{
						var l = Ladda.create( $(form).find(":submit").get(0) );
						l.start();
						$.post("index.php?controller=pjAdminExtras&action=pjActionAddExtra", $(form).serialize()).done(function (data) {
							var content = $grid.datagrid("option", "content");
							$grid.datagrid("load", "index.php?controller=pjAdminExtras&action=pjActionGetExtras", content.column, content.direction, content.page, content.rowCount);
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
        
        function formatPrice (str, obj) {
			return obj.price_formated;
		}
		
		function formatPer (str, obj) {
			return obj.per_formated;
		}
		
		if ($("#grid").length > 0 && datagrid) {
			
			var $grid = $("#grid").datagrid({
				buttons: [{type: "edit", url: "index.php?controller=pjAdminExtras&action=pjActionUpdate&id={:id}"},
				          {type: "delete", url: "index.php?controller=pjAdminExtras&action=pjActionDelete&id={:id}"}
				          ],
		          columns: [{text: myLabel.extra_name, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate},
				          {text: myLabel.extra_per, type: "text", sortable: true, editable: false, renderer: formatPer},
				          {text: myLabel.extra_price, type: "text", sortable: true, editable: false, renderer: formatPrice},
				          {text: myLabel.extra_status, type: "toggle", sortable: true, editable: pjGrid.hasAccessUpdate, positiveLabel: myLabel.active, positiveValue: "T", negativeLabel: myLabel.inactive, negativeValue: "F"}
				          ],
				dataUrl: "index.php?controller=pjAdminExtras&action=pjActionGetExtras",
				dataType: "json",
				fields: ['name', 'per', 'price', 'status'],
				paginator: {
					actions: [
					   {text: myLabel.delete_selected, url: "index.php?controller=pjAdminExtras&action=pjActionDeleteBulk", render: true, confirmation: myLabel.delete_confirmation},
					],
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminExtras&action=pjActionSaveExtra&id={:id}",
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
			$grid.datagrid("load", "index.php?controller=pjAdminExtras&action=pjActionGetExtras", content.column, content.direction, content.page, content.rowCount);
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
			$grid.datagrid("load", "index.php?controller=pjAdminExtras&action=pjActionGetExtras", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("click", ".btn-filter", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this),
				content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache"),
				obj = {};
			$this.removeClass("btn-default").addClass("active").addClass("btn-primary").siblings(".btn").removeClass("active").removeClass("btn-primary").addClass("btn-default");
			obj.status = "";
			obj[$this.data("column")] = $this.data("value");
			$.extend(cache, obj);
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "index.php?controller=pjAdminExtras&action=pjActionGetExtras", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("click", ".pj-table-icon-edit", function (e) {
			var $url = $(this).attr("href");
			$.get($url).done(function (data) {
				$(".boxFormExtra").html(data);
				$("#frmUpdate").validate({
    				onkeyup: false,
    				submitHandler: function (form) {
    					var price = parseFloat($('input[name="price"]').val());
    					if(price <= 9999999.99)
    					{
	    					var l = Ladda.create( $(form).find(":submit").get(0) );
	    					l.start();
	    					$.post("index.php?controller=pjAdminExtras&action=pjActionUpdate", $(form).serialize()).done(function (data) {
	    						var content = $grid.datagrid("option", "content");
	    						$grid.datagrid("load", "index.php?controller=pjAdminExtras&action=pjActionGetExtras", content.column, content.direction, content.page, content.rowCount);
	    						if(pjGrid.hasAccessCreate == true)
	    						{
	    							$(".pjBtnCancelUpdateExtra").trigger("click");
	    						}else{
	    							$(".boxFormExtra").html("");
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
			});
			return false;
		}).on("click", ".pjBtnCancelUpdateExtra", function (e) {
			if(pjGrid.hasAccessCreate == true)
			{
				var $url = 'index.php?controller=pjAdminExtras&action=pjActionCreate';
				$.get($url).done(function (data) {
					$(".boxFormExtra").html(data);
					$("#frmCreate").validate({
						onkeyup: false,
						submitHandler: function (form) {
							var l = Ladda.create( $(form).find(":submit").get(0) );
							l.start();
							$.post("index.php?controller=pjAdminExtras&action=pjActionAddExtra", $(form).serialize()).done(function (data) {
								var content = $grid.datagrid("option", "content");
								$grid.datagrid("load", "index.php?controller=pjAdminExtras&action=pjActionGetExtras", content.column, content.direction, content.page, content.rowCount);
								$(form)[0].reset();
								l.stop();
							}).always(function () {
	    						l.stop();
	    					});
							return false;
						}
					});
				});
			}else{
				$(".boxFormExtra").html("");
			}
			return false;
		});
	});
})(jQuery);