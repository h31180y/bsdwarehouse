var ReportChart = function() {

    return {
        //main function to initiate the module

        init: function() {

            Metronic.addResizeHandler(function() {
                Charts.initPieCharts();
            });

        },

        initPieCharts: function() {

            var data = [];
            var series = Math.floor(Math.random() * 10) + 1;
            series = series < 5 ? 5 : series;

            /*for (var i = 0; i < series; i++) {
                data[i] = {
                    label: "Series" + (i + 1),
                    data: Math.floor(Math.random() * 100) + 1
                };
            }*/

			$.ajax({
				url: "/ajax/getBoxesPerDivisionReport",
				dataType:"json",
			}).done(function( datarec ) {
				$.each(datarec,function(index, value) {
						data[index] = {
								label: value.label,
								data: value.data
						}
				});
				
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
		                    [10, 20, 50, 100, 150, "All"] // change per page values here
		                ],
		                "pageLength": 10, // default record count per page
		                "ajax": {
		                    "url": "/ajax/getBoxesPerDivisionTable", // ajax source
		                },
		                "order": [
		                    [1, "asc"]
		                ] // set first column as a default sort by asc
		            }
			    });
			    
				if ($('#boxes_chart').size() !== 0) {
	                $.plot($("#boxes_chart"), data, {
	                    series: {
	                        pie: {
	                            show: true,
	                            radius: 1,
	                            tilt: 0.5,
	                            label: {
	                                show: true,
	                                radius: 1,
	                                formatter: function(label, series) {
	                                    return '<div style="font-size:8pt;text-align:center;padding:2px;color:black;">' + label + '<br/>' + Math.round(series.percent) + '%</div>';
	                                },
	                                background: {
	                                    opacity: 0.8
	                                }
	                            },
	                            combine: {
	                                color: '#888',
	                                threshold: 0.01
	                            }
	                        }
	                    },
	                    legend: {
	                        show: false
	                    }
	                });
	            }
			});
			
            // DONUT
            
            function pieHover(event, pos, obj) {
                if (!obj)
                    return;
                percent = parseFloat(obj.series.percent).toFixed(2);
                $("#hover").html('<span style="font-weight: bold; color: ' + obj.series.color + '">' + obj.series.label + ' (' + percent + '%)</span>');
            }

            function pieClick(event, pos, obj) {
                if (!obj)
                    return;
                percent = parseFloat(obj.series.percent).toFixed(2);
                alert('' + obj.series.label + ': ' + percent + '%');
            }

        }

    };

}();