// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/





// buttons bounce on hover and redirect on click
//first button
$("#sitterbutton").hover(function(){
  doBounce($(this), 2, '10px', 300);
});

function doBounce(element, times, distance, speed){
  for(i = 0; i < times; i++) {
      element.animate({marginTop: '-='+distance},speed)
          .animate({marginTop: '+='+distance},speed);
  } 
  // $('#sitterbutton').on('click', function () {
  //   window.location = '/sitters/auth/google_oauth2'
  // });
}

$('#sitterbutton').on('click', function () {
  window.location = '/sitters/auth/google_oauth2'
});

// second button
$("#findsitterbutton").hover(function() {
    doBounce($(this), 2, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }  
    // $('#findsitterbutton').on('click', function () {
    //   window.location = '/appointments/new'
    // });      
}

$('#findsitterbutton').on('click', function () {
  window.location = '/appointments/new'
});

// third button
$("#findsitterbuttonagain2").hover(function() {
    doBounce($(this), 2, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }  
  //   $('#findsitterbuttonagain2').on('click', function () {
  //     window.location = '/appointments'
  // });     
}

$('#findsitterbuttonagain2').on('click', function () {
  window.location = '/appointments'
});


// fourth button
$("#findsitterbuttonagain").hover(function() {
    doBounce($(this), 2, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }  
 // $('#findsitterbuttonagain').on('click', function () {
 //   window.location = '/sitters/index'
 // });    
}

$('#findsitterbuttonagain').on('click', function () {
  window.location = '/sitters/index'
});


//////////////mouseover?????????????????












////////////////////
// Parralax stuff: //
////////////////////






