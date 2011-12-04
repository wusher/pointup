require 'spec_helper'

describe User do
  describe "new user" do 
    it "first user is an admin" do
      User.first?.should be_true
      user = User.create!
      user.admin?.should be_true 
    end 
    it "non-first users are not admin" do 
      User.create!
      second_user = User.create!
      second_user.admin?.should be_false
    end 
  end 
  describe "admin?" do 
    it "does not update the admin property" do 
      subject.save 
      subject.admin = false 
      params = { :admin => true }
      subject.update_attributes params  
      subject.admin?.should be_false
    end 
  end 
end
