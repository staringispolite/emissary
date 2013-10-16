Gleebox.require('module', function(M) {
  var module = M.extend({
    template:'<div $clearfix>',
    onRender: function(n) {
    }
  });
  Gleebox.addModule('form/formControl', module);
});


