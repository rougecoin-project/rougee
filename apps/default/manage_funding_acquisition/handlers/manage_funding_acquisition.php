<?php
if (IS_LOGGED !== true || $config['raise_money'] == 'off') {
	header("Location: $site_url/welcome");
	exit;
}
if ($config['raise_money_type'] == 1 && !$me['verified']) {
	header("Location: $site_url/welcome");
	exit;
}
$context['funding_requests'] = $db->where('user_id', $me['user_id'])->get(T_FUNDING);
$context['page_link'] = 'manage_funding_acquisition';
$context['app_name'] = 'manage_funding_acquisition';
$context['page_title'] = $context['lang']['manage_funding'];
$context['content'] = $pixelphoto->PX_LoadPage('manage_funding_acquisition/templates/funding_acquisition/index');
