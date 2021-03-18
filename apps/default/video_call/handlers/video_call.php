<?php
if (!IS_LOGGED || $config['video_chat'] == 0 || empty($_GET['id'])) {
	header("Location: ". $config['site_url']);
	exit;
}

$id = intval(Generic::secure($_GET['id']));
$data2 = GetAllDataFromCallID($id);
if (!$data2) {
    header("Location: " . $config['site_url']);
    exit();
}

$context['video_call']      = $data2;
if ($context['video_call']['to_id'] == $me['user_id']) {
    $context['video_call']['user'] = 1;
    $context['video_call']['access_token'] = $context['video_call']['access_token'];
} else if ($context['video_call']['from_id'] == $me['user_id']) {
    $context['video_call']['user'] = 2;
    $context['video_call']['access_token'] = $context['video_call']['access_token_2'];
} else {
    header("Location: " . $config['site_url']);
    exit();
}

// $user         = new User();
// $user_1 = $user->getUserDataById($context['video_call']['from_id']);
// $user_2 = $user->getUserDataById($context['video_call']['to_id']);
$context['video_call']['room'] = $data2['room'];//$user_1->username . '_' . $user_2->username;
if ($context['video_call']['from_id'] == $me['user_id']) {
    $user_id = $me['user_id'];
}


$context['page_title'] = lang('video_call');
$context['app_name'] = 'video_call';

$context['content'] = $pixelphoto->PX_LoadPage('video_call/templates/video_call/index');