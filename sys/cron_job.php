<?php
$admin = new Admin();
if ($config['last_clean_db'] <= (time() - 86400)) {
	$admin->updateSettings(array(
		'last_clean_db' => time()
	));

	$admin::$db->where('seen','0','>')->delete(T_NOTIF);

	$storyids = array();
	$stories  = $admin::$db->where('time',(time() - 86400),'<=')->get(T_STORY,null,array('id','media_file'));
	if (!empty($stories) && is_array($stories)) {
		foreach ($stories as $story_data) {
			$storyids[] = $story_data->id;
			if (file_exists($story_data->media_file)) {
				@unlink($story_data->media_file);
			}
		}

		if (!empty($storyids) && len($storyids)) {
			$admin::$db->where('id',$storyids,'IN')->delete(T_STORY);
		}
	}

	$admin::$db->where('deleted_fs1','1');
	$admin::$db->where('deleted_fs2','1')->delete(T_MESSAGES);
}

if ($config['pro_system'] == 'on') {
    $users_id = $admin::$db->where('type', 'pro_member')->where('time', strtotime("-30 days"), '<')->get(T_TRANSACTIONS, null, array('user_id'));
    $ids = array();
    foreach ($users_id as $key => $value) {
        $ids[] = $value->user_id;
    }
    if(!empty($ids)) {
        $admin::$db->where('user_id', $ids, "IN")->update(T_USERS, array('is_pro' => '0'));
    }
}


?>