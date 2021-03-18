<?php
if (IS_LOGGED !== true) {
	header("Location: $site_url/welcome");
	exit;
}
$context['page_link'] = 'oops';
$context['exjs'] = true;
$context['app_name'] = 'oops';
$context['page_title'] = 'oops';
$context['content'] = $pixelphoto->PX_LoadPage('oops/templates/oops/index');
