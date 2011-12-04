class HomeController < ApplicationController
  before_filter :authenticate_user! 

  def index
  end

private 
  def authenticate_user!
    redirect_to signin_path unless current_user 
  end 

end
