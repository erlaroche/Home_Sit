class AppointmentNotify < ActionMailer::Base
  default from: "stewartimel@gmail.com"

  def new_appointment(users, appointment)
    @appointment = appointment
    @greeting = "Hi, Check out the newest appointment!"
    @greeting2 = "Click here to confirm your interest!"
    @greeting3 = "An appointment begins at #{appointment.time_start} and ends at #{appointment.time_end}"
    @id = appointment.id
    @all_emails = []
    users.each do |email| 
      @all_emails << email
    end
    mail(to: @all_emails, subject: 'WAAZZZUUPPP Bro from HomeSit')
  end

  def owner_notification(owners)

    @helpneeded = []
    @owners = Owner.all



  end
end
