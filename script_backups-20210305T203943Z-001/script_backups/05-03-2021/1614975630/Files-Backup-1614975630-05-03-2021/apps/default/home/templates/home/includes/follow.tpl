{if $follow}
<div class="follow-suggestions-cr">
	<div class="fluid">
		<h5>
			{lang('follow_suggestions')}
			<a href="{pxp_link('explore/people')}" class="pull-right">{lang('see_all')} <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></a>
		</h5>
	</div>
	<div class="cr-wrapper">
		<div class="owl-carousel tl-follow-suggestions" id="follow-suggestions-cr">
			{foreach $follow as $follow_sugg}
				<div class="item">
					<div class="avatar">
						<img src="{$follow_sugg.avatar}" class="img-circle">
					</div>
					<div class="uname">
						<a href="{$follow_sugg.url}">
							<strong>{$follow_sugg.username}</strong>
						</a>
						<span>
							{$follow_sugg.name}
						</span>
					</div>

					<div class="button">
						<button onclick="follow({$follow_sugg.user_id},this);">
				  			<span>{lang('follow')}</span>
				  		</button>
					</div>
				</div>
			{/foreach}
		</div>
	</div>
</div>
{/if}