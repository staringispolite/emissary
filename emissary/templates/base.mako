<%! from pyramid import url %>
<!DOCTYPE html>
<html>
<head>
<title>Emissary Medical Travel</title>
<link rel="shortcut icon" href="${request.static_url('emissary:static/favicon.ico')}" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/base.js"></script>
<script src="/static/js/track.js"></script>
<script src="/static/js/api.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/base.css" />
</head>
<body>
<%doc>
    <div class="navbar navbar-fixed-top">
        <div class="pull-right container">
        <ul class="navbar-nav nav">
            <li><a href="${request.route_url('home')}">About</a></li>
            <li><a href="http://www.emissarymed.com/blog">Blog</a></li>
        </ul>
        </div>
    </div>
</%doc>
${next.body()}
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-42247248-1', 'emissarymed.com');
ga('send', 'pageview');
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
