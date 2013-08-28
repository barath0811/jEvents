$(document).ready(function(){
	$('.disabledLinkForNew').click(function(e){
		return false;
	});

	$('#areas_header_div').click(function(){
		$('#areas_div').slideToggle('slow', function(){
		});
	});

	$('#capacity_header_div').click(function(){
		$('#capacity_div').slideToggle('slow', function(){
		});
	});

	$('#amenities_header_div').click(function(){
		$('#amenities_div').slideToggle('slow', function(){
		});
	});

	$('#venues_header_div').click(function(){
		$('#venues_div').slideToggle('slow', function(){
		});
	});

	$('#halltype_header_div').click(function(){
		$('#halltype_div').slideToggle('slow', function(){
		});
	});
	

	$('#star').raty({
		score: function() {
			return $('#rating:hidden').attr('value');
		},
		click: function(score, evt) {
			rate(score, evt);
		}
	});

	/*
	$('#reco_venue').on('click', function(evt){
		FB.api(
			'https://graph.facebook.com/me/jollyeventz_dev:recommend',
			'post',
			{
				venue:'http://48sn.localtunnel.com/venues/view?venue=1',
				title: 'Sample Venue 1',
				'fb:explicitly_shared': true,
				privacy: {'value': 'SELF'}
			},
			function(response){
				if (!response) {
					$('#reco_venue_result').html('Error occurred.');
				} else if (response.error) {
					$('#reco_venue_result').html('Error: ' + response.error.message);
				} else {
					$('#reco_venue_result').html('<a href=\"https://www.facebook.com/me/activity/' + response.id + '\">' +
					'Story created.  ID is ' + response.id + '</a>');
				}
			}
		);
	});
	*/
});

function rate(score, evt){
	var venue_id = $('#venue_id:hidden').attr('value');
	$.ajax({
		url: "/ratings/rate",
		type: "POST",
		data: {id:$(this).attr('id'), rating:score, venue_id:venue_id  },
		success: function(data) {
		},
		error: function(XMLHttpRequest, textStatus, errorThrown){
			alert(textStatus + errorThrown);
		}
	});
}

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

function prev_click(){
	var page = $('#page_number:hidden').attr('value');
	searchFired(parseInt(page) -1);
}

function next_click(){
	var page = $('#page_number:hidden').attr('value');
	searchFired(parseInt(page) +1);
}

function searchFired(page_num){
	var areas = createSearchParams('area', 1);
	var bud = createSearchParams('bud', 1);
	var am = createSearchParams('am', 1);
	var amn = createSearchParams('am', 2);
	var cap = createSearchParams('cap', 1);
	var mo = createSearchParams('meal', 1);
	var ht = createSearchParams('ht', 1);
	var ven = createSearchParams('venues', 1);
	var et = $("#eventType option:selected").val();
	var page = page_num ? page_num : 1;


	$('#results').html('');

	$.ajax({
		url: "/venues/search",
		type: "POST",
		data: {eventType:et, areas:areas, budget:bud, amenities_val:am,amenities_name:amn, capacities:cap, meal:mo, venues:ven, halltype:ht, po:true, page:page },
		success: function(data) {
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert(textStatus + errorThrown);
		}   
	});

}

//TODO: use JOLLY.venues.textChanged = function(){...} format
function textChanged(option){
	var element = option + "SearchKey";
	var searchKey = document.getElementById(element).value.toLowerCase();

	$('ul#'+option+' li').each(function(i){
		var id = '#span_'+option+'_' + $(this).attr('id');
		var element = $(id).text().toLowerCase();
		
		if (element.indexOf(searchKey) !=-1)
			$(this).show();
		else
			$(this).hide();
	});

}
