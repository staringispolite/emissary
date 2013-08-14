var E = E || {};

E.Api = {
    call: function(path, data, callback) {
        $.post(path, data, function(response) {
            if (response.error) {
                var error_message = $('<div></div>');
                error_message.addClass('js-error');
                error_message.html(response.error);
                $('body').append(error_message);
                error_message.fadeIn(function() {
                    setTimeout(function() {
                        error_message.fadeOut(function() {
                            error_message.remove();
                        });
                    }, 2500);
                });
            }
            callback(response);
        });
    }
};

