<script>
	var story_duration = (1000 * '{$config.story_duration}');
	{literal}
	jQuery(document).ready(function($) {
		
		/*Init slider on load */
		slide_init();

		scont.find('.close-modal').click(function(event) {
			scont.fadeOut('fast', function() {
				$(this).remove();
			});
		});

		$('.cr-controls').click(function(event) {
			var sdir = $(this).data('slide');
		});

		var scr = $("#view-story-cr").carousel({
			wrap: false,
			interval: false,
			pause: true,
		});

		scr.on('slid.bs.carousel', function(event) {
			delay(function(){
				let src  = scont.find('.item.active').data('src');
				let time = scont.find('.item.active').data('time');

				scont.find('b.story-added').text(time);
				
				scont.find('.item.video.active').find('video').trigger('play');
				scont.find('.item.video').not('.active').find('video').trigger('pause').prop('currentTime', '0');	
			},100);

			var active = scont.find('.int-indicator').find('li.active');
			if (active.prevAll('li').length > 0) {
				$('.carousel-control-prev').fadeIn(10);;
			}

			else {
				$('.carousel-control-prev').fadeOut(10);;
			}

			if (active.nextAll('li').length > 0) {
				$('.carousel-control-next').fadeIn(10);;
			}

			else {
				$('.carousel-control-next').fadeOut(10);;
			}
		});


		scont.find('.delete-story').click(function(event) {
			scont.find('.int-indicator').find('li.active').find('span').pause();
			scont.find('.item.video.active').find('video').trigger('pause');
			scont.find('.delstory--modal').fadeIn(300,function(){
				var story_id = scont.find('.item.active').data('id');
				$(this).data('id',story_id);
			});
		});

		scont.find('[data-confirm--modal-dismiss]').click(function(event) {
			scont.find('.int-indicator').find('li.active').find('span').resume();
			scont.find('.item.video.active').find('video').trigger('play');
		});

		$('.delete--story').click(function(event) {
			scont.find('.int-indicator').find('li.active').remove();
			scont.find('.item.active').remove();
			scont.find('.delstory--modal').fadeOut();
			delay(function(){
				if (scont.find('.int-indicator').find('li').length) {
					scont.find('.int-indicator').find('li:first').addClass('active');
					scont.find('.item:first').addClass('active');
					delay(function(){
						slide_init();
					},50);
				}
				else{
					slide_finish();
				}
				
			},50);

			$.get(link('story/delete-story'),{id:scont.find('.delstory--modal').data('id')}, function(data) {});
		});
	});

	var scont = $(".story-container");
	var seen  = [];

	function slide_left_story() {
		scont.find('.int-indicator').find('li.active').find('span').stop();
		
		var actv = scont.find('.int-indicator').find('li.active');
		var prev = actv.prev('li');

		if (prev.length > 0) {		
			prev.nextAll('li').removeClass('active').find('span').stop(true, true).css('width', '0px');
			delay(function(){
				prev.addClass('active').find('span').css('width', '0').stop(true, true).animate({width: '100%'},{
					duration:story_duration,
					complete:function(){
						slide_right_story();
					}
				});
			},50);

			$("#view-story-cr").carousel("prev");
		}
	}

	function slide_right_story() {
		scont.find('.int-indicator').find('span').stop(true, true);
		var actv = scont.find('.int-indicator').find('li.active');
		var next = actv.next('li');
		var curr = next.index();
		var last = scont.find('.int-indicator').find('li:last').index();

		if (next.length > 0) {
			next.prevAll('li').removeClass('active').find('span').stop(true, true).css('width', '100% !important');
			delay(function(){
				next.addClass('active').find('span').stop(true, true).animate({width: '100%'},{
					duration:story_duration,
					complete:function(){
						if (curr == last) {
							slide_finish();
						}
						else{	
							slide_right_story();
						}
					}
				});
			},50);
			$("#view-story-cr").carousel("next");
		}
	}

	function slide_init(){
		var active = scont.find('.int-indicator').find('li.active');

		if (active.prevAll('li').length > 0) {
			active.prevAll('li').each(function(index, el) {
				$(el).find('.int-indicator-bar').width('100%');
			});
		}

		active.find('span').width(0).animate({width: '100%'},{
			duration:story_duration,
			complete:function(){
				var curr = $(this).parent('li').index();
				var last = scont.find('.int-indicator').find('li:last').index();
				if (curr == last) {
					slide_finish();
				}
				else{
					delay(function(){
						slide_right_story();
					},50);
				}	
			},
			start:function(){
				var time    = scont.find('.item.active').data('time');
				scont.find('b.story-added').text(time);
				delay(function(){
					let src = scont.find('.item.active').data('src');
					scont.find('.item.video.active').find('video').trigger('play');
				},300);
			}
		});

		if (active.prevAll('li').length > 0) {
			$('.carousel-control-prev').fadeIn(10);;
		}

		else {
			$('.carousel-control-prev').fadeOut(10);;
		}

		if (active.nextAll('li').length > 0) {
			$('.carousel-control-next').fadeIn(10);;
		}

		else {
			$('.carousel-control-next').fadeOut(10);;
		}
	}

	function slide_finish(){
		var seen_story = scont.find('.item.active').prevAll('.item[data-s]');
		var current_id = scont.find('.item.active').data('s');

		if (seen_story.length > 0) {
			seen_story.each(function(index, el) {
				if ($.isNumeric($(el).data('s')) && !seen.includes($(el).data('s'))) {
					seen.push($(el).data('s'));
				}
			});
		}

		if ($.isNumeric(current_id) && !seen.includes(current_id)) {
			seen.push(current_id);
		}

		delay(function(){
			if (seen.length > 0) {
				var user_id = scont.data('uid');
				var recstry = $('.stories').find('b[data-story="'+user_id+'"]').text();
				var recstry = Number(recstry);

				if ($.isNumeric(recstry) && recstry > 0) {
					recstry = (recstry -= seen.length);
					if (recstry > 0) {
						$('.stories').find('b[data-story="'+user_id+'"]').text(recstry);
					}
					else{
						$('.stories').find('b[data-story="'+user_id+'"]').remove();
					}
				}

				$.post(link('story/rs'), {stories:seen}, function(data, textStatus, xhr) {});
			}
		},300);

		
		scont.find('.int-indicator').find('span').each(function(index, el) {
			$(el).stop();
		});
		
		if (scont.find('.item.video').hasClass('active')){ 
			scont.find('.item.video.active').find('video').on('ended',function(){ 
				scont.fadeOut('fast', function() {
					$(this).remove();
				});
			});
		} else if (scont.find('.item').find('img')){
			scont.fadeOut('fast', function() {
				$(this).remove();
			});
		}
			
	}
	
	{/literal}
</script>