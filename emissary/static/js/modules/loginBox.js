Gleebox.require('module', function(M) {
  var module = M.extend({
    requires:['form/formControl/textInput', 'button'],
    template:'<div $clearfix$><div $title$>Emissary</div><form $clearfix$></form></div>',
    onRender: function(n) {
      var this2 = this;
      Gleebox.require('form/formControl/textInput', function(Input) {
        var login = new Input();
        this2.addChild('login', login);
        login.type = 'text';
        var loginNode = login.node();
        loginNode.attr('placeholder', 'email');
        n.find('form').append(login.node());
        var password = new Input();
        password.type = 'password';
        this2.addChild('password', password);
        login.type = 'text';
        n.find('form').append(password.node().attr('placeholder', 'password'));
      });
      Gleebox.require('button', function(Button) {
        var loginButton = new Button();
        loginButton.titleStr = 'Login';
        var loginNode = loginButton.node();
        loginNode.click(function() {
          Gleebox.api('account.login', {email:this2.children['login'].node().val(), password:this2.children['password'].node().val()}, function(response) {
            Gleebox.eventCenter.barrier('userservice_init', function callback() {
              Gleebox.userService.setUser(response);
            });
          });
        });
        n.find('form').append(loginNode);
      });

    }
  });
  Gleebox.addModule('loginBox', module);
});

