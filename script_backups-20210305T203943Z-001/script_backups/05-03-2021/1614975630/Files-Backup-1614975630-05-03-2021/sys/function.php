<?php
function px_StripSlashes($value) {
    if (!get_magic_quotes_gpc()) return $value;
    if (is_array($value)) {
        return array_map('px_StripSlashes', $value);
    } else {
        return stripslashes($value);
    }
}
function IsBanned($value = '') {
    global $mysqli;
    $query_one    = mysqli_query($mysqli, "SELECT COUNT(`id`) as count FROM " . T_BLACKLIST . " WHERE `value` = '{$value}'");
    $fetched_data = mysqli_fetch_assoc($query_one);
    if ($fetched_data['count'] > 0) {
        return true;
    }
    return false;
}
function IsSharedPost($post_id) {
    global $mysqli;
    $query_one    = mysqli_query($mysqli, "SELECT COUNT(`id`) as count FROM " . T_NOTIF . " WHERE `type` = 'shared_your_post' AND `url` LIKE '%/post/{$post_id}'");
    $fetched_data = mysqli_fetch_assoc($query_one);
    if ($fetched_data['count'] > 0) {
        return true;
    }
    return false;
}
function GetSharedPostOwner($post_id) {
    global $mysqli, $db;
    $query_one    = mysqli_query($mysqli, "SELECT `recipient_id` FROM " . T_NOTIF . " WHERE `type` = 'shared_your_post' AND `url` LIKE '%/post/{$post_id}'");
    $fetched_data = mysqli_fetch_assoc($query_one);
    if ($fetched_data['recipient_id'] > 0) {
        $user = $db->arrayBuilder()->where('user_id',$fetched_data['recipient_id'])->get(T_USERS,null,array('*'));
        return (isset($user[0])) ? $user[0] : array();
    }
    return '';
}
function RemoveXSS($val) {
    $val = preg_replace('/([\x00-\x08][\x0b-\x0c][\x0e-\x20])/', '', $val);
    $search = 'abcdefghijklmnopqrstuvwxyz';
    $search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $search .= '1234567890!@#$%^&*()';
    $search .= '~`";:?+/={}[]-_|\'\\';
    for ($i = 0; $i < strlen($search); $i++) {
        $val = preg_replace('/(&#[x|X]0{0,8}'.dechex(ord($search[$i])).';?)/i', $search[$i], $val);
        $val = preg_replace('/(&#0{0,8}'.ord($search[$i]).';?)/', $search[$i], $val);
    }
    $ra =  array('javascript', 'vbscript', 'expression', '<applet', '<meta', '<xml', '<blink', '<link', '<style', '<script', '<embed', '<object', '<iframe', '<frame', '<frameset', '<ilayer', '<layer', '<bgsound', '<title', '<base', 'onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
    $found = true;
    while ($found == true) {
        $val_before = $val;
        for ($i = 0; $i < sizeof($ra); $i++) {
            $pattern = '/';
            for ($j = 0; $j < strlen($ra[$i]); $j++) {
                if ($j > 0) {
                    $pattern .= '(';
                    $pattern .= '(&#[x|X]0{0,8}([9][a][b]);?)?';
                    $pattern .= '|(&#0{0,8}([9][10][13]);?)?';
                    $pattern .= ')?';
                }
                $pattern .= $ra[$i][$j];
            }
            $pattern .= '/i';
            $replacement = substr($ra[$i], 0, 2).'<x>'.substr($ra[$i], 2);
            $val = preg_replace($pattern, $replacement, $val);
            if ($val_before == $val) {
                $found = false;
            }
        }
    }
    return $val;
}
function blog_categories(){
    global $db;
    $lang = 'english';
    $blog_categories = $db->arrayBuilder()->where('ref','blog_categories')->get(T_LANGS,null,array('lang_key',$lang));
    $data = array();
    foreach ($blog_categories as $key => $value) {
        if(isset($value[$lang])) {
            $data[$value['lang_key']] = $value[$lang];
        }
    }
    return $data;
}
function store_categories(){
    global $db;
    $lang = 'english';
    $blog_categories = $db->arrayBuilder()->where('ref','store_categories')->get(T_LANGS,null,array('lang_key',$lang));
    $data = array();
    foreach ($blog_categories as $key => $value) {
        if(isset($value[$lang])) {
            $data[$value['lang_key']] = $value[$lang];
        }
    }
    return $data;
}
function GetBlogArticles() {
    global $sqlConnect;
    $data          = array();
    $query_one     = "SELECT * FROM `".T_BLOG."` ORDER BY `id` DESC";
    $sql_query_one = mysqli_query($sqlConnect, $query_one);
    while ($fetched_data = mysqli_fetch_assoc($sql_query_one)) {
        $data[] = GetArticle($fetched_data['id']);
    }
    return $data;
}
function GetArticle($page_name) {
    global $sqlConnect;
    if (empty($page_name)) {
        return false;
    }
    $data          = array();
    $page_name     = Generic::secure($page_name);
    $query_one     = "SELECT * FROM `".T_BLOG."` WHERE `id` = '{$page_name}'";
    $sql_query_one = mysqli_query($sqlConnect, $query_one);
    $fetched_data  = mysqli_fetch_assoc($sql_query_one);
    return $fetched_data;
}
function RegisterNewBlogPost($registration_data) {
    global $sqlConnect;
    if (empty($registration_data)) {
        return false;
    }
    $fields = '`' . implode('`, `', array_keys($registration_data)) . '`';
    $data   = '\'' . implode('\', \'', $registration_data) . '\'';
    $query  = mysqli_query($sqlConnect, "INSERT INTO `".T_BLOG."` ({$fields}) VALUES ({$data})");
    if ($query) {
        return true;
    }
    return false;
}
function PublishArticle($id) {
    global $sqlConnect;
    if (Generic::isLogged_() == false) {
        return false;
    }
    $id    = Generic::secure($id);
    $query = mysqli_query($sqlConnect, "UPDATE `".T_BLOG."` SET `posted` = 1 WHERE `id` = {$id}");
    if ($query) {
        return true;
    }
    return false;
}
function UnPublishArticle($id) {
    global $sqlConnect;
    if (Generic::isLogged_() == false) {
        return false;
    }
    $id    = Generic::secure($id);
    $query = mysqli_query($sqlConnect, "UPDATE `".T_BLOG."` SET `posted` = 0 WHERE `id` = {$id}");
    if ($query) {
        return true;
    }
    return false;
}
function DeleteArticle($id, $thumbnail) {
    global $sqlConnect;
    if (Generic::isLogged_() == false) {
        return false;
    }
    $id    = Generic::secure($id);
    $query = mysqli_query($sqlConnect, "DELETE FROM `".T_BLOG."` WHERE `id` = {$id}");
    if ($query) {
        $media = new Media();
        $cthumbnail = str_replace('_image','_image_c',$thumbnail);
        $media->deleteFromFTPorS3($thumbnail);
        if(file_exists($thumbnail)){
            @unlink($thumbnail);
        }
        $media->deleteFromFTPorS3($cthumbnail);
        if(file_exists($cthumbnail)){
            @unlink($cthumbnail);
        }
        return true;
    }
    return false;
}
function LangsNamesFromDB($lang = 'english') {
    global $sqlConnect;
    $data  = array();
    $query = mysqli_query($sqlConnect, "SHOW COLUMNS FROM `".T_LANGS."`");
    while ($fetched_data = mysqli_fetch_assoc($query)) {
        $data[] = $fetched_data['Field'];
    }
    unset($data[0]);
    unset($data[1]);
    unset($data[2]);
    return $data;
}
function GetLangDetails($lang_key = '') {
    global $sqlConnect;
    if (empty($lang_key)) {
        return false;
    }
    $lang_key = Generic::secure($lang_key);
    $data     = array();
    $query    = mysqli_query($sqlConnect, "SELECT * FROM `".T_LANGS."` WHERE `lang_key` = '{$lang_key}'");
    while ($fetched_data = mysqli_fetch_assoc($query)) {
        unset($fetched_data['lang_key']);
        unset($fetched_data['id']);
        unset($fetched_data['ref']);
        $data[] = $fetched_data;
    }
    return $data;
}
function update_store_image_view($id){
    global $db;
    $cookie_value = null;
    if( !in_array( $id, explode( ',', $_COOKIE['store_views'] ) ) ) {
        if (isset($_COOKIE['store_views'])) {
            $cookie_value = $_COOKIE['store_views'] . ',' . $id;
        } else {
            $cookie_value = $id;
        }
    }
    if( NULL !== $cookie_value ){
        $db->where('id', $id)->update(T_STORE, array('views' => $db->inc(1)));
        setcookie("store_views", $cookie_value, time() + (10 * 365 * 24 * 60 * 60), "/");
    }
}
function update_store_image_downloads($id){
    global $db;
    $cookie_value = null;
    if( !in_array( $id, explode( ',', $_COOKIE['store_downloads'] ) ) ) {
        if (isset($_COOKIE['store_downloads'])) {
            $cookie_value = $_COOKIE['store_downloads'] . ',' . $id;
        } else {
            $cookie_value = $id;
        }
    }
    if( NULL !== $cookie_value ){
        $db->where('id', $id)->update(T_STORE, array('downloads' => $db->inc(1)));
        setcookie("store_downloads", $cookie_value, time() + (10 * 365 * 24 * 60 * 60), "/");
    }
}
function is_store_item_purchased($id,$_license){
    global $db, $user,$context;
    $transaction = $db->arrayBuilder()
                      ->where('item_license',$_license)
                      ->where('type', 'store')
                      ->where('user_id', $context['user']['user_id'])
                      ->where('item_store_id', Generic::secure($id))
                      ->getOne(T_TRANSACTIONS);
    if($transaction){
        return true;
    }else{
        return false;
    }
}