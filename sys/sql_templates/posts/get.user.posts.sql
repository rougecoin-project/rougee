SELECT p.*,m.*, (SELECT COUNT(`id`) FROM `{%t_likes%}` l WHERE l.`post_id` = p.`post_id`) AS likes, (SELECT COUNT(`id`) FROM `{%t_comm%}` c WHERE c.`post_id` = p.`post_id`) AS comments FROM `{%t_posts%}` p 
	
	LEFT JOIN `{%t_media%}` m ON m.`post_id` = p.`post_id`

	WHERE p.`user_id` = '{%user_id%}'

	{%if offset%}
		AND p.`post_id` < {%offset%}
	{%endif%}

	GROUP BY p.`post_id` ORDER BY p.`post_id` DESC LIMIT {%total_limit%}