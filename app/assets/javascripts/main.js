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
});

$(document).on('ajax:success', function(){
	if($('form[data-validate]').length){
		$('form[data-validate]').enableClientSideValidations();
	}
});

$(document).on('ajax:success', 'form.ajax_form', function() {
    showNotification('Saved successfully!', 'success');
});

// $(document).on('ajax:error', 'form.ajax_form', function() {  
//     alert('Ouch!');
// });

var showNotification = function(text, style)
{
	$('#notification-bar')
	.attr('class', 'notify')
	.html(text)
	.slideDown(1000)
	.delay(2000)
	.fadeOut(1500);
}