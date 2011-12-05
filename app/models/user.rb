class User < ActiveRecord::Base
  attr_protected :admin
  before_create :set_admin
  has_many :projects 

  def credentials?
    !self.basecamp_token.blank? or (!self.basecamp_login.blank? and !self.basecamp_password.blank?)
  end 

  def self.first?
    count == 0 
  end 
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.nickname = auth["info"]["nickname"]
    end
  end
private 
  def set_admin
    self.admin = User.first?
    true 
  end 
end
