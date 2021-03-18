<?php
/* Smarty version 3.1.30, created on 2018-01-26 20:48:38
  from "C:\xampp\htdocs\pixelphoto\apps\default\explore\templates\explore\index.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6b8616c315f8_97253107',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3c93602fcccdd94f31268f125fe7e6329121587b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\explore\\templates\\explore\\index.tpl',
      1 => 1516995649,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/container.tpl' => 1,
    'file:includes/list.tpl' => 1,
  ),
),false)) {
function content_5a6b8616c315f8_97253107 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_5615088285a6b8616c297a1_43248048', "additional_static");
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_13166115915a6b8616c31186_44173190', "content");
$_smarty_tpl->inheritance->endChild();
$_smarty_tpl->_subTemplateRender("file:apps/".((string)$_smarty_tpl->tpl_vars['config']->value['theme'])."/main/templates/container.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 2, true);
}
/* {block "additional_static"} */
class Block_5615088285a6b8616c297a1_43248048 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['theme_url']->value;?>
/main/static/js/libs/gridAlicious/jquery.grid-a-licious.js"><?php echo '</script'; ?>
>

<?php
}
}
/* {/block "additional_static"} */
/* {block "content"} */
class Block_13166115915a6b8616c31186_44173190 extends Smarty_Internal_Block
{
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<div class="explore-page-container">
		<div class="explore-posts-container">
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['posts']->value, 'post_data');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['post_data']->value) {
?>
				<?php if ($_smarty_tpl->tpl_vars['post_data']->value['type'] == 'image') {?>
					<?php $_smarty_tpl->_subTemplateRender("file:includes/list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
 
				<?php }?>
			<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

		</div>
	</div>


	<?php echo '<script'; ?>
>

		var ajax_url = '<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
';
		
		var gwidth = ($('.explore-posts-container').width() / 3);
		$(".explore-posts-container").gridalicious({
			selector: '.item',
			gutter: 1,
			width:gwidth,
			animate: true,
			animationOptions: { 
			    speed: 100, 
			    duration: 200
			}
		});
		

		jQuery(document).ready(function($) {
			var scrolled = 0;
			var last_id  = 0;

			$(window).scroll(function() {
			    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			    	if (scrolled == 0) {
		                scrolled = 1;
		                var list_ids = $("div.explore-postset[id]").map(function() {
			                return $(this).attr('id');
			            }).get();

			            if (!list_ids) {
			                return false;
			            }
			            
        				var last_id  = Math.min.apply(Math,list_ids);

						$.ajax({
							url: ajax_url + '/explore-posts',
							type: 'GET',
							dataType: 'json',
							data: {offset:last_id},
						}).done(function(data) {
							if (data.status == 200) {
								$(".explore-posts-container").gridalicious('append', $(data.html));
								scrolled = 0;
							}
							else{
								$(window).unbind('scroll');
							}
						});
		       		}
			    }
			});
		});
		

	<?php echo '</script'; ?>
>

<?php
}
}
/* {/block "content"} */
}
