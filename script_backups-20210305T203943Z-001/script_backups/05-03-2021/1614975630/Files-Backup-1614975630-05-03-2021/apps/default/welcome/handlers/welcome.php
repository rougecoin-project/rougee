<?php
if (IS_LOGGED) {
	header("Location: $site_url");
	exit;
}


$config['header'] = false;
$config['footer'] = false;


$context['page_title'] = lang('login');
$context['app_name'] = 'welcome';
$context['xhr_url'] = "$site_url/aj/signin";
$context['xhr_reset_url'] = "$site_url/aj/reset";

$context['content'] = $pixelphoto->PX_LoadPage('welcome/templates/welcome/index');