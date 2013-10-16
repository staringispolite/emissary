Gleebox.require('form/formControl', function(M) {
  var module = M.extend({
    template:'<input type="%type%" class="form-control"/>',
    onRender: function(n) {
    }
  });
  Gleebox.addModule('form/formControl/textInput', module);
});

