<?php
use Twilio\Jwt\AccessToken;
use Twilio\Jwt\Grants\VideoGrant;

if ($action == 'create_new_video_call' && IS_LOGGED &&
    $config['video_chat'] == 1 &&
    !empty($config['video_accountSid']) && 
    !empty($config['video_apiKeySid']) &&
    !empty($config['video_apiKeySecret']) 
    ) {

        if ( empty($_GET['user_id2']) || empty($_GET['user_id1']) || $_GET['user_id1'] != $me['user_id'] ) {
            $data = array(
                'status' => 403,
                'message' => 'Forbidden'
            ); 
        }
        //require_once($_LIBS . 'twilio'.$_DS.'vendor'.$_DS.'autoload.php');
        // $user_1       = userData(Generic::secure($_GET['user_id1']));
        // $user_2       = userData(Generic::secure($_GET['user_id2']));
        $room_script  = sha1(rand(1111111, 9999999));
        $accountSid   = $config['video_accountSid'];
        $apiKeySid    = $config['video_apiKeySid'];
        $apiKeySecret = $config['video_apiKeySecret'];
        $call_id      = substr(md5(microtime()), 0, 15);
        $call_id_2    = substr(md5(time()), 0, 15);
        $token        = new AccessToken($accountSid, $apiKeySid, $apiKeySecret, 3600, $call_id);
        $grant        = new VideoGrant();
        $grant->setRoom($room_script);
        $token->addGrant($grant);
        $token_ = $token->toJWT();
        $token2 = new AccessToken($accountSid, $apiKeySid, $apiKeySecret, 3600, $call_id_2);
        $grant2 = new VideoGrant();
        $grant2->setRoom($room_script);
        $token2->addGrant($grant2);
        $token_2    = $token2->toJWT();
        $vid_array = array(
            'access_token' => Generic::secure($token_),
            'from_id' => Generic::secure($_GET['user_id1']),
            'to_id' => Generic::secure($_GET['user_id2']),
            'access_token_2' => Generic::secure($token_2),
            'room_name' => $room_script
        );
        $insertData = CreateNewVideoCall($vid_array);
        if ($insertData > 0) {
            $html = '';
            $user         = new User();
            $context['calling_user'] = $user->getUserDataById($_GET['user_id2']);
            $html = $pixelphoto->PX_LoadPage('home/templates/home/includes/calling');

            $data = array(
                'status' => 200,
                'access_token' => $token_,
                'id' => $insertData,
                'url' => $config['site_url'] . '/video_call/' . $insertData,
                'html' => $html,
                'text_no_answer' => lang('no_answer'),
                'text_please_try_again_later' => lang('try_again_later')
            );
        }
}
else if( $action == 'check_for_answer'){
    if (!empty($_GET['id'])) {
        $selectData = CheckCallAnswer($_GET['id']);
        if ($selectData !== false) {
            $data = ['idxxxx' => $selectData];
            $data = array(
                'status' => 200,
                'url' => $selectData['url'],
                'text_answered' => lang('answered'),
                'text_please_wait' => lang('please_wait')
            );
        } else {
            $check_declined = CheckCallAnswerDeclined($_GET['id']);
            $data = ['id' => $check_declined];
            if ($check_declined) {
                $data = array(
                    'status' => 400,
                    'text_call_declined' => lang('call_declined'),
                    'text_call_declined_desc' => lang('recipient_has_declined')
                );
            }
        }
    }
}
else if( $action == 'cancel_call'){
    $user_id = $me['user_id'];
    $query   = mysqli_query($sqlConnect, "DELETE FROM `videocalles` WHERE `from_id` = '$user_id'");
    if ($query) {
        $data = array(
            'status' => 200
        );
    }
}
else if( $action == 'answer_call'){
    if (!empty($_GET['id']) && !empty($_GET['type'])) {
        $id = Generic::secure($_GET['id']);
        if ($_GET['type'] == 'audio') {
            $query = mysqli_query($sqlConnect, "UPDATE `audiocalls` SET `active` = 1 WHERE `id` = '$id'");
        } else {
            $query = mysqli_query($sqlConnect, "UPDATE `videocalles` SET `active` = 1 WHERE `id` = '$id'");
        }
        if ($query) {
            $data = array(
                'status' => 200
            );
        }
    }
}
else if( $action == 'decline_call'){
    if (!empty($_GET['id']) && !empty($_GET['type'])) {
        $id = Generic::secure($_GET['id']);
        if ($_GET['type'] == 'video') {
            $query = mysqli_query($sqlConnect, "UPDATE `videocalles` SET `declined` = '1' WHERE `id` = '$id'");
        } else {
            $query = mysqli_query($sqlConnect, "UPDATE `audiocalls` SET `declined` = '1' WHERE `id` = '$id'");
        }
        if ($query) {
            $data = array(
                'status' => 200
            );
        }
    }
}