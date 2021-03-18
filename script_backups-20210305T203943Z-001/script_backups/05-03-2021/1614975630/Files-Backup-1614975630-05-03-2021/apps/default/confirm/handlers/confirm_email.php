<?php
if (IS_LOGGED == true) {
	header("Location: $site_url");
	exit();
}

if (empty($_GET['code'])) {
	header("Location: $site_url");
	exit;
}

$config['header'] = false;
$config['footer'] = false;

try {
    $_code = $_GET['code'];
    //$_email = $_GET['email'];

    //$db->where('email', $_email);
    $db->where('email_code', $_code);
    $user = $db->getOne(T_USERS);


    if (empty($user)) {
        exit('empty user');
    }
    if ($user->active == 1) {
        exit('user already active');
    }

    $email_code = sha1(time() + rand(111,999));

    $db->where('user_id', $user->user_id);

    $update_data = array('active' => 1, 'email_code' => $email_code);
    $update = $db->update(T_USERS, $update_data);
    if ($update) {
        $session_id          = sha1(rand(11111, 99999)) . time() . md5(microtime());
        $insert_data         = array(
            'user_id' => $user->user_id,
            'session_id' => $session_id,
            'time' => time()
        );
        $insert              = $db->insert(T_SESSIONS, $insert_data);
        $_SESSION['user_id'] = $session_id;
        setcookie("user_id", $session_id, time() + (10 * 365 * 24 * 60 * 60), "/");
        header("Location: $site_url");
        exit();
    }
    exit();


} 
catch (Exception $e) {
	header("Location: $site_url");
	exit;
}


$context['page_title'] = 'Confirm email';
$context['content'] = $pixelphoto->PX_LoadPage('confirm/templates/confirm/index');
