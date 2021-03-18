<?php
header ("Access-Control-Allow-Origin: *"); 
error_reporting(0);
@ini_set('max_execution_time', 0);
$f = '';
if (isset($_GET['f'])) {
    $f = str_replace('&amp;#', '&#',stripslashes(htmlspecialchars(trim($_GET['f']), ENT_QUOTES)));
}
if ($f == 'live_install') {
    $ServerErrors = "";
    $data = array();
    if (!empty($_POST['install'])) {
        $con = mysqli_connect($_POST['sql_host'], $_POST['sql_user'], $_POST['sql_pass'], $_POST['sql_name']);
        if (mysqli_connect_errno()) {
            $ServerErrors = "Failed to connect to MySQL: " . mysqli_connect_error() . "\n";
        }
        if (empty($_POST['admin_username']) || empty($_POST['admin_password'])) {
            $ServerErrors .= "Please provide right admin username/password\n";
        }

        if (empty($_POST['sqldata'])) {
            $ServerErrors .= "-Error While installation. please contact support\n";
        }

        if (empty($_POST['certificatedata'])) {
            $ServerErrors .= "-Error While installation. please contact support\n";
        }

        if (empty($_POST['htaccessdata'])) {
            $ServerErrors .= "-Error While installation. please contact support\n";
        }

        if (empty($ServerErrors)) {
            //start installition steps
            $file_content = 
'<?php
// +------------------------------------------------------------------------+
// | @author Deen Doughouz (DoughouzForest)
// | @author_url 1: http://pixelphotoscript.com
// | @author_url 2: http://codecanyon.net/user/doughouzforest
// | @author_email: pixelphotoscript@gmail.com   
// +------------------------------------------------------------------------+
// | Pixel Photo Script
// | Copyright (c) 2018 pixelphoto. All rights reserved.
// +------------------------------------------------------------------------+
// MySQL Hostname
$sql_db_host = "'  . $_POST['sql_host'] . '";
// MySQL Database User
$sql_db_user = "'  . $_POST['sql_user'] . '";
// MySQL Database Password
$sql_db_pass = "'  . $_POST['sql_pass'] . '";
// MySQL Database Name
$sql_db_name = "'  . $_POST['sql_name'] . '";

// Site URL
$site_url = "' . $_POST['site_url'] . '"; // e.g (http://example.com)

// Purchase code
$purchase_code = "' . trim($_POST['purshase_code']) . '"; // Your purchase code, don\'t give it to anyone. 
$buyer = "' . trim($_POST['buyer']) . '"; // Your buyer name from envato. 
?>';
            $success = '';
            $config_file_name = '../sys/config.php';
            $config_file = file_put_contents($config_file_name, $file_content);

            $htaccess = @file_put_contents('../.htaccess', base64_decode($_POST['htaccessdata']));
            $certificate = @file_put_contents('../cert.crt', base64_decode($_POST['certificatedata']));
            $database = @file_put_contents('../database.sql', base64_decode($_POST['sqldata']));
            $nginx = @file_put_contents('../nginx.server.conf', base64_decode($_POST['nginxdata']));

            if ($config_file) {
                $filename = '../database.sql';
                // Temporary variable, used to store current query
                $templine = '';
                // Read in entire file
                $lines = file($filename);
                // Loop through each line
                foreach ($lines as $line) {
                    // Skip it if it's a comment
                    if (substr($line, 0, 2) == '--' || $line == '')
                        continue;
                    // Add this line to the current segment
                    $templine .= $line;
                    $query = false;
                    // If it has a semicolon at the end, it's the end of the query
                    if (substr(trim($line), -1, 1) == ';') {
                        // Perform the query
                        $query = mysqli_query($con, $templine);
                        // Reset temp variable to empty
                        $templine = ''; 
                    }
                }      
                if ($query) {
                    mysqli_close($con);
                    $con2 = mysqli_connect($_POST['sql_host'], $_POST['sql_user'], $_POST['sql_pass'], $_POST['sql_name']);
                    $query_one  = mysqli_query($con2, "UPDATE `pxp_config` SET `value` = '" . mysqli_real_escape_string($con2, $_POST['site_url']). "' WHERE `name` = 'site_url'");
                    $query_one .= mysqli_query($con2, "UPDATE `pxp_config` SET `value` = '" . mysqli_real_escape_string($con2, $_POST['site_title']). "' WHERE `name` = 'site_name'");
                    $query_one .= mysqli_query($con2, "UPDATE `pxp_config` SET `value` = '" . mysqli_real_escape_string($con2, $_POST['site_email']). "' WHERE `name` = 'site_email'");
                    $query_one .= mysqli_query($con2, "UPDATE `pxp_config` SET `value` = '" . mysqli_real_escape_string($con2, md5(microtime())). "' WHERE `name` = 'app_api_id'");
                    $query_one .= mysqli_query($con2, "UPDATE `pxp_config` SET `value` = '" . mysqli_real_escape_string($con2, md5(time())). "' WHERE `name` = 'app_api_key'");
                    $query_one .= mysqli_query($con2, "INSERT INTO `pxp_users` (`user_id`, `username`, `email`, `ip_address`, `password`, `fname`, `lname`, `gender`, `email_code`, `language`, `avatar`, `cover`, `country_id`, `about`, `google`, `facebook`, `twitter`, `website`, `active`, `admin`, `verified`, `last_seen`, `registered`, `is_pro`, `posts`, `p_privacy`, `c_privacy`, `n_on_like`, `n_on_mention`, `n_on_comment`, `n_on_follow`, `src`) VALUES (1, '" . mysqli_real_escape_string($con2, $_POST['admin_username']). "', '" . mysqli_real_escape_string($con2, $_POST['site_email']). "', '::1', '" . mysqli_real_escape_string($con2, sha1($_POST['admin_password'])) . "', '" . mysqli_real_escape_string($con2, $_POST['admin_username']). "', '', 'male', '', 'english', 'media/img/d-avatar.jpg', 'media/img/d-cover.jpg', 0, '', '', '', '', '', 1, 1, 0, '" . time() . "', '00/0000', 0, 0, '1', '2', '1', '1', '1', '1', '');");
                    mysqli_close($con2);
                    $data = array(
                        'status' => 200,
                        'response' => 'SUCCESS',
                        'message' => 'Pixel Photo script successfully installed, please wait ..'
                    );
                }
            }
        }else{
            $data = array(
                'status' => 301,
                'response' => 'ERROR',
                'message' => $ServerErrors
            );
        }
    }

    header("Content-type: application/json");
    echo json_encode($data);
    exit();
}
if ($f == 'live_get_requirements') {
    $requirements = array();
    $requirements['cURL'] = true;
    $requirements['php'] = true;
    $requirements['gd'] = true;
    $requirements['disabled'] = false;
    $requirements['mysqli'] = true;
    $requirements['is_writable'] = true;
    $requirements['mbstring'] = true;
    $requirements['is_htaccess'] = true;
    $requirements['is_mod_rewrite'] = true;
    $requirements['is_sql'] = true;
    $requirements['zip'] = true;
    $requirements['allow_url_fopen'] = true;
    $requirements['exif_read_data'] = true;

    if (!function_exists('curl_init')) {
        $requirements['cURL'] = false;
        $requirements['disabled'] = true;
    }
    if (!function_exists('mysqli_connect')) {
        $requirements['mysqli'] = false;
        $requirements['disabled'] = true;
    }
    if (!extension_loaded('mbstring')) {
        $requirements['mbstring'] = false;
        $requirements['disabled'] = true;
    }
    if (!extension_loaded('gd') && !function_exists('gd_info')) {
        $requirements['gd'] = false;
        $requirements['disabled'] = true;
    }
    if (!version_compare(PHP_VERSION, '5.5.0', '>=')) {
        $requirements['php'] = false;
        $requirements['disabled'] = true;
    }
    if (!is_writable('../sys/config.php')) {
        $requirements['is_writable'] = false;
        $requirements['disabled'] = true;
    }
    if (!extension_loaded('zip')) {
        $requirements['zip'] = false;
        $requirements['disabled'] = true;
    }
    if(!ini_get('allow_url_fopen') ) {
        $requirements['allow_url_fopen'] = false;
        $requirements['disabled'] = true;
    }
    $data = array(
        'status' => 200,
        'requirements' => $requirements
    );
    header("Content-type: application/json");
    echo json_encode($data);
    exit();
}

