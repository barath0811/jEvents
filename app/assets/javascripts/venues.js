$(document).ready(function(){
	
});

function createSearchParams(entity){
	var val = '';
	var ulid = 'ul#' + entity + ' li';
	var chkid = '#chk_' + entity + '_';
	$(ulid).each(function(i){
		var id = chkid + $(this).attr('id');
		if($(id)[0] && $(id)[0].checked){
			if(val == '')
				val = val + $(this).attr('id');
			else
				val = val + ','+ $(this).attr('id');
		}
	});
	return val;

}

function searchFired(){
	var areas = createSearchParams('area');
	var bud = createSearchParams('bud');
	var am = createSearchParams('am');
	var cap = createSearchParams('cap');
	var mo = createSearchParams('meal');

	$('#results_div').html('');

	$.ajax({
		url: "/venues/search",
		type: "POST",
		data: {areas:areas, budget:bud, amenities:am, capacities:cap, meal:mo, po:true },
		success: function(data) {
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert("Status: " + textStatus); alert("Error: " + errorThrown); 
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
    $.ajax({
        url: $(this).attr('action'), //sumbits it to the given url of the form
        type: "POST",
        data: valuesToSubmit,
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
        showMessage('Saved successfully...', 'success');
    }).error(function(json){

    });
    return false; // prevents normal behaviour
});
