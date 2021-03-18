<?php 
/**
 * 
 */
class PostsEndPoint extends Generic
{
	
	function __construct($api_resource_id)
	{
		switch ($api_resource_id) {
			case 'fetch_comments':
				self::fetch_comments_();
				break;
			case 'fetch_likes':
				self::fetch_likes_();
				break;
			case 'fetch_featured_posts':
				self::fetch_featured_posts_();
				break;
			case 'new_post_image':
				self::new_post_image_();
				break;
			case 'new_post_video':
				self::new_post_video_();
				break;
			case 'new_post_gif':
				self::new_post_gif_();
				break;
			case 'new_post':
				self::new_post__();
				break;
			case 'add_to_favorite':
				self::add_to_favorite_();
				break;
			case 'fetch_favorites':
				self::fetch_favorites_();
				break;
			case 'fetch_explore':
				self::fetch_explore_();
				break;
			case 'fetch_hash_posts':
				self::fetch_hash_posts_();
				break;
			case 'fetch_user_posts':
				self::fetch_user_posts_();
				break;
			case 'like_post':
				self::like_post_();
				break;
			case 'add_comment':
				self::add_comment_();
				break;
			case 'delete_comment':
				self::delete_comment_();
				break;
			case 'fetch_home_posts':
				self::fetch_home_posts_();
				break;
			case 'delete_post':
				self::delete_post_();
				break;
			case 'report_post':
				self::report_post_();
				break;
			case 'edit_post':
				self::edit_post_();
				break;
			case 'fetch_post_by_id':
				self::fetch_post_by_id_();
				break;
			case 'add_reply':
				self::add_reply_();
				break;
			case 'like_comment':
				self::like_comment_();
				break;
			case 'like_reply':
				self::like_reply_();
				break;
			case 'fetch_comment_reply':
				self::fetch_comment_reply_();
				break;
			case 'delete_reply':
				self::delete_reply_();
				break;
			case 'boost':
				self::boost_();
				break;
			case 'get_boost':
				self::get_boost_();
				break;
			case 'get_user_boosted_posts':
				self::get_user_boosted_posts_();
				break;
			case 'get_featured_post':
				self::get_featured_post();
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

	private function get_featured_post(){
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
    	}else{
			$posts   = new Posts();
			$FeaturedPosts   = $posts->getFeaturedPosts();
			foreach ($FeaturedPosts as $value) {
				$value->time_text = time2str($value->time);
    			$value->file = media($value->file);
    			$user         = new User();
				$new_user = $user->getUserDataById($value->user_id);
				$value->user = $new_user;
    		}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'         => $FeaturedPosts
		    );
		    self::json($response_data);
		}
	}

	private function fetch_comments_()
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
    	elseif (empty($_POST['post_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the post id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$posts   = new Posts();
			$posts->comm_limit = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 30;
			$post_id = $_POST['post_id'];
			$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
			$comments   = $posts->setPostId($post_id)->getPostComments($offset);
			foreach ($comments as $value) {
				$value->time_text = time2str($value->time);
    			$value->avatar = media($value->avatar);
    			$value->text = strip_tags($value->text);
    			$user         = new User();
				$new_user = $user->getUserDataById($value->user_id);
				$value->name = $new_user->name;
    		}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'         => $comments
		    );
		    self::json($response_data);
    	}
	}


	private function fetch_likes_()
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
    	elseif (empty($_POST['post_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the post id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$posts   = new Posts();
			$post_id = $_POST['post_id'];
			$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : '';
			$limit = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 30;
			$likes   = $posts->setPostId($post_id)->getLikedUsers($offset,$limit);
			foreach ($likes as $value) {
    			$value->avatar = media($value->avatar);
    			$value->time_text = time2str($value->time);
    			$user         = new User();
    			$user->setUserById($value->user_id);
				$user_data = $user->getUserDataById($value->user_id);
				$value->name = $user_data->name;
				$value->user_data = $user_data;
    		}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'     => $likes
		    );
		    self::json($response_data);
    	}
	}


	private function fetch_featured_posts_()
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

