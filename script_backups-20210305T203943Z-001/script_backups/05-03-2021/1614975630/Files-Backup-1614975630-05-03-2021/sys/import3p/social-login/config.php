<?php 
$site_url_login = $config['site_url'];
if(substr($site_url_login, -1) == '/') {
    $site_url_login = substr($site_url_login, 0, -1);
}
$login_with_conf = array(
	"callback" => $site_url_login . '/social_login.php?provider=' . $provider,
	"providers" => array(
		"OpenID" => array(
			"enabled" => false
		),
		"Yahoo" => array(
			"enabled" => false,
			"keys" => array("key" => "", "secret" => ""),
		),
		"AOL" => array(
			"enabled" => false
		),
		"Google" => array(
			"enabled" => true,
			"keys" => array("id" =>  $config['google_app_id'], "secret" => $config['google_app_key']),
		),
		"Facebook" => array(
			"enabled" => true,
			"keys" => array("id" => $config['facebook_app_id'], "secret" => $config['facebook_app_key']),
			"scope" => "email",
			"trustForwarded" => false
		),
		"Twitter" => array(
			"enabled" => true,
			"keys" => array("key" => $config['twitter_app_id'], "secret" => $config['twitter_app_key']),
			"includeEmail" => true
		),
		"Live" => array(
			"enabled" => false,
			"keys" => array("id" => "", "secret" => "")
		),
		"Foursquare" => array(
			"enabled" => false,
			"keys" => array("id" => "", "secret" => "")
		),
	),
	"debug_mode" => false,
	"debug_file" => "",
);
?>