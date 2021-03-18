<?php
/* Smarty version 3.1.30, created on 2018-01-19 20:22:11
  from "C:\xampp\htdocs\pixelphoto\apps\default\signup\templates\signup\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a62456334e130_38551253',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '26225671e457f81e7237c2e5a61ac29b2315c16e' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\signup\\templates\\signup\\index.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/container.tpl' => 1,
  ),
),false)) {
function content_5a62456334e130_38551253 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_12048256475a62456334ab30_44659613', "additional_static");
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_5886467845a62456334db51_10466396', "content");
$_smarty_tpl->inheritance->endChild();
$_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/container.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, true);
}
/* {block "additional_static"} */
class Block_12048256475a62456334ab30_44659613 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	
	
<?php
}
}
/* {/block "additional_static"} */
/* {block "content"} */
class Block_5886467845a62456334db51_10466396 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="row">
		<div class="signup-page-container">
			<div class="col-md-4 col-md-offset-4">
				<div class="signup-alert">
					
				</div>
				<form action="" class="form" id="signup">
					<div class="form-group">
						<input required="true" class="form-control" type="email" name="email" placeholder="E-mail address">
					</div>

					<div class="form-group">
						<input required="true" class="form-control" type="text" name="username" placeholder="Username">
					</div>
					

					<div class="form-group">
						<input required="true" class="form-control" type="password" name="password" placeholder="Password">
					</div>

					<div class="form-group">
						<input required="true" class="form-control" type="password" name="conf_password" placeholder="Confirm Password">
					</div>
					<div class="form-group">
						<select name="gender" class="form-control">
							<option value="male" selected="selected">
								Male
							</option>
							<option value="female">
								Female
							</option>
						</select>
					</div>

					<div class="form-group">
						<button class="btn btn-success fluid" type="submit">
							<i class="la la-paper-plane"></i> Sing Up
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<?php echo '<script'; ?>
>
		jQuery(document).ready(function($) {
			$("form#signup").ajaxForm({
				url:'<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
/signup',
				dataType:'json',
				type:'POST',
				beforeSend:function(){

				},
				success:function(data){
					scroll2top();

					if (data.status == 200) {

						$(".signup-alert").html($('<div>',{
							class: 'alert alert-success',
							text: data.message
						}));

						setTimeout(function(){
							window.location.href = "<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
";
						},1500);
					}
					else{

						$(".signup-alert").html($('<div>',{
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
