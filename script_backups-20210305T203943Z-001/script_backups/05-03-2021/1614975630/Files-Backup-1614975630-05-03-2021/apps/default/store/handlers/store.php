<?php
if (IS_LOGGED !== true || $config['image_sell_system'] == 'off' ) {
    header("Location: $site_url/welcome");
    exit;
}

$page                   = (!empty($_GET['page'])) ? $_GET['page'] : 'all';
$is_owner               = false;
$context['exjs']        = true;
$context['page']        = $page;
$uid                    = $me['user_id'];
$me                     = o2array($user->user_data);

$postid = null;
if(!empty($_GET['pid'])){
    $postid = Generic::secure($_GET['pid']);
    $page = 'show_image';
}

if (!empty($_GET['user'])) {
    try {
        $user->setUserByName($_GET['user']);
        $uid                    = $user->getUser();
        $user_data = $user->userData($uid);
        $user_data = o2array($user_data);
        if (IS_LOGGED && ($me['user_id'] == $user_data['user_id'])) {
            $is_owner = true;
        }

        $context['page_title']  = $user_data['name'];
        $context['user_data']   = $user_data;

    } catch (Exception $e) {
        header("Location: $site_url");
        exit;
    }
}


$context['me'] = $me;
$context['app_name']    = 'store';
$context['xhr_url']     = "$site_url/aj/store";
$context['owner']       = $is_owner;

