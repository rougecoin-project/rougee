var URL = window.URL || window.webkitURL;

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        define([], factory);
    } else {
        root.capture_video_frame = factory();
    }
	}(this, function () {
    return function capture_video_frame(video, format) {
        if (typeof video === 'string') {
            video = document.getElementById(video);
        }

        format = format || 'jpeg';

        if (!video || (format !== 'png' && format !== 'jpeg')) {
            return false;
        }

        var canvas = document.createElement("canvas");

        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;

        canvas.getContext('2d').drawImage(video, 0, 0);


        var dataUri = canvas.toDataURL('image/' + format);
        var data = dataUri.split(',')[1];
        var mimeType = dataUri.split(';')[0].slice(5)

        var bytes = window.atob(data);
        var buf = new ArrayBuffer(bytes.length);
        var arr = new Uint8Array(buf);

        for (var i = 0; i < bytes.length; i++) {
            arr[i] = bytes.charCodeAt(i);
        }

        var blob = new Blob([ arr ], { type: mimeType });
        return { blob: blob, dataUri: dataUri, format: format };
    };
}));


function capture_canvas_image(id, format) {
    if (typeof id === 'string') {
        var canvas = document.getElementById(id);
    }

    format = format || 'jpeg';

    if ((format !== 'png' && format !== 'jpeg')) {
        return false;
    }

    canvas.getContext('2d');


    var dataUri = canvas.toDataURL('image/' + format);
    var data = dataUri.split(',')[1];
    var mimeType = dataUri.split(';')[0].slice(5)

    var bytes = window.atob(data);
    var buf = new ArrayBuffer(bytes.length);
    var arr = new Uint8Array(buf);

    for (var i = 0; i < bytes.length; i++) {
        arr[i] = bytes.charCodeAt(i);
    }

    var blob = new Blob([ arr ], { type: mimeType });
    return { blob: blob, dataUri: dataUri, format: format };
}



	function Wo_progressIconLoader(e) {e.each(function(){return progress_icon_elem=$(this).find("i.progress-icon"),default_icon=progress_icon_elem.attr("data-icon"),hide_back=!1,1==progress_icon_elem.hasClass("hidde")&&(hide_back=!0),1==$(this).find("i.fa-spinner").length?(progress_icon_elem.removeClass("fa-spinner").removeClass("fa-spin").addClass("fa-"+default_icon),1==hide_back&&progress_icon_elem.hide()):progress_icon_elem.removeClass("fa-"+default_icon).addClass("fa-spinner fa-spin").show(),!0})}function Wo_StartBar(){$(".loader").css("display","block")}function Wo_FinishBar(){$(".loader").css("display","none")}$(document).ready(function(){$(".nav-footer-toggle").on("click",function(e){e.preventDefault(),$(this).parent().toggleClass("Wide-Footer"),$(".nav-footer-toggle i").toggleClass("fa-arrow-circle-up fa-arrow-circle-down")})});
	function Wo_CheckForCallAnswer(id) {
		let url = link('twilio/check_for_answer');
		$.get(url + '?id='+id , function (data1) {
			if (data1.status == 200) {
				clearTimeout(checkcalls);
				$('#calling-modal').find('.modal-title').html('<i class="fa fa fa-video-camera"></i> ' + data1.text_answered);
				$('#calling-modal').find('.modal-body p').text(data1.text_please_wait);
				setTimeout(function () {
					window.location.href = data1.url;
				}, 1000);
				return false;
			} else if (data1.status == 400) {
				clearTimeout(checkcalls);
				Wo_PlayAudioCall('stop');
				$('#calling-modal').find('.modal-title').html('<i class="fa fa fa-times"></i> ' + data1.text_call_declined);
				$('#calling-modal').find('.modal-body p').text(data1.text_call_declined_desc);
			}
			checkcalls = setTimeout(function () {
				Wo_CheckForCallAnswer(id);
			}, 2000);
		});
	}
	function Wo_CheckForAudioCallAnswer(id) {
		$.get(window.ajax + 'chat/check_for_audio_answer?id='+id, function (data1) {
			if (data1.status == 200) {
				clearTimeout(checkcalls);
				$('#calling-modal').find('.modal-title').html('<i class="fa fa fa-phone"></i> ' + data1.text_answered);
				$('#calling-modal').find('.modal-body p').text(data1.text_please_wait);
				Wo_PlayAudioCall('stop');
				setTimeout(function () {
					$( '#calling-modal' ).remove();
					$( '.modal-overlay' ).remove();
					$( 'body' ).removeClass( "modal-open" );
					$('body').append(data1.calls_html);
					$('#re-talking-modal').modal({dismissible: false});
					$('#re-talking-modal').modal('open');
				}, 3000);
			} else if (data1.status == 400) {
				clearTimeout(checkcalls);
				Wo_PlayAudioCall('stop');
				$('#calling-modal').find('.modal-title').html('<i class="fa fa fa-times"></i> ' + data1.text_call_declined);
				$('#calling-modal').find('.modal-body p').text(data1.text_call_declined_desc);
			} else {
				checkcalls = setTimeout(function () {
					Wo_CheckForAudioCallAnswer(id);
				}, 2000);
			}
		});
	}
	function Wo_AnswerCall(id, url, type) {
		type1 = 'video';
		if (type == 'video') {
			type1 = 'video';
		} else if (type == 'audio') {
			type1 = 'audio';
		}
		Wo_progressIconLoader($('#re-calling-modal').find('.answer-call'));
		let _url = link('twilio/answer_call');
		$.get(_url + '?id='+id+'&type='+type1, function (data) {
			Wo_PlayVideoCall('stop');
			if (type1 == 'video') {
				if (data.status == 200) {
					window.location.href = url;
				}
			} else {
				$('#re-calling-modal').remove();
				$('.modal-overlay').remove();
				$('body').removeClass( "modal-open" );
				$('body').append(data.calls_html);
				$('#re-talking-modal').modal({dismissible: false});
				$('#re-talking-modal').modal('open');
			}
			Wo_progressIconLoader($('#re-calling-modal').find('.answer-call'));
		});
	}
	function Wo_DeclineCall(id, url, type) {
		type1 = 'video';
		if (type == 'video') {
			type1 = 'video';
		} else if (type == 'audio') {
			type1 = 'audio';
		}
		Wo_progressIconLoader($('#re-calling-modal').find('.decline-call'));
		let _url = link('twilio/decline_call');
		$.get(_url + '?id='+id+'&type='+type1, function (data) {
			if (data.status == 200) {
				Wo_PlayVideoCall('stop');
				$( '#re-calling-modal' ).remove();
				$( '.modal-overlay' ).remove();
				$('.modal-backdrop').remove();
				$( 'body' ).removeClass( "modal-open" );
				document.title = document_title;
			}
		});
	}
	function Wo_CloseCall(id) {
		Wo_progressIconLoader($('#re-talking-modal').find('.decline-call'));
		$.get(window.ajax + 'chat/close_call?id='+id, function (data) {
			if (data.status == 200) {
				$( '#re-talking-modal' ).remove();
				$( '.modal-overlay' ).remove();
				$( 'body' ).removeClass( "modal-open");
			}
		});
	}
	function Wo_CancelCall() {
		Wo_progressIconLoader($('#calling-modal').find('.cancel-call'));
		let url = link('twilio/cancel_call');
		$.get(url, function (data) {
			if (data.status == 200) {
				Wo_PlayAudioCall('stop');
				$( '#calling-modal' ).remove();
				$( '.modal-overlay' ).remove();
				$('.modal-backdrop').remove();
				$( 'body' ).removeClass( "modal-open" );
			}
		});
	}
	function Wo_GenerateVideoCall(user_id1) {
		let user_id2 = $('#vxd').val();
		let url = link('twilio/create_new_video_call');
		$.get( url + '?new=true&user_id1='+user_id1+'&user_id2='+user_id2, function(data, status){
			if( data.status == 200 ){
				$('body').append(data.html);
				$('#calling-modal').modal({dismissible: false});
				$('#calling-modal').modal('show');
				
				checkcalls = setTimeout(function () {
					Wo_CheckForCallAnswer(data.id);
				}, 2000);
				setTimeout(function() {
					$('#calling-modal').find('.modal-title').html('<i class="fa fa fa-video-camera"></i> ' + data.text_no_answer);
					$('#calling-modal').find('.modal-body p').text(data.text_please_try_again_later);
					clearTimeout(checkcalls);
					Wo_PlayAudioCall('stop');
				}, 43000);
				Wo_PlayAudioCall('play');
			}
		});

	}
	function Wo_PlayVideoCall(type) {
		var content = document.getElementById('video-calling-sound');
		if (!content){
			return;
		}
		if (type == 'play') {
			var promise = document.getElementById('video-calling-sound').play();
			if (promise !== undefined) {
				promise.then(function() {
					
				}).catch(function() {
				
				});
			}
			window.playmusic = setTimeout(function() {
				Wo_PlayVideoCall('play');
			}, 100);
		} else {
			clearTimeout(window.playmusic);
			document.getElementById('video-calling-sound').pause();
		}
	}
	function Wo_PlayAudioCall(type) {
		var content = document.getElementById('calling-sound');
		if (!content){
			return;
		}

		if (type == 'play') {
			var promise = document.getElementById('calling-sound').play();
			if (promise !== undefined) {
				promise.then(function(){
					
				}).catch(function() {
					
				});
			}
			window.playmusic_ = setTimeout(function() {
				Wo_PlayAudioCall('play');
			}, 100);
		} else {
			clearTimeout(window.playmusic_);
			document.getElementById('calling-sound').pause();
		}
	}
	

jQuery(document).ready(function($) {

	var hash = $('.csrf-token').val();

	$.ajaxSetup({ 
	    data: {
	        hash: ((hash != undefined) ? hash : 0)
	    },
	    cache: false,
	    timeout:(1000 * 360)
	});

	$(document).ajaxSend(function(e, xhr, opt) {
		if (opt.url.indexOf('main/follow') > 0 && not(is_logged())) {
			redirect('welcome');
			xhr.abort();
		}
	});

	$(document).on("click","[data-modal--menu-dismiss]",function(event) {
		$(this).closest('.modal--menu').removeClass('open');
	});

	$(document).on("click","[data-confirm--modal-dismiss]",function(event) {
		$(this).closest('.confirm--modal').fadeOut(200, function() {
			$(this).data('id', '');
		});
	});

	$(document).on('click',"[data-modal-menu]",function(event) {
		$(".modal--menu").each(function(index, el) {
			$(el).removeClass('open');
		});

		var modal = "#"+$(this).data('modal-menu');
		$(modal).addClass('open');
	});

	$(".caption").filter(function(){
    	if($.trim($(this).text()).length < 1){
        	$(this).text('')
        }
    });

    $(document).on('click', '.add-post-bf--controls', function(event) {
    	$(this).toggleClass('active');
    });

	

	delay(function(){
		if (is_logged()) {
			update_data();
		}
	},100);
	$('[data-toggle="tooltip"]').tooltip();

	$(document).on('hover', '[data-toggle="tooltip"]', function(event) {
		event.preventDefault();
		$('[data-toggle="tooltip"]').tooltip();
	});


	$(document).on('show.bs.dropdown', '.dropdown.slide', function(event) {
		$(this).find('.dropdown-menu').first().stop(true, true).slideDown(100);
	});

	$(document).on('hide.bs.dropdown', '.dropdown.slide', function(event) {
		$(this).find('.dropdown-menu').first().stop(true, true).slideUp(100);
	});

	$(document).on('click', '.lightbox-ol', function(event) {
		event.preventDefault();
		$('.light__box').remove();
	});

	$.fn.scroll2 = function (speed) {
        if (typeof(speed) === 'undefined')
            speed = 500;

        $('html, body').animate({
            scrollTop: ($(this).offset().top - 100)
        }, speed);

        return $(this);
    };

    $(window).scroll(function(event) {
    	if ($(this).scrollTop() > $(this).height()) {
    		$(".scroll__up").css('right', '25px');
    	}
    	else{
    		$(".scroll__up").css('right', '-100px');
    	}
    });

    $(".scroll__up").click(function(event) {
    	$("html,body").stop(/*stop animation*/).animate({scrollTop:0}, 800);
    });

    $("#search-chats").keyup(function(event) {
		var chatls = $(".chat-list").find('ul');
		var uname  = $(this).val();
		var found  = new Array();

		if (uname.length > 1) {
			chatls.find('span.username').each(function(index, el) {
				var username = $(el).text();
				if (username.indexOf(uname) == -1) {
					$(el).closest('li').addClass('hidden');
				}
			});
		}
		else{
			chatls.find('li').removeClass('hidden');
		}
	});

	$(document).ready(function(){
		$('.tl-follow-suggestions').slick({
		infinite: false,
		slidesToShow: 4,
		variableWidth: false,
		slidesToScroll: 1,
		autoplay: false,
		autoplaySpeed: 2000,
		responsive: [
			{
				breakpoint: 1024,
				settings: {
					slidesToShow: 4
				}
			},
			{
				breakpoint: 800,
				settings: {
					slidesToShow: 3
				}
			},
			{
				breakpoint: 600,
				settings: {
					slidesToShow: 2
				}
			},
			{
				breakpoint: 300,
				settings: {
					slidesToShow: 1
				}
			}
		]
		});
	});
	
	$(document).ready(function(){
		$('.post-follow-suggestions').slick({
		infinite: false,
		slidesToShow: 5,
		variableWidth: false,
		slidesToScroll: 1,
		autoplay: false,
		autoplaySpeed: 2000,
		responsive: [
			{
				breakpoint: 1024,
				settings: {
					slidesToShow: 4
				}
			},
			{
				breakpoint: 800,
				settings: {
					slidesToShow: 3
				}
			},
			{
				breakpoint: 600,
				settings: {
					slidesToShow: 2
				}
			},
			{
				breakpoint: 300,
				settings: {
					slidesToShow: 1
				}
			}
		]
		});
	});

	$(document).on('submit','#edit-post-caption', function(event) {
		event.preventDefault();

		var text    = $(this).find('#caption').val();
		var post_id = $(this).find('#post_id').val();


		if (int(post_id) == 0) {
			return false;
		}


		var post = $("div[data-post-id='"+post_id+"']");

		$("#create-newpost").hide();
		$(this).empty();
		$('body').removeClass('active');
		post.find('[data-caption]').html(linkify_htags(text));
// 		$("#create-newpost").fadeOut(100,function(){
// 			$(this).empty();
// 			$('body').removeClass('active');
// 			post.find('[data-caption]').html(linkify_htags(text.find('script').remove()));
// //			$(this).css({'display':'none','opacity':0});
// 		});

		$.ajax({
			url: link('posts/update'),
			type: 'POST',
			dataType: 'json',
			data: {text:text,id:post_id},
		})
		.done(function(data) {
			if (data.message) {
				$.toast(data.message,{
	            	duration: 5000, 
	            	type: '',
	            	align: 'bottom',
	            	singleton: true
	            });
			}
		});
	});

	$(document).on('click','.delete--article',function(event) {
		var zis = $(this);
		var id  = zis.parents('.confirm--modal').data('id');
		var url = zis.parents('.confirm--modal').data('url');
		var _thumbnail = zis.parents('.confirm--modal').data('thumbnail');

		if (id) {
			zis.parents('.confirm--modal').data('id',"").fadeOut(200);
			$("#modal-progress").removeClass('hidden');
			$.ajax({
				url: link('blogs/delete-article'),
				type: 'POST',
				dataType: 'json',
				data: {post_id:id,thumbnail: _thumbnail},
			})
			.done(function(data) {
				if (data.status == 200) {
					$("div[data-article-id='"+id+"']").slideUp('fast',function(){
						$(this).remove();	
					});
				}
				else{
					$.toast(data.message,{
	                  duration: 5000, 
	                  type: '',
	                  align: 'bottom',
	                  singleton: true
	                });
				}

				if (url) {
					delay(function(){
						window.location.href = url;
					},1000);
				}
				$("#modal-progress").addClass('hidden');
			});
		}
	});

	$(document).on('click','.delete--post',function(event) {
		var zis = $(this);
		var id  = zis.parents('.confirm--modal').data('id');
		var url = zis.parents('.confirm--modal').data('url');
		

		if (id) {
			zis.parents('.confirm--modal').data('id',"").fadeOut(200);
			$("#modal-progress").removeClass('hidden');
			$.ajax({
				url: link('posts/delete-post'),
				type: 'POST',
				dataType: 'json',
				data: {post_id:id},
			})
			.done(function(data) {
				if (data.status == 200) {
					$("div[data-post-id='"+id+"']").slideUp('fast',function(){
						$(this).remove();	
					});
				}
				else{
					$.toast(data.message,{
	                  duration: 5000, 
	                  type: '',
	                  align: 'bottom',
	                  singleton: true
	                });
				}

				if (url) {
					delay(function(){
						window.location.href = url;
					},1000);
				}
				$("#modal-progress").addClass('hidden');
			});
		}
	});

	$(document).on('click','.delete--fund',function(event) {
		var zis = $(this);
		var id  = zis.parents('.confirm--modal').data('id');
		

		if (id) {
			zis.parents('.confirm--modal').data('id',"").fadeOut(200);
			$("#modal-progress").removeClass('hidden');
			$.ajax({
				url: link('profile/delete-fund'),
				type: 'POST',
				dataType: 'json',
				data: {fund_id:id},
			})
			.done(function(data) {
				if (data.status == 200) {
					$("div[data-fund='"+id+"']").slideUp('fast',function(){
						$(this).remove();	
					});
				}
				else{
					$.toast(data.message,{
	                  duration: 5000, 
	                  type: '',
	                  align: 'bottom',
	                  singleton: true
	                });
				}

				$("#modal-progress").addClass('hidden');
			});
		}
	});

	$(document).on('click','.delete--comment',function(event) {
		var zis = $(this);
		var id  = zis.parents('.confirm--modal').data('id');

		if (id) {
			zis.parents('.confirm--modal').data('id',"").fadeOut(200, function() {
				$("[data-post-comment='"+id+"']").slideUp('fast',function(){
					$(this).remove();
				});

				$.post(link('posts/delete-comment'), {id:id});
				$('.confirm--modal').css('display', 'none');
			});;
		}
	});

	$(document).on('click','.delete--blog-comment',function(event) {
		var zis = $(this);
		var id  = zis.parents('.confirm--modal').data('id');

		if (id) {
			zis.parents('.confirm--modal').data('id',"").fadeOut(200, function() {
				$("[data-post-comment='"+id+"']").slideUp('fast',function(){
					$(this).remove();
				});

				$.post(link('blogs/delete-comment'), {id:id});
				$('.confirm--modal').css('display', 'none');
			});;
		}
	});

	$(document).on('click','.delete--funding-request',function(event) {
		var zis = $(this);
		var id  = zis.parents('.confirm--modal').data('id');

		if (id) {
			zis.parents('.confirm--modal').data('id',"").fadeOut(200, function() {
				$("[data-fund='"+id+"']").slideUp('fast',function(){
					$(this).remove();
				});

				$.post(link('main/delete-funding'), {id:id});
				$('.confirm--modal').css('display', 'none');
			});;
		}
	});
});

