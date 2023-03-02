var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmCreate = $("#frmCreate"),
			$frmUpdate = $("#frmUpdate"),
			$gallery = $("#gallery"),
			multilang = ($.fn.multilang !== undefined),
			validate = ($.fn.validate !== undefined),
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
		if($(".touchspin3").length > 0)
		{
			$(".touchspin3").TouchSpin({
				verticalbuttons: true,
	            buttondown_class: 'btn btn-white',
	            buttonup_class: 'btn btn-white',
	            max: 4294967295
	        });
		}
		
		if (validate) {
			$.validator.addMethod('notEqual', function (value, element, param) {
				var j, i, iCnt,
					cache = [], 
					current = element.value;
				
				$('input[name^="number["]').each(function() {
					cache.push(this.value);
				});
				
				for (j = 0, i = 0, iCnt = cache.length; i < iCnt; i += 1) {
					if (cache[i] === current) {
						j += 1;
					}
				}
				
				if (j > 1) {
					return false;
				}
				return true;
				
			}, 'Can not use the same value.');
		}
		
		if ($frmCreate.length > 0 && validate) {
			$frmCreate.validate({
				rules: {
					room_number: {
						required: function () {
							if ($('#cnt').val() != '') {
								var result = false;
								$('.number-field').each(function(i, ele) {
								    if ($(ele).val() == '') {
								    	result = true;
								    }
								});
								return result;
							} else {
								return false;
							}
						}
					}
				},
				onkeyup: false
			});
			
			$frmUpdate.find('input[name^="number["]').each(function(index, element) {
				$(this).rules('add', 'notEqual');
			});
		}
		if ($frmUpdate.length > 0 && validate) {
			$frmUpdate.validate({
				rules: {
					room_number: {
						required: function () {
							if ($('#cnt').val() != '') {
								var result = false;
								$('.number-field').each(function(i, ele) {
								    if ($(ele).val() == '') {
								    	result = true;
								    }
								});
								return result;
							} else {
								return false;
							}
						}
					}
				},
				onkeyup: false
			});
			
			$frmUpdate.find('input[name^="number["]').each(function(index, element) {
				$(this).rules('add', 'notEqual');
			});
		}
		
		function formatImage (str, obj) {
			return ['<a href="index.php?controller=pjAdminRooms&action=pjActionUpdate&id=', obj.id,'"><img src="', str, '" alt="" style="max-width: 100px"></a>'].join("");
		}
		
		if ($("#grid").length > 0 && datagrid) 
		{
			var buttonsOpt = [];
			var actionsOpts = [];
			buttonsOpt.push({type: "usd", title: '', url: "index.php?controller=pjAdminPrices&action=pjActionIndex&room_id={:id}"});
			buttonsOpt.push({type: "edit", url: "index.php?controller=pjAdminRooms&action=pjActionUpdate&id={:id}"});
			buttonsOpt.push({type: "delete", url: "index.php?controller=pjAdminRooms&action=pjActionDelete&id={:id}"});
			actionsOpts.push({text: myLabel.delete_selected, url: "index.php?controller=pjAdminRooms&action=pjActionDeleteBulk", render: true, confirmation: myLabel.delete_confirmation});
			var $grid = $("#grid").datagrid({
				buttons: buttonsOpt,
				columns: [{text: myLabel.image, type: "text", sortable: false, editable: false, renderer: formatImage},
					          {text: myLabel.name, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate},
					          {text: myLabel.adults, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate},
					          {text: myLabel.children, type: "text", sortable: true, editable: pjGrid.hasAccessUpdate},
					          {text: myLabel.cnt, type: "text", sortable: true, editable: false},
					          ],
				dataUrl: "index.php?controller=pjAdminRooms&action=pjActionGetRoom",
				dataType: "json",
				fields: ['image', 'name', 'adults', 'children', 'cnt'],
				paginator: {
					actions: actionsOpts,
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminRooms&action=pjActionSave&id={:id}",
				select: {
					field: "id",
					name: "record[]",
					cellClass: 'cell-width-2'
				}
			});
		}
		
		if ($gallery.length > 0 && gallery) {
			$gallery.gallery({
				compressUrl: "index.php?controller=pjGallery&action=pjActionCompressGallery&model=pjRoom&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash,
				getUrl: "index.php?controller=pjGallery&action=pjActionGetGallery&model=pjRoom&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash,
				deleteUrl: "index.php?controller=pjGallery&action=pjActionDeleteGallery",
				emptyUrl: "index.php?controller=pjGallery&action=pjActionEmptyGallery&model=pjRoom&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash,
				rebuildUrl: "index.php?controller=pjGallery&action=pjActionRebuildGallery&model=pjRoom&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash,
				resizeUrl: "index.php?controller=pjGallery&action=pjActionCrop&model=pjRoom&id={:id}&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash + ($frmUpdate.length > 0 ? "&query_string=" + encodeURIComponent("controller=pjAdminRooms&action=pjActionUpdate&id=" + myGallery.foreign_id + "&tab=4") : ""),
				rotateUrl: "index.php?controller=pjGallery&action=pjActionRotateGallery",
				sortUrl: "index.php?controller=pjGallery&action=pjActionSortGallery",
				updateUrl: "index.php?controller=pjGallery&action=pjActionUpdateGallery",
				uploadUrl: "index.php?controller=pjGallery&action=pjActionUploadGallery&model=pjRoom&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash,
				watermarkUrl: "index.php?controller=pjGallery&action=pjActionWatermarkGallery&model=pjRoom&foreign_id=" + myGallery.foreign_id + "&hash=" + myGallery.hash
			});
		}
		
		function loadRoomNumber() {
			var number_of_rooms = parseInt($('#cnt').val(), 10),
				$hbRoomNumber = $('#hbRoomNumber'),
				$roomNo = $(".room-no"),
				i = 1,
				type = '',
				existing_number = $hbRoomNumber.find('input').length,
				tmp = 1;
			if (number_of_rooms == 0) {
				$roomNo.hide();
				$hbRoomNumber.prev().html($hbRoomNumber.data("enter"));
				$hbRoomNumber.parent().siblings().html('');
			} else {
				$roomNo.show();
			}
			if ($('.field-name').val() != '') {
				var str = $('.field-name').val(),
					words = str.split(' ');
				if (words.length > 1) {
					$.each(words, function() {
				        var first_letter = this.substring(0,1);
				        type += first_letter.toUpperCase();
				    });
				} else {
					type += words[0].substring(0,1).toUpperCase();
				}
			}
			if (existing_number == 0) {
				$hbRoomNumber.html("");
			}
			if (existing_number < number_of_rooms && existing_number > 0) {
				tmp = existing_number + 1;
			}
			if (existing_number > number_of_rooms) {
				$('.number-field').each(function(i, ele) {
					var index = parseInt($(ele).attr('data-index'),10)
				    if (index > number_of_rooms) {
				    	$(this).closest(".room-number-item").remove();
				    	$(this).closest(".room-number-item").rules('remove', 'notEqual');
				    }
				});
			} else {
				if (existing_number != number_of_rooms) {
					for (i = tmp; i <= number_of_rooms; i++) {
						$hbRoomNumber.append('<div class="col-lg-3 col-md-4 col-xs-6 room-number-item"><div class="form-group"><input class="form-control number-field" type="text" name="number[new_'+i+']" value="'+type+i+'" data-index="'+i+'" maxlength="50" /></div><!-- /.form-group -->');
						$hbRoomNumber.find('input:last').rules('add', 'notEqual');
					}
				}
			}
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
			$grid.datagrid("load", "index.php?controller=pjAdminRooms&action=pjActionGetRoom", content.column, content.direction, content.page, content.rowCount);
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
			$grid.datagrid("load", "index.php?controller=pjAdminRooms&action=pjActionGetRoom", content.column, content.direction, content.page, content.rowCount);
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
			$grid.datagrid("load", "index.php?controller=pjAdminRooms&action=pjActionGetRoom", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("change", "#cnt", function (e) {
			loadRoomNumber();
		});
	});
})(jQuery);