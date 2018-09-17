/**
Custom module for you to write your own javascript functions
**/
var User_edit = function () {
	
    // public functions
    return {

        //main function
        init: function () {
            //initialize here something.    
        	
        	$('#add_user_form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	            	firstname: {
	                    required: true
	                },
	            	lastname: {
	                    required: true
		                },
	            	username: {
	                    required: true,
	                    minlength: 3,
	                    maxlength: 8
	                },
	                email: {
	                    required: true,
	                    email: true
	                },
	                
	                "divisions[]": {
	                    required: true,
	                },
	                
	                "roles[]": {
	                	  required: true,
	                },
                
	            },

	            messages: {
	            	firstname: {
	                    required: "Podaj imię użytkownika"
	                },
	            	lastname: {
	                    required: "Podaj nazwisko użytkownika"
		                },
	                username: {
	                    required: "Podaj login",
	                    minlength: "Login musi mieć więcej niż 3 znaki",
	                    maxlength: "Login nie może mieć więcej niż 8 znaków"
	                },
	                email: {
	                    required: "Podaj adres email",
	                    email: "Ten adres jest nie prawidłowy"
	                },
	                "divisions[]": {
	                    required: "Wybierz dział",
	                },
	                
	                "roles[]": {
	                    required: "Wybierz rolę",
	                },
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-danger',$('#add_user_form')).show();
	                Metronic.scrollTo( $('.alert-danger',$('#add_user_form')), -200);
	                $("#add_user_form").removeAttr("novalidate");
	                
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	                $("#add_user_form").removeAttr("novalidate");
	              
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	                $("#add_user_form").removeAttr("novalidate");
	            },
	            
	            submitHandler: function (form) {
	                form.submit();
	            }
	        });
        	
        	
        	$('input[name=IsIndividual]').change(function(){
        	    if($(this).val() == 0) Add_user.firmaEnable();
        	    else if($(this).val() == 1) Add_user.firmaDisable();
        	    
        	});
        	
        	$("#add_user_form #submit").bind('click',function(e){
                if ($('#add_user_form').validate().form()) {
                    $('#add_user_form').submit();
                }
                $("#add_user_form").removeAttr("novalidate");
                return false;
        	});
        	
        },
    };

}();



/***
Usage
***/
//Custom.init();
//Custom.doSomeStuff();