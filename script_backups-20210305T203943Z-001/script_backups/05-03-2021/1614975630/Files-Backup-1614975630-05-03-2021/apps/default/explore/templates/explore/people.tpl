{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}{/block}

{block name="content"}
	<div class="explore-page-container">
		<div class="sub__header">
			<div class="container">
				<div class="col-md-8">
					<h4 class="animated fadeInUpBig">{lang('explore_people')}</h4>
					<p class="animated fadeInUpBig">{lang('suggested_people')}</p>
				</div>
				<div class="col-md-4 pp_exp_head_svg text-center hidden-xs hidden-sm">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users animated bounceIn"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
				</div>
			</div>
		</div>
		<div class="pp_hero">
			<div class="w wave"></div>
			<div class="w wave2"></div>
			<div class="w wave3"></div>
			<div class="w wave4"></div>
		</div>
		<div class="container">
			<div class="explore-people-container">
				<div class="row people">
					{if $users}	
						{foreach $users as $udata}
							{include file="includes/row.tpl"}
						{/foreach}
					{else}
						{include file="includes/no-users-found.tpl"}
					{/if}
				</div>
			</div>
		</div>
	</div>
	<script>
		{literal}
		jQuery(document).ready(function($) {
			var scrolled = 0;
			var last_id  = 0;

			$(window).scroll(function() {
			    if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			    	if (scrolled == 0) {
		                scrolled = 1;
		                if ($(".explore-people__item").length > 0) {
		                	last_id = $(".explore-people__item").last().attr('id');
		                }

						$.ajax({
							url: link('main/explore-people'),
							type: 'GET',
							dataType: 'json',
							data: {offset:last_id},
						}).done(function(data) {
							if (data.status == 200) {
								$(".explore-people-container").find('.people').append($(data.html));
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
		{/literal}
	</script>
	{include file="apps/{$config.theme}/main/templates/includes/lazy-load.tpl"}
{/block}
{block name="footer"}
<footer>
	<div class="container">
	<div class="footer__container">
		{if $config.footer}
			{include file="apps/{$config.theme}/main/templates/footer/footer.tpl"}
		{/if}
	</div>
	</div>
</footer>
{/block}