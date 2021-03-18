<?php
/* Smarty version 3.1.30, created on 2018-03-20 14:51:01
  from "C:\xampp\htdocs\pixelphoto\apps\default\messages\templates\messages\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5ab111c5741d27_76984562',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '57a1b67e5b9a4d0b15e0abbdf7d2a085640d6fa7' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\messages\\templates\\messages\\index.tpl',
      1 => 1521381082,
      2 => 'file',
    ),
    '067d2fe504368a6f16e5355abd247fd97ceb1bfe' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\container.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '1483f67e5493dd2efc0b520e817975e20b90ddd1' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\header\\header.tpl',
      1 => 1521379755,
      2 => 'file',
    ),
    '64153a72a1f2207d304aaf610ac387dad07fd9d8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\js\\h-script.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    'bc5a37f4ce180419a24e75c6f058624959da7ccb' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\modals\\clear-chat.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '8eb9f9a5956d2e781bb048c188eac75a31db5f63' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\modals\\delete-chat.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    'dde38dc45635c1815fe9758df5994276e901689f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\modals\\delete-messages.tpl',
      1 => 1521185601,
      2 => 'file',
    ),
    '6f0dd3715a27658eccb31b016e63d68ca4cf124c' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\includes\\timeago.tpl',
      1 => 1521380742,
      2 => 'file',
    ),
  ),
  'cache_lifetime' => 3600,
),true)) {
function content_5ab111c5741d27_76984562 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">

	<meta name="title" content="PixelPhoto">
	<meta name="description" content="PixelPhoto is a PHP Media Sharing Script, PixelPhoto is the best way to start your own media sharing script!">
	<meta name="keywords" content="social, pixelphoto, social site">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>Messages</title>
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
<body data-app="messages" class="body-messages">
	<input type="hidden" class="hidden csrf-token" value="1521553067:2d97d80f5af467caf6a638d16c539634e7b1b7a1">
			<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container container-messages container-messages-header">
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
                <li class="active">
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
                    <li class="active">
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

		<main class="container container-messages container-messages-main">
		
	<div class="messages-container">
		<div class="header-composition">
			<div class="row">
				<div class="col-md-4">
					<form class="form search-users">
						<div class="text-input">
							<input type="text" class="form-control" placeholder="Search.." id="search-chats">
							<i class="ion-ios-search"></i>
						</div>			
					</form>
				</div>
				<div class="col-md-8">
											<div class="privacy-settings">
							<span>
								<i class="ion-chatboxes"></i> <strong>Messages</strong>
							</span>
							<a href="http://localhost/pixelphoto//settings/privacy/deendoughouz">
								<i class="ion-ios-gear-outline"></i>
							</a>
						</div>
									</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="row content">
			<div class="col-md-4">
				<div class="chat-list">
					<ul>
						
					</ul>
				</div>
			</div>
			<div class="col-md-8">
				<div class="conversation"  style="background-image: url('http://localhost/pixelphoto//media/img/chat-wp/default.png');">		
											<div class="select-chat">
							<p>
								<span class="fluid">
									<i class="ion-chatbubbles"></i>
								</span>
								Please select a chat to start messaging
							</p>
						</div>
									</div>
			</div>
		</div>
	</div>

	<div class="confirm--modal clearchat--modal" style="display: none !important;">
	<div class="confirm--modal--inner">
		<div class="confirm--modal--body">
			<h5>
				Clear messages?
			</h5>
			<p>
				Are you sure you want to delete this conversation?
			</p>
		</div>
		<div class="confirm--modal--footer">
			<button class="col-md-6 col-lg-6 col-xs-12" data-confirm--modal-dismiss>
				Cancel
			</button>
			<button class="col-md-6 col-lg-6 col-xs-12 clear--chat">
				Okey
			</button>
		</div>
	</div>
</div>
	<div class="confirm--modal delchat--modal" style="display: none !important;">
	<div class="confirm--modal--inner">
		<div class="confirm--modal--body">
			<h5>
				Delete chat?
			</h5>
			<p>
				Are you sure you want to delete this chat? all your conversation will be deleted
			</p>
		</div>
		<div class="confirm--modal--footer">
			<button class="col-md-6 col-lg-6 col-xs-12" data-confirm--modal-dismiss>
				Cancel
			</button>
			<button class="col-md-6 col-lg-6 col-xs-12 delete--chat">
				Okey
			</button>
		</div>
	</div>
</div>
	<div class="confirm--modal delmessages--modal" style="display: none !important;">
	<div class="confirm--modal--inner">
		<div class="confirm--modal--body">
			<h5>
				Delete messages?
			</h5>
			<p>
				Are you sure you want to delete this messages? confirm to continue
			</p>
		</div>
		<div class="confirm--modal--footer">
			<button class="col-md-6 col-lg-6 col-xs-12" data-confirm--modal-dismiss>
				Cancel
			</button>
			<button class="col-md-6 col-lg-6 col-xs-12 delete--messages">
				Okey
			</button>
		</div>
	</div>
</div>

		<style>
		body{ 
			background-image: url('http://localhost/pixelphoto//media/img/chat-wp/body-bg.png') !important;
		}
	</style>

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
