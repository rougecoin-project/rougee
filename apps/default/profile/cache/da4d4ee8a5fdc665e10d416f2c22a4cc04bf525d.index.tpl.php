<?php
/* Smarty version 3.1.30, created on 2018-03-20 14:37:39
  from "C:\xampp\htdocs\pixelphoto\apps\default\profile\templates\profile\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5ab10ea3d31795_48832681',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4e9212aa16b2c44e3be79fa488b87b08cc0067b9' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\profile\\templates\\profile\\index.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'fd86c2ab0d8d2a55363bdb51ff94e466380ea504' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\container.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '8b669792ca927b5753e3dab33d54e14ae6cf67c0' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\header\\header.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '5e9d1f9becc280ab5346b3fa39827054c9f65c0f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\js\\h-script.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '55f185100eaddb95953f35b68cec1e902d8bf556' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\profile\\templates\\profile\\posts.tpl',
      1 => 1520704074,
      2 => 'file',
    ),
    'b149fc6e16d0cd21c74fe96f6cfbe611bed33778' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\profile\\templates\\profile\\includes\\list.tpl',
      1 => 1520704074,
      2 => 'file',
    ),
    '8e9589d27fe6f787819d8850c0e3362467d57bee' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\footer\\footer.tpl',
      1 => 1520704074,
      2 => 'file',
    ),
    'bd6cc86a63896a9deedfb2cc65ba04dd9a04b00b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\profile\\templates\\profile\\js\\script.tpl',
      1 => 1520704074,
      2 => 'file',
    ),
    'f5c27f44c7eb6d919880fa9d01acc78771179b05' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\lazy-load.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
    'b1294fa443f45d24c9f9e59bf13dcc75ab5d2433' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\js\\extra-js.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'e3db659bf0b1be95e06e6cf1e9b27fcae6a7c9ef' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\timeago.tpl',
      1 => 1521380742,
      2 => 'file',
    ),
  ),
  'cache_lifetime' => 3600,
),true)) {
function content_5ab10ea3d31795_48832681 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<meta name="title" content="PixelPhoto">
	<meta name="description" content="PixelPhoto is a PHP Media Sharing Script, PixelPhoto is the best way to start your own media sharing script!">
	<meta name="keywords" content="social, pixelphoto, social site">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>deendoughouz</title>
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
	

<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/gridAlicious/jquery.grid-a-licious.js"></script>
<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/jquery.equalheights.js"></script>


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
<body data-app="profile" class="body-profile">
	<input type="hidden" class="hidden csrf-token" value="1521553022:7e107de3fa1437e84bc766bf7c84641bcd258a7c">
			<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container container-profile container-profile-header">
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
                                            <li title="Admin panel">
                            <a href="http://localhost/pixelphoto//admin-panel">
                                <i class="ion-android-options"></i>
                            </a>
                        </li>
                                        <li class="">
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

		<main class="container container-profile container-profile-main">
		
	<div class="user-profile-page-content">
		<div class="user-heading">
			<div class="container container-profile user-info">
				<div class="avatar">
					<img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" class="img-circle">
				</div>
				<div class="info">	
					<div class="uname">
						<span>
							<a href="http://localhost/pixelphoto//@deendoughouz">
								<h4>deendoughouz</h4>
							</a>
						</span>

													<a href="http://localhost/pixelphoto//settings/general/deendoughouz">
								<button class="btn btn-info">
									<i class="ion-compose"></i> Profile settings
								</button>
							</a>
						
						
													<span class="modal-menu" data-modal-menu="ps-modal-menu">
								<i class="ion-ios-more-outline"></i>
							</span>	
											</div>
		            <div class="clear"></div>
		            <p class="fluid status">
						
					</p>
					<ul class="navbar-nav nav justify-content-center social-links">
						
						
						
											</ul>
				</div>
			</div>
			<div class="navbar-bottom">
				<div class="container container-profile">
					<ul class="navbar-nav nav justify-content-center">
		                <li class="nav-item active">
		                    <a class="nav__item" href="http://localhost/pixelphoto//@deendoughouz/posts">
		                    	<span>9 </span> Posts
		                    </a>
		                </li>
		                <li class="nav-item ">
		                    <a class="nav__item" href="http://localhost/pixelphoto//@deendoughouz/followers">
		                    Followers <span>1</span>
		                    </a>
		                </li>
		                <li class="nav-item ">
		                    <a class="nav__item" href="http://localhost/pixelphoto//@deendoughouz/following">
		                    	<span>1</span> Following
		                    </a>
		                </li>
		                		                	<li class="nav-item ">
			                    <a class="nav__item" href="http://localhost/pixelphoto//@deendoughouz/favourites">
			                    	<span>1</span> Favourites
			                    </a>
			                </li>
		                
		                		            </ul>
				</div>
            </div>
		</div>
									<div class="fluid include">
					<div class="container container-profile user-posts__container">
	<div class="user-posts">
									<div class="item wrapper">
	<div class="user-postset" id="35">
		<div class="media"  onclick="lightbox('35','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/ccfc061693041763afa82d9cece0aba111d792c5.video_thumb.jpeg');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
							<span class="category">
					<i class="ion-ios-videocam"></i>
				</span>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="33">
		<div class="media"  onclick="lightbox('33','posts');" style="background-image: url('https://media0.giphy.com/media/fem4N1pLjbeUmGdnUX/giphy.gif');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="30">
		<div class="media"  onclick="lightbox('30','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/lkD2el4SHSk1uwmDFfXPSFqSluq5nqatFnISG7Dnb3GNQSan8O_18_3be23bc40a0ffb4897a9c302e3e7b741_image.png');">
			<div class="caption">
				<span>
					2 Likes	
				</span>
				<span>
					53 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="29">
		<div class="media"  onclick="lightbox('29','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/iDnI5TOFk3rZrDRxrM85oQwwCMs92zfcMymXmOSGLYb37IHtm3_18_be044318edbb4bc099ea78b72cf2bb82_image.png');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="28">
		<div class="media"  onclick="lightbox('28','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/IVwiFAa35tk7pSdh8FN9hbj87LkDs9XqQSw5XqcYLE4a7LAL49_18_f4ef1730c1ab54588ba9bfd5a83b4a6d_image.jpg');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="27">
		<div class="media"  onclick="lightbox('27','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/pkwcPAAjd1krbmriXvYb8d3vb6ysXszdDGTauBwCcTY3H3629M_18_4b45cc31dba9201817823a30ebafccb2_image.png');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="26">
		<div class="media"  onclick="lightbox('26','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/lGjYW4ivGyyECR265geGJWGdxF5qsvcZ7TcjpVcDYKnZk8fg1A_18_627a255f99ae69c28a75f40d9ea90c64_image.png');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="25">
		<div class="media"  onclick="lightbox('25','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/1x4NzGZtYdWbuzBDJmuQ4QKtbYRf3geJVct71vitIzWPl1w3sh_18_3318fa4ef254738cf4c0817c0fd33aaa_image.png');">
			<div class="caption">
				<span>
					0 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
							<div class="item wrapper">
	<div class="user-postset" id="24">
		<div class="media"  onclick="lightbox('24','posts');" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/G2WyP2LIJp8shj3NLgvWlVPd7bfzx5wAn8IwKIQBz1aEEexBUZ_18_0ff50d25f10c9ed1b3d5d392fb454344_image.png');">
			<div class="caption">
				<span>
					1 Likes	
				</span>
				<span>
					0 Comments	
				</span>
			</div>
					</div>
	</div>
</div>
			
			</div>
</div>

<script>
	var ajax_url = 'http://localhost/pixelphoto//aj/posts';
	var user_id  = '43';
	
	var gwidth = ($('.user-posts').width() / 3);
	$(".user-posts").gridalicious({
		selector: '.item',
		gutter: 0,
		width:gwidth,
		animate: true,
		animationOptions: { 
		    speed: 100, 
		    duration: 200
		}
	});

	jQuery(document).ready(function($) {
		var scrolled = 0;
		var last_id  = 0;

		$(window).scroll(function() {
		    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {

		    	if (scrolled == 0) {
	                scrolled = 1;
	                var list_ids = $("div.user-postset[id]").map(function() {
		                return $(this).attr('id');
		            }).get();

		            if (!list_ids) {
		                return false;
		            }
		            
    				var last_id  = Math.min.apply(Math,list_ids);

					$.ajax({
						url: ajax_url + '/load-user-posts',
						type: 'GET',
						dataType: 'json',
						data: {
							offset:last_id,
							user_id:user_id
						},
					}).done(function(data) {
						if (data.status == 200) {
							$(".user-posts").gridalicious('append', $(data.html));
							scrolled = 0;
						}
						else{
							$(window).unbind('scroll');
						}
					});
	       		}
		    }
		});
	});
	
</script>
				</div>
							<div class="container container-profile">
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
		</div>
	</div>

			<div class="modal--menu" id="ps-modal-menu">
			<div class="modal-outer">
				<div class="modal-inner">
					<ul class="list-group">
													<li class="list-group-item">
								<a href="http://localhost/pixelphoto//settings/privacy/deendoughouz">
									Profile privacy
								</a>
							</li>
							<li class="list-group-item">
								<a href="http://localhost/pixelphoto//settings/notifications/deendoughouz">
									Notifications
								</a>
							</li>
							<li class="list-group-item">
								<a href="http://localhost/pixelphoto//signout">
									Logout
								</a>
							</li>
						
																			<li class="list-group-item">
								<a href="http://localhost/pixelphoto//admin-panel">
									Admin panel
								</a>
							</li>
												<li class="list-group-item" data-modal--menu-dismiss>
							<a href="#">
								Close
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	
		
	
	<script></script>

	
	
	<div id="modal-progress" class="hidden">    
	<div class="loader"></div>
</div>


	</main>
	
			
		<script>function follow(user_id,object){if (!user_id || !object) { return false; }if (not(is_logged())) {redirect('welcome');return false;}object = $(object);if (object.hasClass('btn-following') == false) {object.find('span').text("Following");object.find('i').replaceWith($('<i>',{class:'ion-person'}));if (!object.hasClass('btn-following')) {object.addClass('btn-following');}}else if(object.hasClass('btn-following') == true){object.find('span').text("Follow");object.find('i').replaceWith($('<i>',{class:'ion-person-add'}));if (object.hasClass('btn-following')) {object.removeClass('btn-following');}}else{return false;}$.ajax({url: link('main/follow'),type: 'GET',dataType: 'json',data: {user_id:user_id},}).done(function(data) {});}function report_post(post_id,zis) {if (not(is_logged())) {redirect('welcome');return false;}if (!post_id || !zis) {return false;}$.ajax({url: link('posts/report'),type: 'POST',dataType: 'json',data: {id: post_id},}).done(function(data) {if (data.status == 200 && data.code == 1) {$(zis).find('a').text('Cancel report');}else if(data.status == 200 && data.code == 0){$(zis).find('a').text('Report this post');}$.toast(data.message,{duration: 5000,type: '',align: 'top-right',singleton: false});});}</script>
	
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
