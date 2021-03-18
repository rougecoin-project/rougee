<div>
	<div class="header">
		<h4>{lang('change_passwd')}</h4>
		<div class="clear"></div>
	</div>
	<hr>
	<form class="form row pp_sett_form" id="edit-password-settings">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		{if !IS_ADMIN}
		<div class="pp_mat_input">
			<input required="true" type="password" name="old_password" class="form-control">
			<span class="bar"></span>
			<label>{lang('old_passwd')}*</label>
		</div>
		{/if}
		<div class="pp_mat_input">
			<input required="true" type="password" name="new_password" class="form-control">
			<span class="bar"></span>
			<label>{lang('new_passwd')}*</label>
		</div>
		<div class="pp_mat_input">
			<input required="true" type="password" name="conf_password" class="form-control">
			<span class="bar"></span>
			<label>{lang('conf_new_passwd')}*</label>
		</div>
		<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit"><span>{lang('save_changes')}</span></button></div>
		<input type="hidden" name="user_id" value="{$me.user_id}">
		<input type="hidden" name="hash" value="{$csrf_token}">
		</div>
		<div class="col-md-3"></div>
	</form>
</div>
{include file="js/script.tpl" assign="script"}
{$script|minify_js}