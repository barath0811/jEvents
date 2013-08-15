window.fbAsyncInit = function() {
	FB.init({
		appId: '498115793608570',
		channelUrl : '//www.jollyeventz.com/channel.html',
		status: true, 
		cookie: true,
		xfbml: true
	});
};

$(document).ready(function(){

	(function() {
		var gp = document.createElement('script'); gp.async = true;
		gp.src = 'https://apis.google.com/js/plusone.js';
		var pgp = document.getElementsByTagName('script')[0];
		pgp.parentNode.insertBefore(gp, pgp);

		var tw=document.createElement('script'); tw.async=true;
		tw.src="//platform.twitter.com/widgets.js";
		var ptw=document.getElementsByTagName('script')[0];
		ptw.parentNode.insertBefore(tw, ptw);

		var fb = document.createElement('script'); fb.async = true;
		fb.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
		document.getElementById('fb-root').appendChild(fb);
	})();

	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-42604460-1', 'jollyeventz.com');
	ga('send', 'pageview');

	$('.selectpicker').selectpicker({
		style: 'btn-inverse btn-large'
	});

	$('.bxslider').bxSlider({
		auto: true,
		minSlides: 1,
		maxSlides: 3,
		slideWidth: 350,
		slideMargin: 10,
		captions: true
	});

	$('.nav li').on('click', function(){
		$('.nav li').removeClass('active');
		$(this).addClass('active');
	});

	$('.best_in_place').best_in_place();

	var msg = $('#notification-bar .flash');
	if(!!msg)
		showNotification(msg.text());
});

$(document).ajaxSuccess(function(){
	if($('form[data-validate]').length){
		$('form[data-validate]').enableClientSideValidations();
	}
});

$(document).ajaxComplete(function(event, request){
	//type = request.getResponseHeader("X-Message-Type");
	showNotification(request.getResponseHeader("X-Message"));
});

var showNotification = function(text)
{
	if(!text)
		return;
	
	$('#notification-bar')
	.attr('class', 'notify')
	.html(text)
	.slideDown(1000)
	.delay(2000)
	.fadeOut(1500);
}
