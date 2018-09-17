$("#synchronize_customers").on('click',function(ev,el){
	ev.preventDefault();
	
	$.ajax({
		'url':'/ajax/synchronizeCustomers',
		'dataType':'html',
		'method':'POST',		
	}).done(function(data){
		$("#synchronize_customers_result").html(data);
		$("#synchronize_customers_result").children('.scroller').slimScroll({
		      alwaysVisible: true,
		      railVisible: true
		});
	});
});

$("#synchronize_boxes").on('click',function(ev,el){
	ev.preventDefault();
	
	$.ajax({
		'url':'/ajax/synchronizeBoxes',
		'dataType':'html',
		'method':'POST',		
	}).done(function(data){
		$("#synchronize_boxes_result").html(data);
		
		$("#synchronize_boxes_result").children('.scroller').slimScroll({
		      alwaysVisible: true,
		      railVisible: true
		});
	});
});

$("#synchronize_categories").on('click',function(ev,el){
	ev.preventDefault();
	
	$.ajax({
		'url':'/ajax/synchronizeCategories',
		'dataType':'html',
		'method':'POST',		
	}).done(function(data){
		$("#synchronize_categories_result").html(data);
		
		$("#synchronize_categories_result").children('.scroller').slimScroll({
		      alwaysVisible: true,
		      railVisible: true
		});
	});
});

$("#synchronize_documents").on('click',function(ev,el){
	ev.preventDefault();
	
	$.ajax({
		'url':'/ajax/synchronizeDocuments',
		'dataType':'html',
		'method':'POST',		
	}).done(function(data){
		$("#synchronize_documents_result").html(data);
		
		$("#synchronize_documents_result").children('.scroller').slimScroll({
		      alwaysVisible: true,
		      railVisible: true
		});
	});
	
});