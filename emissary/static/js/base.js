//provides base functionality for all pages
//
window.console = window.console || {};
var E = E || {};

$(function() {
    E.Track.event('beta', 'betaPageView');    
    $('#emailField').keypress(function() {
        if (!emailFieldTracked) {
            E.Track.event('beta', 'betaEmailEntered');    
            emailFieldTracked = true;
        }
    });
    var emailFieldTracked = false;
    $('#submit').click(function(){
        if ($('#emailField').val().length > 9) {
            $('#submit').attr('disabled', 'disabled');
            E.Api.call('account/create_beta', {email: $('#emailField').val()}, function(response) {
                $('#submit').removeAttr('disabled');
                if (response.response) {
                    $('#signup').fadeOut(function() {
                        $('#share').fadeIn();
                    });
                }
            });
        } else {
        }
    });
});
