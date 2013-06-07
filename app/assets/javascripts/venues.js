$('form').submit(function() {
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