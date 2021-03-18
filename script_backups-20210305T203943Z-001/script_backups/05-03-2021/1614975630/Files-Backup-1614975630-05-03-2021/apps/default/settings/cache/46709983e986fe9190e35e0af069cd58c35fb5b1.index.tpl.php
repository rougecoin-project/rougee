<?php
/* Smarty version 3.1.30, created on 2018-03-20 14:51:06
  from "C:\xampp\htdocs\pixelphoto\apps\default\settings\templates\settings\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5ab111ca514cf3_44933753',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9ce118fafaf14d1ae1b9fbb9e1e2a9906893c8a0' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\index.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'b4388385b251a4e9a263ba84cf4c0635e947edb9' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\container.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'd3612deef6dccbb9c2a2f58d579e82746eea9a45' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\header\\header.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'e6b0f7e5c829f7a0f1a40113509040487d7aa87d' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\js\\h-script.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '4e2c2da3e4bba78467d536fe300fdc271b362414' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\includes\\general.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'ca66dc60a1218af09ebc7ec06b88a10d4aa6612f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\lazy-load.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
    '65237b3b8cf4a7cc61643f6a154216a3e8a4fc2a' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\js\\script.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '6112ee9d68272c98bfc24ddec3d366587e18c8e3' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\footer\\footer.tpl',
      1 => 1520704074,
      2 => 'file',
    ),
    '917bf268dc2a108519a238244fc111c8ee206720' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\timeago.tpl',
      1 => 1521380742,
      2 => 'file',
    ),
  ),
  'cache_lifetime' => 3600,
),true)) {
function content_5ab111ca514cf3_44933753 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<meta name="title" content="PixelPhoto">
	<meta name="description" content="PixelPhoto is a PHP Media Sharing Script, PixelPhoto is the best way to start your own media sharing script!">
	<meta name="keywords" content="social, pixelphoto, social site">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Profile settings</title>
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/jquery-3.2.1.js"></script>
	<script src="http://localhost/pixelphoto//apps/default/main/static/css/libs/bs3/js/bootstrap.js"></script>
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/css/libs/bs3/css/bootstrap.css">
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/css/styles.master.css">
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/js/libs/toast/src/jquery.m.toast.css">
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/fonts/material-design-iconic-font/css/material-design-iconic-font.css">
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/fonts/ionicons/css/ionicons.css">
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/jquery.sticky-kit.min.js"></script>
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/jquery-form.v3.51.0.js"></script>
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/script.master.js"></script>
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/css/libs/mdl/material.css">
	<script src="http://localhost/pixelphoto//apps/default/main/static/css/libs/mdl/material.js"></script>
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/toast/src/jquery.m.toast.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Roboto|Open+Sans" rel="stylesheet">
	
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/css/libs/bootstrap-toggle.min.css">
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/bootstrap-toggle.min.js"></script>

	<script>
		function xhr_url(){
			return 'http://localhost/pixelphoto//aj/';
		}

		function site_url(path = ''){
			return 'http://localhost/pixelphoto//' + path;
		}
	</script>
	
			<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-61754368-9', 'auto');
  ga('send', 'pageview');

</script>
	</head>
<body data-app="settings" class="body-settings">
	<input type="hidden" class="hidden csrf-token" value="1521553067:2d97d80f5af467caf6a638d16c539634e7b1b7a1">
			<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container container-settings container-settings-header">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li class="logo">
                    <a href="http://localhost/pixelphoto/">
                        <img src="http://localhost/pixelphoto//media/img/logo.png" width="42px">
                    </a>
                </li>
                <li class="">
                    <form class="form navbar-search">
                        <div class="input">
                            <input type="text" class="form-control" placeholder="Search.." id="search-users">
                            <i class="ion-ios-search"></i>
                            <img src="http://localhost/pixelphoto//media/icons/loadding.gif" alt="">
                        </div>
                        <div class="search-result"></div>
                    </form>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                                    <li class="">
                        <a href="http://localhost/pixelphoto/">
                            <i class="ion-ios-home-outline"></i>
                        </a>
                    </li>
                    <li class="">
                        <a href="http://localhost/pixelphoto//explore">
                            <i class="zmdi zmdi-compass"></i>
                        </a>
                    </li>
                    <li class="">
                        <a href="http://localhost/pixelphoto//messages" class="_messages">
                            <i class="ion-ios-chatboxes-outline"></i>
                            <small id="new__messages"></small>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown notifications-list">
                            <span class="dropdown-toggle pointer" data-toggle="dropdown" id="get-notifications">
                                <i class="zmdi zmdi-notifications-none"></i>
                                <small id="new__notif"></small>
                            </span>
                            <div class="dropdown-menu zoom">
                                <div class="header">
                                    Notifications
                                    <a href="http://localhost/pixelphoto//settings/notifications/deendoughouz">
                                        <i class="ion-ios-settings-strong"></i>
                                    </a>
                                </div>

                                <ul id="notifications__list"></ul>
                                <div class="preloader hidden">
                                    <img src="http://localhost/pixelphoto//media/icons/loadding.gif" alt="">
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </li>
                                        <li class="active">
                        <a href="http://localhost/pixelphoto//@deendoughouz">
                            <img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" width="24px" height="24px" class="img-circle">
                        </a>
                    </li>
                            </ul>
        </div>
    </div>
    <div class="loadding-pgbar">
        <div class="bar">
            
        </div>
    </div>
</nav>


<script>jQuery(document).ready(function($) {$("#get-notifications").click(function(event) {var notf_list = $("#notifications__list");var preloader = notf_list.next('.preloader').clone().removeClass('hidden');notf_list.html(preloader);delay(function(){get_notifications();},400);});$("input#search-users").blur(function(event) {delay(function(){$(".search-result").fadeOut(10);},500);});$("input#search-users").focus(function(event) {delay(function(){$(".search-result").fadeIn(10);},500);});$("input#search-users").keyup(function(event) {var keyword =$(this).val();var desturl = link('main/search-users');var zis= $(this);if (/^\#(.+)/.test(keyword)) {desturl = link('main/search-posts');keyword = keyword.substring(1);}if (keyword.length >= 3) {zis.siblings('img').fadeIn(100);$.ajax({url: desturl,type: 'POST',dataType: 'json',data: {kw:keyword},}).done(function(data) {if (data.status == 200) {$(".search-result").html(data.html);}else{$(".search-result").empty();}});delay(function(){zis.siblings('img').fadeOut(100);},500);}});});</script>

		<main class="container container-settings container-settings-main">
		
	<div class="settings-page-container content-shadow">
		<div class="col-md-3 sidenav">
			<ul class="list-group">
				<li class="list-group-item active">
					<a href="http://localhost/pixelphoto//settings/general/deendoughouz">
						<i class="la la-fw la-cogs"></i> General
					</a>
				</li>
				<li class="list-group-item ">
					<a href="http://localhost/pixelphoto//settings/profile/deendoughouz">
						<i class="la la-fw la-cogs"></i> Profile settings
					</a>
				</li>
				<li class="list-group-item ">
					<a href="http://localhost/pixelphoto//settings/password/deendoughouz">
						<i class="la la-fw la-unlock"></i> Password
					</a>
				</li>
				<li class="list-group-item ">
					<a href="http://localhost/pixelphoto//settings/privacy/deendoughouz">
						<i class="la la-fw la-check-circle"></i> Privacy
					</a>
				</li>
				<li class="list-group-item ">
					<a href="http://localhost/pixelphoto//settings/notifications/deendoughouz">
						<i class="la la-fw la-check-circle"></i> Notifications
					</a>
				</li>
				<li class="list-group-item ">
					<a href="http://localhost/pixelphoto//settings/blocked/deendoughouz">
						<i class="la la-fw la-check-circle"></i> Blocked users
					</a>
				</li>
									<li class="list-group-item ">
						<a href="http://localhost/pixelphoto//settings/delete/deendoughouz">
							<i class="la la-fw la-user-times"></i> Delete account
						</a>
					</li>
							</ul>
		</div>
		<div class="col-md-9 page-content">
			<div>
	<div class="header">
		<div class="avatar-wrapper">
			<img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" class="img-circle" width="100px" height="100px">
		</div>
		<div class="edit-avatar">
			<form id="edit-avatar">
				<h5>deendoughouz</h5>
				<button type="button" class="btn btn-info btn-shadow" onclick="$('#avatar').trigger('click');">
					<i class="zmdi zmdi-edit"></i> Change Profile Avatar
				</button>
				<input type="file" accept="image/*" name="avatar" id="avatar" class="hidden">
				<input type="hidden" name="hash" value="1521553067:2d97d80f5af467caf6a638d16c539634e7b1b7a1">
			</form>
		</div>
		<div class="clear"></div>
	</div>
	<form class="form" id="edit-general-settings">
		<div class="form-group">
			<label class="col-md-3">Username*</label>
			<div class="col-md-6">
				<input required="true" type="text" name="username" class="form-control" value="deendoughouz" placeholder="Username">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">E-mail*</label>
			<div class="col-md-6">
				<input required="true" type="email" name="email" class="form-control" value="deendoughouz@gmail.com" placeholder="Your email address">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Gender*</label>
			<div class="col-md-6">
				<select name="gender" class="form-control" required="true">
					<option value="male" selected>
						Male
					</option>
					<option value="female" >
						Female
					</option>
				</select>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Country</label>
			<div class="col-md-6">
				<select name="country" class="form-control">
							
											<option value="0" selected>
							Select Country
						</option>
											<option value="1" >
							United States
						</option>
											<option value="2" >
							Canada
						</option>
											<option value="3" >
							Afghanistan
						</option>
											<option value="4" >
							Albania
						</option>
											<option value="5" >
							Algeria
						</option>
											<option value="6" >
							American Samoa
						</option>
											<option value="7" >
							Andorra
						</option>
											<option value="8" >
							Angola
						</option>
											<option value="9" >
							Anguilla
						</option>
											<option value="10" >
							Antarctica
						</option>
											<option value="11" >
							Antigua and/or Barbuda
						</option>
											<option value="12" >
							Argentina
						</option>
											<option value="13" >
							Armenia
						</option>
											<option value="14" >
							Aruba
						</option>
											<option value="15" >
							Australia
						</option>
											<option value="16" >
							Austria
						</option>
											<option value="17" >
							Azerbaijan
						</option>
											<option value="18" >
							Bahamas
						</option>
											<option value="19" >
							Bahrain
						</option>
											<option value="20" >
							Bangladesh
						</option>
											<option value="21" >
							Barbados
						</option>
											<option value="22" >
							Belarus
						</option>
											<option value="23" >
							Belgium
						</option>
											<option value="24" >
							Belize
						</option>
											<option value="25" >
							Benin
						</option>
											<option value="26" >
							Bermuda
						</option>
											<option value="27" >
							Bhutan
						</option>
											<option value="28" >
							Bolivia
						</option>
											<option value="29" >
							Bosnia and Herzegovina
						</option>
											<option value="30" >
							Botswana
						</option>
											<option value="31" >
							Bouvet Island
						</option>
											<option value="32" >
							Brazil
						</option>
											<option value="34" >
							Brunei Darussalam
						</option>
											<option value="35" >
							Bulgaria
						</option>
											<option value="36" >
							Burkina Faso
						</option>
											<option value="37" >
							Burundi
						</option>
											<option value="38" >
							Cambodia
						</option>
											<option value="39" >
							Cameroon
						</option>
											<option value="40" >
							Cape Verde
						</option>
											<option value="41" >
							Cayman Islands
						</option>
											<option value="42" >
							Central African Republic
						</option>
											<option value="43" >
							Chad
						</option>
											<option value="44" >
							Chile
						</option>
											<option value="45" >
							China
						</option>
											<option value="46" >
							Christmas Island
						</option>
											<option value="47" >
							Cocos (Keeling) Islands
						</option>
											<option value="48" >
							Colombia
						</option>
											<option value="49" >
							Comoros
						</option>
											<option value="50" >
							Congo
						</option>
											<option value="51" >
							Cook Islands
						</option>
											<option value="52" >
							Costa Rica
						</option>
											<option value="53" >
							Croatia (Hrvatska)
						</option>
											<option value="54" >
							Cuba
						</option>
											<option value="55" >
							Cyprus
						</option>
											<option value="56" >
							Czech Republic
						</option>
											<option value="57" >
							Denmark
						</option>
											<option value="58" >
							Djibouti
						</option>
											<option value="59" >
							Dominica
						</option>
											<option value="60" >
							Dominican Republic
						</option>
											<option value="61" >
							East Timor
						</option>
											<option value="62" >
							Ecuador
						</option>
											<option value="63" >
							Egypt
						</option>
											<option value="64" >
							El Salvador
						</option>
											<option value="65" >
							Equatorial Guinea
						</option>
											<option value="66" >
							Eritrea
						</option>
											<option value="67" >
							Estonia
						</option>
											<option value="68" >
							Ethiopia
						</option>
											<option value="69" >
							Falkland Islands (Malvinas)
						</option>
											<option value="70" >
							Faroe Islands
						</option>
											<option value="71" >
							Fiji
						</option>
											<option value="72" >
							Finland
						</option>
											<option value="73" >
							France
						</option>
											<option value="74" >
							France, Metropolitan
						</option>
											<option value="75" >
							French Guiana
						</option>
											<option value="76" >
							French Polynesia
						</option>
											<option value="77" >
							French Southern Territories
						</option>
											<option value="78" >
							Gabon
						</option>
											<option value="79" >
							Gambia
						</option>
											<option value="80" >
							Georgia
						</option>
											<option value="81" >
							Germany
						</option>
											<option value="82" >
							Ghana
						</option>
											<option value="83" >
							Gibraltar
						</option>
											<option value="84" >
							Greece
						</option>
											<option value="85" >
							Greenland
						</option>
											<option value="86" >
							Grenada
						</option>
											<option value="87" >
							Guadeloupe
						</option>
											<option value="88" >
							Guam
						</option>
											<option value="89" >
							Guatemala
						</option>
											<option value="90" >
							Guinea
						</option>
											<option value="91" >
							Guinea-Bissau
						</option>
											<option value="92" >
							Guyana
						</option>
											<option value="93" >
							Haiti
						</option>
											<option value="94" >
							Heard and Mc Donald Islands
						</option>
											<option value="95" >
							Honduras
						</option>
											<option value="96" >
							Hong Kong
						</option>
											<option value="97" >
							Hungary
						</option>
											<option value="98" >
							Iceland
						</option>
											<option value="99" >
							India
						</option>
											<option value="100" >
							Indonesia
						</option>
											<option value="101" >
							Iran (Islamic Republic of)
						</option>
											<option value="102" >
							Iraq
						</option>
											<option value="103" >
							Ireland
						</option>
											<option value="104" >
							Israel
						</option>
											<option value="105" >
							Italy
						</option>
											<option value="106" >
							Ivory Coast
						</option>
											<option value="107" >
							Jamaica
						</option>
											<option value="108" >
							Japan
						</option>
											<option value="109" >
							Jordan
						</option>
											<option value="110" >
							Kazakhstan
						</option>
											<option value="111" >
							Kenya
						</option>
											<option value="112" >
							Kiribati
						</option>
											<option value="113" >
							Korea, Democratic People's Republic of
						</option>
											<option value="114" >
							Korea, Republic of
						</option>
											<option value="115" >
							Kosovo
						</option>
											<option value="116" >
							Kuwait
						</option>
											<option value="117" >
							Kyrgyzstan
						</option>
											<option value="118" >
							Lao People's Democratic Republic
						</option>
											<option value="119" >
							Latvia
						</option>
											<option value="120" >
							Lebanon
						</option>
											<option value="121" >
							Lesotho
						</option>
											<option value="122" >
							Liberia
						</option>
											<option value="123" >
							Libyan Arab Jamahiriya
						</option>
											<option value="124" >
							Liechtenstein
						</option>
											<option value="125" >
							Lithuania
						</option>
											<option value="126" >
							Luxembourg
						</option>
											<option value="127" >
							Macau
						</option>
											<option value="128" >
							Macedonia
						</option>
											<option value="129" >
							Madagascar
						</option>
											<option value="130" >
							Malawi
						</option>
											<option value="131" >
							Malaysia
						</option>
											<option value="132" >
							Maldives
						</option>
											<option value="133" >
							Mali
						</option>
											<option value="134" >
							Malta
						</option>
											<option value="135" >
							Marshall Islands
						</option>
											<option value="136" >
							Martinique
						</option>
											<option value="137" >
							Mauritania
						</option>
											<option value="138" >
							Mauritius
						</option>
											<option value="139" >
							Mayotte
						</option>
											<option value="140" >
							Mexico
						</option>
											<option value="141" >
							Micronesia, Federated States of
						</option>
											<option value="142" >
							Moldova, Republic of
						</option>
											<option value="143" >
							Monaco
						</option>
											<option value="144" >
							Mongolia
						</option>
											<option value="145" >
							Montenegro
						</option>
											<option value="146" >
							Montserrat
						</option>
											<option value="147" >
							Morocco
						</option>
											<option value="148" >
							Mozambique
						</option>
											<option value="149" >
							Myanmar
						</option>
											<option value="150" >
							Namibia
						</option>
											<option value="151" >
							Nauru
						</option>
											<option value="152" >
							Nepal
						</option>
											<option value="153" >
							Netherlands
						</option>
											<option value="154" >
							Netherlands Antilles
						</option>
											<option value="155" >
							New Caledonia
						</option>
											<option value="156" >
							New Zealand
						</option>
											<option value="157" >
							Nicaragua
						</option>
											<option value="158" >
							Niger
						</option>
											<option value="159" >
							Nigeria
						</option>
											<option value="160" >
							Niue
						</option>
											<option value="161" >
							Norfork Island
						</option>
											<option value="162" >
							Northern Mariana Islands
						</option>
											<option value="163" >
							Norway
						</option>
											<option value="164" >
							Oman
						</option>
											<option value="165" >
							Pakistan
						</option>
											<option value="166" >
							Palau
						</option>
											<option value="167" >
							Panama
						</option>
											<option value="168" >
							Papua New Guinea
						</option>
											<option value="169" >
							Paraguay
						</option>
											<option value="170" >
							Peru
						</option>
											<option value="171" >
							Philippines
						</option>
											<option value="172" >
							Pitcairn
						</option>
											<option value="173" >
							Poland
						</option>
											<option value="174" >
							Portugal
						</option>
											<option value="175" >
							Puerto Rico
						</option>
											<option value="176" >
							Qatar
						</option>
											<option value="177" >
							Reunion
						</option>
											<option value="178" >
							Romania
						</option>
											<option value="179" >
							Russian Federation
						</option>
											<option value="180" >
							Rwanda
						</option>
											<option value="181" >
							Saint Kitts and Nevis
						</option>
											<option value="182" >
							Saint Lucia
						</option>
											<option value="183" >
							Saint Vincent and the Grenadines
						</option>
											<option value="184" >
							Samoa
						</option>
											<option value="185" >
							San Marino
						</option>
											<option value="186" >
							Sao Tome and Principe
						</option>
											<option value="187" >
							Saudi Arabia
						</option>
											<option value="188" >
							Senegal
						</option>
											<option value="189" >
							Serbia
						</option>
											<option value="190" >
							Seychelles
						</option>
											<option value="191" >
							Sierra Leone
						</option>
											<option value="192" >
							Singapore
						</option>
											<option value="193" >
							Slovakia
						</option>
											<option value="194" >
							Slovenia
						</option>
											<option value="195" >
							Solomon Islands
						</option>
											<option value="196" >
							Somalia
						</option>
											<option value="197" >
							South Africa
						</option>
											<option value="198" >
							South Georgia South Sandwich Islands
						</option>
											<option value="199" >
							Spain
						</option>
											<option value="200" >
							Sri Lanka
						</option>
											<option value="201" >
							St. Helena
						</option>
											<option value="202" >
							St. Pierre and Miquelon
						</option>
											<option value="203" >
							Sudan
						</option>
											<option value="204" >
							Suriname
						</option>
											<option value="205" >
							Svalbarn and Jan Mayen Islands
						</option>
											<option value="206" >
							Swaziland
						</option>
											<option value="207" >
							Sweden
						</option>
											<option value="208" >
							Switzerland
						</option>
											<option value="209" >
							Syrian Arab Republic
						</option>
											<option value="210" >
							Taiwan
						</option>
											<option value="211" >
							Tajikistan
						</option>
											<option value="212" >
							Tanzania, United Republic of
						</option>
											<option value="213" >
							Thailand
						</option>
											<option value="214" >
							Togo
						</option>
											<option value="215" >
							Tokelau
						</option>
											<option value="216" >
							Tonga
						</option>
											<option value="217" >
							Trinidad and Tobago
						</option>
											<option value="218" >
							Tunisia
						</option>
											<option value="219" >
							Turkey
						</option>
											<option value="220" >
							Turkmenistan
						</option>
											<option value="221" >
							Turks and Caicos Islands
						</option>
											<option value="222" >
							Tuvalu
						</option>
											<option value="223" >
							Uganda
						</option>
											<option value="224" >
							Ukraine
						</option>
											<option value="225" >
							United Arab Emirates
						</option>
											<option value="226" >
							United Kingdom
						</option>
											<option value="227" >
							United States minor outlying islands
						</option>
											<option value="228" >
							Uruguay
						</option>
											<option value="229" >
							Uzbekistan
						</option>
											<option value="230" >
							Vanuatu
						</option>
											<option value="231" >
							Vatican City State
						</option>
											<option value="232" >
							Venezuela
						</option>
											<option value="233" >
							Vietnam
						</option>
											<option value="238" >
							Yemen
						</option>
											<option value="239" >
							Yugoslavia
						</option>
											<option value="240" >
							Zaire
						</option>
											<option value="241" >
							Zambia
						</option>
											<option value="242" >
							Zimbabwe
						</option>
					

				</select>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3"></label>
			<div class="col-md-6">
				<button class="btn btn-info btn-shadow" type="submit">
					<i class="zmdi zmdi-floppy"></i> Save changes
				</button>
			</div>
			<div class="clear"></div>
		</div>
		<input type="hidden" name="user_id" value="43">
		<input type="hidden" name="hash" value="1521553067:2d97d80f5af467caf6a638d16c539634e7b1b7a1">
	</form>
</div>

<div id="modal-progress" class="hidden">    
	<div class="loader"></div>
</div>

<script data-page="general">jQuery(document).ready(function($) {$("#avatar").change(function(event) {$("#edit-avatar").submit();});$("form#edit-general-settings").ajaxForm({url: 'http://localhost/pixelphoto//aj/settings/general',type: 'POST',dataType: 'json',beforeSubmit: function(arr,form){$(form).find('button[type="submit"]').attr('disabled','true');},success: function(data,stat,xhr,form){scroll2top();$.toast(data.message,{duration: 5000,type: '',align: 'top-right',singleton: false});$(form).find('button[type="submit"]').removeAttr('disabled');}});$("#edit-avatar").ajaxForm({url: 'http://localhost/pixelphoto//aj/settings/edit-avatar',type: 'POST',dataType: 'json',data:{user_id: '43'},beforeSend: function(){$("#modal-progress").removeClass('hidden');},success: function(data){if (data.status == 200) {$('.avatar-wrapper').find('img').attr('src', data.avatar);}$.toast(data.message,{duration: 5000,type: '',align: 'top-right',singleton: false});$("#modal-progress").addClass('hidden');}});});</script>

		</div>
		<div class="clear"></div>
	</div>
	<div class="footer__container">
					<div class="footer clearfix">
	<ul class="nav">
		<li>
			<a href="http://localhost/pixelphoto//terms-of-use">
				Terms
			</a>
		</li>
		<li>
			<a href="http://localhost/pixelphoto//privacy-and-policy">
				Privacy & Policy
			</a>
		</li>
		<li>
			<a href="http://localhost/pixelphoto//about-us">
				About
			</a>
		</li>
		<li class="dropup">
			<span class="dropdown-toggle" data-toggle="dropdown">
			    <a>Language</a> <i class="zmdi zmdi-translate"></i>
			</span>
			<ul class="dropdown-menu zoom-up">
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=english'>
				  			English
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=arabic'>
				  			Arabic
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=dutch'>
				  			Dutch
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=french'>
				  			French
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=german'>
				  			German
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=russian'>
				  			Russian
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=spanish'>
				  			Spanish
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=turkish'>
				  			Turkish
				  		</a>
				  	</li>
									<li>
				  		<a href='http://localhost/pixelphoto//?lang=chechen'>
				  			Chechen
				  		</a>
				  	</li>
				
			</ul>
		</li>
		<li>
			<span class="fluid copyright">Copyright &copy; 2018 PixelPhoto</span>
		</li>
	</ul>
</div>
			</div>

	</main>
	
	
	<script type="text/javascript">
(function (factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);
    } 

    else {
        factory(jQuery);
    }
}

(function ($) {
    $.timeago = function(timestamp) {
        if (timestamp instanceof Date) {
            return inWords(timestamp);
        } 
        else if (typeof timestamp === "string") {
            return inWords($.timeago.parse(timestamp));
        } 
        else if (typeof timestamp === "number") {
            return inWords(new Date(timestamp));
        } 
        else {
            return inWords($.timeago.datetime(timestamp));
        }
    };
    var $t = $.timeago;

    $.extend($.timeago, {
        settings: {
            refreshMillis: 60000,
            allowPast: true,
            allowFuture: false,
            localeTitle: false,
            cutoff: 0,
            strings: {
                prefixAgo: null,
                prefixFromNow: null,
                suffixAgo: "ago",
                suffixFromNow: "from now",
                inPast: "any moment now",
                seconds: "Just now",
                minute: "about a minute ago",
                minutes: "%d minutes ago",
                hour: "about an hour ago",
                hours: "%d hours ago",
                day: "a day ago",
                days: "%d days ago",
                month: "about a month ago",
                months: "%d months ago",
                year: "about a year ago",
                years: "%d years ago",
                wordSeparator: " ",
                numbers: []
            }
        },

        inWords: function(distanceMillis) {
            if(!this.settings.allowPast && ! this.settings.allowFuture) {
                throw 'timeago allowPast and allowFuture settings can not both be set to false.';
            }

            var $l = this.settings.strings;
            var prefix = $l.prefixAgo;
            var suffix = $l.suffixAgo;
            if (this.settings.allowFuture) {
                if (distanceMillis < 0) {
                    prefix = $l.prefixFromNow;
                    suffix = $l.suffixFromNow;
                }
            }

            if(!this.settings.allowPast && distanceMillis >= 0) {
                return this.settings.strings.inPast;
            }

            var seconds = Math.abs(distanceMillis) / 1000;
            var minutes = seconds / 60;
            var hours = minutes / 60;
            var days = hours / 24;
            var years = days / 365;

            function substitute(stringOrFunction, number) {
                var string = $.isFunction(stringOrFunction) ? stringOrFunction(number, distanceMillis) : stringOrFunction;
                var value = ($l.numbers && $l.numbers[number]) || number;
                return string.replace(/%d/i, value);
            }

            var words = seconds < 45 && substitute($l.seconds, Math.round(seconds)) ||
            seconds < 90 && substitute($l.minute, 1) ||
            minutes < 45 && substitute($l.minutes, Math.round(minutes)) ||
            minutes < 90 && substitute($l.hour, 1) ||
            hours < 24 && substitute($l.hours, Math.round(hours)) ||
            hours < 42 && substitute($l.day, 1) ||
            days < 30 && substitute($l.days, Math.round(days)) ||
            days < 45 && substitute($l.month, 1) ||
            days < 365 && substitute($l.months, Math.round(days / 30)) ||
            years < 1.5 && substitute($l.year, 1) ||
            substitute($l.years, Math.round(years));

            var separator = $l.wordSeparator || "";
            if ($l.wordSeparator === undefined) { separator = " "; }
            return $.trim([prefix, words].join(separator));

            /*                return $.trim([prefix, suffix].join(separator));
            */
        },

        parse: function(iso8601) {
            var s = $.trim(iso8601);
            s = s.replace(/\.\d+/,""); 
            s = s.replace(/-/,"/").replace(/-/,"/");
            s = s.replace(/T/," ").replace(/Z/," UTC");
            s = s.replace(/([\+\-]\d\d)\:?(\d\d)/," $1$2"); 
            s = s.replace(/([\+\-]\d\d)$/," $100"); 
            return new Date(s);
        },
        datetime: function(elem) {
            var iso8601 = $t.isTime(elem) ? $(elem).attr("datetime") : $(elem).attr("title");
            return $t.parse(iso8601);
        },
        isTime: function(elem) {
            return $(elem).get(0).tagName.toLowerCase() === "time";
        }
    });


    var functions = {
        init: function(){
            var refresh_el = $.proxy(refresh, this);
            refresh_el();
            var $s = $t.settings;
            if ($s.refreshMillis > 0) {
                this._timeagoInterval = setInterval(refresh_el, $s.refreshMillis);
            }
        },
        update: function(time){
            var parsedTime = $t.parse(time);
            $(this).data('timeago', { datetime: parsedTime });
            if($t.settings.localeTitle) $(this).attr("title", parsedTime.toLocaleString());
            refresh.apply(this);
        },
        updateFromDOM: function(){
            $(this).data('timeago', { datetime: $t.parse( $t.isTime(this) ? $(this).attr("datetime") : $(this).attr("title") ) });
            refresh.apply(this);
        },
        dispose: function () {
            if (this._timeagoInterval) {
            window.clearInterval(this._timeagoInterval);
            this._timeagoInterval = null;
            }
        }
    };

    $.fn.timeago = function(action, options) {
        var fn = action ? functions[action] : functions.init;
        if(!fn){
            throw new Error("Unknown function name '"+ action +"' for timeago");
        }
        this.each(function(){
            fn.call(this, options);
        });
        return this;
    };

    function refresh() {
        var data = prepareData(this);
        var $s = $t.settings;

        if (!isNaN(data.datetime)) {
            if ( $s.cutoff == 0 || Math.abs(distance(data.datetime)) < $s.cutoff) {
                $(this).text(inWords(data.datetime));
            }
        }
        return this;
    }

    function prepareData(element) {
        element = $(element);
        if (!element.data("timeago")) {
            element.data("timeago", { datetime: $t.datetime(element) });
            var text = $.trim(element.text());
            if ($t.settings.localeTitle) {
                element.attr("title", element.data('timeago').datetime.toLocaleString());
            } 
            else if (text.length > 0 && !($t.isTime(element) && element.attr("title"))) {
                element.attr("title", text);
            }
        }
        return element.data("timeago");
    }

    function inWords(date) {
        return $t.inWords(distance(date));
    }

    function distance(date) {
        return (new Date().getTime() - date.getTime());
    }

    document.createElement("abbr");
        document.createElement("time");
    }));


    $(function () {
        setInterval(function () {
            if ($('.ajax-time').length > 0) {
                $('.ajax-time').timeago().removeClass('.ajax-time');
            }
        },850);
    });

$(function () {
  setInterval(function () {
    if ( $('.time-ago').length > 0) {
      $('.time-ago').timeago();
    }
  },
  850);
});
</script>
	
	<div class="lightbox__container"></div>	
	
</body>
</html><?php }
}
