function textChanged(areas){
	var searchKey = document.getElementById("areaSearchKey").value.toLowerCase();
	for (var i = 0; i < areas.length; i++) {
		var element = areas[i];
		if (element.toLowerCase().indexOf(searchKey) !=-1)
			document.getElementById(element).style.display="block";
		else
			document.getElementById(element).style.display="none";
	}
}