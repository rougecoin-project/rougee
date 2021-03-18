{if $page == 'blocked'}
	<script data-page="blocked-users">
		jQuery(document).ready(function($) {
			$("button.unblock-user").click(function(event) {
				var user_id = $(this).attr('id');
				var zis     = $(this);
				$('.unblockuser--modal').data('id',user_id).fadeIn(350);
			});

			$('.block--user').click(function(event) {
				var zis     = $(this);
				var uid     = zis.closest('.confirm--modal').data('id');
				if (!uid || !$.isNumeric(uid)) {
					return false;
				}

				zis.closest('.confirm--modal').data('id','').fadeOut(400);
				$.ajax({
					url: link('settings/unblock-user'),
					type: 'POST',
					dataType: 'json',
					{literal}
					data: {id:uid},
					{/literal}
				})
				.done(function(data) {
					delay(function(){
						$('[data-blocked-users-ls="'+uid+'"]').slideUp('fast',function(){
							$(this).remove();
						});
					},500);

					$.toast(data.message,{
		            	duration: 5000, 
		            	type: '',
		            	align: 'top-right',
		            	singleton: false
		            });
				});	
			});
		});
	</script>
{/if}


{if $page == 'general'}
	<script data-page="general">
		jQuery(document).ready(function($) {
			$("#avatar").change(function(event) {
				$("#edit-avatar").submit();
			});

			$("form#edit-general-settings").ajaxForm({
				url: '{$xhr_url}/general',
				type: 'POST',
				dataType: 'json',
				beforeSubmit: function(arr,form){
					$(form).find('.pp_load_loader').addClass('loadingg');
					$(form).find('button[type="submit"]').attr('disabled','true');
				},
				success: function(data,stat,xhr,form){
					scroll2top();
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });
					$(form).find('.pp_load_loader').removeClass('loadingg');
	                $(form).find('button[type="submit"]').removeAttr('disabled');
				}
			});

			$("#edit-avatar").ajaxForm({
				url: '{$xhr_url}/edit-avatar',
				type: 'POST',
				dataType: 'json',
				data:{
					user_id: '{$me.user_id}'
				},
				beforeSend: function(){
					$("#modal-progress").removeClass('hidden');
				},
				success: function(data){
					if (data.status == 200) {
						$('.avatar-wrapper').find('img').attr('src', data.avatar);
					}
					
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });

					$("#modal-progress").addClass('hidden');
				}
			});
		});
	</script>
{/if}


{if $page == 'profile'}
	<script data-page="profile">
		jQuery(document).ready(function($) {
			$("#avatar").change(function(event) {
				$("#edit-avatar").submit();
			});

			$("form#edit-profile-settings").ajaxForm({
				url: '{$xhr_url}/profile',
				type: 'POST',
				dataType: 'json',
				beforeSubmit: function(arr,form){
					$(form).find('.pp_load_loader').addClass('loadingg');
					$(form).find('button[type="submit"]').attr('disabled','true');
				},
				success: function(data,stat,xhr,form){
					scroll2top();
					if (data.message) {
						$.toast(data.message,{
		                	duration: 5000, 
		                	type: '',
		                	align: 'top-right',
		                	singleton: false
		                });
					}
					$(form).find('.pp_load_loader').removeClass('loadingg');
	                $(form).find('button[type="submit"]').removeAttr('disabled');
				}
			});
		});
	</script>
{/if}


{if $page == 'password'}
	<script data-page="password">
		jQuery(document).ready(function($) {
			$("form#edit-password-settings").ajaxForm({
				url: '{$xhr_url}/change-password',
				type: 'POST',
				dataType: 'json',
				beforeSubmit: function(arr,form){
					$(form).find('.pp_load_loader').addClass('loadingg');
					$(form).find('button[type="submit"]').attr('disabled','true');
				},
				success: function(data,stat,xhr,form){
					scroll2top();
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });
					$(form).find('.pp_load_loader').removeClass('loadingg');
	                $(form).find('button[type="submit"]').removeAttr('disabled');
	                $(form).get(0).reset();
				}
			});
		});
	</script>	
{/if}

{if $page == 'privacy'}
	<script>
		jQuery(document).ready(function($) {
			var form = $("form#edit-privacy-settings");
			form.ajaxForm({
				url: link('settings/privacy'),
				type: 'POST',
				dataType: 'json',
				beforeSend: function(){
					$(form).find('.pp_load_loader').addClass('loadingg');
					form.find('button[type="submit"]').attr('disabled','true');
				},
				success: function(data){
					$(form).find('.pp_load_loader').removeClass('loadingg');
					form.find('button[type="submit"]').removeAttr('disabled');
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });
				}
			});
		});
	</script>	
{/if}

{if $page == 'notifications'}
	<script>
		jQuery(document).ready(function($) {
			var form = $("form#edit-notification-settings");
			form.ajaxForm({
				url: link('settings/notifications'),
				type: 'POST',
				dataType: 'json',
				beforeSend: function(){
					$(form).find('.pp_load_loader').addClass('loadingg');
					form.find('button[type="submit"]').attr('disabled','true');
				},
				success: function(data){
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });
					$(form).find('.pp_load_loader').removeClass('loadingg');
					form.find('button[type="submit"]').removeAttr('disabled');
				}
			});
		});
	</script>
{/if}

{if $page == 'delete'}
	<script>
		jQuery(document).ready(function($) {
			$("form#delete-account-settings").ajaxForm({
				url: link('settings/delete-account'),
				type: 'POST',
				dataType: 'json',
				beforeSubmit: function(arr,form){
					$(form).find('.pp_load_loader').addClass('loadingg');
					$(form).find('button[type="submit"]').attr('disabled', 'true');
				},
				success: function(data){
					$.toast(data.message,{
	                	duration: 5000, 
	                	type: '',
	                	align: 'top-right',
	                	singleton: false
	                });

					delay(function(){
						window.location.href = site_url("welcome");
					},2500);
				}
			});
		});
	</script>	
{/if}