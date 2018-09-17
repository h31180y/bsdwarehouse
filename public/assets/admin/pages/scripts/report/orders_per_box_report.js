var ReportDate = function() {
    
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

				if ( $.fn.dataTable.isDataTable($("#datatable_ajax")) ) {
					$("#datatable_ajax").DataTable().destroy();
				}
				
				var grid = new Datatable();
				
				grid.init({
			    	src: $("#datatable_ajax"),
			    	loadingMessage: 'Ładuję...',
			    	dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options 

		                // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
		                // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/scripts/datatable.js). 
		                // So when dropdowns used the scrollable div should be removed. 
		                //"dom": "<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'<'table-group-actions pull-right'>>r>t<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>",
		                
		                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

		                "lengthMenu": [
		                    [10, 20, 50, 100, 150, -1],
		                    [10, 20, 50, 100, 150, "Wszystkie"] // change per page values here
		                ],
		                "pageLength": 10, // default record count per page
		                "ajax": {
		                    "url": "/ajax/getOrdersReportTable", // ajax source
		                    "data":{'date_start':picker.startDate.format('DD-MM-YYYY'),'date_end':picker.endDate.format('DD-MM-YYYY')},
		                    "method": 'POST',
		                    "dataType":'json',
		                },
		                "order": [
		                    [1, "asc"]
		                ] // set first column as a default sort by asc
		            }
			    });

			});
			//Set the initial state of the picker label
			 $('#reportrange span').html(moment().subtract('days', 29).format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
			 
		 	if ( $.fn.dataTable.isDataTable($("#datatable_ajax")) ) {
				$("#datatable_ajax").DataTable().destroy();
			}
			
			var grid = new Datatable();
			
			grid.init({
		    	src: $("#datatable_ajax"),
		    	loadingMessage: 'Ładuję...',
		    	dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options 

	                // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
	                // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/scripts/datatable.js). 
	                // So when dropdowns used the scrollable div should be removed. 
	                //"dom": "<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'<'table-group-actions pull-right'>>r>t<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>",
	                
	                "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

	                "lengthMenu": [
	                    [10, 20, 50, 100, 150, -1],
	                    [10, 20, 50, 100, 150, "Wszystkie"] // change per page values here
	                ],
	                "pageLength": 10, // default record count per page
	                "ajax": {
	                    "url": "/ajax/getOrdersReportTable", // ajax source
	                    "data":{'date_start':moment().subtract('days', 29).format('DD-MM-YYYY'),'date_end':moment().format('DD-MM-YYYY')},
	                    "method": 'POST',
	                    "dataType":'json',
	                },
	                "order": [
	                    [1, "asc"]
	                ] // set first column as a default sort by asc
	            }
		    });

		}
    }
}();