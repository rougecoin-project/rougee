<script>
	function follow(user_id,object){
		if (!user_id || !object) { return false; }
		if (not(is_logged())) {
			redirect('welcome');
			return false;
		}

		object = $(object);

		if (object.hasClass('btn-following') == false) {
			object.find('span').text("{lang('following')}");
			object.find('svg').html('<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline>');

			if (!object.hasClass('btn-following')) {
				object.addClass('btn-following');
			}
		}
		else if(object.hasClass('btn-following') == true){
			object.find('span').text("{lang('follow')}");
			object.find('svg').html('<path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line>');

			if (object.hasClass('btn-following')) {
				object.removeClass('btn-following');
			}
		}
		else{
			return false;
		}
		$.ajax({
			url: link('main/follow'),
			type: 'GET',
			dataType: 'json',
			{literal}
			data: {user_id:user_id},
			{/literal}
		}).done(function(data) {});
	}

	function report_post(post_id,zis) {
		if (not(is_logged())) {
			redirect('welcome');
			return false;
		}
		if (!post_id || !zis) {
			return false;
		}

		$.ajax({
			url: link('posts/report'),
			type: 'POST',
			dataType: 'json',
			{literal}
			data: {id: post_id},
			{/literal}
		})
		.done(function(data) {
			if (data.status == 200 && data.code == 1) {
				$(zis).find('a').text('{lang("cancel_report")}');
			}
			else if(data.status == 200 && data.code == 0){
				$(zis).find('a').text('{lang("report_post")}');
			}

			$.toast(data.message,{
              duration: 5000, 
              type: '',
              align: 'top-right',
              singleton: false
            });
		});
	}
</script>