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
    let(:remote_sync) { stub(:remote_sync).as_null_object}
    before :each do 
      Settings.stub(:url).and_return("http://example.com")
      RemoteSync.stub(:new).and_return(remote_sync)
    end 
    it "should sync successfully" do 
      post 'update' 
      User.find(user.id).synced?.should be_true
      flash[:notice].should =~ /Successfully synced/
      response.should redirect_to(root_path)
    end 

    it "rediects to root page on error" do 
      remote_sync.stub(:sync).and_raise(  Exception.new("any error will do"))
      post 'update' 
      User.find(user.id).synced?.should be_true
      flash[:alert].should =~ /Error occurred while syncing/
      response.should redirect_to(root_path)
    end 
  end 

end
