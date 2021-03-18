{if $config.ffmpeg_sys == 'on'}
<script>
	jQuery(document).ready(function($) {
		$("#ffmpeg-upload-post-video").ajaxForm({
			type:'POST',
			dataType:'json',
			cache: false,
    		processData: false,
			uploadProgress: function(event, position, total, percentComplete) {
				$(".user-heading #pp_loader").find('span').html(percentComplete + '%');
				if(percentComplete == 100) {
				    $(".user-heading #pp_loader").find("span").html( "Processing..." ).css('margin-right',"10px");
				    $(".speeding_wheel").hide();
				}
			},
			beforeSend:function(){
				if ($("#post-video").prop('files').length != 1) {
					$(".selecet-file-control").addClass('active');
					return false;
				}
				
				$("#ffmpeg-upload-post-video").find('button[type="submit"]').attr('disabled', 'true');
				$(".user-heading #pp_loader").fadeIn(100);
				$(".user-heading #pp_loader").find('span').html('0%');
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

		$("#post-video").change(function(event) {
			var file = $(this).prop('files')[0];
			$('.video-file-name').html('<div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>' + file.name + '</div>');
		});
	});
</script>
{else}
<script>
	{literal}
	jQuery(document).ready(function($) {	
		$("#post-video").change(function(event) {
			try{
				window.URL = window.URL ||  window.webkitURL;
				var video_file = $(this).prop('files')[0];
				var video_blob = window.URL.createObjectURL(video_file);
				$("#post__video").html('<source src="' + video_blob + '" type="video/mp4">');
				$("#post_video_prnt").removeClass('hidden');
				$("#post__video")[0].load();

				delay(function(){
					window.cframe = capture_video_frame('post__video', 'png');
					$('.video-file-name').html('<div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>' + video_file.name + '</div>');
				},200);
			}
			catch(e){
				$("body").removeClass('active');
				$("#create-newpost").empty();
				$("#pp_loader").fadeOut(100);
			}
		});

		$("#upload-post-video").submit(function(event) {
			event.preventDefault();
			if ($("#post-video").prop('files').length != 1) {
				$(".selecet-file-control").addClass('active');
				return false;
			}

			let caption = $(this).find('textarea').val();
			let video   = $(this).find('#post-video').prop('files')[0];
			var thumb   = new File([base64_2_blob(window.cframe.dataUri)], "thumb.png", {type:"image/png"});

			if (!video || !window.cframe) {
				return false;
			}

			var formData = new FormData();

			formData.append('thumb',thumb);
			formData.append('video',video);
			formData.append('caption',caption);

			var action = $(this).attr('action') + '?hash=' + $(this).find('input[name=hash]').val();
			$(".user-heading #pp_loader").fadeIn(100);
			$("#upload-post-video").find('button[type="submit"]').attr('disabled', 'true');
			$.ajax({
				processData: false,
				url: action,
				type: 'POST',
				dataType: 'json',
				data: formData,
				contentType: false,
				xhr: function() {
                    var myXhr = $.ajaxSettings.xhr();
                    if(myXhr.upload){
                        myXhr.upload.addEventListener('progress',progress, false);
                    }
                    return myXhr;
                }
			})
			.done(function(data) {
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
			});
		});
	});
	
	function progress(e){
        if(e.lengthComputable){
            var max = e.total;
            var current = e.loaded;
            var Percentage = (current * 100)/max;
            $(".user-heading #pp_loader").find('span').html(Percentage.toFixed(0) + '%');
            if(Percentage >= 100){
                $(".user-heading #pp_loader").find('span').html( 'Processing...' ).css('margin-right',"10px");
                $(".speeding_wheel").hide();
            }
        }  
    }
        
	{/literal}
</script>
{/if}