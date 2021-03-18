{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="terms-page__container">
		<div class="terms-page__inner">
			<div class="pp_term_head">
				<ul>
					<li {if $tpage == 'about'}class="active"{/if}>
						<a href="{pxp_link('about-us')}"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-briefcase"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg> {lang('about_us')}</a>
					</li>
					<li {if $tpage == 'terms-of-use'}class="active"{/if}>
						<a href="{pxp_link('terms-of-use')}"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-archive"><polyline points="21 8 21 21 3 21 3 8"></polyline><rect x="1" y="3" width="22" height="5"></rect><line x1="10" y1="12" x2="14" y2="12"></line></svg> {lang('terms_of_use')}</a>
					</li>
					<li {if $tpage == 'privacy-and-policy'}class="active"{/if}>
						<a href="{pxp_link('privacy-and-policy')}"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg> {lang('privacy_and_policy')}</a>
					</li>
				</ul>
			</div>
			<div class="pp_term_body">
				<div class="content">{$pagecont|unescape:'html'}</div>
			</div>
		</div>
		<div class="clear"></div>
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