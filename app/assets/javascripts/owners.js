// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/




$('#sitterbutton').on('click', function () {
  window.location = '/sitters/auth/google_oauth2'
});


//////////////mouseover?????????????????


$("#findsitterbutton").click(function() {
    doBounce($(this), 3, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }  
    $('#findsitterbutton').on('click', function () {
      window.location = '/appointments/new'
    });      
}



$('#findsitterbuttonagain').on('click', function () {
  window.location = '/sitters/index'
});

$('#findsitterbuttonagain2').on('click', function () {
  window.location = '/appointments'
});

////////////////////
// Parralax stuff: //
////////////////////






