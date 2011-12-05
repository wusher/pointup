class BasecampController < ApplicationController
  before_filter :authenticate_session! 

  #get /basecamp/sync
  def sync
  end

  #post /basecamp/sync 
  def update
    current_user.synced = true 
    current_user.save 
    sync_with_basecamp(current_user, Settings.url)
    respond_to do |format|
      format.html { redirect_to root_path, :notice => 'Successfully synced' }
      format.json { head :ok }
    end 
  rescue Exception
    respond_to do |format|
      format.html { redirect_to root_path, :alert => 'Error occurred while syncing' }
      format.json { head :error }
    end 
  end 

private 

  #todo this looks like crap. REFACTOR!!!
  def sync_with_basecamp(user, url)
    utility = RemoteSync.new user,url 
    utility.sync
    utility.remote_empty_collections
  end 

end
