
var zipCodeValid = function(zip) {
  return zip.length == 5 && parseInt(zip).toString().length == 5
}

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