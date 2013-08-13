<%inherit file="base.mako" />
<script>
var emailFieldTracked = false;
$(function() {
    E.Track.event('beta', 'betaPageView');    
    $('#emailField').keypress(function() {
        if (!emailFieldTracked) {
            E.Track.event('beta', 'betaEmailEntered');    
            emailFieldTracked = true;
        }
    });
    $('#submit').click() {
        $.post('/account/create', {email: $('#emailField').value()}, function(response) {
            console.log(response);
            if (response.response) {
                console.log('yay');
            }


        });
    });
});
</script>
<div id="hero">
    <div class="wrapper">
        <h1>Emissary Medical Travel</h1>
    <div id="signup"
        <p>
        There's a lot of misinformation out there. We can help. We're building a highly-vetted community that only the world's best medical facilities qualify for. We help you every step of the way, from intensive research, to travel booking, and on-the-ground assistance.
        </p>
        <p>
        The result is better care, better price, better experience.
        </p>
        <p><i>Currently in private beta. Sign up for updates:</i></p>
        <div class="input-group">
            <input id="emailField" type="text" placeholder="Email Address" class="form-control">
                <span class="input-group-btn">
                <button class="btn btn-success" id="submit" type="button">Go!</button>
            </span>
        </div>
    <div id="share">
    <p>
    Thank you for your interest. We will send you updates regarding our progress to the e-mail address you provided.
    </p>
    <p>
    Follow us.
    </div>
    </div>
    </div>
</div>
<%doc>
<div id="subcontent" style="width:960px;" class="row">

<div class="submodule">
<div class="thumbnail">
<img src="http://i.imgur.com/gZCD4CF.png" alt="">
<div class="caption">
<h3>Blog</h3>
<p>...</p>
</div>
</div>
</div>

<div class="submodule">
<div class="thumbnail">
<img src="http://i.imgur.com/p24FKxV.jpg" alt="">
<div class="caption">
<h3>Blog</h3>
<p>...</p>
</div>
</div>
</div>
<div class="submodule">
<div class="thumbnail">
<img src="http://i.imgur.com/64Lzsbf.jpg" alt="">
<div class="caption">
<h3>Blog</h3>
<p>...</p>
</div>
</div>
</div>
</div>
</%doc>
