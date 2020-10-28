class ApplicationController < ActionController::Base

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_token]) # if user_signed_in?
  end
  
end
