{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}
<script src="{$theme_url}/main/static/js/libs/afterglow.min.js"></script>
{/block}

{block name="content"}
	<div class="post-data-container" data-post-id="{$post_data.post_id}">
		<div class="post-data-inner">
			<div class="post-media-renderer">
				{if $post_data.type == 'image'}
					<div id="post-data-cr" class="carousel slide carousel-fade" data-ride="carousel" data-interval="false">
						<div class="carousel-inner">
							{foreach $post_data.media_set as $k => $medai_file}
								<div class="item {if $k == 0}active{/if}">
									<img src="{$medai_file.file|media}" alt="Gif image" class="img-res">
								</div>
							{/foreach}
						</div>
						{if $post_data.media_set|len > 1}
							<a class="carousel-control-prev cr-controls" href="#post-data-cr" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg>
								</span>
							</a>
							<a class="carousel-control-next cr-controls" href="#post-data-cr" role="button" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
								</span>
							</a>
						{/if}
					</div>
				{elseif $post_data.type == 'gif'}
					<div class="gif">
						{foreach $post_data.media_set as $medai_file}
							<img src="{$medai_file.file|media}" alt="Gif image" class="img-res">
						{/foreach}
					</div>
				{elseif $post_data.type == 'video'}
					<div class="video">
						{foreach $post_data.media_set as $media_file}
							<video class="afterglow" id="postvideo-{$post_data.post_id}"  width="1280" height="720" data-autoresize="fit">
								<source src="{$media_file.file|media}" type="video/mp4">
								<source src="{$media_file.file|media}" type="video/mov">
								<source src="{$media_file.file|media}" type="video/webm">
								<source src="{$media_file.file|media}" type="video/3gp">
								<source src="{$media_file.file|media}" type="video/ogg">
							</video>
						{/foreach}
					</div>
					<script>
						jQuery(document).ready(function($) {
							afterglow.init();
						});
					</script>
				{elseif $post_data.type == 'youtube'}
					<div class="post-embed-frame fluid">
						<iframe style="width: 100%; min-height: 340px;" src="https://www.youtube.com/embed/{$post_data.youtube}" frameborder="0"></iframe>
					</div>
				{elseif $post_data.type == 'dailymotion'}
					<div class="post-embed-frame fluid">
						<iframe style="width: 100%; min-height: 335px;" src="//www.dailymotion.com/embed/video/{$post_data.dailymotion}" frameborder="0"></iframe>
					</div>
				{elseif $post_data.type == 'vimeo'}
					<div class="post-embed-frame fluid">
						<iframe style="width: 100%; min-height: 335px;" src="https://player.vimeo.com/video/{$post_data.vimeo}" frameborder="0"></iframe>
					</div>
				{/if}
			</div>
			<div class="sidebar">
				<div class="sidebar__inner">
					<div class="header">
						<div class="avatar">
							<img src="{$post_data.avatar|media}" alt="Avatar" class="img-circle img-res">
						</div>
						<div class="uname">
							<div class="fluid">
								<a href="{$post_data.username|un2url}">{$post_data.username}
									<span class="fluid">
										<span class="time-ago" title="{$post_data.time|ToDate}">{$post_data.time|time2str}</span>
									</span>
								</a>
								{if $is_owner == false}
									{if $is_following}
										<button class="btn-follow pull-right btn-following" onclick="follow({$post_data.user_id},this);">
											<span>{lang('following')}</span>
										</button>
									{else}
										<button class="btn-follow pull-right" onclick="follow({$post_data.user_id},this);">
											<span>{lang('follow')}</span>
										</button>
									{/if}
								{/if}
							</div>
						</div>
					</div>
					
					<div class="pp_pst_caption">
						<p data-caption>
						{if $post_data.description}
							{$post_data.description}
						{/if}
						</p>
					</div>
					
					<div class="comments">
						<ul class="post-comments-list">
							<span class="main_post_comm">{$post_data.votes} {lang('comments')}</span>
							{foreach $post_data.comments as $comment}
								<li data-post-comment="{$comment.id}">
									<div class="user-avatar">
										<img src="{$comment.avatar|media}" class="img-circle" />
									</div>
									<div class="pp_com_body">
										<span>
											<strong><a href="{$comment.username|un2url}">{$comment.username}</a></strong> {$comment.text}
										</span>
									</div>
									{if $comment.is_owner}
										<span class="pull-right delcomment" title="{lang('delete_comment')}" onclick="delete_commnet({$comment.id});">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
										</span>
									{/if}
								</li>
							{/foreach}	
						</ul>
					</div>
					<div class="comment-box">
						<div class="votes">
							{if $post_data.is_liked}
								<span class="like-post active"  onclick="like_post('{$post_data.post_id}',this);" >
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
								</span>
							{else}
								<span class="like-post"  onclick="like_post('{$post_data.post_id}',this);" >
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
								</span>
							{/if}
							<span {if $post_data.likes} class="pointer" onclick="view_post_likes('{$post_data.post_id}');"{/if}><span  data-post-likes="{$post_data.post_id}">{$post_data.likes}</span> {lang('likes')}</span>
							
							<div class="dropup">
								<span class="dropdown-toggle" data-toggle="dropdown">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
								</span>
								<ul class="dropdown-menu zoom-up">
									{if $post_data.is_owner == true}
									    <li onclick="delete_post('{$post_data.post_id}',true);">
										  	<a href="javascript:void(0);">{lang('delete_post')}</a>
										</li>
									    <li id="edit-post">
									    	<a href="javascript:void(0);">{lang('edit_post')}</a>
									    </li>
									{/if}
									{if $post_data.is_owner == false || 1}
										<li onclick="report_post('{$post_data.post_id}',this);">
										    <a href="javascript:void(0);">
										    	{if $post_data.reported}
											  		{lang('cancel_report')}
											  	{else}
											  		{lang('report_post')}
										    	{/if}
									    	</a>
										</li>
									{/if}
									<li id="save-post" data-id="{$post_data.post_id}">
									  	<a href="javascript:void(0);">
									  		{if $post_data.is_saved}
									  			{lang('unsave_post')}
									  		{else}
									  			{lang('save_post')}
									  		{/if}
									  	</a>
									</li>
								</ul>
							</div>
						</div>
						<form class="form" action="javascript:void(0);">
							<input type="hidden" name="hash" value="{$csrf_token}">
							<div class="text-input">	
								{if IS_LOGGED}
									<div class="user-avatar">
										<img class="img-circle" src="{$me.avatar}" alt="avatar" />
									</div>
									<input type="text" class="form-control comment" placeholder="Write a comment" data-post-id="{$post_data.post_id}">
									<div class="commenting-overlay hidden">
										<div id="pp_loader"><div class="speeding_wheel"></div></div>
									</div>
								{else}
									<div class="login2comment">
										<a href="{pxp_link('welcome')}">{lang('login')}</a> {lang('login_to_lc_post')}
									</div>
								{/if}
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="footer__container">
			{include file="apps/{$config.theme}/main/templates/includes/lazy-load.tpl"}
		</div>
		
		{if $follow}
			<div class="follow-suggestions-cr">
				<div class="fluid">
					<h5>
						{lang('follow_suggestions')}
						<a href="{pxp_link('explore/people')}" class="pull-right">{lang('see_all')} <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></a>
					</h5>
				</div>
				<div class="cr-wrapper">
					<div class="owl-carousel post-follow-suggestions" id="follow-suggestions-cr">
						{foreach $follow as $follow_sugg}
							<div class="item">
								<div class="avatar">
									<img src="{$follow_sugg.avatar}" class="img-circle">
								</div>
								<div class="uname">
									<a href="{$follow_sugg.url}">
										<strong>{$follow_sugg.username}</strong>
									</a>
									<span>{$follow_sugg.name}</span>
								</div>
								<div class="button">
									<button onclick="follow({$follow_sugg.user_id},this);"><span>{lang('follow')}</span></button>
								</div>
							</div>
						{/foreach}
					</div>
				</div>
			</div>
		{/if}
	</div>

	{include file="apps/{$config.theme}/main/templates/modals/edit-post.tpl"}
	{include file="apps/{$config.theme}/main/templates/modals/delete-post.tpl"}
	{include file="apps/{$config.theme}/main/templates/modals/delete-comment.tpl"}

	<script>
		jQuery(document).ready(function($) {
			var pd_cont = $(".post-data-container");

			pd_cont.find('input[type="text"]').keydown(function(event) {
				if (event.keyCode == 13 && event.shiftKey == 0) {
					event.preventDefault();
					event.stopPropagation();
					pd_cont.find('.commenting-overlay').removeClass('hidden');
					var zis  = $(this);
					var text = zis.val();
					var list = pd_cont.find('.post-comments-list');
					var id   = $(this).data('post-id');

					if (!text) { return false; }

					$.post(link('posts/add-comment'), {literal}{post_id:id,text:text}{/literal}, function(data, textStatus, xhr) {
						if (data.status == 200) {
							$(data.html).insertAfter(list.find('span.main_post_comm'));
						}

						zis.val('');
						pd_cont.find('.commenting-overlay').addClass('hidden');
					});
				}
			});

			pd_cont.find('#save-post').click(function(event) {
				if (not(is_logged())) {
					redirect('welcome');
					return false;
				}
				var post_id = $(this).data('id');
				var zis     = $(this);

				if (!post_id) {
					return false;
				}

				$.ajax({
					url: link('posts/save'),
					type: 'POST',
					dataType: 'json',
					data: {literal}{id:post_id}{/literal},
				})
				.done(function(data) {
					if (data.status == 200 && data.code == 0) {
						zis.find('a').text("{lang('save_post')}");
					}

					else if(data.status == 200 && data.code == 1){
						zis.find('a').text("{lang('unsave_post')}");
					}

					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });
				});
			});

			pd_cont.find('#edit-post').click(function(event) {
				if (not(is_logged())) {
					redirect('welcome');
					return false;
				}

				$("#edit-post-modal").fadeIn(200, function() {
					var text = pd_cont.find('[data-caption]').text();
					$(this).find('#caption').val($.trim(text));
				});
			});

			$("#edit-post-modal").find('button[type="button"]').click(function(event) {
				$("#edit-post-modal").fadeOut(200, function() {
					$(this).find('#caption').val('');
				});
			});

			$("#edit-post-modal").find('form').submit(function(event) {
				event.preventDefault();
				var text    = $(this).find('#caption').val();
				var post_id = $(this).find('#post_id').val();
				
				if (int(post_id) == 0) {
					return false;
				}

				pd_cont.find('[data-caption]').html(linkify_htags(text));

				$("#edit-post-modal").fadeOut(200, function() {
					$(this).find('#caption').val('');
				});

				$.ajax({
					url: link('posts/update'),
					type: 'POST',
					dataType: 'json',
					{literal}
					data: {text:text,id:post_id},
					{/literal}
				})
				.done(function(data) {
					if (data.message) {
						$.toast(data.message,{
			            	duration: 5000, 
			            	type: '',
			            	align: 'top-right',
			            	singleton: false
			            });
					}
				});
			});
		});
	</script>
{/block}
{block name="footer"}
<footer>
	<div class="container container-{$app_name} container-{$app_name}-main">
	<div class="footer__container">
		{if $config.footer}
			{include file="apps/{$config.theme}/main/templates/footer/footer.tpl"}
		{/if}
	</div>
	</div>
</footer>
{/block}