require "spec_helper"

describe SnippetTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/snippet_types").should route_to("snippet_types#index")
    end

    it "routes to #new" do
      get("/snippet_types/new").should route_to("snippet_types#new")
    end

    it "routes to #show" do
      get("/snippet_types/1").should route_to("snippet_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/snippet_types/1/edit").should route_to("snippet_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/snippet_types").should route_to("snippet_types#create")
    end

    it "routes to #update" do
      put("/snippet_types/1").should route_to("snippet_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/snippet_types/1").should route_to("snippet_types#destroy", :id => "1")
    end

  end
end
