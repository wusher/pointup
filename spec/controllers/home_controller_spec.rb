require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do

    context "user is signed in" do 
      let!(:user) { stub(:user).as_null_object }
      before :each do 
        subject.stub(:current_user).and_return(user)
      end 

      context "admin" do 
        before :each do 
          user.stub(:admin?).and_return(true)
        end 

        it "returns http success for admin users" do 
          Settings.stub(:set?).and_return(true )
          get 'index'
          response.should be_success
        end 

        it "redirects the admin to the settings page until there are settings" do 
          Settings.stub(:set?).and_return(false )
          get 'index'
          response.should redirect_to(settings_path)
        end 

      end 
      context "user" do 
        before :each do 
          user.stub(:admin?).and_return(false)
        end 


        it "returns http success for authorized users" do
          user.stub(:credentials?).and_return(true)
          user.stub(:authorized?).and_return(true)
          user.stub(:synced?).and_return(true)
          get 'index'
          response.should be_success
        end

        it "redirect unauthorized users to waiting page" do
          user.stub(:authorized?).and_return(false)
          get 'index'
          response.should redirect_to(waiting_path)
        end 

        it "redirects users without credentials to edit page" do
          user.stub(:authorized?).and_return(true)
          user.stub(:credentials?).and_return(false)
          get 'index'
          response.should redirect_to(credentials_path)
        end

        it 'redirects users that have note synced with basecamp to sync path' do
          user.stub(:credentials?).and_return(true)
          user.stub(:authorized?).and_return(true)
          user.stub(:synced?).and_return(false)
          get 'index'
          response.should redirect_to(basecamp_sync_path)

        end 
      end 

    end 

    context "user is not signed in " do 
      it "redirects non-signed in users to signin page " do
        get 'index'
        response.should redirect_to(signin_path)
      end
    end 
  end

end
