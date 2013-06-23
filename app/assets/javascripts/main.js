JOLLY = {}
JOLLY.venues = {}

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

// $(document).on('ajax:success', 'form.ajax_form', function() {
// 	//processPendingNotifications();
// });

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


var googleSigninCallback = function(authResult) {
	if (authResult['access_token']) {
    // Successfully authorized
    // Hide the sign-in button now that the user is authorized, for example:
    document.getElementById('signinButton').setAttribute('style', 'display: none');
} else if (authResult['error']) {
    // There was an error.
    // Possible error codes:
    //   "access_denied" - User denied access to your app
    //   "immediate_failed" - Could not automatically log in the user
    // console.log('There was an error: ' + authResult['error']);
}
}
