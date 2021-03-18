SELECT l.*,u.`username`,u.`avatar` {%if user_id%}, EXISTS (SELECT c.`id` FROM `{%t_connv%}` c WHERE c.`following_id` = u.`user_id` AND c.`follower_id` = {%user_id%}) AS is_following {%endif%} FROM `{%t_likes%}` l 

	INNER JOIN `{%t_users%}` u ON l.`user_id` = u.`user_id`

	WHERE l.`post_id` = {%post_id%} {%offset_%} ORDER BY l.`id` DESC {%limit_%};