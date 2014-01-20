class Appointment < ActiveRecord::Base

  belongs_to :owner
  belongs_to :sitter

  def time_start_convert
    if self.time_start.slice(-2, 2) == "PM"
      if self.time_start.slice(0,2) == "12"
        new_time = "12" 
      else
        new_time = self.time_start.partition(":")[0].to_i + 12 
      end
      "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    else
      new_time = self.time_start.partition(":")[0]
      new_time = "00" if new_time == "12"
      new_time = "0" + "#{new_time}" if new_time.length == 1
      "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    end
  end

  def time_end_convert
    if self.time_end.slice(-2, 2) == "PM"
      if self.time_end.slice(0,2) == "12"
        new_time = "12" 
      else
        new_time = self.time_end.partition(":")[0].to_i + 12 
      end
      "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    else
      new_time = self.time_end.partition(":")[0]
      new_time = "00" if new_time == "12"
      new_time = "0" + "#{new_time}" if new_time.length == 1
      "#{self.date}" + "T" + "#{new_time}" + ":00:00" + "Z"
    end
  end

end
