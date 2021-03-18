<div class="notification-settings">
	<div class="header">
		<h4>{lang('notif_settings')}</h4>
		<div class="clear"></div>
	</div>
	<hr>
	<form class="form row pp_sett_form" id="edit-notification-settings">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<div class="fluid">
			<div class="col-md-12">
				<p><strong>{lang('receive_notif_when')}:</strong></p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-9 col-sm-9 col-md-9">{lang('liked_my_post')}</label>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<input type="checkbox" {if $me.n_on_like}checked{/if} class="tgl tgl-ios" id="on_like_post" name="on_like_post">
				<label class="tgl-btn" for="on_like_post"></label>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-xs-9 col-sm-9 col-md-9">{lang('commented_my_post')}</label>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<input type="checkbox" {if $me.n_on_comment}checked{/if} class="tgl tgl-ios" id="on_commnet_post" name="on_commnet_post">
				<label class="tgl-btn" for="on_commnet_post"></label>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-xs-9 col-sm-9 col-md-9">{lang('followed_me')}</label>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<input type="checkbox" {if $me.n_on_follow}checked{/if} class="tgl tgl-ios" id="on_follow" name="on_follow">
				<label class="tgl-btn" for="on_follow"></label>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-xs-9 col-sm-9 col-md-9">{lang('mentioned_me')}</label>
			<div class="col-xs-3 col-sm-3 col-md-3">
				<input type="checkbox" {if $me.n_on_mention}checked{/if} class="tgl tgl-ios" id="on_mention" name="on_mention">
				<label class="tgl-btn" for="on_mention"></label>
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