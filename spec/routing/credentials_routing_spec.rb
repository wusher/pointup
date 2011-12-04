require "spec_helper"

describe CredentialsController do
  describe "routing" do


    it "routes to #edit" do
      get("/credentials").should route_to("credentials#edit")
    end

    it "routes to #update" do
      put("/credentials").should route_to("credentials#update")
    end

  end
end
