<?php
if (IS_LOGGED !== true || $config['raise_money'] == 'off' || empty($_GET['user'])) {
	header("Location: $site_url/welcome");
	exit;
}
$user = new User();
$user->setUserByName($_GET['user']);
$user_data = $user->userData($user->getUser());

if (empty($user_data)) {
	header("Location: $site_url/welcome");
	exit();
}
$context['fund'] = $user->GetFundingByUserId($user_data->user_id,10);
$context['user_data'] = $user_data;

$context['page_link'] = 'user_funding/'.$_GET['user'];
$context['app_name'] = 'user_funding';
$context['page_title'] = $context['lang']['user_funding'];
$context['content'] = $pixelphoto->PX_LoadPage('user_funding/templates/user_funding/index');
