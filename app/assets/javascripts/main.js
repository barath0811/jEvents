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

//TODO: use JOLLY.venues.textChanged = function(){...} format
function textChanged(areas){
	var searchKey = document.getElementById("areaSearchKey").value.toLowerCase();
	for (var i = 0; i < areas.length; i++) {
		var element = areas[i].toString();
		if (element.toLowerCase().indexOf(searchKey) !=-1)
			document.getElementById(element).style.display="block";
		else
			document.getElementById(element).style.display="none";
	}
}

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