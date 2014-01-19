class Sitter < ActiveRecord::Base
  require 'google/api_client'
  require 'json'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :lockable and 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :owners, :through => :appointments
  has_many :appointments, :through => :owners

  # mount_uploader :picture, AvatarUploader 

  def self.from_omniauth(auth, code)
    where(auth.slice(:provider, :uid)).first_or_create do |sitter|
      sitter.provider = auth.provider
      sitter.uid = auth.uid
      sitter.name = auth.info.name
      sitter.email = auth.info.email
      sitter.auth_code = code
      sitter.picture  = auth.extra.raw_info.picture
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
    binding.pry
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

end
