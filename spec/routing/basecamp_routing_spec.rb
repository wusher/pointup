require "spec_helper"

describe SettingsController do
  describe "routing" do

    it "routes to #sync" do
      get("/basecamp/sync").should route_to("basecamp#sync")
    end

    it "routes to #update" do
      post("/basecamp/sync").should route_to("basecamp#update")
    end

  end
end
