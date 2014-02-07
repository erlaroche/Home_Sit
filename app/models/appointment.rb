class Appointment < ActiveRecord::Base

  belongs_to :owner
  belongs_to :sitter

  validates_presence_of :date, :time_start, :time_end, :zip_code
  validate :times_valid?

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


  def times_valid?
    @times = ["12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM"] 
    if @times.index(@attributes["time_start"]) >= @times.index(@attributes["time_end"])
      errors.add(:base, 'Times must be in chronological order')
    end
  end


end
