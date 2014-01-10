json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date, :time_start, :time_end, :address, :description
  json.url appointment_url(appointment, format: :json)
end
