class AppointmentNotify < ActionMailer::Base
  default from: "stewartimel@gmail.com"

  def new_appointment(users, appointment, time_start, time_end)
    @appointment = appointment
    @greeting = "Hi, Check out the newest appointment!"
    @greeting2 = "Click here to confirm your interest!"
    @greeting3 = "An appointment begins at #{time_start} and ends at #{time_end}"


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
