require 'spec_helper'

describe Settings do
  describe "set?" do 
    it "reutrns true if url is set" do 
      Settings.create basecamp_url: 'http://example.com'
      Settings.set?.should be_true 
    end 
    it 'returns false if the user is not set' do 
      Settings.create 
      Settings.set?.should be_false 
    end 
    it 'returns false if there are not settings' do 
      Settings.set?.should be_false 
    end 
  end 
end
