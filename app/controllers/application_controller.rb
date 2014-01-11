class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :email
    devise_parameter_sanitizer.for(:sign_up) << :phone_number
    devise_parameter_sanitizer.for(:sign_up) << :attachment
    devise_parameter_sanitizer.for(:sign_up) << :zip_code
    devise_parameter_sanitizer.for(:sign_up) << :password
    devise_parameter_sanitizer.for(:sign_up) << :password_confirmation
  end

end