function get_cookie(name) {
    var matches = document.cookie.match(new RegExp(
      "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));

    return (matches ? decodeURIComponent(matches[1]) : undefined);
}

function is_logged(){
	if (get_cookie('user_id') != undefined) {
		return true;
	}

	return false;
}

function scroll2top() {
	verticalOffset = typeof (verticalOffset) != 'undefined' ? verticalOffset : 0;
	element = $('html');
	offset = element.offset();
	offsetTop = offset.top;
	$('html, body').animate({
	    scrollTop: offsetTop
	}, 300, 'linear');
}

function base64_2_blob(dataURI) {
    var byteString;
    if (dataURI.split(',')[0].indexOf('base64') >= 0)
        byteString = atob(dataURI.split(',')[1]);
    else
        byteString = unescape(dataURI.split(',')[1]);

    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
    var ia = new Uint8Array(byteString.length);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    return new Blob([ia], { type:mimeString });
}

function video_base64_iamge(video) {
	if (!video) {
		return false;
	}

	var canvas    = document.createElement("canvas");
	var scale     = 0.25;
	var b64       = "";
	canvas.width  = video.videoWidth * scale;
	canvas.height = video.videoHeight * scale;
	canvas.getContext('2d').drawImage(video, 0, 0, canvas.width, canvas.height);
	b64 = canvas.toDataURL();
	return b64;
}
function get_yt_id(url){
	if (!url) { return false;}
	var regex  = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
	var groups = regex.exec(url);
    console.log(groups);
	return (Array.isArray(groups)) ? groups[7] : false;
}

function get_vimeo_id(url){
	if (!url) { return false;}
	var regex  = /^https?:\/\/vimeo\.com\/([0-9]+)\/{0,1}$/;
	var groups = regex.exec(url);
	return (Array.isArray(groups)) ? groups[1] : false;
}
function is_playtube_url(url,orginal){
	if (!url && !orginal) { return false;}
	//var regex = new RegExp(orginal);
	var regex = orginal;
	
	var groups = regex.exec(url);
	
	return (Array.isArray(groups) && groups[2]) ? groups[2] : false;
}
function get_dailymotion_id(url){
	if (!url) { return false;}
	var regex  = /^(?:https?:\/\/)?www\.dailymotion\.com\/video\/([a-zA-Z0-9_]+)\/?$/;
	var groups = regex.exec(url);
	return (Array.isArray(groups)) ? groups[1] : false;
}

function is_mp4_url(url){
	if (!url) { return false;}
	var regex = /^(http:\/\/|https:\/\/|www\.).*(\.mp4)$/;
	var groups = regex.exec(url);
	return (Array.isArray(groups) && groups[2] == '.mp4') ? true : false;
}

function delete_post(id,redir){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (!id) { return false; }
	$('div.delpost--modal').data('id',id).fadeIn(250);
	if (redir === true) {
		$('div.delpost--modal').data('url',site_url());
	}
}

function delete_article(id,thumbnail,redir){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (!id) { return false; }
	$('div.delarticle--modal').data('id',id).data('thumbnail',thumbnail).fadeIn(250);
	if (redir === true) {
		$('div.delarticle--modal').data('url',site_url());
	}
}


function embed_post(id,redir){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (!id) { return false; }
	$('#embed_post').val('<iframe src="'+site_url( 'embed/'+id )+'" style="width: 100%"></iframe>');
	$('div.embedpost--modal').data('id',id).fadeIn(250);
	if (redir === true) {
		$('div.embedpost--modal').data('url',site_url());
	}
}

function comment_post(id,event){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (event.keyCode == 13 && event.shiftKey == 0 && id) {
		event.preventDefault();
		var post = $("div[data-post-id='"+id+"']");
		post.find('.commenting-overlay').removeClass('hidden');
		var text = post.find('.comment').val();
		var list = post.find('.post-comments-list');
		post.find('.comment').val('');
		$.post(xhr_url() + 'posts/add-comment', {post_id:id,text:text}, function(data, textStatus, xhr) {
			if (data.status == 200) {
				$(data.html).insertAfter(list.find('li.pp_post_comms'));
				if (list.css('display') == 'none') {
					list.slideDown(50);
				}

			}
			$('.emojionearea .emojionearea-editor').html('');
			post.find('.commenting-overlay').addClass('hidden');
			
		});
	}
	else{
		return false;
	}
}

function delete_commnet(id){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (id) {
		$('.delcomment--modal').data('id', id).fadeIn(250);
	}
	else{
		return false;
	}
}
function delete_blog_commnet(id){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (id) {
		$('.delcomment--modal').data('id', id).fadeIn(250);
	}
	else{
		return false;
	}
}
function delete_funding(id){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (id) {
		$('.delfunding--modal').data('id', id).fadeIn(250);
	}
	else{
		return false;
	}
}
var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();


function lightbox(post_id,page){
	if (!post_id || !page) { return false; }

	$("#modal-progress").removeClass('hidden');
	$.get((xhr_url() + 'posts/lightbox'), {post_id:post_id,page:page},function(data) {
		if (data.status == 200) {
			$(".lightbox__container").html(data.html);
		}
		else{
			$(".lightbox__container").empty();
		}
		$("#modal-progress").addClass('hidden');
	},dataType= 'json');
	window.history.pushState({state:'new'},'', site_url( 'post/'+post_id ));
}

function storelightbox(post_id,page){
    if (!post_id || !page) { return false; }

    $("#modal-progress").removeClass('hidden');
    $.get((xhr_url() + 'store/lightbox'), {post_id:post_id,page:page},function(data) {
        if (data.status === 200) {
            $(".lightbox__container").html(data.html);
        }
        else{
            $(".lightbox__container").empty();
        }
        $("#modal-progress").addClass('hidden');
    },dataType= 'json');
    window.history.pushState({state:'new'},'', site_url( 'store/'+post_id ));
}


function Pxpx_GetPayPalLink(type,amount,_title,_id) {
    $('.btn-paypal').attr('disabled','true');
    if (amount > 0) {
        $.post(link('store/get_paypal_link'), {type: type,amount:amount,title:_title,id:_id}, function(data, textStatus, xhr) {
            if (data.status == 200) {
                window.location.href = data.url;
            }
            $('.btn-paypal').removeAttr('disabled');
        });
    }
    else{
        scroll2top();
        $.toast("{{LANG please_check_details}}",{
            duration: 5000,
            type: 'success',
            align: 'bottom',
            singleton: true
        });
    }
}

function lb_comment(id,event){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}

	if (event.keyCode == 13 && event.shiftKey == 0 && id) {

		event.preventDefault();
		var lb = $("div.light__box");
		lb.find('.commenting-overlay').removeClass('hidden');
		var text = lb.find('.comment_light').val();
		var list = lb.find('.post-comments-list');
		if (!text) { return false; }

		$.post(xhr_url() + 'posts/add-comment', {post_id:id,text:text}, function(data, textStatus, xhr) {
			if (data.status == 200) {
				if (list.find('.pp_light_comm_count').length > 0) {
					$(data.html).insertAfter(list.find('.pp_light_comm_count'));
				}
				else{
					list.prepend(data.html);
				}

			}

			$('.emojionearea .emojionearea-editor').text('');
				$('.emojionearea .emojionearea-editor').html('');
			lb.find('.comment_light').val('');
			lb.find('.commenting-overlay').addClass('hidden');
		});
	}
	else{
		return false;
	}
}

function scroll_el(object,speed){
	if (!speed) {
		speed = 1000;
	}
	object.animate({
		scrollTop: (object.get(0).scrollHeight)
	}, speed);
}

function not(val){
	return !val;
}


function randint(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}


function random_color(){
	var cols = [
		'#5bbe89',
		'#d55f3a',
		'#a97cc6',
		'#ef863c',
		'#e27100',
		'#15493b',
		'#b582af',
	    '#a84849',
	    '#fc9cde',
	    '#f9c270',
	    '#70a0e0',
	    '#56c4c5',
	    '#51bcbc',
	    '#f33d4c',
	    '#a1ce79',
	    '#a085e2',
	    '#ed9e6a',
	    '#2b87ce',
	    '#f2812b',
	    '#0ba05d',
	    '#f9a722',
	    '#8ec96c',
	    '#01a5a5',
	    '#5462a5',
	    '#609b41',
	    '#ff72d2',
	    '#008484',
	    '#c9605e',
	    '#aa2294',
	    '#056bba',
	    '#0e71ea'
	];
	return cols[randint(0,(cols.length - 1))];
}


function log(val){
	console.log(val);
}

function int(val){
	if ($.isNumeric(val) === true) {
		val = Number(val);
	}
	else{
		val = 0;
	}

	return val;
}

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();


function get_notifications(){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	var notfi_set = $("ul#notifications__list");
	var newnotif  = $("#new__notif");
	$.ajax({
		url: xhr_url() + 'main/get_notif',
		type: 'GET',
		dataType: 'json'
	})
	.done(function(data) {
		if (data.status == 200) {
			newnotif.text('');
			notfi_set.html(data.html);
		}

		else if(data.status == 304){
			var cont = $('<div>').append($('<span>',{
				text:data.message
			}));

			notfi_set.html($("<li>",{
				class:'no__notifications',
				html: cont.prepend('<svg xmlns="http://www.w3.org/2000/svg" class="confetti" viewBox="0 0 1081 601"><path class="st0" d="M711.8 91.5c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C695.2 84 702.7 91.5 711.8 91.5zM711.8 64.1c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S705.9 64.1 711.8 64.1z"/><path class="st0" d="M74.5 108.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C57.9 100.9 65.3 108.3 74.5 108.3zM74.5 81c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7S68.6 81 74.5 81z"/><path class="st1" d="M303 146.1c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C286.4 138.6 293.8 146.1 303 146.1zM303 118.7c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7C292.3 123.5 297.1 118.7 303 118.7z"/><path class="st2" d="M243.4 347.4c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7S234.2 347.4 243.4 347.4zM243.4 320c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7S237.5 320 243.4 320z"/><path class="st1" d="M809.8 542.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C793.2 534.8 800.7 542.3 809.8 542.3zM809.8 514.9c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S803.9 514.9 809.8 514.9z"/><path class="st3" d="M1060.5 548.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C1043.9 540.8 1051.4 548.3 1060.5 548.3zM1060.5 520.9c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S1054.6 520.9 1060.5 520.9z"/><path class="st3" d="M387.9 25.2l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L387.9 25.2z"/><path class="st3" d="M368.3 498.6l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L368.3 498.6z"/><path class="st3" d="M16.4 270.2l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L16.4 270.2z"/><path class="st2" d="M824.7 351.1l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L824.7 351.1z"/><path class="st1" d="M146.3 573.6H138v-8.3c0-1.3-1-2.3-2.3-2.3s-2.3 1-2.3 2.3v8.3h-8.3c-1.3 0-2.3 1-2.3 2.3s1 2.3 2.3 2.3h8.3v8.3c0 1.3 1 2.3 2.3 2.3s2.3-1 2.3-2.3v-8.3h8.3c1.3 0 2.3-1 2.3-2.3S147.6 573.6 146.3 573.6z"/><path class="st1" d="M1005.6 76.3h-8.3V68c0-1.3-1-2.3-2.3-2.3s-2.3 1-2.3 2.3v8.3h-8.3c-1.3 0-2.3 1-2.3 2.3s1 2.3 2.3 2.3h8.3v8.3c0 1.3 1 2.3 2.3 2.3s2.3-1 2.3-2.3v-8.3h8.3c1.3 0 2.3-1 2.3-2.3S1006.8 76.3 1005.6 76.3z"/><path class="st1" d="M95.5 251.6c-3.5 0-6.3 2.8-6.3 6.3 0 3.5 2.8 6.3 6.3 6.3s6.3-2.8 6.3-6.3S99 251.6 95.5 251.6z"/><path class="st0" d="M1032 281.8c-3.5 0-6.3 2.8-6.3 6.3s2.8 6.3 6.3 6.3 6.3-2.8 6.3-6.3S1035.5 281.8 1032 281.8z"/><path class="st2" d="M741.6 139.3c-3.5 0-6.3 2.8-6.3 6.3s2.8 6.3 6.3 6.3 6.3-2.8 6.3-6.3S745 139.3 741.6 139.3z"/><path class="st3" d="M890.7 43.5c3.3 0 6-2.7 6-6s-2.7-6-6-6 -6 2.7-6 6C884.8 40.8 887.4 43.5 890.7 43.5z"/><path class="st0" d="M164.3 537.6c3.3 0 6-2.7 6-6s-2.7-6-6-6 -6 2.7-6 6C158.4 535 161 537.6 164.3 537.6z"/></svg><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell-off"><path d="M8.56 2.9A7 7 0 0 1 19 9v4m-2 4H2a3 3 0 0 0 3-3V9a7 7 0 0 1 .78-3.22M13.73 21a2 2 0 0 1-3.46 0"></path><line x1="1" y1="1" x2="23" y2="23"></line></svg>')
			}));
		}
	});
}

function get_requests(){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	var notfi_set = $("ul#requests__list");
	var newnotif  = $("#new__notif_follow");
	$.ajax({
		url: xhr_url() + 'main/get_requests',
		type: 'GET',
		dataType: 'json'
	})
	.done(function(data) {
		if (data.status == 200) {
			newnotif.text('');
			notfi_set.html(data.html);
		}

		else if(data.status == 304){
			var cont = $('<div>').append($('<span>',{
				text:data.message
			}));

			notfi_set.html($("<li>",{
				class:'no__notifications',
				html: cont.prepend('<svg xmlns="http://www.w3.org/2000/svg" class="confetti" viewBox="0 0 1081 601"><path class="st0" d="M711.8 91.5c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C695.2 84 702.7 91.5 711.8 91.5zM711.8 64.1c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S705.9 64.1 711.8 64.1z"/><path class="st0" d="M74.5 108.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C57.9 100.9 65.3 108.3 74.5 108.3zM74.5 81c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7S68.6 81 74.5 81z"/><path class="st1" d="M303 146.1c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C286.4 138.6 293.8 146.1 303 146.1zM303 118.7c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7C292.3 123.5 297.1 118.7 303 118.7z"/><path class="st2" d="M243.4 347.4c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7S234.2 347.4 243.4 347.4zM243.4 320c5.9 0 10.7 4.8 10.7 10.7 0 5.9-4.8 10.7-10.7 10.7s-10.7-4.8-10.7-10.7S237.5 320 243.4 320z"/><path class="st1" d="M809.8 542.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C793.2 534.8 800.7 542.3 809.8 542.3zM809.8 514.9c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S803.9 514.9 809.8 514.9z"/><path class="st3" d="M1060.5 548.3c9.2 0 16.7-7.5 16.7-16.7s-7.5-16.7-16.7-16.7 -16.7 7.5-16.7 16.7C1043.9 540.8 1051.4 548.3 1060.5 548.3zM1060.5 520.9c5.9 0 10.7 4.8 10.7 10.7s-4.8 10.7-10.7 10.7 -10.7-4.8-10.7-10.7S1054.6 520.9 1060.5 520.9z"/><path class="st3" d="M387.9 25.2l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L387.9 25.2z"/><path class="st3" d="M368.3 498.6l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L368.3 498.6z"/><path class="st3" d="M16.4 270.2l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L16.4 270.2z"/><path class="st2" d="M824.7 351.1l7.4-7.4c1.1-1.1 1.1-3 0-4.1s-3-1.1-4.1 0l-7.4 7.4 -7.4-7.4c-1.1-1.1-3-1.1-4.1 0s-1.1 3 0 4.1l7.4 7.4 -7.4 7.4c-1.1 1.1-1.1 3 0 4.1s3 1.1 4.1 0l7.4-7.4 7.4 7.4c1.1 1.1 3 1.1 4.1 0s1.1-3 0-4.1L824.7 351.1z"/><path class="st1" d="M146.3 573.6H138v-8.3c0-1.3-1-2.3-2.3-2.3s-2.3 1-2.3 2.3v8.3h-8.3c-1.3 0-2.3 1-2.3 2.3s1 2.3 2.3 2.3h8.3v8.3c0 1.3 1 2.3 2.3 2.3s2.3-1 2.3-2.3v-8.3h8.3c1.3 0 2.3-1 2.3-2.3S147.6 573.6 146.3 573.6z"/><path class="st1" d="M1005.6 76.3h-8.3V68c0-1.3-1-2.3-2.3-2.3s-2.3 1-2.3 2.3v8.3h-8.3c-1.3 0-2.3 1-2.3 2.3s1 2.3 2.3 2.3h8.3v8.3c0 1.3 1 2.3 2.3 2.3s2.3-1 2.3-2.3v-8.3h8.3c1.3 0 2.3-1 2.3-2.3S1006.8 76.3 1005.6 76.3z"/><path class="st1" d="M95.5 251.6c-3.5 0-6.3 2.8-6.3 6.3 0 3.5 2.8 6.3 6.3 6.3s6.3-2.8 6.3-6.3S99 251.6 95.5 251.6z"/><path class="st0" d="M1032 281.8c-3.5 0-6.3 2.8-6.3 6.3s2.8 6.3 6.3 6.3 6.3-2.8 6.3-6.3S1035.5 281.8 1032 281.8z"/><path class="st2" d="M741.6 139.3c-3.5 0-6.3 2.8-6.3 6.3s2.8 6.3 6.3 6.3 6.3-2.8 6.3-6.3S745 139.3 741.6 139.3z"/><path class="st3" d="M890.7 43.5c3.3 0 6-2.7 6-6s-2.7-6-6-6 -6 2.7-6 6C884.8 40.8 887.4 43.5 890.7 43.5z"/><path class="st0" d="M164.3 537.6c3.3 0 6-2.7 6-6s-2.7-6-6-6 -6 2.7-6 6C158.4 535 161 537.6 164.3 537.6z"/></svg><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line></svg>')
			}));
		}
	});
}

function Pxp_AcceptFollowRequest(self,user_id) {
	$('.accept_request_btn').attr('disabled', 'true');
	$.post(xhr_url() + 'main/accept_requests', {user_id: user_id}, function(data, textStatus, xhr) {
		if (data.status == 200) {
			$('#request_menu_'+user_id).remove();
			$.toast(data.message,{
            	duration: 5000, 
            	type: '',
            	align: 'bottom',
            	singleton: true
            });
		}
		else{
			$.toast(data.message,{
            	duration: 5000, 
            	type: '',
            	align: 'bottom',
            	singleton: true
            });
		}
	});
}

function Pxp_DeleteFollowRequest(self,user_id) {
	$('.accept_request_btn').attr('disabled', 'true');
	$.post(xhr_url() + 'main/delete_requests', {user_id: user_id}, function(data, textStatus, xhr) {
		if (data.status == 200) {
			$('#request_menu_'+user_id).remove();
			// $.toast(data.message,{
   //          	duration: 5000, 
   //          	type: '',
   //          	align: 'bottom',
   //          	singleton: true
   //          });
		}
		else{
			$.toast(data.message,{
            	duration: 5000, 
            	type: '',
            	align: 'bottom',
            	singleton: true
            });
		}
	});
}
function like_blog(post_id,zis){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}

	if (!post_id || !zis) {
		return false;
	}

	var zis = $(zis);
	var lks = null;

	if ($("[data-blog-likes='"+post_id+"']").length == 1) {
		lks = $("[data-blog-likes='"+post_id+"']");
	}

	if (zis.hasClass('active')) {
		zis.removeClass('active');
		if (lks) {
			let likes = int(lks.text());
			if (likes >= 1) {
				lks.text(likes - 1);
			}
		}
	}
	else{
		zis.addClass('active');
		if (lks) {
			let likes = int(lks.text()) + 1;
			lks.text(likes);
		}
	}

	$.ajax({
		url: xhr_url() + 'blogs/like',
		type: 'POST',
		dataType: 'json',
		data: {id:post_id},
	})
	.done(function(data) {});
}
function like_post(post_id,zis){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}

	if (!post_id || !zis) {
		return false;
	}

	var zis = $(zis);
	var lks = null;

	if ($("[data-post-likes='"+post_id+"']").length == 1) {
		lks = $("[data-post-likes='"+post_id+"']");
	}

	if (zis.hasClass('active')) {
		zis.removeClass('active');
		if (lks) {
			let likes = int(lks.text());
			if (likes >= 1) {
				lks.text(likes - 1);
			}
		}
	}
	else{
		zis.addClass('active');
		if (lks) {
			let likes = int(lks.text()) + 1;
			lks.text(likes);
		}
	}

	$.ajax({
		url: xhr_url() + 'posts/like',
		type: 'POST',
		dataType: 'json',
		data: {id:post_id},
	})
	.done(function(data) {});
}

