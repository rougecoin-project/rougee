<div class="content post-editing-form">
	<div class="user-heading">
		<img src="{$me.avatar}" class="img-circle">
		<span>{$me.username}</span>
		<svg class="feather feather-arrow" width="18" height="18" viewBox="0 0 48 48" fill="#757575"><path d="M20 34l10-10 -10-10z"></path></svg>
		<span class="pp_area"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-image"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg> GIF</span>
	</div>
  	<form class="form" id="import-post-gifs">
		<div class="form-group">
      		<textarea class="form-control" name="caption" rows="3" placeholder="{lang('add_post_caption')}"></textarea>
      	</div>
      	<div class="form-group search-input">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
      		<input type="text" placeholder="{lang('search_gifs')}">
      	</div>
      	<div class="preview-video hide">
      		<button class="pull-right" type="button">
      			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="feather feather-close"><path d="M12,2C17.53,2 22,6.47 22,12C22,17.53 17.53,22 12,22C6.47,22 2,17.53 2,12C2,6.47 6.47,2 12,2M15.59,7L12,10.59L8.41,7L7,8.41L10.59,12L7,15.59L8.41,17L12,13.41L15.59,17L17,15.59L13.41,12L17,8.41L15.59,7Z"></path></svg>
      		</button>
      		<div class="fluid"></div>
      	</div>
      	<div class="content hide"></div>
      	<div class="form-group publish">
      		<button type="submit" class="btn btn-info">{lang('publish')}</button>
      		<button type="reset" class="btn btn-default" id="close-anim-modal">{lang('close')}</button>
      	</div>
      	<input class="hidden" id="upload-images" type="file" name="images[]" multiple accept="image/*">
        <input type="hidden" name="hash" value="{$csrf_token}">
  	</form>
</div>
<div class="clear"></div>

{include file="js/script.import.images.tpl" assign="script"}
{$script|minify_js}