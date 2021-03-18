<?php 
/**
 * 
 */
class SettingsEndPoint extends Generic
{
	
	function __construct($api_resource_id)
	{
		switch ($api_resource_id) {
			case 'save_setting':
				self::save_setting_();
				break;
			case 'get_setting':
				self::get_setting_();
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


	private function save_setting_()
	{
		global $me,$countries_name;
		$allowed = array('username','email','gender','country_id','fname','lname','about','website','facebook','google','twitter','search_engines');
		$gender = array('male','female');
		$active = array('on','off');
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
    		$user = new User();
    		$data = array();
    		unset($_POST['server_key']);
    		unset($_POST['access_token']);
    		foreach ($_POST as $key => $value) {
    			if (in_array($key, $allowed)) {
	    			$data[$key] = $value;
	    		}
    		}
    		if (isset($data['username']) && $me['username'] != $data['username']) {
				if (User::userNameExists($data['username'])) {
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '6',
				            'error_text' => 'That username is already taken'
				        )
				    );
				    self::json($response_data);
				}	
			}
			if(isset($data['username']) && (strlen($data['username']) < 4 || strlen($data['username']) > 32) ){
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '7',
			            'error_text' => 'Username must be between 4 and 16 characters'
			        )
			    );
			    self::json($response_data);
			}
			if(isset($data['username']) && preg_match('/[^\w]+/', $data['username'])){
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '8',
			            'error_text' => 'Username contains invalid characters'
			        )
			    );
			    self::json($response_data);
			}
			if(isset($data['email']) && $me['email'] != $data['email'] ){
				if (User::userEmailExists($data['email'])) {
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '9',
				            'error_text' => 'That email is already exists'
				        )
				    );
				    self::json($response_data);
				}
			}
			if(isset($data['email']) && !filter_var($data['email'], FILTER_VALIDATE_EMAIL)){
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '10',
			            'error_text' => 'E-mail contains invalid characters'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['country_id']) && !in_array($data['country_id'], array_keys($countries_name))) {
				unset($data['country_id']);
			}
			if (isset($data['gender']) && !in_array($data['gender'], $gender)) {
				unset($data['gender']);
			}
			// if (isset($data['active']) && ($data['active'] == 1 || $data['active'] == 0)) {
				
			// }
			if (isset($data['fname']) && len($data['fname']) > 12) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '25',
			            'error_text' => 'First name is too long Please enter a valid first name'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['lname']) && len($data['lname']) > 20) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '26',
			            'error_text' => 'Last name is too long Please enter a valid last name'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['about']) && len($data['about']) > 150) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '27',
			            'error_text' => 'Your text about you is too long The maximum number of text characters is 150.'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['website']) && len($data['website']) && empty(Generic::isUrl($data['website']))) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '28',
			            'error_text' => 'Your website url is invalid Please enter a valid url'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['facebook']) && len($data['facebook']) && empty(Generic::isUrl($data['facebook']))) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '29',
			            'error_text' => 'Your facebook profile url is invalid Please enter a valid url'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['google']) && len($data['google']) && empty(Generic::isUrl($data['google']))) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '30',
			            'error_text' => 'Your google profile url is invalid Please enter a valid url'
			        )
			    );
			    self::json($response_data);
			}
			if (isset($data['twitter']) && len($data['twitter']) && empty(Generic::isUrl($data['twitter']))) {
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '31',
			            'error_text' => 'Your twitter profile url is invalid Please enter a valid url'
			        )
			    );
			    self::json($response_data);
			}
			if (!empty($_FILES['avatar']) && file_exists($_FILES['avatar']['tmp_name'])) {
				$media = new Media();
				$media->setFile(array(
					'file' => $_FILES['avatar']['tmp_name'],
					'name' => $_FILES['avatar']['name'],
					'size' => $_FILES['avatar']['size'],
					'type' => $_FILES['avatar']['type'],
					'allowed' => 'jpeg,jpg,png',
					'crop' => array(
						'height' => 150,
						'width' => 150,
					),
				));

				$upload = $media->uploadFile();

				if (!isset($upload['error']) && !empty($upload)) { 
					$data['avatar'] = $upload['filename'];
				}
				else{
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '34',
				            'error_text' => 'File format not supported'
				        )
				    );
				    self::json($response_data);
				}
			}
			if (isset($_POST['old_password']) && isset($_POST['new_password']) && isset($_POST['conf_password'])) {
				if (empty($_POST['old_password']) || empty($_POST['new_password']) || empty($_POST['conf_password'])) {
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '16',
				            'error_text' => 'please check your details'
				        )
				    );
				    self::json($response_data);
				}
				if (!HashPassword($_POST['old_password'], $me['password'])) {
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '11',
				            'error_text' => 'Password does not match'
				        )
				    );
				    self::json($response_data);
				}
				if ($_POST['new_password'] != $_POST['conf_password']) {
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '11',
				            'error_text' => 'Password does not match'
				        )
				    );
				    self::json($response_data);
				}
				if (strlen($_POST['conf_password']) < 4) {
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '12',
				            'error_text' => 'Password is too short'
				        )
				    );
				    self::json($response_data);
				}
				$password = $_POST['new_password'];
				$data['password'] = password_hash($password, PASSWORD_DEFAULT);
			}
			if (isset($_POST['n_on_like']) && in_array($_POST['n_on_like'], array('0','1'))) {
				$data['n_on_like'] =  Generic::secure($_POST['n_on_like']);
			}
			if (isset($_POST['n_on_comment']) && in_array($_POST['n_on_comment'], array('0','1'))) {
				$data['n_on_comment'] =  Generic::secure($_POST['n_on_comment']);
			}
			if (isset($_POST['n_comment_reply']) && in_array($_POST['n_comment_reply'], array('0','1'))) {
				$data['n_comment_reply'] =  Generic::secure($_POST['n_comment_reply']);
			}
			if (isset($_POST['n_comment_like']) && in_array($_POST['n_comment_like'], array('0','1'))) {
				$data['n_comment_like'] =  Generic::secure($_POST['n_comment_like']);
			}
			if (isset($_POST['n_on_follow']) && in_array($_POST['n_on_follow'], array('0','1'))) {
				$data['n_on_follow'] =  Generic::secure($_POST['n_on_follow']);
			}
			if (isset($_POST['n_on_mention']) && in_array($_POST['n_on_mention'], array('0','1'))) {
				$data['n_on_mention'] =  Generic::secure($_POST['n_on_mention']);
			}
			if (isset($_POST['p_privacy']) && in_array($_POST['p_privacy'], array('0','1','2'))) {
				$data['p_privacy'] =  Generic::secure($_POST['p_privacy']);
			}
			if (isset($_POST['c_privacy']) && in_array($_POST['c_privacy'], array('1','2'))) {
				$data['c_privacy'] =  Generic::secure($_POST['c_privacy']);
			}
			if (isset($data['search_engines']) && ($data['search_engines'] == 1 || $data['search_engines'] == 0)) {
				$data['search_engines'] =  Generic::secure($_POST['search_engines']);
			}
			if (!empty($data)) {
				$update = $user->updateStatic($me['user_id'],$data);

				if (!empty($update)) {
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'message'         => 'Your changes has been successfully saved!'
				    );
				    self::json($response_data);
				}
				else{
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '14',
				            'error_text' => 'Sorry There Is Something Wrong!! Please Try Again Later.'
				        )
				    );
				    self::json($response_data);
				}
			}
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '5',
		            'error_text' => 'Please fill in all required fields'
		        )
		    );
		    self::json($response_data);

			
			
    	}
	}



	private function get_setting_()
	{
		global $config;
		$response_data       = array(
	        'code'     => '200',
		    'status'   => 'OK',
	        'data'     => $config
	    );
	    self::json($response_data);
	}










}