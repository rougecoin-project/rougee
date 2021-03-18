SELECT p.`type`,p.`post_id`, m.`file`,m.`extra`,u.`username`,u.`avatar`,(SELECT COUNT(`id`) FROM `{%t_likes%}` l WHERE l.`post_id` = p.`post_id`) AS likes,(SELECT COUNT(`id`) FROM `{%t_comm%}` c WHERE c.`post_id` = p.`post_id`) AS comments FROM `{%t_saved%}` s 

	INNER JOIN `{%t_posts%}` p ON s.`post_id` = p.`post_id`

	INNER JOIN `{%t_media%}` m ON m.`post_id` = p.`post_id`	

	INNER JOIN `{%t_users%}` u ON u.`user_id` = p.`user_id`

	WHERE s.`user_id` = '{%user_id%}'

	{%if offset%}
		AND s.`post_id` < {%offset%}
	{%endif%}

	GROUP BY p.`post_id` ORDER BY s.`post_id` DESC LIMIT {%total_limit%}