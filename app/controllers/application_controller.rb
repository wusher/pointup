class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

private
  
  def authenticate_admin!
    return redirect_to signin_path unless current_user 
    return redirect_to root_path unless current_user.admin?
  end 

  def authenticate_user!
    return redirect_to signin_path unless current_user 
    return redirect_to waiting_path unless current_user.authorized? || current_user.admin?

    if current_user.admin? 
      return redirect_to settings_path unless Settings.set?
    end 
    return redirect_to edit_user_path(current_user) unless current_user.credentials?
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
