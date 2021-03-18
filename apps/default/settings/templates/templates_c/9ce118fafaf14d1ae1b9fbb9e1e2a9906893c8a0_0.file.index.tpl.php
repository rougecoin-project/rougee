<?php
/* Smarty version 3.1.30, created on 2018-01-19 20:41:04
  from "C:\xampp\htdocs\pixelphoto\apps\default\settings\templates\settings\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6249d018b837_86120669',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9ce118fafaf14d1ae1b9fbb9e1e2a9906893c8a0' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\index.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/container.tpl' => 1,
    'file:includes/".((string)$_smarty_tpl->tpl_vars[\'page\']->value).".tpl' => 1,
  ),
),false)) {
function content_5a6249d018b837_86120669 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_4319736015a6249d0181363_40705246', "additional_static");
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_2118111675a6249d018af79_70095835', "content");
$_smarty_tpl->inheritance->endChild();
$_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/container.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, true);
}
/* {block "additional_static"} */
class Block_4319736015a6249d0181363_40705246 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	
	
<?php
}
}
/* {/block "additional_static"} */
/* {block "content"} */
class Block_2118111675a6249d018af79_70095835 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


	<div class="sttings-page-container content-shadow">
		<div class="col-md-3 sidenav">
			<ul class="list-group">
				<li class="list-group-item <?php if ($_smarty_tpl->tpl_vars['page']->value == 'general') {?>active<?php }?>">
					<a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/settings/general/<?php echo $_smarty_tpl->tpl_vars['me']->value['username'];?>
">
						<i class="la la-fw la-cogs"></i> General
					</a>
				</li>
				<li class="list-group-item <?php if ($_smarty_tpl->tpl_vars['page']->value == 'password') {?>active<?php }?>">
					<a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/settings/password/<?php echo $_smarty_tpl->tpl_vars['me']->value['username'];?>
">
						<i class="la la-fw la-unlock"></i> Password
					</a>
				</li>
				<li class="list-group-item <?php if ($_smarty_tpl->tpl_vars['page']->value == 'verification') {?>active<?php }?>">
					<a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/settings/verification/<?php echo $_smarty_tpl->tpl_vars['me']->value['username'];?>
">
						<i class="la la-fw la-check-circle"></i> Verification
					</a>
				</li>
				<li class="list-group-item <?php if ($_smarty_tpl->tpl_vars['page']->value == 'delete') {?>active<?php }?>">
					<a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/settings/delete/<?php echo $_smarty_tpl->tpl_vars['me']->value['username'];?>
">
						<i class="la la-fw la-user-times"></i> Delete account
					</a>
				</li>
			</ul>
		</div>
		<div class="col-md-9 page-content">
			<?php $_smarty_tpl->_subTemplateRender("file:includes/".((string)$_smarty_tpl->tpl_vars['page']->value).".tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>

		</div>
		<div class="clear"></div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<?php echo '<script'; ?>
>
		jQuery(document).ready(function($) {
			$("form#settings").ajaxForm({
				url:'<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
',
				dataType:'json',
				type:'POST',
				beforeSend:function(){

				},
				success:function(data){
					scroll2top();

					if (data.status == 200) {
					}
					else{
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
