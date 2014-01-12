require 'test_helper'

class AppointmentNotifyTest < ActionMailer::TestCase
  test "new_appointment" do
    mail = AppointmentNotify.new_appointment
    assert_equal "New appointment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
