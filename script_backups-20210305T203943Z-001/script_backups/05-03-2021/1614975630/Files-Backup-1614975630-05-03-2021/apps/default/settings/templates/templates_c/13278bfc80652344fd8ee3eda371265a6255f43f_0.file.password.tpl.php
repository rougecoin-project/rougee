<?php
/* Smarty version 3.1.30, created on 2018-01-19 20:41:06
  from "C:\xampp\htdocs\pixelphoto\apps\default\settings\templates\settings\includes\password.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6249d2694a38_07133640',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '13278bfc80652344fd8ee3eda371265a6255f43f' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\includes\\password.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/includes/lazy-load.tpl' => 1,
  ),
),false)) {
function content_5a6249d2694a38_07133640 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div>
	<div class="header">
		<h4>Change my password</h4>
		<div class="clear"></div>
	</div>
	<form class="form" id="edit-password-settings">
		<div class="form-group">
			<label class="col-md-3">Old password*</label>
			<div class="col-md-6">
				<input required="true" type="password" name="old_password" class="form-control" placeholder="Your current password">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">New password*</label>
			<div class="col-md-6">
				<input required="true" type="password" name="new_password" class="form-control" placeholder="Your new password">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Confirm new password*</label>
			<div class="col-md-6">
				<input required="true" type="password" name="conf_password" class="form-control" placeholder="Confirm your new password">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3"></label>
			<div class="col-md-6">
				<button class="btn btn-info btn-shadow" type="submit">
					<i class="la la-save"></i> Save chanes
				</button>
			</div>
			<div class="clear"></div>
		</div>
		<input type="hidden" name="user_id" value="<?php echo $_smarty_tpl->tpl_vars['me']->value['user_id'];?>
">
	</form>
</div>

<?php $_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/includes/lazy-load.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>


<?php echo '<script'; ?>
>
	jQuery(document).ready(function($) {

		$("form#edit-password-settings").ajaxForm({
			url: '<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
/change-password',
			type: 'POST',
			dataType: 'json',
			beforeSend: function(){
				$('#modal-progress').removeClass('hidden');
			},
			success: function(data){
				alert(data.message)
				$('#modal-progress').addClass('hidden');
			}
		});
	});
<?php echo '</script'; ?>
><?php }
}
