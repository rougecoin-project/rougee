{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="container">
		<div class="page-not-found">

			<h3>{lang('account_not_activated')}</h3>
			<p>{lang('click_on_activation_link')}</p>

		</div>
	</div>
{/block}