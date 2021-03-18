<?php 

class Admin extends User{
	public $pages = array();
	public $currp = 'dashboard';

	public function loadPage($path = ""){
		global $admin,$context,$config,$me;
		$admin = $this;
		$path  = self::secure($path);
		$cd    = $context; #short name of context data array
	    $page  = "admin-panel/pages/$path.phtml";

	    if (!file_exists($page)) {
	        die("File not Exists : $page");
	    }
		
	    $content = '';
	    ob_start();
	    require($page);
	    $content = ob_get_contents();
	    ob_end_clean();
	    return $content;
	}

	public function totalUsers(){
		return self::$db->getValue(T_USERS,'COUNT(`user_id`)');
	}

	public function totalPosts(){
		return self::$db->getValue(T_POSTS,'COUNT(`post_id`)');
	}

	public function totalVideos(){
		self::$db->where('type',array('youtube','vimeo','dailymotion','video'),"IN");
		return self::$db->getValue(T_POSTS,'COUNT(`post_id`)');
	}

	public function totalPhotos(){
		self::$db->where('type',array('image','gif'),"IN");
		return self::$db->getValue(T_POSTS,'COUNT(`post_id`)');
	}

	public function totalLikes(){
		return self::$db->getValue(T_POST_LIKES,'COUNT(`id`)');
	}

	public function onlineUsers(){
		self::$db->where('last_seen',(time() - 60),'>');
		return self::$db->getValue(T_USERS,'COUNT(`user_id`)');
	}

	public function totalComments(){
		return self::$db->getValue(T_POST_COMMENTS,'COUNT(`id`)');
	}

	public function totalMessages(){
		return self::$db->getValue(T_MESSAGES,'COUNT(`id`)');
	}

	public function userStatistic(){
		$months    = range(1, 12);
		$usr_statc = array();
		$date      = date('Y');
		foreach ($months as $value) {
	       $monthNum    = $value;
	       $dateObj     = DateTime::createFromFormat('!m', $monthNum);
	       $monthName   = $dateObj->format('F');
	       $new_users   = self::$db->where('registered', "$date/$value")->getValue(T_USERS, 'COUNT(`user_id`)');
	       $usr_statc[] = array('month' => $monthName, 'new_users' => $new_users);
	    }

	    return json_encode($usr_statc);
	}

	public function postStatistic(){
		$months    = range(1, 12);
		$pst_statc = array();
		$date      = date('Y');

		foreach ($months as $value) {
	       $monthNum    = $value;
	       $dateObj     = DateTime::createFromFormat('!m', $monthNum);
	       $monthName   = $dateObj->format('F');
	       $new_posts   = self::$db->where('registered', "$date/$value")->getValue(T_POSTS, 'COUNT(`user_id`)');
	       $pst_statc[] = array('month' => $monthName, 'new_posts' => $new_posts);
	    }

		return json_encode($pst_statc);
	}

	public function activeMenu($page = 'dashboard'){
		if ($page == $this->currp) {
			return 'active';
		}

		elseif (in_array($page, array_keys($this->pages)) && in_array($this->currp, $this->pages[$page])) {
			return 'active';
		}

		elseif ($page == $this->currp) {
			return 'active';
		}
	}

	public function updateSettings($up_data = array()){
		if (empty($up_data)) {
			return false;
		}

		foreach ($up_data as $name => $value) {
			try {
				self::$db->where('name', $name)->update(T_CONFIG,array('value' => $value));
			} 
			catch (Exception $e) {
				return false;
			}
		}

		return true;
	}

	function Pxp_UploadLogo($data = array(),$type = 'logo') {
	    if (isset($data['file']) && !empty($data['file'])) {
	        $data['file'] =  self::secure($data['file']);
	    }
	    if (isset($data['name']) && !empty($data['name'])) {
	        $data['name'] =  self::secure($data['name']);
	    }
	    if (isset($data['name']) && !empty($data['name'])) {
	        $data['name'] =  self::secure($data['name']);
	    }
	    if (empty($data)) {
	        return false;
	    }
	    $allowed           = 'jpg,png,jpeg,gif';
	    $new_string        = pathinfo($data['name'], PATHINFO_FILENAME) . '.' . strtolower(pathinfo($data['name'], PATHINFO_EXTENSION));
	    $extension_allowed = explode(',', $allowed);
	    $file_extension    = pathinfo($new_string, PATHINFO_EXTENSION);
	    if (!in_array($file_extension, $extension_allowed)) {
	        return false;
	    }
	    $dir      = "media/img/";
	    if ($type == 'fav') {
	    	$filename = $dir . "icon.{$file_extension}";
		    if (move_uploaded_file($data['file'], $filename)) {
		        if ($this->updateSettings(array('favicon_extension' => $file_extension))) {
		            return true;
		        }
		    }
	    } else if ($type == 'logo-light') {
            $filename = $dir . "light-logo.{$file_extension}";
            if (move_uploaded_file($data['file'], $filename)) {
                if ($this->updateSettings(array('logo_extension' => $file_extension))) {
                    return true;
                }
            }
        }
	    else{
	    	$filename = $dir . "logo.{$file_extension}";
		    if (move_uploaded_file($data['file'], $filename)) {
		        if ($this->updateSettings(array('logo_extension' => $file_extension))) {
		            return true;
		        }
		    }
	    }
	}
}