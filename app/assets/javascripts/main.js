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
    showMessage('Saved successfully!', 'success')
});

// $(document).on('ajax:error', 'form.ajax_form', function() {  
//     alert('Ouch!');
// });

var showMessage = function(text, style)
{
    style = style || 'notice';           //<== default style if it's not set

    //create message and show it
    $('<div>')
    .attr('class', style)
    .html(text)
    .fadeIn('fast')
	.insertBefore($('#user_message'))  		//<== wherever you want it to show
	.animate({opacity: 1.0}, 2500)    		//<== wait 2.5 sec before fading out
	.fadeOut('slow', function()
	{
		$(this).remove();
	});
};

