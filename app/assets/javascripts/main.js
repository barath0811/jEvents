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
