<?php
if (IS_LOGGED !== true || $config['raise_money'] == 'off' || $me['verified'] < 1 || empty($_GET['id'])) {
	header("Location: $site_url/welcome");
	exit;
}
if (is_numeric($_GET['id']) && $_GET['id'] > 0) {
	$context['fund'] = $user->GetFundingById($_GET['id']);
}
else{
	$context['fund'] = $user->GetFundingById($_GET['id'],'hash');
}
if (empty($context['fund']) || ($context['user']['user_id'] != $context['fund']->user_id && IS_ADMIN == false)) {
	header("Location: $site_url/welcome");
	exit();
}
$context['page_link'] = 'edit_funding';
$context['app_name'] = 'edit_funding';
$context['page_title'] = $context['lang']['edit_funding'];
$context['content'] = $pixelphoto->PX_LoadPage('edit_funding/templates/edit_funding/index');
