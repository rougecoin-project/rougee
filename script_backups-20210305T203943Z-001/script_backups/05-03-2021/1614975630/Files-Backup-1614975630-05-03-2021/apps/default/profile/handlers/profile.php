<?php 
if (empty($_GET['uname'])) {
	header("Location: $site_url");
	exit;
}


$page  = (!empty($_GET['page'])) ? $_GET['page'] : 'posts';

try {
	$user->setUserByName($_GET['uname']);
	$user_data = $user->userData($user->getUser());
	$user_data = o2array($user_data);
} 

catch (Exception $e) {
	header("Location: $site_url");
	exit;
}


$context['posts']  = array();
$posts             = new Posts();
$is_owner          = false;
$is_following      = false;
$is_reported       = false;
$is_blocked        = false;
$user_id           = $user_data['user_id'];

$posts->setUserById($user_id);
$total_posts       = $posts->countPosts();
$user_followers    = $user->countFollowers();
$user_following    = $user->countFollowing();
$profile_privacy   = $user->profilePrivacy($user_id);
$chat_privacy      = $user->chatPrivacy($user_id);


if (IS_LOGGED && ($me['user_id'] == $user_id)) {
	$is_owner = true;
}

if (IS_LOGGED) {
	$is_following = $user->isFollowing($user_id);
	$is_reported  = $user->isUserRepoted($user_id);
	$is_blocked   = $user->isBlocked($user_id);
	$ami_blocked  = $user->isBlocked($user_id,true);

	if ($ami_blocked) {
		header("Location: $site_url");
		exit;
	}
}

$navbar = ($profile_privacy && empty($is_blocked));


$context['page_title'] = $user_data['name'];
$context['user_data'] = $user_data;
$context['posts'] = $context['posts'];
$context['is_owner'] = $is_owner;
$context['total_posts'] = $total_posts;
$context['is_following'] = $is_following;
$context['user_followers'] = $user_followers;
$context['user_following'] = $user_following;
$context['boosted_posts_count'] = $posts->countBoostedPosts();
$context['content_page'] = 'posts.html';
$context['page'] = $page;
$context['p_privacy'] = $profile_privacy;
$context['chat_privacy'] = $chat_privacy;
$context['is_reported'] = $is_reported;
$context['is_blocked'] = $is_blocked;
$context['navbar'] = $navbar;
$context['exjs'] = true;
$context['app_name'] = 'profile';
$context['xhr_url'] = "$site_url/aj/posts";
$context['page_link'] = $_GET['uname'];


if ($page == 'following' && $navbar) {
	$user->setUserById($user_id);
	$following_ls = $user->getFollowing(false,50);
	$context['content_page'] = "following.html";
	$context['following_ls'] =	o2array($following_ls);
	$context['page_link'] = $_GET['uname'].'/following';
}

elseif ($page == 'followers' && $navbar) {
	$user->setUserById($user_id);
	$followers_ls = $user->getFollowers(false,50);
	$context['content_page'] = "followers.html";	
	$context['followers_ls'] =	o2array($followers_ls);
	$context['page_link'] = $_GET['uname'].'/followers';
}

elseif ($page == 'favourites' && $is_owner) {
	$user->setUserById($me['user_id']);
	$context['content_page']   = "favourites.html";
	$context['favorite_posts'] = array();
	$favorite_posts = $posts->getSavedPosts();

	if (!empty($favorite_posts)) {
		$context['favorite_posts'] = o2array($favorite_posts);
	}
	$context['page_link'] = $_GET['uname'].'/favourites';
}

elseif ($page == 'boosted_posts' && $is_owner) {
	$user->setUserById($me['user_id']);
	$context['content_page']   = "boosted_posts.html";
	$context['boosted_posts'] = array();
	$boosted_posts = $posts->getBoostedPosts();

	if (!empty($boosted_posts)) {
		$context['boosted_posts'] = o2array($boosted_posts);
	}
	$context['page_link'] = $_GET['uname'].'/boosted_posts';
}

else{
	if ($navbar || empty(IS_LOGGED)) {
		$posts->setUserById($user_id);
		$posts->limit = 6;
		$user_posts   = $posts->getUserPosts();
		$context['posts'] = o2array($user_posts);
	}
	
	$context['page'] = 'posts';
}

if ($is_owner === true) {
	$favourites = $posts->countSavedPosts();
	$context['favourites'] = $favourites;
}
$profile = 'index';
if ($user_data['profile'] == 2 && $user_data['is_pro']) {
	$profile = 'index_2';
}

$context['fund'] = $user->GetFundingByUserId($user_data['user_id'],10);

$context['content'] = $pixelphoto->PX_LoadPage('profile/templates/profile/'.$profile);
