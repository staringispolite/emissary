<!DOCTYPE html>
<html>
<head>
<title>Emissary Medical Travel</title>
<link rel="shortcut icon" href="${request.static_url('emissary:static/favicon.ico')}" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    var Gleebox;
</script>
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<script src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/class.js"></script>
<script type="text/javascript" src="/static/js/EventDispatcher.js"></script>
<script type="text/javascript" src="/static/js/Gleebox.js"></script>
<script type="text/javascript" src="/static/js/modules/service/init.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/base.css" />
</head>
<body style="height:100%">
  <div style="height:100%" id="content"></div>

  <script>
    $(function() {
    Gleebox.require('home', function(Home) {
        var home = new Home();
        console.log(home.node());
        $('#content').append(home.node());
      });
    });
  </script>
</body>

</html>
