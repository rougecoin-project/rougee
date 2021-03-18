SELECT `post_id` FROM `{%table%}`
	WHERE `post_id` < {%post_id%}

	{%if 'page' == 'favourites'%}
		AND `user_id` = (SELECT `user_id` FROM `{%table%}` WHERE `post_id` = {%post_id%} LIMIT 1)
	{%endif%}

	{%if 'page' == 'posts'%}
		AND `user_id` = (SELECT `user_id` FROM `{%table%}` WHERE `post_id` = {%post_id%} LIMIT 1)
	{%endif%}

	{%if 'page' == 'tags'%}
		AND `description` LIKE '%#[{%tag_id%}]%'
	{%endif%}

	ORDER BY `post_id` DESC LIMIT 1;