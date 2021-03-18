{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="row">
		<div class="welcome-page-container row signup-page-container">
			<div class="col-sm-4 col-md-4 pp_signup_intro">
				<div class="pp_intro_innr">
					<div>
						<span class="user_avatar animated bounceIn avatar_male">
							<img src="{$site_url}/media/img/user-m.png" class="male_ava" alt="user">
							<img src="{$site_url}/media/img/user-f.png" class="female_ava" alt="user">
						</span>
						<h3 class="animated fadeInUpBig">{lang('let_set_up')}</h3>
						<h4 class="animated fadeInUpBig">{lang('create_acc_proceed')} {$config.site_name}</h4>
						<p class="animated fadeInUpBig">{lang('min_to_get_start')}</p>
						<span class="fluid copyright">Copyright &copy; 2018 {$config.site_name}</span>
					</div>
				</div>
			</div>
			<div class="col-sm-8 col-md-8">
			<div class="col-sm-2 col-md-3"></div>
			<div class="col-sm-8 col-md-6 pp_welcome_sign pp_welcome_signup">
				<div class="logo">
					<a class="btn btn-link btn_login_back pull-right" href="{$site_url}/welcome"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg> {lang('sign_in')}</a> 
					<div>
						<a href="{$site_url}"><img src="{$site_url}/media/img/logo.png" width="42px" alt="logo"></a>
					</div>
				</div>
				<div class="signup-alert"></div>
				<form action="" class="form" id="signup">
					<div class="pp_mat_input">
						<input required="true" class="form-control" type="text" name="username" id="username" placeholder="{lang('username')}" autofocus />
						<label for="username">{lang('username')}</label>
						<span class="bar"></span>
					</div>
					
					<div class="pp_mat_input">
						<input required="true" class="form-control" type="email" name="email" id="email" placeholder="{lang('email_addr')}" />
						<label for="email">{lang('email_addr')}</label>
						<span class="bar"></span>
					</div>
					
					<div class="pp_mat_input">
						<input required="true" class="form-control show_password" type="password" name="password" id="password" placeholder="{lang('password')}" />
						<label for="password">{lang('password')}</label>
						<span class="bar"></span>
					</div>

					<div class="pp_mat_input">
						<input required="true" class="form-control show_password" type="password" name="conf_password" id="conf_password" placeholder="{lang('confirm_passwd')}" />
						<label for="conf_password">{lang('confirm_passwd')}</label>
						<span class="bar"></span>
						<div class="icon-wrapper">
							<span toggle=".show_password" class="field-icon toggle-password">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye-off"><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>
							</span>
						</div>
					</div>
					
					<div class="form-group">
						<select name="gender" id="gender" class="form-control">
							<option value="male" selected="selected">
								{lang('male')}
							</option>
							<option value="female">
								{lang('female')}
							</option>
						</select>
					</div>
					<input type="hidden" name="hash" value="{$csrf_token}">
					<div class="pp_terms">
						<input type="checkbox" name="terms" id="terms" onchange="activateButton(this)">
						<label for="terms"> I agree to the <a href="{pxp_link('terms-of-use')}">{lang('terms_of_use')}</a></label>
					</div>
					<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit" id="sign_submit" disabled><span>{lang('signup')} <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></span></button></div>
				</form>
			</div>
			<div class="col-sm-2 col-md-3"></div>
			</div>
		</div>
	</div>
	<script>
		jQuery(document).ready(function($) {
			$("form#signup").ajaxForm({
				url:'{$xhr_url}/signup',
				dataType:'json',
				type:'POST',
				beforeSend:function(){
					$('form').find('.pp_load_loader').addClass('loadingg');
					$('form').find('button[type="submit"]').attr('disabled','true');
				},
				success:function(data){
					scroll2top();

					if (data.status == 200) {

						$(".signup-alert").html($('<div>',{
							class: 'alert alert-success',
							text: data.message
						}));
						{if $config.email_validation != 'on'}
						setTimeout(function(){
							window.location.href = "{$site_url}";
						},1500);
						{/if}
					}
					else{
						$(".signup-alert").html($('<div>',{
							class: 'alert alert-danger',
							text: data.message
						}));
					}
					$('form').find('.pp_load_loader').removeClass('loadingg');
	                $('form').find('button[type="submit"]').removeAttr('disabled');
				},
				error: function(data){
					console.log(data);
				}
			})
		});
		
		$(document).ready(function() {
			// hide/show password
			$(".icon-wrapper").click(function() {
				$(this).toggleClass("show_eye");
				var input = $($(".toggle-password").attr("toggle"));
				if (input.attr("type") == "password") {
					input.attr("type", "text");
				} else {
					input.attr("type", "password");
				}
			});
			
			$("select#gender").change(function(){
				var ddl = document.getElementById("gender");
				var selectedValue = ddl.options[ddl.selectedIndex].value;
				if (selectedValue == "male"){
					$('.user_avatar').removeClass('avatar_female');
					$('.user_avatar').addClass('avatar_male');
				}
				else if (selectedValue == "female"){
					$('.user_avatar').removeClass('avatar_male');
					$('.user_avatar').addClass('avatar_female');
				}
			});
		});
		
		function activateButton(element) {
			if(element.checked) {
				document.getElementById("sign_submit").disabled = false;
			}
			else  {
				document.getElementById("sign_submit").disabled = true;
			}
		};
	</script>
{/block}