?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Pixel Photo | Installation</title>
        <link rel="shortcut icon" type="image/png" href="logo.png"/>
        <link rel="stylesheet" href="stylesheet/font-awesome-4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="stylesheet/bootstrap.min.css">
        <link rel="stylesheet" href="stylesheet/style.css">
        <script type="text/javascript" src="javascript/jquery-1.11.3.js"></script>
        <script type="text/javascript" src="javascript/init.js"></script>
        <script type="text/javascript" src="javascript/jquery.form.min.js"></script>
        <script type="text/javascript" src="main.js"></script>
    </head>
    <body>
            <style>button:disabled {color: #fff !important;}body {background: #f9f9f9;}form {margin-bottom: 0;}.btn-main {color: #ffffff;background-color: #7c4dff;border-color: #7c4dff;}.btn-main:disabled {color: #333;border: none;}.btn-main:hover {color: #ffffff;background-color: #7c4dff;border-color: #7c4dff;}.admin-panel .col-md-9 .list-group-item:first-child,.setting-panel .col-md-8 .list-group-item:first-child,.profile-lists .list-group-item:first-child,.col-md-8 .list-group-item:first-child,.col-sm-4 .list-group-item:first-child,.red-list .list-group-item:first-child {color: #ffffff;background-color: #7c4dff;}.admin-panel .col-md-9 .list-group-item:first-child a,.setting-panel .col-md-8 .list-group-item:first-child a,.profile-lists .list-group-item:first-child a,.col-md-8 .list-group-item:first-child a {color: #ffffff !important;}.list-group-item.black-list.active-list {color: #ffffff;background-color: #7c4dff;}.list-group-item.black-list {background: #ffffff;}.profile-top-line {background-color: #7c4dff;}#bar {background-color: #7c4dff;}.list-group-item.black-list a {color: #444444;}.list-group-item.black-list.active-list a {color: #ffffff;}.main-color,.small-text a {color: #7c4dff !important;}.search-advanced-container a:hover {text-decoration: none;color: #ffffff;background-color: #7c4dff;}.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover {color: #ffffff;cursor: default;color: #7c4dff;border-bottom: 1px solid #7c4dff;background-color: transparent}.btn-active {color: #ffffff;background: #7c4dff;outline: none;border: 1px solid #7c4dff}.btn-active:hover,.btn-active:focus {border: 1px solid #7c4dff;color: #ffffff;background: #7c4dff;}.btn-active-color:hover {background: #7c4dff;}.chat-container .online-toggle {background: #7c4dff;}.chat-tab .online-toggle {background: #7c4dff;}.profile-style .user-follow-button button.btn-active,.btn-login,.btn-register {background: #7c4dff;color: #ffffff;}.profile-style .user-follow-button button.btn-active:hover,.btn-login:hover,.btn-login:focus,.btn-register:hover,.btn-register:focus {color: #ffffff;background: #7c4dff;}.panel-login button:disabled {background-color: #A33E40;}.panel-login>.panel-heading a.active {color: #7c4dff;font-size: 18px;}table, td, th, tr {font-size: 14px !important; }small {color: #555 !important;}</style>
            <div class="content-container container">
                <h1>Pixel Photo Script Installation</h1>
                <div class="row admin-panel">
                    <div class="col-md-3">
                        <ul class="list-group">
                            <li class="list-group-item black-list active-list"><i class="fa fa-fw fa-bars"></i> Terms of use</li>
                            <li class="list-group-item black-list "><i class="fa fa-fw fa-cog"></i> Requirements</li>
                            <li class="list-group-item black-list "><i class="fa fa-fw fa-download"></i> Installation</li>
                            <li class="list-group-item black-list "><i class="fa fa-fw fa-check"></i> Finish</li>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div class="list-group">
                            <div class="list-group-item"><i class="fa fa-fw fa-bars"></i> Envato Purchase code</div>
                            <div class="setting-well">
                                <div class="terms">
                                    <div class="req">
                                        <div id="respond"></div>
                                        <form action="#" method="post" class="form-horizontal install-site-setting">
                                            <div class="form-group">
                                                <label class="col-md-3" for="siteName">Purchase code</label>  
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="purshase_code" name="purshase_code" value="">
                                                    <span class="help-block">Your Envato purchase code, you can get it from <a href="https://help.market.envato.com/hc/en-us/articles/202822600">Here</a>.</span>
                                                </div>
                                            </div> 
                        
                                            <button type="button" class="btn btn-main btn-install-v"><i class="fa fa-download progress-icon" data-icon="download"></i> Install</button>  
                        
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>