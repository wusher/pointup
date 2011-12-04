require "spec_helper"

describe ListsController do
  describe "routing" do

    it "routes to #index" do
      get("/projects/1/lists").should route_to("lists#index", :project_id => "1")
    end

    it "routes to #show" do
      get("/projects/1/lists/2").should route_to("lists#show", :project_id => "1", :id => "2")
    end

  end
end
