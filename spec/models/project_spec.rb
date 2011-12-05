require 'spec_helper'

describe Project do
  let(:user) { User.create }

  describe "create_from_basecamp " do 

    it "should set the basecamp id and the name " do 
      data = stub(:data)
      data.stub(:id).and_return(42)
      data.stub(:name).and_return('life')

      p = Project.create_from_basecamp(data, user)
      p.user.should == user
      p.name.should == 'life'
      p.basecamp_id.should == 42
    end 
  end 

  describe "sync" do 
    it "should update the name if it does not match" do 
      data = stub(:data)
      data.stub(:name).and_return('life')

      subject.name = "original"
      subject.save 

      subject.sync! data 

      subject.name.should == "life"
    end 
  end 
end
