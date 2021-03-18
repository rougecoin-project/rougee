{extends "apps/{$config.theme}/main/templates/container.tpl"}
{block name="additional_static"}{/block}
{block name="content"}
	<div class="row">
		<div class="welcome-page-container row signup-page-container">
			<div class="col-sm-12 col-md-12 pp_signup_intro">
				<div class="pp_intro_innr">
					<div>
						<h1 class="animated fadeInUpBig">{lang('v2_email_confirmed')}</h1>
						<span class="fluid copyright">Copyright &copy; 2018 {$config.site_name}</span>
					</div>
				</div>
			</div>
        </div>
    </div>
{/block}