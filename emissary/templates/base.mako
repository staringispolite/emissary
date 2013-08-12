<%! from pyramid import url %>
<!DOCTYPE html>
<html>
<head>
<title>Emissary Medical Travel</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<script src="/static/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/base.css" />
</head>
<body>
    <div class="navbar navbar-fixed-top">
        <div class="pull-right container">
        <ul class="navbar-nav nav">
            <li><a href="${request.route_url('home')}">About</a></li>
            <li><a href="http://www.emissarymed.com/blog">Blog</a></li>
        </ul>
    </div>
    </div>
${next.body()}
<div id="#footer">
</div>
</body>
<script type="text/javascript">
var clicky_site_ids = clicky_site_ids || [];
clicky_site_ids.push(100642908);
(function() {
      var s = document.createElement('script');
        s.type = 'text/javascript';
          s.async = true;
            s.src = '//static.getclicky.com/js';
              ( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
})();
</script>
<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100642908ns.gif" /></p></noscript>
<script type="text/javascript">
var GoSquared = {};
GoSquared.acct = "GSN-037009-O";
(function(w){
function gs(){
w._gstc_lt = +new Date;
var d = document, g = d.createElement("script");
g.type = "text/javascript";
g.src = "//d1l6p2sc9645hc.cloudfront.net/tracker.js";
var s = d.getElementsByTagName("script")[0];
s.parentNode.insertBefore(g, s);
}
w.addEventListener ?
w.addEventListener("load", gs, false) :
w.attachEvent("onload", gs);
})(window);
</script>
    
</html>
