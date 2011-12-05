require 'spec_helper'




describe RemoteSync do 
  let(:user) { User.create! }
  subject do 
    RemoteSync.new user, "example.com" 
  end 

  context "using the simple stub " do 
    let(:service) { SimplecampStub.new }
    before :each do 
      Simplecamp::Service.stub(:new).and_return(service) 
    end 

    it 'sync is successful' do 
      subject.sync
      User.find(user.id).basecamp_id.should == 42
      Project.count.should == 2
      List.count.should == 4
      Todo.count.should == 8
    end 
    it "remove_empty_collections doesnt remove anything" do 
      subject.sync 
      subject.clean
      Project.count.should == 2
      List.count.should == 4
      Todo.count.should == 8
    end 
  end 
  context "using the orphan stub" do 
    let(:service) { SimplecampOrphanStub.new }
    before :each do 
      Simplecamp::Service.stub(:new).and_return(service) 
    end 
    it 'sync is successful' do 
      subject.sync
      User.find(user.id).basecamp_id.should == 42
      Project.count.should == 2
      List.count.should == 4
      Todo.count.should == 4
    end 
    it "remove_empty_collections removes half of the lists " do 
      subject.sync 
      subject.clean
      Project.count.should == 2
      List.count.should == 2
      Todo.count.should == 4
    end 

  end 

  context "using the barren stub" do 
    let(:service) { SimplecampBarrenStub.new }
    before :each do 
      Simplecamp::Service.stub(:new).and_return(service) 
    end 
    it 'sync is successful' do 
      subject.sync
      User.find(user.id).basecamp_id.should == 42
      Project.count.should == 2
      List.count.should == 4
      Todo.count.should == 0
    end 
    it "remove_empty_collections removes half of the lists " do 
      subject.sync 
      subject.clean
      Project.count.should == 0
      List.count.should == 0
      Todo.count.should == 0
    end 
  end 
  context "using the listless stub" do 
    let(:service) { SimplecampListlessStub.new } 
    before :each do 
      Simplecamp::Service.stub(:new).and_return(service) 
    end 
    it 'sync is successful' do 
      subject.sync
      User.find(user.id).basecamp_id.should == 42
      Project.count.should == 2
      List.count.should == 0
      Todo.count.should == 0
    end 
  end 
end 

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

class SimplecampOrphanStub
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
      return [] if list_id % 2 == 0 
      todos = [] 
      todos << Factory(:b_todo)
      todos << Factory(:b_todo)
      todos 
    end 
end 
class SimplecampBarrenStub
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
      []
    end 
end 

class SimplecampListlessStub
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
      []
    end 
    def get_todos(list_id, user_id)
      []
    end 
end 

