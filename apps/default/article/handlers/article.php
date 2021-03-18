<?php
if (IS_LOGGED !== true || $config['blog_system'] == 'off') {
    header("Location: $site_url/welcome");
    exit;
}

$context['page_link'] = 'article';
$catid = null;
$category_name = $context['lang']['article'];
$category_desc = $context['lang']['explore_blog_desc'];

$context['category_name'] = $category_name;
$context['category_desc'] = $category_desc;

if( isset($_GET['id']) ){
    if (empty($_GET['id']) || !is_numeric($_GET['id'])) {
        header("Location: $site_url/404");
        exit;
    }

    $catid = Generic::secure($_GET['id']);

    $context['category_name'] = $context['lang'][$catid];
    $context['category_desc'] = '';
    $context['page_link'] = 'blog/article/'.$catid;

    if( !isset( $_SESSION['article_'.$catid.'_'.$context['user']["user_id"]] ) ) {
        $_SESSION['article_' . $catid . '_' . $context['user']["user_id"]] = $context['user']["user_id"];
        $db->where('id', $catid)->update(T_BLOG, array('view' => $db->inc()));
    }

    $db->where('id', $catid)->where('posted', 1);
}

$Blog   = new Blogs();

$context['article']  = array();
$posts = $db->arrayBuilder()->orderBy('id','DESC')->get(T_BLOG,1);
if(empty($posts)){
    header("Location: $site_url/blog");
    exit;
}

foreach ($posts as $key => $post_data) {
    $Blog->setBlogId($post_data['id']);

    $post_data['post_id'] = $post_data['id'];
    $context['page_title'] = $post_data['title'];
    $post_data['category_name'] = $context['lang'][$post_data['category']];
    $post_data['full_thumbnail'] = media($post_data['thumbnail']);
    $post_data['text_time'] = time2str($post_data['created_at']);
    $post_data['likes'] = $db->where('post_id',$post_data['id'])->getValue(T_BLOG_LIKES,"COUNT(`id`)");
    $post_data['votes'] = $db->where('post_id',$post_data['id'])->getValue(T_BLOG_COMMENTS,"COUNT(`id`)");
    $post_data['is_liked'] = ( $db->where('post_id',$post_data['id'])->where('user_id',$context['user']["user_id"])->getValue(T_BLOG_LIKES,"COUNT(*)") > 0 ) ? true : false;
    $post_data['comments'] = $Blog->getBlogComments();
    $context['article'][]    = $post_data;
}

$context['exjs'] = true;
$context['app_name'] = 'article';

$context['content'] = $pixelphoto->PX_LoadPage('article/templates/article/index');
