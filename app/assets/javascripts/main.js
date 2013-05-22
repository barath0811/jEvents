$(window).load(function () {
    $('.flexslider').flexslider({
        animation: 'slide'
    });
});

$(document).ready(function(){
	$('.selectpicker').selectpicker({
		style: 'btn-inverse btn-large'
	});

	$('.nav li').on('click', function(){
		$('.nav li').removeClass('active');
		$(this).addClass('active');
	});

});