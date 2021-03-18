<?php 

class Auth extends Generic {



	public function __construct($api_resource_id)
	{
		switch ($api_resource_id) {
			case 'login':
				self::login();
				break;
			case 'register':
				self::register();
				break;
			case 'forget':
				self::forget();
				break;
			case 'logout':
				self::logout();
				break;
			case 'delete_account':
				self::delete_account();
				break;
			case 'social_login':
				self::social_login_();
				break;
			
			default:
				$response_data = array(
			        'code'     => '400',
			        'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '1',
			            'error_text' => 'Error: 400 API Version Not Found'
			        )
			    );
			    self::json($response_data);
				break;
		}
	}


    private function login() {
    	if (empty($_POST['username']) || empty($_POST['password'])) {
		    $response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '2',
		            'error_text' => 'Please enter your username and password!'
		        )
		    );
		    self::json($response_data);
		}
		else{
			$login = User::loginUser();
			if (!empty($login) && is_array($login)) {
	            $response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'data'         => array(
			            'user_id'   => $login['user_id'],
			            'access_token' => $login['access_token']
			        )
			    );
			    self::json($response_data);
	        }
	        else{
	        	$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '4',
			            'error_text' => 'Invalid username or password!'
			        )
			    );
			    self::json($response_data);

	        }
		}
    }

    private function register() {
		global $config;
    	if (empty($_POST['username']) || empty($_POST['email']) || empty($_POST['password']) || empty($_POST['conf_password'])) {
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
		elseif (User::userNameExists($_POST['username'])) {
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
		elseif (strlen($_POST['username']) < 4 || strlen($_POST['username']) > 16) {
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
		elseif (!preg_match('/^[\w]*[a-zA-Z]{1}[\w]*$/', $_POST['username'])) {
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
		elseif (User::userEmailExists($_POST['email'])) {
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
		elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
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
		elseif ($_POST['password'] != $_POST['conf_password']) {
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
		elseif (strlen($_POST['conf_password']) < 4) {
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
		else{

			$register = User::registerUser();

			var_dump($config['email_validation']);
			var_dump($register);
			if ($config['email_validation'] == 'on') {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'message'   => 'Your account was succesffuly created, please check your inbox\/spam folder for the activation link'
				);
			    self::json($response_data);
			} else {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'data'         => array(
			            'user_id'   => $register['user_id'],
			            'access_token' => $register['access_token'],
			            'message' => 'You have successfully joined'
			        )
			    );
			    self::json($response_data);
			}
		}
    }

    
    private function forget()
    {
    	global $config;
    	if (empty($_POST['email'])) {
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
    	elseif (!User::userEmailExists($_POST['email'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '13',
		            'error_text' => 'Email not found'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$user = new User;
	        $user_data = $user->setUserByEmail($_POST['email'])->getUser();


	        $email_code = sha1(time() + rand(111,999));
	        $update_data = array('email_code' => $email_code);
	        self::$db->where('user_id', $user_data->user_id);
	        $update = self::$db->update(T_USERS, $update_data);
	        $password_text = "Hello {{NAME}},
	<br><br>".lang('v2_reset_password_msg')."
	<br>
	<a href=\"{{RESET_LINK}}\">".lang('v2_reset_password')."</a>
	<br><br>
	{{SITE_NAME}} Team.";

	        $password_text = str_replace(
	            array("{{NAME}}","{{SITE_NAME}}", "{{RESET_LINK}}"),
	            array($user_data->name, $config['site_name'], $config['site_url'] . '/reset-password/' . $email_code),
	            $password_text 
	        );

	        $send_email_data = array(
	            'from_email' => $config['site_email'],
	            'from_name' => $config['site_name'],
	            'to_email' => $_POST['email'],
	            'to_name' => $user_data->name,
	            'subject' => lang('v2_reset_password'),
	            'charSet' => 'UTF-8',
	            'message_body' => $password_text,
	            'is_html' => true
	        );
	        $send_message = Generic::sendMail($send_email_data);
	        if ($send_message) {
	        	$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'message' => 'We have sent you an email, please check your inbox or spam folder.'
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
    }

    
    private function logout()
    {
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
	        $access_token        = self::secure($_POST['access_token']);
			self::$db->where('session_id', $access_token);
			self::$db->delete(T_SESSIONS);
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'message' => 'Logged Out Successfully'
		    );
		    self::json($response_data);
		}
    }


    private function delete_account()
    {
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
    	elseif (empty($_POST['password'])) {
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
    	else {
    		$access_token = self::secure($_POST['access_token']);
    		$user_id   = self::$db->where('session_id', $access_token)->getValue(T_SESSIONS, 'user_id');
		    $user_data = self::$db->where('user_id',$user_id)->getOne(T_USERS);
		    if (!empty($user_data)) {
		    	if (!HashPassword($_POST['password'], $user_data->password)) {
		    		$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '18',
				            'error_text' => 'Wrong Password'
				        )
				    );
				    self::json($response_data);
		    	}
		    	else{
		    		$user = new User;
		    		$user->setUserById($user_id)->delete();
					self::$db->where('user_id', $user_id);
					self::$db->delete(T_SESSIONS);
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'message' => 'Your account successfully deleted.'
				    );
				    @session_destroy();
				    self::json($response_data);
		    	}
		    }
    	}
    }

    private function social_login_()
    {
	$response_data   = array(
	    'api_status' => 400
	);
	$required_fields = array(
	    'access_token',
	    'provider'
	);
	foreach ($required_fields as $key => $value) {
	    if (empty($_POST[$value]) && empty($error_code)) {
	        $error_code    = 3;
	        $error_message = $value . ' (POST) is missing';
	    }
	}
	if (!empty($error_code)) {
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
	else {
		$social_id          = 0;
	    $access_token       = $_POST['access_token'];
	    $provider           = $_POST['provider'];
	    if ($provider == 'facebook') {
	    	$json_data = $this->curlConnect("https://graph.facebook.com/me?fields=email,id,name,age_range&access_token={$access_token}");

	    	if (!empty($json_data['error'])) {
	    		$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '17',
			            'error_text' => $json_data['error']['message']
			        )
			    );
			    self::json($response_data);
	    	} else if (!empty($json_data['id'])) {
	    		$social_id = $json_data['id'];
	    		$social_email = $json_data['email'];
	    		$social_name = $json_data['name'];
	    		if (empty($social_email)) {
	    			$social_email = 'fb_' . $social_id . '@facebook.com';
	    		}
	    	}
	    } 
	    else if ($provider == 'google') {
			$json_data = $this->curlConnect("https://www.googleapis.com/plus/v1/people/me?access_token={$access_token}");
			if (!empty($json_data['error'])) {
				$response_data       = array(
					'code'     => '400',
					'status'   => 'Bad Request',
					'errors'         => array(
						'error_id'   => '19',
						'error_text' => $json_data['error']
					)
				);
				self::json($response_data);
			} else if (!empty($json_data['id'])) {
				$social_id = $json_data['id'];
				$social_email = $json_data['emails'][0]['value'];
				$social_name = $json_data['displayName'];
				if (empty($social_email)) {
					$social_email = 'go_' . $social_id . '@google.com';
				}
			}
	    }


	    if (!empty($social_id)) {
	    	$create_session = false;
	    	if (User::userEmailExists($social_email)) {
	    		$create_session = true;
	    	} else {
	    		$str          = md5(microtime());
	            $id           = substr($str, 0, 9);
	            $user_uniq_id = (User::userNameExists($id)) ? 'u_' . $id : $id;
	            $password = rand(1111, 9999);
	            $insert_data = array(
		            'username' => self::secure($user_uniq_id),
		            'password' => password_hash($password, PASSWORD_DEFAULT),
		            'email' => self::secure($social_email),
		            'ip_address' => '0.0.0.0',
		            'active' => 1,
		            'last_seen' => time(),
		            'registered' => date('Y') . '/' . intval(date('m')),
		            'email_code' => sha1(time() + rand(111,999))
				);
				
				

		        $insert_id     = self::$db->insert(T_USERS, $insert_data);
	            if ($insert_id) {
	            	$create_session = true;
	            }
	    	}

	    	if ($create_session == true) {
	    		$user = new User;
		        $user_data = $user->setUserByEmail($social_email)->getUser();
		        $insert_id = $user_data->user_id;
	    		$session_id  = sha1(rand(11111, 99999)) . time() . md5(microtime());
	        	$platform_details = $user->getUserBrowser();

		        $insert_data = array(
		           'user_id' => $insert_id,
		           'session_id' => $session_id,
		           'time' => time(),
		           'platform_details'  => json_encode($platform_details),
		           'platform' => $platform_details['platform']
		        );
				$insert              = self::$db->insert(T_SESSIONS, $insert_data);

				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'data'         => array(
			            'user_id'   => $insert_id,
			            'access_token' => $session_id
			        )
			    );
			    self::json($response_data);
	    	}
	    }
	}































    }


}