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
    mail(to: @all_emails, subject: 'Check out this new Sit4U opportunity!')
  end

  def owner_notification(appointment)
    @sitter = Sitter.all.find(appointment.sitter_id)
    @owner = Owner.all.find(appointment.owner_id)
    @id = @owner.id
    @appointment_id = appointment.id
    @greeting = "#{@sitter.name} can sit for you!  Please follow this link to finish registration and finalize your appointment"
    mail(to: [@owner.email, "stewartimel@gmail.com"], subject: 'A Sitter was found for you!')
  end

  def owner_finalize(appointment)
    @sitter = Sitter.all.find(appointment.sitter_id)
    @owner = Owner.all.find(appointment.owner_id)
    @owner_greeting = "Congratulations #{@owner.name}, the appointment for #{appointment.address} in #{appointment.city} is finalized. #{@sitter.name} will be at your house between #{appointment.time_start} and #{appointment.time_end}. #{@sitter.name}'s phone number is #{@sitter.phone_number}.  Please contact him or her with any further instructions."
    mail(to: @owner.email, subject: 'Your Sit4U appointment has been finalized')
  end

  def sitter_finalize(appointment)
    @sitter = Sitter.all.find(appointment.sitter_id)
    @owner = Owner.all.find(appointment.owner_id)
    @sitter_greeting = "Congratulations #{@sitter.name}, the appointment for #{appointment.address} in #{appointment.city} is finalized. You are schedualed to be at #{@owner.name}'s house between #{appointment.time_start} and #{appointment.time_end}.  #{@owner.name}'s phone number is #{@owner.phone_number}. Please contact him or her with any questions."
    mail(to: @sitter.email, subject: 'Your Sit4U appointment has been finalized')
  end
end