function save_post(post_id,zis){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}

	if (!post_id || !zis) {
		return false;
	}

	var zis = $(zis);

	if (zis.hasClass('active')) {
		zis.removeClass('active');
	}
	else{
		zis.addClass('active');
	}

	$.ajax({
		url: link('posts/save'),
		type: 'POST',
		dataType: 'json',
		data: {id:post_id},
	})
	.done(function(data) {
		if (data.status == 200) {
			$.toast(data.message,{
            	duration: 5000, 
            	type: '',
            	align: 'bottom',
            	singleton: true
            });
		}
	});
}


function update_data(){
	var app_page = $("body").data('app');
	var features = {
		'notifications':1,
		'new_messages':1,
		'stories':0,
		'chats':0
	};

	if (app_page == 'messages') {
		features['chats'] = 1;
	}

	$.ajax({
		url: link('main/update-data'),
		type: 'GET',
		dataType: 'json',
		data: features,
	})
	.done(function(data) {
		if (data.notif && $.isNumeric(data.notif)) {
			var newnotif = $("#new__notif");
			newnotif.text(data.notif);
		}

		if (data.requests && $.isNumeric(data.requests)) {
			var requests = $("#new__notif_follow");
			requests.text(data.requests);
		}

		if (data.new_messages && $.isNumeric(data.new_messages)) {
			var new_messages = $("#new__messages");
			var new_messages_sec = $("#new__messages_sec");
			new_messages.text(data.new_messages);
			new_messages_sec.text(data.new_messages);
		}

		if(data.is_call == 0 ){
			Wo_PlayVideoCall('stop');
			$( '#re-calling-modal' ).remove();
			$( '.modal-overlay' ).remove();
			$( 'body' ).removeClass( "modal-open" );
		}

		var videochatnotification = data.calls;
		if ( videochatnotification > 0 && $('#re-calling-modal').length == 0 && $('#re-talking-modal').length == 0) {
			if ($('#calling-modal').length == 0) {
				$('body').append(data.calls_html);
				if (!$('#re-calling-modal').hasClass('calling')) {
					$('#re-calling-modal').modal({dismissible: false});
					$('#re-calling-modal').modal('show');
					Wo_PlayVideoCall('play');
				}
				document.title = 'New video call..';
				setTimeout(function () {
					$('.modal').modal('close');
					$('#re-calling-modal').addClass('calling');
					Wo_PlayVideoCall('stop');
					//document.title = document_title;
					setTimeout(function () {
						$( '#re-calling-modal' ).remove();
						$( '.modal-overlay' ).remove();
						$( 'body' ).removeClass( "modal-open" );
					}, 3000);
					$( '#re-calling-modal' ).remove();
					$('.modal-overlay.in').hide();
				}, 40000);
			}
		}else{
			//alert('hangout');
		}
				
	});

	setTimeout(function(){
		update_data();
	},(1000 * 10))
}


function link(path){
	var url = xhr_url() + path;
	return url;
}

function redirect(path){
	window.location.href = site_url(path);
}

function header_loadbar(a){
	if (a == 'f') {
		var w = $('.loadding-pgbar .bar').css('left');
		$('.loadding-pgbar .bar').animate({left: 100+'%'},{
			complete:function(){
				$(this).fadeOut(500, function() {
					$(this).css('left', '0px').fadeIn(10);
				});
			}
		});
	}
	else{
		var w = randint(35,75);
		$('.loadding-pgbar .bar').animate({left:w +'%'},1000);
	}
}

function view_post_likes(post_id){
	if (post_id && $.isNumeric(post_id)) {
		if ($('[data-post-likes='+post_id+']').text() > 0) {
			header_loadbar();

			$.ajax({
				url: link('posts/view-likes'),
				type: 'GET',
				dataType: 'json',
				data: {post_id:post_id},
			})
			.done(function(data) {
				if (data.status == 200) {
					$(data.html).insertAfter('main.container');
				}
				else{
					if (data.message) {
						$.toast(data.message,{
		                	duration: 5000, 
		                	type: '',
		                	align: 'bottom',
		                	singleton: true
		                });
					}
				}
				delay(function(){
					header_loadbar('f');
				},500);
			});
		}
		
	}
}