    		$posts   = new Posts();
    		$posts->comm_limit = 5;
			$trending = $posts->getFeaturedPosts();
			$r_data   = array();
			foreach ($trending as $value) {
				
				$images = array();
				$posts->setPostId($value->post_id);
				$post = $posts->postData();
				$user         = new User();
				$new_user = $user->getUserDataById($value->user_id);
				$post->name = $new_user->name;
				foreach ($post->media_set as $key => $value2) {
					$value2->file = media($value2->file);
	    			$value2->extra = media($value2->extra);
				}
				foreach ($post->comments as $key => $comment) {
					$comment->avatar = media($comment->avatar);
					$comment->text = strip_tags($comment->text);
					$comment->time_text = time2str($comment->time);
					$comment->text  = $posts->tagifyHTags($comment->text);
					$user         = new User();
					$new_user = $user->getUserDataById($comment->user_id);
					$comment->name = $new_user->name;
				}
    			$post->avatar = media($post->avatar);
    			$post->description = strip_tags($post->description);
    			$post->time_text = time2str($post->time);
    			$post->description  = $posts->tagifyHTags($post->description);
    			$r_data[] = $post;

    		}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'     => $r_data
		    );
		    self::json($response_data);
    	}
	}

	private function new_post__($value='')
	{
		global $me,$config;
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
    		if (!empty($_FILES['images'])) {
				self::new_post_image_();
			}
			elseif (!empty($_FILES['video'])) {
				self::new_post_video_();
			}
			elseif (!empty($_POST['gif_url'])) {
				self::new_post_gif_();
			}
			elseif (!empty($_POST['video_url'])) {
				self::new_post_embed_video_();
			}
			else{
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
    	}
	}


	private function new_post_image_()
	{
		global $me,$config;
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
    	elseif ($config['upload_images'] != 'on') {
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
    	elseif (empty($_FILES['images'])) {
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
    	else{
    		$images  = px_multiple_files($_FILES['images']);
			$media   = new Media();
			$posts   = new Posts();
			$notif   = new Notifications();
			$uploads = array();
			$attach  = $_POST['attach'];
			$up_size = 0;
			$mx_size = $config['max_upload'];

			foreach ($images as $image){
				$up_size += $image['size'];
			}

			if ($up_size <= $mx_size) {
				foreach ($images as $key => $image) {

					if ($media->isImage($image['tmp_name'])) {
						$file_info = array(
							'file' => $image['tmp_name'],
							'name' => $image['name'],
							'size' => $image['size'],
							'type' => $image['type'],
							'allowed' => 'jpeg,jpg,png,webp,gif',
						);
						
						if (count($images) > 1) {
							$file_info['crop'] = array(
								'width' => 600,
								'height' => 600
							);
						}

						$media->setFile($file_info);
						$upload = $media->uploadFile();

						
						if (!empty($upload['filename'])) {
							$uploads[] = $upload['filename']; 
						}
					}
				}

				if (!empty($uploads)) {
					$re_data = array(
						'user_id' => $me['user_id'],
						'time' => time(),
						'type' => 'image',
					);

					if (!empty($_POST['caption'])) {
						$text = Generic::cropText($_POST['caption'],$config['caption_len']);
						$re_data['description'] = $text;
					}

					$post_id = $posts->insertPost($re_data);

					if (is_numeric($post_id)) {
						foreach ($uploads as $key => $file) {
							$re_data = array(
								'post_id' => $post_id,
								'file' => $file,
							);
							$posts->insertMedia($re_data);
						}


						$posts->setPostId($post_id);
						$post_data = o2array($posts->postData());

						#Notify mentioned users
						$notif->notifyMentionedUsers($_POST['caption'],pid2url($post_id));
						$response_data       = array(
					        'code'     => '200',
						    'status'   => 'OK',
						    'id' => $post_id,
					        'message' => 'Your post has been published successfully'
					    );
					    self::json($response_data);
					}
				}
				else{
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
			else{
				$mx_size         = $mx_size;
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '22',
			            'error_text' => str_replace('{{size}}', $mx_size, 'Your post exceeds the maximum upload size for this site. Maximum upload size: {{size}}')
			        )
			    );
			    self::json($response_data);
			}
    	}
	}




	private function new_post_video_()
	{
		global $me,$config;
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
    	elseif ($config['upload_videos'] != 'on') {
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
    	elseif (empty($_FILES['video'])  && !empty($_FILES['thumb'])) {
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
    	else{
    		$media  = new Media();
			$posts  = new Posts();
			$notif   = new Notifications();

			$media->setFile(array(
				'file' => $_FILES['video']['tmp_name'],
				'name' => $_FILES['video']['name'],
				'size' => $_FILES['video']['size'],
				'type' => $_FILES['video']['type'],
				'allowed' => 'mp4,mov,3gp,webm',
			));

			$video = $media->uploadFile();

			$media->setFile(array(
				'file' => $_FILES['thumb']['tmp_name'],
				'name' => $_FILES['thumb']['name'],
				'size' => $_FILES['thumb']['size'],
				'type' => $_FILES['thumb']['type'],
				'allowed' => 'jpeg,jpg,png',
				'crop' => array(
					'width' => '600',
					'height' => '400',
				)
			));

			$image = $media->uploadFile();
			if (!empty($video['filename']) && !empty($image['filename'])) {
	            
	            $re_data = array(
	            	'user_id' => $me['user_id'],
	            	'time' => time(),
	            	'type' => 'video',
	            );

	            if (!empty($_POST['caption'])) {
					$text = Generic::cropText($_POST['caption'],500);
					$re_data['description'] = $text;
				}

				$post_id = $posts->insertPost($re_data);

				if (is_numeric($post_id)) {
					$re_data = array(
						'post_id' => $post_id,
						'file' => $video['filename'],
						'extra' => $image['cname'],
					);

					$posts->setPostId($post_id);
					$posts->insertMedia($re_data);
		
					$post_data = o2array($posts->postData());

					#Notify mentioned users
					$notif->notifyMentionedUsers($_POST['caption'],pid2url($post_id));
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
					    'id' => $post_id,
				        'message' => 'Your post has been published successfully'
				    );
				    self::json($response_data);

				}
				else{
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
			else{
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






	private function new_post_gif_()
	{
		global $me,$config;
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
    	elseif ($config['upload_images'] != 'on') {
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
    	elseif (empty($_POST['gif_url'])) {
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
    	else{
    		$media  = new Media();
    		$posts = new Posts();
			$notif = new Notifications();


			if (Generic::isUrl($_POST['gif_url'])) {
	            $gif_url = urlencode($_POST['gif_url']);

	            $img = $media->ImportImageAndCrop($_POST['gif_url'],'gif');
	            if (!empty($img['extra'])) {
	            	$re_data = array(
		            	"user_id" => $me['user_id'],
		            	"time" => time(),
		            	"type" => 'gif',
		            );

		            if (!empty($_POST['caption'])) {
						$text = Generic::cropText($_POST['caption'],$config['caption_len']);
						$re_data['description'] = $text;
					}

					$post_id = $posts->insertPost($re_data);

					if (is_numeric($post_id)) {
						$re_data = array(
							'post_id' => $post_id,
							'file' => $gif_url,
							'extra' => $img['extra']
						);

						$posts->setPostId($post_id);
						$posts->insertMedia($re_data);


						#Notify mentioned users
						$notif->notifyMentionedUsers($_POST['caption'],pid2url($post_id));

						$response_data       = array(
					        'code'     => '200',
						    'status'   => 'OK',
						    'id' => $post_id,
					        'message' => 'Your post has been published successfully'
					    );
					    self::json($response_data);
		            }
		            else{
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
	            else{
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

	private function new_post_embed_video_()
	{
		global $me,$config;
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
    	elseif (empty($_POST['video_url'])) {
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
    	else{
    		$posts = new Posts();
			$notif = new Notifications();
			$embed = new Embed();
    		$is_video = false;
    		$type     = '';
    		$video_id = 0 ;
    		preg_match_all('/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/', $_POST['video_url'],$match_youtube);
    		preg_match_all('/^https?:\/\/vimeo\.com\/([0-9]+)\/{0,1}$/', $_POST['video_url'],$match_vimeo);
    		preg_match_all('/^(?:https?:\/\/)?www\.dailymotion\.com\/video\/([a-zA-Z0-9_]+)\/?$/', $_POST['video_url'],$match_dailymotion);
    		if (!empty($match_youtube[7])) {
    			$is_video = true;
    			$type     = 'youtube';
    			$video_id = $match_youtube[7][0] ;
    		}
    		elseif (!empty($match_vimeo[1])) {
    			$is_video = true;
    			$type     = 'vimeo';
    			$video_id = $match_vimeo[1][0] ;
    		}
    		elseif (!empty($match_dailymotion[1])) {
    			$is_video = true;
    			$type     = 'dailymotion';
    			$video_id = $match_dailymotion[1][0] ;
    		}
    		else{
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

    		if ($is_video == true) {
    			$url     = ((Generic::isUrl($_POST['video_url'])) ? $_POST['video_url'] : '');

    			$re_data = array(
	            	"user_id" => $me['user_id'],
	            	"link" => $url,
	            	"time" => time(),
	            	"type" => $type,
	            	"$type" => $video_id
	            );

	            if (!empty($_POST['caption'])) {
					$text = Generic::cropText($_POST['caption'],$config['caption_len']);
					$re_data['description'] = $text;
				}
				$post_id = $posts->insertPost($re_data);
				$re_data = array(
					'post_id' => $post_id,
				);

				try {
	            	$em_data = $embed->fetchVideo($url);
	            } 
	            catch (Exception $e) {
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

            	if (!empty($em_data['images'])) {
            		$re_data['file'] = $em_data['images']['filename'];
            		$re_data['extra'] = $em_data['images']['extra'];
	            	$posts->insertMedia($re_data);
            	}

				#Notify mentioned users
				$notif->notifyMentionedUsers($_POST['caption'],pid2url($post_id));

				if ($post_id > 0) {
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
					    'id' => $post_id,
				        'message' => 'Your post has been published successfully'
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



	private function add_to_favorite_()
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
    	elseif (empty($_POST['post_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the post id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
			$post_id = $_POST['post_id'];
			$posts   = new Posts();

			$posts->setPostId($post_id);
			
			$code            = $posts->savePost();
			$code            = ($code == -1) ? 0 : 1;
			if ($code == 0) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'type'     => $code,
			        'message'  => 'Post removed from your favourites list'
			    );
			    self::json($response_data);
			}
			else{
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'type'     => $code,
			        'message'  => 'Post added to your favourites list'
			    );
			    self::json($response_data);
			}
    	}
	}



	private function fetch_favorites_()
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
    		$posts   = new Posts();
    		$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 15;
    		$posts->limit = $limit;
    		$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : '';
    		$posts->comm_limit = 5;
			$favorite_posts = $posts->getSavedPosts($offset);
			$r_data   = array();
			foreach ($favorite_posts as $value) {
				$images = array();
				$posts->setPostId($value->post_id);
				$post = $posts->postData();
				foreach ($post->media_set as $key => $value2) {
					$value2->file = media($value2->file);
	    			$value2->extra = media($value2->extra);
				}
				foreach ($post->comments as $key => $comment) {
					$comment->avatar = media($comment->avatar);
					$comment->text = strip_tags($comment->text);
					$comment->time_text = time2str($comment->time);
					$comment->text  = $posts->tagifyHTags($comment->text);
					$user         = new User();
					$new_user = $user->getUserDataById($comment->user_id);
					$comment->name = $new_user->name;
				}
				$user         = new User();
				$new_user = $user->getUserDataById($post->user_id);
				$post->name = $new_user->name;
    			$post->avatar = media($post->avatar);
    			$post->description = strip_tags($post->description);
    			$post->time_text = time2str($post->time);
    			$post->description  = $posts->tagifyHTags($post->description);
    			$r_data[] = $post;

    		}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $r_data
		    );
		    self::json($response_data);
    	}
	}


	private function fetch_explore_()
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
    		$posts   = new Posts();
    		$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 15;
    		$posts->limit = $limit;
    		$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : '';
    		$posts->comm_limit = 5;
			$explorePosts = $posts->explorePosts($offset);
			$r_data   = array();
			foreach ($explorePosts as $value) {
                if($value->post_id > 0) {
                    $images = array();
                    $posts = new Posts();
                    $posts->setPostId($value->post_id);
                    $post = $posts->postData();
                    if (!empty($post->media_set)) {
                        foreach ($post->media_set as $key => $value2) {
                            $value2->file = media($value2->file);
                            $value2->extra = media($value2->extra);
                        }
                    }
                    if (!empty($post->comments)) {
                        foreach ($post->comments as $key => $comment) {
                            $comment->avatar = media($comment->avatar);
                            $comment->text = strip_tags($comment->text);
                            $comment->time_text = time2str($comment->time);
                            $comment->text = $posts->tagifyHTags($comment->text);
                            $user = new User();
                            $new_user = $user->getUserDataById($comment->user_id);
                            $comment->name = $new_user->name;
                        }
                    }
                    $user = new User();
                    $new_user = $user->getUserDataById($post->user_id);
                    $post->name = $new_user->name;
                    $post->avatar = media($post->avatar);
                    $post->description = strip_tags($post->description);
                    $post->time_text = time2str($post->time);
                    $post->description = $posts->tagifyHTags($post->description);
                    $r_data[] = $post;
                }
    		}
    		$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $r_data
		    );
		    self::json($response_data);
    	}
	}




	private function fetch_hash_posts_()
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
    	elseif (empty($_POST['hash'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '32',
		            'error_text' => 'Please the hash can not be empty'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$posts   = new Posts();
    		$hash    = Generic::secure($_POST['hash']);
			$hash_id = $posts->getHtagId($hash);
    		$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 15;
    		$posts->limit = $limit;
    		$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : '';
    		$posts->comm_limit = 5;
    		$r_data   = array();
    		if (!empty($hash_id)) {
				$exploreTags = $posts->exploreTags($hash_id,$offset);
				
				foreach ($exploreTags as $value) {
					$images = array();
					$posts->setPostId($value->post_id);
					$post = $posts->postData();
					foreach ($post->media_set as $key => $value2) {
						$value2->file = media($value2->file);
		    			$value2->extra = media($value2->extra);
					}
					foreach ($post->comments as $key => $comment) {
						$comment->avatar = media($comment->avatar);
						$comment->text = strip_tags($comment->text);
						$comment->time_text = time2str($comment->time);
						$comment->text  = $posts->tagifyHTags($comment->text);
						$user         = new User();
						$new_user = $user->getUserDataById($comment->user_id);
						$comment->name = $new_user->name;
					}
					$user         = new User();
					$new_user = $user->getUserDataById($post->user_id);
					$post->name = $new_user->name;
	    			$post->avatar = media($post->avatar);
	    			$post->description = strip_tags($post->description);
	    			$post->time_text = time2str($post->time);
	    			$post->description  = $posts->tagifyHTags($post->description);
	    			$r_data[] = $post;

	    		}
	    	}
    		$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $r_data
		    );
		    self::json($response_data);
    	}
	}



	private function fetch_user_posts_()
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
            $user_id = Generic::secure($_POST['user_id']);
            $posts   = new Posts();
            $user    = new User();
            $posts->comm_limit = 5;
            //$is_blocked  = $user->isBlocked($user_id,true);
            $data    = array();
   //          if ($is_blocked) {
			// 	$response_data       = array(
			//         'code'     => '200',
			// 	    'status'   => 'OK',
			// 	    'data'     => $data
			//     );
			//     self::json($response_data);
			// }
    		$user->setUserById($user_id);
    		$posts->setUserById($user_id);
    		$new_user = $user->userData($user->getUser());
    		$new_user->avatar = media($new_user->avatar);
    		$new_user->cover = media($new_user->cover);
			unset($new_user->password);
			unset($new_user->edit);
			unset($new_user->login_token);
			$new_user->time_text = time2str($new_user->last_seen);
			$data['user_data']         = $new_user;
			$data['total_posts']       = $posts->countPosts();
			$data['user_followers']    = $user->countFollowers();
			$data['user_following']    = $user->countFollowing();
			$data['profile_privacy']   = $user->profilePrivacy($user_id);
			$data['chat_privacy']      = $user->chatPrivacy($user_id);
			$data['is_owner']          = false;
			if (IS_LOGGED && ($me['user_id'] == $user_id)) {
				$data['is_owner'] = true;
			}
			if (IS_LOGGED) {
				$data['is_following'] = $user->isFollowing($user_id);
				$data['is_reported']  = $user->isUserRepoted($user_id);
				$data['is_blocked']   = $user->isBlocked($user_id);
				$data['ami_blocked'] = $user->isBlocked($user_id,true);
			}
			$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 15;
    		$posts->limit = $limit;
    		$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
			$user_posts   = $posts->getUserPosts($offset);

			$n_data = array();
			foreach ($user_posts as $value) {
				$images = array();
				$posts->setPostId($value->post_id);
				$post = $posts->postData();
				
				foreach ($post->media_set as $key => $value2) {
					$value2->file = media($value2->file);
	    			$value2->extra = media($value2->extra);
				}
				foreach ($post->comments as $key => $comment) {
					$comment->avatar = media($comment->avatar);
					$comment->text = strip_tags($comment->text);
					$comment->time_text = time2str($comment->time);
					$comment->text  = $posts->tagifyHTags($comment->text);
					$user         = new User();
					$new_user = $user->getUserDataById($comment->user_id);
					$comment->name = $new_user->name;
				}
				$user         = new User();
				$new_user = $user->getUserDataById($post->user_id);
				$post->name = $new_user->name;
    			$post->avatar = media($post->avatar);
    			$post->description = strip_tags($post->description);
    			$post->time_text = time2str($post->time);
    			$post->description  = $posts->tagifyHTags($post->description);
    			$n_data[] = $post;
    		}
    		$data['user_posts'] = $n_data;


    		$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $data
		    );
		    self::json($response_data);
    	}
	}



	private function like_post_()
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
    	elseif (empty($_POST['post_id']) || !is_numeric($_POST['post_id']) || $_POST['post_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the post id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{

            $post_id = Generic::secure($_POST['post_id']);
			$posts   = new Posts();
			$posts->setPostId($post_id);
			$code    = $posts->likePost();
			if ($code == 1 || $code == -1) {
				if ($code == -1) {
					$code = 0;
				}
				if ($posts->isPostOwner(false) == false && $code == 1) {
					$post_owner = $posts->getPostOwnerData();
					if (!empty($post_owner)) {
						$notif      = new Notifications();
						$notif_conf = $notif->notifSettings($post_owner->user_id,'on_like');
						if ($notif_conf) {
							$re_data = array(
								'notifier_id' => $me['user_id'],
								'recipient_id' => $post_owner->user_id,
								'type' => 'liked_ur_post',
								'url' => pid2url($post_id),
								'time' => time()
							);

							$notif->notify($re_data);
						}
					}
				}
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'is_liked'     => $code
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

	private function add_comment_()
	{
		global $me,$config;
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
    	elseif (empty($_POST['post_id']) || !is_numeric($_POST['post_id']) || $_POST['post_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the post id'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['text'])) {
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
    	else{

			$posts   = new Posts();
			$notif   = new Notifications();
			$post_id = Generic::secure($_POST['post_id']);
			$text    = Generic::cropText($_POST['text'],$config['comment_len']);
			$text    = Generic::secure($text);


			$posts->setPostId($post_id);
			$posts->setUserById($me['user_id']);

			$re_data = array(
				'text' => $text,
				'time' => time(),
			);


			$insert = $posts->addPostComment($re_data);


			if (!empty($insert)) {
				

			    if ($posts->isPostOwner(false) == false) {
					try {
						$posts->setPostId($post_id);
						$post_owner = $posts->getPostOwnerData();

						if (!empty($post_owner)) {
							$notif_conf = $notif->notifSettings($post_owner->user_id,'on_comment');

							if ($notif_conf) {
								$re_data = array(
									'notifier_id' => $me['user_id'],
									'recipient_id' => $post_owner->user_id,
									'type' => 'commented_ur_post',
									'url' => pid2url($post_id),
									'time' => time()
								);

								$notif->notify($re_data);
							}
						}
					} 
					catch (Exception $e) {
						
					}
				}
				$response_data       = array(
			        'code'     => '200',
			        'id' => $insert,
				    'status'   => 'OK'
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




	private function delete_comment_()
	{
		global $me,$config;
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
    	elseif (empty($_POST['comment_id']) || !is_numeric($_POST['comment_id']) || $_POST['comment_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '39',
		            'error_text' => 'Please Enter the comment id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{

			$posts   = new Posts();
			$id      = Generic::secure($_POST['comment_id']);
			$posts->setUserById($me['user_id']);
			if ($posts->isCommentOwner($id)) {
				$delete = $posts->deletePostComment($id);
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK'
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

	private function fetch_home_posts_()
	{
		global $me,$config;
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
    		$user_id = $me['user_id'];
            $posts   = new Posts();
            $user    = new User();
            $posts->comm_limit = 5;
            $data    = array();
			$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 20;
    		$posts->limit = $limit;
    		$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
			$user_posts   = $posts->setUserById($me['user_id'])->getTimelinePosts($_POST['offset'],$limit);

			$n_data = array();
			foreach ($user_posts as $value) {
				$images = array();
				$posts->setPostId($value->post_id);
				$post = $posts->postData();
				
				foreach ($post->media_set as $key => $value2) {
					$value2->file = media($value2->file);
	    			$value2->extra = media($value2->extra);
				}

				if(!empty($post->comments)) {
                    foreach ($post->comments as $key => $comment) {
                        $comment->avatar = media($comment->avatar);
                        $comment->text = strip_tags($comment->text);
                        $comment->time_text = time2str($comment->time);
                        $comment->text = $posts->tagifyHTags($comment->text);
                        $user = new User();
                        $new_user = $user->getUserDataById($comment->user_id);
                        $comment->name = $new_user->name;
                    }
                }
				$user         = new User();
				$new_user = $user->getUserDataById($post->user_id);
				$post->name = $new_user->name;
    			$post->avatar = media($post->avatar);
    			$post->description = strip_tags($post->description);
    			$post->time_text = time2str($post->time);
    			$post->description  = $posts->tagifyHTags($post->description);
    			$n_data[] = $post;
    		}
    		$data = $n_data;


    		$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
			    'data'     => $data
		    );
		    self::json($response_data);
    		
    	}
	}

	private function delete_post_()
	{
		global $me,$config;
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
    	else if (empty($_POST['post_id']) || !is_numeric($_POST['post_id']) || $_POST['post_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '40',
		            'error_text' => 'post_id should not be empty'
		        )
		    );
		    self::json($response_data);

    	}
    	else{
    		$posts   = new Posts();
			$post_id = $_POST['post_id'];

			$posts->setPostId($post_id);
			$posts->setUserById($me['user_id']);

			if ($posts->isPostOwner()) {
				$del = $posts->deletePost();
				if ($del) {
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'message'  => 'the post successfully deleted'
				    );
				    self::json($response_data);
				}
			}
			else{
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '41',
			            'error_text' => 'you can not remove the post you are not the post owner'
			        )
			    );
			    self::json($response_data);
			}

    	}
	}

	private function report_post_()
	{
		global $me,$config;
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
    	else if (empty($_POST['post_id']) || !is_numeric($_POST['post_id']) || $_POST['post_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '40',
		            'error_text' => 'post_id should not be empty'
		        )
		    );
		    self::json($response_data);

    	}
    	else{
    		$posts   = new Posts();
			$post_id = $_POST['post_id'];

			$report   = $posts->setPostId($post_id)->reportPost();
			if ($report == 1) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'type'     => $report,
			        'message'  => 'Your report has been sent!'
			    );
			    self::json($response_data);
			}
			else if($report == -1){
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'type'     => 0,
			        'message'  => 'Your report has been canceled!'
			    );
			    self::json($response_data);
			}
    	}
	}

	private function edit_post_()
	{
		global $me,$config;
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
    	else if (empty($_POST['post_id']) || !is_numeric($_POST['post_id']) || $_POST['post_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '40',
		            'error_text' => 'post_id should not be empty'
		        )
		    );
		    self::json($response_data);

    	}
    	else if (empty($_POST['text'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '42',
		            'error_text' => 'the text should not be empty'
		        )
		    );
		    self::json($response_data);

    	}
    	else{


    		$post_id  = Generic::secure($_POST['post_id']);
			$text     = Generic::secure($_POST['text']);
			$posts    = new Posts();
			$notif    = new Notifications();
			$is_owner = $posts->setPostId($post_id)->isPostOwner();

			if ($is_owner === true) {
				$update = $posts->updatePost(array('description' => $text));
				$notif->notifyMentionedUsers($text,pid2url($post_id));
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'message'  => 'Your post successfully edited'
			    );
			    self::json($response_data);
			}
			else{
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '43',
			            'error_text' => 'you can not edit the post you are not the post owner'
			        )
			    );
			    self::json($response_data);
			}
    	}
	}

	private function fetch_post_by_id_()
	{
		global $me,$config;
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
    	else if (empty($_POST['post_id']) || !is_numeric($_POST['post_id']) || $_POST['post_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '40',
		            'error_text' => 'post_id should not be empty'
		        )
		    );
		    self::json($response_data);

    	}
    	else{
    		$posts   = new Posts();
			$post_id = $_POST['post_id'];
			$post      = $posts->setPostId($post_id)->postData();

			if (!empty($post)) {
				foreach ($post->media_set as $key => $value2) {
					$value2->file = media($value2->file);
	    			$value2->extra = media($value2->extra);
				}
				foreach ($post->comments as $key => $comment) {
					$comment->avatar = media($comment->avatar);
					$comment->text = strip_tags($comment->text);
					$comment->time_text = time2str($comment->time);
					$comment->text  = $posts->tagifyHTags($comment->text);
					$user         = new User();
					$new_user = $user->getUserDataById($comment->user_id);
					$comment->name = $new_user->name;
				}
				$user         = new User();
				$new_user = $user->getUserDataById($post->user_id);
				$post->name = $new_user->name;
				$post->avatar = media($post->avatar);
				$post->description = strip_tags($post->description);
				$post->time_text = time2str($post->time);
				$post->description  = $posts->tagifyHTags($post->description);
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
				    'data'     => $post
			    );
			    self::json($response_data);
			}
			else{
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



	private function add_reply_()
	{
		global $me,$config;
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
    	elseif (empty($_POST['comment_id']) || !is_numeric($_POST['comment_id']) || $_POST['comment_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the comment id'
		        )
		    );
		    self::json($response_data);
    	}
    	elseif (empty($_POST['text'])) {
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
    	else{

			$posts   = new Posts();
			$notif   = new Notifications();
			$text    = Generic::cropText($_POST['text'],$config['comment_len']);
			$text    = Generic::secure($text);
			$comment_object = new Comments();
			$comment_id = Generic::secure($_POST['comment_id']);
			$comment = $posts->postCommentData($comment_id);

			if (!empty($comment)) {
				$link_regex = '/(http\:\/\/|https\:\/\/|www\.)([^\ ]+)/i';
		        $i          = 0;
		        preg_match_all($link_regex, $text, $matches);
		        foreach ($matches[0] as $match) {
		            $match_url = strip_tags($match);
		            $syntax    = '[a]' . urlencode($match_url) . '[/a]';
		            $text      = str_replace($match, $syntax, $text);
		        }

		        $re_data = array(
					'text' => $text,
					'time' => time(),
					'comment_id' => $comment_id
				);

				$insert = $comment_object->addCommentReply($re_data);

				if (!empty($insert)) {


					$reply = $comment_object->commentReplyData($insert);
					if (!empty($reply)) {

						if ($comment->user_id != $me['user_id']) {
							$notif   = new Notifications();
							$notif_conf = $notif->notifSettings($comment->user_id,'on_comment_reply');

							if ($notif_conf) {
								$re_data = array(
									'notifier_id' => $me['user_id'],
									'recipient_id' => $comment->user_id,
									'type' => 'reply_ur_comment',
									'url' => pid2url($comment->post_id),
									'time' => time()
								);

								$notif->notify($re_data);
							}
						}
					}

					$reply->time_text = time2str($reply->time);
					$reply->avatar = media($reply->avatar);
					$reply->text   = strip_tags($reply->text);

					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'data'         => $reply
				    );
				    self::json($response_data);
				}
			}
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


	private function like_comment_()
	{
		global $me,$config;
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
    	elseif (empty($_POST['comment_id']) || !is_numeric($_POST['comment_id']) || $_POST['comment_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the comment id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{

			$posts   = new Posts();
			$notif   = new Notifications();
			$comment_object = new Comments();
			$comment_id = Generic::secure($_POST['comment_id']);
			$comment = $posts->postCommentData($comment_id);

			if (!empty($comment)) {

				if ($comment->is_liked) {
					self::$db->where('comment_id',$comment_id)->where('user_id',$me['user_id'])->delete(T_COMMENTS_LIKES);
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'type'         => 0
				    );
				    self::json($response_data);
				}
				else{
					$comment_object->insertCommentLike(array('comment_id' => $comment_id,
				                                             'user_id'    => $me['user_id']));
					if ($comment->user_id != $me['user_id']) {
						$notif   = new Notifications();
						$notif_conf = $notif->notifSettings($comment->user_id,'on_comment_like');

						if ($notif_conf) {
							$re_data = array(
								'notifier_id' => $me['user_id'],
								'recipient_id' => $comment->user_id,
								'type' => 'liked_ur_comment',
								'url' => pid2url($comment->post_id),
								'time' => time()
							);

							$notif->notify($re_data);
						}
					}
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'type'         => 1
				    );
				    self::json($response_data);
				}
			}
			else{
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '22',
			            'error_text' => 'Comment not found'
			        )
			    );
			    self::json($response_data);
			}
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

	private function like_reply_()
	{
		global $me,$config;
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
    	elseif (empty($_POST['reply_id']) || !is_numeric($_POST['reply_id']) || $_POST['reply_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the reply id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{

			$posts   = new Posts();
			$notif   = new Notifications();
			$comment_object = new Comments();
			$reply_id = Generic::secure($_POST['reply_id']);

			$comment = $comment_object->commentReplyData($reply_id);

			if (!empty($comment)) {

				if ($comment->is_liked) {
					self::$db->where('reply_id',$reply_id)->where('user_id',$me['user_id'])->delete(T_COMMENTS_REPLY_LIKES);
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'type'         => 0
				    );
				    self::json($response_data);
				}
				else{
					$comment_object->insertCommentReplyLike(array('reply_id' => $reply_id,
		                                                  'user_id'    => $me['user_id']));
					if ($comment->user_id != $me['user_id']) {
						$notif   = new Notifications();
						$notif_conf = $notif->notifSettings($comment->user_id,'on_comment_like');

						if ($notif_conf) {
							$re_data = array(
								'notifier_id' => $me['user_id'],
								'recipient_id' => $comment->user_id,
								'type' => 'liked_ur_comment',
								'url' => pid2url($comment->post_id),
								'time' => time()
							);

							$notif->notify($re_data);
						}
					}
					$response_data       = array(
				        'code'     => '200',
					    'status'   => 'OK',
				        'type'         => 1
				    );
				    self::json($response_data);
				}
			}
			else{
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '22',
			            'error_text' => 'Comment not found'
			        )
			    );
			    self::json($response_data);
			}
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

	private function fetch_comment_reply_()
	{
		global $me,$config,$non_allowed;
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
    	elseif (empty($_POST['comment_id']) || !is_numeric($_POST['comment_id']) || $_POST['comment_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the comment id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{

			$posts   = new Posts();
			$user         = new User();
					
			$notif   = new Notifications();
			$comment_object = new Comments();
			$comment_id = Generic::secure($_POST['comment_id']);

			$comment = $posts->postCommentData($comment_id);

			if (!empty($comment)) {

				$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
	    		$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 20;

				$replies = $comment_object->get_comment_replies($comment_id,$limit,$offset);

				foreach ($replies as $key => $reply) {
					$replies[$key]->user_data = $user->getUserDataById($reply->user_id);
					$replies[$key]->user_data->cover = media($replies[$key]->user_data->cover);
					$replies[$key]->text = strip_tags($replies[$key]->text);
					$replies[$key]->text_time = time2str($replies[$key]->time);

					foreach ($non_allowed as $key1 => $value) {
						unset($replies[$key]->user_data->{$value});
					}
				}

				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'data'         => $replies
			    );
			    self::json($response_data);
			}
			else{
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '22',
			            'error_text' => 'Comment not found'
			        )
			    );
			    self::json($response_data);
			}
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

	private function delete_reply_()
	{
		global $me,$config,$non_allowed;
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
    	elseif (empty($_POST['reply_id']) || !is_numeric($_POST['reply_id']) || $_POST['reply_id'] < 1) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '38',
		            'error_text' => 'Please Enter the reply id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{

			$posts   = new Posts();
			$user         = new User();
					
			$notif   = new Notifications();
			$comment_object = new Comments();
			$reply_id = Generic::secure($_POST['reply_id']);

			$comment = $comment_object->commentReplyData($reply_id);

			if (!empty($comment)) {

				if ($comment->user_id == $me['user_id']) {
					$reply = $comment_object->deleteCommentReply($reply_id);
					if ($reply) {
						$response_data       = array(
					        'code'     => '200',
						    'status'   => 'OK',
					        'message'  => 'reply successfully deleted'
					    );
					    self::json($response_data);
					}
				}
				else{
					$response_data       = array(
				        'code'     => '400',
					    'status'   => 'Bad Request',
				        'errors'         => array(
				            'error_id'   => '23',
				            'error_text' => 'You are not the comment owner'
				        )
				    );
				    self::json($response_data);
				}
			}
			else{
				$response_data       = array(
			        'code'     => '400',
				    'status'   => 'Bad Request',
			        'errors'         => array(
			            'error_id'   => '22',
			            'error_text' => 'Comment not found'
			        )
			    );
			    self::json($response_data);
			}
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


	private function boost_()
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
    	elseif (empty($_POST['post_id'])) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '20',
		            'error_text' => 'Please Enter the post id'
		        )
		    );
		    self::json($response_data);
    	}
    	else{
    		$posts   = new Posts();
    		$post_id = Generic::secure($_POST['post_id']);
    		$boost = $posts->BoostPost($post_id);
			if ($boost == 1) {
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'type'         => 1
			    );
			    self::json($response_data);
			}
			elseif($boost == 2){
				$response_data       = array(
			        'code'     => '200',
				    'status'   => 'OK',
			        'type'         => 0
			    );
			    self::json($response_data);
			}
    	}
	}


	private function get_boost_()
	{
		global $non_allowed;
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
    		$posts   = new Posts();

    		$boost_post_query = self::$db->where('boosted',1)->orderBy('RAND()')->getOne(T_POSTS);
			$post = array();
			if (!empty($boost_post_query)) {
				$posts->setPostId($boost_post_query->post_id);
				$post = $posts->postData('');
			}

			if (!empty($post)) {
				foreach ($non_allowed as $key1 => $value) {
					unset($post->user_data->{$value});
				}

				foreach ($post->media_set as $key => $value2) {
					$value2->file = media($value2->file);
	    			$value2->extra = media($value2->extra);
				}
				foreach ($post->comments as $key => $comment) {
					$comment->avatar = media($comment->avatar);
					$comment->text = strip_tags($comment->text);
					$comment->time_text = time2str($comment->time);
					$comment->text  = $posts->tagifyHTags($comment->text);
					$user         = new User();
					$new_user = $user->getUserDataById($comment->user_id);
					$comment->name = $new_user->name;
				}
				$user         = new User();
				$new_user = $user->getUserDataById($post->user_id);
				$post->name = $new_user->name;
				$post->avatar = media($post->avatar);
				$post->user_data->cover = media($post->user_data->cover);
				$post->description = strip_tags($post->description);
				$post->time_text = time2str($post->time);
				$post->description  = $posts->tagifyHTags($post->description);


			}

			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'         => $post
		    );
		    self::json($response_data);
    	}
	}

	private function get_user_boosted_posts_()
	{
		global $non_allowed;
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
    		$user_id = Generic::secure($_POST['user_id']);
    		$offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
	    	$limit  = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 20;
    		$posts   = new Posts();
			$b_posts = $posts->getBoostedPostsByUserID($user_id,$limit,$offset);

			if (!empty($b_posts)) {
				foreach ($b_posts as $key_b => $post) {

					foreach ($non_allowed as $key1 => $value) {
						unset($b_posts[$key_b]->user_data->{$value});
					}

					foreach ($b_posts[$key_b]->media_set as $key => $value2) {
						$value2->file = media($value2->file);
		    			$value2->extra = media($value2->extra);
					}
					foreach ($b_posts[$key_b]->comments as $key => $comment) {
						$comment->avatar = media($comment->avatar);
						$comment->text = strip_tags($comment->text);
						$comment->time_text = time2str($comment->time);
						$comment->text  = $posts->tagifyHTags($comment->text);
						$user         = new User();
						$new_user = $user->getUserDataById($comment->user_id);
						$comment->name = $new_user->name;
					}
					$user         = new User();
					$new_user = $user->getUserDataById($post->user_id);
					$b_posts[$key_b]->name = $new_user->name;
					$b_posts[$key_b]->avatar = media($b_posts[$key_b]->avatar);
					$b_posts[$key_b]->user_data->cover = media($b_posts[$key_b]->user_data->cover);
					$b_posts[$key_b]->description = strip_tags($b_posts[$key_b]->description);
					$b_posts[$key_b]->time_text = time2str($b_posts[$key_b]->time);
					$b_posts[$key_b]->description  = $posts->tagifyHTags($b_posts[$key_b]->description);
				}


			}

			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'         => $b_posts
		    );
		    self::json($response_data);
    	}
	}


	


























	








	




	












}

 ?>