var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
(function ($, undefined) {
	$(function () {
		"use strict";
				
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
        		if($(this).attr('name') == 'from')
        		{
        			if($('input[name="to"]').length > 0)
        			{
        				var $to = $('input[name="to"]');
        				var to_value = $to.datepicker("getUTCDate");
        				if(to_value < selected.date)
    					{
        					$to.val($('input[name="from"]').val());
    					}
        			}
        		}
        		
        		if($(this).attr('name') == 'to')
        		{
        			if($('input[name="from"]').length > 0)
        			{
        				var $from = $('input[name="from"]');
        				var from_value = $from.datepicker("getUTCDate");
        				if(from_value > selected.date)
    					{
        					$from.val($('input[name="to"]').val());
    					}
        			}
        		}
        	});        	
        }
	});
})(jQuery_1_8_2);