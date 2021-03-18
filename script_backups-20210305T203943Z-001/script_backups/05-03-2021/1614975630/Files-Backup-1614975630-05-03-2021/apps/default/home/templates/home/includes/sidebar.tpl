<div class="home-sidebar-right">
    {if $ad2}
	<div class="col-md-12">
		{$ad2}
	</div>
	{/if}
	<div class="clear"></div>

	<div id="home-sidebar-sticky">
		{if $trending}
			<div class="featured-posts">
				<h5>{lang('featured_posts')}</h5>
				<div class="fluid list">
					{foreach $trending as $post_data}
						<div class="item" id="">
							<a href="#" class="fluid" onclick="lightbox('{$post_data.post_id}','profile');">
								<div class="thumb" style="background-image: url('{$post_data.thumb|media}');"></div>
								<div class="caption">
									<div class="uname">
										<h6>{$post_data.username}</h6>
									</div>
									<span>
										<time>{$post_data.time|time2str}</time>
									</span>
								</div>
							</a>
						</div>
					{/foreach}
					<div class="clear"></div>
				</div>
			</div>
		{/if}
		{if $config.story_system == 'on'}
			<div class="stories">
				<h5>{lang('stories')}
				{if $stories}
					<span class="create-new-post btn btn-link pull-right" data-type="story"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> {lang('add_story')}</span>
				{else}
				{/if}
				</h5>
				<div class="fluid list">
					{if $stories}
						{foreach $stories as $story}
							<div class="item" data-story="{$story.user_id}">
								{if not $story.owner and $story.new_stories}
									<div class="wrapper active">
										<img class="img-circle" src="{$story.avatar}" alt="Picture" />
										<b class="recent-stroires badge" data-story="{$story.user_id}">{$story.new_stories}</b>
									</div>
							  	{else}	
									<div class="wrapper">
										<img class="img-circle" src="{$story.avatar}" alt="Picture" />
									</div>
								{/if}
							  	<div class="caption">
							  		<a href="javascript:void(0);">{$story.name}</a>
							  		<time>{$story.time|time2str}</time>
							  	</div>
							</div>
						{/foreach}
					{else}
						<span class="fluid text-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
							{lang('stories_from_people')}
							<span class="create-new-post btn btn-primary" data-type="story">
					      		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg> {lang('add_story')}
					      	</span>
						</span>
					{/if}
				</div>
			</div>
		{/if}

        {if $ad3}
    	<div class="col-md-12">
    		{$ad3}
    	</div>
    	{/if}

		<div class="clear"></div>
		
		<div class="footer__container">
			{if $config.footer}
				{include file="apps/{$config.theme}/main/templates/footer/sidebar-footer.tpl"}
			{/if}
		</div>
		<div class="clear"></div>
	</div>


</div>
<script>
	jQuery(document).ready(function($) {
		{literal}
		$("div[data-story]").click(function(event) {
			var id = $(this).data('story');
			$(this).find('.wrapper').addClass('anim_border');
			if (id) {
				$.ajax({
					url: link('story/show'),
					type: 'GET',
					dataType: 'json',
					data: {user_id:id},
				})
				.done(function(data) {
					if ($('body').find('.story-container').length) {
						$('.story-container').replaceWith($(data.html));
						$('.wrapper').removeClass('anim_border');
					}
					else{
						$('body').prepend($(data.html));
						$('.wrapper').removeClass('anim_border');
					}
				});
			}
		});
		{/literal}
	});
</script>