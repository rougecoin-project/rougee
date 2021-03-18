<?php 
if (IS_LOGGED !== true) {
	header("Location: $site_url/welcome");
	exit;
}

$context['page_title'] = "Get Started";
$context['page'] = 'startup';
$context['app_name'] = 'startup';
$page = 'image';
if ($context['user']['startup_avatar'] == 0) {
	$page = 'image';
}
elseif ($context['user']['startup_info'] == 0) {
	$page = 'info';
}
elseif ($context['user']['startup_follow'] == 0) {
	$page = 'follow';
	$follow   = $user->followSuggestions();
	$ids = array();
	foreach ($follow as $key => $value) {
		$ids[]= $value->user_id;
	}
	$context['follow'] = o2array($follow);
	$context['ids'] = implode(',', $ids);
}
else{
	header("Location: $site_url/welcome");
	exit;
}
$context['content'] = $pixelphoto->PX_LoadPage('startup/templates/startup/'.$page);