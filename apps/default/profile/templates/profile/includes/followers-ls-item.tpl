<div class="followers--ls__item col-xs-4 col-sm-3 col-md-3 col-lg-3" id="{$udata.user_id}">
	<div class="avatar text-center">
		<img src="{$udata.avatar|media}" alt="Picture" class="img-circle img-res">
	</div>
	<div class="user__info">
		<h5><a href="{$udata.username|un2url}">{$udata.username}</a></h5>
		<p>{lang('last_seen')}: {$udata.last_seen|time2str}</p>
		{if IS_LOGGED and $udata.user_id != $me.user_id}
			{if $udata.is_following == true}
				<button class="btn btn-info btn-following" onclick="follow({$udata.user_id},this);">
					<span>{lang('following')}</span>
				</button>
			{else}
				<button class="btn btn-info" onclick="follow({$udata.user_id},this);">
					<span>{lang('follow')}</span>
				</button>
			{/if}
		{elseif IS_LOGGED === false}
			<button class="btn btn-info" onclick="follow({$udata.user_id},this);">
				<span>{lang('follow')}</span>
			</button>
		{/if}
	</div>
</div>