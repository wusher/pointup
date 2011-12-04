require 'spec_helper'


class SimplecampStub
    def get_user_id
      42 
    end 
    def get_projects()
      projects   = []
      projects << Factory(:b_project)
      projects << Factory(:b_project)
      projects 
    end 
    def get_lists(project_id)
      lists = []
      lists << Factory(:b_list)
      lists << Factory(:b_list)
      lists 
    end 
    def get_todos(list_id, user_id)
      todos = [] 
      todos << Factory(:b_todo)
      todos << Factory(:b_todo)
      todos 
    end 
end 

describe BasecampController do
  let(:user) { User.create! }
  let(:service) { SimplecampStub.new }
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
    before :each do 
      Simplecamp::Service.stub(:new).and_return(service)
      Settings.stub(:url).and_return("http://example.com")
    end 
    it "should sync successfully" do 
      post 'update' 
      User.find(user.id).synced?.should be_true
      Project.count.should == 2
      List.count.should == 4
      Todo.count.should == 8
      flash[:notice].should =~ /Successfully synced/
      response.should redirect_to(root_path)
    end 

    it "rediects to root page on error" do 
      service.stub(:get_user_id).and_raise(Exception.new("any exception"))
      post 'update' 
      User.find(user.id).synced?.should be_true
      flash[:alert].should =~ /Error occurred while syncing/
      response.should redirect_to(root_path)
    end 
  end 

end
