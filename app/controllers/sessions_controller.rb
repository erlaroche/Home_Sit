class SessionsController < ApplicationController

  def login
    id = params[:id]
    session[:sitter_id] = id
    if session[:return_to]
      redirect_to session.delete(:return_to)
      return true
    else
      redirect_to home_path
    end
  end

  def all
    # Get Authorization code from Google
    code = request.original_url[params[:code]]
    # Get authorization hash from Google
    auth_hash = request.env["omniauth.auth"]
    
    # Call from_omniauth method from Sitter model
    sitter = Sitter.from_omniauth(auth_hash, code)

    if sitter.registered?
      redirect_to new_session_path(sitter.id)
      return true
    end
    if sitter.persisted?
      redirect_to new_sitter_path(sitter.id), notice: "Signed in!"
    else
      redirect_to home_path
    end
  end

  def destroy
    session[:sitter_id] = nil
    redirect_to home_path, :notice => "Signed out!"
  end



  alias_method :google_oauth2, :all
end
