<script>
	{if not $is_owner}
		function report_profile(user_id,type){
			if (!user_id || !type) {
				return false;
			}

			$("#report-profile").find('.overlay').removeClass('hidden');

			$.ajax({
				url: link('main/report-profile'),
				type: 'POST',
				dataType: 'json',
				{literal}
				data: {id: user_id,t:type},
				{/literal}
			})
			.done(function(data) {
				if (data.status == 200 && data.code == '1') {
					$('li.report-profile').replaceWith($("<li>",{
						class:'report-profile',
						onclick:"report_profile('{$user_data.user_id}',-1);"
					}).append($("<a>",{
						text:'{lang("cancel_report")}'
					})));
				}

				else if(data.status == 200 && data.code == '0'){
					$('li.report-profile').replaceWith($("<li>",{
						class:'report-profile', 
					}).append($("<a>",{
						text:'{lang("report_user")}'
					})).attr('data-modal-menu','report-profile'));
				}

				$.toast(data.message,{
	            	duration: 5000, 
	            	type: '',
	            	align: 'top-right',
	            	singleton: false
	            });
				
				$(".modal--menu").each(function(index, el) {
					$(el).removeClass('open').find('.overlay').addClass('hidden');
				});
			});
		}

		function block_user(user_id,a){
			if (user_id && a) {
				if (a == 1) {
					$('.blockuser--modal').data('id',user_id).fadeIn(200);
				}		
				else if(a == -1){
					$('.unblockuser--modal').data('id',user_id).fadeIn(200);
				}

				$(".modal--menu").each(function(index, el) {
					$(el).removeClass('open').find('.overlay').addClass('hidden');
				});
			}
		}

		jQuery(document).ready(function($) {
			$('.block--user').click(function(event) {
				var zis = $(this);
				var uid = zis.closest('.confirm--modal').data('id');
				if ($.isNumeric(uid)) {
					zis.closest('.confirm--modal').fadeOut(400);
					$.ajax({
						url: link('main/block-user'),
						type: 'POST',
						dataType: 'json',
						{literal}
						data: {id:uid},
						{/literal}
					})
					.done(function(data) {
						delay(function(){
							window.location.reload();
						},3000);

						$.toast(data.message,{
			            	duration: 5000, 
			            	type: '',
			            	align: 'top-right',
			            	singleton: false
			            });
					});
				}
			});
		});
	{/if}
</script>