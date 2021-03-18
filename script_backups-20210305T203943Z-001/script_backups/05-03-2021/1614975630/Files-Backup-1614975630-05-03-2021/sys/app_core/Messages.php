<?php 

class Messages extends User{

	public function getMessages($to_id = false,$offset = false,$new = false,$order = 'ASC',$e = '>'){
		if (empty($to_id) || !is_numeric($to_id)) {
			return false;
		}

		else if(empty($this->user_id) || !is_numeric($this->user_id)){
			return false;
		}

		$data    = array();
		$user_id = $this->user_id;
		$update  = array();
		$sql     = pxp_sqltepmlate('chat/get.conversation.data',array(
			't_messages' => T_MESSAGES,
			'offset' => $offset,
			'from_id' => $user_id,
			'to_id' => $to_id,
			'new' => $new,
			'total_limit' => $this->limit,
			'order' => $order,
			'E' => $e
		));

		try {
			$messages = self::$db->rawQuery($sql);
		} 
		catch (Exception $e) {
			$messages = array();
		}

		if (is_array($messages) && count($messages) > 0) {

			foreach ($messages as $message) {
				if (empty($message->seen)) {
					$update[] = $message->id;
				}

				$message->text = $this->linkifyHTags($message->text);
			}

			if (!empty($update)) {
				self::$db->where('id',$update,"IN");
				self::$db->update(T_MESSAGES,array(
					'seen' => time()
				));
			}

			

			$data = $messages;
		}

		return $data;
	}

	public function messageData($msg_id = false){
		if (empty($msg_id) || !is_numeric($msg_id)) {
			return false;
		}

		self::$db->where('`id`',$msg_id);
		$mssg = array();
		$data = self::$db->getOne(T_MESSAGES);
		if (!empty($data)) {
			$data->text = $this->linkifyHTags($data->text);
			$mssg       = $data;
		}
		
		return $mssg;
	}


	public function sendMessage($re_data = array()){
		if (empty($re_data) || !is_array($re_data)) {
			return false;
		}

		$msg_id   = self::$db->insert(T_MESSAGES,$re_data);
		$msg_data = null;
		$from_id  = $re_data['from_id'];
		$to_id    = $re_data['to_id'];

		if (!empty($msg_id)) {
			$msg_data = $this->messageData($msg_id);
		}

		$this->createChat($from_id,$to_id);

		return $msg_data;
	}

	public function createChat($from_id = null,$to_id = null){
		if (empty(IS_LOGGED) || empty($from_id) || empty($to_id)) {
			return false;
		}

		$time    = time();
		$t_chats = T_CHATS;

		self::$db->where('from_id',$from_id);
		self::$db->where('to_id',$to_id);
		$chat1   = self::$db->getValue(T_CHATS,"COUNT(id)");

		if (empty($chat1)) {

			self::$db->insert(T_CHATS,array('from_id' => $from_id,'to_id' => $to_id,'time' => $time));

			self::$db->where('from_id',$to_id);
			self::$db->where('to_id',$from_id);
			$chat2 = self::$db->getValue(T_CHATS,"COUNT(id)");
			if (empty($chat2)) {
				self::$db->insert(T_CHATS,array('to_id' => $from_id,'from_id' => $to_id,'time' => $time));
			}
		}
		else{
			self::$db->where('from_id',$from_id);
			self::$db->where('to_id',$to_id);
			self::$db->update(T_CHATS,array('time' => $time));

			self::$db->where('from_id',$to_id);
			self::$db->where('to_id',$from_id);
			$chat2 = self::$db->getValue(T_CHATS,"COUNT(id)");
			if (empty($chat2)) {
				self::$db->insert(T_CHATS,array('to_id' => $from_id,'from_id' => $to_id,'time' => $time));
			}
			else{
				self::$db->where('from_id',$to_id);
				self::$db->where('to_id',$from_id);
				self::$db->update(T_CHATS,array('time' => $time));
			}
		}
	}

	public function getChats($offset = false){
		if(empty($this->user_id) || !is_numeric($this->user_id)){
			return false;
		}

		$data    = array();
		$user_id = $this->user_id;
		$sql     = pxp_sqltepmlate('chat/get.chat.history',array(
			't_messages' => T_MESSAGES,
			't_chats' => T_CHATS,
			't_users' => T_USERS,
			't_blocks' => T_PROF_BLOCKS,
			'offset' => $offset,
			'user_id' => $user_id,
			'total_limit' => $this->limit
		));

		try {
			$chats = self::$db->rawQuery($sql);
		} 
		catch (Exception $e) {
			$chats = array();
		}
		
		if (!empty($chats)) {
			$data = $chats;
		}

		return $data;
	}

	public function deleteChat($to_id = null){
		if (empty($this->user_id) || empty($to_id)) {
			return false;
		}

		$user_id = $this->user_id;
		self::$db->where('from_id',$user_id);
		self::$db->where('to_id',$to_id);
		self::$db->update(T_MESSAGES,array('deleted_fs1' => '1'));

		self::$db->where('to_id',$user_id);
		self::$db->where('from_id',$user_id);
		self::$db->update(T_MESSAGES,array('deleted_fs2' => '1'));

		self::$db->where('from_id',$user_id);
		self::$db->where('to_id',$to_id);
		return self::$db->delete(T_CHATS);
	}

	public function clearChat($to_id = null){
		if (empty($this->user_id) || empty($to_id)) {
			return false;
		}

		$user_id = $this->user_id;
		self::$db->where('from_id',$user_id);
		self::$db->where('to_id',$to_id);
		$q1 = self::$db->update(T_MESSAGES,array('deleted_fs1' => '1'));

		self::$db->where('to_id',$user_id);
		self::$db->where('from_id',$to_id);
		$q2 = self::$db->update(T_MESSAGES,array('deleted_fs2' => '1'));

		// self::$db->where('to_id',$to_id);
		// $q2 = self::$db->update(T_MESSAGES,array('deleted_fs2' => '1'));

		return ($q1 && $q2);
	}

	public function deleteMessages($to_id = null,$messages = array()){
		if (empty($this->user_id) || empty($to_id)) {
			return false;
		}

		$user_id = $this->user_id;
		self::$db->where('id',$messages,"IN");
		self::$db->where('from_id',$user_id);
		$q1 = self::$db->update(T_MESSAGES,array('deleted_fs1' => '1'));
		
		self::$db->where('id',$messages,"IN");
		self::$db->where('to_id',$user_id);
		$q2 = self::$db->update(T_MESSAGES,array('deleted_fs2' => '1'));

		return ($q1 && $q2);
	}

	public function countNewMessages(){
		if (empty($this->user_id)) {
			return false;
		}

		$user_id = $this->user_id;
		self::$db->where('to_id',$user_id);
		self::$db->where('seen',0);
		return self::$db->getValue(T_MESSAGES,"COUNT(`id`)");
	}
}