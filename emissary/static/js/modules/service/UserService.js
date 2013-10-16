Gleebox.require("service/Service", function(S) {
    var UserService = S.extend({
        currentUser: {},
        setUser: function(data) {
            this.currentUser = data;
            this.fire('user_changed', data);
        },
        logout: function() {
            Gleebox.setCookie('token', '');
            this.setUser({});;
        },
        favs: [],
        getFavs: function() {
        }
    });
    Gleebox.addModule('service/UserService', UserService);
});
