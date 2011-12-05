class BasecampController < ApplicationController
  before_filter :authenticate_session! 

  #get /basecamp/sync
  def sync
  end

  #post /basecamp/sync 
  def update
    current_user.synced = true 
    current_user.save 
    sync_with_basecamp(current_user)
    respond_to do |format|
      format.html { redirect_to root_path, :notice => 'Successfully synced' }
      format.json { head :ok }
    end 
  #rescue  Exception 
  # binding.pry
  # redirect_to root_path, :flash => { :alert => "Error occurred while syncing" }
  end 

private 

  #todo this looks like crap. REFACTOR!!!
  def sync_with_basecamp(user)
    service = Simplecamp::Service.new Settings.url, current_user
    user.basecamp_id = service.get_user_id
    user.save

    #process projects 
    projects = service.get_projects
    projects.each do |remote_project|
      project = Project.find_by_basecamp_id(remote_project.id) 
      if project 
        project.sync!(remote_project)
      else 
        project = Project.create_from_basecamp remote_project
      end 

      # process lists 
      lists = service.get_lists project.basecamp_id
      lists.each do |remote_list|
        list = List.find_by_basecamp_id(remote_list.id) 
        if list 
          list.sync!(remote_list)
        else 
          list = List.create_from_basecamp remote_list, project
        end 

        load_todos list, user, service
      end 
    end 
  end 

  def load_todos(list, user, service) 
    todos = service.get_todos list.basecamp_id, user.basecamp_id
    todos.each do |remote_todo|
      todo = Todo.find_by_basecamp_id(remote_todo.id) 
      if todo 
        todo.sync!(remote_todo)
      else 
        todo = Todo.create_from_basecamp remote_todo, list
      end
    end 
  end 

end
