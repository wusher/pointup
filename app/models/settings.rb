class Settings < ActiveRecord::Base
  
  def self.url
    first.basecamp_url
  end 

  def self.set?
    count > 0 and !first.basecamp_url.blank?
  end 
end
