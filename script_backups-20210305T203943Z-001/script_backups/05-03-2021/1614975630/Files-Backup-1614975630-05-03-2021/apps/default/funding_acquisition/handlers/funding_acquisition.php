<?php
if (IS_LOGGED !== true || $config['raise_money'] == 'off') {
	header("Location: $site_url/welcome");
	exit;
}
if ($config['raise_money_type'] == 1 && !$me['verified']) {
	header("Location: $site_url/welcome");
	exit;
}
$context['page_link'] = 'funding_acquisition';
$context['app_name'] = 'funding_acquisition';
$context['page_title'] = $context['lang']['funding_acquisition'];
$context['content'] = $pixelphoto->PX_LoadPage('funding_acquisition/templates/funding_acquisition/index');
