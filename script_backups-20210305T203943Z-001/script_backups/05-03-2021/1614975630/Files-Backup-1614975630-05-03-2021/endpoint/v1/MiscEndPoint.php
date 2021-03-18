<?php 
/**
 * 
 */
class MiscEndPoint extends Generic
{
	
	function __construct($api_resource_id)
	{
        switch ($api_resource_id) {
			case 'fetch_recent_donations':
				self::fetch_recent_donations();
                break;
            case 'get_follow_requests':
                self::get_follow_requests();
				break;
			case 'delete_follow_request':
				self::delete_follow_request();
				break;
			case 'profile_verify':
				self::Profile_Verify();
				break;
			case 'fetch_sessions':
				self::fetch_sessions();
				break;
			case 'delete_session':
				self::delete_session();
				break;
			case 'withdraw':
				self::withdraw();
				break;
			case 'explore_user_store':
				self::explore_user_store();
				break;
			case 'explore_all_store':
				self::explore_all_store();
				break;
			case 'upload_store_image':
				self::upload_store_image();
				break;
			case 'buy_store_item':
				self::buy_store_item();
				break;
            case 'get_store_byid':
                self::get_store_byid();
                break;
            case 'delete_store_byid':
                self::delete_store_byid();
                break;
            case 'edit_store_byid':
                self::edit_store_byid();
                break;
            case 'bank_transfer':
                self::bank_transfer();
                break;
            case 'my_store_downloads':
                self::my_store_downloads();
                break;
			case 'store_purchase_history':
				self::store_purchase_history();
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
	
	private function upload_store_image(){
		global $me, $db, $config;
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
		}elseif(empty($_FILES['photo'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please upload photo'
		        )
		    );
		    self::json($response_data);
		}else{

			$inserted_data = array();
			$is_ok = false;
			$media = new Media();
			$media->setFile(array(
				'file' => $_FILES['photo']['tmp_name'],
				'name' => $_FILES['photo']['name'],
				'size' => $_FILES['photo']['size'],
				'type' => $_FILES['photo']['type'],
				'allowed' => 'jpeg,jpg,png',
				'crop' => array(),
				'avatar' => false
			));
			$upload = $media->uploadFile();
			if (!empty($upload['filename'])) {
				$size = getimagesize($upload['filename']);
				if( $size[0] < $config['min_image_width'] || $size[1] < $config['min_image_height'] ){
					@unlink($upload['filename']);
					$media->uploadToFtp($upload['filename'], true);
					$media->uploadToS3($upload['filename'], true);
					$response_data       = array(
						'code'     => '400',
						'status'   => 'Bad Request',
						'errors'         => array(
							'error_id'   => '44',
							'error_text' => str_replace(array('{0}','{1}'), array($config['min_image_width'],$config['min_image_height']), lang('image_dimension_error'))
						)
					);
					self::json($response_data);
					exit();
				}
				$is_ok = true;
				$inserted_data['full_file'] = $upload['filename'];
				$logo = $config['site_url'] . '/media/img/logo.' . $config['logo_extension'];
				$dir         = "media/upload";
				$generate    = date('Y') . '/' . date('m') . '/' . date('Y') . md5(time()) . date('m') . '_' . date('d') . '_' . md5(time());
				$file_path   = "photos/" . $generate . "_image.jpg";
				$filename    = $dir . '/' . $file_path;
			
				try {
					$image = new \claviska\SimpleImage();
					$image
						->fromFile($upload['filename'])
						->autoOrient()
						->overlay($logo, $config['watermark_anchor'], $config['watermark_opacity'], 0, 0)
						->toFile($filename, 'image/jpeg');
					$inserted_data['small_file'] = $filename;
				} catch(Exception $err) {
					$response_data       = array(
						'code'     => '400',
						'status'   => 'Bad Request',
						'errors'         => array(
							'error_id'   => '16',
							'error_text' => $err
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
						'error_id'   => '1',
						'error_text' => lang('your_photo_invalid')
					)
				);
				self::json($response_data);
			}
			if ($is_ok == true) {
				$inserted_data['title'] = !empty($_POST['title']) ? Generic::secure($_POST['title']) : '';
				$inserted_data['tags'] = !empty($_POST['tags']) ? Generic::secure($_POST['tags']) : '';
				$inserted_data['license'] = 'none';//!empty($_POST['license']) ? Generic::secure($_POST['license']) : 'none';
				$inserted_data['price'] = '0';//!empty($_POST['price']) ? Generic::secure($_POST['price']) : '0.00';
				$inserted_data['category'] = !empty($_POST['category']) ? Generic::secure($_POST['category']) : '';
				$inserted_data['user_id'] = $me['user_id'];
				$inserted_data['created_date'] = time();

				$license_options = array();
				if(isset($_POST['license_options']) && is_array( $_POST['license_options'] )){
					$inserted_data['license_options'] = serialize( $_POST['license_options'] );
				}else{
					$inserted_data['license_options'] = serialize( $license_options );
				}
				$id = Generic::$db->insert(T_STORE, $inserted_data);
				if ($id > 0) {
					$data['status'] = 200;
					$response_data       = array(
						'code'     => '200',
						'status'   => lang('img_upload_success')
					);
					self::json($response_data);
				}
				else{
					$response_data       = array(
						'code'     => '400',
						'status'   => 'Bad Request',
						'errors'         => array(
							'error_id'   => '1',
							'error_text' => lang('unknown_error')
						)
					);
					self::json($response_data);
				}
			}
		}
	}

	private function explore_all_store(){
		global $me, $db,$config;
        if (IS_LOGGED == false || ($config['image_sell_system'] == 'off')) {
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
			$last_id      = (!empty($_POST['offset']) && is_numeric($_POST['offset'])) ? Generic::secure($_POST['offset']) : 0;
			$images  = array();
			$user         = new User();
			$db->arrayBuilder()->where('id', $last_id , '>');

			if( isset( $_POST['search_title']) && !empty( $_POST['search_title']) ){
				$db->where('title',"%".Generic::secure($_POST['search_title'])."%",'LIKE');
			}
			if( isset( $_POST['search_tags']) && !empty( $_POST['search_tags']) ){
				$db->where('tags',"%".Generic::secure($_POST['search_tags'])."%",'LIKE');
			}
			if( isset( $_POST['search_category']) && !empty( $_POST['search_category']) ){
				$db->where('category',Generic::secure($_POST['search_category']));
			}
			if( isset( $_POST['search_license']) && !empty( $_POST['search_license']) ){
				$db->where('license_options','%'.Generic::secure($_GET['search_license']) . '%', 'like');
			}
			if( isset( $_POST['search_min']) && !empty( $_POST['search_min']) ){
				$db->where('price',(int)Generic::secure($_POST['search_min']) , ">=");
			}
			if( isset( $_POST['search_max']) && !empty( $_POST['search_max']) ){
				$db->where('price',(int)Generic::secure($_POST['search_max']) , "<=");
			}

			$store_images = $db->orderBy('id','DESC')->get(T_STORE,20);
			foreach ($store_images as $key => $image_data) {
				$new_user = $user->getUserDataById(Generic::secure($image_data['user_id']));

				$image_data['post_id'] = $image_data['id'];
				$image_data['type'] = 'image';
				$image_data['thumb'] = $image_data['small_file'];
				$image_data['boosted'] = 0;
				$image_data['avatar'] = $new_user->avatar;
				$image_data['username'] = $new_user->username;
				$image_data['category_name'] = lang($image_data['category']);
				$image_data['text_time'] = time2str($image_data['created_date']);
				$image_data['license_options'] = unserialize($image_data['license_options']);
				unset($image_data['license']);
				unset($image_data['price']);

				$image_data['is_purchased'] = false;
				if(!empty($image_data['license_options'])){
					foreach($image_data['license_options'] as $key => $value){
						$is_buy = $db->where('type','store')
									 ->where('user_id', $me['user_id'])
									 ->where('item_license', $key)
									 ->getOne(T_TRANSACTIONS);
						if($is_buy){
							$image_data['is_purchased'] = true;
						}
					}
				}

				$image_data['small_file'] = media($image_data['small_file']);
				$image_data['full_file'] = media($image_data['full_file']);
				$image_data['thumb'] = media($image_data['thumb']);
				$images[]    = $image_data;
			}
			$response_data       = array(
		        'code'      => '200',
				'status'    => 'OK',
				'data'		=> $images
		    );
		    self::json($response_data);
		}	
	}

	private function explore_user_store(){
		global $me, $db, $config;
        if (IS_LOGGED == false || ($config['image_sell_system'] == 'off')) {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
		}elseif(empty($_POST['user_id']) && !is_numeric($_POST['user_id'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please check user id'
		        )
		    );
		    self::json($response_data);
		}else{
			$last_id      = (!empty($_POST['offset']) && is_numeric($_POST['offset'])) ? Generic::secure($_POST['offset']) : 0;
			$images  = array();
			$user         = new User();
			$new_user = $user->getUserDataById(Generic::secure($_POST['user_id']));
			$store_images = $db->arrayBuilder()->where('user_id',Generic::secure($_POST['user_id']))->where('id', $last_id , '>')->orderBy('id','DESC')->get(T_STORE,20);
			foreach ($store_images as $key => $image_data) {
				$image_data['post_id'] = $image_data['id'];
				$image_data['type'] = 'image';
				$image_data['thumb'] = $image_data['small_file'];
				$image_data['boosted'] = 0;
				$image_data['avatar'] = $new_user->avatar;
				$image_data['username'] = $new_user->username;
				$image_data['category_name'] = lang($image_data['category']);
				$image_data['text_time'] = time2str($image_data['created_date']);
				$image_data['license_options'] = unserialize($image_data['license_options']);
				unset($image_data['license']);
				unset($image_data['price']);
				$images[]    = $image_data;
			}
			$response_data       = array(
		        'code'      => '200',
				'status'    => 'OK',
				'data'		=> $images
		    );
		    self::json($response_data);
		}	
	}

	private function my_store_downloads(){
        global $me, $db, $config;
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
        } else {
            $data = [];
            $transactions = $db->arrayBuilder()->where('type', 'store')->where('user_id', $me['user_id'])->get(T_TRANSACTIONS,null);
            foreach ($transactions as $key => $transaction_data) {
                $transaction_data['user_data'] = $db->arrayBuilder()->where('user_id', $transaction_data['user_id'])->getOne(T_USERS);
                $transaction_data['item_data'] = $db->arrayBuilder()->where('id', $transaction_data['item_store_id'])->getOne(T_STORE);
                $transaction_data['text_time'] = time2str($transaction_data['time']);
                $data[]    = $transaction_data;
            }
            $response_data       = array(
                'code'      => '200',
                'status'    => 'OK',
                'data'		=> $data
            );
            self::json($response_data);
        }
    }

    private function bank_transfer(){
        global $me, $db, $config;
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
        }elseif(!isset($_FILES['receipt_file']) || empty($_FILES['receipt_file'])){
            $response_data       = array(
                'code'     => '400',
                'status'   => 'Bad Request',
                'errors'         => array(
                    'error_id'   => '1',
                    'error_text' => 'Please enter store_item_id'
                )
            );
            self::json($response_data);
        }else {
            $data = [];
            $media = new Media();
            $media->setFile(array(
                'file' => $_FILES['receipt_file']['tmp_name'],
                'name' => $_FILES['receipt_file']['name'],
                'size' => $_FILES['receipt_file']['size'],
                'type' => $_FILES['receipt_file']['type'],
                'allowed' => 'jpeg,jpg,png'
            ));
            $upload = $media->uploadFile();

            $funding_id = Generic::secure($_POST['funding_id']);
            $mode = Generic::secure($_POST['mode']);
            $price = (float)Generic::secure($_POST['price']);
            $description = Generic::secure($_POST['description']);
            $image = $upload['filename'];

            $db->insert(T_BANK_TRANSFER,array('user_id' => $me['user_id'],
                'receipt_file' => $image,
                'description' => $description,
                'price' => $price,
                'mode' => $mode,
                'funding_id' => $funding_id));
            $data['status']  = 200;
            $data['message'] = lang('bank_transfer_request');

            self::json($data);
        }
    }

