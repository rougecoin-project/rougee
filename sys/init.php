<?php
error_reporting(0);
// ini_set('display_startup_errors', true);
// ini_set('display_errors', true);
// error_reporting(0);
header("Cache-Control: max-age=2592000");
define("ROOTPATH", dirname(dirname(__FILE__)) );

session_start();
require_once('sys/server/tables.php');
require_once('sys/db.php');
require_once('sys/context_data.php');
require_once('sys/pxp-autoload.php');
require_once('sys/server/utils.php');
require_once('sys/import3p/s3/aws-autoloader.php');
require_once('sys/import3p/ftp/vendor/autoload.php');
require_once('sys/import3p/ffmpeg-php/vendor/autoload.php');
require_once('sys/import3p/youtube-sdk/vendor/autoload.php');
require_once('sys/import3p/getID3-1.9.14/getid3/getid3.php');
require_once('sys/import3p/SimpleImage-master/src/claviska/SimpleImage.php');
require_once('sys/settings.php');
require_once('sys/import3p/PHPMailer/PHPMailerAutoload.php');


$generic_init = array(
	'db' => $db,
	'site_url' => $site_url,
	'config' => $config,
	'mysqli' => $mysqli,
);


$pixelphoto = new Generic($generic_init);
$user  = new User();
$me    = array();
$langs = $user->getLangs();

$context['theme_url'] = $site_url.'/apps/'.$config['theme'];
$context['loggedin'] = $user->isLogged();
$context['is_admin'] = false;
$context['langs']    = $langs;
$context['site_url']    = $site_url;
$context['config']    = $config;
$context['dirname_theme']    = dirname(__dir__).'/apps/'.$config['theme'];
$context['images']    = sprintf('%s/media/img',$config['site_url']);

if ($context['loggedin'] === true) {

	$context['user'] = $user->getLoggedInUser();
	$context['user'] = Generic::toArray($context['user']);
	$me        = $context['user'];
	$user_lang = $context['user']['language'];
	$countries = "lang/countries/english.php";
	if (file_exists($countries)) {
		$countries = "lang/countries/$user_lang.php";
	}
	
	$user->updateLastSeen();

	
	require_once($countries);
	
	$context['countries_name'] = $countries_name; 
	$context['is_admin']       = (($me['admin'] == 1) ? true : false);
	$_SESSION['lang']          = $me['language'];
}

if (!empty($_GET['lang']) && in_array($_GET['lang'], array_keys($langs))) {

    $lang_name = $user::secure(strtolower($_GET['lang']));    
    $_SESSION['lang'] = $lang_name;

    if ($context['loggedin'] === true) {
        $db->where('user_id', $me['user_id'])->update(T_USERS, array('language' => $lang_name));
    }
}

if (empty($_SESSION['lang'])) {
    $_SESSION['lang'] = $config['language'];
}
$context['language'] = $_SESSION['lang'];
$lang                = $user->fetchLanguage($context['language']);
$context['lang']     = $lang; 
$context['csrf_token']  = pxp_gencsrf_token(); 
$context['currency_symbol']  = Pxp_GetCurrency($config['currency']);
define('IS_LOGGED', $context['loggedin']);
define('IS_ADMIN', $context['is_admin']);

if (!empty($_GET['ref']) && $context['loggedin'] == false && !isset($_COOKIE['src']) && $config['affiliate_system'] == 1) {

    $get_ip = get_ip_address();
    if (!isset($_SESSION['ref']) && !empty($get_ip)) {
        $_GET['ref'] = $user::secure($_GET['ref']);
        $user->setUserByName($_GET['ref']);
		$user_data = $user->userData($user->getUser());
		$user_data = o2array($user_data);
        if (!empty($user_data)) {
            if (ip_in_range($user_data['ip_address'], '/24') === false && $user_data['ip_address'] != $get_ip) {
                $_SESSION['ref'] = $user_data['username'];
            }
        }
    }
}

//Ability to set light/dark mode by default 
if($config['site_display_mode'] === 'day' && !isset($_COOKIE['mode'])){
    setcookie("mode", 'day', time() + (10 * 365 * 24 * 60 * 60), "/");
}else if($config['site_display_mode'] === 'night' && !isset($_COOKIE['mode'])){
    setcookie("mode", 'night', time() + (10 * 365 * 24 * 60 * 60), "/");
}

$context['call_action'] = array(
    '1' => 'read_more',
    '2' => 'shop_now',
    '3' => 'view_now',
    '4' => 'visit_now',
    '5' => 'book_now',
    '6' => 'learn_more',
    '7' => 'play_now',
    '8' => 'bet_now',
    '9' => 'donate',
    '10' => 'apply_here',
    '11' => 'quote_here',
    '12' => 'order_now',
    '13' => 'book_tickets',
    '14' => 'enroll_now',
    '15' => 'find_card',
    '16' => 'get_quote',
    '17' => 'get_tickets',
    '18' => 'locate_dealer',
    '19' => 'order_online',
    '20' => 'preorder_now',
    '21' => 'schedule_now',
    '22' => 'sign_up_now',
    '23' => 'subscribe',
    '24' => 'register_now',
    '25' => 'go_to'
);

require_once('sys/function.php');
require_once('sys/cron_job.php');
require_once('sys/onesignal_config.php');
require_once('sys/google_cloud_storage_config.php');
require_once('sys/import3p/webtopay.php');
require_once('sys/import3p/twilio/vendor/autoload.php');