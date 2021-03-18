<script>
	jQuery(document).ready(function($) {
		var attach = new Array();
		$("#upload-post-image").ajaxForm({
			type:'POST',
			dataType:'json',
			cache: false,
			data:{
				attach: attach
			},
    		contentType: 'multipart/form-data',
    		processData: false,
    	    uploadProgress: function(event, position, total, percentComplete) {
				$(".user-heading #pp_loader").find('span').html(percentComplete + '%');
				if (percentComplete == 100) {
				    $(".user-heading #pp_loader").find("span").html( "Processing..." ).css('margin-right',"10px");
				    $(".speeding_wheel").hide();
				}
			},
			beforeSend:function(){
				if ($("#upload-post-image").find('#upload-images').prop('files').length < 1) {
					$("#upload-post-image").find('.select-images').addClass('active');	
					return false;
				}
				$("#upload-post-image").find('button[type="submit"]').attr('disabled', 'true');
				$(".user-heading #pp_loader").fadeIn(100);
				$(".user-heading #pp_loader").find('span').html('0%');
			},
			success:function(data){
				if (data.status == 200) {
					$(".home-posts-container").prepend(data.html);
					if ($(".home-posts-container").find('.no-posted').length) {
						$(".home-posts-container").find('.no-posted').remove();
					}
				}

				if (data.message) {
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });
				}		
				
				$("body").removeClass('active');
				$("#create-newpost").empty();
				$(".user-heading #pp_loader").fadeOut(100);
			}
		});
		
		$("#upload-images").change(function(event) {
			files = $(this).prop('files');
			$(".images-renderer").empty();
			var ul = $("<ul>",{
				class:'img-list'
			});
			for (var i = 0; i < files.length; i++) {
				image     = files[i];
				attach[i] = i;

				if (!image.type.match('image.*')) {
					continue;
				}
				
				var reader = new FileReader();
					reader.onload = (function(theFile) {
						return function(e) {
							ul.append($('<li>',{
								html:'<img src="'+e.target.result+'" style="background:no-repeat left center;background-size: contain;width: 100%;"><span style="padding-top: inherit;">' + theFile.name + '</span><span>' + Math.round(theFile.size/1024) +'KB' + '</span>'
							}).append($('<span>',{
								html:'<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="feather feather-close"><path d="M12,2C17.53,2 22,6.47 22,12C22,17.53 17.53,22 12,22C6.47,22 2,17.53 2,12C2,6.47 6.47,2 12,2M15.59,7L12,10.59L8.41,7L7,8.41L10.59,12L7,15.59L8.41,17L12,13.41L15.59,17L17,15.59L13.41,12L17,8.41L15.59,7Z" /></svg>',
								class:'remove-img',
								id:i
							})));
						};
					})(image);
					reader.readAsDataURL(image);
			}

			$(".images-renderer").append(ul);
		});

		$(document).on('click', '.images-renderer .remove-img', function(event) {
			delete(attach[$(this).attr('id')]);
			$(this).parent('li').hide('200', function() {
				$(this).remove();
				if ($(".img-list").find('li').length < 1) {
					$("#create-newpost").fadeOut(100,function(){
						$(this).empty();
						$('body').removeClass('active');	
					});
				}
			});
		});
	});
</script>