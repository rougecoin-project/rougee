<?php
if (IS_LOGGED !== true || $config['pro_system'] == 'off' || $me['is_pro'] > 0) {
	header("Location: $site_url/welcome");
	exit;
}
$context['page_link'] = 'go_pro';
$context['app_name'] = 'go_pro';
$context['page_title'] = $context['lang']['upgrade_to_pro'];
$context['content'] = $pixelphoto->PX_LoadPage('go_pro/templates/go_pro/index');
