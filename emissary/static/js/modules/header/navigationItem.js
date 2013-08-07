Gleebox.require('module', function(M) {
    var module = M.extend({
        template: '<li $$>' +
            '<img src="%imageSrc%" />' +
            '</li>',
        imageSrc: ''
    });
    Gleebox.addModule('header/navigationItem', module);
});
