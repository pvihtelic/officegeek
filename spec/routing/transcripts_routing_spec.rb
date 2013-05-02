require "spec_helper"

describe TranscriptsController do
  describe "routing" do

    it "routes to #index" do
      get("/transcripts").should route_to("transcripts#index")
    end

    it "routes to #new" do
      get("/transcripts/new").should route_to("transcripts#new")
    end

    it "routes to #show" do
      get("/transcripts/1").should route_to("transcripts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transcripts/1/edit").should route_to("transcripts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transcripts").should route_to("transcripts#create")
    end

    it "routes to #update" do
      put("/transcripts/1").should route_to("transcripts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transcripts/1").should route_to("transcripts#destroy", :id => "1")
    end

  end
end
