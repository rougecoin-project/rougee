{extends "apps/{$config.theme}/main/templates/container.tpl"}

{block name="additional_static"}

<script src="{$theme_url}/main/static/js/libs/gridAlicious/jquery.grid-a-licious.js"></script>
{/block}

{block name="content"}
	<div class="explore-page-container explore-tags">
		<h4 class="text-center" style="background-image: url('{$site_url}/media/img/tags.svg');">#{$tag} <span><b>{$total_count}</b> {lang('posts')}</span></h4>
		{if $follow}
		<div class="follow__suggestions-cr">
			<div class="container">
				<div class="fluid">
					<h5>
						{lang('follow_suggestions')}
						<a href="{pxp_link('explore/people')}" class="pull-right">{lang('see_all')} <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></a>
					</h5>
				</div>
				<div class="owl-carousel"  id="follow__suggestions-cr">
					{foreach $follow as $user_data}
						<div class="item">
							<div class="avatar">
								<img src="{$user_data.avatar}" class="img-circle">
							</div>
							<div class="uname">
								<a href="{$user_data.url}">
									<strong>{$user_data.username}</strong>
								</a>
								<span>
									{$user_data.name}
								</span>
							</div>

							<div class="button">
								<button onclick="follow({$user_data.user_id},this);">
						  			<span>{lang('follow')}</span>
						  		</button>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
		{/if}
		<div class="container">
			<div class="explore-posts-container">
				{if $posts}	
					{foreach $posts as $post_data}
						{include file="includes/list.tpl"}
					{/foreach}
				{else}
					{include file="includes/no-posts-found.tpl"}
				{/if}
			</div>
		</div>
	</div>
	{include file="apps/{$config.theme}/main/templates/includes/lazy-load.tpl"}

	<script>

		var ajax_url = '{$xhr_url}';

		{literal}
		jQuery(document).ready(function($) {
			var gwidth   = ($('.explore-posts-container').width() / 3);
			var scrolled = 0;
			var last_id  = 0;

			var config = {
				selector: '.item',
				gutter: 0,
				animate: true,
				animationOptions: { 
					speed: 100, 
					duration: 200
				}
			}
		
			if ($(window).width() > 992){
				config.width = gwidth;
			};
		
			$(".explore-posts-container").gridalicious(config);

			$(document).ready(function(){
				$('#follow__suggestions-cr').slick({
				infinite: false,
				slidesToShow: 5,
				variableWidth: false,
				slidesToScroll: 1,
				autoplay: false,
				autoplaySpeed: 2000,
				responsive: [
					{
						breakpoint: 1024,
						settings: {
							slidesToShow: 4
						}
					},
					{
						breakpoint: 800,
						settings: {
							slidesToShow: 3
						}
					},
					{
						breakpoint: 600,
						settings: {
							slidesToShow: 2
						}
					},
					{
						breakpoint: 300,
						settings: {
							slidesToShow: 1
						}
					}
				]
				});
			});

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
			            
        				var last_id = Math.min.apply(Math,list_ids);

						$.ajax({
							url: ajax_url + '/explore-tags',
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
		{/literal}

	</script>
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