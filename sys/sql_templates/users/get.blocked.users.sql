SELECT DISTINCT u.`user_id`,u.`avatar`,u.`username`,u.`fname`,u.`lname` FROM `{%t_blocks%}` b 

	INNER JOIN `{%t_users%}` u ON u.`user_id` = b.`profile_id`

	WHERE b.`user_id` = {%user_id%}

	ORDER BY b.`time` DESC;