<div class="light__box" data-post-id="{$post_data.post_id}">
	<div class="lightbox-ol"></div>
	<div class="lightbox-outer">
		<div class="lightbox-inner">
			<input type="text" value="{$post_data.post_id|pid2url}" id="copyLink" class="copyPostlink" tabindex='-1' aria-hidden='true'>
			
			<div class="pp_mobi_light_control">
				{if $prev}
					<a href="javascript:void(0);" class="light__box-slide-controls prev" onclick="lightbox('{$prev}','{$page}');">
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
						</span>
					</a>
				{/if}
				
				{if $next}
					<a href="javascript:void(0);" class="light__box-slide-controls next" onclick="lightbox('{$next}','{$page}');">
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
						</span>
					</a>
				{/if}
				
				<div class="pp_light_close pull-right" onclick="$('.light__box').remove();window.history.pushState('', '', site_url( '' ) );">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</div>
			</div>
			
			<div class="post-data">
				<div class="posts-media-renderer">
					{if $post_data.type == 'image'}
						<div id="post-data-cr" class="carousel slide carousel-fade" data-ride="carousel" data-interval="false">
							<div class="carousel-inner">
								{foreach $post_data.media_set as $k => $medai_file}
									<div class="item {if $k == 0}active{/if}">
										<img src="{$medai_file.file|media}" alt="Image" class="img-res" />
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
						{foreach $post_data.media_set as $media_file}
							<img src="{$media_file.file|media}" alt="Gif image" />
						{/foreach}
					{elseif $post_data.type == 'video'}
						{foreach $post_data.media_set as $media_file}
							<video class="afterglow" id="postvideo-{$post_data.post_id}" data-autoresize="none">
								<source src="{$media_file.file|media}" type="video/mp4">
								<source src="{$media_file.file|media}" type="video/mov">
								<source src="{$media_file.file|media}" type="video/webm">
								<source src="{$media_file.file|media}" type="video/3gp">
								<source src="{$media_file.file|media}" type="video/ogg">
							</video>
						{/foreach}
						<script src="{$theme_url}/main/static/js/libs/afterglow.min.js"></script>
					{elseif $post_data.type == 'youtube'}
						<div class="pp_mobi_light_embed"><iframe src="https://www.youtube.com/embed/{$post_data.youtube}" style="width: 100%; min-width: 700px; min-height: 335px; background-image: url('{$thumb}');"></iframe></div>
					{elseif $post_data.type == 'dailymotion'}
						<div class="pp_mobi_light_embed"><iframe style="width: 100%; min-width: 700px; min-height: 335px; background-image: url('{$thumb}');" src="//www.dailymotion.com/embed/video/{$post_data.dailymotion}" frameborder="0"></iframe></div>
					{elseif $post_data.type == 'vimeo'}
						<div class="pp_mobi_light_embed"><iframe style="width: 100%; min-width: 700px; min-height: 335px; background-image: url('{$thumb}');" src="https://player.vimeo.com/video/{$post_data.vimeo}" frameborder="0"></iframe></div>
					{/if}
				</div>
				<div class="posts-votes">
					<div class="posts-votes-inner">
						<div class="heading">
							<div class="avatar">
								<img src="{$post_data.avatar|media}" class="img-circle">
							</div>
							<div class="uname">
								<h6><a href="{$post_data.username|un2url}">{$post_data.username}</a></h6>
								<span><time>{$post_data.time|time2str}</time></span>
							</div>
							{if IS_LOGGED and $me.user_id neq $post_data.user_id}
								<span{if $is_following} class="active"{/if} id="lb-follow" data-user-id="{$post_data.user_id}" {if $is_following}title="{lang('following')}"{else}title="{lang('follow')}"{/if}>
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus">{if $is_following}<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline>{else}<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line>{/if}</svg>
								</span>
							{/if}
							<div class="pp_light_close" onclick="$('.light__box').remove();window.history.pushState('', '', site_url( '' ) );">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</div>
						</div>
						{if $post_data.description}
							<div class="pp_light_caption">
								<p data-caption>{$post_data.description}</p>
							</div>
						{/if}
						<div class="comments">
							<ul class="post-comments-list">
								<span class="pp_light_comm_count">{$post_data.votes} {lang('comments')}</span>
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
								<span {if $post_data.is_liked}class="active"{/if} id="lb-like-post">
									<a href="javascript:void(0);">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
									</a>
								</span>
								<span {if $post_data.likes} class="pointer" onclick="view_post_likes('{$post_data.post_id}');"{/if}><b data-likes>{$post_data.likes}</b> {lang('likes')}</span>
								<span id="lb-copy-post" title="{lang('copy_link')}">
									<a href="javascript:void(0);" onclick="copyLinkfn();">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-copy"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>
									</a>
								</span>
								<span {if $post_data.is_saved}class="active"{/if} id="lb-save-post">
									<a href="javascript:void(0);">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bookmark"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
									</a>
								</span>
							</div>
							<form class="form">
								<div class="text-input">
									{if IS_LOGGED}
										<input type="text" class="form-control comment" placeholder="Write a comment" onkeydown="lb_comment({$post_data.post_id},event);">
										<div class="commenting-overlay hidden">
											<div id="pp_loader"><div class="speeding_wheel"></div></div>
										</div>
									{else}
										<div class="login-2comment">
											<a href="{pxp_link('welcome')}">{lang('login')}</a>
											{lang('login_to_lc_post')}
										</div>
									{/if}
								</div>
							</form>
						</div>
					</div>
				</div>

				{if $prev}
					<a href="javascript:void(0);" class="light__box-slide-controls prev" onclick="lightbox('{$prev}','{$page}');">
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
						</span>
					</a>
				{/if}
				
				{if $next}
					<a href="javascript:void(0);" class="light__box-slide-controls next" onclick="lightbox('{$next}','{$page}');">
						<span>
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
						</span>
					</a>
				{/if}
			</div>
		</div>
	</div>
	{include file="apps/{$config.theme}/main/templates/modals/delete-comment.tpl"}
