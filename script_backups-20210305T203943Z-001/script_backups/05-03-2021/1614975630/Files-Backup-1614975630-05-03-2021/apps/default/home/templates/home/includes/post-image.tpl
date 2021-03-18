<div class="timeline-posts content-shadow" data-post-id="{$post_data.post_id}">
	<div class="header">
		<img src="{$post_data.avatar|media}" class="img-circle" />
		<a href="{$post_data.username|un2url}" class="publisher-name">{$post_data.username}</a>
		<div class="dropdown pull-right">
			<span class="dropdown-toggle" data-toggle="dropdown">
			    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
			</span>
			<ul class="dropdown-menu zoom">
			    {if $post_data.is_owner == true}
			    	<li onclick="delete_post('{$post_data.post_id}');">
				  		<a href="javascript:void(0);">{lang('delete_post')}</a>
				  	</li>
			    	<li onclick="edit_post('{$post_data.post_id}');">
			    		<a href="javascript:void(0);">{lang('edit_post')}</a>
			    	</li>
			    {/if}
			    {if $post_data.is_owner != true || 1}
			    <li onclick="report_post('{$post_data.post_id}',this);">
			  		<a href="javascript:void(0);">
			  			{if $post_data.reported}{lang('cancel_report')}{else}{lang('report_post')}{/if}
			  		</a>
			  	</li>
			  	{/if}
			    <li>
			  		<a href="{$post_data.post_id|pid2url}" target="_blank">{lang('go2post')}</a>
			  	</li>
			</ul>
		</div>
		<time>
			<a href="{$post_data.post_id|pid2url}" target="_blank"><span class="time-ago" title="{$post_data.time|ToDate}">{$post_data.time|time2str}</span></a>
		</time>
		<div class="clear"></div>
	</div>
	<div class="post-images fluid lightgallery" data-lightgallery="{$post_data.post_id}">
		{if $post_data.media_set|@count gt 1}
			{foreach $post_data.media_set as $id => $file}
				{if $id == 0}
					<a href="{$file.file|media}" class="lightgallery-item active" data-lightbox="group" style="background-image: url('{$file.file|media}');">
						<div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="feather feather-multiple"><path d="M4,2C2.89,2 2,2.89 2,4V14H4V4H14V2H4M8,6C6.89,6 6,6.89 6,8V18H8V8H18V6H8M12,10C10.89,10 10,10.89 10,12V20C10,21.11 10.89,22 12,22H20C21.11,22 22,21.11 22,20V12C22,10.89 21.11,10 20,10H12Z" /></svg></div>
					</a>
				{else}
					<a href="{$file.file|media}" class="image-lightbox" data-lightbox="group"></a>
				{/if}
		    {/foreach}
		{else}
			{foreach $post_data.media_set as $media_file}
				<a data-sub-html="#image-caption-{$post_data.post_id}" href="{$media_file.file|media}" class="image-lightbox" data-lightbox>
					<img src="{$media_file.file|media}" class="img-res">
				</a>
			{/foreach}
		{/if}
	</div>
	<div class="actions">
		<span onclick="like_post('{$post_data.post_id}',this);" class="like-post {if $post_data.is_liked}active{/if}">
			<span class="like-icon"><div class="heart-animation-1"></div><div class="heart-animation-2"></div></span>
		</span>
		<span onclick="$('#vote-postf-{$post_data.post_id}').scroll2();">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
		</span>

		<span class="pull-right save-post {if $post_data.is_saved}active{/if}" onclick="save_post('{$post_data.post_id}',this);">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bookmark"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
		</span>
	</div>
	
	<div class="post-votes">
		<div onclick="view_post_likes('{$post_data.post_id}');">
			<span data-post-likes="{$post_data.post_id}">{$post_data.likes}</span>
			<strong>{lang('likes')}</strong>
		</div>
		<div onclick="toggle_post_comm('{$post_data.post_id}');">
			<span>{$post_data.votes}</span>
			<strong>{lang('comments')}</strong>
		</div>
	</div>
	
	<div class="caption" data-caption>
		{if $post_data.description}
			{$post_data.description}
		{/if}
	</div>
	
	<div class="comments-area">
		<ul class="post-comments-list">
			<li class="pp_post_comms hidden"></li>
			{foreach $post_data.comments as $comment}
				{include file="includes/comments.tpl"}
			{/foreach}
			
			{if $post_data.votes > 4}
				<li class="load-comments">
					<button onclick="load_tlp_comments('{$post_data.post_id}',this);">{lang('show_more')} {lang('comments')}</button>
				</li>
			{/if}
		</ul>
		
		<form class="form add-comment" id="vote-postf-{$post_data.post_id}">
			<div class="fluid">
				<div class="user-avatar">
					<img src="{$me.avatar}" width="34px" height="34px" class="img-circle">
				</div>
				<div class="form-group">
					<input type="text" class="form-control comment" onkeydown="comment_post({$post_data.post_id},event);" placeholder="{lang('write_comment')}">
				</div>
			</div>
			<div class="commenting-overlay hidden">
				<div id="pp_loader"><div class="speeding_wheel"></div></div>
			</div>
		</form>
	</div>
</div>

<script>
	jQuery(document).ready(function($) {
		$('div[data-lightgallery="{$post_data.post_id}"]').lightGallery({
			mode:'lg-fade',
			zoom:true,
			scale:1,
			actualSize:false
		}).on('onBeforeOpen.lg', function(event) {
			event.preventDefault();
			$("body").delay(1000).addClass('page__numb');
		}).on('onBeforeClose.lg',function(event) {
			event.preventDefault();
			$("body").delay(1000).removeClass('page__numb');
		});
	});
</script>
