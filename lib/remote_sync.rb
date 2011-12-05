
class RemoteSync 
  def initialize(user,url)
    @user = user
    @url = url 
  end 

  def clean 
    
    @user.projects.each do |project|
      project.lists.each do |list|
        list.destroy if list.todos.count == 0 
      end 
      project.destroy if project.lists.count == 0
    end 

  end 

  def sync 
    @service = Simplecamp::Service.new @url, @user
    @user.basecamp_id = @service.get_user_id
    @user.save

    #load  projects 
    projects = @service.get_projects
    projects.each do |remote_project|
      #process project 
      project = process_project(remote_project)
      # load lists 
      load_lists(project)
    end 
  end 

private 
  def process_project(remote_project)
    project = @user.projects.find_by_basecamp_id(remote_project.id) 
    if project 
      project.sync!(remote_project)
    else 
      project = Project.create_from_basecamp remote_project, @user
    end 
    project
  end 

  def load_lists(project)
    lists = @service.get_lists project.basecamp_id
    lists.each do |remote_list|
      #process list 
      list = process_list remote_list, project
      load_todos list
    end 
  end 

  def process_list(remote_list,project)
    list = project.lists.find_by_basecamp_id(remote_list.id) 
    if list 
      list.sync!(remote_list)
    else 
      list = List.create_from_basecamp remote_list, project
    end 
    list
  end 

  def load_todos(list) 
    todos = @service.get_todos list.basecamp_id, @user.basecamp_id
    todos.each do |remote_todo|
      process_todo remote_todo, list
    end 
  end 


  def process_todo(data, parent)
    todo = parent.todos.find_by_basecamp_id(data.id) 
    if todo 
      todo.sync!(data)
    else 
      todo = Todo.create_from_basecamp data, parent
    end
  end 
end 
