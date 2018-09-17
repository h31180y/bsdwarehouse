var ReportDate = function() {

    return {
        //main function to initiate the module

		init: function() {
			
			jQuery.fn.dataTableExt.oApi.fnReloadAjax = function ( oSettings, sNewSource, fnCallback, bStandingRedraw )
			{
			    // DataTables 1.10 compatibility - if 1.10 then `versionCheck` exists.
			    // 1.10's API has ajax reloading built in, so we use those abilities
			    // directly.
			    if ( jQuery.fn.dataTable.versionCheck ) {
			        var api = new jQuery.fn.dataTable.Api( oSettings );
			 
			        if ( sNewSource ) {
			            api.ajax.url( sNewSource ).load( fnCallback, !bStandingRedraw );
			        }
			        else {
			            api.ajax.reload( fnCallback, !bStandingRedraw );
			        }
			        return;
			    }
			 
			    if ( sNewSource !== undefined && sNewSource !== null ) {
			        oSettings.sAjaxSource = sNewSource;
			    }
			 
			    // Server-side processing should just call fnDraw
			    if ( oSettings.oFeatures.bServerSide ) {
			        this.fnDraw();
			        return;
			    }
			 
			    this.oApi._fnProcessingDisplay( oSettings, true );
			    var that = this;
			    var iStart = oSettings._iDisplayStart;
			    var aData = [];
			 
			    this.oApi._fnServerParams( oSettings, aData );
			 
			    oSettings.fnServerData.call( oSettings.oInstance, oSettings.sAjaxSource, aData, function(json) {
			        /* Clear the old information from the table */
			        that.oApi._fnClearTable( oSettings );
			 
			        /* Got the data - add it to the table */
			        var aData =  (oSettings.sAjaxDataProp !== "") ?
			            that.oApi._fnGetObjectDataFn( oSettings.sAjaxDataProp )( json ) : json;
			 
			        for ( var i=0 ; i<aData.length ; i++ )
			        {
			            that.oApi._fnAddData( oSettings, aData[i] );
			        }
			 
			        oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
			 
			        that.fnDraw();
			 
			        if ( bStandingRedraw === true )
			        {
			            oSettings._iDisplayStart = iStart;
			            that.oApi._fnCalculateEnd( oSettings );
			            that.fnDraw( false );
			        }
			 
			        that.oApi._fnProcessingDisplay( oSettings, false );
			 
			        /* Callback user function - for event handlers etc */
			        if ( typeof fnCallback == 'function' && fnCallback !== null )
			        {
			            fnCallback( oSettings );
			        }
			    }, oSettings );
			};
			
			moment.locale('pl');
			
			$('#reportrange').daterangepicker({
				 opens: (Metronic.isRTL() ? 'left' : 'right'),
				 startDate: moment().subtract('days', 29),
				 endDate: moment(),
				 minDate: moment().subtract('days', 365),
				 maxDate: moment(),
				 dateLimit: {
					 days: 60
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
			                    "url": "/ajax/getWareHousePeriodTable", // ajax source
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
	                    "url": "/ajax/getWareHousePeriodTable", // ajax source
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