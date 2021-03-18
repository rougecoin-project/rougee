<?php
/* Smarty version 3.1.30, created on 2018-01-26 20:48:52
  from "C:\xampp\htdocs\pixelphoto\apps\default\explore\templates\explore\includes\list.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6b8624206b36_14801443',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '7f8e4e0e24fa43709cee24c4e02c6c9c06317195' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\explore\\templates\\explore\\includes\\list.tpl',
      1 => 1516995649,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5a6b8624206b36_14801443 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div class="item wrapper">
	<div class="explore-postset" id="<?php echo $_smarty_tpl->tpl_vars['post_data']->value['post_id'];?>
">
		<div class="header">
			<img src="<?php echo $_smarty_tpl->tpl_vars['post_data']->value['owner']['avatar'];?>
" class="img-circle" width="25px" height="25px;">
			<a href="#" class="publisher-name"><?php echo $_smarty_tpl->tpl_vars['post_data']->value['owner']['username'];?>
</a>
			
			<div class="clear"></div>
		</div>
		<div class="image">
			<img class="" src="<?php echo $_smarty_tpl->tpl_vars['post_data']->value['media_set'][0]['file'];?>
">
		</div>
		<div class="actions">
			<span>
				<small>
					<?php echo count($_smarty_tpl->tpl_vars['post_data']->value['comments']);?>

				</small>
				Likes
			</span>
			
			<span class="pull-right">
				<i class="ion-android-favorite-outline"></i>
			</span>		

			<span class="pull-right">
				<i class="ion-share"></i>
			</span>

			<span class="pull-right">
				<i class="ion-android-star-outline"></i>
			</span>
		</div>
	</div>
</div><?php }
}
