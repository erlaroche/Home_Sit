class AppointmentNotify < ActionMailer::Base
  default from: "stewartimel@gmail.com"

  def self.new_appointment(users)
    @greeting = "Hi, Check out the newest appointment!"
    @all_emails = ""
    users.each do|email| 
      @all_emails += "#{email}" + ", " .chop.chop!
    end

    mail(to:  @all_emails, subject: 'WAAZZZUUPPP from HomeSit')


  end
end
