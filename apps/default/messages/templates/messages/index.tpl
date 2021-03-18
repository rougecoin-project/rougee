{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
<svg class="pp_svg_squiggle" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 114 24" aria-label="Squiggle"><defs><linearGradient id="67787231-268e-4988-be2a-d6340fac9eab" x1="0%" y1="0%" x2="100%" y2="0%"><stop offset="0%" stop-color="#6d47d9"></stop><stop offset="100%" stop-color="#f93d66"></stop></linearGradient></defs><path opacity="0.2" d="M114 22c0 1.1-.9 2-2 2-3.2 0-5.8-1.3-8-3.8-1.6-1.7-2.6-3.4-4.7-7.3-3.8-6.8-5.7-9-9.2-9-3.5 0-5.5 2.1-9.2 9-2.1 3.9-3.2 5.5-4.8 7.3-2.2 2.5-4.8 3.8-8 3.8s-5.8-1.3-8-3.8c-1.6-1.7-2.6-3.4-4.8-7.3-3.8-6.8-5.7-9-9.2-9-3.5 0-5.5 2.1-9.2 9-2.1 3.9-3.2 5.5-4.8 7.3-2.2 2.5-4.8 3.8-8 3.8s-5.8-1.3-8-3.8c-1.6-1.7-2.6-3.4-4.7-7.3C7.5 6.1 5.5 4 2 4 .9 4 0 3.1 0 2s.9-2 2-2c3.2 0 5.8 1.3 8 3.8 1.6 1.7 2.6 3.4 4.7 7.3 3.8 6.9 5.7 9 9.2 9 3.5 0 5.5-2.1 9.2-9 2.2-3.9 3.2-5.5 4.8-7.3C40.2 1.3 42.8 0 46 0s5.8 1.3 8 3.8c1.6 1.7 2.6 3.4 4.8 7.3 3.8 6.9 5.7 9 9.2 9 3.5 0 5.5-2.1 9.2-9 2.2-3.9 3.2-5.5 4.8-7.3C84.2 1.3 86.8 0 90 0s5.8 1.3 8 3.8c1.6 1.7 2.6 3.4 4.8 7.3 3.8 6.9 5.7 9 9.2 9 1.1-.1 2 .8 2 1.9z" fill="url(#67787231-268e-4988-be2a-d6340fac9eab)"></path></svg><svg class="pp_svg_lines" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 134.9 70.1" aria-label="Lines"><defs><linearGradient id="eed89beb-684d-466b-9a87-91d2ebaf480f" x1="0%" y1="0%" x2="0%" y2="100%"><stop offset="0%" stop-color="#00dcaf"></stop><stop offset="100%" stop-color="#6d47d9"></stop></linearGradient></defs><path opacity="0.2" d="M2 70.1c-.5 0-1-.2-1.4-.6-.8-.8-.8-2 0-2.8L66.7.6c.8-.8 2-.8 2.8 0s.8 2 0 2.8L3.4 69.5c-.4.4-.9.6-1.4.6zM33.1 70.1c-.5 0-1-.2-1.4-.6-.8-.8-.8-2 0-2.8L97.7.6c.8-.8 2-.8 2.8 0s.8 2 0 2.8l-66 66.1c-.4.4-.9.6-1.4.6zM66.8 70.1c-.5 0-1-.2-1.4-.6-.8-.8-.8-2 0-2.8L131.5.6c.8-.8 2-.8 2.8 0s.8 2 0 2.8L68.2 69.5c-.4.4-.9.6-1.4.6z" fill="url(#eed89beb-684d-466b-9a87-91d2ebaf480f)"></path></svg><svg class="pp_svg_spiral" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 51" aria-label="Spiral"><defs><linearGradient id="8332a4c0-73dd-4f9c-a3d5-67b448fbfa7d" x1="0%" y1="0%" x2="100%" y2="0%"><stop offset="0%" stop-color="#f7bc28"></stop><stop offset="100%" stop-color="#f93d66"></stop></linearGradient></defs><path opacity="0.2" d="M46.2 34.2C42.5 44.3 33 50.6 23.1 50.6c-2.7 0-5.4-.5-8-1.4-5.6-2.1-10.3-6.4-12.8-11.9C-.1 31.9-.3 26 1.7 20.7c2-5.1 6-9.4 11-11.6 4.8-2.1 10-2.3 14.8-.5 4.6 1.8 8.4 5.5 10.3 10 1.9 4.3 1.9 9 .2 13.2-1.6 4.1-4.9 7.4-8.9 9.1-3.8 1.6-7.9 1.6-11.6 0-3.5-1.5-6.3-4.4-7.7-8-1.3-3.3-1.3-6.9.1-10 1.3-3 3.8-5.3 6.9-6.4 2.8-1 5.8-.9 8.4.3 2.5 1.2 4.4 3.4 5.2 6 .7 2.3.5 4.7-.6 6.7-.9 1.8-2.7 3.2-4.8 3.8-1.9.5-3.8.2-5.4-.8-1.5-1-2.4-2.7-2.5-4.4-.1-1.3.4-2.6 1.4-3.4 1-1 3-1.2 4.2-.4 1.1.7 1.5 1.9 1.1 3.1-.3 1-1.4 1.6-2.4 1.3.1.2.3.4.5.5.7.5 1.6.4 2.1.3 1-.2 1.8-.9 2.2-1.8.8-1.4.6-2.8.3-3.7-.5-1.5-1.6-2.9-3.1-3.6-1.6-.8-3.5-.8-5.3-.2-2 .7-3.7 2.3-4.6 4.3-.9 2.1-1 4.6-.1 6.9 1 2.6 3 4.7 5.5 5.7 2.7 1.1 5.7 1.1 8.5 0 3-1.3 5.5-3.8 6.7-6.9 1.3-3.2 1.2-6.8-.2-10.1-1.5-3.6-4.5-6.4-8.1-7.9-3.8-1.5-7.9-1.3-11.7.4-3.9 2-7.1 5.4-8.7 9.5-1.6 4.3-1.4 9.1.6 13.5 2.1 4.5 5.9 8.1 10.4 9.8 10.2 3.7 22.1-2.1 26-12.6 4-11.3-2.3-24.3-13.9-28.5-1-.4-1.6-1.5-1.2-2.6.4-1 1.5-1.6 2.6-1.2 13.6 5 21.1 20.4 16.3 33.7z" fill="url(#8332a4c0-73dd-4f9c-a3d5-67b448fbfa7d)"></path></svg><svg class="pp_svg_triangle" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 50" aria-label="Triangle"><defs><linearGradient id="11c0361a-b3e4-4cf4-ae1b-efbdfc814224" x1="0%" y1="0%" x2="100%" y2="0%"><stop offset="0%" stop-color="#6d47d9"></stop><stop offset="100%" stop-color="#00dcaf"></stop></linearGradient></defs><path opacity="0.2" d="M50.3,17.6l-15.5-2.3l-7-14.2c-0.7-1.5-2.9-1.5-3.6,0l-7,14.2L1.7,17.6c-1.6,0.2-2.3,2.2-1.1,3.4l11.3,11L9.2,47.7	c-0.3,1.6,1.4,2.9,2.9,2.1L26,42.4l13.9,7.4c1.5,0.8,3.2-0.5,2.9-2.1L40.2,32l11.2-11C52.6,19.8,51.9,17.8,50.3,17.6z M36.6,29.9	c-0.5,0.5-0.7,1.1-0.6,1.8l2.1,12.6l-11.2-6c-0.6-0.3-1.3-0.3-1.9,0l-11.2,6L16,31.7c0.1-0.6-0.1-1.3-0.6-1.8l-9.1-9l12.6-1.8	c0.7-0.1,1.2-0.5,1.5-1.1L26,6.5L31.6,18c0.3,0.6,0.9,1,1.5,1.1L45.7,21L36.6,29.9z" fill="url(#11c0361a-b3e4-4cf4-ae1b-efbdfc814224)"></path></svg>

	<div class="messages-container open">
		<div class="header-composition">
			<div class="row">
				<div class="col-sm-5 col-md-4">
					<div class="privacy-settings">
						<span>{lang('messages')}</span>
						<a href="{$site_url}/settings/privacy/{$me.username}">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
						</a>
					</div>
				</div>
				<div class="col-sm-7 col-md-8">
					{if $user_data}		
						<div class="interlocutor-info">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left mobile_msg_close"><polyline points="15 18 9 12 15 6"></polyline></svg>
							<div class="left">
								<div class="avatar">
									<img src="{$user_data.avatar|media}" class="img-circle">
								</div>
								<div class="uname">
									<a class="animated fadeInUpBig" href="{$user_data.username|un2url}">{$user_data.username}</a>
									<span class="fluid animated fadeInUpBig">
										<time>{lang('last_seen')}: <span class="time-ago" title="{$user_data.last_seen|ToDate}">{$user_data.last_seen|time2str}</span></time>
									</span>
								</div>
							</div>
							<div class="right">
								<div class="dropdown">
									<span class="dropdown-toggle" type="button" data-toggle="dropdown">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
									</span>
								  <ul class="dropdown-menu dropdown-menu-left zoom">
								    <li id="clear_messages">
								    	<a href="javascript:void(0);">{lang('clear_messages')}</a>
								    </li>
								    <li id="delete__chat">
								    	<a href="javascript:void(0);">{lang('delete_chat')}</a>
								    </li>
								  </ul>
								</div>
							</div>
						</div>
					{/if}
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="row content">
			<div class="col-sm-5 col-md-4">
				<div class="pp_srch_msg">
					<form class="form search-users">
						<div class="text-input">
							<input type="text" class="form-control" placeholder="{lang('search')}.." id="search-chats">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
						</div>			
					</form>
				</div>
				<div class="chat-list">
					<ul>
						{foreach $chats_history as $chat_data}
							<li {if $user_data and $user_data.user_id == $chat_data.user_id}class="active"{/if}>
								<a href="{$site_url}/messages/{$chat_data.username}">
								<div class="chat-list-item" data-chat="{$chat_data.user_id}">
									<div class="avatar">
										<img src="{$chat_data.avatar|media}" class="img-circle">
									</div>
									<div class="chat-desc">
										<div class="uname">
											<span class="username">{$chat_data.username}</span>
											<time><span class="time-ago" title="{$chat_data.time|ToDate}">{$chat_data.time|time2str}</span></time>
										</div>
										<div class="message">
											<span>{$chat_data.last_message|croptxt:40:'..'}</span>
											{if $chat_data.new_message}
												<small>{$chat_data.new_message}</small>
											{/if}	
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								</a>
							</li>
						{/foreach}
					</ul>
				</div>
			</div>
			<div class="col-sm-7 col-md-8">
				<div class="conversation">		
					{if $user_data}
						<div class="messages clearfix" id="conversation-list">
							{foreach $conversation as $msg_data}
								{include file="includes/messages-list.tpl"}
							{/foreach}
						</div>
						<div class="clear"></div>
						{if $c_privacy}
						<div class="send-message">
							<form id="send-message-form">
								<div class="overlay hidden">
									<div id="pp_loader"><div class="speeding_wheel"></div></div>
								</div>
								<div class="text-input">
									<textarea name="text" class="form-control"  placeholder="{lang('type_message')}" id="mgs-text-input"></textarea>
									<div class="controls">
										<button type="submit">
											<svg xmlns="http://www.w3.org/2000/svg" class="feather feather-send" width="24" height="24" viewBox="0 0 24 24"><path d="M2,21L23,12L2,3V10L17,12L2,14V21Z" /></svg>
										</button>
									</div>
								</div>
								<input type="hidden" name="hash" value="{$csrf_token}">
							</form>
							<div class="delete-selected clearfix hidden">
								<button class="delselected-messages">{lang('delete_selected')}<b></b></button>
								<button class="pull-right deselect-messages">{lang('cancel')}</button>
							</div>
						</div>
						{else}
							<div class="send-message">
								<div class="blocked">
									<svg xmlns="http://www.w3.org/2000/svg" class="feather feather-lock" width="24" height="24" viewBox="0 0 24 24"><path d="M12,17A2,2 0 0,0 14,15C14,13.89 13.1,13 12,13A2,2 0 0,0 10,15A2,2 0 0,0 12,17M18,8A2,2 0 0,1 20,10V20A2,2 0 0,1 18,22H6A2,2 0 0,1 4,20V10C4,8.89 4.9,8 6,8H7V6A5,5 0 0,1 12,1A5,5 0 0,1 17,6V8H18M12,3A3,3 0 0,0 9,6V8H15V6A3,3 0 0,0 12,3Z" /></svg>
								</div>
							</div>
						{/if}
					{else}
						<div class="select-chat">
							<h5 class="empty_state">
								<svg xmlns="http://www.w3.org/2000/svg" class="confetti" viewBox="0 0 1081 601"><path class="st0" d="M711.8 91.5c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C695.2 84 702.7 91.5 711.8 91.5zM711.8 64.1c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S705.9 64.1 711.8 64.1z"/><path class="st0" d="M74.5 108.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C57.9 100.9 65.3 108.3 74.5 108.3zM74.5 81c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7S68.6 81 74.5 81z"/><path class="st1" d="M303 146.1c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C286.4 138.6 293.8 146.1 303 146.1zM303 118.7c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7C292.3 123.5 297.1 118.7 303 118.7z"/><path class="st2" d="M243.4 347.4c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7S234.2 347.4 243.4 347.4zM243.4 320c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7S237.5 320 243.4 320z"/><path class="st1" d="M809.8 542.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C793.2 534.8 800.7 542.3 809.8 542.3zM809.8 514.9c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S803.9 514.9 809.8 514.9z"/><path class="st3" d="M1060.5 548.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C1043.9 540.8 1051.4 548.3 1060.5 548.3zM1060.5 520.9c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S1054.6 520.9 1060.5 520.9z"/><path class="st3" d="M387.9 25.2l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L387.9 25.2z"/><path class="st3" d="M368.3 498.6l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L368.3 498.6z"/><path class="st3" d="M16.4 270.2l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L16.4 270.2z"/><path class="st2" d="M824.7 351.1l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L824.7 351.1z"/><path class="st1" d="M146.3 573.6H138v-8.3c0-1.3-1-2.3-2.3-2.3s-2.3 1-2.3 2.3v8.3h-8.3c-1.3 0-2.3 1-2.3 2.3s1 2.3 2.3 2.3h8.3v8.3c0 1.3 1 2.3 2.3 2.3s2.3-1 2.3-2.3v-8.3h8.3c1.3 0 2.3-1 2.3-2.3S147.6 573.6 146.3 573.6z"/><path class="st1" d="M1005.6 76.3h-8.3V68c0-1.3-1-2.3-2.3-2.3s-2.3 1-2.3 2.3v8.3h-8.3c-1.3 0-2.3 1-2.3 2.3s1 2.3 2.3 2.3h8.3v8.3c0 1.3 1 2.3 2.3 2.3s2.3-1 2.3-2.3v-8.3h8.3c1.3 0 2.3-1 2.3-2.3S1006.8 76.3 1005.6 76.3z"/><path class="st1" d="M95.5 251.6c-3.5 0-6.3 2.8-6.3 6.3 0 3.5 2.8 6.3 6.3 6.3s6.3-2.8 6.3-6.3S99 251.6 95.5 251.6z"/><path class="st0" d="M1032 281.8c-3.5 0-6.3 2.8-6.3 6.3s2.8 6.3 6.3 6.3 6.3-2.8 6.3-6.3S1035.5 281.8 1032 281.8z"/><path class="st2" d="M741.6 139.3c-3.5 0-6.3 2.8-6.3 6.3s2.8 6.3 6.3 6.3 6.3-2.8 6.3-6.3S745 139.3 741.6 139.3z"/><path class="st3" d="M890.7 43.5c3.3 0 6-2.7 6-6s-2.7-6-6-6 -6 2.7-6 6C884.8 40.8 887.4 43.5 890.7 43.5z"/><path class="st0" d="M164.3 537.6c3.3 0 6-2.7 6-6s-2.7-6-6-6 -6 2.7-6 6C158.4 535 161 537.6 164.3 537.6z"/></svg>
								<svg xmlns="http://www.w3.org/2000/svg" fill="#607D8B" width="24" height="24" viewBox="0 0 24 24" class="feather feather-chat"><path d="M17,12V3A1,1 0 0,0 16,2H3A1,1 0 0,0 2,3V17L6,13H16A1,1 0 0,0 17,12M21,6H19V15H6V17A1,1 0 0,0 7,18H18L22,22V7A1,1 0 0,0 21,6Z" /></svg> {lang('select_chat')}
								<button class="btn btn-info btn_select_chat" onclick="select_chat()">{lang('select')}</button>
							</h5>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
	<script>
	function select_chat(){
		$('.messages-container').removeClass('open');
	}
	</script>
	
	{include file="apps/{$config.theme}/main/templates/modals/clear-chat.tpl"}
	{include file="apps/{$config.theme}/main/templates/modals/delete-chat.tpl"}
	{include file="apps/{$config.theme}/main/templates/modals/delete-messages.tpl"}

	{if $user_data}
		{include file="js/script.tpl" assign='script'}
		{$script|minify_js}
	{/if}
{/block}