class User < ActiveRecord::Base
  attr_protected :admin
  before_create :set_admin

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
