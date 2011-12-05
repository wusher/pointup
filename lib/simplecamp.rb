
module Simplecamp
  class Service
    def initialize(url, user)
      @url = url.gsub /https?:\/\//, ''
      if !user.basecamp_token.blank?
        @login    = user.basecamp_token 
        @password = 'X'
      else 
        @login    = user.basecamp_login
        @password = user.basecamp_password
      end 
    end 
    def get_user_id
      establish_connection
      Basecamp::Person.me.id
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
      todos = Basecamp::TodoItem.find(:all, :params => { :todo_list_id => list_id } ) 
                                                 #:responsible_party_id => user_id } )
      todos.reject! do |x| 
        !x.attributes.has_key?("responsible_party_id") or  x.responsible_party_id != user_id 
      end 
      todos 
    end 

private 
    def establish_connection
      Basecamp.establish_connection! @url, @login, @password, true
    end 
  end 
end 

