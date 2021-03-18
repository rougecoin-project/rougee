jQuery(document).ready(function($) {
	$.fn.scroll2 = function (speed) {
        if (typeof(speed) === 'undefined')
            speed = 500;

        $('html, body').animate({
            scrollTop: ($(this).offset().top - 100)
        }, speed);

        return $(this);
    };

    $(document).on('click', '.delete-button', function(event) {
    	event.preventDefault();
    	var _type = $(this).attr('data-type');
    	var _id   = $(this).attr('data-id');

		console.log( _type );
		console.log( _id );

    	if(_type){
    		$.ajax({
    			url: acpajax_url('delete-'+_type),
    			type: 'POST',
    			dataType: 'json',
    			data: {id:_id},
    		})
    		.done(function(data) {
    			if (data.status == 200) {
                    $("#list-"+_id).slideUp(400,function(){
                        $(this).remove();
                    });
                }
    		});
    	}
    });
});

function scroll2top(speed = 1000) {
	$('html,body').animate({scrollTop:0}, speed);
}
