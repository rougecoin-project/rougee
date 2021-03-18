{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="row">
		<div class="welcome-page-container row">
			<div class="col-sm-6 col-md-8 pp_welcome_feature">
				<div class="logo">
					<a href="{$site_url}"><img src="{$site_url}/media/img/logo.png" width="42px" alt="logo"></a>
				</div>
				<h1 class="animated fadeInUpBig">{lang('welcome_to')} {$config.site_name}</h1>
				<div class="row margin0">
					<div class="col-md-4 feature_block animated fadeInUpBig">
						<div class="inner_blck">
							<b>{lang('like')}</b>
							<p>{lang('welcome_feature_1')}</p>
						</div>
						<div class="inner_svg"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart" color="#ff1100"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
					</div>
					<div class="col-md-4 feature_block animated fadeInUpBig">
						<div class="inner_blck">
							<b>{lang('follow')}</b>
							<p>{lang('welcome_feature_2')}</p>
						</div>
						<div class="inner_svg"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-plus" color="#4caf50"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg></div>
					</div>
					<div class="col-md-4 feature_block animated fadeInUpBig">
						<div class="inner_blck">
							<b>{lang('save')}</b>
							<p>{lang('welcome_feature_3')}</p>
						</div>
						<div class="inner_svg"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bookmark" color="#ff9800"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg></div>
					</div>
				</div>
				<div class="pp_wel_footer animated fadeInUpBig">
					{if $config.signup_system == 'on'}
						<a class="btn btn-info btn_register" href="{$site_url}/signup">{lang('signup_now')}</a> 
					{/if}
					<ul class="lang_select pull-right">
						<li class="dropup">
							<span class="dropdown-toggle" data-toggle="dropdown">
								<svg fill="#7a7a7a" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" class="feather feather-translate"><path d="M12.87,15.07L10.33,12.56L10.36,12.53C12.1,10.59 13.34,8.36 14.07,6H17V4H10V2H8V4H1V6H12.17C11.5,7.92 10.44,9.75 9,11.35C8.07,10.32 7.3,9.19 6.69,8H4.69C5.42,9.63 6.42,11.17 7.67,12.56L2.58,17.58L4,19L9,14L12.11,17.11L12.87,15.07M18.5,10H16.5L12,22H14L15.12,19H19.87L21,22H23L18.5,10M15.88,17L17.5,12.67L19.12,17H15.88Z"></path></svg> {lang('language')}
							</span>
							<ul class="dropdown-menu">
								{foreach $langs as $key => $val}
									<li>
										<a href='{pxp_link("?lang={$key}")}'>{$val}</a>
									</li>
								{/foreach}
							</ul>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="col-sm-6 col-md-4 pp_welcome_sign">
			<h3>{lang('sign_in')}</h3>
				<div class="signin-alert"></div>
				<form action="" class="form" id="login">
					<div class="pp_mat_input">
						<input class="form-control" type="text" name="username" id="username" placeholder="{lang('uname_or_email')}" required autofocus />
						<label for="username">{lang('uname_or_email')}</label>
						<span class="bar"></span>
					</div>

					<div class="pp_mat_input">
						<input class="form-control" type="password" name="password" id="password" placeholder="{lang('ur_password')}" required />
						<label for="password">{lang('ur_password')}</label>
						<span class="bar"></span>
					</div>
					<div class="form-group">
						<a href="{$site_url}/forgot">{lang('forgot_ur_passwd')}</a>
						<ul class="social-login clearfix nav pull-right">
							{if $config.fb_login == 'on'}
								<li class="facebook"><a href="{$site_url}/social_login.php?provider=Facebook"><svg xmlns="http://www.w3.org/2000/svg" class="feather feather-facebook" width="24" height="24" viewBox="0 0 24 24" fill="#4267b2"><path d="M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z" /></svg></a></li>
							{/if}
							{if $config.tw_login == 'on'}
								<li class="twitter"><a href="{$site_url}/social_login.php?provider=Twitter"><svg xmlns="http://www.w3.org/2000/svg" class="feather feather-twitter" width="24" height="24" viewBox="0 0 24 24" fill="#1da1f2"><path d="M22.46,6C21.69,6.35 20.86,6.58 20,6.69C20.88,6.16 21.56,5.32 21.88,4.31C21.05,4.81 20.13,5.16 19.16,5.36C18.37,4.5 17.26,4 16,4C13.65,4 11.73,5.92 11.73,8.29C11.73,8.63 11.77,8.96 11.84,9.27C8.28,9.09 5.11,7.38 3,4.79C2.63,5.42 2.42,6.16 2.42,6.94C2.42,8.43 3.17,9.75 4.33,10.5C3.62,10.5 2.96,10.3 2.38,10C2.38,10 2.38,10 2.38,10.03C2.38,12.11 3.86,13.85 5.82,14.24C5.46,14.34 5.08,14.39 4.69,14.39C4.42,14.39 4.15,14.36 3.89,14.31C4.43,16 6,17.26 7.89,17.29C6.43,18.45 4.58,19.13 2.56,19.13C2.22,19.13 1.88,19.11 1.54,19.07C3.44,20.29 5.7,21 8.12,21C16,21 20.33,14.46 20.33,8.79C20.33,8.6 20.33,8.42 20.32,8.23C21.16,7.63 21.88,6.87 22.46,6Z" /></svg></a></li>
							{/if}
							{if $config.gl_login == 'on'}
								<li class="google"><a href="{$site_url}/social_login.php?provider=Google"><svg xmlns="http://www.w3.org/2000/svg" class="feather feather-google" width="24" height="24" viewBox="0 0 24 24" fill="#db4437"><path d="M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z" /></svg></a></li>
							{/if}
							{if $config.wowonder_login == 'on'}
							    <li>
							        <a href="{$config.wowonder_domain_uri}/oauth?app_id={$config.wowonder_app_ID}" style="padding: 0px;height: inherit;width: inherit;line-height: inherit;margin: 0px;">
				                        <img src="{$config.wowonder_domain_icon}" alt="" style="width: 13px;margin-top: -11px;">
				                    </a>
				                </li>
				            {/if}
						</ul>
					</div>
					
					<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit"><span>{lang('login')} <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></span></button></div>

					<input type="hidden" name="hash" value="{$csrf_token}">
				</form>
			</div>
		</div>
	</div>
	<script>
		jQuery(document).ready(function($) {
			$("form#login").ajaxForm({
				url: '{$xhr_url}/signin',
				type: 'POST',
				dataType: 'json',
				beforeSend: function(){
					$('form').find('.pp_load_loader').addClass('loadingg');
					$('form').find('button[type="submit"]').attr('disabled','true');
				},
				success: function(data){
					if (data.status == 200) {
					    $(".signin-alert").html($('<div>',{
							class: 'alert alert-success',
							text: 'you were successfully logged in, please wait...'
						}));
						
						setTimeout(function(){
							window.location.href = "{$site_url}";
						},2000);

					}

					else{
						$(".signin-alert").html($('<div>',{
							class: 'alert alert-danger',
							text: data.message
						}));
					}
					$('form').find('.pp_load_loader').removeClass('loadingg');
	                $('form').find('button[type="submit"]').removeAttr('disabled');
				}
			})
		});
	</script>

	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.1.0/cookieconsent.min.css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.1.0/cookieconsent.min.js"></script>
	<script>
	window.addEventListener("load", function(){
	window.cookieconsent.initialise({
	"palette": {
		"popup": {
		"background": "#3937a3"
		},
		"button": {
		"background": "#e62576"
		}
	},
	"theme": "classic",
	"position": "bottom-left",
	"content": {
		"message": "{lang('website_use_cookies')}",
		"dismiss": "{lang('got_it')}",
			"link": "{lang('learn_more1')}",
			"href": "{$site_url}/privacy-and-policy"
	}
	})});
	</script>

{/block}