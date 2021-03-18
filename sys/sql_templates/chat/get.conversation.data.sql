SELECT * FROM `{%t_messages%}` 

	WHERE ((`from_id` = {%from_id%} AND `to_id` = {%to_id%} AND `deleted_fs1` = '0') OR (`to_id` = {%from_id%} AND `from_id` = {%to_id%} AND `deleted_fs2` = '0'))

	{%if offset%} 
		AND `id` {%E%}  {%offset%} 
	{%endif%}

	{%if new%}
		AND `seen` = 0 
	{%endif%}

	ORDER BY `id` {%order%} LIMIT {%total_limit%}

