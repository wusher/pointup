require "spec_helper"

describe SettingsController do
  describe "routing" do

    it "routes to #index" do
      get("/settings").should route_to("settings#edit")
    end

    it "routes to #update" do
      put("/settings").should route_to("settings#update")
    end

  end
end
