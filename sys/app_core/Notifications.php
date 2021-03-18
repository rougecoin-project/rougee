<?php 


class Notifications extends User{
	public $type = null;

	public $notifier_id = null;

	public $types = array(
		'followed_u' => array(
			'icon' => 'user-plus', 
			'text' => 'followed_u'
		),'accept_request' => array(
			'icon' => 'user-plus', 
			'text' => 'accept_request'
		),
		'liked_ur_post' => array(
			'icon' => 'thumbs-up',
			'text' => 'liked_ur_post'
		),
		'liked_ur_comment' => array(
			'icon' => 'thumbs-up',
			'text' => 'liked_ur_comment'
		),
		'commented_ur_post' => array(
			'icon' => 'comments-o',
			'text' => 'commented_ur_post'
		),'reply_ur_comment' => array(
			'icon' => 'comments-o',
			'text' => 'reply_ur_comment'
		),
		'mentioned_u_in_comment' => array(
			'icon' => 'comments-o',
			'text' => 'mentioned_u_in_comment'
		),
		'mentioned_u_in_post' => array(
			'icon' => 'comments-o',
			'text' => 'mentioned_u_in_post'
		),
		'donated' => array(
			'icon' => 'user-plus', 
			'text' => 'donated'
		),
        'store_purchase' => array(
            'icon' => 'user-plus',
            'text' => 'donated'
        ),
        'shared_your_post' => array(
            'icon' => 'user-plus',
            'text' => 'shared_your_post'
        )
	);

	public function notify($data = array()){
		global $config;
	    if (empty($data) || !is_array($data)) {
	        return false;
	    }
	    
	    
	    self::$db->where('notifier_id',$data['notifier_id']);
	    self::$db->where('recipient_id',$data['recipient_id']);
	    self::$db->where('type',$data['type']);
		self::$db->delete(T_NOTIF);

	    $data['text'] = '';
	    $t_notif      = T_NOTIF;
	    $query        = self::$db->insert($t_notif,$data);
	    if ($config['push'] == 1) {
		    $this->NotificationWebPushNotifier();
		}
	    return $query;
	}

	function getNotifications($offset = false){
		if (empty($this->user_id)) {
			return false;
		}

		$user_id = $this->user_id;
		$t_notif = T_NOTIF;
		$t_users = T_USERS;
		$limit   = $this->limit;
		$data    = array();
		$update  = array();
		
	    self::$db->where('recipient_id',$user_id);

	    if ($this->type == 'new') {
	        $data = self::$db->where('seen',0)->getValue($t_notif,'COUNT(*)');
	    }

	    else{
	    	self::$db->join("{$t_users} u","n.notifier_id = u.user_id ","INNER");
	    	if (!empty($offset)) {
	    		self::$db->where('id',$offset,'<');
	    	}
	    	self::$db->orderBy('id','DESC');
	        $query = self::$db->get("{$t_notif} n",$limit,"n.*,u.username,u.avatar");

	        if (!empty($query)) {
	        	foreach ($query as $notif_data) {
	        		$notif_data->avatar = $notif_data->avatar;
		            $data[] = $notif_data;
		            $update[] = $notif_data->id;
		        }

		        self::$db->where('id',$update,"IN")->update($t_notif,array(
		        	'seen' => time()
		        ));
	        }
	    }

	    return $data;
	}


	public function clearNotifications(){
		if (empty($this->user_id)) {
			return false;
		}

		if (!empty($this->notifier_id) && is_numeric($this->notifier_id)) {
			self::$db->where('notifier_id',$this->notifier_id);
			self::$db->where('recipient_id',$this->user_id);	
		    
		}
		else{
			self::$db->where('recipient_id',$this->user_id);
		    self::$db->where('time',(time() - 432000));
		    self::$db->where('seen',0,'>');
		}
		return self::$db->delete(T_NOTIF);
	}