    private function edit_store_byid(){
        global $me, $db, $config;
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
        }elseif(!isset($_POST['store_item_id']) || empty($_POST['store_item_id'])){
            $response_data       = array(
                'code'     => '400',
                'status'   => 'Bad Request',
                'errors'         => array(
                    'error_id'   => '1',
                    'error_text' => 'Please enter store_item_id'
                )
            );
            self::json($response_data);
        }else{
            $store_item_id = Generic::secure($_POST['store_item_id']);


            $license_array = array();
            if( !empty($_POST['license']) ){
                foreach($_POST['license'] as $key => $value){
                    $license_array[$key] = (float)$value;
                }
            }

            $data    = array('status' => 400);
            $inserted_data = array();
            $is_ok = true;


            $media = new Media();
            $media->setFile(array(
                'file' => $_FILES['photo']['tmp_name'],
                'name' => $_FILES['photo']['name'],
                'size' => $_FILES['photo']['size'],
                'type' => $_FILES['photo']['type'],
                'allowed' => 'jpeg,jpg,png',
                'crop' => array(),
                'avatar' => false
            ));

            $upload = $media->uploadFile();

            if (!empty($upload['filename'])) {

                $size = getimagesize($upload['filename']);
                if( $size[0] < $config['min_image_width'] || $size[1] < $config['min_image_height'] ){
                    @unlink($upload['filename']);
                    $media->uploadToFtp($upload['filename'], true);
                    $media->uploadToS3($upload['filename'], true);
                    $data['message'] = str_replace(array('{0}','{1}'), array($config['min_image_width'],$config['min_image_height']), lang('image_dimension_error')) ;
                    echo json_encode($data, JSON_PRETTY_PRINT);
                    exit();
                }
                $is_ok = true;
                $inserted_data['full_file'] = $upload['filename'];

                $logo = $config['site_url'] . '/media/img/logo.' . $config['logo_extension'];

                $dir         = "media/upload";
                $generate    = date('Y') . '/' . date('m') . '/' . date('Y') . md5(time()) . date('m') . '_' . date('d') . '_' . md5(time());
                $file_path   = "photos/" . $generate . "_image.jpg";
                $filename    = $dir . '/' . $file_path;
                try {
                    $image = new \claviska\SimpleImage();

                    $image
                        ->fromFile($upload['filename'])
                        ->autoOrient()
                        ->overlay($logo, $config['watermark_anchor'], $config['watermark_opacity'], 0, 0)
                        ->toFile($filename, 'image/jpeg');

                    $inserted_data['small_file'] = $filename;

                } catch(Exception $err) {

                    $data['message'] = lang('unknown_error');
                }


            }
            if ($is_ok == true) {
                if(!empty($_POST['title'])) {
                    $inserted_data['title'] = $_POST['title'];
                }
                if(!empty($_POST['tags'])) {
                    $inserted_data['tags'] = $_POST['tags'];
                }
                //$inserted_data['license'] =  'none';
                //$inserted_data['price'] =  '0.00';
                if(!empty($_POST['category'])) {
                    $inserted_data['category'] = $_POST['category'];
                }
                if(!empty($license_array)) {
                    $inserted_data['license_options'] = serialize($license_array);
                }
                $id = Generic::$db->where('id', $store_item_id)->update(T_STORE, $inserted_data);
                if ($id > 0) {
                    $data['message'] = lang('img_upload_success');
                    $data['status'] = 200;
                }
                else{
                    $data['message'] = lang('unknown_error');
                }
            }
            self::json($data);
        }
    }
    private function delete_store_byid(){
        global $me, $db, $config;
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
        }elseif(!isset($_POST['store_item_id']) || empty($_POST['store_item_id'])){
            $response_data       = array(
                'code'     => '400',
                'status'   => 'Bad Request',
                'errors'         => array(
                    'error_id'   => '1',
                    'error_text' => 'Please enter store_item_id'
                )
            );
            self::json($response_data);
        }else{
            $store_item_id = Generic::secure($_POST['store_item_id']);
            $images  = array();
            $user         = new User();
            $del = $db->where('id',$store_item_id)->delete(T_STORE);
            if($del) {
                $response_data = array(
                    'code' => '200',
                    'status' => 'OK'
                );
            }else{
                $response_data       = array(
                    'code'     => '400',
                    'status'   => 'Bad Request',
                    'errors'         => array(
                        'error_id'   => '4',
                        'error_text' => 'Error while delete store item'
                    )
                );
            }
            self::json($response_data);
        }
    }
	private function get_store_byid(){
        global $me, $db, $config;
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
        }elseif(!isset($_POST['store_item_id']) || empty($_POST['store_item_id'])){
            $response_data       = array(
                'code'     => '400',
                'status'   => 'Bad Request',
                'errors'         => array(
                    'error_id'   => '1',
                    'error_text' => 'Please enter store_item_id'
                )
            );
            self::json($response_data);
        }else{
            $store_item_id = Generic::secure($_POST['store_item_id']);
            $images  = array();
            $user         = new User();
            $db->where('id',$store_item_id)->update(T_STORE,array('views'=> $db->inc(1)));
            $store_images = $db->where('id',$store_item_id)->orderBy('id','DESC')->get(T_STORE,1);
            foreach ($store_images as $key => $image_data) {
                $image_data = (array)$image_data;
                $new_user = $user->getUserDataById(Generic::secure($image_data['user_id']));

                $image_data['post_id'] = $image_data['id'];
                $image_data['type'] = 'image';
                $image_data['thumb'] = $image_data['small_file'];
                $image_data['boosted'] = 0;
                $image_data['avatar'] = $new_user->avatar;
                $image_data['username'] = $new_user->username;
                $image_data['category_name'] = lang($image_data['category']);
                $image_data['text_time'] = time2str($image_data['created_date']);
                $image_data['license_options'] = unserialize($image_data['license_options']);
                unset($image_data['license']);
                unset($image_data['price']);

                $image_data['is_purchased'] = false;
                if(!empty($image_data['license_options'])){
                    foreach($image_data['license_options'] as $key => $value){
                        $is_buy = $db->where('type','store')
                            ->where('user_id', $me['user_id'])
                            ->where('item_license', $key)
                            ->getOne(T_TRANSACTIONS);
                        if($is_buy){
                            $image_data['is_purchased'] = true;
                        }
                    }
                }

                $image_data['small_file'] = media($image_data['small_file']);
                $image_data['full_file'] = media($image_data['full_file']);
                $image_data['thumb'] = media($image_data['thumb']);
                $images    = $image_data;
            }
            $response_data       = array(
                'code'      => '200',
                'status'    => 'OK',
                'data'		=> $images
            );
            self::json($response_data);
        }
    }
	private function buy_store_item(){
		global $me, $db, $config;
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
		}elseif(!isset($_POST['store_item_id']) || empty($_POST['store_item_id'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please enter store_item_id'
		        )
		    );
		    self::json($response_data);
		}elseif(!isset($_POST['license']) || empty($_POST['license'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please enter license'
		        )
		    );
		    self::json($response_data);
		}elseif(!isset($_POST['price']) || empty($_POST['price'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please enter price'
		        )
		    );
		    self::json($response_data);
		}else{


			$store_item_id = Generic::secure($_POST['store_item_id']);
			$amount = (int)Generic::secure($_POST['price']);
			$item_license = Generic::secure($_POST['license']);

			$inserted_data = array();
			$is_ok = false;

			if( in_array($item_license, array('rights_managed_license','editorial_use_license','royalty_free_license','royalty_free_extended_license','creative_commons_license','public_domain'))){
				if( ( is_numeric($amount) && $amount > 0 ) && ( is_numeric($store_item_id) && $store_item_id > 0 ) ) {
					$is_ok = true;
				}
			}

			if ($is_ok == true) {
				
				$store_image = $db->arrayBuilder()->where('id',$store_item_id)->getOne(T_STORE);
                $u = $db->arrayBuilder()->where('user_id',$store_image['user_id'])->getOne(T_USERS);
                $commesion = $amount / 2;
				$wallet = $u['balance'] + $commesion;
				$user = new User();
                $update = $user->updateStatic($store_image['user_id'],array('balance' => $wallet));
                $id = $db->insert(T_TRANSACTIONS,array(
                    'user_id'       => $me['user_id'],
                    'amount'        => $amount,
                    'type'          => 'store',
                    'item_store_id' => $store_item_id,
                    'admin_com'     => $commesion,
                    'time'          => time(),
                    'item_license'  => $item_license
                    )
                );
                $db->where('id',$store_item_id)->update(T_STORE, array( 'sells' => $db->inc(1)));
                $notif   = new Notifications();
                $re_data = array(
                    'notifier_id' => $me['user_id'],
                    'recipient_id' => $store_image['user_id'],
                    'type' => 'store_purchase',
                    'url' => $config['site_url'] . "/store/".$store_item_id,
                    'time' => time()
                );
                try {
                    $notif->notify($re_data);
                } catch (Exception $e) {
					$response_data       = array(
						'code'     => '400',
						'status'   => 'Bad Request',
						'errors'         => array(
							'error_id'   => '1',
							'error_text' => $e
						)
					);
					self::json($response_data);
				}
				
				if ($id > 0) {
					$data['status'] = 200;
					$response_data       = array(
						'code'     => '200',
						'status'   => 'success'
					);
					self::json($response_data);
				}
				else{
					$response_data       = array(
						'code'     => '400',
						'status'   => 'Bad Request',
						'errors'         => array(
							'error_id'   => '1',
							'error_text' => lang('unknown_error')
						)
					);
					self::json($response_data);
				}
			}
		}
	}

	private function store_purchase_history(){
		global $me, $db;
        if (IS_LOGGED == false || ($config['image_sell_system'] == 'off')) {
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
		$_transactions  = array();
		$store_ids = array();
		$ids = $db->where('user_id',$me['user_id'])->get(T_STORE,null,array('id'));
		foreach ($ids as $key => $val){
			$store_ids[] = $val->id;
		}
		$transactions = $db->arrayBuilder()->where('type', 'store')->where('item_store_id',$store_ids, 'IN')->get(T_TRANSACTIONS,1000);
		$total_sell = 0;
		foreach ($transactions as $key => $transaction_data) {
			$transaction_data['user_data'] = $db->arrayBuilder()->where('user_id', $transaction_data['user_id'])->getOne(T_USERS);
			$transaction_data['item_data'] = $db->arrayBuilder()->where('id', $transaction_data['item_store_id'])->getOne(T_STORE);
			$transaction_data['text_time'] = time2str($transaction_data['time']);
			$total_sell += $transaction_data['admin_com'];
			$_transactions[]    = $transaction_data;
		}
		$response_data       = array(
			'code'     => '200',
			'status'   => 'success',
			'data'     => $_transactions
		);
		self::json($response_data);
	}

	private function delete_follow_request(){
		global $me, $db;
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
		}elseif(empty($_POST['user_id']) && !is_numeric($_POST['user_id'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please check user id'
		        )
		    );
		    self::json($response_data);
		}else{
			$db->where('following_id',$me['user_id']);
			$db->where('follower_id',Generic::secure($_POST['user_id']));
			$db->where('type',2);
			$request = $db->delete(T_CONNECTIV);
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK'
		    );
		    self::json($response_data);
		}
	}

	private function withdraw(){
		global $me, $db, $config;
		$user = new User();
        if (IS_LOGGED == false || $config['withdraw_system'] == 'off') {
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '17',
		            'error_text' => 'Please Login And Try Again'
		        )
		    );
		    self::json($response_data);
		}elseif(empty($_POST['paypal_email']) || empty($_POST['amount']) || empty($_POST['user_id'])){
    		$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '18',
		            'error_text' => 'Please check your details'
		        )
		    );
			self::json($response_data);
		}elseif (!filter_var($_POST['paypal_email'], FILTER_VALIDATE_EMAIL)) {
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '18',
		            'error_text' => lang('email_invalid_characters')
		        )
		    );
			self::json($response_data);
		}else if($me['balance'] < $_POST['amount']){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '18',
		            'error_text' => lang('amount_more_balance')
		        )
		    );
			self::json($response_data);
		}else if(!is_numeric($_POST['amount']) || $_POST['amount'] < 50){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '18',
		            'error_text' => lang('amount_less_50').' 50'
		        )
		    );
			self::json($response_data);
		}else{
			$db->where('user_id',$me['user_id']);
			$db->where('status',0);
			$requests = $db->getValue(T_WITHDRAWAL, 'count(*)');
			if (!empty($requests)) {
				$response_data       = array(
					'code'     => '400',
					'status'   => 'Bad Request',
					'errors'         => array(
						'error_id'   => '18',
						'error_text' => lang('cant_request_withdrawal')
					)
				);
				self::json($response_data);
			}else{
				if ($me['paypal_email'] != $_POST['paypal_email']) {
					$update  = $user->updateStatic($me['user_id'],array('paypal_email' => Generic::secure($_POST['paypal_email'])));
				}
				$insert_data    = array(
					'user_id'   => $me['user_id'],
					'amount'    => Generic::secure($_POST['amount']),
					'email'     => Generic::secure($_POST['paypal_email']),
					'requested' => time(),
					'currency' => $config['currency'],
				);
		
				$insert  = $db->insert(T_WITHDRAWAL,$insert_data);
				if (!empty($insert)) {
					$response_data       = array(
						'code'     => '200',
						'status'   => lang('withdrawal_request_sent')
					);
					self::json($response_data);
				}
			}
		}
	}

	private function delete_session(){
		global $me, $db;
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
		}elseif(!isset($_POST['session_id'])){
			$response_data       = array(
		        'code'     => '400',
			    'status'   => 'Bad Request',
		        'errors'         => array(
		            'error_id'   => '1',
		            'error_text' => 'Please check session id'
		        )
		    );
		    self::json($response_data);
		}else{
			$id = Generic::secure($_POST['session_id']);
			$user = new User();
			$user->delete_session($id);
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK'
		    );
		    self::json($response_data);
		}
	}

	private function fetch_sessions(){
		global $me, $db;
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
			$user = new User();
			$xdata = array();
			$sessions = $user->getUserSessions();
			foreach($sessions as $key => $session){
				$xdata[$session->id] = $session;
				$xdata[$session->id]->platform_details = json_decode($session->platform_details);
 			}
			$response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'     => $xdata
		    );
		    self::json($response_data);
		}
	}

	private function Profile_Verify(){
		global $me, $db;
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
    	}elseif (empty($_POST['name']) || empty($_FILES['passport']) || empty($_FILES['photo'])) {
			$response_data       = array(
				'code'     => '400',
				'status'   => 'Bad Request',
				'errors'         => array(
					'error_id'   => '20',
					'error_text' => 'Please Check your details'
				)
			);
			self::json($response_data);
		}else{
			$data       = array(
				'code'     => '200',
				'status'   => 'OK'
			);

			$inserted_data = array();
			$is_ok = false;
			$media = new Media();
			$media->setFile(array(
				'file' => $_FILES['photo']['tmp_name'],
				'name' => $_FILES['photo']['name'],
				'size' => $_FILES['photo']['size'],
				'type' => $_FILES['photo']['type'],
				'allowed' => 'jpeg,jpg,png',
				'crop' => array(
					'height' => 600,
					'width' => 600,
				),
				'avatar' => true
			));
	
			$upload = $media->uploadFile();
	
			if (!empty($upload['filename'])) { 
				$is_ok = true;
				$inserted_data['photo'] = $upload['filename'];
			}
			else{
				$data['code'] = 400;
				$data['status'] = lang('your_photo_invalid');
			}
	
			if ($is_ok == true) {
				$media->setFile(array(
					'file' => $_FILES['passport']['tmp_name'],
					'name' => $_FILES['passport']['name'],
					'size' => $_FILES['passport']['size'],
					'type' => $_FILES['passport']['type'],
					'allowed' => 'jpeg,jpg,png',
					'crop' => array(
						'height' => 600,
						'width' => 600,
					),
					'avatar' => true
				));
	
				$upload = $media->uploadFile();
				if (!empty($upload['filename'])) { 
					$is_ok = true;
					$inserted_data['passport'] = $upload['filename'];
				}
				else{
					$is_ok = false;
					$data['code'] = 400;
					$data['status'] = lang('your_ip_invalid');
				}
			}
			if ($is_ok == true) {
				$inserted_data['name'] = Generic::secure($_POST['name']);
				$inserted_data['message'] = !empty($_POST['message']) ? Generic::secure($_POST['message']) : '';
				$inserted_data['user_id'] = $me['user_id'];
				$inserted_data['time'] = time();

				$user = new User();
				$id = $user->sendVerificationRequest($inserted_data);
				if ($id > 0) {
					$data['status'] = lang('request_done');
					$data['code'] = 200;
				}
				else{
					$data['status'] = lang('unknown_error');
					$data['code'] = 400;
				}
			}else{
				$data['status'] = lang('unknown_error');
				$data['code'] = 400;
			}
			self::json($data);
		}
	}

    private function get_follow_requests(){
        global $me, $db;
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
            $db->where('following_id',$me['user_id']);
            $db->where('type',2);
            $limit = !empty($_POST['limit']) && $_POST['limit'] <= 50 ? Generic::secure($_POST['limit']) : 30;
            $offset  = !empty($_POST['offset']) ? Generic::secure($_POST['offset']) : false;
            if ($offset && is_numeric($offset)) {
                self::$db->where('id',$offset,'>');
            }
            $db->orderBy('id','DESC');
            $requests = $db->get(T_CONNECTIV, $limit);
            $db->where('following_id',$me['user_id'])->where('active',0)->update(T_CONNECTIV,array('active' => 1));
            $r_data = array();
            $user = new User();
            foreach($requests as $req){
                $r_data[$req->id] = array(
                    'id' => $req->id,
                    'following' => $user->getUserDataById($req->following_id),
                    'time' => time2str($req->time),
                    'type' => $req->type,
                    'active' => $req->active
                );
            }
            $response_data       = array(
		        'code'     => '200',
                'status'   => 'OK',
                'id' => $me['user_id'],
		        'data'     => $r_data
		    );
		    self::json($response_data);
        
        }
    }

    private function fetch_recent_donations(){
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
            $user = new User();
            $r_data = $user->GetFunding(4);
            $response_data       = array(
		        'code'     => '200',
			    'status'   => 'OK',
		        'data'     => $r_data
		    );
		    self::json($response_data);
        }

    }
}