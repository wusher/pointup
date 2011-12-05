class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

private
  
  def authenticate_session!
    return redirect_to signin_path unless current_user 
  end 

  def authenticate_admin!
    return redirect_to signin_path unless current_user 
    return redirect_to root_path unless current_user.admin?
  end 

  def authenticate_user!
    return redirect_to signin_path unless current_user 

    if current_user.admin? 
      return redirect_to settings_path unless Settings.set?
    end 

    return redirect_to waiting_path     unless current_user.authorized? or current_user.admin?
    return redirect_to credentials_path unless current_user.credentials?
    return redirect_to basecamp_sync_path        unless current_user.synced? 
  end 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
