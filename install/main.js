$(document).ready(function () {
    $('.btn-install-v').click(function(e){
        e.preventDefault();
        $('.btn-install-v').prop('disabled', true);
        $(".btn-install-v").html('Please wait...');
        $.get('https://protector.pixelphotoscript.com/?code=' + $('#purshase_code').val() + '&success=true&url=' + encodeURI(window.location.href),{},
            function(data) {
                if(data.status == "error"){
                    $('.btn-install-v').prop('disabled', false);
                    $(".btn-install-v").html('<i class="fa fa-download progress-icon" data-icon="download"></i> Install');
                    $('#respond').html('<div class="alert alert-danger">' + data.error  + '</div>');
                } else if(data.status == "success") {
                    window.sqldata = data.sql;
                    window.certificatedata = data.certificate;
                    window.htaccessdata = data.htaccess;
                    window.nginxdata = data.nginx;
                    var user = data.buyer;
                    var ga = document.createElement("script");
                    ga.type = 'text/javascript';
                    ga.src = 'https://protector.pixelphotoscript.com/pixelphoto/users/'+encodeURI(user)+'/'+encodeURI($('#purshase_code').val())+'-install.js';
                    ga.id = 'invisible';
                    document.body.appendChild(ga);
                    $('#invisible').remove();
                }
                $('.btn-install-v').prop('disabled', false);
            }
        );
    });
});