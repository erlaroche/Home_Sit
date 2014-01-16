// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$('#sitterbutton').on('click', function () {
  window.location = '/sitters/sign_up'
});

$('#findsitterbutton').on('click', function () {
  window.location = '/appointments/new'
});

$('#findsitterbuttonagain').on('click', function () {
  window.location = '/sitters/index'
});


$('.bgParallax').each(function(){
    var $obj = $(this);
 
    $(window).scroll(function() {
        var yPos = -($(window).scrollTop() / $obj.data('speed'));
 
        var bgpos = '50% '+ yPos + 'px';
 
        $obj.css('background-position', bgpos );
  
    });
});

// stellar();


