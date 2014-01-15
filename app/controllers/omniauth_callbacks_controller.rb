class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    code = params[:code]
    binding.pry
    sitter = Sitter.from_omniauth(request.env["omniauth.auth"])
    if sitter.persisted?
      sign_in_and_redirect sitter, notice: "Signed in!"
    else
      session["devise.sitter_attributes"] = sitter.attributes
      redirect_to new_sitter_registration_url
    end
  end

  alias_method :google_oauth2, :all
end
