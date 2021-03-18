<?php 
if (IS_LOGGED !== true) {
	header("Location: $site_url/welcome");
	exit;
}
$user->limit = 100;
$follow = $user->explorePeople();
$users  = (!empty($follow) && is_array($follow)) ? o2array($follow) : array();

$context['page_link'] = 'explore/people';
$context['exjs'] = true;
$context['app_name'] = 'explore';
$context['page'] = 'explore-people';
$context['page_title'] = $context['lang']['explore_people'];
$context['users'] = $users;
$context['content'] = $pixelphoto->PX_LoadPage('explore/templates/explore/people');
