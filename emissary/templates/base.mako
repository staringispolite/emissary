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
            <li><a href="/blog">Blog</a></li>
        </ul>
    </div>
    </div>
${next.body()}
</body>
<div id="#footer">
    
</div>
</html>
