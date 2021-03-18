<?php
if (IS_LOGGED !== true) {
	header("Location: $site_url/welcome");
	exit;
}
// $context['posts']  = array();
// $posts             = new Posts();
// $posts->orderBy('post_id','DESC');
// $posts->limit      = 40;
// $query_posts       = $posts->explorePosts();
// $follow            = array();

// if (IS_LOGGED) {
// 	$follow = $user->followSuggestions();
// }


// if (!empty($query_posts)) {
// 	$context['posts'] = o2array($query_posts);
// }

// $follow = (!empty($follow) && is_array($follow)) ? o2array($follow) : array();

$context['page_link'] = 'upgraded';
$context['exjs'] = true;
$context['app_name'] = 'upgraded';
$context['page_title'] = $context['lang']['upgraded'];
$context['content'] = $pixelphoto->PX_LoadPage('upgraded/templates/upgraded/index');
