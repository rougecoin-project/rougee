<script>
	jQuery(document).ready(function($) {
		var form = $("form#add-story-from");
		form.ajaxForm({
			type:'POST',
			dataType:'json',
			cache: false,
    		processData: false,
			beforeSend:function(){
				if (form.find('#story-file').prop('files').length != 1) {
					form.find('.selecet-file-control').addClass('active');
					return false;
				}
				form.find('button[type="submit"]').attr('disabled', 'true');
				$(".user-heading #pp_loader").fadeIn(100);
			},
			success:function(data){
				if (data.message) {
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });

	                delay(function(){
	                	window.location.reload();
	                },1000);
				}

				$("body").removeClass('active');
				$("#create-newpost").empty();
				$(".user-heading #pp_loader").fadeOut(100);
			}
		});

		$("#story-file").change(function(event) {
			var file = $(this).prop('files')[0];
			form.find('.story-file-name').text(file.name);
		});
	});
</script>