class Service < ActiveRecord::Base

  def self.google_calendar_client
    client = Google::APIClient.new
    client.authorization.client_id = ENV["GOOGLE_CLIENT_ID"]
    client.authorization.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
    client.authorization.redirect_uri = 'http://localhost:3000/sitters/auth/google_oauth2/callback'

  end
end
