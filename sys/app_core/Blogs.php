<?php

/**
 * Blogs class, everything related to blogs.
 */

class Blogs extends User{
    protected $article_id = 0;

    public function all(){
        global $context;
        $posts = self::$db->get(T_BLOG,$this->limit);
        $data  = array();
        foreach ($posts as $key => $post_data) {
            $post_data['category_name'] = $context['lang'][$post_data['category']];
            $post_data['full_thumbnail'] = media($post_data['thumbnail']);
            $data[]    = $post_data;
        }
        return $data;
    }
	public function getLikes($type = 'up'){
		if (empty($this->$article_id)) {
			return false;
		}

		else if(!in_array($type, array('up','down'))){
			return false;
		}

		$post_id = $this->article_id;
		self::$db->where('post_id',$post_id);
		self::$db->where('type',$type);
		$likes   = self::$db->getValue(T_POST_LIKES,'COUNT(*)');

		return $likes;
	}
    public function likeBlog(){
		if (empty($this->article_id) || empty(IS_LOGGED)) {
			return false;
		}

		$user_id = self::$me->user_id;
		$post_id = (int)$this->article_id;
        $code    = 0;
		if ($this->isLiked()) {
			self::$db->where('post_id',$post_id);
			self::$db->where('user_id',$user_id);
			self::$db->delete(T_BLOG_LIKES);
			//self::$db->where('user_id' , $user_id)->where('post_id' , $post_id)->where('type' ,'liked__post')->delete(T_ACTIVITIES);
			$code = -1;
		}
		else{
			$insert = self::$db->insert(T_BLOG_LIKES,array(
				'post_id' => $post_id,
				'user_id' => $user_id,
				'time'    => time()
			));
			// self::$db->insert(T_ACTIVITIES,array('user_id' => $user_id,
	        //                                  'post_id' => $post_id,
	        //                                  'type'    => 'liked__post',
	        //                                  'time'    => time()));

			if (is_numeric($insert)) {
				$code = 1;
			}
		}

		return $code;
    }
    public function setBlogId($post_id = 0){
		$this->article_id = self::secure($post_id);

		if (empty($this->article_id) || !is_numeric($this->article_id)) {
			$this->throwError("Invalid argument: Post id must be a positive integer");
		}

		return $this;
	}
    public function addPostComment($re_data = array()){
		$re_data['post_id'] = $this->article_id;
		$re_data['user_id'] = self::$me->user_id;

		if (!empty($re_data['text'])) {
			$this->upsertHtags($re_data['text']);
		}
		// self::$db->insert(T_ACTIVITIES,array('user_id' => $re_data['user_id'],
	    //                                      'post_id' => $re_data['post_id'],
	    //                                      'type'    => 'commented_on_post',
	    //                                      'time'    => time()));

		return self::$db->insert(T_BLOG_COMMENTS,$re_data);
    }
    public function likifyMentions($text = ""){
		$text = preg_replace_callback('/(?:^|\s|,)\B@([a-zA-Z0-9_]{4,32})/is', function($m){
			$uname = $m[1];
			if ($this->userNameExists($uname)) {
				return self::createHtmlEl('a',array(
					'href' => sprintf("%s/%s",self::$site_url,$uname),
					'target' => '_blank',
					'class' => 'mention',
				),"@$uname");
			}
			else{
				return "@$uname";
			}
		}, $text);

		return $text;
	}
	public function tagifyHTags($text = ""){
		if (!empty($text) && is_string($text)) {
			preg_match_all('/(#\[([0-9]+)\])/i', $text, $matches);
			$matches = (!empty($matches[2])) ? $matches[2] : array();

			if (!empty($matches)) {		
				$htags = self::$db->where('id',$matches,"IN")->get(T_HTAGS,null,array('id','tag'));
				if (!empty($htags)) {
					foreach ($htags as $htag) {
						$text = str_replace("#[{$htag->id}]", "#{$htag->tag}", $text);
					}
				}
			}
		}

	    return $text;
	}
	public function linkifyDescription($text =""){
        if (!empty($text) && is_string($text)) {
            preg_match_all('/(?:(?:https?|ftp|file):\/\/|www\.|ftp\.)(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[-A-Z0-9+&@#\/%=~_|$?!:,.])*(?:\([-A-Z0-9+&@#\/%=~_|$?!:,.]*\)|[A-Z0-9+&@#\/%=~_|$])/im', $text, $matches, PREG_SET_ORDER, 0);
            foreach ($matches as $match) {
                if( $match[0] !== 'http://' && $match[0] !== 'https://' ) {
                    if (preg_match("/http(|s)\:\/\//", $match[0])) {
                        $text = str_replace( $match[0] , '<a href="' . strip_tags($match[0]) . '" target="_blank" class="hash" rel="nofollow">' . $match[0] . '</a>', $text);
                    }
                }
            }
        }
        return $text;
    }
    public function postCommentData($id = 0){

		$t_users = T_USERS;
		$t_comms = T_BLOG_COMMENTS;

		self::$db->join("{$t_users} u","c.user_id = u.user_id ","INNER");
		self::$db->where("c.id",$id);
	   	$comment = self::$db->getOne("{$t_comms} c","c.id,c.user_id,c.post_id,c.text,c.time,u.username,u.avatar");
		if (!empty($comment)) {
			$comment->is_owner = $this->isCommentOwner($id);
			$comment->text     = $this->likifyMentions($comment->text);
			$comment->text     = $this->linkifyHTags($comment->text);
			$comment->text     = $this->link_Markup($comment->text);
			$comment->likes    = 0;//self::$db->where('comment_id',$id)->getValue(T_COMMENTS_LIKES,'COUNT(*)');
			$comment->is_liked = 0;
			// if (self::$db->where('comment_id',$id)->where('user_id',self::$me->user_id)->getValue(T_COMMENTS_LIKES,'COUNT(*)')) {
			// 	$comment->is_liked = 1;
			// }
			//$comment->replies    = self::$db->where('comment_id',$id)->getValue(T_COMMENTS_REPLY,'COUNT(*)');
		}
		return (array)$comment;
    }
    public function isCommentOwner($comment_id = 0,$user_id = 0){

		if ((empty($user_id) || !is_numeric($user_id)) && IS_LOGGED) {
			$user_id = self::$me->user_id;
		}

		$comment = self::$db->where("id",$comment_id)->getOne(T_BLOG_COMMENTS);

		if ( IS_ADMIN || $comment->user_id == self::$me->user_id) {
			return true;
		}
		return false;
    }
    public function deletePostComment($comment_id = 0){
		$comment = self::$db->where("id",$comment_id)->getOne(T_BLOG_COMMENTS);
		//self::$db->where('comment_id',$comment_id)->delete(T_COMMENTS_LIKES);
		//$comment_object = new Comments();
		//$replies = $comment_object->get_comment_replies($comment_id);
		//foreach ($replies as $key => $reply) {
		//	self::$db->where('reply_id',$reply->id)->delete(T_COMMENTS_REPLY_LIKES);
		//}
        //self::$db->where('comment_id',$comment_id)->delete(T_COMMENTS_REPLY);
		//self::$db->where('user_id' , $comment->user_id)->where('post_id' , $comment->post_id)->where('type' ,'commented_on_post')->delete(T_ACTIVITIES);
		self::$db->where("id",$comment_id);
		return self::$db->delete(T_BLOG_COMMENTS);
    }
    public function isLiked(){

		if (empty($this->article_id) || empty(IS_LOGGED)) {
			return false;
		}

		$user_id = self::$me->user_id;
		$post_id = $this->article_id;

		self::$db->where('post_id',$post_id);
		self::$db->where('user_id',$user_id);
		$likes   = self::$db->getValue(T_BLOG_LIKES,"COUNT(*)");

		return ($likes > 0);
    }
    public function getBlogComments($offset = false){
		if (empty($this->article_id)) {
			return false;
		}

		if ($offset && is_numeric($offset)) {
			self::$db->where('id',$offset,'<');
		}

		self::$db->where('post_id',$this->article_id)->orderBy('id','DESC');

		$commset  = self::$db->get(T_BLOG_COMMENTS,20,array('id'));
		$comments = array();

		if (!empty($commset)) {
			foreach ($commset as $key => $comment) {
				$comments[] = $this->postCommentData($comment->id);
			}
		}

		return $comments;
	}
}