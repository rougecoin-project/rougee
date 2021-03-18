<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="title" content="{$config.site_name}">
	<meta name="description" content="{$config.site_desc}">
	<meta name="keywords" content="{$config.meta_keywords}">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>{$title}</title>
	<link rel="shortcut icon" type="image/png" href="{$site_url}/media/img/icon.png"/>
	<script src="{$theme_url}/main/static/js/libs/jquery-3.2.1.js"></script>
	<script src="{$theme_url}/main/static/css/libs/bs3/js/bootstrap.js"></script>
	<link rel="stylesheet" href="{$theme_url}/main/static/css/libs/bs3/css/bootstrap.css">
	{if $app_name == 'welcome' || $app_name == 'signup'}
	<link rel="stylesheet" href="{$theme_url}/main/static/css/styles.welcome.css">
	{else}
	<link rel="stylesheet" href="{$theme_url}/main/static/css/styles.master.css">
	{/if}
	<script src="{$theme_url}/main/static/js/libs/jquery-form.v3.51.0.js"></script>
	<script src="{$theme_url}/main/static/js/script.master.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto:400,500" rel="stylesheet">
	{block name="additional_static"}{/block}
	<script>
		function xhr_url(){
			return '{$site_url}/aj/';
		}

		function site_url(path){
			return '{$site_url}/' + path;
		}
	</script>
</head>
<body data-app="{$app_name}" class="body-{$app_name}">
	<input type="hidden" class="hidden csrf-token" value="{$csrf_token}">
	{if $config.header}
		{include file="apps/{$config.theme}/main/templates/header/header.tpl"}
	{/if}
	<main class="container container-{$app_name} container-{$app_name}-main">
		{block name="content"}{/block}
	</main>
	
	{block name="footer"}{/block}
	
	{if not empty($exjs)}
		{include file="apps/{$config.theme}/main/templates/js/extra-js.tpl" assign="exjs"}
		{$exjs|minify_js}
	{/if}

	{include file="apps/{$config.theme}/main/templates/includes/timeago.tpl"}
	
	<div class="lightbox__container"></div>	
	{block name="footer_static"}{/block}
	{if $config.google_analytics}
		{$config.google_analytics|decode}
	{/if}
</body>
</html>