$template = 'store/templates/store/index';
if ($page == 'all' ) {

    $context['images']  = array();
    $store_images = $db->arrayBuilder()->orderBy('id','DESC')->get(T_STORE,6);
    foreach ($store_images as $key => $image_data) {
        $image_data['category_name'] = $context['lang'][$image_data['category']];
        $image_data['text_time'] = time2str($image_data['created_at']);
        $context['images'][]    = $image_data;
    }

    $template = 'store/templates/store/all';
    $context['page_link'] = 'store';
    $context['page_title'] = 'store';
}else if ($page == 'items' ) {
    $context['images']  = array();
    $store_images = $db->arrayBuilder()->where('user_id',$uid->user_id)->orderBy('id','DESC')->get(T_STORE,20);
    foreach ($store_images as $key => $image_data) {
        $image_data['category_name'] = $context['lang'][$image_data['category']];
        $image_data['text_time'] = time2str($image_data['created_at']);
        $context['images'][]    = $image_data;
    }

    $context['page_link'] = 'store/' . $_GET['user'] . '/items';
    $context['page_title'] = $_GET['user'] . ' items';

}else if ($page == 'downloads' && $is_owner ) {

    $context['transactions']  = array();
    $store_ids = array();
//    $ids = $db->where('user_id',$context['user']['user_id'])->get(T_STORE,null,array('id'));
//    foreach ($ids as $key => $val){
//        $store_ids[] = $val->id;
//    }
//    var_dump($store_ids);
    $transactions = $db->arrayBuilder()->where('type', 'store')->where('user_id', $context['user']['user_id'])->get(T_TRANSACTIONS,10);
    $context['total_sell'] = 0;
    foreach ($transactions as $key => $transaction_data) {
        $transaction_data['user_data'] = $db->arrayBuilder()->where('user_id', $transaction_data['user_id'])->getOne(T_USERS);
        $transaction_data['item_data'] = $db->arrayBuilder()->where('id', $transaction_data['item_store_id'])->getOne(T_STORE);
        $transaction_data['text_time'] = time2str($transaction_data['time']);
        $context['total_sell'] += $transaction_data['admin_com'];
        $context['transactions'][]    = $transaction_data;
    }
    $context['page_link'] = 'store/' . $_GET['user'] . '/downloads';
    $context['page_title'] = $_GET['user'] . ' downloads';

}else if ($page == 'upload' && $is_owner ) {

    $context['page_link'] = 'store/' . $_GET['user'] . '/upload';
    $context['page_title'] = 'upload';
}else if ($page == 'upload' && !$is_owner ) {
    header("Location: $site_url");
    exit;
}else if ($page == 'show_image' && !$is_owner ) {

    //$store_images = $db->arrayBuilder()->where('id',$postid)->getOne(T_STORE);

    $post_id = $postid;

    $context['images']  = array();
    $store_images = $db->arrayBuilder()->where('id',$post_id)->getOne(T_STORE);
    if(empty($store_images)){
        header("Location: $site_url/welcome");
        exit;
    }
    $store_images['category_name'] = $context['lang'][$store_images['category']];
    $store_images['text_time'] = time2str($store_images['created_at']);

    $context['user_id'] = $uid;
    $context['store_images_user_id'] = $store_images['user_id'];
    if( $store_images['user_id'] == $uid ){
        $context['owner'] = true;
    }
    $_user_data = $user->getUserDataById($store_images['user_id']);
    $_user_data = o2array($_user_data);

    $store_images['avatar'] = $_user_data['avatar'];
    $store_images['username'] = $_user_data['username'];
    $store_images['is_verified'] = $_user_data['verified'];

    $context['post_data'] = $store_images;

    list($_width, $_height, $_type) = getimagesize($store_images['full_file']);
    $context['post_data']['dimensions'] = $_width . 'px X ' . $_height . 'px';

    $types_array = array(
        '1' => 'GIF',
        '2' => 'JPG',
        '3' => 'PNG',
        '4' => 'SWF',
        '5' => 'PSD',
        '6' => 'BMP',
        '7' => 'TIFF',
        '8' => 'TIFF',
        '9' => 'JPC',
        '10' => 'JP2',
        '11' => 'JPX',
        '12' => 'JB2',
        '13' => 'SWC',
        '14' => 'IFF',
        '15' => 'WBMP',
        '16' => 'XBM'
    );
    $context['post_data']['ext'] = $types_array[$_type];

    $context['post_data']['standalone'] = true;

    $template = 'store/templates/store/includes/lightbox';
    $context['page_link'] = 'store/'.$postid;
    $context['page_title'] = $store_images['title'];

}else if ($page == 'history' && $is_owner ) {
    $context['transactions']  = array();
    $store_ids = array();
    $ids = $db->where('user_id',$context['user']['user_id'])->get(T_STORE,null,array('id'));
    foreach ($ids as $key => $val){
        $store_ids[] = $val->id;
    }
    $transactions = $db->arrayBuilder()->where('type', 'store')->where('item_store_id',$store_ids, 'IN')->get(T_TRANSACTIONS,10);
    $context['total_sell'] = 0;
    foreach ($transactions as $key => $transaction_data) {
        $transaction_data['user_data'] = $db->arrayBuilder()->where('user_id', $transaction_data['user_id'])->getOne(T_USERS);
        $transaction_data['item_data'] = $db->arrayBuilder()->where('id', $transaction_data['item_store_id'])->getOne(T_STORE);
        $transaction_data['text_time'] = time2str($transaction_data['time']);
        $context['total_sell'] += $transaction_data['admin_com'];
        $context['transactions'][]    = $transaction_data;
    }
    $context['page_link'] = 'store/' . $_GET['user'] . '/history';
    $context['page_title'] = $_GET['user'] . ' transactions history';
}else if ($page == 'update' && $is_owner ) {
    $context['page_link'] = 'store/' . $_GET['user'] . '/update?post_id='.$_GET['post_id'];
    $context['page_title'] = 'update';
    $s_item = $db->arrayBuilder()->where('id', $_GET['post_id'])->getOne(T_STORE,null,array('*'));
    $context['itemData'] = $s_item;
    if ($s_item['user_id'] <> $me['user_id'] ) {
        header("Location: $site_url");
        exit;
    }
}

$context['items']  = array();
$context['content'] = $pixelphoto->PX_LoadPage($template);