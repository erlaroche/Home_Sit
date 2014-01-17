class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    # Get Authorization code from Google
    code = request.original_url[params[:code]]
    # Get authorization hash from Google
    auth_hash = request.env["omniauth.auth"]
    
    # Call from_omniauth method from Sitter model
    sitter = Sitter.from_omniauth(auth_hash, code)
    
    if sitter.persisted?
      sign_in_and_redirect sitter, notice: "Signed in!"
    else
      session["devise.sitter_attributes"] = sitter.attributes
      redirect_to new_sitter_registration_url
    end
  end

  alias_method :google_oauth2, :all
end
