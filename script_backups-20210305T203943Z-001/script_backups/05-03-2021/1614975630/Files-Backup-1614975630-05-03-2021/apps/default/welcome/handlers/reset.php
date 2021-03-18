<?php
if (IS_LOGGED) {
	header("Location: $site_url");
	exit;
}

if (empty($_GET['code'])) {
	header("Location: $site_url/404");
	exit;
}

$user_id = User::validateCode($_GET['code']);

if (!$user_id) {
	header("Location: $site_url/404");
	exit;
}




$config['header'] = false;
$config['footer'] = false;


$context['page_title'] = lang('reset');
$context['app_name'] = 'welcome';
$context['xhr_url'] = "$site_url/aj/signin";
$context['xhr_reset_url'] = "$site_url/aj/reset";
$context['code'] = Generic::secure($_GET['code']);
$context['content'] = $pixelphoto->PX_LoadPage('welcome/templates/welcome/reset');
