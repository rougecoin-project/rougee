<?php
if (IS_LOGGED !== true || empty($_GET['id']) || $config['user_ads'] != 'on') {
	header("Location: $site_url/welcome");
	exit;
}

$user = new User();
$context['user_ad'] = $user->GetAdByID($_GET['id']);
$context['page_link'] = 'edit_ad/'.$_GET['id'];
$context['exjs'] = true;
$context['app_name'] = 'edit_ad';
$context['page_title'] = 'edit_ad';
$context['content'] = $pixelphoto->PX_LoadPage('edit_ad/templates/edit_ad/index');