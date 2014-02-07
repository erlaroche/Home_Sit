$(document).on("ajax:success", function(e, data) {
  console.log("Ajax Response data:", data);
});

$('#appointment_time_end').on('change', function() {
  var time_start = $('#appointment_time_start').val();
  var time_end = $('#appointment_time_end').val();
  var date = $('#appointment_date').val();
  $.ajax({
    url: "/appointments/get_pictures",
    type: 'post',
    data: {time_start: time_start, time_end: time_end, date: date}
  });
});
var zipCodeValid = function(zip) {
  return zip.length == 5 && parseInt(zip).toString().length == 5
}
console.log("appointment.js")
$('#appointment_zip_code').on('change', function() {
    var zip_code = $('#appointment_zip_code').val();
    console.log(zip_code);
    if (zipCodeValid(zip_code) == false) {
      // $('#zip_code_errors').text("Check your zip code");
      $('#appointment_zip_code').css("border", "2px solid red");
    }
    else {
        // $('#zip_code_errors').text("");
        $('#appointment_zip_code').css("border", "2px solid #ACABAD");
      }
});


$('.time_field').on('change', function() {
  var startTime = $('#appointment_time_start').val();
  var startIndex = $('#appointment_time_end option[value=\"' + startTime + '\"]').index();
  var endTime = $('#appointment_time_end').val();
  var endIndex = $('#appointment_time_end option[value=\"' + endTime + '\"]').index();
  if (endIndex >= startIndex) {
    // $('#time_errors').text("");
    $('#appointment_time_end').css("border", "2px solid #ACABAD");
  } else {
    // $('#time_errors').text("End time earlier than start time");
    $('#appointment_time_end').css("border", "2px solid red");
  }
});