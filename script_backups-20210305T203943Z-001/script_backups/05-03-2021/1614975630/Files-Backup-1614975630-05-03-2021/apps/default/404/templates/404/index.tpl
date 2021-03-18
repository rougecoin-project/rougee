{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="container">
		<div class="page-not-found">
			<section class="pp_404">
				<span class="four"><span class="screen-reader-text">4</span></span>
				<span class="zero"><span class="screen-reader-text">0</span></span>
				<span class="four"><span class="screen-reader-text">4</span></span>
			</section>
			<h3>{lang('page_not_found')}</h3>
			<p>{lang('page_link_is_invalid')}</p>
			<a href="{$site_url}" class="btn btn-default btn-lg btn-raised">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg> {lang('home')}
			</a>
		</div>
	</div>
{/block}
{block name="footer"}
<footer>
	<div class="container container-{$app_name} container-{$app_name}-main">
	<div class="footer__container">
		{if $config.footer}
			{include file="apps/{$config.theme}/main/templates/footer/footer.tpl"}
		{/if}
	</div>
	</div>
</footer>
{/block}