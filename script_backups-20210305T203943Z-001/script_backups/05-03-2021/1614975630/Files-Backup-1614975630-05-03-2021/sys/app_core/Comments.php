<?php 

/**
* Posts class, everything related to users.
*/

class Comments extends Posts{


	public function insertCommentLike($info = array()){
		if (empty($info) || empty($info['comment_id'])) {
			return false;
		}
		$like_id    = 0;
		$comment_id = Generic::secure($info['comment_id']);
		$user_id    = self::$me->user_id;
		if (!empty($info['user_id'])) {
			$user_id = Generic::secure($info['user_id']);
		}
		$like_id = self::$db->insert(T_COMMENTS_LIKES,array('comment_id' => $comment_id,
	                                       'user_id'    => $user_id));
		return $like_id;
	}

	public function addCommentReply($info = array()){
		$info['comment_id'] = Generic::secure($info['comment_id']);
		$info['user_id']    = self::$me->user_id;
		if (!empty($info['user_id'])) {
			$info['user_id'] = Generic::secure($info['user_id']);
		}

		if (!empty($info['text'])) {
			$this->upsertHtags($info['text']);
		}
		// self::$db->insert(T_ACTIVITIES,array('user_id' => $re_data['user_id'],
	 //                                         'comment_id' => $comment_id,
	 //                                         'type'    => 'commented_on_post',
	 //                                         'time'    => time()));

		return self::$db->insert(T_COMMENTS_REPLY,$info);
	}

	public function commentReplyData($id = 0){

		$t_users = T_USERS;
		$t_comms = T_COMMENTS_REPLY;

		self::$db->join("{$t_users} u","c.user_id = u.user_id ","INNER");
		self::$db->where("c.id",$id);
	   	$comment = self::$db->getOne("{$t_comms} c","c.id,c.user_id,c.comment_id,c.text,c.time,u.username,u.avatar");
		if (!empty($comment)) {
			$comment->is_owner = $this->isReplyOwner($id);
			$comment->text     = $this->likifyMentions($comment->text);
			$comment->text     = $this->linkifyHTags($comment->text);
			$comment->text     = $this->link_Markup($comment->text);
			$comment->likes    = self::$db->where('reply_id',$id)->getValue(T_COMMENTS_REPLY_LIKES,'COUNT(*)');
			$comment->is_liked = 0;
			if (self::$db->where('reply_id',$id)->where('user_id',self::$me->user_id)->getValue(T_COMMENTS_REPLY_LIKES,'COUNT(*)')) {
				$comment->is_liked = 1;
			}
		}
		return $comment;
	}

	public function isReplyOwner($reply_id = 0,$user_id = 0){

		if ((empty($user_id) || !is_numeric($user_id)) && IS_LOGGED) {
			$user_id = self::$me->user_id;
		}

		$reply = self::$db->where("id",$reply_id)->getOne(T_COMMENTS_REPLY);

	   	$comment = self::$db->where("id",$reply->comment_id)->getOne(T_POST_COMMENTS);

		if ($comment->user_id == self::$me->user_id || IS_ADMIN || $reply->user_id == self::$me->user_id) {
			return true;
		}
		return false;
	}

	public function get_comment_replies($comment_id,$limit = 0,$offset = 0){
		if (empty($comment_id)) {
			return false;
		}
		self::$db->where("comment_id",$comment_id);
		if (!empty($offset) && $offset > 0) {
			self::$db->where('id',$offset,'>');
		}
		
		if (!empty($limit) && $limit > 0) {
			$replies = self::$db->get(T_COMMENTS_REPLY,$limit);
		}
		else{
			$replies = self::$db->get(T_COMMENTS_REPLY);
		}
	   	
	   	$data = array();
	   	if (!empty($replies)) {
	   		foreach ($replies as $key => $reply) {
	   			$data[] = $this->commentReplyData($reply->id);
	   		}
	   	}
		return $data;
	}

	public function insertCommentReplyLike($info = array()){
		if (empty($info) || empty($info['reply_id'])) {
			return false;
		}
		$like_id    = 0;
		$reply_id = Generic::secure($info['reply_id']);
		$user_id    = self::$me->user_id;
		if (!empty($info['user_id'])) {
			$user_id = Generic::secure($info['user_id']);
		}
		$like_id = self::$db->insert(T_COMMENTS_REPLY_LIKES,array('reply_id' => $reply_id,
	                                                              'user_id'    => $user_id));
		return $like_id;
	}

	public function deleteCommentReply($reply_id){
		if (empty($reply_id)) {
			return false;
		}
		$reply_id = Generic::secure($reply_id);
	   	$reply = $this->commentReplyData($reply_id);
	   	if (!empty($reply)) {
	   		$comment = $this->postCommentData($reply->comment_id);
	   		if (!empty($comment) && ($comment->is_owner || $reply->is_owner)) {
	   			self::$db->where('id',$reply_id)->delete(T_COMMENTS_REPLY);
	   			self::$db->where('reply_id',$reply_id)->delete(T_COMMENTS_REPLY_LIKES);
	   			return true;
	   		}
	   	}
		return false;
	}

}