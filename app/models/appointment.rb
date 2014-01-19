class Appointment < ActiveRecord::Base

  belongs_to :owner
  belongs_to :sitter

  def time_start_convert
    if self.time_start.slice(-2, 2) == "PM"
      new_time = self.time_start.partition(":")[0].to_i + 12 
      time = "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    else
      new_time = self.time_start.partition(":")[0]
      time = "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    end
  end

  def time_end_convert
    if self.time_end.slice(-2, 2) == "PM"
      new_time = self.time_end.partition(":")[0].to_i + 12 
      time = "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    else
      new_time = self.time_end.partition(":")[0]
      time = "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    end
  end

end