</div>

<script>
	jQuery(document).ready(function($) {
		var lbox = $(".light__box");
		{if $post_data.type == 'video'}
			afterglow.init();
		{/if}

		{literal}

		lbox.find('.lightbox-outer').click(function(event) {
			if ($(event.target).hasClass('lightbox-outer')) {
				$('.light__box').remove();
				window.history.pushState("", "", site_url( '' ) );
			}
		});

		$(document).keyup(function(e) {
		    if (e.keyCode == 27) {
		    	$('.light__box').remove();
		    	window.history.pushState("", "", site_url( '' ) );
		    }
		});

		lbox.find("#lb-like-post").click(function(event) {
			var zis = $(this);
			var lks = lbox.find('[data-likes]');
			var pid = lbox.data('post-id');
			if (not(is_logged())) {
				redirect('welcome');
				return false;
			}

			if (zis.hasClass('active')) {
				zis.removeClass('active');

				if (lks) {
					let likes = int(lks.text());
					if (likes >= 1) {
						lks.text(likes - 1);
					}
				}
			}
			else{
				zis.addClass('active');
				if (lks) {
					let likes = int(lks.text()) + 1;
					lks.text(likes);
				}
			}

			$.ajax({
				url: link('posts/like'),
				type: 'POST',
				dataType: 'json',
				data: {id:pid},
			}).done(function(data) {});
		});

		lbox.find("#lb-save-post").click(function(event) {
			var zis = $(this);
			var pid = lbox.data('post-id');

			if (not(is_logged())) {
				redirect('welcome');
				return false;
			}

			if (zis.hasClass('active')) {
				zis.removeClass('active');
			}
			else{
				zis.addClass('active');
			}

			$.ajax({
				url: link('posts/save'),
				type: 'POST',
				dataType: 'json',
				data: {id:pid},
			})
			.done(function(data) {});
		});

		lbox.find('#lb-follow').click(function(event) {
			var uid = $(this).data('user-id');
			var zis = $(this);
			if (not(is_logged())) {
				redirect('welcome');
				return false;
			}

			if (zis.hasClass('active')) {
				zis.removeClass('active');
				zis.find('svg').html('<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line>');
			}
			else{
				zis.addClass('active');
				zis.find('svg').html('<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline>');
			}

			$.ajax({
				url: link('main/follow'),
				type: 'GET',
				dataType: 'json',
				data: {user_id:uid},
			}).done(function(data) {});
		});
		{/literal}
	});

function copyLinkfn() {
  var copyText = document.getElementById("copyLink");
  copyText.select();
  document.execCommand("copy");
}
</script>