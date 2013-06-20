$(document).ready(function(){
	$('.disabledLinkForNew').click(function(e){
		return false;
	});

	$('.ajax_form').submit(function() {
		alert('submitting...');
	    var valuesToSubmit = $(this).serialize();
	    var fileToSubmit = $(":base_image", this).serialize();

	    $.ajax({
	        url: $(this).attr('action'),
	        type: "POST",
	        data: valuesToSubmit,
	        file: fileToSubmit,
	        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
	    }).success(function(json){
	    	alert('saved successfully');
	        showMessage('Saved successfully...', 'success');
	    }).error(function(json){

	    });
	    return false; // prevents normal behaviour
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

function imageupload_click(file_field){
	$('#'+file_field).click();
}

function prev_click(){
	var page = $('#page_number:hidden').attr('value');
	searchFired(parseInt(page) -1);
}

function next_click(){
	var page = $('#page_number:hidden').attr('value');
	searchFired(parseInt(page) +1);
}

function uploadFile(){
    var fileToSubmit = $("#file_upload_1").serialize();

    $.ajax({
        url: "/venues/save_image",
        type: "POST",
        data: "",
        file: fileToSubmit,
        dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
        showMessage('Saved successfully...', 'success');
        debugger;
    }).error(function(XMLHttpRequest, textStatus, errorThrown){
    		alert(textStatus + errorThrown);
    });
    return false;
}

function searchFired(page_num){
	var areas = createSearchParams('area', 1);
	var bud = createSearchParams('bud', 1);
	var am = createSearchParams('am', 1);
	var amn = createSearchParams('am', 2);
	var cap = createSearchParams('cap', 1);
	var mo = createSearchParams('meal', 1);
	var et = $("#eventType option:selected").val();
	var page = page_num ? page_num : 1;


	$('#results').html('');

	$.ajax({
		url: "/venues/search",
		type: "POST",
		data: {eventType:et, areas:areas, budget:bud, amenities_val:am,amenities_name:amn, capacities:cap, meal:mo, po:true, page:page },
		success: function(data) {
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert(textStatus + errorThrown);
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
