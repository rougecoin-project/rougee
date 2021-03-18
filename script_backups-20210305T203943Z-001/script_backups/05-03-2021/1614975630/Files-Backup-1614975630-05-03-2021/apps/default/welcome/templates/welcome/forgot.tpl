{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="row">
		<div class="welcome-page-container row">
			<div class="pp_welcome_sign marginauto pp_welcome_signup pp_welcome_reset">
			<div class="logo">
					<a class="btn btn-link btn_login_back pull-right" href="{$site_url}/welcome"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg> {lang('sign_in')}</a> 
					<div>
						<a href="{$site_url}"><img src="{$site_url}/media/img/logo.png" width="42px" alt="logo"></a>
					</div>
				</div>
				<hr>
			<h3>{lang('reset_password')}</h3>
				<div class="signin-alert"></div>
				<form action="" class="form" id="reset-password">
					<div class="pp_mat_input">
						<input class="form-control" type="email" name="email" id="email" placeholder="{lang('email')}" required autofocus />
						<label for="email">{lang('email')}</label>
						<span class="bar"></span>
					</div>
					
					<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit"><span>{lang('reset')} <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></span></button></div>

					<input type="hidden" name="hash" value="{$csrf_token}">
				</form>
			</div>
		</div>
	</div>
	<script>
		jQuery(document).ready(function($) {
			$("form#reset-password").ajaxForm({
				url: '{$xhr_url}/reset',
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
							text: data.message
						}));
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
{/block}