function toggle_post_comm(post_id) {
	if (post_id && $.isNumeric(post_id)) {
		$('.timeline-posts[data-post-id="'+post_id+'"]')
		.find('.post-comments-list')
		.slideToggle(10);
	}
}

function load_tlp_comments(post_id,zis) {
	if (post_id && $.isNumeric(post_id) && zis) {
		var post = $('.timeline-posts[data-post-id="'+post_id+'"]');
        var first = post.find('.post-comments-list').find('[data-post-comment]').first();
		var last = post.find('.post-comments-list').find('[data-post-comment]').last();
		var cmid = last.data('post-comment');
		var zis  = $(zis);

		if ($.isNumeric(cmid)) {
			zis.attr('disabled', 'true');
			$.ajax({
				url: link('posts/load-tlp-comments'),
				type: 'POST',
				dataType: 'json',
				data: {post_id: post_id,offset:cmid},
			})
			.done(function(data) {
				if (data.status == 200) {
					$(data.html).insertAfter(last);
                    $(data.html).insertAfter(first);
				}
				else{
					zis.text(data.message);
					delay(function(){
						zis.fadeOut(300, function() {
							$(this).parent('li').remove();
						});
					},3000);
				}
				zis.removeAttr('disabled');
			});
		}
	}
}

function edit_post(post_id){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}

	if (post_id && $.isNumeric(post_id)) {
		var form = $("#post-editing-template").html();
		var post = $("div[data-post-id='"+post_id+"']");
		var text = post.find('[data-caption]').text();
		
		if (form.length) {
			form = $(form);
			form.find('#caption').val($.trim(text));
			form.find('#post_id').val(post_id);
			console.log(form)
			$('body').addClass('active');
			$("#create-newpost").html(form).show();
			//$('#create-newpost').css({'display':'block','opacity':1});
		}
	}
}

