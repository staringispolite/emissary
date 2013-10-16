Gleebox.require('module', function(M) {
  var module = M.extend({
    requires:['form/formControl/textInput'],
    template:'<div $clearfix$>',
    onRender: function(n) {
      Gleebox.require('form/formControl/textInput', function(Input) {
        var login = new Input();
        n.append(login.node());
        var password = new Input();
        n.append(password.node());
      });

    }
  });
  Gleebox.addModule('login', module);
});

