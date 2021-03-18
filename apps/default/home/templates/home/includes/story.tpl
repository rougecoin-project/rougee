<div class="story-container" data-uid="{$us_data.user_id}">
	<div class="header">
		<div class="user-info">
			<div class="avatar">
				<img src="{$us_data.avatar}" class="img-circle">
			</div>
			<h5>{$us_data.username}
				<time>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg> <b class="story-added"></b>
				</time>
			</h5>
		</div>
		<div class="close-modal" title="{lang('close')}">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x" style="width: 25px;height: 25px;margin-top: -3px;"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
		</div>

		{if $me.user_id == $us_data.user_id}
			<div class="delete-story" title="{lang('delete')}">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>
			</div>
		{/if}	
	</div>
	<div class="bg"></div>
	<div class="container">
		<ul class="int-indicator">
			{foreach $stories as $k => $v}
				<li style="flex:{$w}%;" {if isset($v.sf)}class="active"{/if}>
					<span class="int-indicator-bar"></span>
				</li>
			{/foreach}	
		</ul>
		<div id="view-story-cr" class="carousel slide carousel-fade" data-ride="carousel" data-interval="false">
			<div class="carousel-inner">
				{foreach $stories as $k => $story}
					{if $story.type == 1}
						<div class="item img {if isset($story.sf)}active{/if}" data-src="{$story.src}" data-id="{$story.id}" data-time="{$story.time|time2str}" {if isset($story.is_seen) and $story.is_seen == '0'}data-s="{$story.id}"{/if}>
							<img src="{$story.src}" />
							<div class="caption">
								{if $story.owner}
									<div class="views">
										<span class="fluid"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg> {$story.views}</span>
									</div>
								{/if}
								{if $story.caption}	
									<p>
										{$story.caption}
									</p>		
								{/if}	
							</div>	
						</div>
					{else}
						<div class="item video {if isset($story.sf)}active{/if}" data-src="{$images}/story-bg.jpg" data-id="{$story.id}" data-time="{$story.time|time2str}" {if isset($story.is_seen) and $story.is_seen == '0'}data-s="{$story.id}"{/if}>
							<video>
								<source src="{$story.src}" type="video/mp4">
								<source src="{$story.src}" type="video/mov">
								<source src="{$story.src}" type="video/webm">
								<source src="{$story.src}" type="video/3gp">
								<source src="{$story.src}" type="video/ogg">
							</video>						
							<div class="caption">
								{if $story.owner}
									<div class="views">
										<span class="fluid"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg> {$story.views}</span>
									</div>
								{/if}
								{if $story.caption}	
									<p>
										{$story.caption}
									</p>		
								{/if}	
							</div>
						</div>
					{/if}
				{/foreach}
			</div>
			{if $stories|@count > 1}
				<a class="carousel-control-prev cr-controls pointer" onclick="slide_left_story();" data-slide="prev" style="display: none;">
					<span class="carousel-control-prev-icon">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg>
					</span>
				</a>
				<a class="carousel-control-next cr-controls pointer" onclick="slide_right_story();" data-slide="next" style="display: none;">
					<span class="carousel-control-next-icon">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</span>
				</a>
			{/if}
		</div>
		<div class="clear"></div>
	</div>
	{if $me.user_id == $us_data.user_id}
		{include file="apps/{$config.theme}/main/templates/modals/delete-story.tpl"}
	{/if}
</div>
{* Include javascript minified file *}
{include file="js/script.view.story.tpl" assign="script"}
{$script|minify_js}