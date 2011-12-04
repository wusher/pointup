class BasecampController < ApplicationController
  before_filter :authenticate_session! 

  #get /basecamp/sync
  def sync
  end

  #post /basecamp/sync 
  def update
    current_user.synced = true 
    current_user.save 
    respond_to do |format|
      format.html { redirect_to root_path, :notice => 'Successfully synced' }
      format.json { head :ok }
    end 
  rescue  Exception 
    redirect_to root_path, :flash => { :alert => "Error occurred while syncing" }
  end 

end
