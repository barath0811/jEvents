$(document).ready(function(){
	$('.disabledLinkForNew').click(function(e){
		return false;
	});
});



function createSearchParams(entity, value){
	var val = '';
	var ulid = 'ul#' + entity + ' li';
	var chkid = '#chk_' + entity + '_';
	$(ulid).each(function(i){
		var id = chkid + $(this).attr('id');
		if($(id)[0] && $(id)[0].checked){
			if(val == '')
				val = val + (value == 1 ? $(id).attr('value') : $(this).attr('id'));
			else
				val = val + ','+ (value == 1 ? $(id).attr('value') : $(this).attr('id'));
		}
	});
	return val;
}


function searchFired(){
	var areas = createSearchParams('area', 1);
	var bud = createSearchParams('bud', 1);
	var am = createSearchParams('am', 1);
	var amn = createSearchParams('am', 2);
	var cap = createSearchParams('cap', 1);
	var mo = createSearchParams('meal', 1);

	$('#results_div').html('');

	$.ajax({
		url: "/venues/search",
		type: "POST",
		data: {areas:areas, budget:bud, amenities_val:am,amenities_name:amn, capacities:cap, meal:mo, po:true },
		success: function(data) {
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			
		}   
	});

}

//TODO: use JOLLY.venues.textChanged = function(){...} format
function textChanged(areas){
	var searchKey = document.getElementById("areaSearchKey").value.toLowerCase();

	$('ul#area li').each(function(i){
		var id = '#chk_area_' + $(this).attr('id');
		var element = $(id).attr('value').toLowerCase();
		
		if (element.indexOf(searchKey) !=-1)
			$(this).show();
		else
			$(this).hide();
	});

}

$('.ajax_form').submit(function() {
    var valuesToSubmit = $(this).serialize();
    var fileToSubmit = $(":base_image", this).serialize();
    $.ajax({
        url: $(this).attr('action'),
        type: "POST",
        data: valuesToSubmit,
        file: fileToSubmit,
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
        showMessage('Saved successfully...', 'success');
        debugger;
    }).error(function(json){

    });
    return false; // prevents normal behaviour
});
