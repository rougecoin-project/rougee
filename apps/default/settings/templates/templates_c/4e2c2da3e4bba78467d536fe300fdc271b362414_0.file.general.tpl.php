<?php
/* Smarty version 3.1.30, created on 2018-01-19 20:41:04
  from "C:\xampp\htdocs\pixelphoto\apps\default\settings\templates\settings\includes\general.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6249d02e4a18_24507627',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4e2c2da3e4bba78467d536fe300fdc271b362414' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\settings\\templates\\settings\\includes\\general.tpl',
      1 => 1516389525,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:apps/".((string)$_smarty_tpl->tpl_vars[\'config\']->value[\'theme\'])."/main/templates/includes/lazy-load.tpl' => 1,
  ),
),false)) {
function content_5a6249d02e4a18_24507627 (Smarty_Internal_Template $_smarty_tpl) {
?>
<div>
	<div class="header">
		<div class="avatar-wrapper">
			<img src="<?php echo $_smarty_tpl->tpl_vars['me']->value['avatar'];?>
" class="img-circle" width="100px" height="100px">
		</div>
		<div class="edit-avatar">
			<form id="edit-avatar">
				<h5><?php echo $_smarty_tpl->tpl_vars['me']->value['name'];?>
</h5>
				<button type="button" class="btn btn-info" onclick="$('#avatar').trigger('click');">
					<i class="la la-user"></i> Change Profile Avatar
				</button>
				<input type="file" accept="image/*" name="avatar" id="avatar" class="hidden">
			</form>
		</div>
		<div class="clear"></div>
	</div>
	<form class="form" id="edit-general-settings">
		<div class="form-group">
			<label class="col-md-3">Username*</label>
			<div class="col-md-6">
				<input required="true" type="text" name="username" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['me']->value['username'];?>
">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">First name</label>
			<div class="col-md-6">
				<input type="text" name="fname" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['me']->value['fname'];?>
" placeholder="Your first name">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Last name</label>
			<div class="col-md-6">
				<input type="text" name="lname" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['me']->value['lname'];?>
" placeholder="Your last name">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">E-mail*</label>
			<div class="col-md-6">
				<input required="true" type="email" name="email" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['me']->value['email'];?>
">
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Gender*</label>
			<div class="col-md-6">
				<select name="gender" class="form-control" required="true">
					<option value="male" <?php if ($_smarty_tpl->tpl_vars['me']->value['gender'] == 'male') {?>selected<?php }?>>
						Male
					</option>
					<option value="female" <?php if ($_smarty_tpl->tpl_vars['me']->value['gender'] == 'female') {?>selected<?php }?>>
						Female
					</option>
				</select>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">Country</label>
			<div class="col-md-6">
				<select name="country" class="form-control">
							
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['countries']->value, 'cname', false, 'cid');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['cid']->value => $_smarty_tpl->tpl_vars['cname']->value) {
?>
						<option value="<?php echo $_smarty_tpl->tpl_vars['cid']->value;?>
" <?php if ($_smarty_tpl->tpl_vars['me']->value['country_id'] == $_smarty_tpl->tpl_vars['cid']->value) {?>selected<?php }?>>
							<?php echo $_smarty_tpl->tpl_vars['cname']->value;?>

						</option>
					<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>


				</select>
			</div>
			<div class="clear"></div>
		</div>
		<div class="form-group">
			<label class="col-md-3">About</label>
			<div class="col-md-6">
				<textarea class="form-control" name="about" rows="3" placeholder="About you.."><?php if ($_smarty_tpl->tpl_vars['me']->value['about']) {
echo $_smarty_tpl->tpl_vars['me']->value['about'];
}?></textarea>
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
		$("#avatar").change(function(event) {
			$("#edit-avatar").submit();
		});

		$("form#edit-general-settings").ajaxForm({
			url: '<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
/general',
			type: 'POST',
			dataType: 'json',
			beforeSend: function(){

			},
			success: function(data){
				if (data.status == 200) {
					alert('Success');
				}

				else{
					alert(data.message);
				}
			}
		});

		$("#edit-avatar").ajaxForm({
			url: '<?php echo $_smarty_tpl->tpl_vars['xhr_url']->value;?>
/edit-avatar',
			type: 'POST',
			dataType: 'json',
			data:{
				user_id: '<?php echo $_smarty_tpl->tpl_vars['me']->value['user_id'];?>
'
			},
			beforeSend: function(){
				$("#modal-progress").removeClass('hidden');
			},
			success: function(data){
				if (data.status == 200) {
					$('.avatar-wrapper').find('img').attr('src', data.avatar);
				}

				else{
					alert(data.message);
				}

				$("#modal-progress").addClass('hidden');
			}
		});

	});
<?php echo '</script'; ?>
><?php }
}
