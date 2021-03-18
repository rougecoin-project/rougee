<?php
/* Smarty version 3.1.30, created on 2018-01-19 20:22:08
  from "C:\xampp\htdocs\pixelphoto\apps\default\welcome\templates\welcome\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a624560a30183_26325189',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '752c66a583e0d4e76d4883ce6dfa644f5afe7220' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\welcome\\templates\\welcome\\index.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/container.tpl' => 1,
  ),
),false)) {
function content_5a624560a30183_26325189 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_15067411875a624560a2c7c5_36792617', "additional_static");
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_11528329635a624560a2fb42_80474175', "content");
$_smarty_tpl->inheritance->endChild();
$_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/container.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, true);
}
/* {block "additional_static"} */
class Block_15067411875a624560a2c7c5_36792617 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	
	
<?php
}
}
/* {/block "additional_static"} */
/* {block "content"} */
class Block_11528329635a624560a2fb42_80474175 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="row">
		<div class="welcome-page-container">
			<div class="col-md-4 col-md-offset-4 ">
				<div class="signin-alert">
					
				</div>
				<form action="" class="form" id="login">
					<div class="form-group">
						<input class="form-control" type="text" name="username" placeholder="Username or E-mail">
					</div>

					<div class="form-group">
						<input class="form-control" type="text" name="password" placeholder="Your Password">
					</div>
					<div class="form-group">
						Forgot your password?
					</div>
					<div class="form-group">
						<button class="btn btn-success fluid" type="submit">
							<i class="la la-sign-in"></i> Log In
						</button>
					</div>
					<div>
						New here? <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/signup"> Sign up now!</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<?php echo '<script'; ?>
>
		jQuery(document).ready(function($) {
			$("form#login").ajaxForm({
				url: '<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
/signin',
				type: 'POST',
				dataType: 'json',
				beforeSend: function(){
					/* pass */
				},
				success: function(data){
					if (data.status == 200) {
						window.location.href = '<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
';
					}

					else{
						$(".signin-alert").html($('<div>',{
							class: 'alert alert-danger',
							text: data.message
						}));
					}
				}
			})
		});
	<?php echo '</script'; ?>
>
<?php
}
}
/* {/block "content"} */
}
