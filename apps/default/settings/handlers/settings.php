<?php

if (IS_LOGGED != true) {
	header("Location: $site_url/welcome");
	exit;
}


if (!empty($_GET['user']) && User::userNameExists($_GET['user'])) {
	if ($user->isAdmin()) {
		$user->setUserByName($_GET['user']);
		$me = $user->userData($user->getUser());
		$me = o2array($me);
	}
}

$page   = 'general';
$pages  = array(
	'delete',
	'password',
	'general',
	'profile',
	'privacy',
	'notifications',
	'verification',
	'blocked',
	'manage_sessions',
	'my_affiliates',
	'withdraw',
	'requests',
	'business_account'
);

if (!empty($_GET['page']) && in_array($_GET['page'], $pages)) {
	$page = $_GET['page'];
}

if ($page == 'delete' && $config['delete_account'] != 'on') {
	$page = 'general';
}

$context['page_title'] = lang('profile_settings');
$context['page'] = $page;
$context['me'] = $me;
$context['settings'] = $me;

if ($page == 'blocked') {
	$blocked = $user->getBlockedUsers();
	$blocked = (is_array($blocked) == true) ? $blocked : array();
	$context['blocked_users'] = o2array($blocked);
}
if ($page == 'verification') {
	$context['is_verified'] = $user->isVerificationRequested();
	if ($me['verified']) {
		header("Location: $site_url/welcome");
	    exit();
	}
}

if ($page == 'withdraw' && $config['withdraw_system'] != 'on') {
	header("Location: $site_url/welcome");
	exit();
}
if ($page == 'withdraw'){
	$context['user_withdrawals']  = $db->where('user_id',$context['me']['user_id'])->get(T_WITHDRAWAL); 
}

if ($page == 'manage_sessions') {
	$context['sessions'] = o2array($user->getUserSessions());
	
}

if ($page == 'requests') {
	$context['requests'] =  o2array($user->getUserRequests());
}

if ($page == 'my_affiliates') {
	$context['my_affiliates'] =  o2array($user->getUserAffiliates());
	// print_r($context['my_affiliates']);
	// exit();
}

if ($page == 'business_account') {
	$context['bus_requested'] =  $db->where('user_id',$context['me']['user_id'])->getValue(T_BUS_REQUESTS,'COUNT(*)');
	$context['page_title'] = lang('business_account');
	if ($me['business_account']) {
		header("Location: $site_url/welcome");
	    exit();
	}
}


$context['page_link'] = 'settings/'.$page.'/'.$_GET['user'];
$context['app_name'] = 'settings';
$context['xhr_url'] = "$site_url/aj/settings";
$context['content'] = $pixelphoto->PX_LoadPage('settings/templates/settings/index');