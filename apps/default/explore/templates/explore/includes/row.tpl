<div class="explore-people__item col-xs-4 col-sm-3 col-md-3 col-lg-3" id="{$udata.user_id}">
	<div class="avatar text-center">
		<img src="{$udata.avatar|media}" alt="Picture" class="img-circle img-res">
	</div>
	<div class="user__info">
		<h5><a href="{$udata.username|un2url}">{$udata.username}</a></h5>
		<div class="user__stat">
			<span>
				<b>{$udata.followers}</b>
				<small>{lang('followers')}</small>
			</span>
			<span>
				<b>{$udata.posts}</b>
				<small>{lang('posts')}</small>
			</span>
		</div>
		<div class="clear"></div>
		<button class="btn btn-info" onclick="follow({$udata.user_id},this);">
			<span>{lang('follow')}</span>
		</button>
		<div class="clear"></div>
	</div>
</div>