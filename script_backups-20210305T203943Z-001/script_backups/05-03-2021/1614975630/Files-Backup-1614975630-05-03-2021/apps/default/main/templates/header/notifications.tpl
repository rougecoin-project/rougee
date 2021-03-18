{foreach $notifications as $notif_data}
<li>
	<a href="{$notif_data.url}">
		<div class="notifications-list-item">
			<div class="notifier__avatar">
				<img src="{$notif_data.avatar|media}" alt="Picture" class="img-circle img-res">
			</div>
			<div class="notif__body">
				<div class="notif__text">
					<strong>{$notif_data.username}</strong>
					<span class="notif__text">{lang($notif_data.type)}</span>
				</div>
				<time>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg> <span class="time-ago" title="{$notif_data.time|ToDate}">{$notif_data.time|time2str}</span>
				</time>
			</div>
		</div>
	</a>
</li>
{/foreach}