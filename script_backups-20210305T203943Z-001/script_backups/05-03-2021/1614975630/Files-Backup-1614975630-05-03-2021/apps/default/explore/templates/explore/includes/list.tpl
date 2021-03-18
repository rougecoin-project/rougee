<div class="item wrapper">
	<div class="explore-postset" id="{$post_data.post_id}">
		<div class="image" onclick="lightbox('{$post_data.post_id}','{$page}');" style="background-image: url('{$post_data.thumb|media}');">
			{if $post_data.type neq 'image' and $post_data.type neq 'gif'}
				<span class="category">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="feather feather-video"><path d="M17,10.5V7A1,1 0 0,0 16,6H4A1,1 0 0,0 3,7V17A1,1 0 0,0 4,18H16A1,1 0 0,0 17,17V13.5L21,17.5V6.5L17,10.5Z" /></svg>
				</span>
				<span class="play-btn">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="feather feather-play"><path d="M8,5.14V19.14L19,12.14L8,5.14Z" /></svg>
				</span>
			{/if}
			<div class="caption">
				<div>
					<div class="user__">
						<img src="{$post_data.avatar|media}" class="img-circle">
						<a href="{$post_data.username|un2url}" class="publisher-name">{$post_data.username}</a>
						<span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg> {$post_data.likes}</span>
						<span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg> {$post_data.likes}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>