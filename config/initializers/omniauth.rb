Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/calendar',
    redirect_uri:'http://localhost:3000/sitters/auth/google_oauth2/callback',
    client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}
  }
end