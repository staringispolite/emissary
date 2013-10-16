Gleebox.require("service/UserService", function(US) {
    Gleebox.userService = new US();
    if (!Object.size(Gleebox.userService.currentUser)) {
        //check cookie
      /*
        var token = Gleebox.getCookie('token');
        if (token) {
            Gleebox.api('account.get', {token: token}, function(data) {
                Gleebox.userService.setUser(data.response.user);
            });
        }
        */
    }
    Gleebox.eventCenter.fire('userservice_init');
});
