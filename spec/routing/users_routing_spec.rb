require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/users").should route_to("users#index")
    end
  

    it 'routes to #authorize' do 
      put("/users/1/authorize").should route_to("users#authorize", :id => "1")
    end 

    it "routes to #destroy" do
      delete("/users/1").should route_to("users#destroy", :id => "1")
    end

  end
end
