<?php 
$tpage = (!empty($_GET['page'])) ? $_GET['page'] : 'about-us';
$pname = 'about_us';
if ($tpage == 'terms-of-use') {
	$pname = 'terms_of_use';
}

elseif ($tpage == 'privacy-and-policy') {
	$pname = 'privacy_and_policy';
}

elseif ($tpage == 'contact_us') {
	$pname = 'contact_us';
}

$pagecont = $user->getPage($pname);

$context['pname'] = $pname;
$context['tpage'] = $tpage;
$context['page_title'] = lang($pname);
$context['pagecont'] = $pagecont;
$context['app_name'] = 'terms';
$context['xhr_url'] = "$site_url/aj/main";
$context['content'] = $pixelphoto->PX_LoadPage('terms/templates/terms/index');
