<div>
	<div class="header">
		<h4>{lang('delete_account')}?</h4>
		<p>
			{lang('confirm_del_account')}
		</p>
		<div class="clear"></div>
	</div>
	<hr>
	<form class="form row pp_sett_form" id="delete-account-settings">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="pp_mat_input">
			<input required="true" type="password" name="password" class="form-control">
			<span class="bar"></span>
			<label>{lang('password')}*</label>
		</div>
		<div class="pp_load_loader"><button class="btn btn-info pp_flat_btn" type="submit"><span>{lang('continue')}</span></button></div>
		<input type="hidden" name="user_id" value="{$me.user_id}">
		<input type="hidden" name="hash" value="{$csrf_token}">
		</div>
		<div class="col-md-3"></div>
	</form>
</div>
{include file="js/script.tpl" assign="script"}
{$script|minify_js}