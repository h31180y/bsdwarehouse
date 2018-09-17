var ReportDate = function() {
	moment.locale('pl');

    function showTooltip(x, y, labelX, labelY) {
        $('<div id="tooltip" class="chart-tooltip">' + (labelY.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')) + '<\/div>').css({
            position: 'absolute',
            display: 'none',
            top: y - 40,
            left: x - 60,
            border: '0px solid #ccc',
            padding: '2px 6px',
            'background-color': '#fff'
        }).appendTo("body").fadeIn(200);
    }
    
    var initChart1 = function (date_start,date_end) {

        var data = [];
        
	        $.ajax({
	            "url": "/ajax/getOrdersCountReport", // ajax source
	            "data":{'date_start':date_start,'date_end':date_end},
	            "method": 'POST',
	            "dataType":'json',
	        }).done(function( datarec ) {
	        	
				$.each(datarec,function(index, value) {
					data[index] = [
							moment(value['date']).format('DD/MM/YYYY'),value['count']];
				});
				
				
				var plot_statistics = $.plot(
		                $("#statistics_1"), 
		                [
		                    {
		                        data:data,
		                        lines: {
		                            fill: 0.6,
		                            lineWidth: 0
		                        },
		                        color: ['#f89f9f']
		                    },
		                    {
		                        data: data,
		                        points: {
		                            show: true,
		                            fill: true,
		                            radius: 5,
		                            fillColor: "#f89f9f",
		                            lineWidth: 3
		                        },
		                        color: '#fff',
		                        shadowSize: 0
		                    }
		                ], 
		                {

		                    xaxis: {
		                        tickLength: 0,
		                        tickDecimals: 0,                        
		                        mode: "categories",
		                        min: 2,
		                        font: {
		                            lineHeight: 15,
		                            style: "normal",
		                            variant: "small-caps",
		                            color: "#6F7B8A"
		                        }
		                    },
		                    yaxis: {
		                        ticks: 3,
		                        tickDecimals: 0,
		                        tickColor: "#f0f0f0",
		                        font: {
		                            lineHeight: 15,
		                            style: "normal",
		                            variant: "small-caps",
		                            color: "#6F7B8A"
		                        }
		                    },
		                    grid: {
		                        backgroundColor: {
		                            colors: ["#fff", "#fff"]
		                        },
		                        borderWidth: 1,
		                        borderColor: "#f0f0f0",
		                        margin: 0,
		                        minBorderMargin: 0,
		                        labelMargin: 20,
		                        hoverable: true,
		                        clickable: true,
		                        mouseActiveRadius: 6
		                    },
		                    legend: {
		                        show: false
		                    }
		                }
		            );
				var previousPoint = null;

	            $("#statistics_1").bind("plothover", function (event, pos, item) {
	                $("#x").text(pos.x.toFixed(2));
	                $("#y").text(pos.y.toFixed(2));
	                if (item) {
	                    if (previousPoint != item.dataIndex) {
	                        previousPoint = item.dataIndex;

	                        $("#tooltip").remove();
	                        var x = item.datapoint[0].toFixed(2),
	                            y = item.datapoint[1].toFixed(2);

	                        showTooltip(item.pageX, item.pageY, item.datapoint[0], item.datapoint[1]);
	                    }
	                } else {
	                    $("#tooltip").remove();
	                    previousPoint = null;
	                }
	            });
	        });

    }
    
    var initChart2 = function(date_start,date_end) {

        var data = [];
        
        $.ajax({
            "url": "/ajax/getOrdersValueReport", // ajax source
            "data":{'date_start':date_start,'date_end':date_end},
            "method": 'POST',
            "dataType":'json',
        }).done(function( datarec ) {
        	
        	$.each(datarec,function(index, value) {
				data[index] = [
						moment(value['date']).format('DD/MM/YYYY'),value['value']];
			});
        	
            var plot_statistics = $.plot(
                $("#statistics_2"), 
                [
                    {
                        data:data,
                        lines: {
                            fill: 0.6,
                            lineWidth: 0
                        },
                        color: ['#BAD9F5']
                    },
                    {
                        data: data,
                        points: {
                            show: true,
                            fill: true,
                            radius: 5,
                            fillColor: "#BAD9F5",
                            lineWidth: 3
                        },
                        color: '#fff',
                        shadowSize: 0
                    }
                ], 
                {

                    xaxis: {
                        tickLength: 0,
                        tickDecimals: 0,                        
                        mode: "categories",
                        min: 2,
                        font: {
                            lineHeight: 14,
                            style: "normal",
                            variant: "small-caps",
                            color: "#6F7B8A"
                        }
                    },
                    yaxis: {
                        ticks: 3,
                        tickDecimals: 0,
                        tickColor: "#f0f0f0",
                        font: {
                            lineHeight: 14,
                            style: "normal",
                            variant: "small-caps",
                            color: "#6F7B8A"
                        }
                    },
                    grid: {
                        backgroundColor: {
                            colors: ["#fff", "#fff"]
                        },
                        borderWidth: 1,
                        borderColor: "#f0f0f0",
                        margin: 0,
                        minBorderMargin: 0,
                        labelMargin: 20,
                        hoverable: true,
                        clickable: true,
                        mouseActiveRadius: 6
                    },
                    legend: {
                        show: false
                    }
                }
            );
        
            var previousPoint = null;

            $("#statistics_2").bind("plothover", function (event, pos, item) {
                $("#x").text(pos.x.toFixed(2));
                $("#y").text(pos.y.toFixed(2));
                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;

                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2);

                       showTooltip(item.pageX, item.pageY, item.datapoint[0], item.datapoint[1]);
                    }
                } else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });
        });
    }

    
    return {
        //main function to initiate the module

		init: function() {
			
			moment.locale('pl');
			
			$('#reportrange').daterangepicker({
				 opens: (Metronic.isRTL() ? 'left' : 'right'),
				 startDate: moment().subtract('days', 29),
				 endDate: moment(),
				 minDate: moment().subtract('days', 365),
				 maxDate: moment(),
				 dateLimit: {
					 days: 365
				 },
				 language: 'PL',
				 showDropdowns: true,
				 showWeekNumbers: true,
				 timePicker: false,
				 timePickerIncrement: 1,
				 timePicker12Hour: true,
				 ranges: {
					 'Dziś': [moment(), moment()],
					 'Wczoraj': [moment().subtract('days', 1), moment().subtract('days', 1)],
					 'Ostatnie 7 Dni': [moment().subtract('days', 6), moment()],
					 'Ostanie 30 Dni': [moment().subtract('days', 29), moment()],
					 'Ten Miesiąc': [moment().startOf('month'), moment().endOf('month')],
					 'Poprzedni Miesiąc': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
				 },
				 buttonClasses: ['btn'],
				 applyClass: 'blue',
				 cancelClass: 'default',
				 format: 'MM/DD/YYYY',
				 separator: ' do ',
				 locale: {
					 applyLabel: 'Zastosuj',
					 cancelLabel: 'Wyczyść',
					 fromLabel: 'Od',
					 toLabel: 'Do',
					 customRangeLabel: 'Zakres raportu',
					 daysOfWeek: ['Ndz','Pn','Wt', 'Śr', 'Czw', 'Pt', 'Sob'],
					 monthNames: ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'],
					 firstDay: 1
				 }
			 },
			 
			 function (start, end) {
				 $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
		     });
			
			
			$('#reportrange').on('apply.daterangepicker', function(ev, picker) {
				$('#reportrange').parents('form').append('<input type="hidden" name="date_start" id="date_start" value="'+picker.startDate.format('DD-MM-YYYY')+'" />');
				$('#reportrange').parents('form').append('<input type="hidden" name="date_end" id="date_end" value="'+picker.endDate.format('DD-MM-YYYY')+'" />');
//				$('#reportrange').parents('form').submit();
				
				$.ajax({
		            "url": "/ajax/getOrdersReport", // ajax source
		            "data":{'date_start':picker.startDate.format('DD-MM-YYYY'),'date_end':picker.endDate.format('DD-MM-YYYY')},
		            "method": 'POST',
		            "dataType":'json',
		        }).done(function( datarec ) {
		        	$('#orders_sum').html(datarec['orders_sum'].toFixed(2).replace('.',',')+" PLN");
		        	$('#orders_tax').html((datarec['orders_sum']-(datarec['orders_sum']/1.23)).toFixed(2).replace('.',',')+" PLN");
		        	$('#orders_count').html(datarec['orders_count']);
		        	
		        });
			        
			    initChart1(picker.startDate.format('DD-MM-YYYY'),picker.endDate.format('DD-MM-YYYY'));
			    initChart2(picker.startDate.format('DD-MM-YYYY'),picker.endDate.format('DD-MM-YYYY'));
			});
					
		
			 //Set the initial state of the picker label
			 $('#reportrange span').html(moment().subtract('days', 29).format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
			 
	        initChart1(moment().subtract('days', 29).format('DD-MM-YYYY'),moment().format('DD-MM-YYYY'));
	        initChart2(moment().subtract('days', 29).format('DD-MM-YYYY'),moment().format('DD-MM-YYYY'));
			$.ajax({
	            "url": "/ajax/getOrdersReport", // ajax source
	            "data":{'date_start':moment().subtract('days', 29).format('DD-MM-YYYY'),'date_end':moment().format('DD-MM-YYYY')},
	            "method": 'POST',
	            "dataType":'json',
	        }).done(function( datarec ) {
	        	$('#orders_sum').html(datarec['orders_sum'].toFixed(2).replace('.',',')+" PLN");
	        	$('#orders_tax').html((datarec['orders_sum']-(datarec['orders_sum']/1.23)).toFixed(2).replace('.',',')+" PLN");
	        	$('#orders_count').html(datarec['orders_count']);
	        	
	        });

		}
    }
}();