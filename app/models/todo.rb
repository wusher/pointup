class Todo < ActiveRecord::Base
  belongs_to :list

  def sync!(data)
    self.name = data.content unless self.name == data.content
    self.completed = data.completed unless self.completed = data.completed
    save if changed? 
  end 

  def self.create_from_basecamp(data,list)
    create! do |t|
      t.list = list
      t.basecamp_id = data.id 
      t.name = data.content 
      t.completed = data.completed 
      t.points = 0 
    end 
  end 
end
