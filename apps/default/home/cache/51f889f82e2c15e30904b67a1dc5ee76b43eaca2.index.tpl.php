<?php
/* Smarty version 3.1.30, created on 2018-03-20 14:37:14
  from "C:\xampp\htdocs\pixelphoto\apps\default\home\templates\home\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5ab10e8a92c524_65920310',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'be399c4147014bfa7e5a1c1c0f01a623b0f58a44' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\home\\templates\\home\\index.tpl',
      1 => 1521553010,
      2 => 'file',
    ),
    'e335017ce5287410edcce7af542f789c04baf92f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\container.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '2f7dfcd7d8cb304946544aa51624d363bbb4a01a' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\header\\header.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '11f593bb776076bb0a68ce9d2f5762f7b78e511d' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\js\\h-script.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '54b82251c0e0f8b7ca16c547ccbbddb016021bb5' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\home\\templates\\home\\js\\publisher-box.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'a472c79845c24da991ae986e3fba2c03a156b23d' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\home\\templates\\home\\includes\\post-video.tpl',
      1 => 1521380875,
      2 => 'file',
    ),
    'e0f8fd975cbc681d8333386f899dc9f87e82bb52' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\home\\templates\\home\\includes\\post-image.tpl',
      1 => 1521380808,
      2 => 'file',
    ),
    'f06cf3d06f1fafc3ee6e46400eb4e97a1505836f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\home\\templates\\home\\includes\\post-youtube.tpl',
      1 => 1521380880,
      2 => 'file',
    ),
    '9843b5429480096f13d1b3baf69e5ef03415b019' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\home\\templates\\home\\includes\\sidebar.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '222dd75691ea204d0aab5ebd66cec647d2635414' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\footer\\footer.tpl',
      1 => 1520704074,
      2 => 'file',
    ),
    'ffbe1c486276a03bdb2a477388ef2bd6b1d2c34f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\lazy-load.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
    'f63cc917a87822648fbab589dca182840e39b3e9' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\modals\\delete-post.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '73cda0bbc9a9584963f0831276edbbaf11e66913' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\modals\\delete-comment.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '2955221d382959011ebaf80dfe1a284b1b8cfa9f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\js\\extra-js.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    'faf98376f3fbd24509a51e8a432da888014ea687' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\timeago.tpl',
      1 => 1521380742,
      2 => 'file',
    ),
  ),
  'cache_lifetime' => 3600,
),true)) {
function content_5ab10e8a92c524_65920310 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<meta name="title" content="PixelPhoto">
	<meta name="description" content="PixelPhoto is a PHP Media Sharing Script, PixelPhoto is the best way to start your own media sharing script!">
	<meta name="keywords" content="social, pixelphoto, social site">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Home page</title>
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
	
	
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/owl-carousel2/src/owl.carousel.js"></script>
	<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/js/libs/owl-carousel2/src/assets/owl.carousel.css">
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/gridAlicious/jquery.grid-a-licious.js"></script>
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/afterglow.min.js"></script>
	<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/jquery.pause.js"></script>

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
<body data-app="home" class="body-home">
	<input type="hidden" class="hidden csrf-token" value="1521553022:7e107de3fa1437e84bc766bf7c84641bcd258a7c">
			<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container container-home container-home-header">
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
                                    <li class="active">
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

		<main class="container container-home container-home-main">
		
	<div class="row">
		<div class="home-page-container">	
			<div class="col-md-8">
									<div class="postin-area">
						
						<div id="create-newpost"></div><script>jQuery(document).ready(function($) {$(".create-new-post").click(function(event) {var post_type = $(this).attr('data-type');if (post_type) {$("#modal-progress").removeClass('hidden');$.ajax({url: link('posts/new-' + post_type),type: 'GET',dataType: 'json',}).done(function(data) {if (data.status == 200) {$('body').addClass('active');$("#create-newpost").html(data.html).slideDown(200);$("html,body").stop().animate({scrollTop:0}, 100);}else{if (data.message) {$.toast(data.message,{duration: 5000,type: '',align: 'top-right',singleton: false});}}delay(function(){$("#modal-progress").addClass('hidden');},300);});}});$(document).on('click','#close-anim-modal',function(event) {$("#create-newpost").slideUp(200,function(){$(this).empty();$("body").removeClass('active');});});});</script><template class="template" id="post-editing-template"><div class="content post-editing-form"><div class="user-heading"><img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" width="35px" class="img-circle"><span>deendoughouz</span><span class="pull-right"><i class="ion-edit"></i> Edit post</span></div><form class="form" id="edit-post-caption" action="http://localhost/pixelphoto//aj/posts/update" autocomplete="true"><div class="form-group"><textarea class="form-control" name="caption" rows="4" id="caption" placeholder="Add post caption, #hashtag.. @mention?"></textarea></div><div class="form-group publish"><button type="submit" class="btn btn-info"><i class="la la-paper-plane"></i> Save changes</button><button type="reset" class="btn btn-default" id="close-anim-modal"><i class="la la-ban"></i> Close</button></div><input type="hidden" id="post_id" name="post_id"><input type="hidden" name="hash" value="1521553022:7e107de3fa1437e84bc766bf7c84641bcd258a7c"></form></div></template>
						<div class="clear"></div>
					</div>
				
				<div class="home-posts-container">
																								   		<div class="timeline-posts content-shadow" data-post-id="34">
	<div class="header">
		<img src="media/img/d-avatar.jpg" class="img-circle" width="25px" height="25px;">
		<a href="http://localhost/pixelphoto//@deendoughouz" class="publisher-name">deendoughouz</a>
		<time>
			<i class="zmdi zmdi-time"></i> <span class="time-ago" title="2018-03-18T16:12:56+01:00">2 days ago</span>
		</time>
		<div class="dropdown pull-right">
			<span class="dropdown-toggle" data-toggle="dropdown">
			    <i class="zmdi zmdi-more"></i>
			</span>
			<ul class="dropdown-menu zoom">
			    			    	<li onclick="delete_post('34');">
				  		<a href="javascript:void(0);">Delete post</a>
				  	</li>
			    	<li onclick="edit_post('34');">
			    		<a href="javascript:void(0);">Edit post</a>
			    	</li>
			    			    			    <li>
			  		<a href="http://localhost/pixelphoto//post/34">Go to post</a>
			  	</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="post-video fluid">
					<video class="afterglow" id="postvideo-34" data-autoresize="none">
				<source src="http://localhost/pixelphoto//media/upload/videos/2018/03/nJNsVboo7BQQpXVodbATfjCIF3SartY9snKmczObumpGSsbvQ2_18_571eb4bc8ede0a7f661b25f6792bebee_video.1521385975.mp4" type="video/mp4">
				<source src="http://localhost/pixelphoto//media/upload/videos/2018/03/nJNsVboo7BQQpXVodbATfjCIF3SartY9snKmczObumpGSsbvQ2_18_571eb4bc8ede0a7f661b25f6792bebee_video.1521385975.mp4" type="video/mov">
				<source src="http://localhost/pixelphoto//media/upload/videos/2018/03/nJNsVboo7BQQpXVodbATfjCIF3SartY9snKmczObumpGSsbvQ2_18_571eb4bc8ede0a7f661b25f6792bebee_video.1521385975.mp4" type="video/webm">
				<source src="http://localhost/pixelphoto//media/upload/videos/2018/03/nJNsVboo7BQQpXVodbATfjCIF3SartY9snKmczObumpGSsbvQ2_18_571eb4bc8ede0a7f661b25f6792bebee_video.1521385975.mp4" type="video/3gp">
				<source src="http://localhost/pixelphoto//media/upload/videos/2018/03/nJNsVboo7BQQpXVodbATfjCIF3SartY9snKmczObumpGSsbvQ2_18_571eb4bc8ede0a7f661b25f6792bebee_video.1521385975.mp4" type="video/ogg">
			</video>
		
	</div>
	<div class="actions">
		<span onclick="like_post('34',this);" class="like-post ">
			<i class="zmdi zmdi-favorite-outline"></i>
		</span>
		<span onclick="$('#vote-postf-34').scroll2();">
			<i class="zmdi zmdi-comment-outline"></i>
		</span>

		<span class="pull-right save-post " onclick="save_post('34',this);">
			<i class="zmdi zmdi-star-outline"></i>
		</span>
	</div>
	
	<div class="post-votes">
		
			</div>
	<div class="comments-area">
		<ul class="post-comments-list">
			<li class="caption" data-caption>
							</li>

			

					</ul>
		<form class="form add-comment" id="vote-postf-34">
			<div class="fluid">
				<div class="user-avatar">
					<img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" width="25px" height="25px" class="img-circle">
				</div>
				<div class="form-group">
					<input type="text" class="form-control comment" onkeydown="comment_post(34,event);" placeholder="Write a comment">
				</div>
			</div>
			<div class="commenting-overlay hidden">
				<img src="http://localhost/pixelphoto//media/icons/loadding.gif" alt="">
			</div>
		</form>
	</div>
</div>

<script>
	jQuery(document).ready(function($) {
		afterglow.init();
	});
</script>
						   	
																										   		<div class="timeline-posts content-shadow" data-post-id="33">
	<div class="header">
		<img src="media/img/d-avatar.jpg" class="img-circle" width="25px" height="25px;">
		<a href="http://localhost/pixelphoto//@deendoughouz" class="publisher-name">deendoughouz</a>
		<time>
			<i class="zmdi zmdi-time"></i> <span class="time-ago" title="2018-03-18T16:11:15+01:00">2 days ago</span>
		</time>
		<div class="dropdown pull-right">
			<span class="dropdown-toggle" data-toggle="dropdown">
			    <i class="zmdi zmdi-more"></i>
			</span>
			<ul class="dropdown-menu zoom">
			    			    	<li onclick="delete_post('33');">
				  		<a href="javascript:void(0);">Delete post</a>
				  	</li>
			    	<li onclick="edit_post('33');">
			    		<a href="javascript:void(0);">Edit post</a>
			    	</li>
			    			    			    <li onclick="report_post('33',this);">
			  		<a href="javascript:void(0);">
			  			Report this post			  		</a>
			  	</li>
			  				    <li>
			  		<a href="http://localhost/pixelphoto//post/33">Go to post</a>
			  	</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="post-images fluid lightgallery" data-lightgallery="33">
									<a data-sub-html="#image-caption-33" href="https://media0.giphy.com/media/fem4N1pLjbeUmGdnUX/giphy.gif" class="image-lightbox" data-lightbox>
					<img src="https://media0.giphy.com/media/fem4N1pLjbeUmGdnUX/giphy.gif" class="img-res">
				</a>
			
			</div>
	<div class="actions">
		<span onclick="like_post('33',this);" class="like-post ">
			<i class="zmdi zmdi-favorite-outline"></i>
		</span>
		<span onclick="$('#vote-postf-33').scroll2();">
			<i class="zmdi zmdi-comment-outline"></i>
		</span>

		<span class="pull-right save-post " onclick="save_post('33',this);">
			<i class="zmdi zmdi-star-outline"></i>
		</span>
	</div>
	
		
	<div class="comments-area">
		<ul class="post-comments-list">
			<li class="caption" data-caption>
							</li>

			
			
					</ul>
		
		
		<form class="form add-comment" id="vote-postf-33">
			<div class="fluid">
				<div class="user-avatar">
					<img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" width="25px" height="25px" class="img-circle">
				</div>
				<div class="form-group">
					<input type="text" class="form-control comment" onkeydown="comment_post(33,event);" placeholder="Write a comment">
				</div>
			</div>
			<div class="commenting-overlay hidden">
				<img src="http://localhost/pixelphoto//media/icons/loadding.gif" alt="">
			</div>
		</form>
	</div>
</div>

<script>
	jQuery(document).ready(function($) {
		$('div[data-lightgallery="33"]').lightGallery({
			mode:'lg-fade',
			zoom:true,
			scale:1,
			actualSize:false
		}).on('onBeforeOpen.lg', function(event) {
			event.preventDefault();
			$("body").delay(1000).addClass('page__numb');
		}).on('onBeforeClose.lg',function(event) {
			event.preventDefault();
			$("body").delay(1000).removeClass('page__numb');
		});
	});
</script>

						   	
																										   		<div class="timeline-posts content-shadow" data-post-id="32">
	<div class="header">
		<img src="media/upload/photos/2018/03/tRXGbEqdVAFIRvf9M4eThs7Vhbesu78VVdVaDX4hbSaqZxjTcB_18_cbd6d774c4a49843f665c9422e424b3f_image.jpg" class="img-circle" width="25px" height="25px;">
		<a href="http://localhost/pixelphoto//@deendoughouz12" class="publisher-name">deendoughouz12</a>
		<time>
			<i class="zmdi zmdi-time"></i> <span class="time-ago" title="2018-03-18T15:00:44+01:00">2 days ago</span>
		</time>
		<div class="dropdown pull-right">
			<span class="dropdown-toggle" data-toggle="dropdown">
			    <i class="zmdi zmdi-more"></i>
			</span>
			<ul class="dropdown-menu zoom">
			    			    	<li onclick="delete_post('32');">
				  		<a href="javascript:void(0);">Delete post</a>
				  	</li>
			    	<li onclick="edit_post('32');">
			    		<a href="javascript:void(0);">Edit post</a>
			    	</li>
			    			    			    <li>
			  		<a href="http://localhost/pixelphoto//post/32">Go to post</a>
			  	</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="post-embed-frame fluid">
		<iframe style="width: 100%; min-height: 340px;" src="https://www.youtube.com/embed/JSaWT424tV8" frameborder="0"></iframe>
	</div>
	<div class="actions">
		<span onclick="like_post('32',this);" class="like-post ">
			<i class="zmdi zmdi-favorite-outline"></i>
		</span>
		<span onclick="$('#vote-postf-32').scroll2();">
			<i class="zmdi zmdi-comment-outline"></i>
		</span>

		<span class="pull-right save-post " onclick="save_post('32',this);">
			<i class="zmdi zmdi-star-outline"></i>
		</span>
	</div>
	<div class="post-votes">
		
			</div>
	<div class="comments-area">
		<ul class="post-comments-list">
			<li class="caption" data-caption>
							</li>

			
			
					</ul>
		<form class="form add-comment" id="vote-postf-32">
			<div class="fluid">
				<div class="user-avatar">
					<img src="http://localhost/pixelphoto//media/img/d-avatar.jpg" width="25px" height="25px" class="img-circle">
				</div>
				<div class="form-group">
					<input type="text" class="form-control comment" onkeydown="comment_post(32,event);" placeholder="Write a comment">
				</div>
			</div>
			<div class="commenting-overlay hidden">
				<img src="http://localhost/pixelphoto//media/icons/loadding.gif" alt="">
			</div>
		</form>
	</div>
</div>
						   	
													
									</div>
				<div class="posts__loader hidden">
					<img src="http://localhost/pixelphoto//media/icons/loadding.gif" alt="Loading">
				</div>
			</div>
			<div class="col-md-4" id="home-rsidebar-container">
				<div class="home-sidebar-right">	
	<div id="home-sidebar-sticky">
					<div class="featured-posts">
				<h5>
					Featured posts
				</h5>
				<div class="fluid list">
											<div class="item" id="">
							<a href="http://localhost/pixelphoto//post/30" class="fluid">
								<div class="thumb" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/lkD2el4SHSk1uwmDFfXPSFqSluq5nqatFnISG7Dnb3GNQSan8O_18_3be23bc40a0ffb4897a9c302e3e7b741_image.png');">
								</div>
								<div class="caption">
									<div class="uname">
										<h6>
											deendoughouz
										</h6>
									</div>
									<span>
																					<time>2 days ago</time>
																			</span>
								</div>
							</a>
						</div>
											<div class="item" id="">
							<a href="http://localhost/pixelphoto//post/24" class="fluid">
								<div class="thumb" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/G2WyP2LIJp8shj3NLgvWlVPd7bfzx5wAn8IwKIQBz1aEEexBUZ_18_0ff50d25f10c9ed1b3d5d392fb454344_image.png');">
								</div>
								<div class="caption">
									<div class="uname">
										<h6>
											deendoughouz
										</h6>
									</div>
									<span>
																					<time>2 days ago</time>
																			</span>
								</div>
							</a>
						</div>
											<div class="item" id="">
							<a href="http://localhost/pixelphoto//post/25" class="fluid">
								<div class="thumb" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/1x4NzGZtYdWbuzBDJmuQ4QKtbYRf3geJVct71vitIzWPl1w3sh_18_3318fa4ef254738cf4c0817c0fd33aaa_image.png');">
								</div>
								<div class="caption">
									<div class="uname">
										<h6>
											deendoughouz
										</h6>
									</div>
									<span>
																					<time>2 days ago</time>
																			</span>
								</div>
							</a>
						</div>
											<div class="item" id="">
							<a href="http://localhost/pixelphoto//post/26" class="fluid">
								<div class="thumb" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/lGjYW4ivGyyECR265geGJWGdxF5qsvcZ7TcjpVcDYKnZk8fg1A_18_627a255f99ae69c28a75f40d9ea90c64_image.png');">
								</div>
								<div class="caption">
									<div class="uname">
										<h6>
											deendoughouz
										</h6>
									</div>
									<span>
																					<time>2 days ago</time>
																			</span>
								</div>
							</a>
						</div>
											<div class="item" id="">
							<a href="http://localhost/pixelphoto//post/27" class="fluid">
								<div class="thumb" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/pkwcPAAjd1krbmriXvYb8d3vb6ysXszdDGTauBwCcTY3H3629M_18_4b45cc31dba9201817823a30ebafccb2_image.png');">
								</div>
								<div class="caption">
									<div class="uname">
										<h6>
											deendoughouz
										</h6>
									</div>
									<span>
																					<time>2 days ago</time>
																			</span>
								</div>
							</a>
						</div>
											<div class="item" id="">
							<a href="http://localhost/pixelphoto//post/28" class="fluid">
								<div class="thumb" style="background-image: url('http://localhost/pixelphoto//media/upload/photos/2018/03/IVwiFAa35tk7pSdh8FN9hbj87LkDs9XqQSw5XqcYLE4a7LAL49_18_f4ef1730c1ab54588ba9bfd5a83b4a6d_image.jpg');">
								</div>
								<div class="caption">
									<div class="uname">
										<h6>
											deendoughouz
										</h6>
									</div>
									<span>
																					<time>2 days ago</time>
																			</span>
								</div>
							</a>
						</div>
					
					<div class="clear"></div>
				</div>
			</div>
							<div class="stories">
				<h5>
					Stories
				</h5>
				<div class="fluid list">
											<span class="fluid">
							Here will be stories from people you follow.
						</span>
									</div>
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
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>
<script>
	jQuery(document).ready(function($) {
		$("#home-rsidebar-container").stick_in_parent({
			inner_scrolling:true,
			offset_top: 60,
			bottoming:false,
		});

		
		$("div[data-story]").click(function(event) {
			var id = $(this).data('story');
			if (id) {
				$.ajax({
					url: link('story/show'),
					type: 'GET',
					dataType: 'json',
					data: {user_id:id},
				})
				.done(function(data) {
					if ($('body').find('.story-container').length) {
						$('.story-container').replaceWith($(data.html));
					}
					else{
						$('body').prepend($(data.html));
					}
				});
			}
		});
		
	});
</script>
			</div>
			<div class="clear"></div>
		</div>
					<div class="add-post-bf--controls clearfix">
				<div class="btns">
											<div class="nd6 nds" data-toggle="tooltip" title="Add story">
							<span class="create-new-post" data-type="story">
					      		<i class="zmdi zmdi-layers"></i>
					      	</span>
						</div>
																<div class="nd5 nds" data-toggle="tooltip" title="Embed gif">
							<span class="create-new-post" data-type="gif">
					      		<i class="zmdi zmdi-gif"></i>
					      	</span>
						</div>
																<div class="nd4 nds" data-toggle="tooltip" title="Embed video">
					      	<span class="create-new-post" data-type="embed">
					      		<i class="zmdi zmdi-link"></i>
					      	</span>
						</div>	
																<div class="nd3 nds" data-toggle="tooltip" title="Upload video">
							<span class="create-new-post" data-type="video">
					      		<i class="zmdi zmdi-comment-video"></i>
					      	</span>
						</div>
																<div class="nd1 nds" data-toggle="tooltip" title="Upload image">
					      	<span class="create-new-post" data-type="image">
								<i class="zmdi zmdi-camera-party-mode"></i>
							</span>
						</div>	
									</div>
				<div id="floating-button">
					<span class="plus">
						<i class="ion-android-add"></i>
					</span>
					<i class="edit ion-edit"></i>
				</div>
			</div>
				<div class="clear"></div>
	</div>


	<div id="modal-progress" class="hidden">    
	<div class="loader"></div>
</div>
	<div class="confirm--modal delpost--modal" style="display: none !important;">
	<div class="confirm--modal--inner">
		<div class="confirm--modal--body">
			<h5>
				Delete post?
			</h5>
			<p>
				Are you sure you want to delete this post? this action can not be undo
			</p>
		</div>
		<div class="confirm--modal--footer">
			<button class="col-md-6 col-lg-6 col-xs-12" data-confirm--modal-dismiss>
				Cancel
			</button>
			<button class="col-md-6 col-lg-6 col-xs-12 delete--post">
				Okey
			</button>
		</div>
	</div>
</div>
	<div class="confirm--modal delcomment--modal" style="display: none !important;">
	<div class="confirm--modal--inner">
		<div class="confirm--modal--body">
			<h5>
				Delete comment?
			</h5>
			<p>
				Are you sure you want to delete this comment?
			</p>
		</div>
		<div class="confirm--modal--footer">
			<button class="col-md-6 col-lg-6 col-xs-12" data-confirm--modal-dismiss>
				Cancel
			</button>
			<button class="col-md-6 col-lg-6 col-xs-12 delete--comment">
				Okey
			</button>
		</div>
	</div>
</div>
	
	
	<script>
		jQuery(document).ready(function($) {
			var scrolled = 0;
			var last_id  = 0;
			var posts_cn = $('.home-posts-container');

			$(window).scroll(function() {
			    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			    	if (scrolled == 0) {
		                scrolled = 1;
		                posts_cn.siblings('.posts__loader').removeClass('hidden');
			            if ($('[data-post-id]').length > 0) {
			            	last_id  = $('[data-post-id]').last().data('post-id');
			            }
			            
						$.ajax({
							url: link('posts/load-tl-posts'),
							type: 'GET',
							dataType: 'json',
							data: {offset:last_id},
						}).done(function(data) {
							if (data.status == 200) {
								posts_cn.append($(data.html));
								scrolled = 0;
							}
							else{
								$(window).unbind('scroll');
							}

							posts_cn.siblings('.posts__loader').addClass('hidden');
						});
		       		}
			    }
			});
		});
	</script>
	

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
	
<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/lightGallery/src/js/lightgallery.js"></script>
<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/lightGallery/modules/lg-zoom.js"></script>
<script src="http://localhost/pixelphoto//apps/default/main/static/js/libs/lightGallery/modules/lg-fullscreen.js"></script>
<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/js/libs/lightGallery/src/css/lightgallery.css">
<link rel="stylesheet" href="http://localhost/pixelphoto//apps/default/main/static/js/libs/lightGallery/src/css/lg-transitions.css">

</body>
</html><?php }
}
