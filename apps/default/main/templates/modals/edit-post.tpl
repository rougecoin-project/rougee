<div class="dialog-modal" id="edit-post-modal" style="display: none;">
	<div class="modal--inner">
		<div class="modal--header">
			<h5><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit" color="#4caf50" style="background-color: rgba(76, 175, 80, 0.25)"><polygon points="16 3 21 8 8 21 3 21 3 16 16 3"></polygon></svg> {lang('edit_post')}</h5>
		</div>
		<form class="form">
			<div class="modal--body">
				<div class="form-group">
					<textarea name="caption" id="caption" rows="4" class="form-control" placeholder="{lang('add_post_caption')}"></textarea>
				</div>
			</div>
			<div class="modal--footer">
				<button class="btn btn-default" type="button">{lang('cancel')}</button>
				<button class="btn btn-success" type="submit">{lang('save_changes')}</button>
			</div>
			<input type="hidden" name="post_id" value="{$post_data.post_id}" id="post_id">
		</form>
	</div>
</div>