	public function notifyMentionedUsers($text = "", $url = ""){
		if (empty(IS_LOGGED) || empty($text) || empty($url)) {
			return false;
		}

		$mentions = pxp_mentions($text);
		$user_id  = self::$me->user_id;

		

		foreach ($mentions as $username) {
			try {
				$mentioned_uid  = $this->setUserByName($username);

				$notif_conf     = null;

				if (is_numeric($mentioned_uid)) {
					$notif_conf = $this->notifSettings($mentioned_uid,'on_mention');
				}

				if ($mentioned_uid && ($mentioned_uid != $user_id) && $notif_conf) {
					$re_data = array(
						'notifier_id' => $user_id,
						'recipient_id' => $mentioned_uid,
						'type' => 'mentioned_u_in_comment',
						'url' => $url,
						'time' => time()
					);
					
					$this->notify($re_data);
				}
			} 
			catch (Exception $e) {
				
			}
		}
	}

	public function notifSettings($user_id = false,$type = ''){
		if (empty($user_id) || empty($type) || !is_numeric($user_id)) {
			return false;
		}

		elseif (!in_array($type, array('on_like','on_mention','on_comment','on_follow','on_comment_like','on_comment_reply'))) {
			return false;
		}

		$type  = self::secure($type);
		$query = self::$db->where('user_id',$user_id)->getOne(T_USERS,array("n_$type"));
		$val   = null;

		if (!empty($query)) {
			$type = "n_$type";
			$val  = $query->$type;
		}

		return $val;
	}

	public function NotificationWebPushNotifier() {
	    global $sqlConnect, $me,$db,$config;

	    if (IS_LOGGED == false) {
	        return false;
	    }
	    if ($config['push'] == 0 || empty($config['push_id']) || empty($config['push_key'])) {
	        return false;
	    }
	    $user_id   =  Generic::secure(self::$me->user_id);
	    $to_ids    = array();
	    $notifications = $db->where('notifier_id',$user_id)->where('seen',0)->where('sent_push',0)->orderBy('id','DESC')->get(T_NOTIF);
	    if (!empty($notifications)) {
	        foreach ($notifications as $key => $notify) {
	            $notification_id = $notify->id;
	            $to_id           = $notify->recipient_id;
	            $user         = new User();
				$to_data = $user->getUserDataById($notify->recipient_id);
	            $ids             = '';
	            if (!empty($to_data->device_id)) {
	                $ids = array($to_data->device_id);
	            }
	            $send_array = array(
	                'send_to' => $ids,
	                'notification' => array(
	                    'notification_content' => '',
	                    'notification_title' => $me['name'],
	                    'notification_image' => $me['avatar'],
	                    'notification_data' => array(
	                        'user_id' => $user_id
	                    )
	                )
	            );
	            $notify->type_text = '';
	            $notificationText = $notify->text;
	            if (!empty($notify->type)) {
	                $notify->type_text  = lang($notify->type);
	            }
	            $user->setUserById($user_id);
	            $send_array['notification']['notification_content']     = $notify->type_text;
	            $send_array['notification']['notification_data']['url'] = $notify->url;
	            $send_array['notification']['notification_data']['user_data'] = $user->getUserDataById($user_id);
	            $send_array['notification']['notification_data']['notification_info'] = $notify;
	            $send_array['notification']['notification_data']['post_data'] = '';
	            if ($notify->type != 'followed_u') {
	            	$post_id = substr($notify->url, strpos($notify->url, 'post/') + 5);
	            	$posts   = new Posts();
	            	$post = $posts->setPostId($post_id)->postData();

	            	if (!empty($post)) {
						foreach ($post->media_set as $key => $value2) {
							$value2->file = media($value2->file);
			    			$value2->extra = media($value2->extra);
						}
						$post->comments = array();
						$user         = new User();
						$new_user = $user->getUserDataById($post->user_id);
						$post->name = $new_user->name;
						$post->avatar = media($post->avatar);
						$post->description = strip_tags($post->description);
						$post->time_text = time2str($post->time);
						$post->description  = $posts->tagifyHTags($post->description);
					}
					$send_array['notification']['notification_data']['post_data']      = $post;
	            }
	            $send       = SendPushNotification($send_array, 'native');
	            
	        }
	        $query_get_messages_for_push = $db->where('notifier_id',$user_id)->where('sent_push',0)->update(T_NOTIF,array('sent_push' => 1)); 
	    }
	    return true;
	}



}