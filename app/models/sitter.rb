class Sitter < ActiveRecord::Base
  require 'google/api_client'
  require 'json'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :lockable and 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owners, :through => :appointments
  has_many :appointments, :through => :owners

  mount_uploader :attachment, AvatarUploader 

  def self.from_omniauth(auth, code)
    where(auth.slice(:provider, :uid)).first_or_create do |sitter|
      sitter.provider = auth.provider
      sitter.uid = auth.uid
      sitter.name = auth.info.name
      sitter.email = auth.info.email
      sitter.auth_code = code
      sitter.refresh_token = auth.credentials.refresh_token
    end
  end

  def self.new_with_session(params, session)
    if session["devise.sitter_attributes"]
      new(session["devise.sitter_attributes"], without_protection: true) do |sitter|
        sitter.attributes = params
        sitter.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
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
    
    result = client.execute({
      api_method: calendar.freebusy.query,
      body: JSON.dump({
          timeMin: "#{time_start}",
          timeMax: "#{time_end}",
          items: [{id: "#{self.email}"}]
      }),
      headers: {'Content-Type' => 'application/json'}
      }) 
    # Stop with pry to check results in comman line
    # Giving us a 400 error
    # Run rails server, then in rails console, then typel "stew = Sitter.last", then type "stew.calendar_query", then type "result"
    return result.data.calendars["stewartimel@gmail.com"].to_hash.keys.first
  end

end
