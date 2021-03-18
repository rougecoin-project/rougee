<script>
	jQuery(document).ready(function($) {
		var form = $("#embed-post-video");
		var video_id = false;
		var embed = '';
		form.find('input[name="url"]').keyup(function(event) {
			url = $(this).val();
			if (get_yt_id(url)) {
				video_id = get_yt_id(url);
				form.find('#embed').val('youtube');
				form.find('#video_id').val(video_id);
				$("#embed-iframe").html($('<iframe>',{
					src: 'https://www.youtube.com/embed/' + video_id,
					width: '100%',
					height: '309px',
					frameborder: 0
				}));
			}
			else if(get_vimeo_id(url)){
				video_id = get_vimeo_id(url);
				form.find('#embed').val('vimeo');
				form.find('#video_id').val(video_id);
				$("#embed-iframe").html($('<iframe>',{
					src: 'https://player.vimeo.com/video/' + video_id,
					width: '100%',
					height: '309px',
					frameborder: 0
				}));	
			}
			else if(get_dailymotion_id(url)){
				video_id = get_dailymotion_id(url);
				form.find('#embed').val('dailymotion');
				form.find('#video_id').val(video_id);
				$("#embed-iframe").html($('<iframe>',{
					src: 'http://www.dailymotion.com/embed/video/' + video_id,
					width: '100%',
					height: '309px',
					frameborder: 0
				}));	
			}
			else{
				return false;
			}

			form.find(".fetch-url").addClass('hidden');
			form.find(".iframe-renderer").slideDown(300);
		});

		form.ajaxForm({
			type:'POST',
			dataType:'json',
    		processData: false,
			beforeSend:function(){
				if (!form.find('#video_id').val()) {
					form.find('div.video-url').addClass('active');
					return false;
				}

				form.find('button[type="submit"]').attr('disabled', 'true');
				$(".user-heading #pp_loader").fadeIn(100);
			},
			success:function(data){
				if (data.status == 200) {
					$(".home-posts-container").prepend(data.html);
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
	});
</script>