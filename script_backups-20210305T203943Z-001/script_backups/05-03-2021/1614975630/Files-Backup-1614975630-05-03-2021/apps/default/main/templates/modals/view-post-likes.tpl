<div class="modal--dialog open" id="view-post-likes">
	<div class="modal-outer">
		<div class="modal-inner">
			<h5 class="title"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users" color="#2196f3" style="background-color: rgba(33, 150, 243, 0.25)"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg> {lang('people_who_liked')} 
				<span class="pull-right" title="{lang('close')}" onclick="$('#view-post-likes').remove();">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</span>
			</h5>
			<ul class="list-group" id="user-list">
				{foreach $users as $udata}
					<li class="list-group-item">
						<div class="avatar">
							<img src="{$udata.avatar|media}" class="img-circle img-res">
						</div>
						<div class="user-info">
							<a href="{$udata.username|un2url}">{$udata.username}</a>
							<time>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg> {$udata.time|time2str}
							</time>
						</div>
						{if IS_LOGGED and $udata.user_id != $me.user_id}
								{if isset($udata.is_following) and $udata.is_following == true}
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
					</li>
				{/foreach}				
			</ul>
		</div>
	</div>
</div>