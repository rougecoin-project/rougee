<?php
if (IS_LOGGED !== true || $config['blog_system'] == 'off') {
    header("Location: $site_url/welcome");
    exit;
}
$context['page_link'] = 'blog';
$context['exjs'] = true;
$context['app_name'] = 'blog';
$context['page_title'] = $context['lang']['blog'];

if(isset($_GET['new']) && $_GET['new'] == 'true'){
    if ($config['allow_user_create_blog'] == 'off') {
        header("Location: $site_url/welcome");
        exit;
    }
    $context['category_name'] = $context['lang']['create_blog_bost'];
    $context['category_desc'] = '';
    $context['page_link'] = 'blog/new';
    $context['content'] = $pixelphoto->PX_LoadPage('blog/templates/blog/new');

}else if( (isset($_GET['new']) && $_GET['new'] == 'false') && (isset($_GET['id']) && is_numeric($_GET['id'])) ){
    if ($config['allow_user_create_blog'] == 'off') {
        header("Location: $site_url/welcome");
        exit;
    }
    $article_id = Generic::secure($_GET['id']);
    $context['category_name'] = $context['lang']['update_blog_post'];
    $context['category_desc'] = '';
    $context['page_link'] = 'blog/update/'.$article_id;

    $context['article']  = array();
    $posts = $db->arrayBuilder()->where('id', $article_id)->get(T_BLOG,1);
    foreach ($posts as $key => $post_data) {
        $post_data['category_name'] = $context['lang'][$post_data['category']];
        $post_data['full_thumbnail'] = media($post_data['thumbnail']);
        $post_data['text_time'] = time2str($post_data['created_at']);
        $context['article']    = $post_data;
    }

    $context['content'] = $pixelphoto->PX_LoadPage('blog/templates/blog/update');
}else{

    $catid = null;
    $category_name = $context['lang']['blog'];
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
        $context['page_link'] = 'blog/category/'.$catid;
        $db->where('category', $catid);
    }

    $context['blogs']  = array();
    $posts = $db->arrayBuilder()->where('posted', 1)->orderBy('id','DESC')->get(T_BLOG,20);
    foreach ($posts as $key => $post_data) {
        $post_data['category_name'] = $context['lang'][$post_data['category']];
        $post_data['full_thumbnail'] = media($post_data['thumbnail']);
        $post_data['text_time'] = time2str($post_data['created_at']);
        $context['blogs'][]    = $post_data;
    }
    $context['content'] = $pixelphoto->PX_LoadPage('blog/templates/blog/index');
}