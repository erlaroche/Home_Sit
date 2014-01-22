// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree ../../../vendor/assets/javascripts
//= require appointments
//= require omniauth_callbacks
//= require owners
//= require services
//= require sitters
//= require sticky-footer

$(function(){ $(document).foundation(); });

$('#confirmbutton').on('click', function() {
  ;

});

// buttons bounce on hover and redirect on click
//first button
$("#sitterbutton").hover(function(){
  doBounce($(this), 1, '10px', 300);
});

function doBounce(element, times, distance, speed){
  for(i = 0; i < times; i++) {
      element.animate({marginTop: '-='+distance},speed)
          .animate({marginTop: '+='+distance},speed);
  } 
}

$('#sitterbutton').on('click', function () {
  window.location = '/sitters/auth/google_oauth2'
});

// second button
$("#findsitterbutton").hover(function() {
    doBounce($(this), 1, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }        
}

$('#findsitterbutton').on('click', function () {
  window.location = '/appointments/new'
});

// third button
$("#findsitterbuttonagain2").hover(function() {
    doBounce($(this), 1, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }       
}

$('#findsitterbuttonagain2').on('click', function () {
  window.location = '/appointments'
});


// fourth button
$("#findsitterbuttonagain").hover(function() {
    doBounce($(this), 1, '10px', 300);   
});


function doBounce(element, times, distance, speed) {
    for(i = 0; i < times; i++) {
        element.animate({marginTop: '-='+distance},speed)
            .animate({marginTop: '+='+distance},speed);
    }      
}

$('#findsitterbuttonagain').on('click', function () {
  window.location = '/sitters/index'
});

// $('#findsitterbuttonagain').on('click', function () {
//   $(this).toggle("explode");
// });



