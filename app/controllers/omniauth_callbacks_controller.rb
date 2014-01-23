class OmniauthCallbacksController < ApplicationController
require "net/http"
require "uri"

  def all
    google_code = params[:code]

    uri = URI.parse("https://accounts.google.com/o/oauth2/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"client_id" => "527876756740-5ei7igtcd6t4s8drtqjsitfdjqh4k2gq.apps.googleusercontent.com", "client_secret" => "xCq6k51ID50LgvL4rc-kuccp", "code" => google_code, "grant_type" => "authorization_code", "redirect_uri" => "http://localhost:3000/sitters/auth/google_oauth2/callback"})

    # Tweak headers, removing this will default to application/x-www-form-urlencoded 
    request["Content-Type"] = "application/x-www-form-urlencoded; utf-8"

    response = http.request(request)
    binding.pry
    output = JSON.parse(response.body)
    refresh_token = output["refresh_token"]

    client = Service.new
    profile = client.discovered_api('oauth2', 'v2')
    client.authorization.client_id = ENV["GOOGLE_CLIENT_ID"]
    client.authorization.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
    client.authorization.scope = 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile'
    client.authorization.redirect_uri = 'http://localhost:3000/sitters/auth/google_oauth2/callback'
    client.authorization.refresh_token = refresh_token
    client.authorization.fetch_access_token!
    # id parameter capable of quering more than one calendar.  Possible refactor
    
    # Instead of execute, possible buildHTTPrequest, ect.
    result = client.execute({
      api_method: profile.userinfo.get
      }) 

    profile = JSON.parse(result.body)
    goog_id = profile["id"]

    sitter = Sitter.authenticate(goog_id)
    if sitter
        redirect_to new_session_path(sitter.id)
    else
        sitter = Sitter.from_omniauth(profile, refresh_token, google_code)
        redirect_to new_sitter_path(sitter.id)
    end
  end

  alias_method :google_oauth2, :all
end
