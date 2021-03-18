<div class="content post-editing-form">
	<div class="user-heading">
		<img src="{$me.avatar}" class="img-circle">
		<span>{$me.username}</span>
		<svg class="feather feather-arrow" width="18" height="18" viewBox="0 0 48 48" fill="#757575"><path d="M20 34l10-10 -10-10z"></path></svg>
		<span class="pp_area"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-image"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg> {lang('image')}</span>
		<div id="pp_loader">
		<span style="float:left;margin-right:60px;margin-top:-10px;">0%</span>
		<div class="speeding_wheel"></div></div>
	</div>
  	<form class="form" id="upload-post-image" action="{$site_url}/aj/posts/upload-post-images">
		<div class="form-group">
      		<textarea class="form-control pp_make_post" name="caption" rows="3" placeholder="{lang('add_post_caption')}"></textarea>
      	</div>
      	<div class="images-renderer">
      		<div class="select-images" onclick="$('#upload-images').trigger('click');">
				<span>
      				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-image"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>
      			<h5>{lang('choose_up210img')}</h5>
				</span>
      		</div>
      	</div>
      	<div class="form-group publish">
      		<button type="submit" class="btn btn-info">{lang('publish')}</button>
      		<button type="reset" class="btn btn-default" id="close-anim-modal">{lang('close')}</button>
      	</div>
      	<input class="hidden" id="upload-images" type="file" name="images[]" multiple accept="image/*">
            <input type="hidden" name="hash" value="{$csrf_token}">
  	</form>
</div>

{include file="js/script.upload.images.tpl" assign="script"}
{$script|minify_js}
