var E = E || {};

E.Track = {
    event: function (category, action, label, value) {
               ga('send', 'event', category, action, label, value);
           }
};
