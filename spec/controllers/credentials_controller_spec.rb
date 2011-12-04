require 'spec_helper'


describe CredentialsController do
  let!(:user) { User.new }

  
  def token_attributes
    { basecamp_token: '1234asdf1234asdf', 
      basecamp_login: '', 
      basecamp_password: '' }
  end
  def userinfo_attributes
    { basecamp_token: '', 
      basecamp_login: 'bcamp', 
      basecamp_password: 'p@ssw0rd' }
  end

  describe "GET edit" do
    it "assigns the current user to :user" do
      subject.stub(:current_user).and_return(user)
      get :edit
      assigns(:user).should eq(user)
    end
    it "redirects to the signin path if there is no user " do 
      get :edit
      response.should redirect_to(signin_path)
    end 
  end

  describe "PUT update" do
    before :each do 
      subject.stub(:current_user).and_return(user)
    end 
    it "updates the token" do
      put :update, :credentials => token_attributes
      user.basecamp_token.should    == token_attributes[:basecamp_token]
      user.basecamp_login.should    be_nil
      user.basecamp_password.should be_nil
    end

    it "updates the login info" do
      put :update, :credentials => userinfo_attributes
      user.basecamp_token.should    be_nil
      user.basecamp_login.should    == userinfo_attributes[:basecamp_login]
      user.basecamp_password.should == userinfo_attributes[:basecamp_password]
    end


  end

end
