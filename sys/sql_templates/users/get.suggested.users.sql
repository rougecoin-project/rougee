--
-- Sql query template fetch user suggestions to follow
--

SELECT * FROM `{%t_users%}` 
	WHERE 
		`user_id` NOT IN (SELECT `following_id` FROM `{%t_conn%}` WHERE `follower_id` = '{%user_id%}') 
	AND 
		`user_id` NOT IN (SELECT `profile_id` FROM `{%t_blocks%}` WHERE `user_id` = '{%user_id%}')
	AND 
		`user_id` NOT IN (SELECT `user_id` FROM `{%t_blocks%}` WHERE `profile_id` = '{%user_id%}')
	AND 
		`user_id` <> '{%user_id%}'

	{%if offset%}
	AND 
		`user_id` < {%offset%}
	{%endif%}

	ORDER BY `user_id` DESC

	LIMIT {%total_limit%}