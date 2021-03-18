<div class="search-result--item">
	<a href="{$udata.username|un2url}" class="fluid">
		<div class="avatar">
			<img src="{$udata.avatar|media}" alt="Picture" class="img-circle img-res">
		</div>
		<div class="user-info">
			<h5>{$udata.username}</h5>
			<span>
				{if $udata.fname and $udata.lname}
					{$udata.fname} {$udata.lname}
				{else}
					{$udata.username}
				{/if}
			</span>
		</div>
	</a>
</div>