<?php
/* Smarty version 3.1.30, created on 2018-01-19 21:13:54
  from "C:\xampp\htdocs\pixelphoto\apps\default\settings\templates\settings\includes\delete.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a625182cb17c6_32582918',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'be78ef89777443e394a5982eb74f25ff9ab5aef8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\includes\\delete.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/includes/lazy-load.tpl' => 1,
  ),
),false)) {
function content_5a625182cb17c6_32582918 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div>
	<div class="header">
		<h4>Delete account?</h4>
		<p>
			Are you sure you want to delete your account?
			All content including published posts,will be permanetly removed!
		</p>
		<div class="clear"></div>
	</div>
	<form class="form" id="delete-account-settings">
		<div class="form-group">
			<label class="col-md-3">Password*</label>
			<div class="col-md-6">
				<input required="true" type="password" name="password" class="form-control" placeholder="Enter your password">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Tell us more</label>
			<div class="col-md-6">
				<textarea class="form-control" name="message" rows="2" placeholder="Before you go, please leave a comment"></textarea>
			</div>
			<div class="clear"></div>
		</div>

		<div class="form-group">
			<label class="col-md-3"></label>
			<div class="col-md-6">
				<button class="btn btn-info btn-shadow" type="submit">
					<i class="la la-chevron-circle-right"></i> Continue
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

		$("form#delete-account-settings").ajaxForm({
			url: '<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
/delete-account',
			type: 'POST',
			dataType: 'json',
			beforeSend: function(){
				$('#modal-progress').removeClass('hidden');
			},
			success: function(data){
				alert(data.message)
				$('#modal-progress').addClass('hidden');
				window.location.href = "<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/welcome";
			}
		});
	});
<?php echo '</script'; ?>
><?php }
}
