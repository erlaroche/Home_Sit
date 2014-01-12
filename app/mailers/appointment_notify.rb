class AppointmentNotify < ActionMailer::Base
  default from: "stewartimel@gmail.com"

  def new_appointment
    # @user = user
    @greeting = "Hi"

    mail( to: "@user.email", subject: 'WAAZZZUUPPP from HomeSit')
  end
end
