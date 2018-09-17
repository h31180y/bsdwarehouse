var Report = function() {
    
    return {
        //main function to initiate the module

		init: function() {
			
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
	                    "url": "/ajax/getUtilisationReportTable", // ajax source
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