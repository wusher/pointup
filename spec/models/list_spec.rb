require 'spec_helper'

describe List do
  describe "create_from_basecamp " do 

    it "should set the basecamp id and the name " do 
      project = Project.create!
      data = stub(:data)
      data.stub(:id).and_return(42)
      data.stub(:name).and_return('life')

      l = List.create_from_basecamp(data,project)
      l.name.should == 'life'
      l.basecamp_id.should == 42
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
