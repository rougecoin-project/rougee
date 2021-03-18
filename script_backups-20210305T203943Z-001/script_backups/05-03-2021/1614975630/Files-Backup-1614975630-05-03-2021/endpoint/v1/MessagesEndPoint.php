<?php 
/**
 * 
 */
class MessagesEndPoint extends Generic
{
	
	function __construct($api_resource_id)
	{
		switch ($api_resource_id) {
			case 'get_chats':
				self::get_chats_();
				break;
			case 'get_user_messages':
				self::get_user_messages_();
				break;
			case 'send_message':
				self::send_messages_();
				break;
			case 'send_media_message':
				self::send_media_messages_();
				break;		
			case 'get_media_information':
				self::get_media_information();
				break;	
			case 'clear_messages':
				self::clear_messages_();
				break;
			case 'delete_chat':
				self::delete_chat_();
				break;
			case 'delete_message':
				self::delete_message_();
				break;
			default:
				$response_data = array(
			        'code'     => '400',
			        'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '1',
			            'error_text' => 'Error: 404 API Version Not Found'
			        )
			    );
			    self::json($response_data);
				break;
		}
	}

	private function get_chats_()
	{
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$messages  = new Messages();
    		$user    = new User();
    		$messages->limit = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 30;
			$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
    		$messages->setUserById($me['user_id']);
			$chats_history = $messages->getChats($offset);
			foreach ($chats_history as $key => $value) {
				$user->setUserById($value->user_id);
				$value->avatar = media($value->avatar);
				$value->last_message = strip_tags($value->last_message);
				$value->time_text = time2str($value->time);

				$user_data = $user->getUserDataById($value->user_id);
				unset($user_data->password);
				unset($user_data->email_code);
				unset($user_data->login_token);
				unset($user_data->edit);
				$user_data->time_text = time2str($user_data->last_seen);
				$user_data->cover = media($user_data->cover);
				$user_data->avatar = media($user_data->avatar);
				$user_data->is_following = $user->isFollowing($user_data->user_id,$me['user_id']);
				$user_data->is_blocked  = $user->isBlocked($user_id,false);
				$value->user_data = $user_data;




			}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $chats_history
		    );
		    self::json($response_data);
    	}
	}


	private function get_user_messages_()
	{
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['user_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the user id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$data = array();
    		$messages  = new Messages();
    		$user    = new User();
    		$user_id = Generic::secure($_POST['user_id']);
    		$messages->limit = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 30;
			$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
			$new  = $_POST['new'] == true ? Generic::secure($_POST['new']) : false;
    		$messages->setUserById($me['user_id']);
    		$user->setUserById($user_id);
			$new_user = $user->userData($user->getUser());
			if (empty($new_user)) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '21',
			            'error_text' => 'An unknown error occurred. Please try again later!'
			        )
			    );
			    self::json($response_data);
			}
			$conv_data['c_privacy']   = $user->chatPrivacy($new_user->user_id);
			$conv_data['is_blocked']  = $user->isBlocked($new_user->user_id);
			$conv_data['ami_blocked'] = $user->isBlocked($new_user->user_id,true);
			$messages->setUserById($me['user_id']);
			$to_id     = $new_user->user_id;
			$user_data = $user->getUserDataById($to_id);
			unset($user_data->password);
			unset($user_data->email_code);
			unset($user_data->login_token);
			unset($user_data->edit);
			$user_data->time_text = time2str($user_data->last_seen);
			$user_data->cover = media($user_data->cover);
			$user_data->avatar = media($user_data->avatar);
			$user_data->is_following = $user->isFollowing($user_data->user_id,$me['user_id']);
			$user_data->is_blocked  = $user->isBlocked($user_id,false);
			$conv_data['user_data'] = $user_data;
			if (!empty($_POST['before']) && empty($_POST['after']) && $_POST['new'] == false) {
				$offset  = !empty($_POST['before']) ? Generic::secure($_POST['before']) : false;
				$conv_data['messages'] = $messages->getMessages($to_id,$offset,$new,'DESC','<');
			}
			elseif (!empty($_POST['after']) && empty($_POST['before']) && $_POST['new'] == false) {
				$offset  = !empty($_POST['after']) ? Generic::secure($_POST['after']) : false;
				$conv_data['messages'] = $messages->getMessages($to_id,$offset,$new,'ASC','>');
			}
			else{
				$conv_data['messages'] = $messages->getMessages($to_id,false,$new,'DESC','>');
			}
			

			foreach ($conv_data['messages'] as $key => $value) {
				$value->media_file = media($value->media_file);
				$value->text = strip_tags($value->text);
				$value->time_text = time2str($value->time);
				$value->position  = 'left';
                if ($value->from_id == $me['user_id']) {
                    $value->position  = 'right';
                }
			}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $conv_data
		    );
		    self::json($response_data);
    	}
	}

	private function get_media_information(){
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_FILES['media_file'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '35',
		            'error_text' => 'you must upload file'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
			$getID3 = new getID3;
			if (!empty($_FILES['media_file']) && file_exists($_FILES['media_file']['tmp_name'])) {
				$fileinfo = $getID3->analyze($_FILES['media_file']['tmp_name']);
				//var_dump($fileinfo);
				getid3_lib::CopyTagsToComments($tag);
				$response_data       = array(
					'code'     => '200',
					'status'   => 'OK',
					'data'     => array(
						'fileformat' => $fileinfo['fileformat'],
						'mime_type' => $fileinfo['mime_type'],
						'width' => ($fileinfo['xmp']['exif']['PixelXDimension'] !== null ) ? $fileinfo['xmp']['exif']['PixelXDimension'] : $fileinfo['video']['resolution_x'],
						'height' => ($fileinfo['xmp']['exif']['PixelYDimension'] !== null ) ? $fileinfo['xmp']['exif']['PixelYDimension'] : $fileinfo['video']['resolution_y'],
						'size' => $_FILES['media_file']['size']
					)
				);
			}else{
				$response_data       = array(
					'code'     => '400',
					'status'   => 'Bad Request',
					'errors'         => array(
						'error_id'   => '35',
						'error_text' => 'can nopt handle this file'
					)
				);
			}

			self::json($response_data);
		}
	}

	private function send_media_messages_(){
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['user_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the user id'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_FILES['send_file'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '35',
		            'error_text' => 'you can not send empty message'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
			$text      = '';
			$messages  = new Messages();
			//$notif        = new Notifications();
			$to_id     = Generic::secure($_POST['user_id']);

			$new_string        = pathinfo($_FILES['send_file']['name'], PATHINFO_FILENAME) . '.' . strtolower(pathinfo($_FILES['send_file']['name'], PATHINFO_EXTENSION));
				$file_extension    = pathinfo($new_string, PATHINFO_EXTENSION);
				$media  = new Media();
				$media->setFile(array(
					'file' => $_FILES['send_file']['tmp_name'],
					'name' => $_FILES['send_file']['name'],
					'size' => $_FILES['send_file']['size'],
					'type' => $_FILES['send_file']['type'],
					'allowed' => 'jpg,jpeg,png,gif,zip,txt',
				));
				$file = $media->uploadFile();
				if (!empty($file) && !empty($file['filename'])) {
					if ($file_extension == 'jpg' || $file_extension == 'jpeg' || $file_extension == 'png' || $file_extension == 'gif') {
						$re_data['media_type'] = 'image';
					}
					elseif ($file_extension == 'mp4' || $file_extension == 'webm' || $file_extension == 'flv') {
						$re_data['media_type'] = 'video';
					}
					else{
						$re_data['media_type'] = 'file';
					}
				}

			$re_data   = array(
				'from_id' => $me['user_id'],
				'to_id' => $to_id,
				'text' => $re_data['media_type'],
				'media_file' => $file['filename'],
				'media_name' => $file['name'],
				'time' => time()
			);
         
			$msg_data = $messages->sendMessage($re_data);
			$msg_data->media_file = media($msg_data->media_file);
			$msg_data->text = strip_tags($msg_data->text);
			$msg_data->time_text = time2str($msg_data->time);
			$msg_data->hash_id = $_POST['hash_id'];
			if (!empty($msg_data)) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'data'     => $msg_data
			    );
			    self::json($response_data);
			}
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '21',
		            'error_text' => 'An unknown error occurred. Please try again later!'
		        )
		    );
		    self::json($response_data);
		}
	}

	private function send_messages_()
	{
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['user_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the user id'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['text'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '35',
		            'error_text' => 'you can not send empty message'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['hash_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '36',
		            'error_text' => 'hash id con not be empty'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$text      = Generic::secure($_POST['text']);
			$messages  = new Messages();
			//$notif        = new Notifications();
			$to_id     = Generic::secure($_POST['user_id']);
			$re_data   = array(
				'from_id' => $me['user_id'],
				'to_id' => $to_id,
				'text' => $text,
				'time' => time()
			);
         
			$msg_data = $messages->sendMessage($re_data);
			$msg_data->media_file = media($msg_data->media_file);
			$msg_data->text = strip_tags($msg_data->text);
			$msg_data->time_text = time2str($msg_data->time);
			$msg_data->hash_id = $_POST['hash_id'];
			if (!empty($msg_data)) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'data'     => $msg_data
			    );
			    self::json($response_data);
			}
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '21',
		            'error_text' => 'An unknown error occurred. Please try again later!'
		        )
		    );
		    self::json($response_data);
    	}
	}


	private function clear_messages_()
	{
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['user_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the user id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$to_id = Generic::secure($_POST['user_id']);
    		$messages = new Messages();
			$messages->setUserById($me['user_id']);
			$clear    = $messages->clearChat($to_id);
			if (!empty($clear)) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'message'     => 'messages successfully deleted'
			    );
			    self::json($response_data);
			}

			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '21',
		            'error_text' => 'An unknown error occurred. Please try again later!'
		        )
		    );
		    self::json($response_data);
    	}
	}



	private function delete_chat_()
	{
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['user_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the user id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$to_id = Generic::secure($_POST['user_id']);
    		$messages = new Messages();
			$messages->setUserById($me['user_id']);
			$delete   = $messages->deleteChat($to_id);

			if (!empty($delete)) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'message'     => 'chat successfully deleted'
			    );
			    self::json($response_data);
			}

			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '21',
		            'error_text' => 'An unknown error occurred. Please try again later!'
		        )
		    );
		    self::json($response_data);
    	}
	}


	private function delete_message_()
	{
		global $me;
		if (IS_LOGGED == false) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['user_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the user id'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['messages']) && !is_array($_POST['messages'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '37',
		            'error_text' => 'please select the messages that you want to delete them'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$ids = explode(',', Generic::secure($_POST['messages']));
    		$to_id = Generic::secure($_POST['user_id']);
    		$messages = new Messages();
			$messages->setUserById($me['user_id']);
			$clear    = $messages->deleteMessages($to_id,$ids);


			if (!empty($clear)) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'message'     => 'message successfully deleted'
			    );
			    self::json($response_data);
			}

			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '21',
		            'error_text' => 'An unknown error occurred. Please try again later!'
		        )
		    );
		    self::json($response_data);
    	}
	}



	


	

	

		
}
