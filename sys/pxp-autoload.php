<?php 

spl_autoload_register(function($className) {
	$dirs  = array(
		'sys/app_core',
		'sys/import3p/sitemap-php',
		'sys/import3p/MySQL-Dump',
		'sys/server'
	);

	foreach ($dirs as $dir) {
		$path = "$dir/$className.php";
		if (file_exists($path)) {
			require_once($path);
		}
	}
});
