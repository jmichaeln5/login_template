class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user # makes the current_user availible for the view.

  # helper_method :current_order

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #if it is equal to nil then they need to login ----- if true continue on that session
  end

end
