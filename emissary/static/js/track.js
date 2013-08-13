var E = E || {};

E.Track = {
    event: function(category, action, label, value) {
               ga('send', 'event', category, action, label, value);
		console.log('Event', category, action, label, value);
           },
    vPageView: function(page) {
	console.log('Pageview', page);
	ga('send', 'pageview', page, page);
	
    	}
};