function linkify_htags(text){
	var htags = text.match(/#([^`~!@$%^&*\#()\-+=\\|\/\.,<>?\'\":;{}\[\]* ]{4,120})/ig);
	var htag  = '';

	if (Array.isArray(htags) && htags.length > 0) {
		htags.forEach(function(el){
			htag = el.substr(1);
			htag = '<a href="'+site_url(('explore/tags/'+htag))+'">'+el+'</a>';
			text = text.replace(el, htag);
		});
	}
	return text;
}

function px_add_view(post_id) {
	$.ajax({
		url: link('posts/add_view'),
		type: 'POST',
		dataType: 'json',
		data: {post_id:post_id},
	})
	.done(function(data) {
		if (data.status == 200) {
			$('.video_views_').find('span').html(data.count)
		}
		else{
		}
	});
}
function add_emoji(id) {
	var el = $("#emojionearea"+id).emojioneArea({
		pickerPosition: "bottom",
	    tonesStyle: "radio",
	    events: {
	     	keyup: function (editor, event) {
		      $("div[data-post-id='"+id+"']").find('.comment').val(el[0].emojioneArea.getText());
              comment_post(id,event);
		    }
	    },
	    filters: {
	        flags : false,
	        objects : false,
	        travel_places : false,
	        activity : false
	    }
	});
}
function add_comment_emoji(id) {
	var el = $("#emojionearea_comment"+id).emojioneArea({
		pickerPosition: "bottom",
	    tonesStyle: "radio",
	    events: {
	     	keyup: function (editor, event) {
		      $("[data-post-comment='"+id+"']").find('.comment').val(el[0].emojioneArea.getText());
              pxp_reply_comment(id,event);
		    }
	    },
	    filters: {
	        flags : false,
	        objects : false,
	        travel_places : false,
	        activity : false
	    }
	});
}
function add_comment_emoji_lightbox(id) {
	var el = $("#emojionearea_comment_lightbox_"+id).emojioneArea({
		pickerPosition: "bottom",
	    tonesStyle: "radio",
	    events: {
	     	keyup: function (editor, event) {
		      $("[data-post-comment='"+id+"']").find('.comment').val(el[0].emojioneArea.getText());
              pxp_reply_comment(id,event,'lightbox');
		    }
	    },
	    filters: {
	        flags : false,
	        objects : false,
	        travel_places : false,
	        activity : false
	    }
	});
}

function change_mode() {
	if ($('#night_mode_css').length > 0) {
		$('#night_mode_css').remove();
		$('.logo img').attr('src', window.light_logo);
	}
	else{
		$('head').append($('<link>',{
			rel: 'stylesheet',
			href:  get_theme()+"/main/static/css/styles.master_night.css",
			id : 'night_mode_css'
		}))
        $('.logo img').attr('src', window.logo);
	}
	$.post(link('main/change_mode'), function(data, textStatus, xhr) {
	});
}

function get_more_activities() {
	var id = $('.activity_').last().attr('id');
	$('#load_more_activities_').hide();
	$('#load_more_activities_load_').show();
	$.post(link('main/get_more_activities'),{id:id}, function(data, textStatus, xhr) {
		if (data.status == 200) {
			$('#activities_container').append(data.html);
			$('#load_more_activities_').show();
		}
		else{
			if ($('#load_more_activities_text').length == 0) {
				$('#activities_container').append('<div id="load_more_activities_text" class="item activity_"><div class="caption caption_" style="text-align:center" ><span>'+data.text+'</span></div></div>');
                $('#load_more_activities_').hide();
			}
        }
        scroll_el($('#activities_container'),100);
        $('#load_more_activities_load_').hide();
		
	});
}
function show_m_reprted(post_id) {
	$('.show_m_reprted-'+post_id).remove(); 
	$('.text_m_reprted-'+post_id).remove(); 
}

// like comment 
function pxp_like_dis_comment(comment_id,self) {
	$.post(link('comments/like_dislike'),{comment_id:comment_id}, function(data, textStatus, xhr) {
		if (data.status == 200) {
			if (data.code == 1) {
				$('.comment_like_'+comment_id).find('svg').addClass('liked_color');
				$('.comment_like_span_'+comment_id).find('span').html(data.likes);
			}
			else{
				$('.comment_like_'+comment_id).find('svg').removeClass('liked_color');
				$('.comment_like_span_'+comment_id).find('span').html(data.likes);
			}
		}
	});
}
// like comment 
// reply comment 
function pxp_reply_comment(id,event,type = ''){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (event.keyCode == 13 && event.shiftKey == 0 && id) {
		event.preventDefault();
		var comment = $("[data-post-comment='"+id+"']");
		comment.find('.reply_commenting_overlay').removeClass('hidden');
		var text = comment.find('.comment').val();
		var list = comment.find('.reply_list');
		comment.find('.comment').val('');
		$.post(xhr_url() + 'comments/add_comment_reply', {comment_id:id,text:text}, function(data, textStatus, xhr) {
			if (data.status == 200) {
				if (type == 'lightbox') {
					$('.reply_list_lightbox_'+id).append(data.html);
				}
				else{
					list.append(data.html);
				}
				// $(data.html).insertAfter(list.find('li.pp_post_comms'));
				// if (list.css('display') == 'none') {
				// 	list.slideDown(50);
				// }

			}
			$('.emojionearea .emojionearea-editor').html('');
			comment.find('.reply_commenting_overlay').addClass('hidden');
			$('.commenting-overlay').addClass('hidden');
			
		});
	}
	else{
		return false;
	}
}

function pxp_get_comment_reply(comment_id,self,type = ''){
	var comment = $("[data-post-comment='"+comment_id+"']");
	var list = comment.find('.reply_list');
	if (list.text() == '' && type != 'lightbox') {
		$.post(link('comments/get_comment_reply'),{comment_id:comment_id}, function(data, textStatus, xhr) {
			if (data.status == 200) {
				if (type == 'lightbox') {
					$('.reply_list_lightbox_'+comment_id).html(data.html);
					$('#lightbox_reply_form_'+comment_id).show();
				}
				else{
					list.html(data.html);
					$('#add_reply_form_'+comment_id).show();
				}
				
				// if (data.code == 1) {
				// 	$(self).find('svg').addClass('liked_color');
				// 	$(self).find('span').html(data.likes);
				// }
				// else{
				// 	$(self).find('svg').removeClass('liked_color');
				// 	$(self).find('span').html(data.likes);
				// }
			}
		});
	}
	else if($('.reply_list_lightbox_'+comment_id).text() == '' && type == 'lightbox'){
		$.post(link('comments/get_comment_reply'),{comment_id:comment_id}, function(data, textStatus, xhr) {
			if (data.status == 200) {
				if (type == 'lightbox') {
					$('.reply_list_lightbox_'+comment_id).html(data.html);
					$('#lightbox_reply_form_'+comment_id).show();
				}
				else{
					list.html(data.html);
					$('#add_reply_form_'+comment_id).show();
				}
				
				// if (data.code == 1) {
				// 	$(self).find('svg').addClass('liked_color');
				// 	$(self).find('span').html(data.likes);
				// }
				// else{
				// 	$(self).find('svg').removeClass('liked_color');
				// 	$(self).find('span').html(data.likes);
				// }
			}
		});

	}
	else{
		console.log($('.reply_list_lightbox_'+comment_id).text() == '' );
		if (type == 'lightbox') {
			$('.reply_list_lightbox_'+comment_id).html('');
			$('#lightbox_reply_form_'+comment_id).hide();
		}
		else{
			list.html('');
			$('#add_reply_form_'+comment_id).hide();
		}
	}
}

function pxp_like_dis_comment_reply(reply_id,self) {
	$.post(link('comments/reply_like_dislike'),{reply_id:reply_id}, function(data, textStatus, xhr) {
		if (data.status == 200) {
			if (data.code == 1) {
				$(self).find('svg').addClass('liked_color');
				$('.comment_like_span_reply_'+reply_id).find('span').html(data.likes);
			}
			else{
				$(self).find('svg').removeClass('liked_color');
				$('.comment_like_span_reply_'+reply_id).find('span').html(data.likes);
			}
		}
	});
}

function delete_commnet_reply(id){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	if (id) {
		$('.delreply--modal').data('id', id).fadeIn(250);
	}
	else{
		return false;
	}
}
function pxp_boost_post(post_id){
	if (not(is_logged())) {
		redirect('welcome');
		return false;
	}
	$.post(link('posts/boost'), {post_id: post_id}, function(data, textStatus, xhr) {
		if (data.status == 200) {
			if (data.code == 1) {
				$('#boost_'+post_id).html(data.message);
			}
			else{
				$('#boost_'+post_id).html(data.message);
			}
		}
	});
}

$(document).on('click','.delete--comment--reply',function(event) {
	var zis = $(this);
	var id  = zis.parents('.confirm--modal').data('id');
	if (id) {
		zis.parents('.confirm--modal').data('id',"").fadeOut(200, function() {
			$("[data-post-comment-reply='"+id+"']").slideUp('fast',function(){
				$(this).remove();
			});

			$.post(link('comments/delete_reply'), {reply_id:id});
			$('.confirm--modal').css('display', 'none');
		});;
	}
});
// reply comment 

/*Stickey Sidebar*/
!function(i){i.fn.theiaStickySidebar=function(t){function e(t,e){var a=o(t,e);a||(console.log("TSS: Body width smaller than options.minWidth. Init is delayed."),i(document).on("scroll."+t.namespace,function(t,e){return function(a){var n=o(t,e);n&&i(this).unbind(a)}}(t,e)),i(window).on("resize."+t.namespace,function(t,e){return function(a){var n=o(t,e);n&&i(this).unbind(a)}}(t,e)))}function o(t,e){return t.initialized===!0||!(i("body").width()<t.minWidth)&&(a(t,e),!0)}function a(t,e){t.initialized=!0;var o=i("#theia-sticky-sidebar-stylesheet-"+t.namespace);0===o.length&&i("head").append(i('<style id="theia-sticky-sidebar-stylesheet-'+t.namespace+'">.theiaStickySidebar:after {content: ""; display: table; clear: both;}</style>')),e.each(function(){function e(){a.fixedScrollTop=0,a.sidebar.css({"min-height":"1px"}),a.stickySidebar.css({position:"static",width:"",transform:"none"})}function o(t){var e=t.height();return t.children().each(function(){e=Math.max(e,i(this).height())}),e}var a={};if(a.sidebar=i(this),a.options=t||{},a.container=i(a.options.containerSelector),0==a.container.length&&(a.container=a.sidebar.parent()),a.sidebar.parents().css("-webkit-transform","none"),a.sidebar.css({position:a.options.defaultPosition,overflow:"visible","-webkit-box-sizing":"border-box","-moz-box-sizing":"border-box","box-sizing":"border-box"}),a.stickySidebar=a.sidebar.find(".theiaStickySidebar"),0==a.stickySidebar.length){var s=/(?:text|application)\/(?:x-)?(?:javascript|ecmascript)/i;a.sidebar.find("script").filter(function(i,t){return 0===t.type.length||t.type.match(s)}).remove(),a.stickySidebar=i("<div>").addClass("theiaStickySidebar").append(a.sidebar.children()),a.sidebar.append(a.stickySidebar)}a.marginBottom=parseInt(a.sidebar.css("margin-bottom")),a.paddingTop=parseInt(a.sidebar.css("padding-top")),a.paddingBottom=parseInt(a.sidebar.css("padding-bottom"));var r=a.stickySidebar.offset().top,d=a.stickySidebar.outerHeight();a.stickySidebar.css("padding-top",1),a.stickySidebar.css("padding-bottom",1),r-=a.stickySidebar.offset().top,d=a.stickySidebar.outerHeight()-d-r,0==r?(a.stickySidebar.css("padding-top",0),a.stickySidebarPaddingTop=0):a.stickySidebarPaddingTop=1,0==d?(a.stickySidebar.css("padding-bottom",0),a.stickySidebarPaddingBottom=0):a.stickySidebarPaddingBottom=1,a.previousScrollTop=null,a.fixedScrollTop=0,e(),a.onScroll=function(a){if(a.stickySidebar.is(":visible")){if(i("body").width()<a.options.minWidth)return void e();if(a.options.disableOnResponsiveLayouts){var s=a.sidebar.outerWidth("none"==a.sidebar.css("float"));if(s+50>a.container.width())return void e()}var r=i(document).scrollTop(),d="static";if(r>=a.sidebar.offset().top+(a.paddingTop-a.options.additionalMarginTop)){var c,p=a.paddingTop+t.additionalMarginTop,b=a.paddingBottom+a.marginBottom+t.additionalMarginBottom,l=a.sidebar.offset().top,f=a.sidebar.offset().top+o(a.container),h=0+t.additionalMarginTop,g=a.stickySidebar.outerHeight()+p+b<i(window).height();c=g?h+a.stickySidebar.outerHeight():i(window).height()-a.marginBottom-a.paddingBottom-t.additionalMarginBottom;var u=l-r+a.paddingTop,S=f-r-a.paddingBottom-a.marginBottom,y=a.stickySidebar.offset().top-r,m=a.previousScrollTop-r;"fixed"==a.stickySidebar.css("position")&&"modern"==a.options.sidebarBehavior&&(y+=m),"stick-to-top"==a.options.sidebarBehavior&&(y=t.additionalMarginTop),"stick-to-bottom"==a.options.sidebarBehavior&&(y=c-a.stickySidebar.outerHeight()),y=m>0?Math.min(y,h):Math.max(y,c-a.stickySidebar.outerHeight()),y=Math.max(y,u),y=Math.min(y,S-a.stickySidebar.outerHeight());var k=a.container.height()==a.stickySidebar.outerHeight();d=(k||y!=h)&&(k||y!=c-a.stickySidebar.outerHeight())?r+y-a.sidebar.offset().top-a.paddingTop<=t.additionalMarginTop?"static":"absolute":"fixed"}if("fixed"==d){var v=i(document).scrollLeft();a.stickySidebar.css({position:"fixed",width:n(a.stickySidebar)+"px",transform:"translateY("+y+"px)",left:a.sidebar.offset().left+parseInt(a.sidebar.css("padding-left"))-v+"px",top:"0px"})}else if("absolute"==d){var x={};"absolute"!=a.stickySidebar.css("position")&&(x.position="absolute",x.transform="translateY("+(r+y-a.sidebar.offset().top-a.stickySidebarPaddingTop-a.stickySidebarPaddingBottom)+"px)",x.top="0px"),x.width=n(a.stickySidebar)+"px",x.left="",a.stickySidebar.css(x)}else"static"==d&&e();"static"!=d&&1==a.options.updateSidebarHeight&&a.sidebar.css({"min-height":a.stickySidebar.outerHeight()+a.stickySidebar.offset().top-a.sidebar.offset().top+a.paddingBottom}),a.previousScrollTop=r}},a.onScroll(a),i(document).on("scroll."+a.options.namespace,function(i){return function(){i.onScroll(i)}}(a)),i(window).on("resize."+a.options.namespace,function(i){return function(){i.stickySidebar.css({position:"static"}),i.onScroll(i)}}(a)),"undefined"!=typeof ResizeSensor&&new ResizeSensor(a.stickySidebar[0],function(i){return function(){i.onScroll(i)}}(a))})}function n(i){var t;try{t=i[0].getBoundingClientRect().width}catch(i){}return"undefined"==typeof t&&(t=i.width()),t}var s={containerSelector:"",additionalMarginTop:0,additionalMarginBottom:0,updateSidebarHeight:!0,minWidth:0,disableOnResponsiveLayouts:!0,sidebarBehavior:"modern",defaultPosition:"relative",namespace:"TSS"};return t=i.extend(s,t),t.additionalMarginTop=parseInt(t.additionalMarginTop)||0,t.additionalMarginBottom=parseInt(t.additionalMarginBottom)||0,e(t,this),this}}(jQuery);



/*Users Slider*/
!function(i){"use strict";"function"==typeof define&&define.amd?define(["jquery"],i):"undefined"!=typeof exports?module.exports=i(require("jquery")):i(jQuery)}(function(i){"use strict";var e=window.Slick||{};(e=function(){var e=0;return function(t,o){var s,n=this;n.defaults={accessibility:!0,adaptiveHeight:!1,appendArrows:i(t),appendDots:i(t),arrows:!0,asNavFor:null,prevArrow:'<button class="slick-prev" aria-label="Previous" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left"><polyline points="15 18 9 12 15 6"></polyline></svg></button>',nextArrow:'<button class="slick-next" aria-label="Next" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></button>',autoplay:!1,autoplaySpeed:3e3,centerMode:!1,centerPadding:"50px",cssEase:"ease",customPaging:function(e,t){return i('<button type="button" />').text(t+1)},dots:!1,dotsClass:"slick-dots",draggable:!0,easing:"linear",edgeFriction:.35,fade:!1,focusOnSelect:!1,focusOnChange:!1,infinite:!0,initialSlide:0,lazyLoad:"ondemand",mobileFirst:!1,pauseOnHover:!0,pauseOnFocus:!0,pauseOnDotsHover:!1,respondTo:"window",responsive:null,rows:1,rtl:!1,slide:"",slidesPerRow:1,slidesToShow:1,slidesToScroll:1,speed:500,swipe:!0,swipeToSlide:!1,touchMove:!0,touchThreshold:5,useCSS:!0,useTransform:!0,variableWidth:!1,vertical:!1,verticalSwiping:!1,waitForAnimate:!0,zIndex:1e3},n.initials={animating:!1,dragging:!1,autoPlayTimer:null,currentDirection:0,currentLeft:null,currentSlide:0,direction:1,$dots:null,listWidth:null,listHeight:null,loadIndex:0,$nextArrow:null,$prevArrow:null,scrolling:!1,slideCount:null,slideWidth:null,$slideTrack:null,$slides:null,sliding:!1,slideOffset:0,swipeLeft:null,swiping:!1,$list:null,touchObject:{},transformsEnabled:!1,unslicked:!1},i.extend(n,n.initials),n.activeBreakpoint=null,n.animType=null,n.animProp=null,n.breakpoints=[],n.breakpointSettings=[],n.cssTransitions=!1,n.focussed=!1,n.interrupted=!1,n.hidden="hidden",n.paused=!0,n.positionProp=null,n.respondTo=null,n.rowCount=1,n.shouldClick=!0,n.$slider=i(t),n.$slidesCache=null,n.transformType=null,n.transitionType=null,n.visibilityChange="visibilitychange",n.windowWidth=0,n.windowTimer=null,s=i(t).data("slick")||{},n.options=i.extend({},n.defaults,o,s),n.currentSlide=n.options.initialSlide,n.originalSettings=n.options,void 0!==document.mozHidden?(n.hidden="mozHidden",n.visibilityChange="mozvisibilitychange"):void 0!==document.webkitHidden&&(n.hidden="webkitHidden",n.visibilityChange="webkitvisibilitychange"),n.autoPlay=i.proxy(n.autoPlay,n),n.autoPlayClear=i.proxy(n.autoPlayClear,n),n.autoPlayIterator=i.proxy(n.autoPlayIterator,n),n.changeSlide=i.proxy(n.changeSlide,n),n.clickHandler=i.proxy(n.clickHandler,n),n.selectHandler=i.proxy(n.selectHandler,n),n.setPosition=i.proxy(n.setPosition,n),n.swipeHandler=i.proxy(n.swipeHandler,n),n.dragHandler=i.proxy(n.dragHandler,n),n.keyHandler=i.proxy(n.keyHandler,n),n.instanceUid=e++,n.htmlExpr=/^(?:\s*(<[\w\W]+>)[^>]*)$/,n.registerBreakpoints(),n.init(!0)}}()).prototype.activateADA=function(){this.$slideTrack.find(".slick-active").attr({"aria-hidden":"false"}).find("a, input, button, select").attr({tabindex:"0"})},e.prototype.addSlide=e.prototype.slickAdd=function(e,t,o){var s=this;if("boolean"==typeof t)o=t,t=null;else if(t<0||t>=s.slideCount)return!1;s.unload(),"number"==typeof t?0===t&&0===s.$slides.length?i(e).appendTo(s.$slideTrack):o?i(e).insertBefore(s.$slides.eq(t)):i(e).insertAfter(s.$slides.eq(t)):!0===o?i(e).prependTo(s.$slideTrack):i(e).appendTo(s.$slideTrack),s.$slides=s.$slideTrack.children(this.options.slide),s.$slideTrack.children(this.options.slide).detach(),s.$slideTrack.append(s.$slides),s.$slides.each(function(e,t){i(t).attr("data-slick-index",e)}),s.$slidesCache=s.$slides,s.reinit()},e.prototype.animateHeight=function(){var i=this;if(1===i.options.slidesToShow&&!0===i.options.adaptiveHeight&&!1===i.options.vertical){var e=i.$slides.eq(i.currentSlide).outerHeight(!0);i.$list.animate({height:e},i.options.speed)}},e.prototype.animateSlide=function(e,t){var o={},s=this;s.animateHeight(),!0===s.options.rtl&&!1===s.options.vertical&&(e=-e),!1===s.transformsEnabled?!1===s.options.vertical?s.$slideTrack.animate({left:e},s.options.speed,s.options.easing,t):s.$slideTrack.animate({top:e},s.options.speed,s.options.easing,t):!1===s.cssTransitions?(!0===s.options.rtl&&(s.currentLeft=-s.currentLeft),i({animStart:s.currentLeft}).animate({animStart:e},{duration:s.options.speed,easing:s.options.easing,step:function(i){i=Math.ceil(i),!1===s.options.vertical?(o[s.animType]="translate("+i+"px, 0px)",s.$slideTrack.css(o)):(o[s.animType]="translate(0px,"+i+"px)",s.$slideTrack.css(o))},complete:function(){t&&t.call()}})):(s.applyTransition(),e=Math.ceil(e),!1===s.options.vertical?o[s.animType]="translate3d("+e+"px, 0px, 0px)":o[s.animType]="translate3d(0px,"+e+"px, 0px)",s.$slideTrack.css(o),t&&setTimeout(function(){s.disableTransition(),t.call()},s.options.speed))},e.prototype.getNavTarget=function(){var e=this,t=e.options.asNavFor;return t&&null!==t&&(t=i(t).not(e.$slider)),t},e.prototype.asNavFor=function(e){var t=this.getNavTarget();null!==t&&"object"==typeof t&&t.each(function(){var t=i(this).slick("getSlick");t.unslicked||t.slideHandler(e,!0)})},e.prototype.applyTransition=function(i){var e=this,t={};!1===e.options.fade?t[e.transitionType]=e.transformType+" "+e.options.speed+"ms "+e.options.cssEase:t[e.transitionType]="opacity "+e.options.speed+"ms "+e.options.cssEase,!1===e.options.fade?e.$slideTrack.css(t):e.$slides.eq(i).css(t)},e.prototype.autoPlay=function(){var i=this;i.autoPlayClear(),i.slideCount>i.options.slidesToShow&&(i.autoPlayTimer=setInterval(i.autoPlayIterator,i.options.autoplaySpeed))},e.prototype.autoPlayClear=function(){var i=this;i.autoPlayTimer&&clearInterval(i.autoPlayTimer)},e.prototype.autoPlayIterator=function(){var i=this,e=i.currentSlide+i.options.slidesToScroll;i.paused||i.interrupted||i.focussed||(!1===i.options.infinite&&(1===i.direction&&i.currentSlide+1===i.slideCount-1?i.direction=0:0===i.direction&&(e=i.currentSlide-i.options.slidesToScroll,i.currentSlide-1==0&&(i.direction=1))),i.slideHandler(e))},e.prototype.buildArrows=function(){var e=this;!0===e.options.arrows&&(e.$prevArrow=i(e.options.prevArrow).addClass("slick-arrow"),e.$nextArrow=i(e.options.nextArrow).addClass("slick-arrow"),e.slideCount>e.options.slidesToShow?(e.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"),e.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"),e.htmlExpr.test(e.options.prevArrow)&&e.$prevArrow.prependTo(e.options.appendArrows),e.htmlExpr.test(e.options.nextArrow)&&e.$nextArrow.appendTo(e.options.appendArrows),!0!==e.options.infinite&&e.$prevArrow.addClass("slick-disabled").attr("aria-disabled","true")):e.$prevArrow.add(e.$nextArrow).addClass("slick-hidden").attr({"aria-disabled":"true",tabindex:"-1"}))},e.prototype.buildDots=function(){var e,t,o=this;if(!0===o.options.dots){for(o.$slider.addClass("slick-dotted"),t=i("<ul />").addClass(o.options.dotsClass),e=0;e<=o.getDotCount();e+=1)t.append(i("<li />").append(o.options.customPaging.call(this,o,e)));o.$dots=t.appendTo(o.options.appendDots),o.$dots.find("li").first().addClass("slick-active")}},e.prototype.buildOut=function(){var e=this;e.$slides=e.$slider.children(e.options.slide+":not(.slick-cloned)").addClass("slick-slide"),e.slideCount=e.$slides.length,e.$slides.each(function(e,t){i(t).attr("data-slick-index",e).data("originalStyling",i(t).attr("style")||"")}),e.$slider.addClass("slick-slider"),e.$slideTrack=0===e.slideCount?i('<div class="slick-track"/>').appendTo(e.$slider):e.$slides.wrapAll('<div class="slick-track"/>').parent(),e.$list=e.$slideTrack.wrap('<div class="slick-list"/>').parent(),e.$slideTrack.css("opacity",0),!0!==e.options.centerMode&&!0!==e.options.swipeToSlide||(e.options.slidesToScroll=1),i("img[data-lazy]",e.$slider).not("[src]").addClass("slick-loading"),e.setupInfinite(),e.buildArrows(),e.buildDots(),e.updateDots(),e.setSlideClasses("number"==typeof e.currentSlide?e.currentSlide:0),!0===e.options.draggable&&e.$list.addClass("draggable")},e.prototype.buildRows=function(){var i,e,t,o,s,n,r,l=this;if(o=document.createDocumentFragment(),n=l.$slider.children(),l.options.rows>1){for(r=l.options.slidesPerRow*l.options.rows,s=Math.ceil(n.length/r),i=0;i<s;i++){var d=document.createElement("div");for(e=0;e<l.options.rows;e++){var a=document.createElement("div");for(t=0;t<l.options.slidesPerRow;t++){var c=i*r+(e*l.options.slidesPerRow+t);n.get(c)&&a.appendChild(n.get(c))}d.appendChild(a)}o.appendChild(d)}l.$slider.empty().append(o),l.$slider.children().children().children().css({width:100/l.options.slidesPerRow+"%",display:"inline-block"})}},e.prototype.checkResponsive=function(e,t){var o,s,n,r=this,l=!1,d=r.$slider.width(),a=window.innerWidth||i(window).width();if("window"===r.respondTo?n=a:"slider"===r.respondTo?n=d:"min"===r.respondTo&&(n=Math.min(a,d)),r.options.responsive&&r.options.responsive.length&&null!==r.options.responsive){s=null;for(o in r.breakpoints)r.breakpoints.hasOwnProperty(o)&&(!1===r.originalSettings.mobileFirst?n<r.breakpoints[o]&&(s=r.breakpoints[o]):n>r.breakpoints[o]&&(s=r.breakpoints[o]));null!==s?null!==r.activeBreakpoint?(s!==r.activeBreakpoint||t)&&(r.activeBreakpoint=s,"unslick"===r.breakpointSettings[s]?r.unslick(s):(r.options=i.extend({},r.originalSettings,r.breakpointSettings[s]),!0===e&&(r.currentSlide=r.options.initialSlide),r.refresh(e)),l=s):(r.activeBreakpoint=s,"unslick"===r.breakpointSettings[s]?r.unslick(s):(r.options=i.extend({},r.originalSettings,r.breakpointSettings[s]),!0===e&&(r.currentSlide=r.options.initialSlide),r.refresh(e)),l=s):null!==r.activeBreakpoint&&(r.activeBreakpoint=null,r.options=r.originalSettings,!0===e&&(r.currentSlide=r.options.initialSlide),r.refresh(e),l=s),e||!1===l||r.$slider.trigger("breakpoint",[r,l])}},e.prototype.changeSlide=function(e,t){var o,s,n,r=this,l=i(e.currentTarget);switch(l.is("a")&&e.preventDefault(),l.is("li")||(l=l.closest("li")),n=r.slideCount%r.options.slidesToScroll!=0,o=n?0:(r.slideCount-r.currentSlide)%r.options.slidesToScroll,e.data.message){case"previous":s=0===o?r.options.slidesToScroll:r.options.slidesToShow-o,r.slideCount>r.options.slidesToShow&&r.slideHandler(r.currentSlide-s,!1,t);break;case"next":s=0===o?r.options.slidesToScroll:o,r.slideCount>r.options.slidesToShow&&r.slideHandler(r.currentSlide+s,!1,t);break;case"index":var d=0===e.data.index?0:e.data.index||l.index()*r.options.slidesToScroll;r.slideHandler(r.checkNavigable(d),!1,t),l.children().trigger("focus");break;default:return}},e.prototype.checkNavigable=function(i){var e,t;if(e=this.getNavigableIndexes(),t=0,i>e[e.length-1])i=e[e.length-1];else for(var o in e){if(i<e[o]){i=t;break}t=e[o]}return i},e.prototype.cleanUpEvents=function(){var e=this;e.options.dots&&null!==e.$dots&&(i("li",e.$dots).off("click.slick",e.changeSlide).off("mouseenter.slick",i.proxy(e.interrupt,e,!0)).off("mouseleave.slick",i.proxy(e.interrupt,e,!1)),!0===e.options.accessibility&&e.$dots.off("keydown.slick",e.keyHandler)),e.$slider.off("focus.slick blur.slick"),!0===e.options.arrows&&e.slideCount>e.options.slidesToShow&&(e.$prevArrow&&e.$prevArrow.off("click.slick",e.changeSlide),e.$nextArrow&&e.$nextArrow.off("click.slick",e.changeSlide),!0===e.options.accessibility&&(e.$prevArrow&&e.$prevArrow.off("keydown.slick",e.keyHandler),e.$nextArrow&&e.$nextArrow.off("keydown.slick",e.keyHandler))),e.$list.off("touchstart.slick mousedown.slick",e.swipeHandler),e.$list.off("touchmove.slick mousemove.slick",e.swipeHandler),e.$list.off("touchend.slick mouseup.slick",e.swipeHandler),e.$list.off("touchcancel.slick mouseleave.slick",e.swipeHandler),e.$list.off("click.slick",e.clickHandler),i(document).off(e.visibilityChange,e.visibility),e.cleanUpSlideEvents(),!0===e.options.accessibility&&e.$list.off("keydown.slick",e.keyHandler),!0===e.options.focusOnSelect&&i(e.$slideTrack).children().off("click.slick",e.selectHandler),i(window).off("orientationchange.slick.slick-"+e.instanceUid,e.orientationChange),i(window).off("resize.slick.slick-"+e.instanceUid,e.resize),i("[draggable!=true]",e.$slideTrack).off("dragstart",e.preventDefault),i(window).off("load.slick.slick-"+e.instanceUid,e.setPosition)},e.prototype.cleanUpSlideEvents=function(){var e=this;e.$list.off("mouseenter.slick",i.proxy(e.interrupt,e,!0)),e.$list.off("mouseleave.slick",i.proxy(e.interrupt,e,!1))},e.prototype.cleanUpRows=function(){var i,e=this;e.options.rows>1&&((i=e.$slides.children().children()).removeAttr("style"),e.$slider.empty().append(i))},e.prototype.clickHandler=function(i){!1===this.shouldClick&&(i.stopImmediatePropagation(),i.stopPropagation(),i.preventDefault())},e.prototype.destroy=function(e){var t=this;t.autoPlayClear(),t.touchObject={},t.cleanUpEvents(),i(".slick-cloned",t.$slider).detach(),t.$dots&&t.$dots.remove(),t.$prevArrow&&t.$prevArrow.length&&(t.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display",""),t.htmlExpr.test(t.options.prevArrow)&&t.$prevArrow.remove()),t.$nextArrow&&t.$nextArrow.length&&(t.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display",""),t.htmlExpr.test(t.options.nextArrow)&&t.$nextArrow.remove()),t.$slides&&(t.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function(){i(this).attr("style",i(this).data("originalStyling"))}),t.$slideTrack.children(this.options.slide).detach(),t.$slideTrack.detach(),t.$list.detach(),t.$slider.append(t.$slides)),t.cleanUpRows(),t.$slider.removeClass("slick-slider"),t.$slider.removeClass("slick-initialized"),t.$slider.removeClass("slick-dotted"),t.unslicked=!0,e||t.$slider.trigger("destroy",[t])},e.prototype.disableTransition=function(i){var e=this,t={};t[e.transitionType]="",!1===e.options.fade?e.$slideTrack.css(t):e.$slides.eq(i).css(t)},e.prototype.fadeSlide=function(i,e){var t=this;!1===t.cssTransitions?(t.$slides.eq(i).css({zIndex:t.options.zIndex}),t.$slides.eq(i).animate({opacity:1},t.options.speed,t.options.easing,e)):(t.applyTransition(i),t.$slides.eq(i).css({opacity:1,zIndex:t.options.zIndex}),e&&setTimeout(function(){t.disableTransition(i),e.call()},t.options.speed))},e.prototype.fadeSlideOut=function(i){var e=this;!1===e.cssTransitions?e.$slides.eq(i).animate({opacity:0,zIndex:e.options.zIndex-2},e.options.speed,e.options.easing):(e.applyTransition(i),e.$slides.eq(i).css({opacity:0,zIndex:e.options.zIndex-2}))},e.prototype.filterSlides=e.prototype.slickFilter=function(i){var e=this;null!==i&&(e.$slidesCache=e.$slides,e.unload(),e.$slideTrack.children(this.options.slide).detach(),e.$slidesCache.filter(i).appendTo(e.$slideTrack),e.reinit())},e.prototype.focusHandler=function(){var e=this;e.$slider.off("focus.slick blur.slick").on("focus.slick blur.slick","*",function(t){t.stopImmediatePropagation();var o=i(this);setTimeout(function(){e.options.pauseOnFocus&&(e.focussed=o.is(":focus"),e.autoPlay())},0)})},e.prototype.getCurrent=e.prototype.slickCurrentSlide=function(){return this.currentSlide},e.prototype.getDotCount=function(){var i=this,e=0,t=0,o=0;if(!0===i.options.infinite)if(i.slideCount<=i.options.slidesToShow)++o;else for(;e<i.slideCount;)++o,e=t+i.options.slidesToScroll,t+=i.options.slidesToScroll<=i.options.slidesToShow?i.options.slidesToScroll:i.options.slidesToShow;else if(!0===i.options.centerMode)o=i.slideCount;else if(i.options.asNavFor)for(;e<i.slideCount;)++o,e=t+i.options.slidesToScroll,t+=i.options.slidesToScroll<=i.options.slidesToShow?i.options.slidesToScroll:i.options.slidesToShow;else o=1+Math.ceil((i.slideCount-i.options.slidesToShow)/i.options.slidesToScroll);return o-1},e.prototype.getLeft=function(i){var e,t,o,s,n=this,r=0;return n.slideOffset=0,t=n.$slides.first().outerHeight(!0),!0===n.options.infinite?(n.slideCount>n.options.slidesToShow&&(n.slideOffset=n.slideWidth*n.options.slidesToShow*-1,s=-1,!0===n.options.vertical&&!0===n.options.centerMode&&(2===n.options.slidesToShow?s=-1.5:1===n.options.slidesToShow&&(s=-2)),r=t*n.options.slidesToShow*s),n.slideCount%n.options.slidesToScroll!=0&&i+n.options.slidesToScroll>n.slideCount&&n.slideCount>n.options.slidesToShow&&(i>n.slideCount?(n.slideOffset=(n.options.slidesToShow-(i-n.slideCount))*n.slideWidth*-1,r=(n.options.slidesToShow-(i-n.slideCount))*t*-1):(n.slideOffset=n.slideCount%n.options.slidesToScroll*n.slideWidth*-1,r=n.slideCount%n.options.slidesToScroll*t*-1))):i+n.options.slidesToShow>n.slideCount&&(n.slideOffset=(i+n.options.slidesToShow-n.slideCount)*n.slideWidth,r=(i+n.options.slidesToShow-n.slideCount)*t),n.slideCount<=n.options.slidesToShow&&(n.slideOffset=0,r=0),!0===n.options.centerMode&&n.slideCount<=n.options.slidesToShow?n.slideOffset=n.slideWidth*Math.floor(n.options.slidesToShow)/2-n.slideWidth*n.slideCount/2:!0===n.options.centerMode&&!0===n.options.infinite?n.slideOffset+=n.slideWidth*Math.floor(n.options.slidesToShow/2)-n.slideWidth:!0===n.options.centerMode&&(n.slideOffset=0,n.slideOffset+=n.slideWidth*Math.floor(n.options.slidesToShow/2)),e=!1===n.options.vertical?i*n.slideWidth*-1+n.slideOffset:i*t*-1+r,!0===n.options.variableWidth&&(o=n.slideCount<=n.options.slidesToShow||!1===n.options.infinite?n.$slideTrack.children(".slick-slide").eq(i):n.$slideTrack.children(".slick-slide").eq(i+n.options.slidesToShow),e=!0===n.options.rtl?o[0]?-1*(n.$slideTrack.width()-o[0].offsetLeft-o.width()):0:o[0]?-1*o[0].offsetLeft:0,!0===n.options.centerMode&&(o=n.slideCount<=n.options.slidesToShow||!1===n.options.infinite?n.$slideTrack.children(".slick-slide").eq(i):n.$slideTrack.children(".slick-slide").eq(i+n.options.slidesToShow+1),e=!0===n.options.rtl?o[0]?-1*(n.$slideTrack.width()-o[0].offsetLeft-o.width()):0:o[0]?-1*o[0].offsetLeft:0,e+=(n.$list.width()-o.outerWidth())/2)),e},e.prototype.getOption=e.prototype.slickGetOption=function(i){return this.options[i]},e.prototype.getNavigableIndexes=function(){var i,e=this,t=0,o=0,s=[];for(!1===e.options.infinite?i=e.slideCount:(t=-1*e.options.slidesToScroll,o=-1*e.options.slidesToScroll,i=2*e.slideCount);t<i;)s.push(t),t=o+e.options.slidesToScroll,o+=e.options.slidesToScroll<=e.options.slidesToShow?e.options.slidesToScroll:e.options.slidesToShow;return s},e.prototype.getSlick=function(){return this},e.prototype.getSlideCount=function(){var e,t,o=this;return t=!0===o.options.centerMode?o.slideWidth*Math.floor(o.options.slidesToShow/2):0,!0===o.options.swipeToSlide?(o.$slideTrack.find(".slick-slide").each(function(s,n){if(n.offsetLeft-t+i(n).outerWidth()/2>-1*o.swipeLeft)return e=n,!1}),Math.abs(i(e).attr("data-slick-index")-o.currentSlide)||1):o.options.slidesToScroll},e.prototype.goTo=e.prototype.slickGoTo=function(i,e){this.changeSlide({data:{message:"index",index:parseInt(i)}},e)},e.prototype.init=function(e){var t=this;i(t.$slider).hasClass("slick-initialized")||(i(t.$slider).addClass("slick-initialized"),t.buildRows(),t.buildOut(),t.setProps(),t.startLoad(),t.loadSlider(),t.initializeEvents(),t.updateArrows(),t.updateDots(),t.checkResponsive(!0),t.focusHandler()),e&&t.$slider.trigger("init",[t]),!0===t.options.accessibility&&t.initADA(),t.options.autoplay&&(t.paused=!1,t.autoPlay())},e.prototype.initADA=function(){var e=this,t=Math.ceil(e.slideCount/e.options.slidesToShow),o=e.getNavigableIndexes().filter(function(i){return i>=0&&i<e.slideCount});e.$slides.add(e.$slideTrack.find(".slick-cloned")).attr({"aria-hidden":"true",tabindex:"-1"}).find("a, input, button, select").attr({tabindex:"-1"}),null!==e.$dots&&(e.$slides.not(e.$slideTrack.find(".slick-cloned")).each(function(t){var s=o.indexOf(t);i(this).attr({role:"tabpanel",id:"slick-slide"+e.instanceUid+t,tabindex:-1}),-1!==s&&i(this).attr({"aria-describedby":"slick-slide-control"+e.instanceUid+s})}),e.$dots.attr("role","tablist").find("li").each(function(s){var n=o[s];i(this).attr({role:"presentation"}),i(this).find("button").first().attr({role:"tab",id:"slick-slide-control"+e.instanceUid+s,"aria-controls":"slick-slide"+e.instanceUid+n,"aria-label":s+1+" of "+t,"aria-selected":null,tabindex:"-1"})}).eq(e.currentSlide).find("button").attr({"aria-selected":"true",tabindex:"0"}).end());for(var s=e.currentSlide,n=s+e.options.slidesToShow;s<n;s++)e.$slides.eq(s).attr("tabindex",0);e.activateADA()},e.prototype.initArrowEvents=function(){var i=this;!0===i.options.arrows&&i.slideCount>i.options.slidesToShow&&(i.$prevArrow.off("click.slick").on("click.slick",{message:"previous"},i.changeSlide),i.$nextArrow.off("click.slick").on("click.slick",{message:"next"},i.changeSlide),!0===i.options.accessibility&&(i.$prevArrow.on("keydown.slick",i.keyHandler),i.$nextArrow.on("keydown.slick",i.keyHandler)))},e.prototype.initDotEvents=function(){var e=this;!0===e.options.dots&&(i("li",e.$dots).on("click.slick",{message:"index"},e.changeSlide),!0===e.options.accessibility&&e.$dots.on("keydown.slick",e.keyHandler)),!0===e.options.dots&&!0===e.options.pauseOnDotsHover&&i("li",e.$dots).on("mouseenter.slick",i.proxy(e.interrupt,e,!0)).on("mouseleave.slick",i.proxy(e.interrupt,e,!1))},e.prototype.initSlideEvents=function(){var e=this;e.options.pauseOnHover&&(e.$list.on("mouseenter.slick",i.proxy(e.interrupt,e,!0)),e.$list.on("mouseleave.slick",i.proxy(e.interrupt,e,!1)))},e.prototype.initializeEvents=function(){var e=this;e.initArrowEvents(),e.initDotEvents(),e.initSlideEvents(),e.$list.on("touchstart.slick mousedown.slick",{action:"start"},e.swipeHandler),e.$list.on("touchmove.slick mousemove.slick",{action:"move"},e.swipeHandler),e.$list.on("touchend.slick mouseup.slick",{action:"end"},e.swipeHandler),e.$list.on("touchcancel.slick mouseleave.slick",{action:"end"},e.swipeHandler),e.$list.on("click.slick",e.clickHandler),i(document).on(e.visibilityChange,i.proxy(e.visibility,e)),!0===e.options.accessibility&&e.$list.on("keydown.slick",e.keyHandler),!0===e.options.focusOnSelect&&i(e.$slideTrack).children().on("click.slick",e.selectHandler),i(window).on("orientationchange.slick.slick-"+e.instanceUid,i.proxy(e.orientationChange,e)),i(window).on("resize.slick.slick-"+e.instanceUid,i.proxy(e.resize,e)),i("[draggable!=true]",e.$slideTrack).on("dragstart",e.preventDefault),i(window).on("load.slick.slick-"+e.instanceUid,e.setPosition),i(e.setPosition)},e.prototype.initUI=function(){var i=this;!0===i.options.arrows&&i.slideCount>i.options.slidesToShow&&(i.$prevArrow.show(),i.$nextArrow.show()),!0===i.options.dots&&i.slideCount>i.options.slidesToShow&&i.$dots.show()},e.prototype.keyHandler=function(i){var e=this;i.target.tagName.match("TEXTAREA|INPUT|SELECT")||(37===i.keyCode&&!0===e.options.accessibility?e.changeSlide({data:{message:!0===e.options.rtl?"next":"previous"}}):39===i.keyCode&&!0===e.options.accessibility&&e.changeSlide({data:{message:!0===e.options.rtl?"previous":"next"}}))},e.prototype.lazyLoad=function(){function e(e){i("img[data-lazy]",e).each(function(){var e=i(this),t=i(this).attr("data-lazy"),o=i(this).attr("data-srcset"),s=i(this).attr("data-sizes")||n.$slider.attr("data-sizes"),r=document.createElement("img");r.onload=function(){e.animate({opacity:0},100,function(){o&&(e.attr("srcset",o),s&&e.attr("sizes",s)),e.attr("src",t).animate({opacity:1},200,function(){e.removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading")}),n.$slider.trigger("lazyLoaded",[n,e,t])})},r.onerror=function(){e.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"),n.$slider.trigger("lazyLoadError",[n,e,t])},r.src=t})}var t,o,s,n=this;if(!0===n.options.centerMode?!0===n.options.infinite?s=(o=n.currentSlide+(n.options.slidesToShow/2+1))+n.options.slidesToShow+2:(o=Math.max(0,n.currentSlide-(n.options.slidesToShow/2+1)),s=n.options.slidesToShow/2+1+2+n.currentSlide):(o=n.options.infinite?n.options.slidesToShow+n.currentSlide:n.currentSlide,s=Math.ceil(o+n.options.slidesToShow),!0===n.options.fade&&(o>0&&o--,s<=n.slideCount&&s++)),t=n.$slider.find(".slick-slide").slice(o,s),"anticipated"===n.options.lazyLoad)for(var r=o-1,l=s,d=n.$slider.find(".slick-slide"),a=0;a<n.options.slidesToScroll;a++)r<0&&(r=n.slideCount-1),t=(t=t.add(d.eq(r))).add(d.eq(l)),r--,l++;e(t),n.slideCount<=n.options.slidesToShow?e(n.$slider.find(".slick-slide")):n.currentSlide>=n.slideCount-n.options.slidesToShow?e(n.$slider.find(".slick-cloned").slice(0,n.options.slidesToShow)):0===n.currentSlide&&e(n.$slider.find(".slick-cloned").slice(-1*n.options.slidesToShow))},e.prototype.loadSlider=function(){var i=this;i.setPosition(),i.$slideTrack.css({opacity:1}),i.$slider.removeClass("slick-loading"),i.initUI(),"progressive"===i.options.lazyLoad&&i.progressiveLazyLoad()},e.prototype.next=e.prototype.slickNext=function(){this.changeSlide({data:{message:"next"}})},e.prototype.orientationChange=function(){var i=this;i.checkResponsive(),i.setPosition()},e.prototype.pause=e.prototype.slickPause=function(){var i=this;i.autoPlayClear(),i.paused=!0},e.prototype.play=e.prototype.slickPlay=function(){var i=this;i.autoPlay(),i.options.autoplay=!0,i.paused=!1,i.focussed=!1,i.interrupted=!1},e.prototype.postSlide=function(e){var t=this;t.unslicked||(t.$slider.trigger("afterChange",[t,e]),t.animating=!1,t.slideCount>t.options.slidesToShow&&t.setPosition(),t.swipeLeft=null,t.options.autoplay&&t.autoPlay(),!0===t.options.accessibility&&(t.initADA(),t.options.focusOnChange&&i(t.$slides.get(t.currentSlide)).attr("tabindex",0).focus()))},e.prototype.prev=e.prototype.slickPrev=function(){this.changeSlide({data:{message:"previous"}})},e.prototype.preventDefault=function(i){i.preventDefault()},e.prototype.progressiveLazyLoad=function(e){e=e||1;var t,o,s,n,r,l=this,d=i("img[data-lazy]",l.$slider);d.length?(t=d.first(),o=t.attr("data-lazy"),s=t.attr("data-srcset"),n=t.attr("data-sizes")||l.$slider.attr("data-sizes"),(r=document.createElement("img")).onload=function(){s&&(t.attr("srcset",s),n&&t.attr("sizes",n)),t.attr("src",o).removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading"),!0===l.options.adaptiveHeight&&l.setPosition(),l.$slider.trigger("lazyLoaded",[l,t,o]),l.progressiveLazyLoad()},r.onerror=function(){e<3?setTimeout(function(){l.progressiveLazyLoad(e+1)},500):(t.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"),l.$slider.trigger("lazyLoadError",[l,t,o]),l.progressiveLazyLoad())},r.src=o):l.$slider.trigger("allImagesLoaded",[l])},e.prototype.refresh=function(e){var t,o,s=this;o=s.slideCount-s.options.slidesToShow,!s.options.infinite&&s.currentSlide>o&&(s.currentSlide=o),s.slideCount<=s.options.slidesToShow&&(s.currentSlide=0),t=s.currentSlide,s.destroy(!0),i.extend(s,s.initials,{currentSlide:t}),s.init(),e||s.changeSlide({data:{message:"index",index:t}},!1)},e.prototype.registerBreakpoints=function(){var e,t,o,s=this,n=s.options.responsive||null;if("array"===i.type(n)&&n.length){s.respondTo=s.options.respondTo||"window";for(e in n)if(o=s.breakpoints.length-1,n.hasOwnProperty(e)){for(t=n[e].breakpoint;o>=0;)s.breakpoints[o]&&s.breakpoints[o]===t&&s.breakpoints.splice(o,1),o--;s.breakpoints.push(t),s.breakpointSettings[t]=n[e].settings}s.breakpoints.sort(function(i,e){return s.options.mobileFirst?i-e:e-i})}},e.prototype.reinit=function(){var e=this;e.$slides=e.$slideTrack.children(e.options.slide).addClass("slick-slide"),e.slideCount=e.$slides.length,e.currentSlide>=e.slideCount&&0!==e.currentSlide&&(e.currentSlide=e.currentSlide-e.options.slidesToScroll),e.slideCount<=e.options.slidesToShow&&(e.currentSlide=0),e.registerBreakpoints(),e.setProps(),e.setupInfinite(),e.buildArrows(),e.updateArrows(),e.initArrowEvents(),e.buildDots(),e.updateDots(),e.initDotEvents(),e.cleanUpSlideEvents(),e.initSlideEvents(),e.checkResponsive(!1,!0),!0===e.options.focusOnSelect&&i(e.$slideTrack).children().on("click.slick",e.selectHandler),e.setSlideClasses("number"==typeof e.currentSlide?e.currentSlide:0),e.setPosition(),e.focusHandler(),e.paused=!e.options.autoplay,e.autoPlay(),e.$slider.trigger("reInit",[e])},e.prototype.resize=function(){var e=this;i(window).width()!==e.windowWidth&&(clearTimeout(e.windowDelay),e.windowDelay=window.setTimeout(function(){e.windowWidth=i(window).width(),e.checkResponsive(),e.unslicked||e.setPosition()},50))},e.prototype.removeSlide=e.prototype.slickRemove=function(i,e,t){var o=this;if(i="boolean"==typeof i?!0===(e=i)?0:o.slideCount-1:!0===e?--i:i,o.slideCount<1||i<0||i>o.slideCount-1)return!1;o.unload(),!0===t?o.$slideTrack.children().remove():o.$slideTrack.children(this.options.slide).eq(i).remove(),o.$slides=o.$slideTrack.children(this.options.slide),o.$slideTrack.children(this.options.slide).detach(),o.$slideTrack.append(o.$slides),o.$slidesCache=o.$slides,o.reinit()},e.prototype.setCSS=function(i){var e,t,o=this,s={};!0===o.options.rtl&&(i=-i),e="left"==o.positionProp?Math.ceil(i)+"px":"0px",t="top"==o.positionProp?Math.ceil(i)+"px":"0px",s[o.positionProp]=i,!1===o.transformsEnabled?o.$slideTrack.css(s):(s={},!1===o.cssTransitions?(s[o.animType]="translate("+e+", "+t+")",o.$slideTrack.css(s)):(s[o.animType]="translate3d("+e+", "+t+", 0px)",o.$slideTrack.css(s)))},e.prototype.setDimensions=function(){var i=this;!1===i.options.vertical?!0===i.options.centerMode&&i.$list.css({padding:"0px "+i.options.centerPadding}):(i.$list.height(i.$slides.first().outerHeight(!0)*i.options.slidesToShow),!0===i.options.centerMode&&i.$list.css({padding:i.options.centerPadding+" 0px"})),i.listWidth=i.$list.width(),i.listHeight=i.$list.height(),!1===i.options.vertical&&!1===i.options.variableWidth?(i.slideWidth=Math.ceil(i.listWidth/i.options.slidesToShow),i.$slideTrack.width(Math.ceil(i.slideWidth*i.$slideTrack.children(".slick-slide").length))):!0===i.options.variableWidth?i.$slideTrack.width(5e3*i.slideCount):(i.slideWidth=Math.ceil(i.listWidth),i.$slideTrack.height(Math.ceil(i.$slides.first().outerHeight(!0)*i.$slideTrack.children(".slick-slide").length)));var e=i.$slides.first().outerWidth(!0)-i.$slides.first().width();!1===i.options.variableWidth&&i.$slideTrack.children(".slick-slide").width(i.slideWidth-e)},e.prototype.setFade=function(){var e,t=this;t.$slides.each(function(o,s){e=t.slideWidth*o*-1,!0===t.options.rtl?i(s).css({position:"relative",right:e,top:0,zIndex:t.options.zIndex-2,opacity:0}):i(s).css({position:"relative",left:e,top:0,zIndex:t.options.zIndex-2,opacity:0})}),t.$slides.eq(t.currentSlide).css({zIndex:t.options.zIndex-1,opacity:1})},e.prototype.setHeight=function(){var i=this;if(1===i.options.slidesToShow&&!0===i.options.adaptiveHeight&&!1===i.options.vertical){var e=i.$slides.eq(i.currentSlide).outerHeight(!0);i.$list.css("height",e)}},e.prototype.setOption=e.prototype.slickSetOption=function(){var e,t,o,s,n,r=this,l=!1;if("object"===i.type(arguments[0])?(o=arguments[0],l=arguments[1],n="multiple"):"string"===i.type(arguments[0])&&(o=arguments[0],s=arguments[1],l=arguments[2],"responsive"===arguments[0]&&"array"===i.type(arguments[1])?n="responsive":void 0!==arguments[1]&&(n="single")),"single"===n)r.options[o]=s;else if("multiple"===n)i.each(o,function(i,e){r.options[i]=e});else if("responsive"===n)for(t in s)if("array"!==i.type(r.options.responsive))r.options.responsive=[s[t]];else{for(e=r.options.responsive.length-1;e>=0;)r.options.responsive[e].breakpoint===s[t].breakpoint&&r.options.responsive.splice(e,1),e--;r.options.responsive.push(s[t])}l&&(r.unload(),r.reinit())},e.prototype.setPosition=function(){var i=this;i.setDimensions(),i.setHeight(),!1===i.options.fade?i.setCSS(i.getLeft(i.currentSlide)):i.setFade(),i.$slider.trigger("setPosition",[i])},e.prototype.setProps=function(){var i=this,e=document.body.style;i.positionProp=!0===i.options.vertical?"top":"left","top"===i.positionProp?i.$slider.addClass("slick-vertical"):i.$slider.removeClass("slick-vertical"),void 0===e.WebkitTransition&&void 0===e.MozTransition&&void 0===e.msTransition||!0===i.options.useCSS&&(i.cssTransitions=!0),i.options.fade&&("number"==typeof i.options.zIndex?i.options.zIndex<3&&(i.options.zIndex=3):i.options.zIndex=i.defaults.zIndex),void 0!==e.OTransform&&(i.animType="OTransform",i.transformType="-o-transform",i.transitionType="OTransition",void 0===e.perspectiveProperty&&void 0===e.webkitPerspective&&(i.animType=!1)),void 0!==e.MozTransform&&(i.animType="MozTransform",i.transformType="-moz-transform",i.transitionType="MozTransition",void 0===e.perspectiveProperty&&void 0===e.MozPerspective&&(i.animType=!1)),void 0!==e.webkitTransform&&(i.animType="webkitTransform",i.transformType="-webkit-transform",i.transitionType="webkitTransition",void 0===e.perspectiveProperty&&void 0===e.webkitPerspective&&(i.animType=!1)),void 0!==e.msTransform&&(i.animType="msTransform",i.transformType="-ms-transform",i.transitionType="msTransition",void 0===e.msTransform&&(i.animType=!1)),void 0!==e.transform&&!1!==i.animType&&(i.animType="transform",i.transformType="transform",i.transitionType="transition"),i.transformsEnabled=i.options.useTransform&&null!==i.animType&&!1!==i.animType},e.prototype.setSlideClasses=function(i){var e,t,o,s,n=this;if(t=n.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden","true"),n.$slides.eq(i).addClass("slick-current"),!0===n.options.centerMode){var r=n.options.slidesToShow%2==0?1:0;e=Math.floor(n.options.slidesToShow/2),!0===n.options.infinite&&(i>=e&&i<=n.slideCount-1-e?n.$slides.slice(i-e+r,i+e+1).addClass("slick-active").attr("aria-hidden","false"):(o=n.options.slidesToShow+i,t.slice(o-e+1+r,o+e+2).addClass("slick-active").attr("aria-hidden","false")),0===i?t.eq(t.length-1-n.options.slidesToShow).addClass("slick-center"):i===n.slideCount-1&&t.eq(n.options.slidesToShow).addClass("slick-center")),n.$slides.eq(i).addClass("slick-center")}else i>=0&&i<=n.slideCount-n.options.slidesToShow?n.$slides.slice(i,i+n.options.slidesToShow).addClass("slick-active").attr("aria-hidden","false"):t.length<=n.options.slidesToShow?t.addClass("slick-active").attr("aria-hidden","false"):(s=n.slideCount%n.options.slidesToShow,o=!0===n.options.infinite?n.options.slidesToShow+i:i,n.options.slidesToShow==n.options.slidesToScroll&&n.slideCount-i<n.options.slidesToShow?t.slice(o-(n.options.slidesToShow-s),o+s).addClass("slick-active").attr("aria-hidden","false"):t.slice(o,o+n.options.slidesToShow).addClass("slick-active").attr("aria-hidden","false"));"ondemand"!==n.options.lazyLoad&&"anticipated"!==n.options.lazyLoad||n.lazyLoad()},e.prototype.setupInfinite=function(){var e,t,o,s=this;if(!0===s.options.fade&&(s.options.centerMode=!1),!0===s.options.infinite&&!1===s.options.fade&&(t=null,s.slideCount>s.options.slidesToShow)){for(o=!0===s.options.centerMode?s.options.slidesToShow+1:s.options.slidesToShow,e=s.slideCount;e>s.slideCount-o;e-=1)t=e-1,i(s.$slides[t]).clone(!0).attr("id","").attr("data-slick-index",t-s.slideCount).prependTo(s.$slideTrack).addClass("slick-cloned");for(e=0;e<o+s.slideCount;e+=1)t=e,i(s.$slides[t]).clone(!0).attr("id","").attr("data-slick-index",t+s.slideCount).appendTo(s.$slideTrack).addClass("slick-cloned");s.$slideTrack.find(".slick-cloned").find("[id]").each(function(){i(this).attr("id","")})}},e.prototype.interrupt=function(i){var e=this;i||e.autoPlay(),e.interrupted=i},e.prototype.selectHandler=function(e){var t=this,o=i(e.target).is(".slick-slide")?i(e.target):i(e.target).parents(".slick-slide"),s=parseInt(o.attr("data-slick-index"));s||(s=0),t.slideCount<=t.options.slidesToShow?t.slideHandler(s,!1,!0):t.slideHandler(s)},e.prototype.slideHandler=function(i,e,t){var o,s,n,r,l,d=null,a=this;if(e=e||!1,!(!0===a.animating&&!0===a.options.waitForAnimate||!0===a.options.fade&&a.currentSlide===i))if(!1===e&&a.asNavFor(i),o=i,d=a.getLeft(o),r=a.getLeft(a.currentSlide),a.currentLeft=null===a.swipeLeft?r:a.swipeLeft,!1===a.options.infinite&&!1===a.options.centerMode&&(i<0||i>a.getDotCount()*a.options.slidesToScroll))!1===a.options.fade&&(o=a.currentSlide,!0!==t?a.animateSlide(r,function(){a.postSlide(o)}):a.postSlide(o));else if(!1===a.options.infinite&&!0===a.options.centerMode&&(i<0||i>a.slideCount-a.options.slidesToScroll))!1===a.options.fade&&(o=a.currentSlide,!0!==t?a.animateSlide(r,function(){a.postSlide(o)}):a.postSlide(o));else{if(a.options.autoplay&&clearInterval(a.autoPlayTimer),s=o<0?a.slideCount%a.options.slidesToScroll!=0?a.slideCount-a.slideCount%a.options.slidesToScroll:a.slideCount+o:o>=a.slideCount?a.slideCount%a.options.slidesToScroll!=0?0:o-a.slideCount:o,a.animating=!0,a.$slider.trigger("beforeChange",[a,a.currentSlide,s]),n=a.currentSlide,a.currentSlide=s,a.setSlideClasses(a.currentSlide),a.options.asNavFor&&(l=(l=a.getNavTarget()).slick("getSlick")).slideCount<=l.options.slidesToShow&&l.setSlideClasses(a.currentSlide),a.updateDots(),a.updateArrows(),!0===a.options.fade)return!0!==t?(a.fadeSlideOut(n),a.fadeSlide(s,function(){a.postSlide(s)})):a.postSlide(s),void a.animateHeight();!0!==t?a.animateSlide(d,function(){a.postSlide(s)}):a.postSlide(s)}},e.prototype.startLoad=function(){var i=this;!0===i.options.arrows&&i.slideCount>i.options.slidesToShow&&(i.$prevArrow.hide(),i.$nextArrow.hide()),!0===i.options.dots&&i.slideCount>i.options.slidesToShow&&i.$dots.hide(),i.$slider.addClass("slick-loading")},e.prototype.swipeDirection=function(){var i,e,t,o,s=this;return i=s.touchObject.startX-s.touchObject.curX,e=s.touchObject.startY-s.touchObject.curY,t=Math.atan2(e,i),(o=Math.round(180*t/Math.PI))<0&&(o=360-Math.abs(o)),o<=45&&o>=0?!1===s.options.rtl?"left":"right":o<=360&&o>=315?!1===s.options.rtl?"left":"right":o>=135&&o<=225?!1===s.options.rtl?"right":"left":!0===s.options.verticalSwiping?o>=35&&o<=135?"down":"up":"vertical"},e.prototype.swipeEnd=function(i){var e,t,o=this;if(o.dragging=!1,o.swiping=!1,o.scrolling)return o.scrolling=!1,!1;if(o.interrupted=!1,o.shouldClick=!(o.touchObject.swipeLength>10),void 0===o.touchObject.curX)return!1;if(!0===o.touchObject.edgeHit&&o.$slider.trigger("edge",[o,o.swipeDirection()]),o.touchObject.swipeLength>=o.touchObject.minSwipe){switch(t=o.swipeDirection()){case"left":case"down":e=o.options.swipeToSlide?o.checkNavigable(o.currentSlide+o.getSlideCount()):o.currentSlide+o.getSlideCount(),o.currentDirection=0;break;case"right":case"up":e=o.options.swipeToSlide?o.checkNavigable(o.currentSlide-o.getSlideCount()):o.currentSlide-o.getSlideCount(),o.currentDirection=1}"vertical"!=t&&(o.slideHandler(e),o.touchObject={},o.$slider.trigger("swipe",[o,t]))}else o.touchObject.startX!==o.touchObject.curX&&(o.slideHandler(o.currentSlide),o.touchObject={})},e.prototype.swipeHandler=function(i){var e=this;if(!(!1===e.options.swipe||"ontouchend"in document&&!1===e.options.swipe||!1===e.options.draggable&&-1!==i.type.indexOf("mouse")))switch(e.touchObject.fingerCount=i.originalEvent&&void 0!==i.originalEvent.touches?i.originalEvent.touches.length:1,e.touchObject.minSwipe=e.listWidth/e.options.touchThreshold,!0===e.options.verticalSwiping&&(e.touchObject.minSwipe=e.listHeight/e.options.touchThreshold),i.data.action){case"start":e.swipeStart(i);break;case"move":e.swipeMove(i);break;case"end":e.swipeEnd(i)}},e.prototype.swipeMove=function(i){var e,t,o,s,n,r,l=this;return n=void 0!==i.originalEvent?i.originalEvent.touches:null,!(!l.dragging||l.scrolling||n&&1!==n.length)&&(e=l.getLeft(l.currentSlide),l.touchObject.curX=void 0!==n?n[0].pageX:i.clientX,l.touchObject.curY=void 0!==n?n[0].pageY:i.clientY,l.touchObject.swipeLength=Math.round(Math.sqrt(Math.pow(l.touchObject.curX-l.touchObject.startX,2))),r=Math.round(Math.sqrt(Math.pow(l.touchObject.curY-l.touchObject.startY,2))),!l.options.verticalSwiping&&!l.swiping&&r>4?(l.scrolling=!0,!1):(!0===l.options.verticalSwiping&&(l.touchObject.swipeLength=r),t=l.swipeDirection(),void 0!==i.originalEvent&&l.touchObject.swipeLength>4&&(l.swiping=!0,i.preventDefault()),s=(!1===l.options.rtl?1:-1)*(l.touchObject.curX>l.touchObject.startX?1:-1),!0===l.options.verticalSwiping&&(s=l.touchObject.curY>l.touchObject.startY?1:-1),o=l.touchObject.swipeLength,l.touchObject.edgeHit=!1,!1===l.options.infinite&&(0===l.currentSlide&&"right"===t||l.currentSlide>=l.getDotCount()&&"left"===t)&&(o=l.touchObject.swipeLength*l.options.edgeFriction,l.touchObject.edgeHit=!0),!1===l.options.vertical?l.swipeLeft=e+o*s:l.swipeLeft=e+o*(l.$list.height()/l.listWidth)*s,!0===l.options.verticalSwiping&&(l.swipeLeft=e+o*s),!0!==l.options.fade&&!1!==l.options.touchMove&&(!0===l.animating?(l.swipeLeft=null,!1):void l.setCSS(l.swipeLeft))))},e.prototype.swipeStart=function(i){var e,t=this;if(t.interrupted=!0,1!==t.touchObject.fingerCount||t.slideCount<=t.options.slidesToShow)return t.touchObject={},!1;void 0!==i.originalEvent&&void 0!==i.originalEvent.touches&&(e=i.originalEvent.touches[0]),t.touchObject.startX=t.touchObject.curX=void 0!==e?e.pageX:i.clientX,t.touchObject.startY=t.touchObject.curY=void 0!==e?e.pageY:i.clientY,t.dragging=!0},e.prototype.unfilterSlides=e.prototype.slickUnfilter=function(){var i=this;null!==i.$slidesCache&&(i.unload(),i.$slideTrack.children(this.options.slide).detach(),i.$slidesCache.appendTo(i.$slideTrack),i.reinit())},e.prototype.unload=function(){var e=this;i(".slick-cloned",e.$slider).remove(),e.$dots&&e.$dots.remove(),e.$prevArrow&&e.htmlExpr.test(e.options.prevArrow)&&e.$prevArrow.remove(),e.$nextArrow&&e.htmlExpr.test(e.options.nextArrow)&&e.$nextArrow.remove(),e.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden","true").css("width","")},e.prototype.unslick=function(i){var e=this;e.$slider.trigger("unslick",[e,i]),e.destroy()},e.prototype.updateArrows=function(){var i=this;Math.floor(i.options.slidesToShow/2),!0===i.options.arrows&&i.slideCount>i.options.slidesToShow&&!i.options.infinite&&(i.$prevArrow.removeClass("slick-disabled").attr("aria-disabled","false"),i.$nextArrow.removeClass("slick-disabled").attr("aria-disabled","false"),0===i.currentSlide?(i.$prevArrow.addClass("slick-disabled").attr("aria-disabled","true"),i.$nextArrow.removeClass("slick-disabled").attr("aria-disabled","false")):i.currentSlide>=i.slideCount-i.options.slidesToShow&&!1===i.options.centerMode?(i.$nextArrow.addClass("slick-disabled").attr("aria-disabled","true"),i.$prevArrow.removeClass("slick-disabled").attr("aria-disabled","false")):i.currentSlide>=i.slideCount-1&&!0===i.options.centerMode&&(i.$nextArrow.addClass("slick-disabled").attr("aria-disabled","true"),i.$prevArrow.removeClass("slick-disabled").attr("aria-disabled","false")))},e.prototype.updateDots=function(){var i=this;null!==i.$dots&&(i.$dots.find("li").removeClass("slick-active").end(),i.$dots.find("li").eq(Math.floor(i.currentSlide/i.options.slidesToScroll)).addClass("slick-active"))},e.prototype.visibility=function(){var i=this;i.options.autoplay&&(document[i.hidden]?i.interrupted=!0:i.interrupted=!1)},i.fn.slick=function(){var i,t,o=this,s=arguments[0],n=Array.prototype.slice.call(arguments,1),r=o.length;for(i=0;i<r;i++)if("object"==typeof s||void 0===s?o[i].slick=new e(o[i],s):t=o[i].slick[s].apply(o[i].slick,n),void 0!==t)return t;return o}});



/*Toast*/
!function(t){var n=null;t.extend({toast:function(a,o){switch((o=o||{}).width=o.width||0,o.duration=o.duration||2e3,o.type=o.type||"",o.align=o.align||"bottom",o.hasOwnProperty("singleton")||(o.singleton=!0),n||(n=t("<ul></ul>").addClass("toast").appendTo(document.body).hide()),o.align){case"top":n.css({top:"0",bottom:"",margin:"40px 0 0 0"});break;case"bottom":n.css({top:"",bottom:"0",margin:"0 0 40px 0"});break;case"top-right":n.css({top:"0",right:"0",margin:"0"})}o.singleton&&n.html("");var e="<span>"+a+"</span>",i=t("<li></li>").hide();o.width>0&&(e="<span style='width: "+o.width+"px'>"+a+"</span>"),"top"==o.align?i.html(e).prependTo(n):i.html(e).appendTo(n),""!==o.type&&i.addClass(o.type);var s=null;s=setTimeout(function(){clearTimeout(s),i.animate({height:0,opacity:0},"fast",function(){i.remove(),n.children().length||n.hide()})},o.duration),n.show(),i.fadeIn("normal")}})}(jQuery);