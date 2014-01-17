class Appointment < ActiveRecord::Base

  belongs_to :owner
  belongs_to :sitter

  def time_start_convert
    new_time = "#{self.date}" + "T" + "#{self.time_start}" + ":00" + "Z"
    return new_time
  end

  def time_end_convert
    new_time = "#{self.date}" + "T" + "#{self.time_end}" + ":00" + "Z"
    return new_time
  end

end
