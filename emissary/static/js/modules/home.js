Gleebox.require('module', function(M) {
    var module = M.extend({
        requires: ['login'],
        template: '<div $clearfix$>asdfasdfasdf</div>',
        onRender: function(n) {
          Gleebox.require('login', function(Login) {
            var login = Login();
            n.append(login.node());
          });
        }
    });
    Gleebox.addModule('home', module);
});


