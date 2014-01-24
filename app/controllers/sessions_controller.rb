class SessionsController < ApplicationController

  def login
    id = params[:id]
    session[:sitter_id] = id
    redirect_to home_path
  end

  def destroy
    session[:sitter_id] = nil
    redirect_to home_path
  end

end
