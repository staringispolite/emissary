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
    $('#submit').click(function(){
        if ($('#emailField').val().length > 9) {
        E.Api.call('account/create', {email: $('#emailField').val()}, function(response) {
            if (response.response) {
                $('#signup').fadeOut(function() {
                    $('#share').fadeIn();
                });
            }
        });
        } else {
            console.log('fail');
        }
    });
});
</script>
<div id="hero">
    <div class="wrapper">
        <h1>Emissary Medical Travel</h1>
        <p>
        There's a lot of misinformation out there. We can help. We're building a highly-vetted community that only the world's best medical facilities qualify for. We help you every step of the way, from intensive research, to travel booking, and on-the-ground assistance.
        </p>
        <p>
        The result is better care, better price, better experience.
        </p>
    <div id="signup">
        <p><i>Currently in private beta. Sign up for updates:</i></p>
        <div class="input-group">
            <input id="emailField" type="text" placeholder="Email Address" class="form-control">
                <span class="input-group-btn">
                <button class="btn btn-success" id="submit" type="button">Go!</button>
            </span>
        </div>
    </div>
    <div id="share">
    <p>
    Thank you for your interest. We will send you updates regarding our progress to the e-mail address you provided.
    </p>
    </div>
    <p>
    Find us on:
    <a href="https://www.facebook.com/EmissaryMed"><img class="social-button" src="static/img/facebookbutton.png"/></a>
    <a href="https://twitter.com/EmissaryMed"><img class="social-button" src="static/img/twitterbutton.png"/></a>
    </p>
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
