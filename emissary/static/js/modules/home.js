Gleebox.require('module', function(M) {
    var module = M.extend({
        requires: ['loginBox'],
        template: '<div $clearfix$></div>',
        onRender: function(n) {
          Gleebox.require('loginBox', function(LoginBox) {
            var test = new LoginBox();
            n.append(test.node());
            Gleebox.eventCenter.barrier('userservice_init', function callback() {
              Gleebox.userService.bind('user_changed', function(user) {
                if (user) {
                  
                });
              });
            });


          });
        }
    });
    Gleebox.addModule('home', module);
});


