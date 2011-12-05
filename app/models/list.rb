class List < ActiveRecord::Base
  belongs_to :project
  has_many   :todos,  :dependent => :destroy

 def sync!(data)
    if  self.name != data.name
      self.name = data.name 
      save 
    end 
  end 

  def self.create_from_basecamp(data,project)
    create! do |l|
      l.project = project
      l.basecamp_id = data.id 
      l.name = data.name 
    end 
  end 
end
