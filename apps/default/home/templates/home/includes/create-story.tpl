<div class="content post-editing-form">
	<div class="user-heading">
		<img src="{$me.avatar}" class="img-circle">
		<span>{$me.username}</span>
		<svg class="feather feather-arrow" width="18" height="18" viewBox="0 0 48 48" fill="#757575"><path d="M20 34l10-10 -10-10z"></path></svg>
		<span class="pp_area"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg> {lang('story')}</span>
		<div id="pp_loader"><div class="speeding_wheel"></div></div>
	</div>
  	<form class="form" id="add-story-from" action="{$site_url}/aj/story/add">
		<div class="form-group">
      		<textarea class="form-control" name="caption" rows="3" placeholder="Add a story caption.."></textarea>
      	</div>
      	<div class="form-group">
  			<div class="form-control selecet-file-control" onclick="$('#story-file').trigger('click');">
  				<button class=" btn btn-info" type="button">{lang('select_file')}</button>
  				<span class="story-file-name">{lang('no_file_choosen')}</span>
  			</div>
  		</div>
      	<div class="form-group publish">
      		<button type="submit" class="btn btn-info">{lang('publish')}</button>
      		<button type="reset" class="btn btn-default" id="close-anim-modal">{lang('close')}</button>
      	</div>
      	<input class="hidden" id="story-file" type="file" name="file" accept="image/*, video/*">
        <input type="hidden" name="hash" value="{$csrf_token}">
  	</form>
</div>

{include file="js/script.add.story.tpl" assign="script"}
{$script|minify_js}