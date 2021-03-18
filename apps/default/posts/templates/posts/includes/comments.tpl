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
		<span class="pull-right delcomment" title="Delete comment" onclick="delete_commnet({$comment.id});">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
		</span>
	{/if}
</li>