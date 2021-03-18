<script>
{literal}
	jQuery(document).ready(function($) {
		form = $('#send-message-form');
		conv = $("#conversation-list");

		scroll_el(conv,100);
		update_chat();

		form.find('#mgs-text-input').on('keydown', function(event) {
			if(event.keyCode == 13 && event.shiftKey == 0){
				form.submit();
			}
		});

		form.ajaxForm({
			url: link('messages/send'),
			type: 'POST',
			dataType: 'json',
			beforeSend: function(){
				var mtext = form.find('#mgs-text-input').val();
				if (not(mtext.trim().length)) {
					return false;
				}

				form.find('.overlay').removeClass('hidden');
			},
			success: function(data){
				if (data.status == 200) {
					conv.append(data.html);
				}

				scroll_el(conv,500);
				form.find('.overlay').addClass('hidden');
				form.get(0).reset();
			}
		});

		$("#delete__chat").click(function(event) {
			$('div.delchat--modal').fadeIn(250); 
		});

		$("#clear_messages").click(function(event) {
			$('div.clearchat--modal').fadeIn(250); 
		});

		$('.clear--chat').click(function(event) {
			var zis = $(this);
			zis.parents('.confirm--modal').fadeOut();
			conv.empty();

			$.get(link('messages/clear-chat'), function(data) {
			  	if (data.status == 200) {
			  		$.toast(data.message,{
		            	duration: 5000, 
		            	type: '',
		            	align: 'top-right',
		            	singleton: false
		            });
			  	}
			}); 
		});

		$('.delete--chat').click(function(event) {
			var zis = $(this);
			zis.parents('.confirm--modal').fadeOut();
			conv.empty();

			$.get(link('messages/delete-chat'), function(data) {
			  	if (data.status == 200) {
			  		$("div.chat-list").find('li.active').slideUp(200,function(){
			  			$(this).remove();
			  		});
			  		
			  		delay(function(){
			  			window.location.href = data.url;
			  		},1000);
			  	}
			}); 
		});

		$(document).on('click', '.message-list-item', function(event) {
			event.preventDefault();
			$(this).toggleClass('active');
			var selected = $("#conversation-list").find('.message-list-item.active').length;
			if(selected){
				$("#conversation-list").addClass('active');
				$('.delete-selected').removeClass('hidden').find('b').text(selected);
			}
			else{
				$("#conversation-list").removeClass('active');
				$('.delete-selected').addClass('hidden').find('b').text('');
			}
		});

		$('.deselect-messages').click(function(event) {
			$('.message-list-item').each(function(index, el) {
				$(el).removeClass('active');
			});

			$('.delete-selected').addClass('hidden').find('b').text('');
		});

		$('.delselected-messages').click(function(event) {
			$('div.delmessages--modal').fadeIn(250); 
		});

		$('.delete--messages').click(function(event) {
			var zis = $(this);
			var lst = [];
			zis.parents('.confirm--modal').fadeOut();

			$('.message-list-item.active').each(function(index, el) {
				lst[index] = $(el).data('id');
				$(el).fadeOut(400,function(){
					$(this).remove();
				});
			});

			$("#conversation-list").removeClass('active');
			$('.delete-selected').addClass('hidden').find('b').text('');

			if (lst.length) {
				$.post(link('messages/delete-messages'),{messages:lst},function(data) {},dataType = 'json');
			}
		});
	});

	function update_chat(){
		setTimeout(function () {
	        var last_msg = 0;
	        var data     = new Object();

			if (conv.find('.message-list-item').length > 0) {
				last_msg    = conv.find('.message-list-item:last').data('id');
				data['lid'] = last_msg;
			}

			$.ajax({
				url: link('messages/update-chat'),
				type: 'GET',
				dataType: 'json',
				data: data,
			})
			.done(function(data) {
				if (data.status == 200) {
					if (data.html) {
						conv.append(data.html);
						scroll_el(conv,100);
					}
				}
			});
			
			update_chat();
	    }, 4000);
	}
	
	$(document).on('click','.mobile_msg_close',function(){
		select_chat();
	});
{/literal}
</script>