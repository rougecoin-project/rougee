<div class="blocked-users--ls-item" data-blocked-users-ls="{$udata.user_id}">
	<div class="avatar">
		<img src="{$udata.avatar|media}" alt="Picture" class="img-circle img-res">
	</div>
	<h4>
			{$udata.username}
				<span class="name">
					{$udata.name}
				</span>
			</h4>
	<button class="btn btn-info unblock-user" id="{$udata.user_id}">
				{lang('unblock')}
			</button>
</div>