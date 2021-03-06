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

//= require_tree .

$(".link3").on('click', function () {
  window.location = '/'
});


$(".link1").on('click', function () {
  window.location = 'http://localhost:8080/auth/google_oauth2'
});


$('.link2').on('click', function () {
  window.location = '/appointments/new'
});


$('.link4').on('click', function () {
  window.location = '/appointments'
});


$('.link5').on('click', function () {
  window.location = '/sitters/index'
});

$('.flip').click(function(){
    $(this).find('.card').addClass('flipped').mouseleave(function(){
        $(this).removeClass('flipped');
    });
    return false;
});




