<?php
if (IS_LOGGED !== true || $config['business_account'] != 'on' || $me['business_account'] != 1) {
	header("Location: $site_url/welcome");
	exit;
}

$total_likes = $db->rawQuery('SELECT COUNT(*) AS count FROM '.T_POST_LIKES.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id');
$total_comments = $db->rawQuery('SELECT COUNT(*) AS count FROM '.T_POST_COMMENTS.' c WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = c.post_id) = post_id');


$context['total_likes'] = number_format($total_likes[0]->count);
$context['total_comments'] = number_format($total_comments[0]->count);


$types = array('today','this_week','this_month','this_year');
$type = 'today';

if (!empty($_GET['type']) && in_array($_GET['type'], $types)) {
	$type = $_GET['type'];
}

if ($type == 'today') {

	$array = array('00' => 0 ,'01' => 0 ,'02' => 0 ,'03' => 0 ,'04' => 0 ,'05' => 0 ,'06' => 0 ,'07' => 0 ,'08' => 0 ,'09' => 0 ,'10' => 0 ,'11' => 0 ,'12' => 0 ,'13' => 0 ,'14' => 0 ,'15' => 0 ,'16' => 0 ,'17' => 0 ,'18' => 0 ,'19' => 0 ,'20' => 0 ,'21' => 0 ,'22' => 0 ,'23' => 0);
	$day_likes_array = $array;
	$day_comments_array = $array;

	$today_start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
	$today_end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");

	$today_likes = $db->rawQuery('SELECT * FROM '.T_POST_LIKES.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$today_start.' AND time <= '.$today_end);

	$today_comments = $db->rawQuery('SELECT * FROM '.T_POST_COMMENTS.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$today_start.' AND time <= '.$today_end);

	foreach ($today_likes as $key => $value) {
		$hour = date('H',$value->time);
		if (in_array($hour, array_keys($day_likes_array))) {
			$day_likes_array[$hour] += 1; 
		}
	}
	foreach ($today_comments as $key => $value) {
		$hour = date('H',$value->time);
		if (in_array($hour, array_keys($day_comments_array))) {
			$day_comments_array[$hour] += 1; 
		}
	}

	$context['cat_type']    = 'today';
	$context['chart_title'] = $context['lang']['today'];
	$context['chart_text'] = date("l");
	$context['likes_array'] = implode(', ', $day_likes_array);
	$context['comments_array'] = implode(', ', $day_comments_array);
}
elseif ($type == 'this_week') {
	$time = strtotime(date('l').", ".date('M')." ".date('d').", ".date('Y'));

	if (date('l') == 'Saturday') {
		$week_start = strtotime(date('M')." ".date('d').", ".date('Y')." 12:00am");
	}
	else{
		$week_start = strtotime('last saturday, 12:00am', $time);
	}

	if (date('l') == 'Friday') {
		$week_end = strtotime(date('M')." ".date('d').", ".date('Y')." 11:59pm");
	}
	else{
		$week_end = strtotime('next Friday, 11:59pm', $time);
	}
	
	$array = array('Saturday' => 0 , 'Sunday' => 0 , 'Monday' => 0 , 'Tuesday' => 0 , 'Wednesday' => 0 , 'Thursday' => 0 , 'Friday' => 0);

	$week_likes_array = $array;
	$week_comments_array = $array;


	$week_likes = $db->rawQuery('SELECT * FROM '.T_POST_LIKES.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$week_start.' AND time <= '.$week_end);

	$week_comments = $db->rawQuery('SELECT * FROM '.T_POST_COMMENTS.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$week_start.' AND time <= '.$week_end);

	foreach ($week_likes as $key => $value) {
		$hour = date('l',$value->time);
		if (in_array($hour, array_keys($week_likes_array))) {
			$week_likes_array[$hour] += 1; 
		}
	}
	foreach ($week_comments as $key => $value) {
		$hour = date('l',$value->time);
		if (in_array($hour, array_keys($week_comments_array))) {
			$week_comments_array[$hour] += 1; 
		}
	}

	$context['cat_type']    = 'this_week';
	$context['chart_title'] = $context['lang']['this_week'];
	$context['chart_text'] = date('y/M/d',$week_start)." To ".date('y/M/d',$week_end);
	$context['likes_array'] = implode(', ', $week_likes_array);
	$context['comments_array'] = implode(', ', $week_comments_array);
}
elseif ($type == 'this_month') {
	$this_month_start = strtotime("1 ".date('M')." ".date('Y')." 12:00am");
	$this_month_end = strtotime(cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'))." ".date('M')." ".date('Y')." 11:59pm");
	$array = array_fill(1, cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y')),0);
	if (cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y')) == 31) {
		$array = array('01' => 0 ,'02' => 0 ,'03' => 0 ,'04' => 0 ,'05' => 0 ,'06' => 0 ,'07' => 0 ,'08' => 0 ,'09' => 0 ,'10' => 0 ,'11' => 0 ,'12' => 0 ,'13' => 0 ,'14' => 0 ,'15' => 0 ,'16' => 0 ,'17' => 0 ,'18' => 0 ,'19' => 0 ,'20' => 0 ,'21' => 0 ,'22' => 0 ,'23' => 0,'24' => 0 ,'25' => 0 ,'26' => 0 ,'27' => 0 ,'28' => 0 ,'29' => 0 ,'30' => 0 ,'31' => 0);
	}elseif (cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y')) == 30) {
		$array = array('01' => 0 ,'02' => 0 ,'03' => 0 ,'04' => 0 ,'05' => 0 ,'06' => 0 ,'07' => 0 ,'08' => 0 ,'09' => 0 ,'10' => 0 ,'11' => 0 ,'12' => 0 ,'13' => 0 ,'14' => 0 ,'15' => 0 ,'16' => 0 ,'17' => 0 ,'18' => 0 ,'19' => 0 ,'20' => 0 ,'21' => 0 ,'22' => 0 ,'23' => 0,'24' => 0 ,'25' => 0 ,'26' => 0 ,'27' => 0 ,'28' => 0 ,'29' => 0 ,'30' => 0);
	}elseif (cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y')) == 29) {
		$array = array('01' => 0 ,'02' => 0 ,'03' => 0 ,'04' => 0 ,'05' => 0 ,'06' => 0 ,'07' => 0 ,'08' => 0 ,'09' => 0 ,'10' => 0 ,'11' => 0 ,'12' => 0 ,'13' => 0 ,'14' => 0 ,'15' => 0 ,'16' => 0 ,'17' => 0 ,'18' => 0 ,'19' => 0 ,'20' => 0 ,'21' => 0 ,'22' => 0 ,'23' => 0,'24' => 0 ,'25' => 0 ,'26' => 0 ,'27' => 0 ,'28' => 0 ,'29' => 0);
	}elseif (cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y')) == 28) {
		$array = array('01' => 0 ,'02' => 0 ,'03' => 0 ,'04' => 0 ,'05' => 0 ,'06' => 0 ,'07' => 0 ,'08' => 0 ,'09' => 0 ,'10' => 0 ,'11' => 0 ,'12' => 0 ,'13' => 0 ,'14' => 0 ,'15' => 0 ,'16' => 0 ,'17' => 0 ,'18' => 0 ,'19' => 0 ,'20' => 0 ,'21' => 0 ,'22' => 0 ,'23' => 0,'24' => 0 ,'25' => 0 ,'26' => 0 ,'27' => 0 ,'28' => 0);
	}

	$month_likes_array = $array;
	$month_comments_array = $array;


	$month_likes = $db->rawQuery('SELECT * FROM '.T_POST_LIKES.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$this_month_start.' AND time <= '.$this_month_end);

	$month_comments = $db->rawQuery('SELECT * FROM '.T_POST_COMMENTS.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$this_month_start.' AND time <= '.$this_month_end);

	foreach ($month_likes as $key => $value) {
		$hour = date('d',$value->time);
		if (in_array($hour, array_keys($month_likes_array))) {
			$month_likes_array[$hour] += 1; 
		}
	}
	foreach ($month_comments as $key => $value) {
		$hour = date('d',$value->time);
		if (in_array($hour, array_keys($month_comments_array))) {
			$month_comments_array[$hour] += 1; 
		}
	}

	$context['cat_type']    = 'this_month';
	$context['chart_title'] = $context['lang']['this_month'];
	$context['chart_text'] = date("M");
	$context['likes_array'] = implode(', ', $month_likes_array);
	$context['comments_array'] = implode(', ', $month_comments_array);
	$context['month_days'] = count($array);
}
elseif ($type == 'this_year') {
	$this_year_start = strtotime("1 January ".date('Y')." 12:00am");
	$this_year_end = strtotime("31 December ".date('Y')." 11:59pm");
	$array = array('01' => 0 ,'02' => 0 ,'03' => 0 ,'04' => 0 ,'05' => 0 ,'06' => 0 ,'07' => 0 ,'08' => 0 ,'09' => 0 ,'10' => 0 ,'11' => 0 ,'12' => 0);

	$year_likes_array = $array;
	$year_comments_array = $array;


	$year_likes = $db->rawQuery('SELECT * FROM '.T_POST_LIKES.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$this_year_start.' AND time <= '.$this_year_end);

	$year_comments = $db->rawQuery('SELECT * FROM '.T_POST_COMMENTS.' l WHERE (SELECT post_id FROM '.T_POSTS.' WHERE user_id = '.$me['user_id'].' AND post_id = l.post_id) = post_id AND time >= '.$this_year_start.' AND time <= '.$this_year_end);

	foreach ($year_likes as $key => $value) {
		$hour = date('m',$value->time);
		if (in_array($hour, array_keys($year_likes_array))) {
			$year_likes_array[$hour] += 1; 
		}
	}
	foreach ($year_comments as $key => $value) {
		$hour = date('m',$value->time);
		if (in_array($hour, array_keys($year_comments_array))) {
			$year_comments_array[$hour] += 1; 
		}
	}

	$context['cat_type']    = 'this_year';
	$context['chart_title'] = $context['lang']['this_year'];
	$context['chart_text'] = date("Y");
	$context['likes_array'] = implode(', ', $year_likes_array);
	$context['comments_array'] = implode(', ', $year_comments_array);
}


$context['page_link'] = 'account_analytics';
$context['exjs'] = true;
$context['app_name'] = 'account_analytics';
$context['page_title'] = $context['lang']['account_analytics'];
$context['content'] = $pixelphoto->PX_LoadPage('account_analytics/templates/account_analytics/index');