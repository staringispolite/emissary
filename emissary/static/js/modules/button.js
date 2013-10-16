Gleebox.require('module', function(M) {
  var module = M.extend({
    template:'<button class="btn btn-primary" type="button">%titleStr%</button>',
    onRender: function(n) {
    }
  });
  Gleebox.addModule('button', module);
});


