<?php 
/*
	Place here your application Models
*/

class HomeModels extends Generic {

	public static function get_posts($limit = 20){
		$db   = self::$db;
		$data = array();
		$data = $db->get(T_BLOG,$limit);
		return self::toArray($data);
	}
}