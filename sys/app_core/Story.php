<?php 

class Story extends User{
	
	public function addStory($re_data = array()){
		if (empty($re_data) || !is_array($re_data)) {
			return false;
		}

		$id = self::$db->insert(T_STORY,$re_data);
		return $id;
	}

	public function getStories(){
		if (empty($this->user_id)) {
			return false;
		}

		$user_id = $this->user_id;
		$sql     = pxp_sqltepmlate('story/get.stories',array(
			't_story' => T_STORY,
			't_con' => T_CONNECTIV,
			't_views' => T_STORY_VIEWS,
			't_users' => T_USERS,
			'user_id' => $user_id
		));

		try {
			$stories = self::$db->rawQuery($sql);
		} 
		catch (Exception $e) {
			$stories = array();
		}

		$data = array();
		foreach ($stories as $key => $story_data) {
			$story_data->url = sprintf('%s/%s',self::$site_url,$story_data->username);
			$story_data->avatar = media($story_data->avatar);
			$story_data->name = $story_data->username;
			$story_data->owner = ($story_data->user_id == $user_id);
			
			if (!empty($story_data->fname) && !empty($story_data->lname)) {
				$story_data->name = sprintf('%s %s',$story_data->fname,$story_data->lname);
			}

			$data[] = $story_data;
		}	
		return $data;
	}

	public function getUserStory($so_id){
		if (empty(IS_LOGGED) || empty($so_id)) {
			return false;
		}

		$user_id = self::$me->user_id;
		$sql     = pxp_sqltepmlate('story/get.user.story',array(
			't_story' => T_STORY,
			't_views' => T_STORY_VIEWS,
			'so_id' => $so_id,
			'user_id' => $user_id,
			'is_owner' => ($user_id == $so_id),
			'is_not_owner' => ($user_id != $so_id),
		));

		try {
			$stories = self::$db->rawQuery($sql);
		} 
		catch (Exception $e) {
			$stories = array();
		}
		
		$data    = array();
		$owner   = (self::$me->user_id == $so_id);
		$seen    = false;

		foreach ($stories as $story_data) {
			$story_data->owner  = ($owner == true) ? true : false;
			$story_data->src    = media($story_data->media_file);

			if (empty($seen) && isset($story_data->is_seen) && $story_data->is_seen == 0) {
				$story_data->sf = true;
				$seen           = true;
			}

			$data[]             = $story_data;
		}

		if (empty($seen) && !empty($data[0])) {
			$active     = $data[0];
			$active->sf = true;
			$data[0]    = $active;
		}

		return $data;
	}

	public function deleteStory($story_id = false){
		if (empty($story_id) || empty($this->user_id)) {
			return false;
		}
		self::$db->where('id',$story_id);
		self::$db->where('user_id',$this->user_id);
		
		$story_data = self::$db->getOne(T_STORY,'media_file');
		$delete     = false;

		if (!empty($story_data)) {
			self::$db->where('id',$story_id);
			self::$db->where('user_id',$this->user_id);

			$delete     = self::$db->delete(T_STORY);
			$media_file = $story_data->media_file;
			if (file_exists($media_file)) {
				try {
					unlink($media_file);
				} 
				catch (Exception $e) {}
			}
		}

		return $delete;
	}

	public function regStoryViews($stories = array()){
		if (empty($stories)|| empty($this->user_id)) {
			return false;
		}

		$bool_val = false;
		if (is_array($stories)) {
			$insert_data = array();
			$this_user   = $this->user_id;
			foreach ($stories as $sid) {
				$insert_data[] = array(
					'story_id' => $sid,
					'user_id'  => $this_user,
					'time'     => time()
				);
			}
			try {
				self::$db->insertMulti(T_STORY_VIEWS,$insert_data);
				$bool_val = true;
			} 
			catch (Exception $e) {
				
			}	
		}

		return $bool_val;
	}

	public function canAddStory() {
		if (empty($this->user_id) || !is_numeric($this->user_id)) {
			return false;
		}

		$user_id = $this->user_id;
		$time    = strtotime("-24hours");

		self::$db->where('user_id',$user_id);
		self::$db->where('time',$time,'>=');
		
		$stories = self::$db->getValue(T_STORY,'COUNT(`id`)');
		return ($stories < 20);
	}
}