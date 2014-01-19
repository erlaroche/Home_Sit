class AppointmentNotify < ActionMailer::Base
  default from: "stewartimel@gmail.com"

  def new_appointment(users)
    @greeting = "Hi, Check out the newest appointment!"
    @greeting2 ='Click here to confirm your interest!', 
    
    @all_emails = ""
    users.each do|email| 
      @all_emails += "#{email}" + ", "
    end
    @all_emails = @all_emails.chop.chop!
    mail(to: @all_emails, subject: 'WAAZZZUUPPP Bro from HomeSit')


  def owner_notification(owners)

    @helpneeded = []
    @owners = Owner.all





  end
end
