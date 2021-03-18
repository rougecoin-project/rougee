SELECT *,(COUNT(`stories`.`user_id`) - SUM(new)) as new_stories FROM (
	SELECT s.* ,u.`username`,u.`fname`,u.`lname`,u.`avatar`,(SELECT COUNT(v.`story_id`) FROM `{%t_views%}` v WHERE v.`story_id` = s.`id` AND v.`user_id` <> s.`user_id` AND v.`user_id` = '{%user_id%}') AS new FROM `{%t_story%}` s INNER JOIN `{%t_users%}` u ON s.`user_id` = u.`user_id` WHERE (
		s.`user_id` = {%user_id%} OR s.`user_id` IN (

			SELECT `{%t_con%}`.`following_id` FROM `{%t_con%}` WHERE (`follower_id` = {%user_id%} AND `active` = 1)

		) OR s.`user_id` IN (

			SELECT `{%t_con%}`.`follower_id` FROM `{%t_con%}` WHERE (
				`following_id` = {%user_id%}
			)
		) 
	)
) as `stories` GROUP BY `stories`.`user_id`;