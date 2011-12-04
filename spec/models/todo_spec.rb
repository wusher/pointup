require 'spec_helper'

describe Todo do
  describe "create_from_basecamp " do 

    it "should set the basecamp id and the name " do 
      list = List.create!
      data = stub(:data)
      data.stub(:id).and_return(42)
      data.stub(:content).and_return('life')
      data.stub(:completed).and_return(true)

      t = Todo.create_from_basecamp(data,list)
      t.name.should == 'life'
      t.basecamp_id.should == 42
      t.completed?.should be_true 
      t.points.should == 0  


    end 
  end 

  describe "sync" do 
    it "should update the name if it does not match" do 
      data = stub(:data)
      data.stub(:content).and_return('life')
      data.stub(:completed).and_return(true)

      subject.name = "original"
      subject.completed = false 
      subject.save 

      subject.sync! data 

      subject.name.should == "life"
      subject.completed?.should be_true 
    end 
  end 

end
