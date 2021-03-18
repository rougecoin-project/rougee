<?php 

$context['page_title'] = lang('account_not_activated');
$context['app_name'] = 'notactive';
$context['page'] = 'notactive';
$config['header'] = false;
$config['footer'] = false;
$context['content'] = $pixelphoto->PX_LoadPage('notactive/templates/notactive/index');

