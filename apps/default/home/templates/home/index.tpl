{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}
	{* include here additional static files js,css ...*}
	<script src="{$theme_url}/main/static/js/libs/gridAlicious/jquery.grid-a-licious.js"></script>
	<script src="{$theme_url}/main/static/js/libs/afterglow.min.js"></script>
	<script src="{$theme_url}/main/static/js/libs/jquery.pause.js"></script>
{/block}

{block name="content"}

	<div class="row">
		<div class="home-page-container">
		    {if $ad1}
			<div class="col-md-12">
			    {$ad1}
			</div><br><br>
			{/if}
			<div class="col-md-8">
				{if $post_sys}
					<div class="postin-area">
						{include file="js/publisher-box.tpl" assign="publisher_box"}
						{$publisher_box|minify_js}
						<div class="clear"></div>
					</div>
				
					<div class="pp_pubbox_opt">
						{if $config.upload_images == 'on'}
							<div class="nd1 nds" title="{lang('add_img')}">
								<span class="create-new-post" data-type="image">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="#4caf50" class="feather feather-camera"><path d="M4,4H7L9,2H15L17,4H20A2,2 0 0,1 22,6V18A2,2 0 0,1 20,20H4A2,2 0 0,1 2,18V6A2,2 0 0,1 4,4M12,7A5,5 0 0,0 7,12A5,5 0 0,0 12,17A5,5 0 0,0 17,12A5,5 0 0,0 12,7M12,9A3,3 0 0,1 15,12A3,3 0 0,1 12,15A3,3 0 0,1 9,12A3,3 0 0,1 12,9Z" /></svg>
								</span>
							</div>	
						{/if}
						{if $config.upload_videos == 'on'}
							<div class="nd3 nds" title="{lang('add_vid')}">
								<span class="create-new-post" data-type="video">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="#2396f3" class="feather feather-video"><path d="M17,10.5V7A1,1 0 0,0 16,6H4A1,1 0 0,0 3,7V17A1,1 0 0,0 4,18H16A1,1 0 0,0 17,17V13.5L21,17.5V6.5L17,10.5Z" /></svg>
								</span>
							</div>
						{/if}
						{if $config.import_images == 'on'}
							<div class="nd5 nds" title="{lang('imp_gif')}">
								<span class="create-new-post" data-type="gif" style="padding: 5.9px 0;">
									<svg fill="#6b376b" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" class="feather feather-user-plus" style="width: 34px;height: 34px;margin-top: -2px;"><path d="M0 0h24v24H0z" fill="none"></path><defs> <path d="M24 24H0V0h24v24z" id="a"></path> </defs> <clipPath id="b"> <use overflow="visible" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#a"></use> </clipPath> <path clip-path="url(#b)" d="M11.5 9H13v6h-1.5zM9 9H6c-.6 0-1 .5-1 1v4c0 .5.4 1 1 1h3c.6 0 1-.5 1-1v-2H8.5v1.5h-2v-3H10V10c0-.5-.4-1-1-1zm10 1.5V9h-4.5v6H16v-2h2v-1.5h-2v-1z"></path></svg>
								</span>
							</div>
						{/if}
						{if $config.import_videos == 'on'}
							<div class="nd4 nds" title="{lang('imp_vid')}">
								<span class="create-new-post" data-type="embed">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="#cc8317" class="feather feather-link"><path d="M10.59,13.41C11,13.8 11,14.44 10.59,14.83C10.2,15.22 9.56,15.22 9.17,14.83C7.22,12.88 7.22,9.71 9.17,7.76V7.76L12.71,4.22C14.66,2.27 17.83,2.27 19.78,4.22C21.73,6.17 21.73,9.34 19.78,11.29L18.29,12.78C18.3,11.96 18.17,11.14 17.89,10.36L18.36,9.88C19.54,8.71 19.54,6.81 18.36,5.64C17.19,4.46 15.29,4.46 14.12,5.64L10.59,9.17C9.41,10.34 9.41,12.24 10.59,13.41M13.41,9.17C13.8,8.78 14.44,8.78 14.83,9.17C16.78,11.12 16.78,14.29 14.83,16.24V16.24L11.29,19.78C9.34,21.73 6.17,21.73 4.22,19.78C2.27,17.83 2.27,14.66 4.22,12.71L5.71,11.22C5.7,12.04 5.83,12.86 6.11,13.65L5.64,14.12C4.46,15.29 4.46,17.19 5.64,18.36C6.81,19.54 8.71,19.54 9.88,18.36L13.41,14.83C14.59,13.66 14.59,11.76 13.41,10.59C13,10.2 13,9.56 13.41,9.17Z" /></svg>
								</span>
							</div>	
						{/if}
					</div>
				{/if}
				
				<div class="home-posts-container">
					{if $posts}
						{foreach $posts as $key => $post_data}
							{if $post_data.type == 'image'}
						   		{include file="includes/post-image.tpl"} 
						   	{else if $post_data.type == 'video'}
						   		{include file="includes/post-video.tpl"}
						   	{else if $post_data.type == 'gif'}
						   		{include file="includes/post-image.tpl"}
						   	{else if $post_data.type == 'youtube'}
						   		{include file="includes/post-youtube.tpl"}
						   	{else if $post_data.type == 'vimeo'}
						   		{include file="includes/post-vimeo.tpl"} 
						   	{else if $post_data.type == 'dailymotion'}
						   		{include file="includes/post-dailymotion.tpl"} 
						   	{/if}

							{if $key == 0 and $follow|@count gt 1}
								{include file="includes/follow.tpl"}
						   	{else if  $key == 15 and $follow|@count gt 15}
								{include file="includes/follow.tpl"}
							{/if}
						{/foreach}
					{else}
						{include file="includes/follow.tpl"}
						{include file="includes/no-posted.tpl"} 
					{/if}
				</div>
				<div class="posts__loader hidden">
					<div id="pp_loader"><div class="speeding_wheel"></div></div>
				</div>
			</div>
			<div class="col-md-4 custom-fixed-element no-padding-left">
				{include file="includes/sidebar.tpl"}
			</div>
			<div class="clear"></div>
		</div>
		{if $post_sys}
			<div class="add-post-bf--controls clearfix">
				<div class="btns">
					{if $config.import_images == 'on'}
						<div class="nd5 nds" flow="left" tooltip="{lang('imp_gif')}">
							<span class="create-new-post" data-type="gif">
					      		<svg fill="#676767" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" class="feather feather-gif" style="width: 27px;height: 27px;"><path d="M0 0h24v24H0z" fill="none"></path><defs> <path d="M24 24H0V0h24v24z" id="a"></path> </defs> <clipPath id="b"> <use overflow="visible" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#a"></use> </clipPath> <path clip-path="url(#b)" d="M11.5 9H13v6h-1.5zM9 9H6c-.6 0-1 .5-1 1v4c0 .5.4 1 1 1h3c.6 0 1-.5 1-1v-2H8.5v1.5h-2v-3H10V10c0-.5-.4-1-1-1zm10 1.5V9h-4.5v6H16v-2h2v-1.5h-2v-1z"></path></svg>
					      	</span>
						</div>
					{/if}
					{if $config.import_videos == 'on'}
						<div class="nd4 nds" flow="left" tooltip="{lang('imp_vid')}">
					      	<span class="create-new-post" data-type="embed">
					      		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-link"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
					      	</span>
						</div>	
					{/if}
					{if $config.upload_videos == 'on'}
						<div class="nd3 nds" flow="left" tooltip="{lang('add_vid')}">
							<span class="create-new-post" data-type="video">
					      		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
					      	</span>
						</div>
					{/if}
					{if $config.upload_images == 'on'}
						<div class="nd1 nds" flow="left" tooltip="{lang('add_img')}">
					      	<span class="create-new-post" data-type="image">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-camera"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
							</span>
						</div>	
					{/if}
				</div>
				<div id="floating-button">
					<span class="plus">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
					</span>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x edit"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</div>
			</div>
		{/if}
		<div class="clear"></div>
	</div>


	{include file="apps/{$config.theme}/main/templates/includes/lazy-load.tpl"}
	{include file="apps/{$config.theme}/main/templates/modals/delete-post.tpl"}
	{include file="apps/{$config.theme}/main/templates/modals/delete-comment.tpl"}
	
	{literal}
	<script>
	jQuery(document).ready(function() {jQuery('.custom-fixed-element').theiaStickySidebar({additionalMarginTop: 65});});
		var pxScrolled = 180;
		$(window).scroll(function() {
			if ($(this).scrollTop() > pxScrolled) {
				$('.add-post-bf--controls').css({'bottom': '32px', 'transition': '.3s'});
			} else {
				$('.add-post-bf--controls').css({'bottom': '-60px'});
			} 
		});
		jQuery(document).ready(function($) {
			var scrolled = 0;
			var last_id  = 0;
			var posts_cn = $('.home-posts-container');

			$(window).scroll(function() {
			    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			    	if (scrolled == 0) {
		                scrolled = 1;
		                posts_cn.siblings('.posts__loader').removeClass('hidden');
			            if ($('[data-post-id]').length > 0) {
			            	last_id  = $('[data-post-id]').last().data('post-id');
			            }
			            
						$.ajax({
							url: link('posts/load-tl-posts'),
							type: 'GET',
							dataType: 'json',
							data: {offset:last_id},
						}).done(function(data) {
							if (data.status == 200) {
								posts_cn.append($(data.html));
								scrolled = 0;
							}
							else{
								$(window).unbind('scroll');
							}

							posts_cn.siblings('.posts__loader').addClass('hidden');
						});
		       		}
			    }
			});
		});
	</script>
	{/literal}
{/block}

{block name="footer_static"}
<script src="{$theme_url}/main/static/js/libs/lightGallery/src/js/lightgallery.js"></script>
<script src="{$theme_url}/main/static/js/libs/lightGallery/modules/lg-zoom.js"></script>
<script src="{$theme_url}/main/static/js/libs/lightGallery/modules/lg-fullscreen.js"></script>
<link rel="stylesheet" href="{$theme_url}/main/static/js/libs/lightGallery/src/css/lightgallery.css">
<link rel="stylesheet" href="{$theme_url}/main/static/js/libs/lightGallery/src/css/lg-transitions.css">
{/block}