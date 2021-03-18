<?php
/* Smarty version 3.1.30, created on 2018-01-26 20:48:37
  from "C:\xampp\htdocs\pixelphoto\apps\default\main\templates\header\header.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_5a6b8615388367_83685728',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd3612deef6dccbb9c2a2f58d579e82746eea9a45' => 
    array (
      0 => 'C:\\xampp\\htdocs\\pixelphoto\\apps\\default\\main\\templates\\header\\header.tpl',
      1 => 1516995650,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5a6b8615388367_83685728 (Smarty_Internal_Template $_smarty_tpl) {
?>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container container-<?php echo $_smarty_tpl->tpl_vars['app_name']->value;?>
">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
    </div>
    <div class="collapse navbar-collapse" id="navbar-collapse">
      <ul class="nav navbar-nav navbar-left">
        <li class="<?php if ($_smarty_tpl->tpl_vars['app_name']->value == 'home') {?>active<?php }?>">
          <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
">
            <i class="ion-ios-home-outline"></i>
            <span>Home</span>
          </a>
        </li>
        <li class="<?php if ($_smarty_tpl->tpl_vars['app_name']->value == 'explore') {?>active<?php }?>">
          <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/explore">
            <i class="zmdi zmdi-compass"></i>
            <span>Explore</span>
          </a> 
        </li>
        <li class="<?php if ($_smarty_tpl->tpl_vars['app_name']->value == 'messages') {?>active<?php }?>">
          <a href="#">
            <i class="ion-ios-chatboxes-outline"></i>
            <span>Messages</span>
          </a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="<?php if ($_smarty_tpl->tpl_vars['app_name']->value == 'messages') {?>active<?php }?>">
          <form class="form navbar-search">
            <input type="text" class="form-control" placeholder="Search..">
            <i class="ion-ios-search"></i>
          </form>
        </li>
        <li class="<?php if ($_smarty_tpl->tpl_vars['app_name']->value == 'messages') {?>active<?php }?>" data-toggle="tooltip" data-placement="bottom" title="Notifications">
          <a href="#">
            <i class="zmdi zmdi-notifications-none"></i>
          </a>
        </li>
        <li class="<?php if ($_smarty_tpl->tpl_vars['app_name']->value == 'settings') {?>active<?php }?>" data-toggle="tooltip" data-placement="bottom" title="Profile">
          <a href="<?php echo $_smarty_tpl->tpl_vars['me']->value['url'];?>
">
            <img src="<?php echo $_smarty_tpl->tpl_vars['me']->value['avatar'];?>
" width="24px" height="24px" class="img-circle">
          </a>
        </li>
      </ul>
      <div class="logo">
        <a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
">
          <img src="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/media/img/logo.png" width="50px">
        </a>
      </div>
    </div>
  </div>
</nav><?php }
}
