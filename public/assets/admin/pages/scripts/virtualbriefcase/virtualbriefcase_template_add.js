var count = 0;

$('#add_document').on('click',function(event, element){
	
	event.preventDefault();
	
	var dokument = $('#dok_template').html().replace("document_XX","content["+count+"][name]").replace("id_XX","element_"+count+"").replace("remove_document_XX","remove_document_"+count+"");
	
	$('#dok_holder').append(dokument);
	
	$('#remove_document_'+count).bind('click',function(ev,el) {
		ev.preventDefault();
		$(this).parents('.form-group').remove();
	});
	
	count++;
	
})


$('#submit').on('click',function(event, element){
	event.preventDefault();
	$(this).parents('form').submit();
});