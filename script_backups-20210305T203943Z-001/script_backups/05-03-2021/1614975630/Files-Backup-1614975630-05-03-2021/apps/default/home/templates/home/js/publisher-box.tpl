<div id="create-newpost"></div>
<script>
  jQuery(document).ready(function($) {
    $(".create-new-post").click(function(event) {
    	var post_type = $(this).attr('data-type');
    	if (post_type) {
    		$("#modal-progress").removeClass('hidden');
    		$.ajax({
    			url: link('posts/new-' + post_type),
    			type: 'GET',
    			dataType: 'json',
    		})
    		.done(function(data) {
    			if (data.status == 200) {
    				$('body').addClass('active');
    				$("#create-newpost").html(data.html).fadeIn(100);
    			}
                else{
                    if (data.message) {
                        $.toast(data.message,{
                          duration: 5000, 
                          type: '',
                          align: 'top-right',
                          singleton: false
                        });
                    }
                }
    			$("#modal-progress").addClass('hidden');
    		});
    	}
    });
    $(document).on('click','#close-anim-modal',function(event) {
		$("#create-newpost").fadeOut(100,function(){
			$(this).empty();
			$("body").removeClass('active');
		});
	});
	$(document).keyup(function(e) {
		if (e.keyCode == 27) {
			$("#create-newpost").fadeOut(100,function(){
			$(this).empty();
			$("body").removeClass('active');
		});
		}
	});
  });
</script>

<template class="template" id="post-editing-template">
    <div class="content post-editing-form">
        <div class="user-heading">
            <img src="{$me.avatar}" width="35px" class="img-circle">
            <span>{$me.username}</span>
            <span class="pull-right"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><polygon points="16 3 21 8 8 21 3 21 3 16 16 3"></polygon></svg> {lang('edit_post')}</span>
        </div>
        <form class="form" id="edit-post-caption" action="{$site_url}/aj/posts/update" autocomplete="true">
            <div class="form-group">
                <textarea class="form-control" name="caption" rows="4" id="caption" placeholder="{lang('add_post_caption')}"></textarea>
            </div>
            <div class="form-group publish">
                <button type="submit" class="btn btn-info">
                    <i class="la la-paper-plane"></i> {lang('save_changes')}
                </button>
                <button type="reset" class="btn btn-default" id="close-anim-modal">
                    <i class="la la-ban"></i> {lang('close')}
                </button>
            </div>
            <input type="hidden" id="post_id" name="post_id">
            <input type="hidden" name="hash" value="{$csrf_token}">
        </form>
    </div>
</template>