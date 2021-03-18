{if $user_followers > 0}
<div class="container container-profile">
	<div class="row followers--ls">
		{foreach $followers_ls as $udata}
			{include file="includes/followers-ls-item.tpl"}
		{/foreach}
	</div>
</div>
<script>
	var user_id  = '{$user_data.user_id}';
	{literal}
	jQuery(document).ready(function($) {
		var scrolled = 0;
		var last_id  = 0;

		$(window).scroll(function() {
		    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
		    	if (scrolled == 0) {
	                scrolled    = 1;
	                var last_id = 0;

	                if ($('.followers--ls__item').length > 0) {
	                	last_id = $('.followers--ls__item:last').attr('id');
	                }

	                if (!last_id) { return; }

					$.ajax({
						url: xhr_url() + 'profile/load-user-followers',
						type: 'GET',
						dataType: 'json',
						data: {
							offset:last_id,
							user_id:user_id
						},
					}).done(function(data) {
						if (data.status == 200) {
							$(".followers--ls").append($(data.html));
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
{/if}