<?php 
if (empty($_GET['tag'])) {
	header("Location: $site_url");
	exit;
}


$posts  = new Posts();
$tag    = Generic::secure($_GET['tag']);

$posts->limit    = 50;

$tag_id = $posts->getHtagId($tag);



$tag_id = ((is_numeric($tag_id)) ? $tag_id : 0);
$qrset  = array();

if (!empty($tag_id)) {
	$qrset = $posts->exploreTags($tag_id);
}

$qrset  = (!empty($qrset) && is_array($qrset) || 2) ? o2array($qrset) : array();
$tcount = (!empty($qrset)) ? $posts->countPostsByTag($tag_id) : 0;
$follow = $user->followSuggestions();
$follow = (!empty($follow) && is_array($follow)) ? o2array($follow) : array();

$context['page_link'] = 'explore/tags';
$context['exjs'] = true;
$context['app_name'] = 'explore';
$context['page'] = 'tags';
$context['page_title'] = $context['lang']['explore_tags'];
$context['tag'] = $tag;
$context['posts'] = $qrset;
$context['follow'] = $follow;
$context['total_count'] = $tcount;
$context['content'] = $pixelphoto->PX_LoadPage('explore/templates/explore/tags');


$_SESSION['tag_id'] = $tag_id;