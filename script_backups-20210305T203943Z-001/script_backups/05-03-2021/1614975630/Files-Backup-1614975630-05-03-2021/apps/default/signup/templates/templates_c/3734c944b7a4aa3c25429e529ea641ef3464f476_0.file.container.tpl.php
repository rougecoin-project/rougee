<?php
/* Smarty version 3.1.30, created on 2018-01-26 20:48:15
  from "C:\xampp\htdocs\pixelphoto\apps\default\main\templates\container.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6b85ff644841_09943503',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3734c944b7a4aa3c25429e529ea641ef3464f476' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\container.tpl',
      1 => 1516995650,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/header/header.tpl' => 1,
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/footer/footer.tpl' => 1,
  ),
),false)) {
function content_5a6b85ff644841_09943503 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</title>
	<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/js/libs/jquery-3.2.1.js"><?php echo '</script'; ?>
>
	
	<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/css/libs/bs3/js/bootstrap.js"><?php echo '</script'; ?>
>
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/css/libs/bs3/css/bootstrap.css">
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/css/styles.master.css">
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/fonts/material-design-iconic-font/css/material-design-iconic-font.css">
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/fonts/ionicons/css/ionicons.css">
	<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/js/libs/jquery.sticky-kit.min.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/js/libs/jquery-form.v3.51.0.js"><?php echo '</script'; ?>
>
	<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/js/script.master.js"><?php echo '</script'; ?>
>
	<link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/css/libs/mdl/material.css">
	<?php echo '<script'; ?>
 defer src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/css/libs/mdl/material.js"><?php echo '</script'; ?>
>
	
	<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_16632631365a6b85ff63a960_81001084', "additional_static");
?>

	
	<?php echo '<script'; ?>
>
		function ajax_url() {
			return '<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/aj/'
		}
	<?php echo '</script'; ?>
>
</head>
<body>
	<?php if ($_smarty_tpl->tpl_vars['config']->value['header']) {?>
		<?php $_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/header/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>

	<?php }?>
		<main class="container container-<?php echo $_smarty_tpl->tpl_vars['app_name']->value;?>
">
			<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_14761294415a6b85ff642ab5_85032697', "content");
?>

		</main>
	<?php if ($_smarty_tpl->tpl_vars['config']->value['footer']) {?>
		<?php $_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/footer/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>

	<?php }?>
	
</body>
</html><?php }
/* {block "additional_static"} */
class Block_16632631365a6b85ff63a960_81001084 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block "additional_static"} */
/* {block "content"} */
class Block_14761294415a6b85ff642ab5_85032697 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block "content"} */
}
