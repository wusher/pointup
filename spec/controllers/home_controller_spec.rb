require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    context "user logged in " do 
      let(:user) { stub(:user) }
      it "returns http success" do
        subject.stub(:current_user).and_return(user)
        get 'index'
        response.should be_success
      end
    end 
    context "no user logged in" do 
      it "redirects to login " do
        get 'index'
        response.should be_redirect
      end
    end 
  end

end
