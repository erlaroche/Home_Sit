class AppointmentNotify < ActionMailer::Base
  default from: "stewartimel@gmail.com"

  def new_appointment(users)
    @greeting = "Hi, Check out the newest appointment!"
    @all_emails = ""
    users.each do|email| 
      @all_emails += "#{email}" + ", "
    end
    @all_emails = @all_emails.chop.chop!
    mail(to: "mzseidman@gmail.com", subject: 'WAAZZZUUPPP from HomeSit')

  end
end
