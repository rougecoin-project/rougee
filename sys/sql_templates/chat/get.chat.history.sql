SELECT u.`user_id`,u.`username`,u.`avatar`,c.`time`, c.`id`, (SELECT m.`text` FROM `{%t_messages%}` m WHERE (m.`from_id` = c.`from_id` AND m.`to_id` = c.`to_id` AND m.`deleted_fs1` = '0') OR (m.`from_id` = c.`to_id` AND m.`to_id` = c.`from_id` AND m.`deleted_fs2` = '0') ORDER BY m.`id` DESC LIMIT 1) AS last_message,(SELECT COUNT(m.`id`) FROM `{%t_messages%}` m WHERE (m.`to_id` = {%user_id%} AND m.`from_id` = c.`to_id`) AND m.`seen` = 0) AS new_message

FROM `{%t_chats%}` c INNER JOIN `{%t_users%}` u ON c.`to_id` = u.`user_id`

	WHERE c.`from_id` = {%user_id%}

	{%if offset%}
		AND c.`id` < {%offset%}
	{%endif%}

	AND `to_id` NOT IN (SELECT b1.`profile_id` FROM `{%t_blocks%}` b1 WHERE b1.`user_id` = {%user_id%})

	AND `to_id` NOT IN (SELECT b2.`user_id` FROM `{%t_blocks%}` b2 WHERE b2.`profile_id` = {%user_id%})

  	ORDER BY c.`time` DESC LIMIT {%total_limit%};