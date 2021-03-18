<div class="content post-editing-form">
	<div class="user-heading">
		<img src="{$me.avatar}" class="img-circle">
		<span>{$me.username}</span>
		<svg class="feather feather-arrow" width="18" height="18" viewBox="0 0 48 48" fill="#757575"><path d="M20 34l10-10 -10-10z"></path></svg>
		<span class="pp_area"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-youtube"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"></path><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"></polygon></svg> {lang('embed_video')}</span>
		<div id="pp_loader"><div class="speeding_wheel"></div></div>
	</div>
  	<form class="form" id="embed-post-video" action="{$site_url}/aj/posts/embed-post-video" autocomplete="true">
		<div class="form-group">
	      	<textarea class="form-control" name="caption" rows="3" placeholder="{lang('add_post_caption')}"></textarea>
		</div>
      	<div class="form-group fetch-url">
      		<div class="video-url">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-link"><path d="M15 7h3a5 5 0 0 1 5 5 5 5 0 0 1-5 5h-3m-6 0H6a5 5 0 0 1-5-5 5 5 0 0 1 5-5h3"></path><line x1="8" y1="12" x2="16" y2="12"></line></svg>
      			<input name="url" placeholder="YouTube, Dailymotion, Vimeo URL" />
      		</div>
      	</div>
      	<div class="fluid iframe-renderer">
      		<div class="form-group" id="embed-iframe"></div>
      	</div>
      	<div class="form-group publish">
      		<button type="submit" class="btn btn-info">{lang('publish')}</button>
      		<button type="reset" class="btn btn-default" id="close-anim-modal">{lang('close')}</button>
      	</div>
      	<input type="hidden" id="video_id" name="video_id">
      	<input type="hidden" id="embed" name="embed">
            <input type="hidden" name="hash" value="{$csrf_token}">
  	</form>
</div>
{include file="js/script.embed.video.tpl" assign="script"}
{$script|minify_js}
