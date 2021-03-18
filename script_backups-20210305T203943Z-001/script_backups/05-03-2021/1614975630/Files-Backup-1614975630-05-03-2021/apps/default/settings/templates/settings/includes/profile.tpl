<div>
	<div class="header">
		<h4>{lang('profile_settings')}</h4>
		<div class="clear"></div>
	</div>
	<hr>
	<form class="form row pp_sett_form" id="edit-profile-settings">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="pp_mat_input pp_mat_input_50">
			<input type="text" name="fname" class="form-control" value="{$me.fname}">
			<span class="bar"></span>
			<label>{lang('fname')}</label>
		</div>
		<div class="pp_mat_input pp_mat_input_50">
			<input type="text" name="lname" class="form-control" value="{$me.lname}">
			<span class="bar"></span>
			<label>{lang('lname')}</label>
		</div>
		<div class="pp_mat_input">
			<input type="url2" name="website" class="form-control" value="{$me.website}">
			<span class="bar"></span>
			<label>{lang('website')}</label>
		</div>
		<div class="pp_mat_input">
			<input type="url2" name="facebook" class="form-control" value="{$me.facebook}">
			<span class="bar"></span>
			<label>{lang('ur_facebook')}</label>
		</div>
		<div class="pp_mat_input">
			<input type="url2" name="google" class="form-control" value="{$me.google}">
			<span class="bar"></span>
			<label>{lang('ur_google')}</label>
		</div>
		<div class="pp_mat_input">
			<input type="url2" name="twitter" class="form-control" value="{$me.twitter}">
			<span class="bar"></span>
			<label>{lang('ur_twitter')}</label>
		</div>
		<div class="pp_mat_input">
			<textarea class="form-control" name="about" rows="3">{if $me.about}{$me.about|br2nl}{/if}</textarea>
			<span class="bar"></span>
			<label>{lang('about_u')}</label>
		</div>
		<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit"><span>{lang('save_changes')}</span></button></div>
		<input type="hidden" name="user_id" value="{$me.user_id}">
		<input type="hidden" name="hash" value="{$csrf_token}">
		</div>
		<div class="col-md-3"></div>
	</form>
</div>

{include file="apps/{$config.theme}/main/templates/includes/lazy-load.tpl"}
{include file="js/script.tpl" assign="script"}
{$script|minify_js}