class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :user_valid?, :user_admin? , :user_admin? 

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def user_valid?
    return false unless current_user
    current_user.authorized? 
  end 

  def user_admin?
    return false unless current_user
    current_user.admin? 
  end 

end
