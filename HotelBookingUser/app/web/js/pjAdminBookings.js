var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var validator,
			booking_id = "",
			hash = "",
			$frmCreate = $("#frmCreate"),
			$frmUpdate = $("#frmUpdate"),
			select2 = ($.fn.select2 !== undefined),
			datepicker = ($.fn.datepicker !== undefined),
			validate = ($.fn.validate !== undefined),
			multilang = ($.fn.multilang !== undefined),
			datagrid = ($.fn.datagrid !== undefined);
		
		if (select2 && $(".select-countries").length) {
            $(".select-countries").select2({
                allowClear: true
            });
        };
        
		if($(".touchspin3").length > 0)
		{
			$(".touchspin3").TouchSpin({
				verticalbuttons: true,
	            buttondown_class: 'btn btn-white',
	            buttonup_class: 'btn btn-white',
	            max: 4294967295
	        });
		}
		
		if($('.i-checks').length > 0)
		{
			$('.i-checks').iCheck({
	            checkboxClass: 'icheckbox_square-green',
	            radioClass: 'iradio_square-green'
	        });
		}
		
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
        
        if ($('.datepick').length > 0) {
        	$('.datepick').datepicker({autoclose: true}).on('changeDate', function (selected) {
        		if($(this).attr('name') == 'date_from')
        		{
        			if($('input[name="date_to"]').length > 0)
        			{
        				var based_on = $(this).attr('data-based'),
        					inst = new Date(selected.date);
						if(based_on == 'days') {
							var nextDate = new Date(inst.getFullYear(), inst.getMonth(), inst.getDate());
						} else {
							var nextDate = new Date(inst.getFullYear(), inst.getMonth(), inst.getDate() + 1);
						}												
        				var $to = $('input[name="date_to"]'),
        					date_to_value = $to.datepicker("getUTCDate");
        				if(based_on == 'days' && date_to_value < selected.date)
    					{
        					$to.val($('input[name="date_from"]').val());
    					} else if (based_on == 'nights' && date_to_value <= selected.date) {
    						$to.datepicker('setDate', nextDate);
    					}
        				$to.datepicker('setStartDate', nextDate);
        			}
        		}
        		
        		if($(this).attr('name') == 'date_to')
        		{
        			if($('input[name="date_from"]').length > 0)
        			{
        				var based_on = $(this).attr('data-based'),
        					$from = $('input[name="date_from"]'),
        					date_from_value = $from.datepicker("getUTCDate");
        				if(based_on == 'days' && date_from_value > selected.date)
    					{
        					$from.val($('input[name="date_to"]').val());
    					} else if(based_on == 'nights' && date_from_value >= selected.date) {
    						var inst = new Date(selected.date),
    							prevDate = new Date(inst.getFullYear(), inst.getMonth(), inst.getDate() - 1);
    						$from.datepicker('setDate', prevDate);
    					}
        			}
        		}
        		
        		if($(this).attr('name') == 'arrival_from')
        		{
        			var minDate = new Date(selected.date.valueOf());
        			if($('input[name="arrival_to"]').length > 0)
        			{
        				var $to = $('input[name="arrival_to"]');
        				var date_to_value = $to.datepicker("getUTCDate");
        				if(date_to_value < selected.date)
    					{
        					$to.val($('input[name="arrival_from"]').val());
    					}
        				$to.datepicker('setStartDate', minDate);
        			}
        		}
        		if($(this).attr('name') == 'departure_from')
        		{
        			var minDate = new Date(selected.date.valueOf());
        			if($('input[name="departure_to"]').length > 0)
        			{
        				var $to = $('input[name="departure_to"]');
        				var date_to_value = $to.datepicker("getUTCDate");
        				if(date_to_value < selected.date)
    					{
        					$to.val($('input[name="departure_from"]').val());
    					}
        				$to.datepicker('setStartDate', minDate);
        			}
        		}
            });
        }
		if ($frmCreate.length > 0 && validate) {
			$frmCreate.validate({
				rules: {
					uuid: {
						remote: "index.php?controller=pjAdminBookings&action=pjActionCheckUID"
					}
				},
				onkeyup: false,
				ignore: "",
				invalidHandler: function (event, validator) {
				    if (validator.numberOfInvalids()) {
				    	var $_id = $(validator.errorList[0].element, this).closest("div[id^='tab-']").attr("id");
				    	$('.nav-'+$_id).trigger("click");
				    };
				},
				submitHandler: function (form) {
					if($(form).find(":submit").get(0))
					{
						var l = Ladda.create( $(form).find(":submit").get(0) );
						l.start();
					}		
					if($(form).find(":submit").get(1))
					{
						var l = Ladda.create( $(form).find(":submit").get(1) );
						l.start();
					}	
					return true;
				}
			});
			
			hash = $frmCreate.find("input[name='hash']").val();
			getBookingRooms.call(null, booking_id, hash);
		}
		
		if ($frmUpdate.length > 0 && validate) {
			$frmUpdate.validate({
				rules: {
					uuid: {
						remote: "index.php?controller=pjAdminBookings&action=pjActionCheckUID&id=" + $frmUpdate.find("input[name='id']").val()
					}
				},
				onkeyup: false,
				ignore: "",
				invalidHandler: function (event, validator) {
				    if (validator.numberOfInvalids()) {
				    	var $_id = $(validator.errorList[0].element, this).closest("div[id^='tab-']").attr("id");
				    	$('.nav-'+$_id).trigger("click");
				    };
				},
				submitHandler: function (form) {
					if($(form).find(":submit").get(0))
					{
						var l = Ladda.create( $(form).find(":submit").get(0) );
						l.start();
					}		
					if($(form).find(":submit").get(1))
					{
						var l = Ladda.create( $(form).find(":submit").get(1) );
						l.start();
					}
					return true;
				}
			});
			
			booking_id = $frmUpdate.find("input[name='id']").val();
			getBookingRooms.call(null, booking_id, hash);
		}
		
		function getBookingRooms(booking_id, hash){
			$.get("index.php?controller=pjAdminBookings&action=pjActionGetBookingRooms", {
				"booking_id": booking_id,
				"hash": hash
			}).done(function (data) {
				$("#boxRooms").html(data);				
			});
		}
		
		function getBookingAddRoom($form, $id){
			$.get("index.php?controller=pjAdminBookings&action=pjActionAddBookingRoom", {
				"date_from": $form.find("input[name='date_from']").val(),
				"date_to": $form.find("input[name='date_to']").val(),
				"booking_id": $form.find("input[name='id']").val(),
				"hash": $form.find("input[name='hash']").val(),
				"booking_room_id": $id,
			}).done(function (data) {
				$("#addBookingRoomBody").html(data);
				if($("#editBookingRoomBody").length > 0)
				{
					$("#editBookingRoomBody").html("");
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
				$('#add_room_id').trigger("change");
				$('#addBookingRoomModal').modal('show');
			});
		}
        
		function formatDates(val, obj) {
			return [$.datagrid._formatDate(val, pjGrid.jsDateFormat), ' - ', $.datagrid._formatDate(obj.date_to, pjGrid.jsDateFormat)].join("");
		}
		
		function formatRooms(val, obj) {
			var arr = [], i, iCnt;
			for (i = 0, iCnt = obj.rooms.length; i < iCnt; i++) {
				arr.push([obj.rooms[i].cnt, " x ", obj.rooms[i].name, ' - ', obj.rooms[i].room_number].join(""));
			}
			
			return arr.join("<br>");
		}
		function formatBid (str, obj) {
			return ['<a href="index.php?controller=pjAdminBookings&action=pjActionUpdate&id=', obj.id, '">', obj.uuid, '</a><br>', obj.created].join("");
		}
		
		if ($("#grid").length > 0 && datagrid) {
			
			var cache = {},
				search = window.location.search,
				_status = search.match(/&status=(\w+)/),
				_date_from = search.match(/&date_from=([\d\-\.\/]+)/),
				_date_to = search.match(/&date_to=([\d\-\.\/]+)/),
				_today = search.match(/&today=([\d\-\.\/]+)/)
			if (_status) {
				cache.status = _status[1];
			}
			if (_date_from) {
				cache.date_from = _date_from[1];
			}
			if (_date_to) {
				cache.date_to = _date_to[1];
			}
			if (_today) {
				cache.today = _today[1];
			}
			
			function formatStatus(val, obj) {
				if(val == 'confirmed')
				{
					return '<div class="btn bg-confirmed btn-xs no-margin"><i class="fa fa-check"></i> ' + myLabel.confirmed + '</div>';
				}else if(val == 'cancelled'){
					return '<div class="btn bg-cancelled btn-xs no-margin"><i class="fa fa-times"></i> ' + myLabel.cancelled + '</div>';
				}else if(val == 'not_confirmed'){
					return '<div class="btn bg-not_confirmed btn-xs no-margin"><i class="fa fa-times"></i> ' + myLabel.not_confirmed + '</div>';
				}else if(val == 'pending'){
					return '<div class="btn bg-pending btn-xs no-margin"><i class="fa fa-exclamation-triangle"></i> ' + myLabel.pending + '</div>';
				}
			}
			var buttonsOpts = false;
			var actionsOpt = false;
			actionsOpt = [
				{text: myLabel.delete_selected, url: "index.php?controller=pjAdminBookings&action=pjActionDeleteBookingBulk", render: true, confirmation: myLabel.delete_confirmation},
				{text: myLabel.exported, url: "index.php?controller=pjAdminBookings&action=pjActionExportBooking", ajax: false}
			];
			buttonsOpts = [
				{type: "edit", url: "index.php?controller=pjAdminBookings&action=pjActionUpdate&id={:id}"},
		        {type: "delete", url: "index.php?controller=pjAdminBookings&action=pjActionDeleteBooking&id={:id}"}
	        ];
			var $grid = $("#grid").datagrid({
				buttons: buttonsOpts,
				columns: [{text: myLabel.id, type: "text", sortable: true, editable: false, renderer: formatBid},
				          {text: myLabel.stay, type: "text", sortable: true, editable: false},
				          {text: myLabel.client, type: "text", sortable: true, editable: false},
				          {text: myLabel.rooms, type: "text", sortable: false, editable: false, renderer: formatRooms},
				          {text: myLabel.status, type: "text", sortable: true, editable: false, renderer: formatStatus}],
				dataUrl: "index.php?controller=pjAdminBookings&action=pjActionGetBooking" + pjGrid.queryString,
				dataType: "json",
				fields: ['uuid', 'stay', 'c_email', 'id', 'status'],
				paginator: {
					actions: actionsOpt,
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "index.php?controller=pjAdminBookings&action=pjActionSaveBooking&id={:id}",
				select: {
					field: "id",
					name: "record[]",
					cellClass: 'cell-width-2'
				},
				cache: cache
			});
			
			var m = window.location.href.match(/room_id=(\d+)&iso_date=(\d{4}-\d{2}-\d{2})/);
			if (m !== null) {
				var content = $grid.datagrid("option", "content"),
					cache = $grid.datagrid("option", "cache");
				$.extend(cache, {
					room_id: m[1],
					iso_date: m[2]
				});
				$grid.datagrid("option", "cache", cache);
				$grid.datagrid("load", "index.php?controller=pjAdminBookings&action=pjActionGetBooking", content.column, content.direction, content.page, content.rowCount);
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
				q: $this.find("input[name='q']").val(),
				status: $this.find("select[name='status']").val()
			});
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "index.php?controller=pjAdminBookings&action=pjActionGetBooking", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("change", ".pj-filter-status", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$(".frm-filter").trigger("submit");
			return false;
		}).on("reset", ".frm-filter-advanced", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$(".btn-advance-search").trigger("click");
			return false;
		}).on("submit", ".frm-filter-advanced", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var obj = {},
				$this = $(this),
				arr = $this.serializeArray(),
				content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache");
			for (var i = 0, iCnt = arr.length; i < iCnt; i++) {
				obj[arr[i].name] = arr[i].value;
			}
			$.extend(cache, obj);
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "index.php?controller=pjAdminBookings&action=pjActionGetBooking", content.column, content.direction, content.page, content.rowCount);
			return false;
		}).on("change", "#add_room_id", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $room_id = $(this).val(),
				$max_adults = $('option:selected', this).attr('data-adults'),
				$max_children = $('option:selected', this).attr('data-children'),
				$form = null;
			if($frmCreate.length > 0)
			{
				$form = $frmCreate;
			}
			if($frmUpdate.length > 0)
			{
				$form = $frmUpdate;
			}
			$("#add_adults").trigger("touchspin.updatesettings", {max: $max_adults});
			$("#add_children").trigger("touchspin.updatesettings", {max: $max_children});
			
			$.get("index.php?controller=pjAdminBookings&action=pjActionGetRoomNumbers", {
				booking_id: 0,
				room_id: $room_id,
				date_from: $form.find('input[name="date_from"]').val(),
				date_to: $form.find('input[name="date_to"]').val(),
				hash: $form.find('input[name="hash"]').val(),
				booking_room_id: $form.find('input[name="booking_room_id"]').val()
			}).done(function (data) {
				$("#room_number_holder").html(data);
			});
			return false;
		}).on("click", ".pjBtnAddRoom", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $form = $(this).closest("form");
			getBookingAddRoom($form);
			return false;
		}).on("click", ".pjBtnEditBookingRoom", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $form = $(this).closest("form"),
				$id = $(this).attr("data-id"),
				booking_id = $form.find("input[name='id']").val(),
				hash = $form.find("input[name='hash']").val(),
				$date_from = $form.find("input[name='date_from']").val(),
				$date_to = $form.find("input[name='date_to']").val();
			$.get("index.php?controller=pjAdminBookings&action=pjActionUpdateBookingRoom", {
				"id": $id,
				"booking_id": booking_id,
				"hash": hash,
				"date_from": $date_from,
				"date_to": $date_to
			}).done(function (data) {
				$('#editBookingRoomBody').html(data);
				if($('#addBookingRoomBody').length > 0)
				{
					$('#addBookingRoomBody').html("");
				}
				var $touchspin3 = $('#editBookingRoomBody').find('.touchspin3');
				if($touchspin3.length > 0)
				{
					$touchspin3.each(function(e){
						var max = parseInt($(this).attr('data-max'), 10);
						$(this).TouchSpin({
							verticalbuttons: true,
				            buttondown_class: 'btn btn-white',
				            buttonup_class: 'btn btn-white',
				            max: max
				        });
					});
				}
				var $form = $('#editBookingRoomBody').find('form');
				$form.validate({
					ignore: ".ignore",
					submitHandler: function(form){
						$.post("index.php?controller=pjAdminBookings&action=pjActionUpdateBookingRoom", $form.serialize()).done(function (data) {
							if (data.status !== undefined && data.status === 'OK') {
								getBookingRooms.call(null, booking_id, data.hash);
							}
						}).always(function () {
							$('#editBookingRoomModal').modal('hide');
						});
						return false;
					}
				});
				$('#editBookingRoomModal').modal('show');
			});
			return false;
		}).on("click", "#btnUpdateBookingRoom", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $form = $('#editBookingRoomBody').find('form');
			$form.submit();
			return false;
		}).on("click", ".booking-recalc", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			recalcPrice.call(this);
			return false;
		}).on("click", ".pjBtnDeleteBookingRoom", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this),
				$id = $this.attr('data-id'),
				$tr = $this.closest("tr");
			swal({
				title: myLabel.alert_delete_booking_room_title,
				text: myLabel.alert_delete_booking_room_text,
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: myLabel.alert_btn_delete,
				cancelButtonText: myLabel.alert_btn_cancel,
				closeOnConfirm: false,
				showLoaderOnConfirm: true
			}, function () {
				$.post('index.php?controller=pjAdminBookings&action=pjActionDeleteBookingRoom', {id: $id}).done(function (data) {
					if (!(data && data.status)) {
						
					}
					switch (data.status) {
					case "OK":
						recalcPrice();
						$tr.css("backgroundColor", "#FFB4B4").fadeOut("slow", function () {
							$tr.remove();
							swal.close();
						});
						break;
					}
				});
			});
			return false;
		}).on("change", "#payment_method", function () {
			if ($("option:selected", this).val() == 'creditcard') {
				$(".hbCC").show();
			} else {
				$(".hbCC").hide();
			}
		}).on("change", ".onoffswitch-client .onoffswitch-checkbox", function (e) {
			if ($(this).prop('checked')) {
                $('.current-client-area').hide();
                $('.current-client-area').find('.hdRequired').removeClass('required');
                $('.new-client-area').show();
                $('.new-client-area').find('.hdRequired').addClass('required');
            }else {
                $('.current-client-area').show();
                $('.current-client-area').find('.hdRequired').addClass('required');
                $('.new-client-area').hide();
                $('.new-client-area').find('.hdRequired').removeClass('required');
            }
		}).on("change", "#client_id", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $pjFdEditClient = $('#pjFdEditClient');
			var $form = $(this).closest('form');
			if($(this).val() != '')
			{
				var href = $pjFdEditClient.attr('data-href');
				href = href.replace("{ID}", $(this).val());
				$pjFdEditClient.attr('href', href);
				$pjFdEditClient.css('display', 'inline-block');
				if($('#c_email').length > 0)
				{
					$('#c_email').removeClass('required');
				}
				if($('#c_password').length > 0)
				{
					$('#c_password').removeClass('required');
				}
				if($('#c_name').length > 0)
				{
					$('#c_name').removeClass('required');
				}
			}else{
				$pjFdEditClient.css('display', 'none');
				$form.find('.hdRequired').addClass('required');
			}
		}).on("click", "#btnEmail", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var booking_id = $(this).attr('data-id');
			var document_id = 0;
			var $emailContentWrapper = $('#emailContentWrapper');
			
			$('#btnSendEmailConfirm').attr('data-booking_id', booking_id);
			
			$emailContentWrapper.html("");
			$.get("index.php?controller=pjAdminBookings&action=pjActionConfirmation", {
				"booking_id": booking_id
			}).done(function (data) {
				$emailContentWrapper.html(data);
				if(data.indexOf("pjResendAlert") == -1)
				{
					myTinyMceInit.call(null, 'textarea#mceEditor', 'mceEditor');
					validator = $emailContentWrapper.find("form").validate({});
					$('#btnSendEmailConfirm').show();
				}else{
					$('#btnSendEmailConfirm').hide();
				}	
				$('#reminderEmailModal').modal('show');
			});
			return false;
		}).on("click", "#btnSendEmailConfirm", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this);
			var $emailContentWrapper = $('#emailContentWrapper');
			if (validator.form()) {
				$('#mceEditor').html( tinymce.get('mceEditor').getContent() );
				$(this).attr("disabled", true);
				var l = Ladda.create(this);
			 	l.start();
				$.post("index.php?controller=pjAdminBookings&action=pjActionConfirmation", $emailContentWrapper.find("form").serialize()).done(function (data) {
					if (data.status == "OK") {
						$('#reminderEmailModal').modal('hide');
					} else {
						$('#reminderEmailModal').modal('hide');
					}
					$this.attr("disabled", false);
					l.stop();
				});
			}
			return false;
		}).on("change", "#status", function (e) {
			var $pjFdPriceWrapper = $('#pjFdPriceWrapper');
			var value = $("#status option:selected").val();
			var text = $("#status option:selected").text();
			var bg_class = 'bg-' + value;
			if(value == 'not_confirmed')
			{
				bg_class = 'bg-cancelled';
			}
			$pjFdPriceWrapper.find('.panel-heading').removeClass("bg-pending").removeClass("bg-cancelled").removeClass("bg-confirmed").addClass(bg_class);
			$pjFdPriceWrapper.find('.status-text').html(text);
		}).on("click", "#btnAddBookingRoom", function (e) {
			var $form = null,
				l = Ladda.create( $(this).get(0) );
			if($frmCreate.length > 0)
			{
				$form = $frmCreate;
			}
			if($frmUpdate.length > 0)
			{
				$form = $frmUpdate;
			}
			var post_data = $form.serialize() + $('#addBookingRoomBody').find('select, input').serialize();
			l.start();
			$.post("index.php?controller=pjAdminBookings&action=pjActionAddBookingRoom&add_room=1", post_data).done(function (data) {
				if (data.status == 'OK') {
					$('#addBookingRoomBody').find("input[name='booking_room_id']").val('');
					$("#add_room_id").val('');
					$("#add_room_id").trigger('change');
					$('.addRoomMsg').hide();
					hash = $form.find("input[name='hash']").val();
					getBookingRooms.call(null, booking_id, hash);
					$('#addBookingRoomModal').modal('hide');
				} else {
					$('.addRoomMsg').show();
				}
				l.stop();
			});
		});
		
		function recalcPrice() {
			var $form = $(this).closest("form"),
				booking_id = $form.find("input[name='id']").val(),
				hash = $form.find("input[name='hash']").val();
			$.post("index.php?controller=pjAdminBookings&action=pjActionRecalcPrice", $form.serialize()).done(function (response) {
				if (response.status === "OK") {
					$("#room_price").val(response.data.room_price.toFixed(2));
					$("#extra_price").val(response.data.extra_price.toFixed(2));
					$("#total").val(response.data.total.toFixed(2));
					$("#tax").val(response.data.tax.toFixed(2));
					$("#security").val(response.data.security.toFixed(2));
					$("#deposit").val(response.data.deposit.toFixed(2));
					$("#discount").val(response.data.discount.toFixed(2));
					
					$("#booking_room_price").html(response.data.room_price_f);
					$("#booking_extra_price").html(response.data.extra_price_f);
					$("#booking_total").html(response.data.total_f);
					$("#booking_tax").html(response.data.tax_f);
					$("#booking_security").html(response.data.security_f);
					$("#booking_deposit").html(response.data.deposit_f);
					$("#booking_discount").html(response.data.discount_f);
					
					getBookingRooms.call(null, booking_id, hash);
				}
			});
		}
		
		function myTinyMceInit(pSelector, pValue) {
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
		$("#reminderEmailModal").on("hidden.bs.modal", function () {
        	if (tinymce.editors.length > 0) 
			{
		        tinymce.execCommand('mceRemoveEditor',true, "mceEditor");
		    }
        });
		
		$(document).on('focusin', function(e) {
			if ($(e.target).closest(".mce-window").length) {
				e.stopImmediatePropagation();
			}
		});
	});
})(jQuery);