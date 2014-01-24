Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :google_omniauth2
end

Warden::Strategies.add(:google_omniauth2) do
  def valid?
    params['email']
  end
  
  def authenticate!
    sitter = Sitter.find_by_email(params['email'])
    if user
      success! user
    else
      fail "Invalid email or password"
    end
  end
end