class Sitter < ActiveRecord::Base
  require 'google/api_client'
  require 'json'

  has_many :owners, :through => :appointments
  has_many :appointments, :through => :owners

  def self.from_omniauth(auth, refresh_token, code)
    where(auth.slice(:google_id)).first_or_create do |sitter|
      sitter.google_id = auth["id"]
      sitter.name = auth["name"]
      sitter.email = auth["email"]
      sitter.picture  = auth["picture"]
      sitter.refresh_token = refresh_token
      sitter.auth_code = code

    end
  end

  def calendar_query(time_start, time_end)
    client = Service.new
    calendar = client.discovered_api('calendar', 'v3')
    client.authorization.client_id = ENV["GOOGLE_CLIENT_ID"]
    client.authorization.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    client.authorization.redirect_uri = 'http://localhost:3000/sitters/auth/google_oauth2/callback'
    client.authorization.refresh_token = self.refresh_token
    client.authorization.fetch_access_token!
    # id parameter capable of quering more than one calendar.  Possible refactor
    result = client.execute({
      api_method: calendar.freebusy.query,
      body: JSON.dump({
          timeMin: "#{time_start}",
          timeMax: "#{time_end}",
          items: [{id: "#{self.email}"}]
      }),
      headers: {'Content-Type' => 'application/json'}
      }) 
    # Might always return busy!
    return result.data.calendars["#{self.email}"].to_hash["busy"]
  end

  def self.any_available(time_start, time_end)
    @available = {}
    @sitters = Sitter.all
    @sitters.each do |sitter|
      status_array = sitter.calendar_query(time_start, time_end)
      if status_array.empty?
        @available[sitter.name] = {}
        @available[sitter.name]["picture"] = sitter.picture
        @available[sitter.name]["email"] = sitter.email
      end
    end
    return @available
  end

  def self.authenticate(current_sitter)
    Sitter.all.each do |sitter|
      if current_sitter.google_id = sitter.google_id
        return true
      end
    end
    return false
  end

end
