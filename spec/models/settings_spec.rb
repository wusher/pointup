require 'spec_helper'

describe Settings do
  describe "set?" do 
    it "reutrns true if url is set"
      Settings.set?.should be_true 
    end 
  end 
end
