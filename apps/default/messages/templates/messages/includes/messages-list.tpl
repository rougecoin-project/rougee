{if $msg_data.from_id == $me.user_id}
<div class="message-list-item right" data-id="{$msg_data.id}">
	<div class="message-list-item__inner right">			
		<div class="message__data">
			<p class="message__text">{$msg_data.text}</p>
			<time class="pull-right"><span class="time-ago" title="{$msg_data.time|ToDate}">{$msg_data.time|time2str}</span><time>
		</div>
		<div class="user__avatar">
			<img src="{$me.avatar}" class="img-circle">	
		</div>
	</div>
</div>
{else}
<div class="message-list-item left" data-id="{$msg_data.id}">
	<div class="message-list-item__inner left">
		<div class="user__avatar">
			<img src="{$user_data.avatar|media}" class="img-circle">	
		</div>
		<div class="message__data">
			<p class="message__text">{$msg_data.text}</p>
			<time><span class="time-ago" title="{$msg_data.time|ToDate}">{$msg_data.time|time2str}</span><time>
		</div>
	</div>
</div>
{/if}