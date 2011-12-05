require "spec_helper"

describe TodosController do
  describe "routing" do

    it "routes to #summary" do 
      get("/summary").should route_to("todos#summary")
    end 
    it "routes to #index" do
      get("/projects/1/lists/2/todos").should route_to("todos#index", :project_id => "1",
                                                                      :list_id => "2")
    end

    it "routes to #show" do
      get("/projects/1/lists/2/todos/3").should route_to("todos#show", :project_id => "1",
                                                                       :list_id => "2",
                                                                       :id => "3")
    end

    it "routes to #edit" do
      get("/projects/1/lists/2/todos/3/edit").should route_to("todos#edit", :project_id => "1",
                                                                            :list_id => "2",
                                                                            :id => "3")
    end

    it "routes to #update" do
      put("/projects/1/lists/2/todos/3").should route_to("todos#update", :project_id => "1",
                                                                          :list_id => "2",
                                                                          :id => "3")
    end

  end
end
