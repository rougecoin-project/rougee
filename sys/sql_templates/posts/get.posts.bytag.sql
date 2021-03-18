SELECT h.*,
       (SELECT Count(p.`post_id`)
        FROM `{%t_posts%}` p
        INNER JOIN `{%t_users%}` u ON p.`user_id` = u.`user_id` AND u.`p_privacy` > '0'
        WHERE u.`p_privacy` = '2' AND p.`description` LIKE Concat('%#[', h.`id`, ']%')
       ) AS use_num
FROM   `{%t_htags%}` h
WHERE  h.`tag` LIKE '{%hashtag%}%'
{%offset%}
ORDER  BY h.`tag` ASC
LIMIT {%limit%}