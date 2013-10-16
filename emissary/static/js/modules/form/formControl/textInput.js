Gleebox.require('module', function(M) {
  var module = M.extend({
    template:'<input type="text" class="form-control">',
    onRender: function(n) {
    }
  });
  Gleebox.addModule('form/formControl/textInput', module);
});

