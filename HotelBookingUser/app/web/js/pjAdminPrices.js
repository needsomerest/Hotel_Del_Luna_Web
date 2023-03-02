var jQuery = jQuery || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmCreatePrice = $("#frmCreatePrice"),
			$datepick = $(".datepick"),
			datepicker = ($.fn.datepicker !== undefined),
			validate = ($.fn.validate !== undefined);
		
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
        
        if ($datepick.length > 0) {
        	$datepick.datepicker({autoclose: true}).on('changeDate', function (selected) {
        		var idx = $(this).closest('.tab-pane').attr('data-idx');
        		var element_id = $(this).attr('id');
        		
        		if (parseInt(element_id.indexOf("date_from_"), 10) >= 0) {
	        		var res = element_id.replace("date_from_" + idx + "_", "");
	        		var $toElement = $("#date_to_" + idx + "_" + res);
        			if($toElement.length > 0)
        			{
        				var date_to_value = $toElement.datepicker("getUTCDate");
        				if(date_to_value < selected.date)
    					{
        					$toElement.val($(this).val());
    					}
        			}
        		}

        		if (parseInt(element_id.indexOf("date_to_"), 10) >= 0) {
        			var res = element_id.replace("date_to_" + idx + "_", "");
        			var $fromElement = $("#date_from_" + idx + "_" + res);
        			var $toElement = $("#date_to_" + idx + "_" + res);
        			if($fromElement.length > 0 && $toElement.length > 0)
        			{
        				var date_from_value = $fromElement.datepicker("getUTCDate");
        				if(date_from_value > selected.date)
    					{
        					$fromElement.val($toElement.val());
    					}
        			}
        		}
            });
        }
		
        function errorHandler() {
			var $form = this;
			$form.find(":input").removeAttr("readonly");
	    	$form.find(".pj-button").removeAttr("disabled");
	    	
	    	$(".tab-price-panel")
			.find(".bxPriceStatusStart, .bxPriceStatusEnd, .bxPriceStatusDuplicate").hide().end()
			.find(".bxPriceStatusFail").show();
		}
        function errorDuplicateHandler() {
			var $form = this;
			$form.find(":input").removeAttr("readonly");
	    	$form.find(".pj-button").removeAttr("disabled");
	    	
	    	$(".tab-price-panel")
			.find(".bxPriceStatusStart, .bxPriceStatusEnd, .bxPriceStatusFail").hide().end()
			.find(".bxPriceStatusDuplicate").show();
		}
		
		function resetValication() {
			this.find("tr").removeClass("pjHotelPrices_duplicate");
		}
		
		if ($frmCreatePrice.length > 0 && validate) {
			$frmCreatePrice.validate({
				ignore: ".ignore",
				submitHandler: function (form) {
					var laddaBtn_arr = [];
					
					$(".tab-price-panel")
						.find(".bxPriceStatusFail, .bxPriceStatusEnd, .bxPriceStatusDuplicate").hide().end()
						.find(".bxPriceStatusStart").show();
					var post, len, num, $current, $tr, i, 
						total = 0,
						$form = $(form),
						$tabs = $form.find(".tabs-prices").find("div[id^='tab-content-']"),
						perLoop = 100 //Keep this even value
					;
					
					$tabs.each(function (index) {
						if($form.find(":submit").get(index))
						{
							var laddaBtn = Ladda.create( $form.find(":submit").get(index));
							laddaBtn.start();
							laddaBtn_arr.push(laddaBtn)
						}
					});
					
					
					$form.find(":input").not(".pj-button").attr("readonly", "readonly");
					$form.find(".pj-button").attr("disabled", "disabled");
					
					//Validation adults & children
					resetValication.call($form);
					var $x_tabs, $x_adults, $x_children, x_str, x_tabid, x_adults, x_children,
						$x_from, $x_to, x_from, x_to,
						x_stack = [], 
						x_duplicates = [],
						x_arr = [],
						x_dates = [];
					$tabs.each(function (index) {
						$current = $(this);
						$x_tabs = $current.find("input[name^='tabs[']");
						x_tabid = $current.attr("data-idx");
						//--------
						$current.find(".pj-table select[name*='_adults[']").each(function (i) {
							$x_adults = $(this);
							$x_children = $x_adults.closest("tr").find("select[name*='_children[']");
							x_adults = $x_adults.find("option:selected").val();
							x_children = $x_children.find("option:selected").val();
							x_str = [x_tabid, x_adults, x_children].join("_");
							if ($.inArray(x_str, x_stack) !== -1) {
								x_duplicates.push({
									"tab_id": x_tabid, 
									"adults": parseInt(x_adults, 10),
									"children": parseInt(x_children, 10),
									"row": $x_adults.closest("tbody").find("tr").index($x_adults.closest("tr").get(0))
								});
							}
							x_stack.push(x_str);
						});
						//--------
						$x_from = $current.find("input[name*='_date_from[']")
						$x_to = $current.find("input[name*='_date_to[']");
						x_from = $x_from.val();
						x_to = $x_to.val();
						x_str = [x_from, x_to].join("_");
						if ($.inArray(x_str, x_arr) !== -1) {
							x_dates.push({
								"tab_id": x_tabid, 
								"from": x_from,
								"to": x_to
							});
						}
						x_arr.push(x_str);
						//--------
					});
					
					if (x_duplicates.length > 0) {
						for (var x = 0, xCnt = x_duplicates.length; x < xCnt; x++) {
							$tabs.eq(x_duplicates[x].tab_id - 1).find(".pj-table tbody tr").eq(x_duplicates[x].row).next().addBack().addClass("pjHotelPrices_duplicate");
							if (x === 0) {
								$("#tab-nav-" + x_duplicates[x].tab_id).trigger("click");
							}
						}
						swal({
			    			title: "",
							text: myLabel.duplicated_special_prices,
							type: "warning",
							confirmButtonColor: "#DD6B55",
							confirmButtonText: "OK",
							closeOnConfirm: false,
							showLoaderOnConfirm: false
						}, function () {
							swal.close();
						});
					}
					
					if (x_dates.length > 0) {
						errorHandler.call($form);
						for (var i = 0; i < laddaBtn_arr.length; i++) 
				    	{
				    		laddaBtn_arr[i].stop();
				    	}
						return;
					}
					if (x_duplicates.length > 0 ) {
						errorDuplicateHandler.call($form);
						for (var i = 0; i < laddaBtn_arr.length; i++) 
				    	{
				    		laddaBtn_arr[i].stop();
				    	}
						return;
					}
					
					$.post("index.php?controller=pjAdminPrices&action=pjActionDeleteAll").done(function () {
						
						$tabs.each(function (index) {
							len = $(this).find(".tab-price-item").length;
							total += len > perLoop ? Math.ceil(len / perLoop) : 1;
						});
						
						$tabs.each(function (index) {
							$current = $(this);
							i = 0;
							$tr = $(this).find(".tab-price-item");
							len = $tr.length;
							num = len > perLoop ? Math.ceil(len / perLoop) : 1;
							
							setPrices.call(null);
						});
					}).always(function(){
			    		for (var i = 0; i < laddaBtn_arr.length; i++) 
				    	{
				    		laddaBtn_arr[i].stop();
				    	}
			    	});
			
					function setPrices() {
						$.ajaxSetup({async:false});
						post = $current.find("input.datepick, input.onoffswitch-checkbox, input.single-price, :input[name^='tabs[']").serialize();
						post += "&" + $tr.slice(i * perLoop, (i + 1) * perLoop).find(":input").serialize();
						
						i++;
						$.post("index.php?controller=pjAdminPrices&action=pjActionBeforeSave", post, callback);
					}
					
					function callback(data) {
						if (data.status === "ERR") {
							errorHandler.call($form);
							for (var i = 0; i < laddaBtn_arr.length; i++) 
					    	{
					    		laddaBtn_arr[i].stop();
					    	}
							return;
						}
						
						total--;
						num--;
						if (num > 0) {
					        setPrices.call(null);
					    }
						
						if (total === 0) {
					    	$.post("index.php?controller=pjAdminPrices&action=pjActionSave").done(function (data) {
					    		$form.find(":input").removeAttr("readonly");
						    	$form.find(".pj-button").removeAttr("disabled");
						    	
						    	if(data.status == 'ERR' && data.code == '101')
					    		{
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
										$(".tab-price-panel").find(".bxPriceStatusStart").hide();
									});
					    		}else{
							    	$(".tab-price-panel")
										.find(".bxPriceStatusStart, .bxPriceStatusFail, .bxPriceStatusDuplicate").hide().end()
										.find(".bxPriceStatusEnd").show().delay(5000).fadeOut(300);
					    		}
						    	Ladda.bind('button[type=submit]', { timeout: 2000 } );
					    	}).always(function(){
					    		Ladda.bind('button[type=submit]', { timeout: 2000 } );
					    	});
					        return;
					    }
					}
				}
			});
		}
		
		function addTab() {
			var $tab_idx = 'new_' + Math.ceil(Math.random() * 999999),
				$tab_title = $('#modalAddSeasonPrice').find("input[name='tab_title']").val(),
				rand = 'x_' + Math.ceil(Math.random() * 999999),
				$clone = $("#tmplSeason").clone();
				h = $clone.html()
					.replace(/\{TAB_TITLE\}/g, $tab_title)
					.replace(/\{INDEX\}/g, $tab_idx)
					.replace(/\{RAND\}/g, rand);;
			$(".tabs-prices").find("ul.nav-tabs").append('<li role="presentation"><a class="tab-seasonal-'+$tab_idx+'" href="#tab-content-'+$tab_idx+'" aria-controls="tabs-'+$tab_idx+'" role="tab" data-toggle="tab" id="tab-nav-'+$tab_idx+'">'+$tab_title+' <span aria-hidden="true" class="lnkRemoveTabPrice" data-idx="'+$tab_idx+'" style="display:none;">&times;</span></a></li>');
			$(".tabs-prices").find('.tab-content').append(h);
			$(".tab-seasonal-" + $tab_idx).trigger("click");
			
			$(".datepick").datepicker({autoclose: true}).on('changeDate', function (selected) {
        		var idx = $(this).closest('.tab-pane').attr('data-idx');
        		var element_id = $(this).attr('id');
        		if (parseInt(element_id.indexOf("date_from_"), 10) >= 0) {
	        		var res = element_id.replace("date_from_" + idx + "_", "");
	        		var $toElement = $("#date_to_" + idx + "_" + res);
        			if($toElement.length > 0)
        			{
        				var date_to_value = $toElement.datepicker("getUTCDate");
        				if(date_to_value < selected.date)
    					{
        					$toElement.val($(this).val());
    					}
        			}
        		}

        		if (parseInt(element_id.indexOf("date_to_"), 10) >= 0) {
        			var res = element_id.replace("date_to_" + idx + "_", "");
        			var $fromElement = $("#date_from_" + idx + "_" + res);
        			var $toElement = $("#date_to_" + idx + "_" + res);
        			if($fromElement.length > 0 && $toElement.length > 0)
        			{
        				var date_from_value = $fromElement.datepicker("getUTCDate");
        				if(date_from_value > selected.date)
    					{
        					$fromElement.val($toElement.val());
    					}
        			}
        		}
            });
			
			$('#modalAddSeasonPrice').find("input[name='tab_title']").val('Season Title');
			$('#modalAddSeasonPrice').find(".pjBtnCloseModalSeasonalPrice").trigger("click");
		}
		
		$('#modalAddSeasonPrice').on("click", ".pjBtnAddSeasonalPrice", function (e) {
	    	if (e && e.preventDefault) {
				e.preventDefault();
			}
	    	addTab();
		});
		
        $(document).on("submit", "#frmCreatePrice", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			return false;
		}).on("click", ".lnkAddPrice", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $idx = $(this).attr("data-idx"),
				$parent = $(".pj-tbl-adults-children-price-" + $idx).find("tbody"),
				rand = 'x_' + Math.ceil(Math.random() * 999999) + '~:~' + $idx,			
				$clone = $("#tmplDefault tbody").clone();
			h = $clone.html().replace(/\{INDEX\}/g, $(this).attr("rel")).replace(/\{RAND\}/g, rand);
			$clone = $('<tr>' + h + '</tr>');
			$clone.appendTo($parent);
		}).on("click", ".lnkCopyRow", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $table = $(this).closest('table');
			var $idx = $table.attr("data-idx"),
				$parent = $(".pj-tbl-adults-children-price-" + $idx).find("tbody"),
				rand = 'x_' + Math.ceil(Math.random() * 999999) + '~:~' + $idx;
			var $source_row = $(this).closest('tr');
			var row_html = '<tr class="tab-price-item">' + $source_row.html() + '</tr>';
			var append_row = row_html.replace(/\[(.+?)\]/g, "["+rand+"]");
			var clone_values = [] ;
			$source_row.find('input').each(function(index){
				clone_values[index] = $(this).val();
			});
			$parent.append(append_row);
			var $last_row = $parent.find("tr").last();
			$last_row.find('select').each(function(e){
				var attr_name = $(this).attr('name');
				if(attr_name.indexOf("adults") != -1)
				{
					$(this).val(1);
				}
				if(attr_name.indexOf("children") != -1)
				{
					$(this).val(0);
				}
			});
			$last_row.find('input').each(function(index){
				$(this).val(clone_values[index]);
			});
		}).on("click", ".lnkRemoveRow", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $tr = $(this).closest("tr");
			$tr.css("backgroundColor", "#FFB4B4").fadeOut("slow", function () {
				$tr.remove();
			});
			return false;
		}).on("click", ".lnkRemoveTabPrice", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $idx = $(this).attr("data-idx");
			$("#tab-nav-" + $idx).remove();
			$("#tab-content-" + $idx).remove();
			$("#tab-nav-1").trigger("click");
			return false;
		}).on("change", "select[name='ch_room_id']", function () {
			var $this = $(this),
				room_id = $this.find("option:selected").val();
			if (room_id.length > 0) {
				window.location.href = $this.data("url") + room_id;
			}
		}).on("change", ".onoffswitch-prices .onoffswitch-checkbox", function (e) {
			var tab = $(this).attr('data-tab');
			var type = $(this).attr('data-type');
			if ($(this).prop('checked')) {
                $('#'+type+'_single_price_' + tab).hide();
                $('#'+type+'_single_price_' + tab).find('.price-form-field').removeClass('required number');
                $('#'+type+'_weekday_price_' + tab).show();
                $('#'+type+'_weekday_price_' + tab).find('.price-form-field').addClass('required number');
            }else {
            	$('#'+type+'_single_price_' + tab).show();
            	$('#'+type+'_single_price_' + tab).find('.price-form-field').addClass('required number');
                $('#'+type+'_weekday_price_' + tab).hide();
                $('#'+type+'_weekday_price_' + tab).find('.price-form-field').removeClass('required number');
            }
		}).on("change", ".onoffswitch-prices-based-on .onoffswitch-checkbox", function (e) {
			var tab = $(this).attr('data-tab');
			var index = $(this).attr('data-index');
			if ($(this).prop('checked')) {
				$('#guests_weekday_price_' + tab + '_' + index).show();
				$('#guests_weekday_price_' + tab + '_' + index).find('.price-form-field').addClass('required number');
            }else {
            	$('#guests_weekday_price_' + tab + '_' + index).hide();
				$('#guests_weekday_price_' + tab + '_' + index).find('.price-form-field').removeClass('required number');
            }
		}).on("click", ".btn-delete-season", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var index = $(this).attr('data-index');
			$('#modalDeleteSeasonPrices').find('.pjBtnDeleteSeasonalPrice').attr('data-index', index);
			$('#modalDeleteSeasonPrices').modal('show');
			return false;
		}).on("click", ".pjBtnDeleteSeasonalPrice", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var foreign_id = $( "select[name='ch_room_id'] option:selected" ).val();
			var index = $(this).attr('data-index');
			
			$.get("index.php?controller=pjAdminPrices&action=pjActionDeleteSeason", {
				"foreign_id": foreign_id,
				"tab_id": index
			}).done(function (data) {
				$("#tab-nav-" + index).remove();
				$("#tab-content-" + index).remove();
				$("#tab-nav-1").trigger("click");
				$('#modalDeleteSeasonPrices').modal('hide');			
			});
			
			return false;
		}).on("change", ".number", function (e) {
			var v = parseFloat(this.value);
		    if (isNaN(v)) {
		        this.value = '';
		    } else {
		        this.value = v.toFixed(2);
		    }
		    if (parseFloat(this.value) > 9999999.99) {
		    	this.value = 9999999.99;
		    }
		});
	});
})(jQuery);