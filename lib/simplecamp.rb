
module Simplecamp
  class Service
    def initialize(url, user)
      @url = url
      if !user.basecamp_token.blank?
        @login    = user.basecamp_token 
        @password = 'X'
      else 
        @login    = user.basecamp_login
        @password = user.basecamp_password
      end 
    end 
    def get_user_id
      Basecamp::Person.me.tap { |x| binding.pry }.user_id
    end 
    def get_projects()
      establish_connection
      Basecamp::Project.find(:all)
    end 
    def get_lists(project_id)
      establish_connection
      Basecamp::TodoList.find(:all, :params => { :project_id => project_id })
    end 
    def get_todos(list_id, user_id)
      establish_connection
      Basecamp::TodoItem.find(:all, :params => { :todo_list_id => list_id,
                                                 :assigned_to => user_id } )
    end 

private 
    def establish_connection
      Basecamp.establish_connection! @url, @login, @password, true 
    end 
  end 
end 

