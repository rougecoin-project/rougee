<div>
	<div class="header">
		<h4>{lang('acc_privacy_settings')}</h4>
		<div class="clear"></div>
	</div>
	<hr>
	<form class="form row pp_sett_form" id="edit-privacy-settings">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="pp_mat_select">
			<label class="pp_mat_label">{lang('p_privacy')}?</label>
			<div>
				<select name="p_privacy" class="form-control">
					<option value="2" {if $me.p_privacy == '2'}selected{/if}>{lang('everyone')}</option>
					<option value="1" {if $me.p_privacy == '1'}selected{/if}>{lang('followers')}</option>
					<option value="0" {if $me.p_privacy == '0'}selected{/if}>{lang('nobody')}</option>
				</select>
			</div>
			<div class="clear"></div>
		</div>
		<div class="pp_mat_select">
			<label class="pp_mat_label">{lang('c_privacy')}?</label>
			<div>
				<select name="c_privacy" class="form-control">
					<option value="1" {if $me.c_privacy == '1'}selected{/if}>{lang('everyone')}</option>
					<option value="2" {if $me.c_privacy == '2'}selected{/if}>{lang('people_i_follow')}</option>
				</select>
			</div>
			<div class="clear"></div>
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