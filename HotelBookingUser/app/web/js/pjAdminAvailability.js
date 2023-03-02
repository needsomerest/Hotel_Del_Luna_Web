var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var select2 = ($.fn.select2 !== undefined),
			datepicker = ($.fn.datepicker !== undefined);
		
		if (select2 && $(".select-countries").length) {
            $(".select-countries").select2({
                allowClear: true
            });
        };
        
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
        	$('.datepick').datepicker({autoclose: true});
        	if ($('#selected_date').length > 0) {
        		$('#selected_date').datepicker().on('changeDate', function (ev) {
        			getCalendar('date');
        		});
        	}
        }
        		
		$(document).on("click", "#hb_prev_week", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			getCalendar('prev');
			return false;
		}).on("click", "#hb_next_week", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			getCalendar('next');
			return false;
		}).on("click", "#hb_prev_date", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			getCalendar('prev_date');
			return false;
		}).on("click", "#hb_next_date", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			getCalendar('next_date');
			return false;
		}).on("change", "#room_id", function (e) {
			getCalendar('room');
		});
		if($('#room_id').length > 0)
		{
			$('.booking-add').each(function(e){
				var $td = $(this).closest('td');
				$(this).css('height', $td.height() + 'px');
				$(this).css('width', $td.width() + 'px');
			});
		}
		
		function getCalendar(mode) {
			var selected_date = $('#selected_date').val(),
				room_id = $('#room_id').val(),
				opts = {},
				param_str = '';
			if (mode == 'room' || mode == 'date') {
				opts = {
					room_id: room_id,
					selected_date: selected_date
				};
				param_str = "&room_id=" + room_id + "&selected_date=" + selected_date;
			} else if (mode == 'next') {
				opts = {
					room_id: room_id,
					week_start_date: $('#hb_next_week').attr('data-week_start'),
					selected_date: selected_date
				};
				param_str = "&room_id=" + room_id + "&selected_date=" + selected_date + "&week_start_date=" + $('#hb_prev_week').attr('data-week_start');
			} else if (mode == 'prev') {
				opts = {
					room_id: room_id,
					week_start_date: $('#hb_prev_week').attr('data-week_start'),
					selected_date: selected_date
				};
				param_str = "&room_id=" + room_id + "&selected_date=" + selected_date + "&week_start_date=" + $('#hb_prev_week').attr('data-week_start');
			} else if (mode == 'next_date') {
				opts = {
					room_id: room_id,
					week_start_date: $('#hb_next_date').attr('data-week_start'),
					selected_date: selected_date
				};
				param_str = "&room_id=" + room_id + "&selected_date=" + selected_date + "&week_start_date=" + $('#hb_next_date').attr('data-week_start');
			} else if (mode == 'prev_date') {
				opts = {
					room_id: room_id,
					week_start_date: $('#hb_prev_date').attr('data-week_start'),
					selected_date: selected_date
				};
				param_str = "&room_id=" + room_id + "&selected_date=" + selected_date + "&week_start_date=" + $('#hb_prev_date').attr('data-week_start');
			}
			$('.hb-loader').css('display', 'block');
			$.get("index.php?controller=pjAdminAvailability&action=pjActionGetCalendar", opts).done(function (data) {
				$("#boxCalendar").html(data);
				
				if ($('.datepick').length > 0) {
		        	$('.datepick').datepicker({autoclose: true});
		        	if ($('#selected_date').length > 0) {
		        		$('#selected_date').datepicker().on('changeDate', function (ev) {
		        			getCalendar('date');
		        		});
		        	}
		        }
				$('#hb_print_calendar').attr('href', $('#hb_print_calendar').data("href") + param_str);
				$('.tooltip-demo').tooltip({
			        selector: "[data-toggle=tooltip]",
			        container: "body"
			    });
				$('.booking-add').each(function(e){
					var $td = $(this).closest('td');
					$(this).css('height', $td.height() + 'px');
					$(this).css('width', $td.width() + 'px');
				});
			});
		}
		
	});
})(jQuery);