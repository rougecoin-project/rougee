<div class="container container-profile user-posts__container">
	<div class="user-posts">
		{if $favorite_posts|@count gt 0}
			{foreach $favorite_posts as $post_data}
				{include file="includes/list.tpl"}
			{/foreach}
		{else}
			{include file="includes/no-posted.tpl"} 
		{/if}
	</div>
</div>

<script>
	var ajax_url = '{$xhr_url}';
	{literal}
	var gwidth = ($('.user-posts').width() / 3);
	$(".user-posts").gridalicious({
		selector: '.item',
		gutter: 0,
		width:gwidth,
		animate: true,
		animationOptions: { 
		    speed: 100, 
		    duration: 200
		}
	});
	

	jQuery(document).ready(function($) {
		var scrolled = 0;
		var last_id  = 0;

		$(window).scroll(function() {
		    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {

		    	if (scrolled == 0) {
	                scrolled = 1;
	                var list_ids = $("div.user-postset[id]").map(function() {
		                return $(this).attr('id');
		            }).get();

		            if (!list_ids) {
		                return false;
		            }
		            
    				var last_id  = Math.min.apply(Math,list_ids);

					$.ajax({
						url: ajax_url + '/load-saved-posts',
						type: 'GET',
						dataType: 'json',
						data: {
							offset:last_id
						},
					}).done(function(data) {
						if (data.status == 200) {
							$(".user-posts").gridalicious('append', $(data.html));
							scrolled = 0;
						}
						else{
							$(window).unbind('scroll');
						}
					});
	       		}
		    }
		});
	});
	{/literal}
</script>