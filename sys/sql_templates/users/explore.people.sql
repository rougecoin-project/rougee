SELECT u.`user_id`,u.`username`,u.`avatar`,u.`last_seen`,u.`verified`,u.`about`,(SELECT COUNT(`id`) FROM `{%t_conn%}` c1 WHERE c1.`following_id` = u.`user_id`) AS `followers`, (SELECT COUNT(`post_id`) FROM `{%t_posts%}` p WHERE p.`user_id` = u.`user_id` ) AS `posts` FROM `{%t_users%}` u WHERE 

	u.`user_id` NOT IN (SELECT c2.`following_id` FROM `{%t_conn%}` c2 WHERE c2.`follower_id` = '{%user_id%}')

	AND u.`user_id` <> '{%user_id%}'

	AND u.`user_id` NOT IN (SELECT b1.`profile_id` FROM `{%t_blocks%}` b1 WHERE b1.`user_id` = {%user_id%})

	AND u.`user_id` NOT IN (SELECT b2.`user_id` FROM `{%t_blocks%}` b2 WHERE b2.`profile_id` = {%user_id%})

	{%if offset%}
		AND u.`user_id` < {%offset%}
	{%endif%}

	ORDER BY u.`user_id` DESC

	LIMIT {%total_limit%}