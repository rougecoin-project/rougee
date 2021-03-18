<div>
	<div class="header">
		<div class="avatar-wrapper">
			<img src="{$me.avatar}" class="img-circle" width="60px" height="60px">
		</div>
		<div class="edit-avatar">
			<form id="edit-avatar">
				<h5>{$me.name}</h5>
				<button type="button" class="btn btn-info btn-shadow" onclick="$('#avatar').trigger('click');">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-upload"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" y1="3" x2="12" y2="15"></line></svg> {lang('change_avatar')}
				</button>
				<input type="file" accept="image/*" name="avatar" id="avatar" class="hidden">
				<input type="hidden" name="hash" value="{$csrf_token}">
			</form>
		</div>
		<div class="clear"></div>
	</div>
	<hr>
	<form class="form row pp_sett_form" id="edit-general-settings">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="pp_mat_input">
			<input required="true" type="text" name="username" class="form-control" value="{$me.username}">
			<span class="bar"></span>
			<label>{lang('username')}*</label>
		</div>
		<div class="pp_mat_input" style="margin-bottom: 1.7em;">
			<input required="true" type="email" name="email" class="form-control" value="{$me.email}">
			<span class="bar"></span>
			<label>{lang('email')}*</label>
		</div>
		<div class="pp_mat_select">
			<label class="pp_mat_label">{lang('gender')}*</label>
			<div>
				<select name="gender" class="form-control" required="true">
					<option value="male" {if $me.gender == 'male'}selected{/if}>
						{lang('male')}
					</option>
					<option value="female" {if $me.gender == 'female'}selected{/if}>
						{lang('female')}
					</option>
				</select>
			</div>
			<div class="clear"></div>
		</div>
		<div class="pp_mat_select">
			<label class="pp_mat_label">{lang('country')}</label>
			<div>
				<select name="country" class="form-control">
					{foreach $countries  as $cid => $cname}
						<option value="{$cid}" {if $me.country_id == $cid}selected{/if}>
							{$cname}
						</option>
					{/foreach}
				</select>
			</div>
			<div class="clear"></div>
		</div>

		{if $context_user.admin == 1}

		<div class="form-group">
			<label class="col-xs-9 col-sm-9 col-md-9">{lang('activate_user')}</label>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<input type="checkbox" {if $me.active}checked{/if} class="tgl tgl-ios" id="active" name="active">
				<label class="tgl-btn" for="active"></label>
			</div>
			<div class="clear"></div>
		</div>

		{/if}

		<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit"><span>{lang('save_changes')}</span></button></div>
		<div class="clear"></div>
		<input type="hidden" name="user_id" value="{$me.user_id}">
		<input type="hidden" name="hash" value="{$csrf_token}">
		</div>
		<div class="col-md-3"></div>
	</form>
</div>

{include file="apps/{$config.theme}/main/templates/includes/lazy-load.tpl"}
{include file="js/script.tpl" assign="script"}
{$script|minify_js}