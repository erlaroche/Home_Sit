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

  def owner_notification(appointment)
    @sitter = Sitter.all.find(appointment.sitter_id)
    @owner = Owner.all.find(appointment.owner_id)
    @id = @owner.id
    @appointment = appointment
    @greeting = "#{@sitter.name} can sit for you!  Please follow this link to finish registration and finalize your appointment"
    mail(to: [@owner.email, "stewartimel@gmail.com"], subject: 'A Sitter was found for you!')
  end
end
