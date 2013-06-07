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

	$.ajax({
		url: "/venues/search",
		type: "POST",
		data: {areas:areas, budget:bud, amenities:am, capacities:cap, meal:mo },
			success: function(resp){ }
		});
}