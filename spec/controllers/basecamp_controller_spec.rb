require 'spec_helper'

describe BasecampController do
  let(:user) { User.create! }
  before :each do 
    subject.stub(:authenticate_session!).and_return(true)
    subject.stub(:current_user).and_return(user)
  end 


  describe "GET 'sync'" do
    it "returns http success" do
      get 'sync'
      response.should be_success
    end
  end

  describe "Post 'sync'" do 
    it "should sync successfully" do 
      
      post 'update' 
      User.find(user.id).synced?.should be_true
      flash[:notice].should =~ /Successfully synced/
      response.should redirect_to(root_path)
    end 

    it "rediects to root page on error" do 
      
      post 'update' 
      User.find(user.id).synced?.should be_true
      binding.pry
      flash[:alert].should =~ /Error occurred while syncing/
      response.should redirect_to(root_path)
    end 
  end 

end
