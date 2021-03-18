<?php

//error_reporting(0);

$applications = array(
	'home' => true,
);

$config   = pxp_getconfig();
$theme    = $config['theme'];
$context  = array();



$config['header']   = true;
$config['footer']   = true;
$config['site_url'] = $site_url;
