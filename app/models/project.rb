class Project < ActiveRecord::Base
  belongs_to :user

  has_many :lists 

   def sync!(data)
    if  self.name != data.name
      self.name = data.name 
      save 
    end 
  end 

  def self.create_from_basecamp(data)
    create! do |p|
      p.basecamp_id = data.id 
      p.name = data.name 
    end 
  end 
end
