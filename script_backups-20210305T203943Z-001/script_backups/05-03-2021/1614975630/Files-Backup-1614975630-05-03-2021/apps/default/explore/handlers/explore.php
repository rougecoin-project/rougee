<?php
if (IS_LOGGED !== true) {
	header("Location: $site_url/welcome");
	exit;
}
$context['posts']  = array();
$posts             = new Posts();
$posts->orderBy('post_id','DESC');
$posts->limit      = 40;
$query_posts       = $posts->explorePosts();
$follow            = array();


if (IS_LOGGED) {
	$follow = $user->followSuggestions();
}

$boost_post = $posts->exploreBoostedPosts()[0];
if (!empty($query_posts)) {
	$context['posts'] = o2array($query_posts);
}
if (!empty($boost_post) && !empty($context['posts'])) {
	array_unshift($context['posts'],o2array($boost_post));
}
elseif (empty($context['posts']) && !empty($boost_post)) {
	$context['posts'][] = o2array($boost_post);
}
$context['is_boosted'] = false;

$follow = (!empty($follow) && is_array($follow)) ? o2array($follow) : array();

$context['page_link'] = 'explore';
$context['exjs'] = true;
$context['app_name'] = 'explore';
$context['page_title'] = $context['lang']['explore_posts'];
$context['follow'] = $follow;
$context['content'] = $pixelphoto->PX_LoadPage('explore/templates/explore/index');
