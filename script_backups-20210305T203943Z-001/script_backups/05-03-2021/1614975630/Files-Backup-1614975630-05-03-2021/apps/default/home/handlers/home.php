<?php 
if (IS_LOGGED !== true) {
	header("Location: $site_url/welcome");
	exit;
}


$context['posts']  = array();
$posts             = new Posts();
$story             = new Story();
$posts->limit      = 3;
$posts->comm_limit = 4;
$tlposts           = $posts->setUserById($me['user_id'])->getTimelinePosts();
$boost_post_query = $db->where('boosted',1)->orderBy('RAND()')->getOne(T_POSTS);
$boost_post = array();
if (!empty($boost_post_query)) {
	$posts->setPostId($boost_post_query->post_id);
	$boost_post = $posts->postData('');
}

			

$follow   = $user->followSuggestions();
$stories  = $story->setUserById($me['user_id'])->getStories();
$stories  = o2array($stories);
$trending = $posts->getFeaturedPosts();
$post_sys = array(
	($config['upload_images'] == 'on'),
	($config['upload_videos'] == 'on'),
	($config['import_videos'] == 'on'),
	($config['import_images'] == 'on'),
	($config['story_system'] == 'on'),
);


if (!empty($tlposts)) {
	$context['posts'] = o2array($tlposts);
}
if (!empty($boost_post) && !empty($context['posts'])) {
	array_unshift($context['posts'],o2array($boost_post));
}
elseif (empty($context['posts']) && !empty($boost_post)) {
	$context['posts'][] = o2array($boost_post);
}
$context['is_boosted'] = false;
$activities = $posts->getUsersActivities(0,5);
$activities = o2array($activities);

$user = new User();
$context['pro_members'] = $user->GetProUsers();
$context['funding'] = $user->GetFunding(4);
$context['sidebar_ad'] = $user->GetRandomAd('sidebar');
$context['page_link'] = '';
$trending = (!empty($trending)) ? o2array($trending) : array();
$context['posts'] = $context['posts'];
$context['follow'] = o2array($follow);
$context['stories'] = $stories;
$context['trending'] = $trending;
$context['activities'] = $activities;
$context['post_sys'] = (in_array(true, $post_sys));
$context['exjs'] = true;
$config['footer'] = false;
$context['app_name'] = 'home';
$context['page_title'] = $context['lang']['home_page'];
$context['content'] = $pixelphoto->PX_LoadPage('home/templates/home/index');
