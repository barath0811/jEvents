JOLLY = {}
JOLLY.venues = {}

!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

$(document).ready(function(){
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

$(document).on('ajax:success', function(){
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
