<script>
	jQuery(document).ready(function($) {
		var form = $("form#import-post-gifs");
		var cont = form.find('.content');

		$.ajax({
			url: 'https://api.giphy.com/v1/gifs/trending',
			type: 'GET',
			dataType: 'json',
			data: {
				api_key:'{$config.giphy_api}',
				limit:40,
				lang:'en',
				fmt:'json'
			},
		})
		.done(function(data) {
			if (data.meta.status == 200 && data.data.length > 0) {
				cont.empty();
				if (cont.hasClass('hide')) { cont.removeClass('hide'); }
				for (var i = 0; i < data.data.length; i++) {
					var gifurl = data['data'][i]['images']['preview']['mp4'];
					var gifimg = data['data'][i]['images']['original']['url'];

					cont.append($("<div>",{
						class:'item'
					}).html($("<video>",{
						src:gifurl,
						autoplay:'true',
						loop:'true' ,
						height: data['data'][i]['images']['preview']['height'],
						id:i,
						title:data['data'][i]['title'],
					}).data('gif',gifimg)).append($('<div>',{
						class:'preload',
					}).append($("<span>"))));
				}

				cont.gridalicious({
					selector: '.item',
					gutter: 5,
					width: (cont.width() / 3),
					animate: true,
					animationOptions: { 
					    speed: 100, 
					    duration: 200
					}
				});

				cont.find('video').each(function(index, el) {
					$(this).on('loadeddata', function(event) {
						event.preventDefault();
						$(this).removeAttr('style');
						$(this).siblings('.preload').remove();
					});

					$(this).on('error', function(event) {
						event.preventDefault();
						$(this).removeAttr('style');
						$(this).siblings('.preload').remove();
					});			
				});
			}
		});

		

		form.find('input[type="text"]').keyup(function(event) {
			$.ajax({
				url: 'https://api.giphy.com/v1/gifs/search',
				type: 'GET',
				dataType: 'json',
				data: {
					q: $(this).val(),
					api_key:'{$config.giphy_api}',
					limit:40,
					lang:'en',
					fmt:'json'
				},
			})
			.done(function(data) {
				if (data.meta.status == 200 && data.data.length > 0) {	
					cont.empty();
					if (cont.hasClass('hide')) { cont.removeClass('hide'); }
					for (var i = 0; i < data.data.length; i++) {
						var gifurl = data['data'][i]['images']['preview']['mp4'];
						var gifimg = data['data'][i]['images']['original']['url'];

						cont.append($("<div>",{
							class:'item'
						}).html($("<video>",{
							src:gifurl,
							autoplay:'true',
							loop:'true' ,
							height: data['data'][i]['images']['preview']['height'],
							id:i,
							title:data['data'][i]['title'],
						}).data('gif',gifimg)).append($('<div>',{
							class:'preload',
						}).append($("<span>"))));
					}

					cont.gridalicious({
						selector: '.item',
						gutter: 5,
						width: (cont.width() / 3),
						animate: true,
						animationOptions: { 
						    speed: 100, 
						    duration: 200
						}
					});

					cont.find('video').each(function(index, el) {
						$(this).on('loadeddata', function(event) {
							event.preventDefault();
							$(this).removeAttr('style');
							$(this).siblings('.preload').remove();
						});

						$(this).on('error', function(event) {
							event.preventDefault();
							$(this).removeAttr('style');
							$(this).siblings('.preload').remove();
						});			
					});
				}
			});
		});


		$(document).on('click', "#import-post-gifs .content .item", function(event) {
			event.preventDefault();
			var prev_gif = $(this).find('video').clone(true);
			cont.slideUp(10,function(){
				form.find('.preview-video').removeClass('hide').find('.fluid').append(prev_gif);
			});
		});

		$(document).on('click', "#import-post-gifs .preview-video button", function(event) {
			event.preventDefault();
			form.find('.preview-video').addClass('hide').find('.fluid').empty();
			form.find('.content').slideDown(10);
		});

		form.submit(function(event) {
			event.preventDefault();
			var vid = $(this).find('.preview-video').find('video');
			var txt = form.find('textarea').val();

			if (vid.length) {
				var gif_src = vid.attr('src');
				var gif_img = vid.data('gif');
				var payload = {
					gif_url:gif_img,
					caption:txt
				};

				$.ajax({
					url:link('posts/import-post-gifs'),
					type: 'POST',
					dataType: 'json',
					data: payload,
				})
				.done(function(data) {
					if (data.status == 200) {
						$(".home-posts-container").prepend(data.html);
					}

					if (data.message) {
						$.toast(data.message,{
		                	duration: 5000, 
		                	type: '',
		                	align: 'top-right',
		                	singleton: false
		                });
					}
					
					$("body").removeClass('active');
					$("#create-newpost").empty();
					$("#modal-progress").addClass('hidden');
				});
			}
			else{
				$("body").removeClass('active');
				$("#create-newpost").empty();
				$("#modal-progress").addClass('hidden');
			}
		});
	});
</script>
