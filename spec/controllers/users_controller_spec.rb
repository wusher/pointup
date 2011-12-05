require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UsersController do

  before :each do 
    subject.stub(:authenticate_admin!).and_return(true)
  end 
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.create! valid_attributes
      get :index
      assigns(:users).should eq([user])
    end
  end

  describe "PUT authorize" do 
    it "authorizes the user" do 
      user = User.create! valid_attributes
      put :authorize, :id => user.id 
      User.find(user.id).authorized?.should be_true
    end 
  end 

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, :id => user.id
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, :id => user.id
      response.should redirect_to(users_url)
    end
  end

end
